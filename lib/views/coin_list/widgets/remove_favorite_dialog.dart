import 'package:flutter/material.dart';

class RemoveFavoriteDialog extends StatelessWidget {
  const RemoveFavoriteDialog(
      {super.key, required this.handleConfirm, required this.itemName});
  final Function() handleConfirm;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Deseja remover dos favoritos?"),
      content: Text("Você esta preste a remover $itemName da sua listagem"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.red),
          ),
        ),
        TextButton(
          onPressed: () {
            handleConfirm();
            Navigator.pop(context);
          },
          child: Text("Confirmar"),
        )
      ],
    );
  }
}
