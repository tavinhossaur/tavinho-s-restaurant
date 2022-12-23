import 'package:app_compras/provider/provedor_dados.dart';
import 'package:app_compras/screens/pagina_inicial.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ((context) => ProvedorDados()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Tavinho's Restaurant",
          theme: ThemeData(useMaterial3: true),
          home: const PaginaInicial()),
    );
  }
}
