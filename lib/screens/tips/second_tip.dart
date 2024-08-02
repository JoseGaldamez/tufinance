import 'package:flutter/material.dart';
import 'package:tufinance/screens/tips/widgets_tips.dart';

class SecondTip extends StatelessWidget {
  const SecondTip({super.key});

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
                "https://pqs.pe/wp-content/uploads/2022/01/PQS-finanzas-personales.jpg"),
            const TitleTip(
                text:
                    "Hábitos de Ahorro que te Pueden Cambiar la Vida Financiera"),
            const ParagraphTip(
              text:
                  "Adoptar hábitos de ahorro efectivos puede tener un impacto significativo en tu vida financiera a largo plazo. Aquí hay algunos hábitos de ahorro que pueden transformar tu situación económica y ayudarte a alcanzar tus metas financieras.",
            ),
            const SubTitleTip(
              text: "1. Automatiza tus Ahorros",
            ),
            const ParagraphTip(
              text:
                  "Una de las maneras más efectivas de ahorrar es automatizar tus ahorros. Configura una transferencia automática desde tu cuenta corriente a una cuenta de ahorros cada vez que recibas tu salario. De esta manera, ahorrar se convierte en una prioridad y no en una opción. Comenzar con un pequeño porcentaje de tus ingresos y aumentarlo gradualmente puede hacer que el ahorro sea más manejable.",
            ),
            const SubTitleTip(
              text: "2. Presupuesta y Monitorea tus Gastos",
            ),
            const ParagraphTip(
              text:
                  "Crear un presupuesto mensual y adherirse a él es crucial para el éxito financiero. Identifica tus ingresos y clasifica tus gastos en categorías como vivienda, alimentación, transporte, entretenimiento, etc. Utiliza aplicaciones de presupuesto o una simple hoja de cálculo para monitorear tus gastos y asegurarte de que te mantienes dentro de tus límites. Saber exactamente a dónde va tu dinero puede ayudarte a identificar áreas donde puedes recortar y ahorrar más.",
            ),
            const SubTitleTip(
              text: "3. Reduce Gastos Innecesarios",
            ),
            const ParagraphTip(
              text:
                  "Revisa tus gastos y elimina aquellos que no son esenciales. Esto podría incluir suscripciones que no usas, compras impulsivas o comer fuera con demasiada frecuencia. Opta por opciones más económicas como cocinar en casa, usar el transporte público o buscar alternativas gratuitas para el entretenimiento. Cada pequeña reducción en gastos innecesarios se suma y puede tener un gran impacto en tus ahorros a largo plazo.",
            ),
            const SubTitleTip(
              text: "4. Establece Metas de Ahorro",
            ),
            const ParagraphTip(
              text:
                  "Tener metas claras de ahorro puede motivarte a ser más disciplinado con tu dinero. Define tus objetivos financieros a corto y largo plazo, como un fondo de emergencia, la compra de una casa, vacaciones o la jubilación. Divide estas metas en pasos manejables y establece un plazo para cada una. Celebrar pequeños logros a lo largo del camino te mantendrá motivado y enfocado en tus objetivos.",
            ),
            const SubTitleTip(
              text: "5. Ahorra los Incrementos de Ingresos",
            ),
            const ParagraphTip(
              text:
                  "Cada vez que recibas un aumento de salario, bonificación o cualquier ingreso extra, destina una parte significativa de ese dinero a tus ahorros en lugar de aumentar tus gastos. Esto te permite mejorar tu situación financiera sin sentir que estás sacrificando tu calidad de vida. Incrementar tus ahorros con estos ingresos adicionales puede acelerar el logro de tus metas financieras.",
            ),
            const ParagraphTip(
              text:
                  "Adoptar estos hábitos de ahorro puede marcar una diferencia considerable en tu vida financiera. La consistencia y la disciplina son clave para construir una base financiera sólida y asegurar un futuro económico más estable y próspero. ¡Empieza hoy y observa cómo tu situación financiera mejora con el tiempo!",
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
