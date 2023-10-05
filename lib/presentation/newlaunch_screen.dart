import 'package:flutter/material.dart';

class NewLaunchScreen extends StatelessWidget {
  const NewLaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://img.freepik.com/free-vector/abstract-coming-soon-halftone-style-background-design_1017-27282.jpg?w=2000')),
        ),
      ),
    );
  }
}
