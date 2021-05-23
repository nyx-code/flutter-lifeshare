import 'package:injectable/injectable.dart';

@lazySingleton
class BaseUrl {
  final String truckbaziUrl =
      "https://lifeshare-plasmadonation.herokuapp.com/api";
  final String categoryImageBaseUrl = "https://truckbazi.com/images/mobile/";
}
