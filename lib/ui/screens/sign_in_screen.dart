import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ostad_task_manager/ui/screens/forgot_password_email_screen.dart';
import 'package:ostad_task_manager/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:ostad_task_manager/ui/screens/sign_up_screen.dart';
import 'package:ostad_task_manager/ui/widgets/screen_background.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name ='/sign-in';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _emailTEController = TextEditingController();
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
                    Text('Get Started With', style: Theme.of(context).textTheme.titleLarge,),
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
                    onPressed:_onTapSignInButton, child: Icon(Icons.arrow_circle_right_rounded),
                  ),
                const SizedBox(height: 30,),
                TextButton(onPressed: _onTapForgotPasswordButton, child: Text('Forgot Password?', style: TextStyle(
                  color: Colors.grey
                ),)),
                RichText(text: TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton,
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

  void _onTapSignInButton(){
    if(_formKey.currentState!.validate()){
      
    }
    Navigator.pushNamedAndRemoveUntil(context, MainNavBarHolderScreen.name, (predicate)=>false);
  }

  void _onTapForgotPasswordButton(){
    Navigator.pushNamed(context, ForgotPasswordEmailScreen.name);

  }
  void _onTapSignUpButton(){
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose(){
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }

}
