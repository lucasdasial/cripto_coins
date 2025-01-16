import 'package:cripto_coins/core/configs/injections.dart';
import 'package:cripto_coins/core/store/favorite_store.dart';
import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:cripto_coins/views/coin/coin_view.dart';
import 'package:flutter/material.dart';

class FavoriteListViewModel extends ChangeNotifier {
  final _favoriteStore = it.get<FavoriteStore>();

  late List<CoinListItemModel> coins;
  FavoriteListViewModel() {
    coins = _favoriteStore.favoriteCoins;
  }

  void openCoinDetails(
    BuildContext context,
    CoinListItemModel coin,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        requestFocus: false,
        builder: (context) => CoinView(coin: coin),
      ),
    );
  }
}
