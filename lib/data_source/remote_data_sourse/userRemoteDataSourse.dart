import 'package:bakery_app/app/constant.dart';
import 'package:bakery_app/data_source/remote_data_sourse/remote/LoginResponse.dart';
import 'package:dio/dio.dart';

import '../../helper/http_services.dart';
import '../../model/user.dart';

class UserRemoteDataSourse {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<int> addUser(User user) async {
    try {
      FormData formData = FormData.fromMap({
        'fname': user.fname,
        'lname': user.lname,
        'email': user.email,
        'password': user.password,
      });

      Response response = await _httpServices.post(
        Constant.registerUser,
        data: formData,
      );
      if (response.statusCode == 201) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<bool> loginUser(String email, String password) async {
    try {
      Response response = await _httpServices.post(
        Constant.loginUser,
        data: {
          'username': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        Constant.token = "Bearer ${loginResponse.token!}";
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
