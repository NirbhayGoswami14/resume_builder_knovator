import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_knovator/screens/personal_details_screen.dart';


class ResumeBuilderScreen extends StatefulWidget
{
  const ResumeBuilderScreen({super.key});

  @override
  State<StatefulWidget> createState() =>_ResumeBuilderScreenState();

}

class _ResumeBuilderScreenState extends State<ResumeBuilderScreen>
{
var sectionList=["Personal Details","Objective","Experience","Skill","Language"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Resume "),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        ListView.builder(
            itemCount: sectionList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap:() {
                  switch(sectionList[index])
                  {
                    case "Personal Details":
                        Navigator.of(context).push(MaterialPageRoute(builder:(context)=> PersonalDetailsScreen()));
                        break;
                    case 'Objective':
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> PersonalDetailsScreen()));
                      break;
                    case "Experience":
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> PersonalDetailsScreen()));
                      break;
                    case 'Skill':
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> PersonalDetailsScreen()));
                      break;
                    case "Language":
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=> PersonalDetailsScreen()));
                      break;

                  }
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
      ])),
    );
  }
}