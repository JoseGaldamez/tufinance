import 'package:flutter/material.dart';
import 'package:tufinance/screens/tips/widgets_tips.dart';

class FirstTip extends StatelessWidget {
  const FirstTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volver"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                "https://ieu.edu.mx/wp-content/uploads/2020/08/5-consejos-financieros-para-estudiantes.png"),
            const TitleTip(text: "Cinco Consejos Financieros para Estudiantes"),
            const ParagraphTip(
              text:
                  "La vida estudiantil puede ser desafiante, especialmente cuando se trata de manejar las finanzas personales. Aquí tienes cinco consejos financieros para ayudarte a mantener tus finanzas en orden mientras te concentras en tus estudios:",
            ),
            const SubTitleTip(
              text: "1. Crea y Sigue un Presupuesto",
            ),
            const ParagraphTip(
              text:
                  "El primer paso para manejar tus finanzas es crear un presupuesto. Haz una lista de todos tus ingresos, como becas, trabajos a medio tiempo o ayuda familiar, y tus gastos, como matrícula, libros, alquiler, comida y transporte. Utiliza una hoja de cálculo o una aplicación de presupuesto para mantener un seguimiento de tus finanzas. Ajusta tus gastos según sea necesario para asegurarte de no gastar más de lo que tienes.",
            ),
            const SubTitleTip(
              text: "2. Evita las Deudas con Tarjetas de Crédito",
            ),
            const ParagraphTip(
              text:
                  "Las tarjetas de crédito pueden ser útiles en emergencias, pero es importante usarlas con precaución. Evita cargar más de lo que puedes pagar al final del mes y siempre paga el saldo completo para evitar intereses altos. Si ya tienes deudas de tarjetas de crédito, prioriza pagar más del mínimo mensual para reducir la deuda más rápidamente.",
            ),
            const SubTitleTip(
              text: "3. Aprovecha Descuentos y Becas",
            ),
            const ParagraphTip(
              text:
                  "Como estudiante, tienes acceso a numerosos descuentos en libros, software, transporte y entretenimiento. Investiga y utiliza estos descuentos siempre que puedas. Además, busca becas y subvenciones adicionales que puedan estar disponibles en tu universidad o en organizaciones externas. Cada poco ayuda a reducir tus gastos.",
            ),
            const SubTitleTip(
              text: "4. Construye un Fondo de Emergencia",
            ),
            const ParagraphTip(
              text:
                  "Un fondo de emergencia es esencial para cubrir gastos inesperados, como reparaciones de automóviles o emergencias médicas. Intenta ahorrar al menos tres a seis meses de gastos básicos. Comienza con pequeñas cantidades y aumenta gradualmente tus ahorros. Mantén este dinero en una cuenta de ahorros separada para no tentarte a usarlo para gastos no esenciales.",
            ),
            const SubTitleTip(
              text: "5. Planifica para el Futuro",
            ),
            const ParagraphTip(
              text:
                  "Aunque puede parecer lejano, es importante empezar a planificar tu futuro financiero lo antes posible. Considera abrir una cuenta de ahorro a largo plazo o una cuenta de jubilación. Investiga opciones de inversión que se ajusten a tu perfil de riesgo y horizonte temporal. Cuanto antes empieces a invertir, más tiempo tendrá tu dinero para crecer.",
            ),
            const ParagraphTip(
              text:
                  "Seguir estos consejos financieros puede ayudarte a manejar tus finanzas de manera efectiva y a reducir el estrés financiero, permitiéndote enfocarte en tus estudios y disfrutar de la vida universitaria. ¡Buena suerte!",
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
