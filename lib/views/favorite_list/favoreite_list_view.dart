import 'package:cripto_coins/views/favorite_list/favorite_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteListView extends StatelessWidget {
  const FavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ChangeNotifierProvider(
        create: (_) => FavoriteListViewModel(),
        child: Consumer<FavoriteListViewModel>(
          builder: (c_, viewModel, __) => viewModel.coins.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Text(
                        "Você ainda não tem moedas favoritadas",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        "Adicione uma criptomoeda",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.withValues(alpha: 0.7)),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  separatorBuilder: (_, __) => Divider(
                    color: Colors.grey.withValues(alpha: 0.4),
                  ),
                  itemCount: viewModel.coins.length,
                  itemBuilder: (_, index) {
                    final item = viewModel.coins[index];
                    return ListTile(
                      onTap: () {
                        viewModel.openCoinDetails(context, item);
                      },
                      leading: Container(
                        padding: EdgeInsets.all(6),
                        child: Hero(
                          tag: "coin-${item.id}",
                          child: Image.network(item.image),
                        ),
                      ),
                      title: Text(item.name),
                      subtitle: Text(
                        item.getPriceCurrency(),
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
