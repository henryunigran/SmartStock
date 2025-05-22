import 'package:flutter/material.dart';

class CategoriasScreen extends StatelessWidget {
  final List<String> categorias = [
    'Eletrônicos',
    'Informática',
    'Celulares',
    'Acessórios',
    'Outros',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
        leading: BackButton(),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: categorias.length,
        itemBuilder: (context, index) {
          final categoria = categorias[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              leading: Icon(Icons.category),
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
        child: Icon(Icons.add),
        tooltip: 'Adicionar Categoria',
      ),
    );
  }
}
