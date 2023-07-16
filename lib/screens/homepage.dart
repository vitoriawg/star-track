import 'package:flutter/material.dart';
import 'package:mobileapp/components/button.dart';
import 'package:mobileapp/screens/loginpage.dart';
import 'package:mobileapp/screens/signuppage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pf.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/bg.png', width: 500),
                const SizedBox(height: 40),
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: MyButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    text: 'Login',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: MyButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => SignupPage(),
                        ),
                      );
                    },
                    text: 'Cadastre-se',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}