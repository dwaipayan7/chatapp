import 'package:chatapp/helper/helper_function.dart';
import 'package:chatapp/pages/auth/login_page.dart';
import 'package:chatapp/pages/auth/profile_page.dart';
import 'package:chatapp/pages/auth/search_page.dart';
import 'package:chatapp/service/auth_service.dart';
import 'package:chatapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/service/auth_service.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomePage> {
//   AuthService authService = AuthService();
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String email = "";
  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserData();
  }

  gettingUserData()async{
    await HelperFunctions.getUserEmailFromSF().then((value){
      setState(() {
        email = value!;
      });
    });

    await HelperFunctions.getUserNameFromSF().then((val){
      setState(() {
        userName = val!;
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            nextScreen(context, SearchPage());
          }, icon: const Icon(Icons.search))
        ],
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Groups", style: TextStyle(
          color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold,

        ),),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 50),
          children: <Widget>[
            Icon(Icons.account_circle,
              size: 150,
              color: Colors.grey[700],
            ),
            const SizedBox(height: 15,),
            Text(userName, textAlign: TextAlign.center,style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(height: 30,),
            const Divider(
              height: 2,
            ),
            ListTile(
              onTap: (){},
              selectedColor: Theme.of(context).primaryColor,
              selected: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,
              vertical: 5),
              leading: const Icon(Icons.group),
              title: const Text("Groups",style: TextStyle(color: Colors.black),),
            ),const SizedBox(height: 30,),
            const Divider(
              height: 2,
            ),
            ListTile(
              onTap: (){
                nextScreen(context, const ProfilePage());
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,
                  vertical: 5),
              leading: const Icon(Icons.person),
              title: const Text("Profile",
                style: TextStyle(color: Colors.black),),
            ),
            const SizedBox(height: 30,),
            const Divider(
              height: 2,
            ),
            ListTile(
              onTap: () async{
                showDialog(
                  barrierDismissible: false,
                    context: context,
                    builder: (context){
                    return AlertDialog(
                      title: Text("LogOut"),
                      content: Text("Are you sure?"),
                      actions: [
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.pop(context);
                        },
                          icon: const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    );
                    });
                authService.signOut().whenComplete(() {
                  nextScreenReplace(context, const LoginPage());
                });
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20,
                  vertical: 5),
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Log Out",style: TextStyle(color: Colors.black),),
            ),

          ],
        ),
      ),
    );
  }
}



