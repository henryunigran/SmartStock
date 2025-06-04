import 'package:flutter/material.dart';

class ProdutosScreen extends StatefulWidget {
  const ProdutosScreen({super.key});

  @override
  _ProdutosScreenState createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _produtos = [
    {
      'nome': 'Smartphone X',
      'valor': 1999.99,
      'imagem': 'https://via.placeholder.com/100',
    },
    {
      'nome': 'Notebook Y',
      'valor': 3499.90,
      'imagem': 'https://via.placeholder.com/100',
    },
    {
      'nome': 'Fone de Ouvido Z',
      'valor': 299.50,
      'imagem': 'https://via.placeholder.com/100',
    },
    {
      'nome': 'Smartwatch A',
      'valor': 599.99,
      'imagem': 'https://via.placeholder.com/100',
    },
  ];

  List<Map<String, dynamic>> _produtosFiltrados = [];

  @override
  void initState() {
    super.initState();
    _produtosFiltrados = _produtos;
  }

  void _filtrarProdutos(String query) {
    final filtro = query.toLowerCase();
    setState(() {
      _produtosFiltrados = _produtos.where((produto) {
        final nome = produto['nome'].toString().toLowerCase();
        return nome.contains(filtro);
      }).toList();
    });
  }

  void _adicionarCarrinho(Map<String, dynamic> produto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${produto['nome']} adicionado ao carrinho!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/menu');
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/carrinho');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Buscar produtos',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _filtrarProdutos,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _produtosFiltrados.isEmpty
                  ? const Center(child: Text('Nenhum produto encontrado'))
                  : ListView.builder(
                      itemCount: _produtosFiltrados.length,
                      itemBuilder: (context, index) {
                        final produto = _produtosFiltrados[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: Image.network(
                              produto['imagem'],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            title: Text(produto['nome']),
                            subtitle: Text(
                                'R\$ ${produto['valor'].toStringAsFixed(2)}'),
                            trailing: ElevatedButton(
                              onPressed: () => _adicionarCarrinho(produto),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: Text('Adicionar'),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
