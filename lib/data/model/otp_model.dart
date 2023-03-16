import 'dart:convert';

OtpPostModel otpPostModelFromJson(String str) => OtpPostModel.fromJson(json.decode(str));

String otpPostModelToJson(OtpPostModel data) => json.encode(data.toJson());

class OtpPostModel {
  OtpPostModel({
    required this.mobile,
    required this.otp,
  });

  String mobile;
  String otp;

  factory OtpPostModel.fromJson(Map<String, dynamic> json) => OtpPostModel(
        mobile: json["mobile"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "otp": otp,
      };
}
