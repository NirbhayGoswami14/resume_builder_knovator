import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/model/resume_model.dart';
import 'package:resume_builder_knovator/screens/form_screen.dart';
import 'package:resume_builder_knovator/util/local_storage.dart';


class ResumeBuilderScreen extends StatefulWidget
{
   ResumeBuilderScreen (this.fetchResumeFetchData, {super.key});

  @override
  State<StatefulWidget> createState() =>_ResumeBuilderScreenState();
  void Function() fetchResumeFetchData;
}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen>
{
var sectionList=["Personal Details","Objective","Education","Experience","Skill","Language","Projects"];
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {

        widget.fetchResumeFetchData();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Resume "),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                      ListView.builder(
                itemCount: sectionList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap:() {
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> FormScreen(sectionList[index])));
                      },
                      child: Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              Text(
                                sectionList[index],
                                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),),
                              Spacer(),
                              Icon(Icons.arrow_right_outlined,size:25,),
                            ],
                            ),
                          ),
                      ),);
                }),
                    ]),
            )),
      ),
    );
  }


  void addBlankData()
  {
    CollectionReference collectionReference=FirebaseFirestore.instance.collection("resume");
    collectionReference.add(ResumeModel("",{},[],[],[],[],[]).toMap()).then((value) {
      print(value.toString());
      LocalStorage().setDocId(value.toString());}).catchError((error) => ScaffoldMessenger(child:SnackBar(content:Text("Something went wrong"))),);
  }
}