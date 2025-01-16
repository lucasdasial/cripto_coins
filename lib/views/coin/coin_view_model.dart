// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cripto_coins/core/configs/injections.dart';
import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:cripto_coins/data/repositories/coins_repository.dart';
import 'package:flutter/material.dart';

class CoinViewModel extends ChangeNotifier {
  final _coinsRepository = it.get<CoinsRepository>();
  final CoinListItemModel coin;
  List chartData = [];

  late BuildContext context;
  CoinViewModel(this.context, this.coin) {
    fetchData();
  }

  void fetchData() async {
    try {
      chartData = await _coinsRepository.getCoinHistoryChart(coin.id);
      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Não foi possível carregar o gráfico",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.error,
        ));
      }
    }
  }
}
