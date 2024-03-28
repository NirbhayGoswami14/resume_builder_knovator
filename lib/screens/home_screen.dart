import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/screens/resume_builder_screen.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resume Builder")),
      body: Column(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResumeBuilderScreen(),));        },
        label: Text("Create New Resume"),
        icon: Icon(Icons.add),
      ),
    );
  }
}