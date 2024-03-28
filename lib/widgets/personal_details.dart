
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/util/textfiled_decoration.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalDetails extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Name",style:TextStyles.bold16,),
          SizedBox(height:8,),
          TextFormField(decoration:TextFiledDecoration.decoration("Name"),),
          SizedBox(height:15,),
      
          Text("Designation",style:TextStyles.bold16,),
          SizedBox(height:8,),
          TextFormField(decoration:TextFiledDecoration.decoration("Designation")),
          SizedBox(height:15,),
      
          Text("Mobile no",style:TextStyles.bold16,),
          SizedBox(height:8,),
          TextFormField(decoration:TextFiledDecoration.decoration("Mobile No")),
          SizedBox(height:15,),
      
            Text("Email",style:TextStyles.bold16,),
            SizedBox(height:8,),
            TextFormField(decoration:TextFiledDecoration.decoration("Email")),
            SizedBox(height:15,),
      
      
          Text("Address",style:TextStyles.bold16,),
          SizedBox(height:8,),
          TextFormField(decoration:TextFiledDecoration.decoration("Address")),
          SizedBox(height:15,),
      
            Text("LinkedIn Url",style:TextStyles.bold16,),
            SizedBox(height:8,),
            TextFormField(decoration:TextFiledDecoration.decoration("LinkedIn Url")),
            SizedBox(height:15,),

            SizedBox(height:20,),
            Align( alignment: Alignment.center,child: ElevatedButton(onPressed: (){

            }, child:Text("Save"))),
      
          ],),
      ),
    );
  }

  void addDetails()
  {
    CollectionReference users = FirebaseFirestore.instance.collection('resumes');

  }

}