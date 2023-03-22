import 'package:flutter/material.dart';
import 'package:pawsome/components/my_elevated_button.dart';
import 'package:pawsome/fitness_app/fitness_app_theme.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyElevatedButton(
                width: double.infinity,
                onPressed: () {},
                child: Text("Add lost and found pets")),
            SizedBox(height: 10),
            MyElevatedButton(
                width: double.infinity,
                gradient: LinearGradient(
                    colors: [FitnessAppTheme.nearlyDarkBlue, Colors.red],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                onPressed: () {},
                child: Text("Add lost and found pets")),
          ],
        ),
      )),
    );
  }
}
