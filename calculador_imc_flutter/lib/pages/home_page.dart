import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double peso = 0;
  double altura = 0;

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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Altura em Centímetros",
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
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Peso em Kg",
                            prefixIcon: const Icon(Icons.monitor_weight,
                                color: Colors.lightGreen),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.lightGreen),
                                borderRadius: BorderRadius.circular(10)),
                          ))),
                  const SizedBox(width: 50,),
                  Row(
                    children: [
                      const Expanded(
                        child: SizedBox(
                          width: 10,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.lightGreen)),
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
          ],
        ),
      ),
    );
  }
}
