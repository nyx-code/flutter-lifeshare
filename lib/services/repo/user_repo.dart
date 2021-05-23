import 'package:flutter/foundation.dart';

abstract class UserRepo {
  Future<bool> isSign();

  Future<void> signOut();
}
