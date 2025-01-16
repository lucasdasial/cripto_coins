import 'package:flutter/material.dart';

errorDialog(BuildContext context) => showModalBottomSheet(
      enableDrag: false,
      showDragHandle: false,
      isDismissible: false,
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.error,
                size: 40,
                color: Colors.amberAccent,
              ),
              SizedBox(height: 24),
              Text(
                "Ops, algo inesperado!",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(height: 16),
              Text(
                "Não foi possível carregar as cripto moedas.",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                textAlign: TextAlign.center,
                "Infelizmente não podemos prosseguir com sua navegação no app :(",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
