import 'dart:convert';

import 'package:covid_monitoring/services/Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;

List<Map> inputs = [
  {
    'type': FormBuilderDateTimePicker,
    'attribute': 'dateOfTesting',
    'label': 'Date of Testing',
    'inputType': InputType.date,
    'firstDate': DateTime.now(),
    'validators': [FormBuilderValidators.required()],
  },
  {
    'type': FormBuilderTextField,
    'attribute': 'surName',
    'label': 'Surname',
    'validators': [FormBuilderValidators.required()],
  },
  {
    'type': FormBuilderTextField,
    'attribute': 'firstName',
    'label': 'Firstname',
    'validators': [FormBuilderValidators.required()],
  },
  {
    'type': FormBuilderTextField,
    'attribute': 'idNo',
    'label': 'ID No.',
    'validators': [FormBuilderValidators.required()],
  },
  {
    'type': FormBuilderTextField,
    'attribute': 'contactNo',
    'label': 'Contact No.',
    'validators': [FormBuilderValidators.required()],
  },
  {
    'type': FormBuilderDropdown,
    'attribute': 'specimenResult',
    'label': 'Specimen Result',
    'hint': 'Select Specimen Result',
    'selections': ['Not Detected', 'Detected'],
    'validators': [FormBuilderValidators.required()],
  },
  {
    'type': FormBuilderDropdown,
    'attribute': 'testResult',
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
    'attribute': 'followUpTest',
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
    'attribute': 'outcomeAfterAdmission',
    'label': 'Outcome After Admission',
    'validators': [],
  },
  {
    'type': FormBuilderTextField,
    'attribute': 'otherOutcome',
    'label': 'Other Outcome',
    'validators': [],
  },
  {
    'type': FormBuilderDateTimePicker,
    'attribute': 'dateOfAdmission',
    'label': 'Date of Admission',
    'inputType': InputType.date,
    'firstDate': DateTime.now(),
    'validators': [],
  },
  {
    'type': FormBuilderDateTimePicker,
    'attribute': 'dateOfOutcome',
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
    'attribute': 'otherRemarks',
    'label': 'Other Remarks',
    'maxLines': 3,
    'validators': [],
  },
];

class PUIProvider with ChangeNotifier {
  savePUIForm(Map form) async {
    String url = mainApi(url: 'covid-monitoring/save-pui-tested');
    print(form);
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'Date_Of_Testing': form['dateOfTesting'].toString(),
        'Surname': form['surName'],
        'FirstName': form['firstName'],
        'ID_No': form['idNo'],
        'Contact_Number': form['contactNo'],
        'Specimen_Result': form['specimenResult'],
        'Test_Result': form['test_result'],
        'Classification': form['classification'],
        'Follow_Up_Test': form['followUpTest'],
        'Admitted': form['admission'],
        'Ward': form['ward'],
        'Outcome_After_Admission': form['outcomeAfterAdmission'],
        'Other_Outcome': form['otherOutcome'],
        'Date_Of_Admission': form['dateOfAdmission'].toString(),
        'Date_Of_Outcome': form['dateOfOutcome'].toString(),
        'Remarks': form['remarks'],
        'OtherRemarks': form['otherRemarks']
      }),
    );
    print(response.body);
    return json.decode(response.body);
  }
}
