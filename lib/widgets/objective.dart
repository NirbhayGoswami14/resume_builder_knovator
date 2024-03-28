import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_builder_knovator/util/textfiled_decoration.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';

class Objective extends StatelessWidget {
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
            child: ElevatedButton(onPressed: () {}, child: Text("Save"))),
      ]),
    );
  }
}
