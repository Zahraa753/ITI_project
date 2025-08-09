import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/products_pages/API_model.dart';
import 'package:flutter_application_1/login/create_moder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiProvider {
  static const String baseUrl = 'https://dummyjson.com';
  late ApiAcs productmodelAPI;

  Future getProducts() async {
    final response = await Dio().get(
      '$baseUrl/products',
      queryParameters: {
        'select': 'id,title,description,category,price,thumbnail',
      },
    );

    if (response.statusCode == 200) {
      productmodelAPI = ApiAcs.fromJson(response.data);
      return productmodelAPI;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future Login(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    FormData formData = FormData.fromMap({
      'username': email,
      'password': password,
    });

    final response = await Dio().post('$baseUrl/auth/login', data: formData);

    if (response.statusCode == 200) {
      prefs.setString('token', response.data['accessToken']);
      // print(response.data);
      return response.data; // Return the login response
    } else {
      throw Exception('Login failed');
    }
  }

  late UserModel userModel;

  Future<UserModel> getuserData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('zahraa')
        .get()
        .then((value) {
          userModel = UserModel.fromJson(value.data()!);
          print(value.data());
        });
    return userModel;
  }

  // Add other API methods as needed
}
