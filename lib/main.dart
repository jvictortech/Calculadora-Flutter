import 'package:flutter/material.dart';
import 'calculadora_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final CalculadoraLogic logic = CalculadoraLogic();

  void aoPressionar(String valor) {
    setState(() {
      logic.pressionar(valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculadora'),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20.0),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // VISOR
            Container(
              color: Colors.white,
              margin: const EdgeInsets.all(15.0),
              width: 400,
              height: 120,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(12),
              child: Text(
                logic.visor,
                style: const TextStyle(fontSize: 50.0),
              ),
            ),

           //Botões começa aqui
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          botao('C', Colors.lightBlue),
                          botao('DEL', Colors.lightBlue),
                          botao('%', Colors.lightBlue),
                          botao('/', Colors.lightBlue),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          botao('7', Colors.white),
                          botao('8', Colors.white),
                          botao('9', Colors.white),
                          botao('*', Colors.lightBlue),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          botao('4', Colors.white),
                          botao('5', Colors.white),
                          botao('6', Colors.white),
                          botao('+', Colors.lightBlue),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          botao('1', Colors.white),
                          botao('2', Colors.white),
                          botao('3', Colors.white),
                          botao('-', Colors.lightBlue),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          botao('0', Colors.white),
                          botao('.', Colors.white),
                          botao('=', Colors.lightBlue),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget botao(String texto, Color corTexto) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Material(
          color: Colors.black,
          child: InkWell(
            onTap: () => aoPressionar(texto),
            child: Center(
              child: Text(
                texto,
                style: TextStyle(
                  fontSize: 24.0,
                  color: corTexto,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
