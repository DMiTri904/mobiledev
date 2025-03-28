

import 'package:flutter/material.dart';

class PageChiTiet extends StatelessWidget {
  const PageChiTiet ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title: Text("Chi tiet"),
    ),
    body: Center(
      child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).pop
            ("Bye Bye");
    },
        child: Text("Go back")
       ),
      ),
    );
  }
}
