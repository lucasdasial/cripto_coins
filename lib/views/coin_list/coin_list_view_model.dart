import 'package:cripto_coins/core/configs/injections.dart';
import 'package:cripto_coins/core/store/favorite_store.dart';
import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:cripto_coins/data/repositories/coins_repository.dart';
import 'package:cripto_coins/views/coin/coin_view.dart';
import 'package:cripto_coins/views/widgets/error_dialog.dart';
import 'package:flutter/material.dart';

class CoinListViewModel extends ChangeNotifier {
  final _coinsRepository = it.get<CoinsRepository>();
  final _favoriteStore = it.get<FavoriteStore>();

  List _coins = [];
  List coins = [];

  late Map coinsMap;
  late BuildContext context;

  int currentIndex = 1;
  bool isLoading = true;

  CoinListViewModel(this.context) {
    fetchList();
  }

  Future<void> fetchList() async {
    try {
      isLoading = true;
      notifyListeners();

      _coins = await _coinsRepository.list();
      coins = _coins;

      syncFavorites();
      notifyListeners();

      Future.delayed(Duration(seconds: 1), () {
        isLoading = false;
        notifyListeners();
      });
    } catch (_) {
      if (context.mounted) errorDialog(context);
    }
  }

  void syncFavorites() {
    final favoriteMap = {
      for (var favorite in _favoriteStore.favoriteCoins) favorite.id: favorite
    };

    for (CoinListItemModel coin in _coins) {
      coin.isFavorite = favoriteMap.containsKey(coin.id);
    }

    coinsMap = {for (var coin in coins) coin.id: coin};
  }

  void navigateTo(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onSearch(String term) {
    coins = _coins
        .where((item) => item.name.toString().toLowerCase().contains(term))
        .toList();

    if (term.isEmpty) coins = _coins;
    notifyListeners();
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

  void onAddFavorite(CoinListItemModel coin) {
    _favoriteStore.add(coin);
    notifyListeners();
  }

  void onRemoveFavorite(CoinListItemModel coin) {
    final current = coinsMap[coin.id];

    if (current != null) {
      current.isFavorite = false;
      _favoriteStore.remove(coin.id);
    }

    notifyListeners();
  }
}
