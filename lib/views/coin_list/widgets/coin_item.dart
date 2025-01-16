import 'package:cripto_coins/data/models/coin_list_item_model.dart';
import 'package:cripto_coins/views/coin_list/widgets/add_favorite_dialog.dart';
import 'package:cripto_coins/views/coin_list/widgets/remove_favorite_dialog.dart';
import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({
    super.key,
    required this.data,
    required this.handleTap,
    required this.handleAdd,
    required this.handleRemove,
  });

  final CoinListItemModel data;
  final Function() handleTap;
  final Function() handleAdd;
  final Function() handleRemove;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: handleTap,
      leading: Container(
        padding: EdgeInsets.all(6),
        child: Hero(
          tag: "coin-${data.id}",
          child: Image.network(data.image),
        ),
      ),
      title: Text(data.name),
      subtitle: Text(
        data.getPriceCurrency(),
        style: TextStyle(fontSize: 15),
      ),
      trailing: IconButton(
        onPressed: () {
          showAdaptiveDialog(
            context: context,
            builder: (context) => !data.isFavorite
                ? AddFavoriteDialog(
                    handleConfirm: handleAdd,
                  )
                : RemoveFavoriteDialog(
                    handleConfirm: handleRemove,
                    itemName: data.name,
                  ),
          );
        },
        icon: Icon(
          data.isFavorite ? Icons.bookmark : Icons.bookmark_add_outlined,
        ),
      ),
    );
  }
}
