import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/data/model/otp_model.dart';
import 'package:testing_project/data/repo/post_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final PostRepository _postRepository = PostRepository();

  void sendOtp(String mobile, String imei) async {
    try {
      await _postRepository.fetchPosts(mobile, imei);
      emit(AuthLoadedState());
    } on DioError catch (ex) {
      emit(AuthErrorState(ex.toString()));
    }
  }
}
