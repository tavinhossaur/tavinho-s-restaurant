import 'package:app_compras/screens/cardapio.dart';
import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: Scaffold(
            body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Seja bem-vindo ao Tavinho's Restaurant",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 35,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Icon(
                  Icons.restaurant_menu,
                  size: 150,
                  color: Colors.indigo,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add_shopping_cart_rounded),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Cardapio()));
                  },
                  label: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      'Fazer pedido',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
