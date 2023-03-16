import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/logic/otp/otp_cubit.dart';
import 'package:testing_project/presentation/otp_page.dart';

import '../logic/auth/auth_cubit.dart';
import '../logic/auth/auth_state.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController mobileNumberController = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (_, state) {
        if (state is AuthErrorState) {
          SnackBar snackBar = SnackBar(
            content: Text(state.error),
            backgroundColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is AuthLoadedState) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                    child: OTPPage(mobileNumber: mobileNumberController.text),
                    value: OtpCubit(),
                  )));
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
                    "assets/login.png",
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
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.07,
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
                          text: TextSpan(
                            text: 'Salary ',
                            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.purple, fontSize: 36),
                            children: const <TextSpan>[
                              TextSpan(text: 'Now', style: TextStyle(fontWeight: FontWeight.w400, color: Colors.blue)),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Welcome ! ", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.blue, fontSize: 36)),
                              SizedBox(height: 5),
                              Text("Login To Continue", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16)),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mobile Number", style: TextStyle(fontWeight: FontWeight.w400, color: Colors.purple, fontSize: 20)),
                              SizedBox(height: 5),
                              TextFormField(
                                validator: (text) {
                                  if (text == null || text.isEmpty || text.length < 10) {
                                    return 'Enter Correct Mobile Number';
                                  }
                                  return null;
                                },
                                maxLength: 10,
                                controller: mobileNumberController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  // border: InputBorder.none,
                                  hintText: 'Enter your mobile no',

                                  counterText: "",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthCubit>().sendOtp(mobileNumberController.text, "484612321684");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                            ),
                            child: Text(
                              "Get OTP",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0.9),
                            ),
                          ),
                        ),
                      ]),
                    ),
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
