import 'package:ecommerce_app/blocs/auth/auth_bloc.dart';
import 'package:ecommerce_app/blocs/profile/profile_bloc.dart';
import 'package:ecommerce_app/repositories/auth/auth_repository.dart';
import 'package:ecommerce_app/repositories/user/user_repository.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => BlocProvider<ProfileBloc>(
              create: (context) => ProfileBloc(
                authBloc: context.read<AuthBloc>(),
                userRepository: context.read<UserRepository>(),
              )..add(LoadProfile(context.read<AuthBloc>().state.authUser)),
              child: ProfileScreen(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is ProfileLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('CUSTOMER INFORMATION', style: Theme.of(context).textTheme.headline3),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: 'Email',
                    initialValue: state.user.email,
                    onChanged: (value){
                      context.read<ProfileBloc>().add(
                        UpdateProfile(
                          user: state.user.copyWith(email: value)));
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: 'Full Name',
                    initialValue: state.user.fullName,
                    onChanged: (value){
                      context.read<ProfileBloc>().add(
                        UpdateProfile(
                          user: state.user.copyWith(fullName: value)));
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: 'Address',
                    initialValue: state.user.address,
                    onChanged: (value){
                      context.read<ProfileBloc>().add(
                        UpdateProfile(
                          user: state.user.copyWith(address: value)));
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: 'City',
                    initialValue: state.user.city,
                    onChanged: (value){
                      context.read<ProfileBloc>().add(
                        UpdateProfile(
                          user: state.user.copyWith(city: value)));
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: 'Country',
                    initialValue: state.user.country,
                    onChanged: (value){
                      context.read<ProfileBloc>().add(
                        UpdateProfile(
                          user: state.user.copyWith(country: value)));
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: 'Group Name',
                    initialValue: state.user.groupName,
                    onChanged: (value){
                      context.read<ProfileBloc>().add(
                        UpdateProfile(
                          user: state.user.copyWith(groupName: value)));
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: 'Skills',
                    initialValue: state.user.skills,
                    onChanged: (value){
                      context.read<ProfileBloc>().add(
                        UpdateProfile(
                          user: state.user.copyWith(skills: value)));
                    },
                  ),
                  Expanded(child: Container()),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                        context.read<AuthRepository>().signOut();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        primary: Colors.black,
                        fixedSize: Size(200, 40),
                      ),
                      child: Text('Sign Out'),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is ProfileUnauthenticated) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'You\'re not logged in!',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  primary: Colors.black,
                  fixedSize: Size(200, 40),
                ),
                child: Text('Login', style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  primary: Colors.white,
                  fixedSize: Size(200, 40),
                ),
                child: Text('SignUp', style: Theme.of(context).textTheme.headline5),
              ),
              ],
            );
          } else {
            return Text('Something went wrong!');
          }
        },
      ),
    );
  }
}