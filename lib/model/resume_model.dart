import 'package:flutter/foundation.dart';

class ResumeModelWithId
{
  String id;
  ResumeModel resumeModel;

  ResumeModelWithId(this.id, this.resumeModel);
}
class ResumeModel
{

  String objective;
  Map<String,dynamic> profile;
  List<dynamic> language;
  List<dynamic>  skill;
  //List<Projects> projects;
  List<dynamic> projects;
  //List<EducationModel> education;
  List<dynamic> education;
  //List<Experience> experience;
  List<dynamic> experience;


  ResumeModel(this.objective, this.profile, this.language, this.skill,
      this.projects, this.education, this.experience);




  factory ResumeModel.fromMap(Map<String, dynamic> data) {
    return ResumeModel(
        data["objective"],
        data["profile"],
        data["language"] ?? [],
        data["skill"] ?? [],
        data["projects"]?? [],
        data["education"] ?? [],
        data["experience"] ?? []);
  }

  Map<String,dynamic> toMap()
  {
    return {
      "objective": objective,
      "profile":profile,
      "language":language,
      "skill":skill,
      "projects":projects,
      "education":education,
      "experience":experience
    };
  }









}

class Projects {
  String projectName;
  String projectDescription;

  Projects(this.projectName, this.projectDescription);
  Map<String, dynamic> toMap() {
    return {
      "projectName": projectName,
      "projectDescription": projectDescription,
    };
  }
}

class EducationModel {

  Map<String,dynamic> education;
  String collegeName;
  String passingYear;
  String Degree;

  EducationModel(this.collegeName, this.passingYear, this.Degree,this.education);

  Map<String, dynamic> toMap() {
    return {
      "collegeName": collegeName,
      "passingYear": passingYear,
      "Degree": Degree,

    };
  }
}

class Experience
{
  String companyName;
  String position;
  String startDate;
  String endDate;
  String jobRole;


  Experience(this.companyName, this.position, this.startDate, this.endDate,
      this.jobRole);

  Map<String,dynamic> toMap()
  {
    return {
      "companyName": companyName,
      "position":position,
      "startDate":startDate,
      "endDate":endDate,
      "role":jobRole

    };
  }
}