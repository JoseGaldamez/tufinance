import 'dart:ui';

import 'package:flutter/material.dart';

class CardCategoriesGastos extends StatefulWidget {
  const CardCategoriesGastos(
      {super.key,
      required this.categorySelected,
      required this.setCategorySelected});

  final String categorySelected;
  final Function setCategorySelected;

  @override
  State<CardCategoriesGastos> createState() => _CardCategoriesGastosState();
}

class _CardCategoriesGastosState extends State<CardCategoriesGastos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Elige una categoría",
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 1.0,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      widget.setCategorySelected("market");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.categorySelected == "market"
                            ? Colors.blue[50]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: widget.categorySelected == "market"
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      widget.setCategorySelected("food");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.categorySelected == "food"
                            ? Colors.red[50]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.fastfood,
                        color: widget.categorySelected == "food"
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      widget.setCategorySelected("car");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.categorySelected == "car"
                            ? Colors.green[50]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.local_gas_station,
                        color: widget.categorySelected == "car"
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      widget.setCategorySelected("house");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.categorySelected == "house"
                            ? Colors.purple[50]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.home,
                        color: widget.categorySelected == "house"
                            ? Colors.purple
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      widget.setCategorySelected("pets");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.categorySelected == "pets"
                            ? Colors.yellow[50]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.pets,
                        color: widget.categorySelected == "pets"
                            ? Colors.yellow
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      widget.setCategorySelected("travels");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.categorySelected == "travels"
                            ? Colors.teal[50]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.travel_explore,
                        color: widget.categorySelected == "travels"
                            ? Colors.teal
                            : Colors.grey,
                      ),
                    ),
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
