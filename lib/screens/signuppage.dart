import 'package:flutter/material.dart';
import 'package:mobileapp/components/button.dart';
import 'package:mobileapp/screens/loginpage.dart';

import '../components/textfield.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body:  Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  Text("Criar Conta",style: TextStyle(fontSize: 30),),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async{
                      String name = _nameController.text;
                      String email = _emailController.text;
                      String password = _passwordController.text;


                      Usuario user = Usuario(email: email, senha: password, nome: name);
                      if(await Login().criarConta(user)){
                        setState(() {
                          _selectedIndex = 0;
                        });
                        _passwordController.clear();
                        _emailController.clear();
                        _nameController.clear();
                      } else {
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Erro!"),
                            content: Text("Ocorreu um erro ao tentar criar o usuario!"),
                          );
                        });
                      }
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Ja tem conta? Logue Aqui.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 350), // Extra spacing at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
