import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/util/local_storage.dart';
import 'package:resume_builder_knovator/util/textfiled_decoration.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';

class Projects extends StatefulWidget
{
  @override
  State<Projects> createState() => _ProjectsState();

}
class _ProjectsState extends State<Projects>
{

  List<int> item=[0];
  List<ProjectTextEditing> projectsController=[];
  List<Map<String,dynamic>> projects=[];
  LocalStorage localStorage=LocalStorage();

@override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Column(children: [

      ListView.builder(itemCount: item.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          projectsController.add(ProjectTextEditing(TextEditingController(),TextEditingController()));
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
                              projects.removeAt(index);
                            });
                          }
                        }, icon: Icon(Icons.delete))),
                    Text("Project Name", style: TextStyles.bold16,),
                    SizedBox(height: 8,),
                    TextFormField(controller:projectsController[index].projectNameController,decoration: TextFiledDecoration.decoration(
                        "Project Name "),),
                    SizedBox(height: 15,),
                    Text("Project Description", style: TextStyles.bold16,),
                    SizedBox(height: 8,),
                    TextFormField(
                      controller:projectsController[index].projectDescController,
                      decoration: InputDecoration(
                        hintText: "Project Description",
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

              for(int i=0;i<projectsController.length;i++)
              {
                print(i);
                print( projectsController[i].projectNameController.text);
                if(projectsController[i].projectNameController.text.isNotEmpty && projectsController[i].projectDescController.text.isNotEmpty  )
                {
                  projects.add(
                      {
                        "projectName": projectsController[i].projectNameController.text,
                        "projectDescription": projectsController[i].projectDescController.text,
                      });
                  //education.add(EducationModel(experienceController[i].collegeController.text, experienceController[i].passingYearController.text,experienceController[i].degreeController.text));

                }

              }

              print(projects[0].entries.first);
              print(projects[0].entries.last);

              addData();
            }, child: Text(" save"))
          ],),
      ),
    ],),
  );
}
void addData()
{


  FirebaseFirestore.instance.collection('resumes').doc(localStorage.getDocId()).set({"projects":projects},SetOptions(merge:true)).then((value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data Saved")));
  });

}

}
class ProjectTextEditing
{
  TextEditingController projectNameController;
  TextEditingController projectDescController;

  ProjectTextEditing(this.projectNameController, this.projectDescController);
}