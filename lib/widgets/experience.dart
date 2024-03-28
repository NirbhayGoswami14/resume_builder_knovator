import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [

        ListView.builder(itemCount: item.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
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
                              });
                            }
                          }, icon: Icon(Icons.delete))),
                      Text("Company", style: TextStyles.bold16,),
                      SizedBox(height: 8,),
                      TextFormField(decoration: TextFiledDecoration.decoration(
                          "Company "),),
                      SizedBox(height: 15,),
                      Text("Position", style: TextStyles.bold16,),
                      SizedBox(height: 8,),
                      TextFormField(decoration: TextFiledDecoration.decoration(
                          "Position "),),
                      SizedBox(height: 15,),
                      Row(children: [
                        Expanded(
                          child: TextFormField(decoration: TextFiledDecoration.decoration(
                              "Start Date"),),
                        ),
                        SizedBox(width:20,),
                        Expanded(
                          child: TextFormField(decoration: TextFiledDecoration.decoration(
                              "End Date"),),
                        ),
                        ],),
                      SizedBox(height: 15,),
                      Text("Describe Role", style: TextStyles.bold16,),
                      SizedBox(height: 8,),
                      TextFormField(
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
              ElevatedButton(onPressed: () {}, child: Text(" save"))
            ],),
        ),
      ],),
    );
  }
}