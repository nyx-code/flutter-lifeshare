import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:lifeshare/services/api/login_api.dart';
import 'package:lifeshare/services/repo/user_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final UserRepo userRepo;
  AuthCubit({this.userRepo}) : super(AuthInitial());

  Future<void> appStarted() async {
    emit(AppLoading());
    try {
      final hasToken = await userRepo.isSign();

      if (hasToken) {
        emit(AppAuth());
      } else {
        emit(AppUnAuth());
      }
    } catch (e) {
      emit(AppUnAuth());
    }
  }

  Future<void> loggedIn() async {
    emit(AppAuth());
  }

  Future<void> logOut() async {
    emit(AppLoading());
    userRepo.signOut();
    emit(AppUnAuth());
  }
}
