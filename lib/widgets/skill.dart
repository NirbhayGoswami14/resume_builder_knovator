import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/util/local_storage.dart';
import 'package:resume_builder_knovator/util/textfiled_decoration.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';

class Skill extends StatefulWidget
{
  const Skill({super.key});

  @override
  State<StatefulWidget> createState() => _SkillState();


}
class _SkillState extends State<Skill>
{
  List<int> item=[0];
  List<String> skills=[];
  List<TextEditingController> textEditingController=[];
  LocalStorage localStorage=LocalStorage();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [

        ListView.builder(itemCount: item.length,shrinkWrap:true,physics: NeverScrollableScrollPhysics(),itemBuilder:(context, index) {
          textEditingController.add(new TextEditingController());
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
                          textEditingController.removeAt(index);
                          skills.removeAt(index);
                        });
                      }
                    }, icon:Icon(Icons.delete))),
                    Text("Skill ${index+1}",style:TextStyles.bold16,),
                    SizedBox(height:8,),
                    TextFormField(controller:textEditingController[index],decoration:TextFiledDecoration.decoration("Skill ${index+1}"),),
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

                for(int i=0;i<textEditingController.length;i++)
                {
                  print(i);
                  print(textEditingController[i].text);

                  if(textEditingController[i].text.isNotEmpty)
                  {
                    skills.add(textEditingController[i].text);

                  }

                }

                print(skills);
                addData();
              }, child:Text(" save"))
            ],),
        ),
      ],),
    );
  }

  void addData()
  {

    FirebaseFirestore.instance.collection('resumes').doc(localStorage.getDocId()).set({"skill":skills},SetOptions(merge:true)).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data Saved")));
    });

  }

}