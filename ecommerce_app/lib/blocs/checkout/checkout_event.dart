part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCheckout extends CheckoutEvent{
  final User? user;
  final List<Product>? products;
  final Cart? cart;

  UpdateCheckout({this.user, this.products, this.cart});

  @override
  List<Object?> get props => [user, cart];
}

class ConfirmCheckout extends CheckoutEvent{
  final Checkout checkout;

  const ConfirmCheckout({required this.checkout});

  @override
  List<Object?> get props => [checkout];
}
