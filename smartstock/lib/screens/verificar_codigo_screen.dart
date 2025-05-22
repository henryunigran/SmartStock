import 'package:flutter/material.dart';

class VerificarCodigoScreen extends StatefulWidget {
  @override
  _VerificarCodigoScreenState createState() => _VerificarCodigoScreenState();
}

class _VerificarCodigoScreenState extends State<VerificarCodigoScreen> {
  final TextEditingController codigoController = TextEditingController();

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
                    Text(
                      "Verificação de Código",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Digite o código enviado para seu e-mail",
                      style: TextStyle(color: Colors.grey[700]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: codigoController,
                      decoration: InputDecoration(
                        labelText: 'Código de Verificação',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Aqui você pode redirecionar para uma tela de redefinir senha ou sucesso
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Código verificado com sucesso!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Verificar"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Voltar"),
                    ),
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
