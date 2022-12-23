import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../interfaces/card_produto.dart';
import '../models/produto.dart';
import '../provider/provedor_dados.dart';

class CarrinhoCompras extends StatefulWidget {
  const CarrinhoCompras({super.key, required this.listaProdutos});

  final List<Produto> listaProdutos;

  @override
  State<CarrinhoCompras> createState() => _CarrinhoComprasState();
}

class _CarrinhoComprasState extends State<CarrinhoCompras> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProvedorDados(),
      child: Consumer<ProvedorDados>(
        builder: (context, value, child) => Scaffold(
          // AppBar
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              'Seu carrinho',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          // If tem produtos adicionos, mostra o FAB
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.indigo,
            onPressed: () {
              for (var i = 0; i < widget.listaProdutos.length; i++) {
                widget.listaProdutos.any((e) => e.adicionado = false);
              }
              ScaffoldMessenger.of(context).showSnackBar(widget
                      .listaProdutos.isNotEmpty
                  ? const SnackBar(
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: Colors.indigo,
                      content: Text(
                          'Obrigado, seu pedido será entregue em sua mesa.'))
                  : const SnackBar(
                      duration: Duration(milliseconds: 2000),
                      backgroundColor: Colors.indigo,
                      content: Text('Não há itens no carrinho!')));
              widget.listaProdutos.clear();
              setState(() {});
            },
            label: const Text('Fazer pedido'),
            icon: const Icon(Icons.shopping_cart_checkout_rounded),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,

          body: ListView.builder(
            itemCount: widget.listaProdutos.length,
            itemBuilder: (ctx, i) {
              return CardProduto(
                produto: widget.listaProdutos[i],
                // onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}
