import 'package:cripto_coins/views/coin_list/coin_list_view.dart';
import 'package:cripto_coins/views/favorite_list/favoreite_list_view.dart';
import 'package:cripto_coins/views/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (_, viewModel, __) => Scaffold(
          appBar: AppBar(
            title: Text(
                viewModel.currentIndex == 0 ? "Cripto moedas" : "Favoritos"),
            centerTitle: true,
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: viewModel.currentIndex,
            onDestinationSelected: viewModel.navigateTo,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmark_add),
                label: 'Favoritos',
              ),
            ],
          ),
          body: <Widget>[
            CoinListView(),
            FavoriteListView()
          ][viewModel.currentIndex],
        ),
      ),
    );
  }
}
