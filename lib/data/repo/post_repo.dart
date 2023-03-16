import 'package:dio/dio.dart';
import '../model/otp_model.dart';
import 'api.dart';

class PostRepository {
  API api = API();

  Future<void> fetchPosts(String mobile, String imei) async {
    try {
      await api.sendRequest.post("/login", data: {"mobile": mobile, "imei": imei});
      // return newPostModelFromJson(response.data);
    } catch (ex) {
      rethrow;
    }
  }

  Future<OtpPostModel> fetchAuth(String mobile, String otp) async {
    try {
      Response response = await api.sendRequest.post("/verifymsgotp", data: {"mobile": mobile, "imei": otp});
      return otpPostModelFromJson(response.data);
    } catch (ex) {
      rethrow;
    }
  }
}
