// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cripto_coins/core/utils/currency.dart';

class CoinListItemModel {
  String id;
  String name;
  String symbol;
  double currentPrice;
  String image;
  int totalVolume;
  double priceChange24h;
  double priceChangePercentage24h;
  bool isFavorite = false;

  CoinListItemModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.currentPrice,
    required this.image,
    required this.totalVolume,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
  });

  String getPriceCurrency() {
    return Currency.toBRL(currentPrice);
  }

  String getTotalVolumeCurrency() {
    return Currency.toBRL(totalVolume.toDouble());
  }

  String getPriceChangeCurrencyDay() {
    return Currency.toBRL(priceChange24h);
  }

  String getPriceChangePercentDay() {
    return '${(priceChangePercentage24h).toStringAsFixed(2)}%';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'symbol': symbol,
      'current_price': currentPrice,
      'image': image,
      'total_volume': totalVolume,
      'price_change_24h': priceChange24h,
      'price_change_percentage_24h': priceChangePercentage24h,
      'is_favorite': isFavorite,
    };
  }

  factory CoinListItemModel.fromMap(Map<String, dynamic> map) {
    return CoinListItemModel(
      id: map['id'] as String,
      name: map['name'] as String,
      symbol: map['symbol'] as String,
      currentPrice: double.parse(map['current_price'].toString()),
      image: map['image'] as String,
      totalVolume: map['total_volume'] as int,
      priceChange24h: map['price_change_24h'] as double,
      priceChangePercentage24h: map['price_change_percentage_24h'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoinListItemModel.fromJson(String source) =>
      CoinListItemModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
