import 'package:covid_monitoring/models/PUIProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PUIForm extends StatefulWidget {
  PUIForm({Key key}) : super(key: key);

  @override
  _PUIFormState createState() => _PUIFormState();
}

class _PUIFormState extends State<PUIForm> {
  bool _isLoading = false;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    

    _savePUIForm({BuildContext context}) async {
        setState(() {
        _isLoading = true;
      });

      if (_formKey.currentState.saveAndValidate()) {
        var formVals = _formKey.currentState.value;

        final response =
          await Provider.of<PUIProvider>(context, listen: false)
              .savePUIForm(formVals);

        if (response['error'] != null) {
          setState(() {
            _isLoading = false;
          });
          return;
        }
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
                  child: Text('Please fill up all the fields',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.blue[900],
                          )),
                ),
                ...inputs.map((item) {
                  switch (item['type']) {
                    case FormBuilderTextField:
                      // print(item['required'].runtimeType);
                      return FormBuilderTextField(
                        attribute: item['attribute'],
                        validators: [...item['validators']],
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: item['label']),
                      );
                      break;
                    case FormBuilderDateTimePicker:
                      // print(item['validators'].runtimeType);
                      return FormBuilderDateTimePicker(
                        attribute: item['attribute'],
                        inputType: item['inputType'],
                        firstDate: item['firstDate'],
                        decoration: InputDecoration(labelText: item['label']),
                        validators: [...item['validators']],
                      );
                    case FormBuilderDropdown:
                      return FormBuilderDropdown(
                          attribute: item['attribute'],
                          decoration: InputDecoration(
                            labelText: item['label'],
                          ),
                          // initialValue: 'Male',
                          hint: Text(item['hint']),
                          validators: [
                            ...item['validators']
                          ],
                          items: [
                            ...item['selections']
                                .map((items) => DropdownMenuItem(
                                    value: items, child: Text("$items")))
                                .toList(),
                          ]);

                    default:
                      return Text('');
                  }
                }).toList(),

                _isLoading
                ? 
                  CircularProgressIndicator()
                :
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
        ));
  }
}
