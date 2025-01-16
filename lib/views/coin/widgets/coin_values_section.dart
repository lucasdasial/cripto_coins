import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:flutter/material.dart';

class CoinValuesSection extends StatelessWidget {
  const CoinValuesSection({super.key, required this.coin});

  final CoinListItemModel coin;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Valor atual:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    coin.getPriceCurrency(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Volume negociado:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    coin.getTotalVolumeCurrency(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Variação em 24h:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Row(
                    children: [
                      coin.priceChangePercentage24h > 0
                          ? Icon(Icons.arrow_upward, color: Colors.green)
                          : Icon(Icons.arrow_downward, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        coin.getPriceChangePercentDay(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: coin.priceChangePercentage24h > 0
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Valor variado 24h:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    coin.getPriceChangeCurrencyDay(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
