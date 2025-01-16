import 'dart:convert';

import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FavoriteStore {
  final storage = FlutterSecureStorage();
  final List<CoinListItemModel> favoriteCoins = [];

  FavoriteStore() {
    syncFavoritesFromLocalStorage();
  }

  void add(CoinListItemModel coin) {
    coin.isFavorite = true;
    bool isAlreadyFavorite = favoriteCoins.any((c) => c.name == coin.name);

    if (!isAlreadyFavorite) {
      favoriteCoins.add(coin);
      handleSaveLocalStorage();
    }
  }

  void remove(String id) {
    favoriteCoins.removeWhere((coin) => coin.id == id);
    handleSaveLocalStorage();
  }

  void handleSaveLocalStorage() {
    final listString = [];
    for (CoinListItemModel coin in favoriteCoins) {
      listString.add(coin.toJson());
    }
    storage.write(key: "coins", value: listString.toString());
  }

  Future<void> syncFavoritesFromLocalStorage() async {
    final source = await storage.read(key: "coins");

    if (source != null) {
      final List json = jsonDecode(source);
      for (var element in json) {
        favoriteCoins.add(CoinListItemModel.fromMap(element));
      }
    }
  }
}
