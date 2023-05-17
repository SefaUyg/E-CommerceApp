import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:ecommerce_app/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/scaffold.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavBar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Container(
          height: 70,
          child: (screen == '/product') 
          ? AddToCartNavBar(product: product!) : (screen == '/cart') 
          ? GoToCheckoutNavBar() : (screen == '/checkout')
          ? OrderNowNavBar() : HomeNavBar(),
        ),
      ),
    );
  }
}

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          icon: Icon(Icons.home, color: Colors.white)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          icon: Icon(Icons.shopping_cart, color: Colors.white)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          icon: Icon(Icons.person, color: Colors.white)),
      ],
    );
  }
}

class OrderNowNavBar extends StatelessWidget{
  const OrderNowNavBar({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CheckoutLoaded){
            return ElevatedButton(
            onPressed: () {
              context.read<CheckoutBloc>().add(ConfirmCheckout(checkout: state.checkout));
              Navigator.pushNamed(context, '/order-confirmation');
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.white, shape: RoundedRectangleBorder()),
            child:
                Text('ORDER NOW', style: Theme.of(context).textTheme.headline3),
          );
          }
          else{
            return Text('Something went wrong!');
          }
        },
      )
      ],
    );
  }
}

class GoToCheckoutNavBar extends StatelessWidget {
  const GoToCheckoutNavBar({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/checkout');
          },
          style: ElevatedButton.styleFrom(
              primary: Colors.white, shape: RoundedRectangleBorder()),
          child: Text('GO TO CHECKOUT',
              style: Theme.of(context).textTheme.headline3))
      ],
    );
  }
}

class AddToCartNavBar extends StatelessWidget {
  const AddToCartNavBar({Key? key, required this.product}) : super(key:key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {}, icon: Icon(Icons.share, color: Colors.white)),
      BlocBuilder<WishlistBloc, WishlistState>(builder: (context, state) {
        if (state is WishlistLoading) {
          return CircularProgressIndicator();
        }
        if (state is WishlistLoaded) {
          return IconButton(
              icon: Icon(Icons.favorite, color: Colors.white),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to your Wishlist')));
                context.read<WishlistBloc>().add(AddProductToWishlist(product));
              });
        }
        return Text('Something went wrong!');
      }),
      BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          return ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, shape: RoundedRectangleBorder()),
              onPressed: () {
                context.read<CartBloc>().add(AddProduct(product));
                Navigator.pushNamed(context, '/cart');
              },
              child: Text('ADD TO CART',
                  style: Theme.of(context).textTheme.headline3!));
        }
        return Text('Something went wrong!');
      })
      ],
    );
  }
}