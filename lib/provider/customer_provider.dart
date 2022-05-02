import 'package:flutter/cupertino.dart';
import 'package:task1/model/cards/custom_card.dart';
import 'package:task1/model/customer/create_customer_model.dart';
import 'package:task1/APi/customer_api_calling.dart';
import 'package:task1/model/customer/get_cutomer_model.dart';

class CustomerProvider extends ChangeNotifier {
  CustomerApiCalling customerApiCall = CustomerApiCalling();

  CustomModal<GetCustomerModel> customApiResponse =
      CustomModal<GetCustomerModel>();

  //^ createCustomer
  Future<CustomModal<CreateCustomerModel>> createApiProvider(
      {required String description, required String name}) async {
    final response = await customerApiCall.createApiCustomer(
        description: description, name: name);
    notifyListeners();
    return response;
  }

  //^ get Customer
  Future<CustomModal<GetCustomerModel>> getCustomerProvider() async {
    customApiResponse = await customerApiCall.getCustomers();
    notifyListeners();
    return customApiResponse;
  }

  //^ delet customer
  Future<CustomModal<GetCustomerModel>> deletCustomer(
      {required String id}) async {
    customApiResponse = await customerApiCall.deletCustomer(id: id);
    notifyListeners();
    return customApiResponse;
  }
}
