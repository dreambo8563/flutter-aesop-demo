import 'package:dio/dio.dart';

void getHttp() async {
  Response response;
  Dio dio = new Dio();
  try {
    response = await dio.get("https://randomuser.me/api/");
    print(response.data.toString());
  } catch (e) {
    print(e);
  }
}
