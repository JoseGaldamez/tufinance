import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/models/move_model.dart';
import 'package:tufinance/providers/finance_provider.dart';
import 'package:tufinance/providers/login_provider.dart';
import 'package:tufinance/screens/add/card_categories_ingreso.dart';
import 'package:tufinance/services/moves_service.dart';

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
                          : () async {
                              final move = MoveModel(
                                  category: categorySelected,
                                  amount: textEditingControllerValue.text,
                                  type: "activo");

                              addMoveService(move,
                                      context.read<LoginProvider>().userEmail)
                                  .then((response) {
                                if (response) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Ingreso registrado"),
                                    ),
                                  );

                                  context
                                      .read<FinanceProvider>()
                                      .addActivo(move);

                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Algo salió mal, no se guardó el ingreso."),
                                    ),
                                  );
                                }
                              });
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
