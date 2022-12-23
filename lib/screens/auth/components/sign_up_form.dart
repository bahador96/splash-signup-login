import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:health_application/constants.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey formKey;

  const SignUpForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late String _username, _email, _password, _phonenumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldName(text: 'Username'),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'test',
            ),
            validator: RequiredValidator(errorText: "Username is required"),
            onSaved: (username) => _username = username!,
          ),
          const SizedBox(height: defaultPadding),
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
          const TextFieldName(text: 'Phone'),
          TextFormField(
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              hintText: '+989121111111',
            ),
            validator:
                RequiredValidator(errorText: "Phone number is required "),
            onSaved: (phoneNumber) => _phonenumber = phoneNumber!,
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
          const TextFieldName(text: 'Confirm password'),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: '******',
            ),
            validator: (pass) =>
                MatchValidator(errorText: "Password do not  match")
                    .validateMatch(pass!, _password),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('_username', _username));
    properties.add(StringProperty('_email', _email));
    properties.add(StringProperty('_phonenumber', _phonenumber));
  }
}

class TextFieldName extends StatelessWidget {
  final String text;
  const TextFieldName({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 3),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    );
  }
}
