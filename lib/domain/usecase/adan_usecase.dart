import 'package:either_dart/either.dart';

import '../../data/model/Parameters.dart';
import '../../data/model/errors/server_error.dart';
import '../../data/model/get_all_timing_response.dart';
import '../repository/base_adan_repository.dart';
import 'basic_usecase/base_usecase.dart';

class AdanUseCase extends BaseUseCase<GetAllTimingsResponse, Parameters> {
  final BaseAdanRepository repository;

  AdanUseCase(this.repository);

  @override
  Future<Either<ServerErrorResponse, GetAllTimingsResponse>> call(
      Parameters parameters) async {
    return await repository.adanTime(parameters);
  }
}
