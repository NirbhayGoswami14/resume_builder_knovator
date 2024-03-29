import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/model/resume_model.dart';
import 'package:resume_builder_knovator/screens/pdfview_screen.dart';
import 'package:resume_builder_knovator/screens/resume_builder_screen.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  List<ResumeModelWithId> resumeList=[];
  bool isLoaded=false;
  @override
  void initState() {
    fetchResumeFetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //fetchResumeFetchData();
    return Scaffold(
      appBar: AppBar(title: Text("Resume Builder")),
      body: isLoaded?Column(children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: resumeList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
               onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfViewScreen(resumeList[index]),));
               },
              child: Card(
                  child: Column(
                children: [
                  Text(resumeList[index].resumeModel.profile!["name"])
                ],
              )),
            );
          },
        ),
      ]):Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResumeBuilderScreen(),));        },
        label: Text("Create New Resume"),
        icon: Icon(Icons.add),
      ),
    );
  }

  void fetchResumeFetchData() async
  {

        CollectionReference collectionReference=FirebaseFirestore.instance.collection("resumes");
     final querySnapshot= await collectionReference.get();
      for(int i=0;i<querySnapshot.size;i++)
        {
            var map=querySnapshot.docs[i].data() as Map<String,dynamic>;


            resumeList.add(ResumeModelWithId(querySnapshot.docs[i].id, ResumeModel.fromMap(map)));

            print(resumeList[i].resumeModel.profile!["name"]);
            print(resumeList[i].id);

        }
      setState(() {
        isLoaded=true;
      });



  }
}