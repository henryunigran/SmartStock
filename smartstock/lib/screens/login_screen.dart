import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

Future<void> _salvarLogin() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', emailController.text);
  await prefs.setString('senha', passwordController.text);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Login salvo localmente")),
  );

  // Navega para a tela de menu, substituindo a rota atual
  Navigator.pushReplacementNamed(context, '/menu');
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.green[700]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("SmartStock", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green[700])),
                    SizedBox(height: 20),
                    Text("Login", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text("Entre com sua conta para acessar", style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/recuperar');
                        },
                        child: Text("Esqueceu a senha?", style: TextStyle(color: Colors.blueAccent)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _salvarLogin,
                      child: Text("Entrar"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                    Divider(),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.g_mobiledata),
                      label: Text("Continue com Google"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.apple),
                      label: Text("Continue com Apple"),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                    ),
                    SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      child: Text("Não possui uma conta!? Cadastre-se"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
