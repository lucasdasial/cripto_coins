import 'package:cripto_coins/core/configs/envs.dart';
import 'package:dio/dio.dart';

class CoinGeckoApi {
  late final Dio _client;

  final _coinGeckoApiConfig = BaseOptions(
    baseUrl: Envs.apiUrl,
    headers: {
      "Content-Type": "application/json",
      "x-cg-demo-api-key": Envs.apiKey,
    },
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 3),
  );

  CoinGeckoApi() {
    _client = Dio(_coinGeckoApiConfig);
  }

  Dio get client => _client;
}
