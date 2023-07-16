import 'package:flutter/material.dart';
import 'package:mobileapp/components/button.dart';
import 'package:mobileapp/components/textfield.dart';
import 'package:mobileapp/screens/mainpage.dart';
import 'package:mobileapp/screens/signuppage.dart';


  class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailLogin = TextEditingController();
  final TextEditingController _senhaLogin = TextEditingController();
  int _selectedIndex = 0;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {

    List<Widget> _lista = [
      appBar: AppBar(
        title: Text(
          'Login',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Column(
                children: [
                  Text("Logar",style: TextStyle(fontSize: 30),),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email"
                    ),
                    controller: _emailLogin,
                  ),
                  TextFormField(
                    controller: _senhaLogin,
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
                    onPressed: () async {
                      if(await Login().logar(Usuario(email: _emailLogin.text.toUpperCase(), senha: _senhaLogin.text))){
                        setState(() {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> menu()));
                          _emailLogin.clear();
                          _senhaLogin.clear();
                        });
                      }else{
                        showDialog(context: context, builder: (BuildContext context){
                          return AlertDialog(
                            title: Text("Credencias incorretas"),
                            content: Text("As credencias que você informou estão incorretas!"),
                          );
                        });
                      }
                    },
                    icon: Icon(Icons.login),
                    label: Text("Login")
                  )
                  SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Não tem conta? Registre-se",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
