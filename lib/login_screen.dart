import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  final String assetName = 'assets/images/login.svg';

  var _formKey = GlobalKey<FormState>();

  bool isPasswordShow=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  child: SvgPicture.asset(
                    assetName,
                  ),
                ),
                Text(
                  'Login',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                SizedBox(
                  height: 10,
                ),
                defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  label: 'Email',
                  prefix: Icons.email,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'email address is empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                defaultFormField(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  isPassword: isPasswordShow,
                  label: 'Password',
                  prefix: Icons.lock,
                  suffix: isPasswordShow ? Icons.visibility :Icons.visibility_off,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'password is empty';
                    }
                    return null;
                  },
                  suffixPressed: (){
                    setState(() {
                     isPasswordShow=!isPasswordShow;
                    });
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                defaultButton(
                    background: Colors.blueGrey[400],
                    function: () {
                      if (_formKey.currentState.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    //
                    text: 'Login'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont\'t have an account?'),
                    TextButton(
                      onPressed: () {},
                      child: Text('Register Now'),
                    )
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
