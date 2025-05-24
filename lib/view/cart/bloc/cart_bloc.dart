// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:intro_to_bloc4/model/cart_model.dart';
import 'package:intro_to_bloc4/model/product_model.dart';
import 'package:intro_to_bloc4/repositories/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ProductRepository productRepository;
  CartModel cart = CartModel(prodcuts: [], id: 1, totalPrice: 0);

  CartBloc(this.productRepository) : super(CartInitial()) {
    on<ViewCart>((event, emit) async {
      emit(LoadingCart());
      try {
        final products = await productRepository.getProducts();
        cart.prodcuts = products;
        cart.calculatePrice();
        emit(CartLoaded(cart: cart));
      } catch (e) {
        emit(ErrorToLoad());
      }
    });

    on<IncreasProductQuintity>((event, emit) {
      for (var i = 0; i < cart.prodcuts.length; i++) {
        if (cart.prodcuts[i].id == event.id) {
          cart.prodcuts[i].quintity++;
        }
      }
      cart.calculatePrice();
      emit(CartLoaded(cart: cart));
    });

    on<ViewOneProduct>((event, emit) {
      final product = cart.prodcuts.firstWhere((element) => element.id == event.id);
      emit(Productloaded(product: product));
    });

    on<IncreasProductQuintityFromDetails>((event, emit) {
      for (var i = 0; i < cart.prodcuts.length; i++) {
        if (cart.prodcuts[i].id == event.id) {
          cart.prodcuts[i].quintity++;
        }
      }
      cart.calculatePrice();
      final product = cart.prodcuts.firstWhere((element) => element.id == event.id);
      emit(Productloaded(product: product));
    });
  }
}
