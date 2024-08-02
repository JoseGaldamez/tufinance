import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/data/logged_data.dart';
import 'package:tufinance/models/move_model.dart';
import 'package:tufinance/providers/finance_provider.dart';
import 'package:tufinance/providers/theme_provider.dart';
import 'package:tufinance/services/login_service.dart';
import 'package:tufinance/services/moves_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _checkingForData = true;

  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    getUserData().then((user) {
      if (user != null) {
        getUserInformation(context, user.email);
      } else {
        setState(() {
          _checkingForData = false;
        });
      }
    });
  }

  List<MoveModel> extractMoves(dynamic listOfMoves) {
    List<MoveModel> moves = [];
    if (listOfMoves != null) {
      listOfMoves.values
          .forEach((valueMove) => moves.add(MoveModel.fromJson(valueMove)));
    }
    return moves;
  }

  Future<void> getUserInformation(BuildContext context, String email) async {
    getDarkMode().then((response) {
      context.read<ThemeProvider>().setIsDark(response);
    });

    getUserService(email).then((response) {
      final currentDate = DateTime.now();
      final currentMonth = getCurrentMonth(currentDate);

      if (response?.moves != null) {
        final currentDataPassives =
            extractMoves(response?.moves[currentMonth]['pasive']);
        final currentDataActives =
            extractMoves(response?.moves[currentMonth]['activo']);

        context.read<FinanceProvider>().setActivos(currentDataActives);
        context.read<FinanceProvider>().setPasivos(currentDataPassives);
      }

      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_checkingForData) {
      return const Scaffold(
        body: Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                  width: double.infinity,
                ),
                Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.jpg",
                      width: 125,
                    ),
                    const Text(
                      "Inicio de Sesión",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: email,
                        onChanged: (value) {
                          setState(() {
                            _error = null;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: "Correo Electrónico",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: password,
                        onChanged: (value) {
                          setState(() {
                            _error = null;
                          });
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Contraseña",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (_error != null)
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          _error!,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(15),
                        ),
                        onPressed: _isLoading
                            ? null
                            : () async {
                                if (email.text.isEmpty ||
                                    password.text.isEmpty) {
                                  setState(() {
                                    _error = "Todos los campos son requeridos";
                                  });
                                  return;
                                }

                                if (email.text.contains('@') == false) {
                                  setState(() {
                                    _error = "Correo electrónico inválido";
                                  });
                                  return;
                                }

                                setState(() {
                                  _isLoading = true;
                                });

                                final responseLogin = await loginService(
                                    email.text, password.text);

                                if (responseLogin == null) {
                                  setState(() {
                                    _isLoading = false;
                                    _error = "Correo o contraseña incorrectos";
                                  });
                                  return;
                                }

                                await setUserData(responseLogin).then((value) {
                                  setState(() {
                                    _isLoading = false;
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  });
                                });
                              },
                        child: _isLoading
                            ? const SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text(
                                "Iniciar Sesión",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("¿No tienes una cuenta?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/register");
                        },
                        child: const Text("Regístrate"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
