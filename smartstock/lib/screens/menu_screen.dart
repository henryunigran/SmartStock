import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  Widget buildMenuButton(
      BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.green[400],
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, blurRadius: 4, offset: Offset(2, 2)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            const SizedBox(width: 12),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildBottomMenuItem(
      IconData icon, String label, bool selected, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: selected ? Colors.green[700] : Colors.grey),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.green[700] : Colors.grey,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Inventory Manager',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                              blurRadius: 5,
                              color: Colors.black87,
                              offset: Offset(1, 1))
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Manage your products',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                buildMenuButton(context, Icons.list_alt, 'Produtos', () {
                  Navigator.pushNamed(context, '/produtos');
                }),
                buildMenuButton(context, Icons.add_box, 'Novo Produto', () {
                  Navigator.pushNamed(context, '/novo_produto');
                }),
                buildMenuButton(context, Icons.category, 'Categorias', () {
                  Navigator.pushNamed(context, '/categorias');
                }),
                buildMenuButton(context, Icons.bar_chart, 'Relatórios', () {
                  Navigator.pushNamed(context, '/relatorios');
                }),
                buildMenuButton(context, Icons.settings, 'Configurações', () {
                  Navigator.pushNamed(context, '/configuracoes');
                }),
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, -1)),
              ],
            ),
            child: Row(
              children: [
                buildBottomMenuItem(Icons.home, 'Home', true, () {
                  Navigator.pushReplacementNamed(context, '/menu');
                }),
                buildBottomMenuItem(Icons.list_alt, 'Produtos', false, () {
                  Navigator.pushReplacementNamed(context, '/produtos');
                }),
                buildBottomMenuItem(Icons.add_circle, 'Add Prod', false, () {
                  Navigator.pushReplacementNamed(context, '/novo_produto');
                }),
                buildBottomMenuItem(Icons.bar_chart, 'Reports', false, () {
                  Navigator.pushReplacementNamed(context, '/relatorios');
                }),
                buildBottomMenuItem(Icons.person, 'Profile', false, () {
                  Navigator.pushReplacementNamed(context, '/perfil');
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
