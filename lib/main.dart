import 'package:app_compras/provider/provedor_dados.dart';
import 'package:app_compras/screens/pagina_inicial.dart';
import 'package:app_compras/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    Tema.setTema();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    Tema.setTema();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Tema.tema,
      builder: (BuildContext context, Brightness tema, _) =>
          ChangeNotifierProvider(
        create: ((context) => ProvedorDados()),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Tavinho's Restaurant",
            theme: ThemeData(
                primarySwatch: Colors.indigo,
                brightness: tema,
                useMaterial3: true),
            home: const PaginaInicial()),
      ),
    );
  }
}
