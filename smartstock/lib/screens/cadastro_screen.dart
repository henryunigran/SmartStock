import 'package:flutter/material.dart';
import '../utils/app_colors.dart'; // ajuste conforme seu projeto

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController sobrenomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(24),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Cadastro",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColors.verdePrimario,
                        ),
                      ),
                      SizedBox(height: 24),

                      // Nome
                      TextFormField(
                        controller: nomeController,
                        decoration: InputDecoration(
                          labelText: "Nome",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Informe o nome' : null,
                      ),

                      SizedBox(height: 12),

                      // Sobrenome
                      TextFormField(
                        controller: sobrenomeController,
                        decoration: InputDecoration(
                          labelText: "Sobrenome",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) => value == null || value.isEmpty ? 'Informe o sobrenome' : null,
                      ),

                      SizedBox(height: 12),

                      // Email
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Informe o email';
                          final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!regex.hasMatch(value)) return 'Email inválido';
                          return null;
                        },
                      ),

                      SizedBox(height: 12),

                      // Senha
                      TextFormField(
                        controller: senhaController,
                        decoration: InputDecoration(
                          labelText: "Senha",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) =>
                            value == null || value.length < 6 ? 'Senha deve ter ao menos 6 caracteres' : null,
                      ),

                      SizedBox(height: 12),

                      // Confirmar Senha
                      TextFormField(
                        controller: confirmarSenhaController,
                        decoration: InputDecoration(
                          labelText: "Confirmar Senha",
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Confirme a senha';
                          if (value != senhaController.text) return 'As senhas não conferem';
                          return null;
                        },
                      ),

                      SizedBox(height: 24),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.verdePrimario,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Criar conta
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Conta criada com sucesso!')),
                            );
                            Navigator.pop(context); // Voltar ao login
                          }
                        },
                        child: Text(
                          "Criar Conta",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Já possui uma conta? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: AppColors.verdePrimario,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
