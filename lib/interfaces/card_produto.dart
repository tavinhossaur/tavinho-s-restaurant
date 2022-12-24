import 'package:app_compras/models/produto.dart';
import 'package:app_compras/provider/provedor_dados.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/cardapio.dart';

class CardProduto extends StatefulWidget {
  const CardProduto({super.key, required this.produto});

  final Produto produto;

  @override
  State<CardProduto> createState() => _CardProdutoState();
}

class _CardProdutoState extends State<CardProduto> {
  @override
  Widget build(BuildContext context) {
    ProvedorDados dados = Provider.of<ProvedorDados>(context);

    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: mq.height * .008),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: EdgeInsets.only(
            left: mq.width * .04,
            right: mq.width * .01,
            top: mq.height * .01,
            bottom: mq.height * .01),

        // Imagem do produto
        leading: Image.asset(
          'assets/images/${widget.produto.imagem}',
          width: 80,
          height: 80,
        ),

        // Nome do produto
        title: Text(
          widget.produto.nome,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),

        // Descrição do produto
        subtitle: Text(widget.produto.desc),

        isThreeLine: true,

        trailing: widget.produto.adicionado
            ? IconButton(
                onPressed: () {
                  dados.count(false);
                  setState(() {
                    widget.produto.adicionado = false;
                  });
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        duration: const Duration(milliseconds: 800),
                        backgroundColor: Colors.indigo,
                        content: Text(
                            '${widget.produto.nome} removido do carrinho')));
                },
                icon: const Icon(Icons.check_circle),
                iconSize: 40,
                color: Colors.indigoAccent,
              )
            : ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo)),
                icon: const Icon(
                  Icons.add_shopping_cart_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  'R\$${widget.produto.valor}',
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                onPressed: () {
                  dados.count(true);
                  setState(() {
                    widget.produto.adicionado = true;
                  });
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        duration: const Duration(milliseconds: 800),
                        backgroundColor: Colors.indigo,
                        content: Text(
                            '${widget.produto.nome} adicionado ao carrinho')));
                },
              ),
      ),
    );
  }
}
