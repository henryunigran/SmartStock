import 'package:flutter/material.dart';

class ProdutosScreen extends StatefulWidget {
  @override
  _ProdutosScreenState createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _produtos = [
    {
      'nome': 'Smartphone X',
      'valor': 1999.99,
      'imagem': 'https://via.placeholder.com/100', // imagem genérica
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
    // Aqui você pode adicionar lógica para o carrinho
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${produto['nome']} adicionado ao carrinho!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produtos'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/menu');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navegação para a tela de carrinho (criar depois)
              Navigator.pushNamed(context, '/carrinho');
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar produtos',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: _filtrarProdutos,
            ),
            SizedBox(height: 12),
            Expanded(
              child: _produtosFiltrados.isEmpty
                  ? Center(child: Text('Nenhum produto encontrado'))
                  : ListView.builder(
                      itemCount: _produtosFiltrados.length,
                      itemBuilder: (context, index) {
                        final produto = _produtosFiltrados[index];
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          child: ListTile(
                            leading: Image.network(
                              produto['imagem'],
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            title: Text(produto['nome']),
                            subtitle: Text('R\$ ${produto['valor'].toStringAsFixed(2)}'),
                            trailing: ElevatedButton(
                              onPressed: () => _adicionarCarrinho(produto),
                              child: Text('Adicionar'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
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
