import 'package:injectable/injectable.dart';
import 'package:lifeshare/services/repo/user_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: UserRepo)
class UserApi extends UserRepo {
  final SharedPreferences preferences;
  UserApi({this.preferences});

  @override
  Future<bool> isSign() async {
    final SharedPreferences prefs = preferences;
    bool exist = prefs.containsKey('userdetails');
    return exist;
  }

  @override
  Future<void> signOut() {
    final SharedPreferences pref = preferences;
    return pref.clear();
  }
}
