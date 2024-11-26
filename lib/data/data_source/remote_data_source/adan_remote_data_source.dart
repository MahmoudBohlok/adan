
import '../../../core/api_service/dio_helper.dart';
import '../../../core/constants/api_constants.dart';
import '../../model/Parameters.dart';

abstract class BaseAdanRemoteDataSource {

  Future<dynamic> adanTime(Parameters parameters);

}

class AdanRemoteDataSource extends BaseAdanRemoteDataSource {
  final DioHelper dioHelper;

  AdanRemoteDataSource(this.dioHelper);
  @override
  Future adanTime(Parameters parameters)async {
      final response = await dioHelper.get(
        endPoint: ApiUrls.Endpoint,
        query: {
          'latitude' : parameters.latitude,
          'longitude' : parameters.longitude,
          'method' : "METHOD",
        },
      );
      return response;
    }


  }

