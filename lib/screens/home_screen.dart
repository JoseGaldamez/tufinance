import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tufinance/data/logged_data.dart';
import 'package:tufinance/providers/finance_provider.dart';
import 'package:tufinance/providers/login_provider.dart';
import 'package:tufinance/screens/home/index.dart';

// pantalla de home para una app de tipo finanzas personales

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _screens = [
    const InitScreen(),
    const TipsScreen(),
    const SettingScreen(),
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setUserData();
  }

  Future setUserData() async {
    await getUserData().then((userData) {
      if (userData != null) {
        context.read<LoginProvider>().setUserLogged(userData);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Row(
          children: [
            // circulo con primera letra del nombre del usuario
            CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  context.watch<LoginProvider>().userName[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Text(context.watch<LoginProvider>().userName)
          ],
        ),
        actions: [
          IconButton(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.red),
            ),
            icon: const Icon(Icons.close_rounded),
            onPressed: () async {
              await removeUserData().then((value) {
                context.read<LoginProvider>().removeUserLogged();
                context.read<FinanceProvider>().resetValues();
                Navigator.pushReplacementNamed(context, '/login');
              });
            },
          )
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () async {
                // Show snack bar
                await Navigator.pushNamed(context, "/selectAdd");
                // TODO: Refresh page
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            label: "Inicio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bolt),
            label: "Consejos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications_rounded),
            label: "Configuración",
          ),
        ],
      ),
      body: _screens[_currentIndex],
    );
  }
}
