import 'package:flutter/material.dart';
import 'package:teste_alura/design_system/alura_colors.dart';
import 'package:teste_alura/shared/presentation/widgets/alura_alert.dart';

class SubscriptionSection extends StatefulWidget {
  const SubscriptionSection({super.key});

  @override
  State<SubscriptionSection> createState() => _SubscriptionSectionState();
}

class _SubscriptionSectionState extends State<SubscriptionSection> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AluraColors.green,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Inscreva-se para ganhar descontos",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Cadastre seu email, receba novidades e descontos imperdíveis antes de todo mundo!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Digite seu melhor endereço de email",
                hintStyle: Theme.of(context)
                    .inputDecorationTheme
                    .hintStyle!
                    .copyWith(fontSize: 13),
                fillColor: Colors.transparent,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AluraColors.darkPurple),
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                suffixIconConstraints:
                    const BoxConstraints(minWidth: 50, maxHeight: 80),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  _emailController.text.isEmpty
                      ? AluraAlert.showError(context,
                          message: "Preencha o campo para enviar")
                      : AluraAlert.showSuccess(context,
                          message: "Inscrição feita");
                },
                child: const Text("Inscrever"))
          ],
        ),
      ),
    );
  }
}
