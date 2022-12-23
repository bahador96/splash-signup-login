import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:health_application/constants.dart';
import 'package:health_application/screens/auth/components/sign_up_form.dart';

class SignInForm extends StatefulWidget {
  final GlobalKey formKey;

  const SignInForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: 'Email'),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'test@gmail.com',
            ),
            validator: EmailValidator(errorText: "Use a valid email"),
            onSaved: (email) => _email = email!,
          ),
          const SizedBox(height: defaultPadding),
          const TextFieldName(text: 'Password'),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: '******',
            ),
            validator: passwordValidator,
            onSaved: (password) => _password = password!,
            onChanged: (pass) => _password = pass,
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_email', _email));
    properties.add(StringProperty('_password', _password));
  }
}
