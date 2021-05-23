import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:injectable/injectable.dart';
import 'package:lifeshare/services/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

@Injectable()
class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({@required this.loginRepo}) : super(LoginInitial());

  Future<void> donorLogin({@required String email, @required password}) async {
    emit(LoginLoading());

    await loginRepo.login(email: email, password: password);

    emit(LoginSuccess());
  }

  Future<void> recieverLogin(
      {@required String email, @required password}) async {
    emit(LoginLoading());

    await loginRepo.recieverLogin(email: email, password: password);

    emit(LoginSuccess());
  }
}
