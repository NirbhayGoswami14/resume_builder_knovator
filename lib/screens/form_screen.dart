import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/widgets/education.dart';
import 'package:resume_builder_knovator/widgets/experience.dart';
import 'package:resume_builder_knovator/widgets/language.dart';
import 'package:resume_builder_knovator/widgets/objective.dart';
import 'package:resume_builder_knovator/widgets/personal_details.dart';
import 'package:resume_builder_knovator/widgets/skill.dart';

class FormScreen extends StatefulWidget
{
  FormScreen(this.formType,{super.key});

  String formType;

  @override
  State<FormScreen> createState() => _FormScreenState();

}

class _FormScreenState extends State<FormScreen>
{
  //var sectionList=["Personal Details","Objective","Education","Experience","Skill","Language"];
  Widget? widgets;
  @override
  Widget build(BuildContext context) {
    if(widget.formType=="Personal Details")
      {
        widgets=PersonalDetails();
      }
    else if(widget.formType=="Objective")
      {
        widgets=Objective();
      }
    else if(widget.formType=="Experience")
    {
      widgets=Experience();
    }
    else if(widget.formType=="Skill")
    {
      widgets=Skill();
    }
    else if(widget.formType=="Education")
    {
      widgets=Education();
    }
    else if(widget.formType=="Language")
    {
      widgets=Language();
    }
    else
    {
      widgets=Center(child: Text("OOPS"),);
    }
   return Scaffold(
     appBar:AppBar(title: Text(widget.formType),),
    body: widgets,
   );
  }

}