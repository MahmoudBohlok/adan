import 'package:either_dart/either.dart';


import '../../../data/model/errors/server_error.dart';



abstract class BaseUseCase<T,Parameters>
{
  Future<Either<ServerErrorResponse,T>>call(Parameters parameters);
}abstract class BaseUseCaseNoparameters<T>
{
  Future<Either<ServerErrorResponse,T>>call( );
}
