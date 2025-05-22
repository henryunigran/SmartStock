import 'package:flutter/material.dart';

import 'screens/login_screen.dart';
import 'screens/cadastro_screen.dart';
import 'screens/recuperar_senha_screen.dart';
import 'screens/verificar_codigo_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/menu_screen.dart';
import 'screens/produtos_screen.dart';
import 'screens/categoria_screen.dart';
import 'screens/novo_produto_screen.dart';    
import 'screens/relatorios_screen.dart';      
import 'screens/configuracoes_screen.dart';  
import 'screens/perfil_screen.dart'; 
void main() {
  runApp(SmartStockApp());
}

class SmartStockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SmartStock',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/cadastro': (context) => CadastroScreen(),
        '/recuperar': (context) => RecuperarSenhaScreen(),
        '/verificar': (context) => VerificarCodigoScreen(),
        '/menu': (context) => MenuScreen(),
        '/produtos': (context) => ProdutosScreen(),
        '/novo_produto': (context) => NovoProdutoScreen(),
        '/categorias': (context) => CategoriasScreen(),
        '/relatorios': (context) => RelatoriosScreen(),
        '/configuracoes': (context) => ConfiguracoesScreen(),
        '/perfil': (context) => PerfilScreen(),
      },
    );
  }
}
