import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lifeshare/injection.dart';
import 'package:lifeshare/model/dashboard_model/create_donor.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/model/dashboard_model/profile_model.dart';
import 'package:lifeshare/model/dashboard_model/request_data.model.dart';
import 'package:lifeshare/model/dashboard_model/upadte_donor_model.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/model/login_model.dart';
import 'package:lifeshare/services/repo/dashboard_repo.dart';
import 'package:lifeshare/services/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

@Injectable()
class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo dashboardRepo;
  final LoginRepo loginRepo;
  DashboardCubit({@required this.loginRepo, @required this.dashboardRepo})
      : super(DashboardInitial());

  Future<void> getUserData() async {
    emit(DashboardLoading());
    try {
      final _data = await dashboardRepo.getUserDetails();
      getIt<UserDynamicData>().addLoginModel(model: _data);
      emit(GetUserData(model: _data));
    } catch (e) {
      print(e);
    }
  }

  Future<void> getProfileData({@required String token}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.getProfileDetails(token: token);
    emit(GetProfileData(model: _data));
  }

  Future<void> updateProfile(
      {@required UpdateDateModel model, @required String token}) async {
    emit(DashboardLoading());
    final _data =
        await dashboardRepo.updateProfile(updateDateModel: model, token: token);
    emit(GetProfileData(model: _data));
  }

  Future<void> updateRecevierProfile(
      {@required UpdateDateModel model, @required String token}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.updateReceiverProfile(
        updateDateModel: model, token: token);
    emit(GetRecevieProfileData(model: _data));
  }

  Future<void> getDonors() async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.getDonors();
    emit(GetDonorsData(model: _data.data));
  }

  Future<void> getStory() async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.getStory();
    emit(GetStoryData(model: _data.data));
  }

  Future<void> getRequest() async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.getRequest();
    emit(GetRequestData(model: _data.data));
  }

  Future<void> getReceiveProfile({@required String token}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.getReceiveProfile(token: token);
    emit(GetRecevieProfileData(model: _data));
  }

  Future<void> createDonor({@required CreateDonorModel model}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.crateDonorAccount(model: model);
    final _logindata =
        await loginRepo.login(email: model.email, password: model.password);
    emit(DashboardSuccess());
  }

  Future<void> createReceiver({@required CreateDonorModel model}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.crateReceiverAccount(model: model);
    final _logindata = await loginRepo.recieverLogin(
        email: model.email, password: model.password);
    emit(DashboardSuccess());
  }

  Future<void> removeDonor({@required String token}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.removeDonor(token: token);
    getProfileData(token: token);
    final _userData = getIt<UserDynamicData>().getLoginModel;

    emit(DashboardSuccess());
  }

  Future<void> removeRequest({@required String token}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.removeReceiver(token: token);
    getReceiveProfile(token: token);
    final _userData = getIt<UserDynamicData>().getLoginModel;

    emit(DashboardSuccess());
  }

  Future<void> addDonor({@required String token}) async {
    emit(OtherLoading());
    final _data = await dashboardRepo.addDonor(token: token);
    final _userData = getIt<UserDynamicData>().getLoginModel;

    emit(AddSuccess());
  }

  Future<void> addRequest({@required String token}) async {
    emit(OtherLoading());
    final _data = await dashboardRepo.addReceiver(token: token);
    final _userData = getIt<UserDynamicData>().getLoginModel;

    emit(AddSuccess());
  }

  Future<void> addStory({@required String token, @required String data}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.addStory(token: token, data: data);
    emit(AddSuccess());
  }

  Future<void> searchDonors({String type}) async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.searchDonor(data: type);
    emit(GetDonorsData(model: _data.data));
  }
}
