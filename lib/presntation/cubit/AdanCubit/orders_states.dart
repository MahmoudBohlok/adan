
import '../../../data/model/errors/server_error.dart';
import '../../../data/model/get_all_timing_response.dart';


abstract class AdanStates {}

class AdanInitialState extends AdanStates {}

class AdanLoadingState extends AdanStates {}

class AdanSuccessState extends AdanStates {
  final GetAllTimingsResponse response;

  AdanSuccessState(this.response);
}

class AdanErrorState extends AdanStates {
  final ServerErrorResponse error;

  AdanErrorState(this.error);
}
