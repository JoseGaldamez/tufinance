import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/models/move_model.dart';
import 'package:tufinance/providers/finance_provider.dart';
import 'package:tufinance/providers/login_provider.dart';
import 'package:tufinance/screens/add/card_categories_gastos.dart';
import 'package:tufinance/services/moves_service.dart';

class AddGasto extends StatefulWidget {
  const AddGasto({super.key});

  @override
  State<AddGasto> createState() => _AddGastoState();
}

class _AddGastoState extends State<AddGasto> {
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
        backgroundColor: Colors.red,
        title: const Text("Agrega un gasto"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text("Ingresa un nuevo gasto"),
              InputGasto(
                  onChangevalue: () {
                    setState(() {});
                  },
                  textEditingControllerValue: textEditingControllerValue),
              CardCategoriesGastos(
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
                                  type: "pasive");

                              addMoveService(move,
                                      context.read<LoginProvider>().userEmail)
                                  .then((response) {
                                if (response) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Gasto agregado"),
                                    ),
                                  );

                                  context
                                      .read<FinanceProvider>()
                                      .addPasivos(move);

                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "Algo salió mal, no se guardó el gasto."),
                                    ),
                                  );
                                }
                              });
                            },
                      child: const Text("Guardar Gasto")))
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
