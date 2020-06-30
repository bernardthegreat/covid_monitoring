import 'dart:convert';

import 'package:covid_monitoring/services/Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;

List<Map> inputs = [
      {
        'type': FormBuilderDateTimePicker,
        'attribute': 'date_of_testing',
        'label': 'Date of Testing',
        'inputType': InputType.date,
        'firstDate': DateTime.now(),
        'validators': [FormBuilderValidators.required()],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'surname',
        'label': 'Surname',
        'validators': [FormBuilderValidators.required()],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'firstname',
        'label': 'Firstname',
        'validators': [FormBuilderValidators.required()],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'id_no',
        'label': 'ID No.',
        'validators': [FormBuilderValidators.required()],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'contact_no',
        'label': 'Contact No.',
        'validators': [FormBuilderValidators.required()],
      },
      {
        'type': FormBuilderDropdown,
        'attribute': 'specimen_result',
        'label': 'Specimen Result',
        'hint': 'Select Specimen Result',
        'selections': ['Not Detected', 'Detected'],
        'validators': [FormBuilderValidators.required()],
      },
      {
        'type': FormBuilderDropdown,
        'attribute': 'test_result',
        'label': 'Test Result',
        'hint': 'Select Test Result',
        'selections': ['Covid (-)', 'Covid (+)'],
        'validators': [FormBuilderValidators.required()],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'classification',
        'label': 'Classification',
        'validators': [],
      },
      {
        'type': FormBuilderDropdown,
        'attribute': 'follow_up_test',
        'label': 'Follow Up Test',
        'hint': 'Select for Follow Up Test',
        'selections': ['Yes', 'No'],
        'validators': [],
      },
      {
        'type': FormBuilderDropdown,
        'attribute': 'admission',
        'label': 'Admitted',
        'hint': 'Select for Admission',
        'selections': ['Admitted', 'Not Admitted'],
        'validators': [],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'ward',
        'label': 'Ward',
        'validators': [],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'outcome_after_admission',
        'label': 'Outcome After Admission',
        'validators': [],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'other_outcome',
        'label': 'Other Outcome',
        'validators': [],
      },
      {
        'type': FormBuilderDateTimePicker,
        'attribute': 'date_of_admission',
        'label': 'Date of Admission',
        'inputType': InputType.date,
        'firstDate': DateTime.now(),
        'validators': [],
      },
      {
        'type': FormBuilderDateTimePicker,
        'attribute': 'date_of_outcome',
        'label': 'Date of Outcome',
        'inputType': InputType.date,
        'firstDate': DateTime.now(),
        'validators': [],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'remarks',
        'label': 'Remarks',
        'maxLines': 3,
        'validators': [],
      },
      {
        'type': FormBuilderTextField,
        'attribute': 'other_remarks',
        'label': 'Other Remarks',
        'maxLines': 3,
        'validators': [],
      },
    ];

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