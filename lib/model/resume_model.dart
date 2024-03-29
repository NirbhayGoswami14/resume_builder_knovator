class ResumeModel
{
  String objective;
  Map<String,dynamic> profile;
  List<String> language;
  List<String>  skill;
  //List<Projects> projects;
  List<Map<String,dynamic>> projects;
  //List<EducationModel> education;
  List<Map<String,dynamic>> education;
  //List<Experience> experience;
  List<Map<String,dynamic>> experience;


  ResumeModel(this.objective, this.profile, this.language, this.skill,
      this.projects, this.education, this.experience);

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