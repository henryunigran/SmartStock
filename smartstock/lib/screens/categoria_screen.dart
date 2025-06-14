import 'package:flutter/material.dart';

class CategoriasScreen extends StatelessWidget {
  final List<String> categorias = [
    'Eletrônicos',
    'Informática',
    'Celulares',
    'Acessórios',
    'Outros',
  ];

  CategoriasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        leading: const BackButton(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          final categoria = categorias[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.category),
              title: Text(categoria),
              onTap: () {
                // Poderia mostrar detalhes ou listar produtos da categoria
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Futuramente: abrir tela de cadastro de categoria
        },
        tooltip: 'Adicionar Categoria',
        child: Icon(Icons.add),
      ),
    );
  }
}
