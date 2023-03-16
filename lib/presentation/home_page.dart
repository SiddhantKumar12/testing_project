import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing_project/logic/auth/auth_cubit.dart';
import 'package:testing_project/logic/auth/auth_state.dart';
import 'package:testing_project/presentation/login_page.dart';

class Homepage extends StatelessWidget {
  String mobileNumber;

  Homepage({super.key, required this.mobileNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: SafeArea(
        child: Center(
          child: Table(
            border: TableBorder.all(color: Colors.black, width: 1.5),
            children: [
              TableRow(children: [
                Text(
                  "Name",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "Contact No.",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  "Contact Created Today",
                  style: TextStyle(fontSize: 15.0),
                ),
              ]),
              TableRow(children: [
                Text(
                  "xyz",
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  mobileNumber,
                  style: TextStyle(fontSize: 15.0),
                ),
                Text(
                  DateTime.now().toString(),
                  style: TextStyle(fontSize: 15.0),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
