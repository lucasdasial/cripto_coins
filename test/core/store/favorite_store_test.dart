import 'package:cripto_coins/core/store/favorite_store.dart';
import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  late FavoriteStore favoriteStore;

  final coin = CoinListItemModel(
      id: '1',
      name: 'Bitcoin',
      currentPrice: 1,
      image: "",
      priceChange24h: 2,
      symbol: "btc",
      priceChangePercentage24h: 2.0,
      totalVolume: 10);

  setUp(() {
    favoriteStore = FavoriteStore();
  });

  group('FavoriteStore Tests', () {
    test('Add a favorite coin', () {
      favoriteStore.add(coin);

      expect(favoriteStore.favoriteCoins.length, 1);
      expect(favoriteStore.favoriteCoins.first.isFavorite, true);
      expect(favoriteStore.favoriteCoins.first.name, 'Bitcoin');
    });

    test('Avoid adding duplicate favorites', () {
      favoriteStore.add(coin);
      favoriteStore.add(coin);

      expect(favoriteStore.favoriteCoins.length, 1);
    });

    test('Remove a favorite coin', () {
      favoriteStore.add(coin);
      favoriteStore.remove('1');

      expect(favoriteStore.favoriteCoins.length, 0);
    });
  });
}
