import 'package:chatapp/pages/auth/register_page.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final formkey = GlobalKey<FormState>();
class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: SingleChildScrollView(
      child:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 80
        ),
        child: Form(
            key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
           children:<Widget> [
              Text("PutChat",style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.bold),
              ),
          SizedBox(height: 10,),
             Text("Login here to get awesome experience!!",style: TextStyle(
                 fontSize: 15, fontWeight: FontWeight.w400),),
             
             Image.asset('assets/login.png'),

            TextFormField(
              decoration: textInputDecoration.copyWith(
                labelText: "Email",
                prefixIcon: Icon(
                  Icons.email,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onChanged: (val){
                setState(() {
                  email = val;
                  print(email);
                });
              },


              validator: (val) {
                return RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(val!)
                    ? null
                    : "Please enter a valid email";
              },

            ),
             SizedBox(height: 10,),
             TextFormField(
               obscureText: true,
                 decoration: textInputDecoration.copyWith(
                   labelText: "Password",
                   prefixIcon: Icon(
                     Icons.lock,
                     color: Theme.of(context).primaryColor,
                   ),
                 ),

               validator: (val) {

                  if(val!.length < 6){
                    return "Password must be at least 6 character";
               }else{
                    return null;
                  }
               },

               onChanged: (val){
                 setState(() {
                   password = val;
                   print(password);
                 });

               },

             ),
             SizedBox(height: 10,),

             SizedBox(height: 30,
             width: double.infinity,
             child: ElevatedButton(
               style: ElevatedButton.styleFrom(
                 primary: Theme.of(context).primaryColor,
                 elevation: 0,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(30)
                 )
               ),
               onPressed: () {
                 login();
               },
               child: const Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 16),
               ),
             ),
             ),

             SizedBox(height: 10,),

             Text.rich(
               TextSpan(
                 text: "Don't have an account?",
                   children: <TextSpan>[
                 TextSpan(
                     text: "Register here",
                     style: const TextStyle(
                         color: Colors.black,
                         decoration: TextDecoration.underline),
                     recognizer: TapGestureRecognizer()
                       ..onTap = () {
                        nextScreen(context, const RegisterPage());
                       }),
               ],

                 style: TextStyle(color: Colors.black, fontSize: 14)
               )
             ),

           ]
          ),
        ),
      )
    ),
    );
  }
login(){

}

}