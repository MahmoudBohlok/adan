import 'package:either_dart/either.dart';


import '../../data/model/Parameters.dart';
import '../../data/model/errors/server_error.dart';
import '../../data/model/get_all_timing_response.dart';

abstract class BaseAdanRepository
{
  Future<Either<ServerErrorResponse,GetAllTimingsResponse>>adanTime(Parameters parameters);

}
