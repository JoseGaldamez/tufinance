import 'package:flutter/material.dart';
import 'package:tufinance/models/user_model.dart';
import 'package:tufinance/services/login_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String? _error;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
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
                      "Registrarse",
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
                        controller: name,
                        onChanged: (value) {
                          setState(() {
                            _error = null;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: "Nombre completo",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: confirmPassword,
                        onChanged: (value) {
                          setState(() {
                            _error = null;
                          });
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Confirmar Contraseña",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _error != null
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              _error!,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                              ),
                            ),
                          )
                        : const SizedBox(),
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
                                if (name.text.isEmpty ||
                                    email.text.isEmpty ||
                                    password.text.isEmpty ||
                                    confirmPassword.text.isEmpty) {
                                  setState(() {
                                    _error = "Todos los campos son requeridos";
                                  });
                                  return;
                                }

                                if (password.text.length < 6) {
                                  setState(() {
                                    _error =
                                        "La contraseña debe tener al menos 6 caracteres";
                                  });
                                  return;
                                }

                                if (password.text != confirmPassword.text) {
                                  setState(() {
                                    _error = "Las contraseñas no coinciden";
                                  });
                                  return;
                                }

                                setState(() {
                                  _isLoading = true;
                                });

                                final responseRegister = await registerService(
                                    UserModel(
                                        name: name.text,
                                        email: email.text,
                                        password: password.text,
                                        moves: null));

                                if (!responseRegister) {
                                  setState(() {
                                    _isLoading = false;
                                    _error =
                                        "El correo electrónico ya está registrado";
                                  });
                                  return;
                                }

                                Navigator.pushNamed(context, '/welcome');
                              },
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Text(
                                "Crear Cuenta",
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
                      const Text("¿Ya tienes una cuenta?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Inicia sesión"),
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
