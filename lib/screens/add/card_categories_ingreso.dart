import 'dart:ui';

import 'package:flutter/material.dart';

class CardCategoriesIngreso extends StatefulWidget {
  const CardCategoriesIngreso(
      {super.key,
      required this.categorySelected,
      required this.setCategorySelected});

  final String categorySelected;
  final Function setCategorySelected;

  @override
  State<CardCategoriesIngreso> createState() => _CardCategoriesIngresoState();
}

class _CardCategoriesIngresoState extends State<CardCategoriesIngreso> {
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
                      widget.setCategorySelected("job_pay");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.categorySelected == "job_pay"
                            ? Colors.green[50]
                            : Colors.grey[100],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Icon(
                        Icons.monetization_on_outlined,
                        color: widget.categorySelected == "job_pay"
                            ? Colors.green
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
