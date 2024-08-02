import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/providers/finance_provider.dart';

class CardCategories extends StatelessWidget {
  const CardCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Gastos por categoría",
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.blue,
                    ),
                  ),
                  title: const Text(
                    "Compras",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "\$${context.watch<FinanceProvider>().totalCompras.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.fastfood,
                      color: Colors.red,
                    ),
                  ),
                  title: const Text(
                    "Comida",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "\$${context.watch<FinanceProvider>().totalComida.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.local_gas_station,
                      color: Colors.green,
                    ),
                  ),
                  title: const Text(
                    "Gasolina",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "\$${context.watch<FinanceProvider>().totalCarro.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.home,
                      color: Colors.purple,
                    ),
                  ),
                  title: const Text(
                    "Casa",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "\$${context.watch<FinanceProvider>().totalCasa.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.yellow[50],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.pets,
                      color: Colors.yellow,
                    ),
                  ),
                  title: const Text(
                    "Mascota",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "\$${context.watch<FinanceProvider>().totalMascotas.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.travel_explore,
                      color: Colors.teal,
                    ),
                  ),
                  title: const Text(
                    "Viajes",
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Text(
                    "\$${context.watch<FinanceProvider>().totalViajes.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
