import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/providers/login_provider.dart';
import 'package:tufinance/services/login_service.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentPass = TextEditingController();
  final TextEditingController _newPass = TextEditingController();
  final TextEditingController _newPass2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volver"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Cambia tu contraseña",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: _currentPass,
                decoration: const InputDecoration(
                    hintText: "Contraseña actual",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: _newPass,
                decoration: const InputDecoration(
                    hintText: "Nueva contraseña",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                controller: _newPass2,
                decoration: const InputDecoration(
                    hintText: "Confirma la nueva contraseña",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () async {
                        if (_newPass.text != _newPass2.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("La confirmacion no coincide"),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }

                        updatePassword(_currentPass.text, _newPass.text,
                                context.read<LoginProvider>().userEmail)
                            .then((response) {
                          if (response == 2) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Contraseña actual incorrecta"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          if (response == 3) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Ocurrio un error desconocido"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          if (response == 1) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Contraseña guardada correctamente"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pop(context);
                          }
                        });
                      },
                      child: const Text("Guardar cambios")))
            ],
          ),
        ),
      ),
    );
  }
}
