import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PUIForm extends StatefulWidget {
  PUIForm({Key key}) : super(key: key);

  @override
  _PUIFormState createState() => _PUIFormState();
}

class _PUIFormState extends State<PUIForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  List<Map> element = [
    {'attribute': 'firstName', 'labelText': 'Firstname', 'type': 'textBox'},
    {'attribute': 'surName', 'labelText': 'Surname', 'type': 'textBox'},
    {'attribute': 'id_no', 'labelText': 'ID No', 'type': 'textBox'},
    {
      'attribute': 'contact_numbers',
      'labelText': 'Contact No.',
      'type': 'textBox'
    },
    {
      'attribute': 'classification',
      'labelText': 'Classification',
      'type': 'textBox'
    },
    {'attribute': 'ward', 'labelText': 'Ward', 'type': 'textBox'},
    {'attribute': 'remarks', 'labelText': 'Remarks', 'type': 'textBox'},
    {
      'attribute': 'specimenResult',
      'labelText': 'Specimen Result',
      'type': 'dropdown',
      'hint': 'Select Specimen Result',
      'items': {'Not Detected', 'Detected'}
    }
  ];

  List<Map> items = [
    
  ];

  @override
  Widget build(BuildContext context) {
    print(element);
    return FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...element.map(
                  (e) => e['type'] == 'textBox'
                      ? FormBuilderTextField(
                          attribute: e['attribute'],
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          validators: [
                            FormBuilderValidators.required(),
                          ],
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: e['labelText'],
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(color: Colors.black38)),
                          style: Theme.of(context).textTheme.headline4,
                        )
                      : FormBuilderDropdown(
                          attribute: e['attribute'],
                          decoration:
                              InputDecoration(labelText: e['labelText']),
                          // initialValue: 'Male',
                          hint: Text(e['hint']),
                          validators: [FormBuilderValidators.required()],
                          items: element
                              .map((map) => DropdownMenuItem(
                                  value: map['items'],
                                  child: Text("$map")))
                              .toList(),
                        ),
                ),
              ],
            ),
          ),
        ));
  }
}
