import 'package:hive/hive.dart';
import 'package:local_database2/services/db_service.dart';

class HiveDB {
  // local Hive database yaratish
// bu orqali databasega ma'lumot yoziladi
// yani yaratgan databasemizni nomi "pdp_online"
  var box = Hive.box("login_database");

  void storeUser(User user) async {
    //shu yaratgan databasimizga
    // ma'lumot joylashtiryapmiz
    box.put("user", user.toJson());
  }

  void storeSignUp(UserSignUp userSignUp) async {
    box.put("signUp", userSignUp.toJson());
  }

  User loadUser() {
    // yozilgan ma'lumotni chaqirish
    var userLoad = User.fromJson(box.get("user"));
    return userLoad;
  }
  UserSignUp loadUserSignUp(){
    var loadSignUp = UserSignUp.fromJson(box.get("signUp"));
    return loadSignUp;
  }

  void removeUser() {
    box.delete("user");
  }
  void removeUserSignUp(){
    box.delete("signUp");
  }
}
