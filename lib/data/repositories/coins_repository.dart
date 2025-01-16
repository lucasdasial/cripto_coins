// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:dio/dio.dart';

class CoinsRepository {
  Dio client;

  CoinsRepository({
    required this.client,
  });

  Future<List<CoinListItemModel>> list() async {
    final response = await client.get("/coins/markets?vs_currency=brl");

    final List<CoinListItemModel> list = [];

    for (var item in response.data) {
      list.add(CoinListItemModel.fromMap(item));
    }
    return list;
  }

  Future<List> getCoinHistoryChart(String id) async {
    final response = await client
        .get("coins/$id/market_chart?vs_currency=brl&days=1&precision=2");

    return response.data["prices"];
  }
}
