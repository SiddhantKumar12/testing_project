import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:testing_project/logic/otp/otp_cubit.dart';
import 'package:testing_project/presentation/home_page.dart';

class OTPPage extends StatelessWidget {
  String mobileNumber;
  OtpFieldController otpNumberController = OtpFieldController();

  OTPPage({Key? key, required this.mobileNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpErrorState) {
          SnackBar snackBar = SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is OtpLoadedState) {
          Navigator.pushAndRemoveUntil(context, (MaterialPageRoute(builder: (context) => Homepage(mobileNumber: mobileNumber))), (route) => false);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Image.asset(
                    "assets/otp.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.purple,
                        Colors.blue,
                      ],
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.10,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        width: 1.5,
                        color: Colors.black26,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Salary ',
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.purple, fontSize: 36),
                          children: <TextSpan>[
                            TextSpan(text: 'Now', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.blue)),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Verify Number", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.blue, fontSize: 36)),
                            SizedBox(height: 5),
                            Text("Enter the 6 digit OTP sent to +91${mobileNumber}",
                                style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 18)),
                          ],
                        ),
                      ),
                      OTPTextField(
                        controller: otpNumberController,
                        length: 6,
                        outlineBorderRadius: 10,
                        keyboardType: TextInputType.number,
                        width: MediaQuery.of(context).size.width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        otpFieldStyle: OtpFieldStyle(
                          enabledBorderColor: Colors.white,
                          focusBorderColor: Colors.purple,
                          borderColor: Colors.purple,
                          backgroundColor: Colors.purple.shade50,
                        ),
                        fieldWidth: 45,
                        fieldStyle: FieldStyle.box,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Resend OTP ? ", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16)),
                          Text("Change Number ?", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16)),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<OtpCubit>().otpReceive(mobileNumber, otpNumberController.toString());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.purple,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                          ),
                          child: const Text(
                            "Verify",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.9, color: Colors.white),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
