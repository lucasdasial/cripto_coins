import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:cripto_coins/views/coin/coin_view_model.dart';
import 'package:cripto_coins/views/coin/widgets/coin_price_chart.dart';
import 'package:cripto_coins/views/coin/widgets/coin_values_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinView extends StatelessWidget {
  const CoinView({super.key, required this.coin});
  final CoinListItemModel coin;
  final sectionSpacing = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Hero(
                tag: "coin-${coin.id}",
                child: SizedBox(
                  width: 70,
                  child: Image.network(
                    coin.image,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                coin.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: sectionSpacing),
              CoinValuesSection(coin: coin),
              SizedBox(height: sectionSpacing),
              ChangeNotifierProvider(
                create: (_) => CoinViewModel(context, coin),
                child: Consumer<CoinViewModel>(
                  builder: (_, viewModel, __) => Column(
                    children: [
                      CoinPriceChart(
                        chartData: viewModel.chartData,
                      ),
                      SizedBox(height: sectionSpacing),
                      Visibility(
                        visible: viewModel.chartData.isNotEmpty,
                        child: Text(
                          "Toque no gráfico para mais informações",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
