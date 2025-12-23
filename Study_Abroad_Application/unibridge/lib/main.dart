import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:unibridge/auth_gate.dart';
// import 'package:unibridge/countries.dart';
// import 'package:unibridge/home.dart';
// import 'package:unibridge/login.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://ksrbgxlisckruzgheybo.supabase.co", 
    anonKey: "sb_publishable_2-NXSyrCZt079RSv0IQh_A_2TqIwe43",
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: AuthGate(),
      // home: CountryPage(),
    );
  }
}


