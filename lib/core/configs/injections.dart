import 'package:cripto_coins/core/store/favorite_store.dart';
import 'package:cripto_coins/data/datasource/coin_gecko_api.dart';
import 'package:cripto_coins/data/repositories/coins_repository.dart';
import 'package:get_it/get_it.dart';

GetIt it = GetIt.I;

class Injections {
  static final _coinGeckoApi = CoinGeckoApi();

  static setup() {
    it.registerLazySingleton(
        () => CoinsRepository(client: _coinGeckoApi.client));

    it.registerSingleton(FavoriteStore());
  }
}
