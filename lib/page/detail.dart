import 'package:flutter/material.dart';
import '../model/user.dart';

class Detail extends StatelessWidget {
  const Detail({super.key,required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    // style
    TextStyle myStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.blue,
    );
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Full name: ${user.fullName}", style: myStyle),
          Text("Email: ${user.email}", style: myStyle),
          Text("Gender: ${user.gender}", style: myStyle),
          Text("Favorite: ${user.favorite}", style: myStyle),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, 
          child: const Text('Go back!'),
          )
        ],),
      ),
    );
  }
}