import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map> textBoxes = [
      {
        'attribute': 'firstName',
        'labelText': 'Fever',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        
        ...textBoxes
            .map(
              (item) => FormBuilderTextField(
                attribute: 'Surname',
                maxLines: 1,
                textAlign: TextAlign.center,
                validators: [
                  FormBuilderValidators.required(),
                ],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Surname',
                    labelStyle: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.black38)),
                style: Theme.of(context).textTheme.headline4,
              ),
            )
            .toList(),
      ],
    );
  }
}
