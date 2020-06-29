import 'package:covid_monitoring/screens/forms/PUIForm.dart';
import 'package:flutter/material.dart';


class PUIScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PUI Form')
      ),
      body: PUIForm(),
    );
  }
}