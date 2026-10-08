import 'package:alva/components/card_container.dart';
import 'package:alva/components/header.dart';
import 'package:alva/components/multi_button_card.dart';
import 'package:alva/components/screen_section.dart';
import 'package:alva/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _UserInfo extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = TextTheme.of(context);
    final user = ref.watch(userProvider("mtH9DriTqApzcpNfZZro"));
    return CardContainer(
      child: Row(
        spacing: 14,
        children: [
          Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Color(0xFFEEF2FF),
              border: Border.all(color: Color(0xFF9A95E3), width: 1),
            ),
            child: Text(
              user.valueOrNull?.name.substring(0, 2) ?? "...",
              style: textTheme.headlineSmall?.copyWith(
                color: Color(0xFF5F5DEC),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 4,
              children: [
                Text(
                  user.valueOrNull?.name ?? "Carregando...",
                  style: textTheme.labelLarge,
                ),
                Text(
                  user.hasValue ? "email@example.com" : "Carregando...",
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Icon(Icons.edit_outlined, color: Color(0xFF5F5DEC)),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Header("Perfil", "Gerencie sua jornada acadêmica"),
        ScreenSection(title: "Dados pessoais", child: _UserInfo()),
        ScreenSection(
          title: "Documentos",
          child: MultiButtonCard(
            items: [
              MultiButtonItem(
                text: "Boletim escolar",
                subText: "do ano letivo de 2026",
                icon: Icons.star_outline_outlined,
                actionIcon: Icons.file_download_outlined,
              ),
              MultiButtonItem(
                text: "Histórico escolar",
                subText: "Documento oficial",
                icon: Icons.folder_outlined,
                actionIcon: Icons.file_download_outlined,
              ),
              MultiButtonItem(
                text: "Outros documentos",
                subText: "Ver mais",
                icon: Icons.menu,
              ),
            ],
          ),
        ),
        ScreenSection(
          title: "Configurações",
          child: MultiButtonCard(
            items: [
              MultiButtonItem(
                text: "Notificações e lembretes",
                subText: "Aulas, atividades e pagamentos",
                icon: Icons.notifications_outlined,
              ),
              MultiButtonItem(
                text: "Privacidade e segurança",
                subText: "Senha e proteção de dados",
                icon: Icons.settings_outlined,
              ),
              MultiButtonItem(
                text: "Ajuda e suporte",
                subText: "Fale conosco",
                icon: Icons.comment_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
