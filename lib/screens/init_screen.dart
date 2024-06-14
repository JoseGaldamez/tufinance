import 'package:flutter/material.dart';
import 'package:tufinance/widgets/card_categories.dart';
import 'package:tufinance/widgets/card_percentage.dart';
import 'package:tufinance/widgets/header_home.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          HeaderHome(),
          BarPercentage(),
          CardCategories(),
          SizedBox(height: 70)
        ],
      ),
    );
  }
}
