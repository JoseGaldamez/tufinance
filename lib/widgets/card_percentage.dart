import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/providers/finance_provider.dart';

class BarPercentage extends StatelessWidget {
  const BarPercentage({super.key});

  double getFranction(double ingreso, double egreso) {
    if (ingreso == 0) {
      return 0;
    }

    double fraction = (egreso / ingreso);
    return fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          // Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Presupuesto gastado",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${(getFranction(context.watch<FinanceProvider>().totalActivos, context.watch<FinanceProvider>().totalPasivos) * 100).toStringAsFixed(0)} %",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Bar
          Container(
            width: double.infinity,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: FractionallySizedBox(
              widthFactor: getFranction(
                  context.watch<FinanceProvider>().totalActivos,
                  context.watch<FinanceProvider>().totalPasivos),
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  color: (getFranction(
                              context.watch<FinanceProvider>().totalActivos,
                              context.watch<FinanceProvider>().totalPasivos) >
                          0.8)
                      ? Colors.red
                      : Colors.green,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Presupuesto restante",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "${(((getFranction(context.watch<FinanceProvider>().totalActivos, context.watch<FinanceProvider>().totalPasivos) * 100) - 100) * (-1)).toStringAsFixed(0)} %",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          (getFranction(context.watch<FinanceProvider>().totalActivos,
                      context.watch<FinanceProvider>().totalPasivos) >
                  0.8)
              ? Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Advertencia",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Le recomendamos regular sus gastos ya que está muy cerca de superar su presupuesto para este mes.",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
