import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class PUIForm extends StatefulWidget {
  PUIForm({Key key}) : super(key: key);

  @override
  _PUIFormState createState() => _PUIFormState();
}

class _PUIFormState extends State<PUIForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

 

  @override
  Widget build(BuildContext context) {

    List<Map> inputs = [
      {
        'type': FormBuilderDateTimePicker,
        'attribute': 'date_of_testing',
        'label': 'Date of Testing',
        'inputType': InputType.date,
        'firstDate': DateTime.now(),
        'required': FormBuilderValidators.required(),
      },
      
      {
        'type': FormBuilderTextField,
        'attribute': 'surname',
        'label': 'Surname',
        'required': FormBuilderValidators.required(),
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'firstname',
        'label': 'Firstname',
        'required': FormBuilderValidators.required(),
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'id_no',
        'label': 'ID No.',
        'required': FormBuilderValidators.required(),
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'contact_no',
        'label': 'Contact No.',
        'required': FormBuilderValidators.required(),
      },

      {
        'type': FormBuilderDropdown,
        'attribute': 'specimen_result',
        'label': 'Specimen Result',
        'hint': 'Select Specimen Result',
        'selections': ['Not Detected', 'Detected'],
        'required': FormBuilderValidators.required(),
      },

      {
        'type': FormBuilderDropdown,
        'attribute': 'test_result',
        'label': 'Test Result',
        'hint': 'Select Test Result',
        'selections': ['Covid (-)', 'Covid (+)'],
        'required': FormBuilderValidators.required(),
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'classification',
        'label': 'Classification',
      },

      {
        'type': FormBuilderDropdown,
        'attribute': 'follow_up_test',
        'label': 'Follow Up Test',
        'hint': 'Select for Follow Up Test',
        'selections': ['Yes', 'No'],
      },

      {
        'type': FormBuilderDropdown,
        'attribute': 'admission',
        'label': 'Admitted',
        'hint': 'Select for Admission',
        'selections': ['Admitted', 'Not Admitted'],
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'ward',
        'label': 'Ward',
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'outcome_after_admission',
        'label': 'Outcome After Admission',
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'other_outcome',
        'label': 'Other Outcome',
      },

      {
        'type': FormBuilderDateTimePicker,
        'attribute': 'date_of_admission',
        'label': 'Date of Admission',
        'inputType': InputType.date,
        'firstDate': DateTime.now(),
      },

      {
        'type': FormBuilderDateTimePicker,
        'attribute': 'date_of_outcome',
        'label': 'Date of Outcome',
        'inputType': InputType.date,
        'firstDate': DateTime.now(),
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'remarks',
        'label': 'Remarks',
        'maxLines': 3,
      },

      {
        'type': FormBuilderTextField,
        'attribute': 'other_remarks',
        'label': 'Other Remarks',
        'maxLines': 3,
      },
      
    ];

    _savePUIForm({BuildContext context}) async {
      if (_formKey.currentState.saveAndValidate()) {
        var formVals = _formKey.currentState.value;
        
        print(formVals);
      }
    }
    
    return FormBuilder(
        key: _formKey,
        autovalidate: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    color: Colors.blue[100],
                    child: Text(
                      'Please fill up all the fields',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.blue[900],
                      )
                    ),
                  ),
                  ...inputs.map((item) {
                    switch (item['type']) {
                      case FormBuilderTextField:
                        return 
                          FormBuilderTextField(
                            attribute: item['attribute'],
                            validators: [
                              item['required'] ? item['required'] : ''
                            ],
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(labelText: item['label']),
                          );
                        break;
                      case FormBuilderDateTimePicker:
                        return 
                          FormBuilderDateTimePicker(
                            attribute: item['attribute'],
                            inputType: item['inputType'],
                            firstDate: item['firstDate'],
                            decoration: InputDecoration(labelText: item['label']),
                            validators: [item['required']],
                          );
                      case FormBuilderDropdown:
                        return 
                          
                          FormBuilderDropdown(
                            attribute: item['attribute'],
                            decoration: InputDecoration(labelText: item['label'],),
                            // initialValue: 'Male',
                            hint: Text(item['hint']),
                            validators: [item['required']],
                            items: [
                              ...item['selections'].map((items) => 
                              DropdownMenuItem(
                                  value: items,
                                  child: Text("$items")
                              )).toList(),
                            ]
                          );

                      default:
                        return 
                          Text('');
                    }
                  }).toList(),


                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RaisedButton.icon(
                      onPressed: () {
                        _savePUIForm();
                      },
                      icon: Icon(FontAwesomeIcons.save),
                      label: Text('Save'),
                    ),
                  ),
              ],
            ),
          ),
        )
      );
  }
}
