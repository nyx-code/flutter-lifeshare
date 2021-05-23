import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @Named("BaseUrl")
  String get baseUrl => 'https://lifeshare-plasmadonation.herokuapp.com/api';

  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(
        baseUrl: url,
      ));
}
