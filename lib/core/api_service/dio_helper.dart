import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class DioHelper {
  Future<dynamic> post({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> delete({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> postForm({
    String? base,
    required String endPoint,
    dynamic dataForm,
    dynamic query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> postForm2({
    String? base,
    required String endPoint,
    dynamic dataForm,
    dynamic query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> put({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });

  Future<dynamic> get({
    String? base,
    required String endPoint,
    dynamic data,
    dynamic query,
    String? Authorization,
    String? lang,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  });
}

class DioHelperImpl implements DioHelper {
  final Dio dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future get({
    String? base,
    required String endPoint,
    data,
    query,
    String? Authorization,
    String? lang,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (Authorization != null) 'Authorization': "Bearer $Authorization",
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await request(
      call: () async => await dio.get(
        endPoint,
        queryParameters: query,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future post({
    String? base,
    required String endPoint,
    data,
    query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (Authorization != null) 'Authorization': "Bearer $Authorization",
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await request(
      call: () async => await dio.post(
        "${dio.options.baseUrl + endPoint}",
        data: data,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future delete({
    String? base,
    required String endPoint,
    data,
    query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (Authorization != null) 'Authorization': "Bearer $Authorization",
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await request(
      call: () async => await dio.delete(
        "${dio.options.baseUrl + endPoint}",
        data: data,
        queryParameters: query,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future postForm({
    String? base,
    required String endPoint,
    dataForm,
    query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (Authorization != null) 'Authorization': "Bearer $Authorization",
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $dataForm');
    debugPrint('Query => $query');

    return await request(
      call: () async => await dio.post(
        "${dio.options.baseUrl + endPoint}",
        data: dataForm,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future postForm2({
    String? base,
    required String endPoint,
    dataForm,
    query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (Authorization != null) 'Authorization': "Bearer $Authorization",
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $dataForm');
    debugPrint('Query => $query');

    return await request2(
      call: () async => await dio.post(
        "${dio.options.baseUrl + endPoint}",
        data: dataForm,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }

  @override
  Future put({
    String? base,
    required String endPoint,
    data,
    query,
    String? Authorization,
    String? lang,
    ProgressCallback? progressCallback,
    CancelToken? cancelToken,
    int? timeOut,
    bool isMultipart = false,
  }) async {
    dio.options.headers = {
      if (isMultipart) 'Content-Type': 'multipart/form-data',
      if (!isMultipart) 'Content-Type': 'application/json',
      if (!isMultipart) 'Accept': 'application/json',
      if (Authorization != null) 'Authorization': "Bearer $Authorization",
    };

    debugPrint('URL => ${dio.options.baseUrl + endPoint}');
    debugPrint('Header => ${dio.options.headers.toString()}');
    debugPrint('Body => $data');
    debugPrint('Query => $query');

    return await request(
      call: () async => await dio.put(
        endPoint,
        data: data,
        queryParameters: query,
        onSendProgress: progressCallback,
        cancelToken: cancelToken,
      ),
    );
  }
}

extension on DioHelper {
  Future request({
    required Future<Response> Function() call,
  }) async {
    late final r;
    try {
      r = await call.call();
      debugPrint('Response_Data => ${r.data}');
      debugPrint('Response_Code => ${r.statusCode}');
      return r.data;
    } on DioError catch (e) {
      debugPrint('Error_Message => ${e.message}');
      debugPrint('Error_Error => ${e.error.toString()}');
      debugPrint('Error_Type => ${e.type.toString()}');
      // print(r.toString());
      // if(e.message.contains("444"))
      // return
      //   Failure(status:"444",messages: "لقد انتهت الجلسة الخاصة بك ,يرجي تسجيل الدخول مرة اخري");
      // else{

// print();
      return e.response;
      // Failure(status:e.error.toString(),messages: e.response.toString());

      // }
      // ServerFailure.fromJson(e.response!.data as Map<String, dynamic>);

      // ServerFailure(messages: e.response!.data["message"],status: e.response!.data["status"],errors: e.response!.data["errors"]

      // );
    } catch (e) {
      print("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
      ServerException exception = e as ServerException;
      throw ServerException(
        statusErrorMessageModel: exception.statusErrorMessageModel,
      );
    }
  }

  Future request2({
    required Future<Response> Function() call,
  }) async {
    late final r;
    try {
      r = await call.call();
      debugPrint('Response_Data => ${r.data}');
      debugPrint('Response_Code => ${r.statusCode}');
      return r.data;
    } on DioError catch (e) {
      debugPrint('Error_Message => ${e.message}');
      debugPrint('Error_Error => ${e.error.toString()}');
      debugPrint('Error_Type => ${e.type.toString()}');
      // print(r.toString());
      if (e.message!.contains("444"))
        return e.response;
      // Failure(status:"444",messages: "لقد انتهت الجلسة الخاصة بك ,يرجي تسجيل الدخول مرة اخري");
      else {
// print();
        return e.response;
        // Failure(status:e.error.toString(),messages: e.response.toString());
      }
      // ServerFailure.fromJson(e.response!.data as Map<String, dynamic>);

      // ServerFailure(messages: e.response!.data["message"],status: e.response!.data["status"],errors: e.response!.data["errors"]

      // );
    } catch (e) {
      ServerException exception = e as ServerException;
      throw ServerException(
        statusErrorMessageModel: exception.statusErrorMessageModel,
      );
    }
  }
}

class ServerException implements Exception {
  final StatusErrorMessageModel statusErrorMessageModel;

  ServerException({
    required this.statusErrorMessageModel,
  });
}

class StatusErrorMessageModel {
  final String error;
  final String message;
  final int code;

  const StatusErrorMessageModel({
    required this.error,
    required this.message,
    required this.code,
  });

  factory StatusErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return StatusErrorMessageModel(
      error: json['error'],
      message: json['message'],
      code: json['code'],
    );
  }

  @override
  List<Object?> get props => [
        error,
        message,
        code,
      ];
}
