import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:secohand/constant.dart';
import 'package:secohand/pages/findAPhone.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot){
        if(snapshot.hasError){
          return Center(child: Text('Some Error occured'));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return FindAPhone();
        }
        return Scaffold(
          backgroundColor: background,
          body: Center(child: Column(children: [
            Image.asset('images/logoapp.png'),
            CircularProgressIndicator(),
          ],),),
        );
      }),
    );
  }
}
