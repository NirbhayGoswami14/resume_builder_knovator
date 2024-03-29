import 'package:get_storage/get_storage.dart';

class LocalStorage
{
  static late GetStorage storage;

  static const DOCID="docId";


  LocalStorage()
  {
     storage=GetStorage("myData");
  }

   void setDocId(String value)
   {
     storage.write(DOCID,value);
     storage.save();
   }

  /*void setIsLogged(bool value) {
    storage.write(ISLOGGED, value);
    storage.save();
  }

  bool isLogged() {
    return storage.read(ISLOGGED);
  }

  void setIsOnBoard(bool value) async {
    storage.writeInMemory(ONBOARDING, value);
    storage.save();
  }

  bool isOnBoard() {
    return storage.read(ONBOARDING) ?? true;
  }*/
   String getDocId()
  {
    return storage.read(DOCID)??"";
  }

  void getValue(String key)
  {
    storage.read(key);
}
}