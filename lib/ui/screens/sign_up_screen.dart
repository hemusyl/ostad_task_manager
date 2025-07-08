import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_task_manager/ui/widgets/screen_background.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name ='/sign-up';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lasttNameTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
          child:Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(height: 80,),
                    Text('Join With Us', style: Theme.of(context).textTheme.titleLarge,),
                    TextFormField(
                      controller: _firstNameTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText:'First Name',
                      ),
                      validator:(String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your first Name';
                        }
                        return null;
                      } ,
                    ),
                    TextFormField(
                      controller: _lasttNameTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText:'Last Name',
                      ),
                      validator:(String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your Last Name';
                        }
                        return null;
                      } ,
                    ),
                    TextFormField(
                      controller: _phoneNumberTEController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText:'Mobile Number',
                      ),
                      validator:(String? value){
                        if(value?.trim().isEmpty ?? true){
                          return 'Enter your mobile number';
                        }
                        return null;
                      } ,
                    ),
                    TextFormField(
                      controller: _emailTEController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText:'Email',
                      ),
                      validator:(String? value){
                        String email = value ?? '';
                        if(EmailValidator.validate(email) == false){
                          return 'Enter a valid email';
                        }
                        return null;
                      } ,
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText:'Password' ,
                      ),
                      validator:(String? value){
                        if((value?.length ?? 0) <= 6){
                          return 'Enter a valid Password';
                        }
                        return null;
                      } ,
                    ),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      onPressed:_onTapSignUptButton, child: Icon(Icons.arrow_circle_right_rounded),
                    ),
                    const SizedBox(height: 30,),

                    RichText(text: TextSpan(
                        text: "have an account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w700,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = _onTapSignInButton,
                          )
                        ]
                    ))
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
  void _onTapSignUptButton(){
    if(_formKey.currentState!.validate()){

    }
  }
  void _onTapSignInButton(){
    Navigator.pop(context);
  }

  @override
  void dispose(){
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _firstNameTEController.dispose();
    _lasttNameTEController.dispose();
    _phoneNumberTEController.dispose();
    super.dispose();
  }

}
