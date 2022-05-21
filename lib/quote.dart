import 'package:alloy/assets.dart';
import 'package:decimal/decimal.dart';

import 'beryllium.dart';

class QuoteTotalPrice {
  final Decimal amountBaseAsset;
  final Decimal amountQuoteAsset;
  final String? errMsg;

  QuoteTotalPrice(this.amountBaseAsset, this.amountQuoteAsset, this.errMsg);
}

QuoteTotalPrice bidQuoteAmount(
    BeMarket market, BeOrderbook orderbook, Decimal amount) {
  if (amount < market.minTrade)
    return QuoteTotalPrice(amount, Decimal.zero,
        'minimum trade is ${assetFormatWithUnitToUser(market.baseAsset, market.minTrade)}');

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
      return QuoteTotalPrice(
          amount,
          totalPrice *
              (Decimal.one + orderbook.brokerFee / Decimal.fromInt(100)),
          null);
    }
    n++;
  }
  return QuoteTotalPrice(Decimal.zero, Decimal.zero, 'not enough liquidity');
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
        return QuoteTotalPrice(totalBaseAsset, amountQuoteAsset,
            'minimum trade is ${assetFormatWithUnitToUser(market.baseAsset, market.minTrade)}');
      return QuoteTotalPrice(totalBaseAsset, amountQuoteAsset, null);
    }
    n++;
  }
  return QuoteTotalPrice(Decimal.zero, Decimal.zero, 'not enough liquidity');
}

QuoteTotalPrice askQuoteAmount(
    BeMarket market, BeOrderbook orderbook, Decimal amount) {
  if (amount < market.minTrade)
    return QuoteTotalPrice(Decimal.zero, Decimal.zero,
        'minimum trade is ${assetFormatWithUnitToUser(market.baseAsset, market.minTrade)}');

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
      return QuoteTotalPrice(
          amount,
          totalPrice *
              (Decimal.one - orderbook.brokerFee / Decimal.fromInt(100)),
          null);
    }
    n++;
  }
  return QuoteTotalPrice(Decimal.zero, Decimal.zero, 'not enough liquidity');
}
