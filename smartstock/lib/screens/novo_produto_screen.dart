import 'package:flutter/material.dart';

class NovoProdutoScreen extends StatefulWidget {
  @override
  _NovoProdutoScreenState createState() => _NovoProdutoScreenState();
}

class _NovoProdutoScreenState extends State<NovoProdutoScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();
  final TextEditingController fornecedorController = TextEditingController();
  final TextEditingController valorController = TextEditingController();

  String? categoriaSelecionada;
  final List<String> categorias = [
    'Eletrônicos',
    'Roupas',
    'Acessórios',
    'Alimentos',
    'Limpeza'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Produto'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/menu'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // ação futura
            },
          )
        ],
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome do Produto'),
              ),
              SizedBox(height: 12),
              TextField(
                controller: descricaoController,
                maxLines: 3,
                decoration: InputDecoration(labelText: 'Descrição'),
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: categoriaSelecionada,
                decoration: InputDecoration(labelText: 'Categoria'),
                items: categorias.map((categoria) {
                  return DropdownMenuItem<String>(
                    value: categoria,
                    child: Text(categoria),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    categoriaSelecionada = value;
                  });
                },
              ),
              SizedBox(height: 12),
              TextField(
                controller: fornecedorController,
                decoration: InputDecoration(labelText: 'Fornecedor'),
              ),
              SizedBox(height: 12),
              TextField(
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Valor'),
              ),
              SizedBox(height: 12),
              Text('Imagens do produto (em breve)', style: TextStyle(color: Colors.grey)),
              SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  label: Text('Salvar Produto'),
                  onPressed: () {
                    // salvar o produto no banco
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Produto salvo!')),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
