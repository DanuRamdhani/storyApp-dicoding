import 'package:flutter/gestures.dart';
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
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email Addres',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.contains('@')) {
                    return 'Please enter a valid email addres.';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  authProv.enteredEmail = newValue!;
                },
              ),
              if (!authProv.isLoginForm) const SizedBox(height: 8),
              if (!authProv.isLoginForm)
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Fullname',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.name,
                  autocorrect: false,
                  validator: (value) {
                    if (value == null ||
                        value.trim().isEmpty ||
                        value.trim().length < 4) {
                      return 'Fullname must be at least 4 characters long.';
                    }

                    return null;
                  },
                  onSaved: (newValue) {
                    authProv.enteredFullname = newValue!;
                  },
                ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: authProv.isCantSeePwChange,
                    icon: const Icon(Icons.remove_red_eye_rounded),
                  ),
                ),
                obscureText: authProv.isCantSeePw,
                validator: (value) {
                  if (value == null || value.trim().length < 8) {
                    return 'Password must be at least 8 characters long.';
                  }

                  return null;
                },
                onSaved: (newValue) {
                  authProv.enteredPassword = newValue!;
                },
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => authProv.submit(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: context.color.primary,
                  foregroundColor: Colors.white,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: authProv.isAuthenticating
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: context.color.onPrimary,
                            ),
                          )
                        : Text(authProv.isLoginForm ? 'Log in' : 'Sign up'),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  text: authProv.isLoginForm
                      ? 'Create an account!  '
                      : 'Already have an account?  ',
                  style: TextStyle(
                    color: context.color.onBackground,
                  ),
                  children: [
                    TextSpan(
                      text: authProv.isLoginForm ? 'Signup' : 'Login',
                      style: TextStyle(
                        color: context.color.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = authProv.isLoginChange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
