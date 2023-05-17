import 'package:ecommerce_app/cubits/signup/signup_cubit.dart';
import 'package:ecommerce_app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/widgets/custom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  static const String routeName = '/signup';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SignUp'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _UserInput(
                      onChanged: (value) {
                        context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(email: value),
                            );
                      },
                      labelText: 'Email'),
                  const SizedBox(height: 10),
                  _UserInput(onChanged: (value) {
                    context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(fullName: value),
                            );
                  }, labelText: 'Full Name'),
                  const SizedBox(height: 10),
                  _UserInput(onChanged: (value) {
                    context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(country: value),
                            );
                  }, labelText: 'Country'),
                  const SizedBox(height: 10),
                  _UserInput(onChanged: (value) {
                    context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(city: value),
                            );
                  }, labelText: 'City'),
                  const SizedBox(height: 10),
                  _UserInput(onChanged: (value) {
                    context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(address: value),
                            );
                  }, labelText: 'Address'),
                  const SizedBox(height: 10),
                  _UserInput(onChanged: (value) {
                    context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(groupName: value),
                            );
                  }, labelText: 'Group Name'),
                  const SizedBox(height: 10),
                  _UserInput(onChanged: (value) {
                    context.read<SignupCubit>().userChanged(
                              state.user!.copyWith(skills: value),
                            );
                  }, labelText: 'Skills'),
                  const SizedBox(height: 10),
                  _PasswordInput(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                        context.read<SignupCubit>().signUpWithCredentials();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        primary: Colors.black,
                        fixedSize: Size(200, 40),
                      ),
                      child: Text(
                        'SignUp',
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _UserInput extends StatelessWidget {
  const _UserInput({
    Key? key,
    required this.onChanged,
    required this.labelText,
  }) : super(key: key);

  final Function(String)? onChanged;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextField(
          onChanged: onChanged,
          decoration: InputDecoration(labelText: labelText),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<SignupCubit>().passwordChanged(password);
          },
          decoration: InputDecoration(labelText: 'Password'),
          obscureText: true,
        );
      },
    );
  }
}
