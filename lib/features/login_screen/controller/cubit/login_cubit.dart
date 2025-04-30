import 'package:bloc/bloc.dart';
import 'package:sadeem_tech_intern/features/login_screen/controller/cubit/login_state.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/login_request_body.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  Future<void> login() async {
    emit(LoginState.loading());

    final response = await _loginRepo.userLogin(
      LoginRequestBody(username: "emilys", password: "emilyspass"),
    );

    response.when(
      success: (data) {
        emit(LoginState.success(data));
      },
      failure: (apiErrorModel) {
        emit(LoginState.failure(apiErrorModel));
      },
    );
  }
}
