import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:cripto_coins/views/coin_list/coin_list_view_model.dart';
import 'package:cripto_coins/views/coin_list/widgets/coin_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CoinListView extends StatelessWidget {
  const CoinListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CoinListViewModel(context),
      child: Consumer<CoinListViewModel>(
        builder: (_, viewModel, __) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: Skeletonizer(
                    enabled: viewModel.coins.isNotEmpty && viewModel.isLoading,
                    child: viewModel.coins.isEmpty
                        ? Text(
                            viewModel.isLoading
                                ? "Buscando criptos..."
                                : "Nenhuma criptomoeda encontrada",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        : ListView.separated(
                            separatorBuilder: (_, __) => Divider(
                              color: Colors.grey.withValues(alpha: 0.4),
                            ),
                            itemCount: viewModel.coins.length,
                            itemBuilder: (_, index) {
                              final CoinListItemModel coin =
                                  viewModel.coins[index];
                              return CoinItem(
                                data: coin,
                                handleTap: () =>
                                    viewModel.openCoinDetails(context, coin),
                                handleAdd: () => viewModel.onAddFavorite(coin),
                                handleRemove: () =>
                                    viewModel.onRemoveFavorite(coin),
                              );
                            },
                          ),
                  ),
                ),
                TextFormField(
                  onChanged: (value) => viewModel.onSearch(value),
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Pesquisar",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
