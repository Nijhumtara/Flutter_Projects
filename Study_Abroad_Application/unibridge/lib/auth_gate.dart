import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unibridge/home.dart';
import 'package:unibridge/login.dart';

class AuthGate extends StatefulWidget{
  const AuthGate({super.key});

  @override
  State<StatefulWidget> createState() => _AuthGateState();
  
}

class _AuthGateState extends State<AuthGate>{
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange, 
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (session != null){
          return Home();
        }
        else{
          return Login();
        }
      },
    );
  }
  
}