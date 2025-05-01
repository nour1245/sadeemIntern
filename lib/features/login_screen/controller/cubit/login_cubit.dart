import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:sadeem_tech_intern/features/login_screen/controller/cubit/login_state.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/login_request_body.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/repos/login_repo.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());

  Future<void> login() async {
    emit(LoginState.loading());

    final response = await _loginRepo.userLogin(
      LoginRequestBody(username: userNameController.text, password: passwordController.text),
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
