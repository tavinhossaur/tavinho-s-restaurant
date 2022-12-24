import 'package:app_compras/provider/provedor_dados.dart';
import 'package:app_compras/screens/cardapio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Para retornar as medidas (altura e largura do dispositivo)
late Size mq;

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => ProvedorDados(),
      child: Consumer<ProvedorDados>(
        builder: (context, value, child) => Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            icon: const Icon(Icons.menu_book_rounded),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Cardapio()));
            },
            label: const Text('Explorar cardápio'),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, left: 20),
                    child: Text(
                      'DESTAQUE DE HOJE',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(
                        horizontal: 20, vertical: mq.height * 0.01),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      splashColor: Colors.grey.withAlpha(100),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const Cardapio()));
                      },
                      child: SizedBox(
                        width: 220,
                        height: 220,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              'assets/images/pepperoni_chef.png',
                              height: 180,
                              width: 180,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Pepperoni do Chef',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Seus ultimos pedidos",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    height: 60,
                    thickness: 2,
                    indent: 5,
                    color: Colors.grey,
                  )),
                ]),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(
                      horizontal: 20, vertical: mq.height * .008),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                      contentPadding: EdgeInsets.only(
                          left: mq.width * .04,
                          right: mq.width * .01,
                          top: mq.height * .01,
                          bottom: mq.height * .01),

                      // Imagem do produto
                      leading: Image.asset(
                        'assets/images/refri.png',
                        width: 80,
                        height: 80,
                      ),

                      // Nome do produto
                      title: const Text(
                        'Refrigerante',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),

                      // Descrição do produto
                      subtitle: const Text(
                          'Escolha entre Coca-Cola, Sprite ou Fanta'),
                      isThreeLine: true,
                      trailing: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.done_all_rounded,
                            size: 40, color: Colors.indigoAccent),
                      )),
                ),
                Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(
                      horizontal: 20, vertical: mq.height * .008),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                      contentPadding: EdgeInsets.only(
                          left: mq.width * .04,
                          right: mq.width * .01,
                          top: mq.height * .01,
                          bottom: mq.height * .01),

                      // Imagem do produto
                      leading: Image.asset(
                        'assets/images/frango.png',
                        width: 80,
                        height: 80,
                      ),

                      // Nome do produto
                      title: const Text(
                        'Frango frito',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),

                      // Descrição do produto
                      subtitle:
                          const Text('Porção de frangos fritos com limão'),
                      isThreeLine: true,
                      trailing: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.done_all_rounded,
                            size: 40, color: Colors.indigoAccent),
                      )),
                ),
                Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(
                        horizontal: 20, vertical: mq.height * .008),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: ListTile(
                      contentPadding: EdgeInsets.only(
                          left: mq.width * .04,
                          right: mq.width * .01,
                          top: mq.height * .01,
                          bottom: mq.height * .01),

                      // Imagem do produto
                      leading: Image.asset(
                        'assets/images/pepperoni.png',
                        width: 80,
                        height: 80,
                      ),

                      // Nome do produto
                      title: const Text(
                        'Pizza de Pepperoni',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),

                      // Descrição do produto
                      subtitle: const Text('Pepperoni ao queijo mussarela'),
                      isThreeLine: true,
                      trailing: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.done_all_rounded,
                            size: 40, color: Colors.indigoAccent),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
