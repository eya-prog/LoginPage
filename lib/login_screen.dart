import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled1/classes/language.dart';
import 'package:untitled1/shared/components/components.dart';
import "package:translator/translator.dart";

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

  final translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[400],
        actions: <Widget>[
         Padding(padding: EdgeInsets.only(right: 15.0),
         child: DropdownButton(
           onChanged: (Language language)async{

           },
           icon: Icon(Icons.language,
           color:Colors.white),
           items:Language.languageList().map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
             value:lang,
             child: Row(
               children: <Widget>[
                 Text(lang.flag,style: TextStyle(fontSize: 8)),
                 SizedBox(
                   width: 5
                 ),
                 Text(lang.name,style: TextStyle(fontSize: 13),)
               ],
             ),
           )).toList(),

         ),

         )

        ],


      ),
      body: Center(
        child: Container(
          width:MediaQuery.of(context).size.width*0.7,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),

                  Container(
                    height:MediaQuery.of(context).size.height*0.3,
                    width:MediaQuery.of(context).size.width*0.6,
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
                    label: 'User identifier',
                    prefix: Icons.email,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'user id is empty';
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

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _changeLanguage(Language language) {
    print(language.languageCode);

  }
}
