import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // Centralizando todo o conteúdo da tela
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Centralizando o conteúdo verticalmente
              crossAxisAlignment: CrossAxisAlignment
                  .center, // Centralizando o conteúdo horizontalmente
              children: [
                // Texto de boas-vindas
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Olá\nBem-vindo ao Arandu",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),

                // Primeiro campo de texto
                Container(
                  width: 315,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xfff7f8f8),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Segundo campo de texto
                Container(
                  width: 315,
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Senha",
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xfff7f8f8),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // "Esqueceu sua senha?" link
                GestureDetector(
                  onTap: () {
                    print("Navegar para tela de recuperação de senha!");
                  },
                  child: Text(
                    "Esqueceu sua senha?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Botão com gradiente
                GestureDetector(
                  onTap: () {
                    print("Botão pressionado!");
                  },
                  child: Container(
                    width: 315,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFfb923c),
                          Color(0xFFc2410c),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Linha horizontal decorativa
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "ou",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Imagens clicáveis
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Imagem 1 clicada!");
                      },
                      child: Image.asset(
                        'assets/images/imagem1.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        print("Imagem 2 clicada!");
                      },
                      child: Image.asset(
                        'assets/images/imagem2.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Texto com link "Não tem conta? Registre-se"
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não tem conta? ",
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Navegar para tela de registro!");
                      },
                      child: Text(
                        "Registre-se",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
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
    );
  }
}
