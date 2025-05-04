import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_tech_intern/core/helpers/secure_storage_service.dart';
import 'package:sadeem_tech_intern/core/networking/api_error_handler.dart';
import 'package:sadeem_tech_intern/features/cart_page/controller/cubit/cart_state.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/repos/cart_repo.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartCubit(this._cartRepo) : super(CartState.initial());

  Future<void> addProduct(int productId, int quantity) async {
    try {
      emit(CartState.loading());
      await _cartRepo.addItemToCart(productId, quantity);
      emit(CartState.success());
    } catch (e) {
      emit(CartState.error(e.toString()));
    }
  }

  Future<void> getUserCart() async {
    emit(CartState.userCartloading());
    final userId = await SecureStorageService.getUserId();
    final result = await _cartRepo.getUserCart(userId);
    result.when(
      success: (data) {
        emit(CartState.userCartsuccess(data));
      },
      failure: (apiErrorModel) {
        emit(CartState.userCarterror(apiErrorModel.message!));
      },
    );
  }
}
