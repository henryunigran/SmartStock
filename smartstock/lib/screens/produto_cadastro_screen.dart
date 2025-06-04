import 'package:flutter/material.dart';

class ProdutoCadastroScreen extends StatefulWidget {
  const ProdutoCadastroScreen({super.key});

  @override
  _ProdutoCadastroScreenState createState() => _ProdutoCadastroScreenState();
}

class _ProdutoCadastroScreenState extends State<ProdutoCadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _fornecedorController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  String? _categoriaSelecionada;

  final List<String> _categorias = [
    'Eletrônicos',
    'Roupas',
    'Alimentos',
    'Livros',
    'Outros'
  ];

  @override
  void dispose() {
    _nomeController.dispose();
    _fornecedorController.dispose();
    _valorController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvarProduto() {
    if (_formKey.currentState!.validate()) {
      final nome = _nomeController.text.trim();
      final fornecedor = _fornecedorController.text.trim();
      final valor = double.tryParse(_valorController.text.trim()) ?? 0.0;
      final descricao = _descricaoController.text.trim();
      final categoria = _categoriaSelecionada ?? '';

      final produto = {
        'nome': nome,
        'fornecedor': fornecedor,
        'valor': valor,
        'descricao': descricao,
        'categoria': categoria,
      };

      print(produto); // <-- Apenas para exemplo, aqui você usaria um Provider

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Produto "$nome" salvo com sucesso!')),
      );

      _nomeController.clear();
      _fornecedorController.clear();
      _valorController.clear();
      _descricaoController.clear();
      setState(() {
        _categoriaSelecionada = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Produto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Produto',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Informe o nome'
                    : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Categoria',
                  border: OutlineInputBorder(),
                ),
                value: _categoriaSelecionada,
                items: _categorias
                    .map((cat) => DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _categoriaSelecionada = val;
                  });
                },
                validator: (value) => value == null || value.isEmpty
                    ? 'Selecione uma categoria'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fornecedorController,
                decoration: const InputDecoration(
                  labelText: 'Fornecedor',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Informe o fornecedor'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _valorController,
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o valor';
                  }
                  final v = double.tryParse(value);
                  if (v == null || v <= 0) return 'Informe um valor válido';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descricaoController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _salvarProduto,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text('Salvar Produto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
