import 'package:decimal/decimal.dart';

import 'beryllium.dart';
import 'utils.dart';
import 'assets.dart';

class QuoteTotalPrice {
  final Decimal amountBaseAsset;
  final Decimal amountQuoteAsset;
  final Decimal feeQuoteAsset;
  final Decimal fixedFeeQuoteAsset;
  final String? errMsg;

  QuoteTotalPrice(this.amountBaseAsset, this.amountQuoteAsset,
      this.feeQuoteAsset, this.fixedFeeQuoteAsset, this.errMsg);

  String toString({String baseAsset = '', String quoteAsset = ''}) {
    return '$amountBaseAsset $baseAsset for $amountQuoteAsset $quoteAsset, fee: $feeQuoteAsset $quoteAsset, fixedFee: $fixedFeeQuoteAsset $quoteAsset';
  }

  static QuoteTotalPrice Error(String msg) {
    return QuoteTotalPrice(
        Decimal.zero, Decimal.zero, Decimal.zero, Decimal.zero, msg);
  }
}

Decimal getFixedFee(BeMarket market, BeOrderbook orderbook) {
  if (orderbook.brokerFeeFixed.keys().contains(market.quoteAsset))
    return orderbook.brokerFeeFixed.get(market.quoteAsset)!;
  return Decimal.zero;
}

QuoteTotalPrice bidQuoteAmount(
    BeMarket market, BeOrderbook orderbook, Decimal amount) {
  if (amount < market.minTrade)
    return QuoteTotalPrice.Error('trade amount too small');

  var fixedFee = getFixedFee(market, orderbook);
  var filled = Decimal.zero;
  var totalPrice = Decimal.zero;
  var n = 0;
  while (amount > filled) {
    if (n >= orderbook.asks.length) {
      break;
    }
    var rate = orderbook.asks[n].rate;
    var quantity = orderbook.asks[n].quantity;
    var quantityToUse = quantity;
    if (quantityToUse > amount - filled) quantityToUse = amount - filled;
    filled += quantityToUse;
    totalPrice += quantityToUse * rate;
    if (filled == amount) {
      var totalPriceIncludingFee = totalPrice *
          (Decimal.one + orderbook.brokerFee / Decimal.fromInt(100));
      var fee = totalPriceIncludingFee - totalPrice;
      return QuoteTotalPrice(
          amount, totalPriceIncludingFee + fixedFee, fee, fixedFee, null);
    }
    n++;
  }
  return QuoteTotalPrice.Error('not enough liquidity');
}

QuoteTotalPrice askQuoteAmount(
    BeMarket market, BeOrderbook orderbook, Decimal amount) {
  if (amount < market.minTrade)
    return QuoteTotalPrice.Error('trade amount too small');

  var fixedFee = getFixedFee(market, orderbook);
  var filled = Decimal.zero;
  var totalPrice = Decimal.zero;
  var n = 0;
  while (amount > filled) {
    if (n >= orderbook.bids.length) {
      break;
    }
    var rate = orderbook.bids[n].rate;
    var quantity = orderbook.bids[n].quantity;
    var quantityToUse = quantity;
    if (quantityToUse > amount - filled) quantityToUse = amount - filled;
    filled += quantityToUse;
    totalPrice += quantityToUse * rate;
    if (filled == amount) {
      var totalPriceIncludingFee = totalPrice *
          (Decimal.one - orderbook.brokerFee / Decimal.fromInt(100));
      var fee = totalPrice - totalPriceIncludingFee;
      return QuoteTotalPrice(
          amount, totalPriceIncludingFee - fixedFee, fee, fixedFee, null);
    }
    n++;
  }
  return QuoteTotalPrice.Error('not enough liquidity');
}

QuoteTotalPrice estimateFromQuoteAssetAmount(BeMarketSide side, BeMarket market,
    BeOrderbook orderbook, Decimal amountQuoteAsset) {
  var filled = Decimal.zero;
  var totalBaseAsset = Decimal.zero;
  var n = 0;
  var orderbookSide = orderbook.asks;
  if (side == BeMarketSide.ask) orderbookSide = orderbook.bids;
  while (amountQuoteAsset > filled) {
    if (n >= orderbookSide.length) {
      break;
    }
    var rate = orderbookSide[n].rate;
    var quantity = orderbookSide[n].quantity;
    var quoteAssetToUse = quantity * rate;
    if (quoteAssetToUse > amountQuoteAsset - filled)
      quoteAssetToUse = amountQuoteAsset - filled;
    filled += quoteAssetToUse;
    totalBaseAsset += quoteAssetToUse / rate;
    if (filled == amountQuoteAsset) {
      if (totalBaseAsset < market.minTrade)
        return QuoteTotalPrice.Error('trade amount too small');
      return QuoteTotalPrice(
          totalBaseAsset, amountQuoteAsset, Decimal.zero, Decimal.zero, null);
    }
    n++;
  }
  return QuoteTotalPrice.Error('not enough liquidity');
}

QuoteTotalPrice? bruteForceQuote(
    Decimal value, BeMarket market, BeMarketSide side, BeOrderbook orderbook) {
  // first do a basic estimate amount of quote asset we will need using the order book
  var quoteAssetAmount = roundAt(value, assetDecimals(market.quoteAsset));
  var estimate =
      estimateFromQuoteAssetAmount(side, market, orderbook, quoteAssetAmount);
  if (estimate.errMsg != null) {
    // give user an idea of the estimate if we abort early
    //if (estimate.amountBaseAsset != Decimal.zero)
    //  targetController.text = assetFormat(toAsset,
    //      assetAmountToUser(toAsset, estimate.amountBaseAsset));
    return estimate;
  }
  // find the `smallestAmount` using the number of decimal places in the asset
  var smallestAmount =
      Decimal.one / power(Decimal.fromInt(10), assetDecimals(market.baseAsset));
  // set an initial `adjustAmount` that we will adjust the estimate each loop
  var adjustAmount = smallestAmount * Decimal.fromInt(100);
  // create our first estimate input
  var estInput =
      roundAt(estimate.amountBaseAsset, assetDecimals(market.baseAsset));
  // now create our first real estimate using the same method as the server
  //   ie. walk the order book using a set amount of the base asset and increase the quote asset required by the fee percentage
  if (side == BeMarketSide.ask)
    estimate = askQuoteAmount(market, orderbook, estInput);
  else
    estimate = bidQuoteAmount(market, orderbook, estInput);
  // now we loop as long as the server method estimate of the quote asset is not what we actually want to pay
  //   note: it should start as larger and we reduce it each loop iteration
  var n = 0;
  while (roundAt(estimate.amountQuoteAsset, assetDecimals(market.quoteAsset)) !=
      quoteAssetAmount) {
    // adjust estimate input
    if (side == BeMarketSide.ask)
      estInput += adjustAmount;
    else
      estInput -= adjustAmount;
    estInput = roundAt(estInput, assetDecimals(market.baseAsset));
    // generate new estimate
    if (side == BeMarketSide.ask)
      estimate = askQuoteAmount(market, orderbook, estInput);
    else
      estimate = bidQuoteAmount(market, orderbook, estInput);
    if (estimate.errMsg != null) {
      // give user an idea of the estimate if we abort early
      //if (estimate.amountBaseAsset != Decimal.zero)
      //  targetController.text = assetFormat(toAsset,
      //      assetAmountToUser(toAsset, estimate.amountBaseAsset));
      return estimate;
    }
    // if we overshoot we need to walk back the estimate input a bit
    if (side == BeMarketSide.ask &&
            estimate.amountQuoteAsset > quoteAssetAmount ||
        side == BeMarketSide.bid &&
            estimate.amountQuoteAsset < quoteAssetAmount) {
      n = 0;
      if (side == BeMarketSide.ask)
        estInput -= adjustAmount *
            Decimal.fromInt(
                2); // twice because we reduced it at the start of the loop
      else
        estInput += adjustAmount *
            Decimal.fromInt(
                2); // twice because we reduced it at the start of the loop
      // if the adjustAmount is greater then the smallestAmount then we need to make it a bit more fine grained
      if (adjustAmount > smallestAmount) {
        adjustAmount = adjustAmount / Decimal.fromInt(2);
        if (adjustAmount < smallestAmount) adjustAmount = smallestAmount;
      }
      continue;
    }
    // we will short cut the loop by periodically increasing the adjustment amount
    if (n > 10) {
      n = 0;
      adjustAmount = adjustAmount * Decimal.fromInt(10);
    } else
      n = n + 1;
  }
  return QuoteTotalPrice(
      estimate.amountBaseAsset,
      roundAt(estimate.amountQuoteAsset, assetDecimals(market.quoteAsset)),
      estimate.feeQuoteAsset,
      estimate.fixedFeeQuoteAsset,
      estimate.errMsg);
}
