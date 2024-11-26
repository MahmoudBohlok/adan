import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/Parameters.dart';
import '../../../domain/usecase/adan_usecase.dart';
import 'orders_states.dart';

class AdanCubit extends Cubit<AdanStates> {
  AdanCubit(
    this.changeStatusOrderUseCase,
  ) : super(AdanInitialState());

  AdanUseCase? changeStatusOrderUseCase;

  static AdanCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  Future<dynamic> changeStatusOrder({Parameters? parameters}) async {
    emit(AdanLoadingState());
    dynamic response;
    try {
      response = await changeStatusOrderUseCase!(parameters!);
    } catch (e) {}
    response.fold(
      (error) => emit(AdanErrorState(error)),
      (authResponse) {
        emit(AdanSuccessState(authResponse));
      },
    );
  }
}
