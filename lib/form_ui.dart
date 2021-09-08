import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import 'package:zapdart/widgets.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField(Widget title, bool initialValue,
      {FormFieldSetter<bool>? onChanged,
      FormFieldSetter<bool>? onSaved,
      FormFieldValidator<bool>? validator,
      bool autovalidate = false})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (FormFieldState<bool> state) {
              return CheckboxListTile(
                dense: state.hasError,
                title: title,
                value: state.value,
                onChanged: (value) {
                  state.didChange(value);
                  if (onChanged != null) onChanged(value);
                },
                subtitle: state.hasError
                    ? Builder(
                        builder: (BuildContext context) => Text(
                          '${state.errorText}',
                          style: TextStyle(color: Theme.of(context).errorColor),
                        ),
                      )
                    : null,
                controlAffinity: ListTileControlAffinity.leading,
              );
            });
}

class AccountUpdateEmailForm extends StatefulWidget {
  final String? instructions;

  AccountUpdateEmailForm({this.instructions}) : super();

  @override
  AccountUpdateEmailFormState createState() {
    return AccountUpdateEmailFormState();
  }
}

class AccountUpdateEmailFormState extends State<AccountUpdateEmailForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailController2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(),
          preferredSize: Size(0, 0),
        ),
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text(widget.instructions == null
                        ? 'Enter your new email address'
                        : widget.instructions!),
                    TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'New Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Please enter an email';
                          if (!EmailValidator.validate(value))
                            return 'Invalid email';
                          return null;
                        }),
                    TextFormField(
                        controller: _emailController2,
                        decoration:
                            InputDecoration(labelText: 'New Email Again'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value != _emailController.text)
                            return 'Email does not match';
                          return null;
                        }),
                    raisedButton(
                      child: Text('Ok'),
                      onPressed: () {
                        if (_formKey.currentState == null) return;
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pop(_emailController.text);
                        }
                      },
                    ),
                    raisedButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )))));
  }
}
