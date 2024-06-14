import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width * 0.5) - 40,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        "Ingresos",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_upward,
                        size: 12,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                Text(
                  "\$27,000.00",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            width: (MediaQuery.of(context).size.width * 0.5) - 40,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Text(
                        "Egresos",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_downward,
                        size: 12,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                Text(
                  "\$18,820.00",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
