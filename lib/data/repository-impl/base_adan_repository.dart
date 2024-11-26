import 'dart:convert';

import 'package:either_dart/either.dart';
import '../../domain/repository/base_adan_repository.dart';
import '../data_source/remote_data_source/adan_remote_data_source.dart';
import '../model/Parameters.dart';
import '../model/errors/server_error.dart';
import '../model/get_all_timing_response.dart';

class AdanRepositoryImp extends BaseAdanRepository {
  final BaseAdanRemoteDataSource baseRemoteDataSource;

  AdanRepositoryImp(this.baseRemoteDataSource);

  @override
  Future<Either<ServerErrorResponse, GetAllTimingsResponse>> adanTime(
      Parameters parameters) async {
    final result = await baseRemoteDataSource.adanTime(parameters);
    try {
      return Right(GetAllTimingsResponse.fromJson(result));
    } catch (failure) {
      Map<String, dynamic> jsonData = json.decode(result.toString());
      print(result.toString());
      return Left(ServerErrorResponse.fromJson(jsonData));
    }
  }
}
