import 'package:calculador_imc_flutter/utils/class_imc.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  double peso = 0;
  double altura = 0;
  double resultado = 0;
  String strResultado = "";
  bool mostrarResultado = false;
  String classificao = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de IMC"),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Row(children: [
              SizedBox(
                width: 50,
              ),
              Expanded(
                child: Text(
                  "Coloque seu peso e sua altura nos campos abaixo para calcular seu IMC, a seguir, Pressione o botão Calcular!",
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
            ]),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: TextField(
                          controller: alturaController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder( borderSide: BorderSide(color: Colors.green)),
                            hintText: "Altura em Centímetros Ex: 180",
                            prefixIcon: const Icon(Icons.height,
                                color: Colors.lightGreen),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.lightGreen),
                                borderRadius: BorderRadius.circular(10)),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: TextField(
                          controller: pesoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Peso em Kg Ex: 60",
                            prefixIcon: const Icon(Icons.monitor_weight,
                                color: Colors.lightGreen),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: const OutlineInputBorder( borderSide: BorderSide(color: Colors.lightGreen,),)                          
                          ))),
                  const SizedBox(
                    width: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 10,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              pesoController.clear();
                              alturaController.clear();
                              peso = 0;
                              altura = 0;
                              mostrarResultado = false;
                            });
                            debugPrint("Resultado: $peso $altura");
                          },
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Color.fromARGB(255, 86, 122, 46)),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20)))),
                          ),
                          child: const Text(
                            "Limpar",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextButton(
                          onPressed: () {
                            if (pesoController.text.trim().isNotEmpty ||
                                alturaController.text.trim().isNotEmpty) {
                              setState(() {
                                double peso =
                                    double.tryParse(pesoController.text) ?? 0;
                                double alturaCm =
                                    double.tryParse(alturaController.text) ?? 0;
                                altura =
                                    alturaCm / 100; // converte cm para metros
                                resultado = peso / (altura * altura);
                                strResultado = resultado.toStringAsFixed(2);
                                classificao = classificarIMC(resultado);
                                mostrarResultado = true;
                              });
                            } else {}
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Dados Inválidos, tente novamente!")));
                          },
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.lightGreen),
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20)))),
                          ),
                          child: const Text(
                            "Calcular",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (mostrarResultado)
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 100, left: 30, right: 30),
                child: Text(
                  overflow: TextOverflow.visible,
                  "Seu IMC é: $strResultado, de acordo com a literatura, sua classificação é: $classificao",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
