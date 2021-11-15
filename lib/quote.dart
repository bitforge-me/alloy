import 'package:decimal/decimal.dart';

import 'beryllium.dart';

class QuoteTotalPrice {
  final Decimal amountBaseAsset;
  final Decimal amountQuoteAsset;
  final String? errMsg;

  QuoteTotalPrice(this.amountBaseAsset, this.amountQuoteAsset, this.errMsg);
}

QuoteTotalPrice bidQuoteAmount(BeOrderbook orderbook, Decimal amount) {
  if (amount < orderbook.minOrder)
    return QuoteTotalPrice(Decimal.zero, Decimal.zero, 'amount too low');

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
    BeOrderbook orderbook, Decimal amountQuoteAsset) {
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
      if (totalBaseAsset < orderbook.minOrder)
        return QuoteTotalPrice(Decimal.zero, Decimal.zero, 'amount too low');
      return QuoteTotalPrice(totalBaseAsset, amountQuoteAsset, null);
    }
    n++;
  }
  return QuoteTotalPrice(Decimal.zero, Decimal.zero, 'not enough liquidity');
}

QuoteTotalPrice askQuoteAmount(BeOrderbook orderbook, Decimal amount) {
  if (amount < orderbook.minOrder)
    return QuoteTotalPrice(Decimal.zero, Decimal.zero, 'amount too low');

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
