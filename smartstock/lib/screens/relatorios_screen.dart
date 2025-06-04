import 'package:flutter/material.dart';

class RelatoriosScreen extends StatelessWidget {
  final List<Map<String, dynamic>> vendas = [
    {'produto': 'Smartphone', 'quantidade': 10, 'total': 12000.0},
    {'produto': 'Notebook', 'quantidade': 5, 'total': 17500.0},
    {'produto': 'Headphones', 'quantidade': 20, 'total': 9000.0},
  ];

  RelatoriosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double totalGeral = vendas.fold(0, (sum, item) => sum + item['total']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatórios de Vendas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/menu');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Resumo de Vendas',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: vendas.length,
                itemBuilder: (context, index) {
                  final venda = vendas[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(venda['produto']),
                      subtitle: Text('Quantidade: ${venda['quantidade']}'),
                      trailing: Text(
                        'R\$ ${venda['total'].toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            Text(
              'Total Geral: R\$ ${totalGeral.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[700]),
            ),
          ],
        ),
      ),
    );
  }
}
