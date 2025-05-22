import 'package:flutter/material.dart';

class ProdutoCadastroScreen extends StatefulWidget {
  @override
  _ProdutoCadastroScreenState createState() => _ProdutoCadastroScreenState();
}

class _ProdutoCadastroScreenState extends State<ProdutoCadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  final nomeController = TextEditingController();
  final fornecedorController = TextEditingController();
  final valorController = TextEditingController();
  final descricaoController = TextEditingController();

  String? categoriaSelecionada;

  // Para teste, categorias fixas - futuramente trocar por categorias cadastradas
  final List<String> categorias = [
    'Eletrônicos',
    'Roupas',
    'Alimentos',
    'Livros',
    'Outros'
  ];

  void _salvarProduto() {
    if (_formKey.currentState!.validate()) {
      final nome = nomeController.text.trim();
      final fornecedor = fornecedorController.text.trim();
      final valor = double.tryParse(valorController.text.trim()) ?? 0.0;
      final descricao = descricaoController.text.trim();
      final categoria = categoriaSelecionada ?? '';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produto "$nome" salvo com sucesso!')),
      );

      // Limpa campos
      nomeController.clear();
      fornecedorController.clear();
      valorController.clear();
      descricaoController.clear();
      setState(() {
        categoriaSelecionada = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome do Produto', border: OutlineInputBorder()),
                validator: (value) => value == null || value.trim().isEmpty ? 'Informe o nome' : null,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Categoria', border: OutlineInputBorder()),
                value: categoriaSelecionada,
                items: categorias.map((cat) => DropdownMenuItem(
                  value: cat,
                  child: Text(cat),
                )).toList(),
                onChanged: (val) {
                  setState(() {
                    categoriaSelecionada = val;
                  });
                },
                validator: (value) => value == null || value.isEmpty ? 'Selecione uma categoria' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: fornecedorController,
                decoration: InputDecoration(labelText: 'Fornecedor', border: OutlineInputBorder()),
                validator: (value) => value == null || value.trim().isEmpty ? 'Informe o fornecedor' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: valorController,
                decoration: InputDecoration(labelText: 'Valor', border: OutlineInputBorder()),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return 'Informe o valor';
                  final v = double.tryParse(value);
                  if (v == null || v <= 0) return 'Informe um valor válido';
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: descricaoController,
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Descrição', border: OutlineInputBorder()),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _salvarProduto,
                child: Text('Salvar Produto'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: Size(double.infinity, 48)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
