import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{

  static late SharedPreferences pref;
  
    static Future<void> init()async=> pref = await SharedPreferences.getInstance();
  
  Future<void> setThemeMode({required bool value})async{
    
    await pref.setBool('isLight', value);
    
  }
  
  bool getThemeMode(){

     return pref.getBool('isLight')?? true;
  }
}