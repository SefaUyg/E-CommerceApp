import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/blocs/auth/auth_bloc.dart';
import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/models/cart_model.dart';
import 'package:ecommerce_app/models/model.dart';
import 'package:ecommerce_app/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final AuthBloc _authBloc;
  final CartBloc _cartBloc;
  final CheckoutRepository _checkoutRepository;
  StreamSubscription? _authSubscription;
  StreamSubscription? _cartSubscription;
  StreamSubscription? _checkoutSubscription;

  CheckoutBloc({
    required AuthBloc authBloc,
    required CartBloc cartBloc,
    required CheckoutRepository checkoutRepository,
  }) : 
  _authBloc = authBloc,
  _cartBloc = cartBloc,
  _checkoutRepository = checkoutRepository,
  super(
    cartBloc.state is CartLoaded ? CheckoutLoaded(
      user: authBloc.state.user,
      products: (cartBloc.state as CartLoaded).cart.products,
      subtotal: (cartBloc.state as CartLoaded).cart.subtotalString,
      deliveryFee: (cartBloc.state as CartLoaded).cart.deliveryFeeString,
      total: (cartBloc.state as CartLoaded).cart.totalString,
    ) : CheckoutLoading()) {
      on<UpdateCheckout>(_onUpdateCheckout);
      on<ConfirmCheckout>(_onConfirmCheckout);

      _authSubscription = _authBloc.stream.listen((state) {
        if(state.status == AuthStatus.unauthenticated){
          add(UpdateCheckout(user: User.empty));
        } else{
          add(UpdateCheckout(user: state.user));
        }
      });

      _cartSubscription = cartBloc.stream.listen((state){
        if(state is CartLoaded){
          add(UpdateCheckout(cart: state.cart));
        }
      }
      );
    }

    void _onUpdateCheckout(
      UpdateCheckout event,
      Emitter<CheckoutState> emit,
    ) {
      final state = this.state;
      if(state is CheckoutLoaded){
        emit (CheckoutLoaded(
          user: event.user ?? state.user,
          products: event.cart?.products ?? state.products,
          deliveryFee: event.cart?.deliveryFeeString ?? state.deliveryFee,
          subtotal: event.cart?.subtotalString ?? state.subtotal,
          total: event.cart?.totalString ?? state.total,
        ),
        );
      }
    }

    void _onConfirmCheckout(
      ConfirmCheckout event,
      Emitter<CheckoutState> emit,
    ) async{
      _checkoutSubscription?.cancel();
      if(state is CheckoutLoaded){
        try{
          await _checkoutRepository.addCheckout(event.checkout);
          print('Done');
          emit (CheckoutLoading());
        } catch(_) {}
      }
    }

    @override
    Future<void> close(){
      _authSubscription?.cancel();
      _cartSubscription?.cancel();
      return super.close();
    }
}
