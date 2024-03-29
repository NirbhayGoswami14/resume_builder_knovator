
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'package:resume_builder_knovator/model/resume_model.dart';
import 'package:pdf/pdf.dart';
import 'package:resume_builder_knovator/util/resume_template.dart';



class PdfViewScreen extends StatelessWidget
{
   PdfViewScreen(this.resumeModelWithId,{super.key});
    ResumeModelWithId resumeModelWithId;
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview")),
      body: PdfPreview(build:(format) => generatePdfDocument(resumeModelWithId),),
    );
  }
}