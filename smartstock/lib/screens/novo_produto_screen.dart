import 'package:flutter/material.dart';

class NovoProdutoScreen extends StatefulWidget {
  const NovoProdutoScreen({super.key});

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
        title: const Text('Cadastrar Produto'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/menu'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {},
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
                decoration: const InputDecoration(labelText: 'Nome do Produto'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: descricaoController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Descrição'),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: categoriaSelecionada,
                decoration: const InputDecoration(labelText: 'Categoria'),
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
              const SizedBox(height: 12),
              TextField(
                controller: fornecedorController,
                decoration: const InputDecoration(labelText: 'Fornecedor'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Valor'),
              ),
              const SizedBox(height: 12),
              const Text('Imagens do produto (em breve)',
                  style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Salvar Produto'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Produto salvo!')),
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
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
