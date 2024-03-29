import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_builder_knovator/model/resume_model.dart';
import 'package:resume_builder_knovator/util/local_storage.dart';
import 'package:resume_builder_knovator/util/textfiled_decoration.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';

class Education  extends StatefulWidget
{
  const Education({super.key});


  @override
  State<Education> createState() =>_EducationState();

}
class _EducationState extends State<Education>
{
  List<int> item=[0];
  List<EducationTextEditing> educationController=[];
  List<Map<String,dynamic>> education=[];
  LocalStorage localStorage=LocalStorage();
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(children: [
      
        ListView.builder(itemCount: item.length,shrinkWrap:true,physics: NeverScrollableScrollPhysics(),itemBuilder:(context, index) {
          educationController.add(EducationTextEditing(TextEditingController(), TextEditingController(), TextEditingController()));
          print(item.length);
          return Card(
            margin:EdgeInsets.symmetric(vertical:10,horizontal:10),
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Align(alignment: Alignment.topRight,child: IconButton(onPressed: (){
                      if(item.length>1)
                        {
                          setState(() {
                            item.removeAt(index);
                          });
                        }
                      }, icon:Icon(Icons.delete))),
              Text("College Name",style:TextStyles.bold16,),
              SizedBox(height:8,),
              TextFormField(controller:educationController[index].collegeController,decoration:TextFiledDecoration.decoration("College Name"),),
              SizedBox(height:15,),

              Text("Degree",style:TextStyles.bold16,),
              SizedBox(height:8,),
              TextFormField(controller:educationController[index].degreeController,decoration:TextFiledDecoration.decoration("Degree")),
              SizedBox(height:15,),
                    Text("Passing year ",style:TextStyles.bold16,),
                    SizedBox(height:8,),
                    TextFormField(controller:educationController[index].passingYearController,decoration:TextFiledDecoration.decoration("Passing Year")),
                    SizedBox(height:15,),
                        ]),
            ),);
        },),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(onPressed:() {
              setState(() {
                item.add(item.length+1);
              });
            }, child:Text("+ Add")),
            SizedBox(width:30,),
              ElevatedButton(onPressed:() {

                for(int i=0;i<educationController.length;i++)
                {
                  print(i);
                  print( educationController[i].collegeController.text);
                  if(educationController[i].collegeController.text.isNotEmpty && educationController[i].degreeController.text.isNotEmpty && educationController[i].passingYearController.text.isNotEmpty)
                  {
                    education.add(
                        {
                          "collegeName":educationController[i].collegeController.text,
                          "passingYear": educationController[i].passingYearController.text,
                          "Degree": educationController[i].degreeController.text,
                        });
                    //education.add(EducationModel(educationController[i].collegeController.text, educationController[i].passingYearController.text,educationController[i].degreeController.text));

                  }

                }

                print(education[0].entries.first);
                print(education[0].entries.last);

                addData();

              }, child:Text(" save"))
          ],),
        ),
      ],),
    );
  }

  void addData()
  {

    FirebaseFirestore.instance.collection('resumes').doc(localStorage.getDocId()).set({"education":education},SetOptions(merge:true)).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data Saved")));
    });

  }

}
class EducationTextEditing
{
  TextEditingController collegeController;
  TextEditingController degreeController;
  TextEditingController passingYearController;

  EducationTextEditing(this.collegeController, this.degreeController,
      this.passingYearController);
}