import 'package:flutter/material.dart';

class WelcomeRegisterScreen extends StatelessWidget {
  const WelcomeRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.jpg",
                  width: 125,
                ),
                const Text(
                  "¡Bienvenido!",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Gracias por registrarte en nuestra app de finanzas personales",
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: const Text("Iniciar Sesión"),
                  ),
                ),
                const SizedBox(
                  height: 200,
                )
              ],
            ),
          ),
        ));
  }
}
