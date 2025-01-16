import 'package:flutter/material.dart';

class AddFavoriteDialog extends StatelessWidget {
  const AddFavoriteDialog({super.key, required this.handleConfirm});
  final Function() handleConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Deseja adicionar nos favoritos?"),
      actions: [
        TextButton(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
