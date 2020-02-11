import 'package:dio/dio.dart';


// class MsgError implements Exception {
//    final message;

//   MsgError([this.message]);

//   String toString() {
//     if (message == null) return "Exception";
//     return "Exception: $message";
//   }
// }
class MyInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    //TODO: add token
    // TODO: is token will be expired, refresh token here
    const token = "good";
    options.headers["authorization"] = 'Bear $token';
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    if (400 < response?.statusCode ?? 0 ) {
      var errorRes = response?.data ?? Map();
      // trigger UI msg for validate error
      throw Exception('${errorRes["msg"] ?? "验证错误"}');
    }
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.response}");
    return super.onError(err);
  }
}

// or new Dio with a BaseOptions instance.
BaseOptions options = new BaseOptions(
  baseUrl: "http://www.mocky.io/v2",
  connectTimeout: 5000,
  receiveTimeout: 3000,
  // validateStatus: (int status) {
  //   return status >= 200 && status < 500 || status == 304;
  // },
);



class HttpUtils {
  Dio _dio;

  HttpUtils(BaseOptions options) {
    _dio = new Dio(options);
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors.add(MyInterceptors());
  }

  Future get(String path, Map queryParameters) {
    return this._dio.get(path, queryParameters: queryParameters);
  }

  Future post(String path, dynamic data) {
    return this._dio.post(path, data: data);
  }
}

Dio http = new HttpUtils(options)._dio;

Future getMock() async {
  try {
    await http.get('/5e4253872f0000620087f445');
  } on DioError catch (e) {
    print("Error catch");
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx and is also not 304.
    if (e.response != null) {
      print("response isNotNull");
      print(e.response.data);
      print(e.response.headers);
      print(e.response.request);
    } else {
      print("response is Null");
      // Something happened in setting up or sending the request that triggered an Error
      print(e.request);
      print(e.message);
    }
  }
}
