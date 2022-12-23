import 'package:app_compras/interfaces/card_produto.dart';
import 'package:app_compras/provider/provedor_dados.dart';
import 'package:app_compras/screens/carrinho_compras.dart';
import 'package:app_compras/screens/pagina_inicial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/produto.dart';

// Para retornar as medidas (altura e largura do dispositivo)
late Size mq;

class Cardapio extends StatefulWidget {
  const Cardapio({super.key});

  @override
  State<Cardapio> createState() => _CardapioState();
}

class _CardapioState extends State<Cardapio> {
  // Lista de produtos
  final List<Produto> listaProdutos = [
    Produto(
        nome: 'Pizza Pepperoni',
        desc: 'Clássico de pepperoni ao queijo mussarela',
        valor: '19,99',
        imagem: 'pepperoni.png'),
    Produto(
        nome: 'Pizza havaiana',
        desc: 'Queijo, abacaxi e lombo canadense',
        valor: '24,99',
        imagem: ('havaiana.png')),
    Produto(
        nome: 'Pepperoni do Chef',
        desc: 'Pepperoni com bacon e pimentão',
        valor: '29,99',
        imagem: ('pepperoni_chef.png')),
    Produto(
        nome: 'Pizza Portuguesa',
        desc: 'Queijo, presunto, ovo cozido e azeitonas',
        valor: '19,99',
        imagem: ('portuguesa.png')),
    Produto(
        nome: 'Combo X-Burguer',
        desc: 'X-Burguer com fritas e uma Coca grande',
        valor: '24,99',
        imagem: ('combo.png')),
    Produto(
        nome: 'Refrigerante',
        desc: 'Escolha entre Coca-Cola, Sprite ou Fanta',
        valor: '4,99',
        imagem: ('refri.png')),
    Produto(
        nome: 'Frango frito',
        desc: 'Porção de frangos fritos com limão',
        valor: '39,99',
        imagem: ('frango.png')),
    Produto(
        nome: 'Frango e fritas',
        desc: 'Porção de frango frito e batatas fritas',
        valor: '64,99',
        imagem: ('frango_batatas.png')),
    Produto(
        nome: 'Porção de fritas',
        desc: 'Porção de batatas fritas com ketchup',
        valor: '29,99',
        imagem: ('batatas.png')),
  ];

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => ProvedorDados(),
      child: Consumer<ProvedorDados>(
          builder: (context, value, child) => Scaffold(
                // AppBar
                appBar: AppBar(
                    centerTitle: true,
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const PaginaInicial()));
                        },
                        icon: const Icon(Icons.home_rounded, size: 30)),
                    title: const Text(
                      'Cardápio',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    actions: <Widget>[
                      IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                            size: 30,
                          ),
                          tooltip: 'Abrir carrinho de compras',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => CarrinhoCompras(
                                          listaProdutos: listaProdutos
                                              .where(
                                                  (e) => e.adicionado == true)
                                              .toList(),
                                        ))).then((value) {
                              setState(() {
                                listaProdutos;
                              });
                            });
                          })
                    ]),
                // If tem produtos adicionos, mostra o FAB
                floatingActionButton: listaProdutos
                        .where((e) => e.adicionado == true)
                        .isNotEmpty
                    ? SizedBox(
                        width: mq.width * .5,
                        height: mq.height * .1,
                        child: Stack(children: [
                          Align(
                            alignment: Alignment.center,
                            child: FloatingActionButton.extended(
                              backgroundColor: Colors.indigo,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => CarrinhoCompras(
                                              listaProdutos: listaProdutos
                                                  .where((e) =>
                                                      e.adicionado == true)
                                                  .toList(),
                                            ))).then((value) {
                                  setState(() {
                                    listaProdutos;
                                  });
                                });
                              },
                              tooltip: 'Abrir carrinho de compras',
                              label: const Text('Abrir carrinho'),
                              icon: const Icon(Icons.shopping_cart),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: mq.width * .010,
                            child: listaProdutos
                                    .where((e) => e.adicionado == true)
                                    .isNotEmpty
                                ? MaterialButton(
                                    enableFeedback: false,
                                    elevation: 0,
                                    onPressed: () {},
                                    color: Colors.indigoAccent,
                                    minWidth: 0,
                                    padding: const EdgeInsets.all(12),
                                    shape: const CircleBorder(),
                                    child: Text(
                                      listaProdutos
                                          .where((e) => e.adicionado == true)
                                          .length
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  )
                                : const Text(''),
                          )
                        ]),
                      )
                    : null,
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.centerFloat,
                body: ListView.builder(
                  itemCount: listaProdutos.length,
                  itemBuilder: (ctx, i) {
                    return CardProduto(
                      produto: listaProdutos[i],
                    );
                  },
                ),
              )),
    );
  }
}
