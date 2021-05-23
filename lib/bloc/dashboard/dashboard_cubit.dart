import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lifeshare/injection.dart';
import 'package:lifeshare/model/dashboard_model/donor_data_model.dart';
import 'package:lifeshare/model/dashboard_model/profile_model.dart';
import 'package:lifeshare/model/dashboard_model/request_data.model.dart';
import 'package:lifeshare/model/dashboard_model/upadte_donor_model.dart';
import 'package:lifeshare/model/dynamic_data/user_dynamic_details.dart';
import 'package:lifeshare/model/login_model.dart';
import 'package:lifeshare/services/repo/dashboard_repo.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

@Injectable()
class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepo dashboardRepo;
  DashboardCubit({@required this.dashboardRepo}) : super(DashboardInitial());

  Future<void> getUserData() async {
    emit(DashboardLoading());
    final _data = await dashboardRepo.getUserDetails();
    getIt<UserDynamicData>().addLoginModel(model: _data);
    emit(GetUserData(model: _data));
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
}
