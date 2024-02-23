import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/auth_provider.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProv, _) {
        return Form(
          key: authProv.form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: context.localizations.email,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 245, 239, 232),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.contains('@')) {
                    return context.localizations.validationEmail;
                  }

                  return null;
                },
                onSaved: (newValue) {
                  authProv.enteredEmail = newValue!;
                },
              ),
              if (!authProv.isLoginForm) const SizedBox(height: 16),
              if (!authProv.isLoginForm)
                TextFormField(
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: context.localizations.name,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 245, 239, 232),
                  ),
                  keyboardType: TextInputType.name,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value.trim().length < 4) {
                      return context.localizations.validationName;
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    authProv.enteredFullname = newValue!;
                  },
                ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: context.localizations.password,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 245, 239, 232),
                  suffixIcon: IconButton(
                    onPressed: authProv.isCantSeePwChange,
                    icon: Icon(
                      authProv.isCantSeePw
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                ),
                obscureText: authProv.isCantSeePw,
                validator: (value) {
                  if (value == null || value.trim().length < 8) {
                    return context.localizations.validationPw;
                  }

                  return null;
                },
                onSaved: (newValue) {
                  authProv.enteredPassword = newValue!;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => authProv.submit(context),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(46),
                ),
                child: authProv.isAuthenticating
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          backgroundColor: context.color.onPrimary,
                        ),
                      )
                    : Text(
                        authProv.isLoginForm
                            ? context.localizations.loginButton
                            : context.localizations.registerButton,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed:
                    authProv.isAuthenticating ? null : authProv.isLoginChange,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 245, 239, 232),
                  foregroundColor: Colors.black,
                  fixedSize: const Size.fromHeight(46),
                ),
                child: Text(
                  authProv.isLoginForm
                      ? context.localizations.loginGoButton
                      : context.localizations.regGoButton,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
