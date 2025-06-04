import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatelessWidget {
  const ConfiguracoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Perfil'),
              subtitle: const Text('Editar informações pessoais'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Segurança'),
              subtitle:
                  const Text('Alterar senha e configurações de segurança'),
              onTap: () {
                // Futuramente: abrir configurações de segurança
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notificações'),
              subtitle: const Text('Configurar preferências de notificação'),
              onTap: () {
                // Futuramente: abrir configurações de notificações
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre'),
              subtitle: const Text('Informações sobre o aplicativo'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'SmartStock',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(Icons.inventory),
                  children: [
                    const Text('Aplicativo de gerenciamento de estoque.'),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
