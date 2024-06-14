import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/providers/login_provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Setting Screen
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue[50],
                  // backgroundImage: const NetworkImage(
                  //     'https://avatars.githubusercontent.com/u/57899051?v=4'),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  context.watch<LoginProvider>().userName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  context.watch<LoginProvider>().userEmail,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Configuración",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const Divider(),

                const ListTile(
                  leading: Icon(
                    Icons.password,
                    color: Colors.grey,
                  ),
                  title: Text("Cambiar contraseña"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),
                const ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Colors.grey,
                  ),
                  title: Text("Información personal"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),

                const ListTile(
                  leading: Icon(
                    Icons.language,
                    color: Colors.grey,
                  ),
                  title: Text("Idioma"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "Apariencia",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.dark_mode,
                    color: Colors.grey,
                  ),
                  title: const Text("Modo oscuro"),
                  trailing: Switch(
                    activeColor: Colors.blue,
                    value: _darkMode,
                    onChanged: (newValue) {
                      setState(() {
                        _darkMode = newValue;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: newValue
                              ? const Text("Modo oscuro activado")
                              : const Text("Modo oscuro desactivado"),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "Notificaciones",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const Divider(),
                const ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  ),
                  title: Text("Notificaciones"),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ),

                // Setting S
              ],
            ),
          )
          // Setting Screen
        ],
      ),
    );
  }
}
