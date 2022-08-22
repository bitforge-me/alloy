import 'package:decimal/decimal.dart';

import 'beryllium.dart';
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

Decimal _fixedFee(BeMarket market, BeOrderbook orderbook) {
  for (var key in orderbook.brokerFeeFixed.keys())
    if (key == market.quoteAsset) return orderbook.brokerFeeFixed.get(key)!;
  return Decimal.zero;
}

QuoteTotalPrice bidQuoteAmount(
    BeMarket market, BeOrderbook orderbook, Decimal amount) {
  if (amount < market.minTrade)
    return QuoteTotalPrice.Error(
        'minimum trade is ${assetFormatWithUnitToUser(market.baseAsset, market.minTrade)}');

  var fixedFee = _fixedFee(market, orderbook);
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

QuoteTotalPrice bidEstimateAmountFromQuoteAssetAmount(
    BeMarket market, BeOrderbook orderbook, Decimal amountQuoteAsset) {
  var filled = Decimal.zero;
  var totalBaseAsset = Decimal.zero;
  var n = 0;
  while (amountQuoteAsset > filled) {
    if (n >= orderbook.asks.length) {
      break;
    }
    var rate = orderbook.asks[n].rate;
    var quantity = orderbook.asks[n].quantity;
    var quoteAssetToUse = quantity * rate;
    if (quoteAssetToUse > amountQuoteAsset - filled)
      quoteAssetToUse = amountQuoteAsset - filled;
    filled += quoteAssetToUse;
    totalBaseAsset += quoteAssetToUse / rate;
    if (filled == amountQuoteAsset) {
      if (totalBaseAsset < market.minTrade)
        return QuoteTotalPrice(
            totalBaseAsset,
            amountQuoteAsset,
            Decimal.zero,
            Decimal.zero,
            'minimum trade is ${assetFormatWithUnitToUser(market.baseAsset, market.minTrade)}');
      return QuoteTotalPrice(
          totalBaseAsset, amountQuoteAsset, Decimal.zero, Decimal.zero, null);
    }
    n++;
  }
  return QuoteTotalPrice.Error('not enough liquidity');
}

QuoteTotalPrice askQuoteAmount(
    BeMarket market, BeOrderbook orderbook, Decimal amount) {
  if (amount < market.minTrade)
    return QuoteTotalPrice.Error(
        'minimum trade is ${assetFormatWithUnitToUser(market.baseAsset, market.minTrade)}');

  var fixedFee = _fixedFee(market, orderbook);
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
