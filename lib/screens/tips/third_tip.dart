import 'package:flutter/material.dart';
import 'package:tufinance/screens/tips/widgets_tips.dart';

class ThirdTip extends StatelessWidget {
  const ThirdTip({super.key});

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
                "https://coopealianza.fi.cr/wp-content/uploads/2022/10/7-consejos-para-mejorar-su-relacion-con-el-dinero-1-1024x586.webp"),
            const TitleTip(text: "Conoce las principales reglas del dinero"),
            const ParagraphTip(
              text:
                  "Manejar el dinero de manera efectiva es una habilidad esencial para alcanzar la estabilidad financiera y asegurar un futuro próspero. Conocer y aplicar las principales reglas del dinero puede ayudarte a tomar decisiones financieras inteligentes y a evitar problemas económicos. A continuación, te presentamos las reglas más importantes que debes seguir para manejar tu dinero con éxito.",
            ),
            const SubTitleTip(
              text: "1. Gasta Menos de lo que Ganas",
            ),
            const ParagraphTip(
              text:
                  "La regla de oro de las finanzas personales es gastar menos de lo que ingresas. Esto significa vivir dentro de tus posibilidades y evitar acumular deudas innecesarias. Establece un presupuesto y adhiérete a él para asegurarte de que tus gastos no superen tus ingresos. Ahorrar el excedente te permitirá crear un fondo de emergencia y alcanzar tus metas financieras.",
            ),
            const SubTitleTip(
              text: "2. Ahorra e Invierte para el Futuro",
            ),
            const ParagraphTip(
              text:
                  "El ahorro es fundamental para construir una base financiera sólida. Establece un fondo de emergencia que cubra de tres a seis meses de gastos básicos. Además, invierte en cuentas de jubilación y otros instrumentos financieros que te ayuden a hacer crecer tu dinero a largo plazo. La inversión te permite aprovechar el poder del interés compuesto, aumentando significativamente tus ahorros con el tiempo.",
            ),
            const SubTitleTip(
              text: "3. Evita las Deudas de Alto Interés",
            ),
            const ParagraphTip(
              text:
                  "Las deudas de alto interés, como las tarjetas de crédito, pueden convertirse en una carga financiera. Paga el saldo completo de tus tarjetas de crédito cada mes para evitar los intereses acumulados. Si ya tienes deudas, prioriza pagar aquellas con las tasas de interés más altas. Considera consolidar deudas con préstamos de bajo interés para simplificar los pagos y reducir el costo total de la deuda.",
            ),
            const SubTitleTip(
              text: "4. Diversifica tus Inversiones",
            ),
            const ParagraphTip(
              text:
                  "No pongas todos tus huevos en una sola canasta. Diversificar tus inversiones es clave para minimizar riesgos y maximizar rendimientos. Invierte en una variedad de activos, como acciones, bonos, bienes raíces y fondos mutuos. Esta estrategia te protege contra la volatilidad del mercado y asegura que no perderás todo tu dinero si una inversión específica no resulta como esperabas.",
            ),
            const SubTitleTip(
              text: "5. Educa y Actualiza tus Conocimientos Financieros",
            ),
            const ParagraphTip(
              text:
                  "El conocimiento es poder, especialmente cuando se trata de finanzas personales. Mantente informado sobre conceptos financieros básicos y avanzados, como el interés compuesto, la inflación, la planificación de la jubilación y las estrategias de inversión. Lee libros, toma cursos y sigue a expertos financieros para mejorar tus habilidades y tomar decisiones más informadas.",
            ),
            const ParagraphTip(
              text:
                  "Aplicar estas reglas del dinero puede transformar tu vida financiera y ayudarte a alcanzar tus objetivos económicos. La clave es ser consistente y disciplinado en tus hábitos financieros. Al seguir estas pautas, podrás manejar tu dinero de manera más efectiva y asegurar un futuro financiero más estable y exitoso. ¡Empieza hoy y observa cómo tu situación financiera mejora con el tiempo!",
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
