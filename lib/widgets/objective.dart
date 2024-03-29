import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_builder_knovator/model/resume_model.dart';
import 'package:resume_builder_knovator/util/local_storage.dart';
import 'package:resume_builder_knovator/util/textfiled_decoration.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';

class Objective extends StatelessWidget {
  var objectiveController=TextEditingController();
  LocalStorage localStorage=LocalStorage();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Objective",
          style: TextStyles.bold16,
        ),
        SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: objectiveController,
          decoration: InputDecoration(
            hintText: "Objective",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          maxLines: 10,
        ),
        SizedBox(
          height: 35,
        ),
        Align(
            alignment: Alignment.center,
            child: ElevatedButton(onPressed: () {
              addDetails(context);
            }, child: Text("Save"))),
      ]),
    );
  }

  void addDetails(BuildContext context)
  {

    FirebaseFirestore.instance.collection('resumes').doc(localStorage.getDocId()).set({"objective":objectiveController.text},SetOptions(merge:true)).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Data Saved")));
      debugPrint("ok");});
   /* CollectionReference users
    users.add(ResumeModel(objectiveController.text, {

    }, [], [], {}).toMap()).then((value) => debugPrint(value.toString()));*/
  }

}
