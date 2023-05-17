import 'package:ecommerce_app/cubits/login/login_cubit.dart';
import 'package:ecommerce_app/cubits/signup/signup_cubit.dart';
import 'package:ecommerce_app/repositories/auth/auth_repository.dart';
import 'package:ecommerce_app/repositories/category/category_repository.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:ecommerce_app/repositories/product/product.repository.dart';
import 'package:ecommerce_app/repositories/user/user_repository.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth/auth_bloc.dart';
import 'config/app_router.dart';
import 'config/theme.dart';
import 'firebase_options.dart';
import '/blocs/blocs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SUMBU E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider(
            create: (context) => AuthRepository(userRepository: context.read<UserRepository>()),
          ),
        ],
        child: MultiBlocProvider(
        providers: [
        BlocProvider(create: (context) => AuthBloc(authRepository: context.read<AuthRepository>(), userRepository: context.read<UserRepository>())),
        BlocProvider(create: (_) => WishlistBloc()..add(LoadWishlist())),
        BlocProvider(create: (_) => CartBloc()..add(LoadCart())),
        BlocProvider(create: (context) => CheckoutBloc(authBloc: context.read<AuthBloc>(), cartBloc: context.read<CartBloc>(), checkoutRepository: CheckoutRepository())),
        BlocProvider(create: (_) => CategoryBloc(categoryRepository: CategoryRepository())..add(LoadCategories())),
        BlocProvider(create: (_) => ProductBloc(productRepository: ProductRepository())..add(LoadProducts())),
        BlocProvider(create: (context) => LoginCubit(authRepository: context.read<AuthRepository>())),
        BlocProvider(create: (context) => SignupCubit(authRepository: context.read<AuthRepository>())),
      ],
      child: MaterialApp(
        title: 'SUMBU E-Commerce',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
      )
    )
    );
  }
}
