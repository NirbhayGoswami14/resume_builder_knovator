
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/model/resume_model.dart';
import 'package:resume_builder_knovator/util/local_storage.dart';
import 'package:resume_builder_knovator/util/textfiled_decoration.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalDetails extends StatelessWidget
{
  var nameController=TextEditingController();
  var designationController=TextEditingController();
  var mobileController=TextEditingController();
  var emailController=TextEditingController();
  var addressController=TextEditingController();
  var linkedInController=TextEditingController();
  LocalStorage localStorage=LocalStorage();

  var name="",designation="",mobile="",email="",address="",linkedIn="";
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
          TextFormField(controller:nameController,decoration:TextFiledDecoration.decoration("Name"),),
          SizedBox(height:15,),
      
          Text("Designation",style:TextStyles.bold16,),
          SizedBox(height:8,),
          TextFormField(controller:designationController,decoration:TextFiledDecoration.decoration("Designation")),
          SizedBox(height:15,),
      
          Text("Mobile no",style:TextStyles.bold16,),
          SizedBox(height:8,),
          TextFormField(controller:mobileController,decoration:TextFiledDecoration.decoration("Mobile No")),
          SizedBox(height:15,),
      
            Text("Email",style:TextStyles.bold16,),
            SizedBox(height:8,),
            TextFormField(controller: emailController,decoration:TextFiledDecoration.decoration("Email")),
            SizedBox(height:15,),
      
      
          Text("Address",style:TextStyles.bold16,),
          SizedBox(height:8,),
          TextFormField(controller:addressController,decoration:TextFiledDecoration.decoration("Address")),
          SizedBox(height:15,),
      
            Text("LinkedIn Url",style:TextStyles.bold16,),
            SizedBox(height:8,),
            TextFormField(controller: linkedInController,decoration:TextFiledDecoration.decoration("LinkedIn Url")),
            SizedBox(height:15,),

            SizedBox(height:20,),
            Align( alignment: Alignment.center,child: ElevatedButton(onPressed: (){
              name=nameController.text;
              designation=designationController.text;
              email=emailController.text;
              address=addressController.text;
              mobile=mobileController.text;
              linkedIn=linkedInController.text;
              print(name);
              addDetails(context);
            }, child:Text("Save"))),
      
          ],),
      ),
    );
  }

  void addDetails(BuildContext context)
  {
    CollectionReference users = FirebaseFirestore.instance.collection('resumes');
    users.add(ResumeModel("", {
      "name": name,
      "designation":designation,
      "email":email,
      "address":address,
      "mobile":mobile,
      "linkedIn":linkedIn
    }, [], [], [],[],[]).toMap()).then((value) {
      print(value.id);
      localStorage.setDocId(value.id);
      print(" yayay${localStorage.getDocId()}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data Saved")));
    });
  }

}