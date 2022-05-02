import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task1/constant/string.dart';
import 'package:task1/model/cards/custom_card.dart';
import 'package:task1/model/customer/create_customer_model.dart';
import 'package:task1/model/customer/get_cutomer_model.dart';

class CustomerApiCalling {
  //^ post
  Future<CustomModal<CreateCustomerModel>> createApiCustomer(
      {required String description, required String name}) async {
    final postData = {
      "description": description,
      "Name": name,
    };
    final response = await http.post(
      Uri.parse(Strings.url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${Strings.secretKey}',
      },
      body: json.encode(postData),
    );

    if (response.statusCode == 200) {
      return CustomModal<CreateCustomerModel>(
        data: CreateCustomerModel.fromJson(jsonDecode(response.body)),
        status: 200,
      );
    } else {
      return CustomModal<CreateCustomerModel>(status: 401);
    }
  }

  //^ get customer
  Future<CustomModal<GetCustomerModel>> getCustomers() async {
    final res = await http.get(
      Uri.parse(Strings.url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${Strings.secretKey}',
      },
    );

    if (res.statusCode == 200) {
      return CustomModal<GetCustomerModel>(
        data: GetCustomerModel.fromJson(jsonDecode(res.body)),
        status: 200,
      );
    } else {
      return CustomModal<GetCustomerModel>(status: 400);
    }
  }

//^ delet customer
  Future<CustomModal<GetCustomerModel>> deletCustomer(
      {required String id}) async {
    final res = await http.delete(
      Uri.parse("${Strings.url}/$id"),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${Strings.secretKey}',
      },
    );

    if (res.statusCode == 200) {
      return CustomModal<GetCustomerModel>(
        data: GetCustomerModel.fromJson(jsonDecode(res.body)),
        status: 200,
      );
    } else {
      return CustomModal<GetCustomerModel>(status: 400);
    }
  }
}
