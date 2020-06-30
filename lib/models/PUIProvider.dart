import 'dart:convert';
import 'package:covid_monitoring/services/Api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PUIProvider extends ChangeNotifier
{

  savePUIForm(Map form) async {

    String url = mainApi(url: 'etriage/register-visitor');
    
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'Date_Of_Testing': form['date_of_testing'],
        'Surname': form['surname'],
        'FirstName': form['firstname'],
        'ID_No': form['id_no'],
        'Contact_Number': form['contact_no'],
        'Specimen_Result': form['specimen_result'],
        'Test_Result': form['test_result'],
        'Classification': form['classification'],
        'Follow_Up_Test': form['follow_up_test'],
        'Admitted': form['admission'],
        'Ward': form['ward'],
        'Outcome_After_Admission': form['outcome_after_admission'],
        'Other_Outcome': form['other_outcome'],
        'Date_Of_Admission': form['date_of_admission'],
        'Date_Of_Outcome': form['date_of_outcome'],
        'Remarks': form['remarks'],
        'OtherRemarks': form['other_remarks']
      }),
    );

    

    //getAppointments();
    // notifyListeners();
    //print(response.body);
    
    return json.decode(response.body);
  }
}