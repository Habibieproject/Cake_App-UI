import 'package:flutter/material.dart';
import 'package:cake_app/components/form_error.dart';
import 'package:cake_app/helper/keyboard.dart';
import 'package:cake_app/screens/login_success/login_success_screen.dart';

import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  late bool _passwordVisible;
  final List<String?> errors = [];

  
  void initState() {
    _passwordVisible = false;
  }

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Email", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ],
          ),
          Container(
            height: 50,

            decoration: BoxDecoration(
            color: kColorForm,
            borderRadius: BorderRadius.circular(10)),
            child: 
           
                buildEmailFormField(),
             ),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Password", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            ],
          ),
          Container(
            
            height: 50,
            
            decoration: BoxDecoration(
            color: kColorForm,
            borderRadius: BorderRadius.circular(10)),child: buildPasswordFormField()),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
             
              
              //Spacer(),
              GestureDetector(
                
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: kPrimaryColor,
                      fontSize: 18),
                ),
              )
            ],
          ),
          SizedBox(height: 15,),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Login",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: _passwordVisible,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
        hintText: "Password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
               _passwordVisible
               ? Icons.visibility
               : Icons.visibility_off,
               color: Colors.black,
               ),
            onPressed: () {
               // Update the state i.e. toogle the state of passwordVisible variable
               setState(() {
                   _passwordVisible = !_passwordVisible;
               });
      
  })));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      }, 
      decoration: InputDecoration(
                            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
        hintText: "Email Adress",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        //floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
