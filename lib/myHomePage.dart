import 'package:flutter/material.dart';

enum AuthMode {
  login,
  signUp,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  static const route = "MyHomePageRoute";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AuthMode authMode = AuthMode.login;
  final passwordController = TextEditingController();
  var form = GlobalKey<FormState>();
  void userStatusToggleToLogin() {
    if (authMode == AuthMode.signUp) {
      setState(() {
        authMode = AuthMode.login;
      });
    }
  }

  void userStatusToggleToSignUp() {
    if (authMode == AuthMode.login) {
      setState(() {
        authMode = AuthMode.signUp;
      });
    }
  }

  void saveForm(){
    final isValid = form.currentState!.validate();
    if (!isValid) {
      return;
    }
    form.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.blue,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/nike_logo.png',
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: userStatusToggleToLogin,
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              color: authMode == AuthMode.login
                                  ? Colors.white
                                  : Colors.white60,
                              fontSize: authMode == AuthMode.login ? 30 : 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: userStatusToggleToSignUp,
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(
                              color: authMode == AuthMode.signUp
                                  ? Colors.white
                                  : Colors.white60,
                              fontSize: authMode == AuthMode.signUp ? 30 : 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: form,
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 40, left: 40),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'E-mail',
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide an email';
                        }
                        if (!value.contains('@')) {
                          return 'Please provide a valid email';
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(bottom: 15, right: 40, left: 40),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please provide a password';
                        }
                        if (value.length < 6) {
                          return 'provide a password longer than 6 character';
                        }
                        return null;
                      },
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  if (authMode == AuthMode.signUp)
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 15, right: 40, left: 40),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          border: UnderlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a password';
                          }
                          if (value != passwordController.text) {
                            return 'it does not match with the password';
                          }
                          return null;
                        },
                        obscureText: true,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                ],
              ),
            ),
            if (authMode == AuthMode.login)
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forget your password?',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: saveForm,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    authMode == AuthMode.login ? 'LOGIN' : 'SIGN UP',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
