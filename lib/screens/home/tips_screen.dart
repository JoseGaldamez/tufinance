import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        // Articulos de finanzas
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Leer artículo (pendiente)"),
              ),
            );
          },
          child: Card(
            color: Colors.grey[50],
            child: Column(
              children: [
                Image.network(
                    "https://ieu.edu.mx/wp-content/uploads/2020/08/5-consejos-financieros-para-estudiantes.png"),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "5 consejos para ahorrar dinero",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Aprende a ahorrar dinero con estos 5 consejos de parte de expertos en la materia y en la enseñanza.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Leer artículo (pendiente)"),
              ),
            );
          },
          child: Card(
            color: Colors.grey[50],
            child: Column(
              children: [
                Image.network(
                    "https://pqs.pe/wp-content/uploads/2022/01/PQS-finanzas-personales.jpg"),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Habitos de ahorro que te pueden cambiar la vida financiera",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Aprende a ahorrar dinero con estos 5 consejos de parte de expertos en la materia y en la enseñanza.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Leer artículo (pendiente)"),
              ),
            );
          },
          child: Card(
            color: Colors.grey[50],
            child: Column(
              children: [
                Image.network(
                    "https://coopealianza.fi.cr/wp-content/uploads/2022/10/7-consejos-para-mejorar-su-relacion-con-el-dinero-1-1024x586.webp"),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Conoce las principales reglas del dinero",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Aprende a ahorrar dinero con estos 5 consejos de parte de expertos en la materia y en la enseñanza.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
