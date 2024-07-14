import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tufinance/screens/add/card_categories_ingreso.dart';

class AddIngreso extends StatefulWidget {
  const AddIngreso({super.key});

  @override
  State<AddIngreso> createState() => _AddIngresoState();
}

class _AddIngresoState extends State<AddIngreso> {
  TextEditingController textEditingControllerValue = TextEditingController();
  String categorySelected = "";

  void setCategorySelected(String category) {
    setState(() {
      categorySelected = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Agrega ingreso"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text("Ingresa el monto del ingreso"),
              InputGasto(
                  onChangevalue: () {
                    setState(() {});
                  },
                  textEditingControllerValue: textEditingControllerValue),
              CardCategoriesIngreso(
                  categorySelected: categorySelected,
                  setCategorySelected: setCategorySelected),
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
                      onPressed: (categorySelected == "" ||
                              textEditingControllerValue.text == "")
                          ? null
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Ingreso agregado"),
                                ),
                              );

                              Navigator.of(context)
                                  .popUntil((route) => route.isFirst);
                            },
                      child: const Text("Guardar Ingreso")))
            ],
          ),
        ),
      ),
    );
  }
}

class InputGasto extends StatelessWidget {
  const InputGasto(
      {super.key,
      required this.textEditingControllerValue,
      required this.onChangevalue});

  final TextEditingController textEditingControllerValue;
  final Function onChangevalue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        onChanged: (value) {
          onChangevalue();
        },
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.number,
        controller: textEditingControllerValue,
        decoration: const InputDecoration(
            hintText: "0.00", border: OutlineInputBorder(), prefixText: "L."),
      ),
    );
  }
}
