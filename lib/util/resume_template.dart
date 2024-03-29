import 'dart:typed_data';


import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:resume_builder_knovator/model/resume_model.dart';
import 'package:resume_builder_knovator/util/textstyles.dart';

Future<Uint8List> generatePdfDocument(ResumeModelWithId resumeModelWithId)
 {

  final pdf=Document();
  pdf.addPage(Page(build: (context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Header(
            level: 0,
            child: Column(children: [
              Align(alignment: Alignment.center, child: Text(resumeModelWithId.resumeModel.profile["name"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
              SizedBox(height:10),
              Align(alignment: Alignment.center, child: Text(resumeModelWithId.resumeModel.profile["designation"], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
              SizedBox(height:10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                Text(resumeModelWithId.resumeModel.profile["mobile"],style:contentTextStyle()),
                Text(resumeModelWithId.resumeModel.profile["email"],style:contentTextStyle()),
                Text(resumeModelWithId.resumeModel.profile["address"],style:contentTextStyle()),
                Text(resumeModelWithId.resumeModel.profile["linkedIn"],style:contentTextStyle()),
              ]),
              SizedBox(height:10),

            ]),),


        sectionTitle("Objective"),
        SizedBox(height:15),
        Text(resumeModelWithId.resumeModel.objective,style:TextStyle(fontWeight: FontWeight.normal,fontSize:16,)),
        SizedBox(height: 25),


        sectionTitle("Education"),

        ListView.builder(itemBuilder: (context, index) {
        return Padding(padding: EdgeInsets.only(top:15),child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(alignment: Alignment.centerLeft,child: Text(resumeModelWithId.resumeModel.education[index]["collegeName"].toString().toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold,color:PdfColors.black,fontSize:16)),
              ),
              SizedBox(height: 5),
              Text(resumeModelWithId.resumeModel.education[index]["Degree"],style: contentTextStyle()),
              SizedBox(height: 5),
              Text(resumeModelWithId.resumeModel.education[index]["passingYear"],style: contentTextStyle()),
            ]) );
        }, itemCount:resumeModelWithId.resumeModel.education.length),



        SizedBox(height: 25),
        sectionTitle("Skill"),
        ListView.builder(itemBuilder: (context, index) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Align(alignment: Alignment.centerLeft,child: Text(resumeModelWithId.resumeModel.skill[index],style: contentTextStyle()),),


              ]);
        }, itemCount:resumeModelWithId.resumeModel.skill.length),
        SizedBox(height: 25),
        sectionTitle("Languages"),
        ListView.builder(itemBuilder: (context, index) {

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Align(alignment: Alignment.centerLeft,child: Text(resumeModelWithId.resumeModel.language[index],style: contentTextStyle()),),


              ]);
        }, itemCount:resumeModelWithId.resumeModel.language.length),
      ]
    );
  },),
  );
  pdf.addPage(Page(build: (context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle("Experience"),
          ListView.builder(itemBuilder: (context, index) {

            return Padding(padding: EdgeInsets.only(top:15),child:
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.centerLeft,child:Text(resumeModelWithId.resumeModel.experience[index]["companyName"].toString().toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold,color:PdfColors.black,fontSize:16)),),
                  SizedBox(height: 5),

                  Text(resumeModelWithId.resumeModel.experience[index]["position"],style:contentTextStyle()),
                  SizedBox(height: 5),
                  Align(alignment: Alignment.centerLeft,child: SizedBox(width:100,child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(resumeModelWithId.resumeModel.experience[index]["startDate"],style:contentTextStyle()),
                        Text("-"),
                        Text(resumeModelWithId.resumeModel.experience[index]["endDate"],style:contentTextStyle()),
                      ]),), ),
                  SizedBox(height: 5),
                  Text(resumeModelWithId.resumeModel.experience[index]["role"],style:contentTextStyle()),
                ]), );
          }, itemCount:resumeModelWithId.resumeModel.experience.length),
          SizedBox(height: 25),
          sectionTitle("Projects"),
          ListView.builder(itemBuilder: (context, index) {

            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Align(alignment: Alignment.centerLeft,child:Text(resumeModelWithId.resumeModel.projects[index]["projectName"].toString().toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold,color:PdfColors.black,fontSize:16)),),
                  SizedBox(height: 10),
                  Text(resumeModelWithId.resumeModel.projects[index]["projectDescription"],style:contentTextStyle()),
                ]);
          }, itemCount:resumeModelWithId.resumeModel.projects.length),
        ]
    );
  },));
  return pdf.save();

}

Widget sectionTitle(String title)
{
  return  Text(title,style:TextStyle(fontWeight: FontWeight.bold,fontSize:20,color: PdfColors.red));
}
TextStyle contentTextStyle()
{
  return TextStyle(fontWeight:FontWeight.normal,fontSize:16,color: PdfColors.black);
}