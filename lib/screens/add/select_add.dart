import 'package:flutter/material.dart';

class SelectAdd extends StatefulWidget {
  const SelectAdd({super.key});

  @override
  State<SelectAdd> createState() => _SelectAddState();
}

class _SelectAddState extends State<SelectAdd> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("¿Qué quieres agregar?"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Text("Elige qué agregar"),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedValue = 1;
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width * 0.5) - 40,
                      height: 120,
                      decoration: BoxDecoration(
                        color: selectedValue == 1
                            ? Colors.green[100]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Ingresos",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: selectedValue == 1
                                      ? Colors.green
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_upward,
                              size: 12,
                              color: selectedValue == 1
                                  ? Colors.green
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedValue = 2;
                      });
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width * 0.5) - 40,
                      height: 120,
                      decoration: BoxDecoration(
                        color: selectedValue == 2
                            ? Colors.red[100]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Egresos",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: selectedValue == 2
                                      ? Colors.red
                                      : Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_downward,
                              size: 12,
                              color:
                                  selectedValue == 2 ? Colors.red : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: selectedValue == 0
                          ? null
                          : () {
                              if (selectedValue == 1) {
                                Navigator.pushNamed(context, "/addIngreso");
                              } else {
                                Navigator.pushNamed(context, "/addGasto");
                              }
                            },
                      child: const Text("Siguiente")))
            ],
          ),
        ),
      ),
    );
  }
}
