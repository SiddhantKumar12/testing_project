import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:testing_project/data/model/otp_model.dart';

import '../../data/repo/post_repo.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  final PostRepository _postRepository = PostRepository();

  otpReceive(String mobile, String otp) async {
    try {
      await _postRepository.fetchPosts(mobile, otp);
      emit(OtpLoadedState());
    } on DioError catch (ex) {
      emit(OtpErrorState(ex.toString()));
    }
  }
}
