import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_builder_knovator/util/local_storage.dart';
import 'package:resume_builder_knovator/util/textfiled_decoration.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';

class Experience extends StatefulWidget
{


  @override
  State<Experience> createState() =>_ExperienceState();
}

class _ExperienceState extends State<Experience>
{
  List<int> item=[0];
  List<ExperienceTextEditing> experienceController=[];
  List<Map<String,dynamic>> experience=[];
  LocalStorage localStorage=LocalStorage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [

        ListView.builder(itemCount: item.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
          experienceController.add(ExperienceTextEditing(TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController()));
            print(item.length);
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Align(alignment: Alignment.topRight,
                          child: IconButton(onPressed: () {
                            if (item.length > 1) {
                              setState(() {
                                item.removeAt(index);
                                experience.removeAt(index);

                              });
                            }
                          }, icon: Icon(Icons.delete))),
                      Text("Company", style: TextStyles.bold16,),
                      SizedBox(height: 8,),
                      TextFormField(controller:experienceController[index].companyController,decoration: TextFiledDecoration.decoration(
                          "Company "),),
                      SizedBox(height: 15,),
                      Text("Position", style: TextStyles.bold16,),
                      SizedBox(height: 8,),
                      TextFormField(controller:experienceController[index].positionController,decoration: TextFiledDecoration.decoration(
                          "Position "),),
                      SizedBox(height: 15,),
                      Row(children: [
                        Expanded(
                          child: TextFormField(controller:experienceController[index].startDateController,decoration: TextFiledDecoration.decoration(
                              "Start Date"),),
                        ),
                        SizedBox(width:20,),
                        Expanded(
                          child: TextFormField(controller:experienceController[index].endDateController,decoration: TextFiledDecoration.decoration(
                              "End Date"),),
                        ),
                        ],),
                      SizedBox(height: 15,),
                      Text("Describe Role", style: TextStyles.bold16,),
                      SizedBox(height: 8,),
                      TextFormField(
                        controller:experienceController[index].jobRoleController,
                          decoration: InputDecoration(
                            hintText: "Role",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),maxLines: 4,),
                      SizedBox(height: 15,),


                    ]),
              ),);
          },),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  item.add(item.length + 1);
                });
              }, child: Text("+ Add")),
              SizedBox(width: 30,),
              ElevatedButton(onPressed: () {

                for(int i=0;i<experienceController.length;i++)
                {
                  print(i);
                  print( experienceController[i].companyController.text);
                  if(experienceController[i].companyController.text.isNotEmpty && experienceController[i].positionController.text.isNotEmpty && experienceController[i].startDateController.text.isNotEmpty
                  && experienceController[i].endDateController.text.isNotEmpty && experienceController[i].jobRoleController.text.isNotEmpty )
                  {
                    experience.add(
                        {
                          "companyName": experienceController[i].companyController.text,
                          "position":experienceController[i].positionController.text,
                          "startDate":experienceController[i].startDateController.text,
                          "endDate":experienceController[i].endDateController.text,
                          "role":experienceController[i].jobRoleController.text
                        });
                    //education.add(EducationModel(experienceController[i].collegeController.text, experienceController[i].passingYearController.text,experienceController[i].degreeController.text));

                  }

                }

                print(experience[0].entries.first);
                print(experience[0].entries.last);

                addData();

              }, child: Text(" save"))
            ],),
        ),
      ],),
    );
  }
  void addData()
  {


    FirebaseFirestore.instance.collection('resumes').doc(localStorage.getDocId()).set({"experience":experience},SetOptions(merge:true)).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data Saved")));
    });

  }

}
class ExperienceTextEditing
{
  TextEditingController companyController;
  TextEditingController positionController;
  TextEditingController jobRoleController;
  TextEditingController startDateController;
  TextEditingController endDateController;

  ExperienceTextEditing(this.companyController, this.positionController,
      this.jobRoleController, this.startDateController, this.endDateController);
}