class ResumeModel
{
  String _objective;
  Map<String,String> _profile;
  List<String> _language;
  List<String>  _skill;
  Map<String,String> _projects;

  ResumeModel(this._objective, this._profile,
      this._language, this._skill, this._projects);

  set projects(Map<String, String> value) {
    _projects = value;
  }

  set skill(List<String> value) {
    _skill = value;
  }

  set language(List<String> value) {
    _language = value;
  }

  set profile(Map<String, String> value) {
    _profile = value;
  }

  set objective(String value) {
    _objective = value;
  }




  Map<String, String> get projects => _projects;

  List<String> get skill => _skill;

  List<String> get language => _language;

  Map<String, String> get profile => _profile;

  String get objective => _objective;


}