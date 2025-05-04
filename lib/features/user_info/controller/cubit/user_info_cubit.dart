import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/features/user_info/controller/cubit/user_info_state.dart';
import 'package:sadeem_tech_intern/features/user_info/data/repos/user_info_repo.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  final UserInfoRepo _userInfoRepo;
  UserInfoCubit(this._userInfoRepo) : super(UserInfoState.initial());
  Future<void> getUserInfo() async {
    emit(UserInfoState.loading());
    final result = await _userInfoRepo.getUserInfo();
    result.when(
      success: (userInfo) {
        emit(UserInfoState.success(userInfo));
      },
      failure: (apiErrorModel) {
        emit(UserInfoState.failure(apiErrorModel.message!));
      },
    );
  }
}
