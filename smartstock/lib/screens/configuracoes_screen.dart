import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        leading: BackButton(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              subtitle: Text('Editar informações pessoais'),
              onTap: () {
                // Futuramente: abrir edição de perfil
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Segurança'),
              subtitle: Text('Alterar senha e configurações de segurança'),
              onTap: () {
                // Futuramente: abrir configurações de segurança
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notificações'),
              subtitle: Text('Configurar preferências de notificação'),
              onTap: () {
                // Futuramente: abrir configurações de notificações
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Sobre'),
              subtitle: Text('Informações sobre o aplicativo'),
              onTap: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'SmartStock',
                  applicationVersion: '1.0.0',
                  applicationIcon: Icon(Icons.inventory),
                  children: [
                    Text('Aplicativo de gerenciamento de estoque.'),
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
