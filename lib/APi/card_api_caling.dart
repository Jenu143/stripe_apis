import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:task1/constant/string.dart';
import 'package:task1/model/cards/custom_card.dart';
import 'package:task1/model/cards/get_card_modal.dart';
import 'package:task1/model/cards/post_card_modal.dart';

class CardApiCall {
  //^ post card api
  Future<CustomModal<CreateCardModal>> postCardApiCall() async {
    final postData = {
      "object": "Radadiya",
      "number": "Radadiya",
      "exp_month": "Radadiya",
      "exp_year": "Radadiya",
    };
    final response = await http.post(
      Uri.parse("${Strings.url}/cus_LbKH3ILA4kmh2n/sources?source=tok_amex"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Strings.secretKey}",
      },
      body: jsonEncode(postData),
    );

    if (response.statusCode == 200) {
      return CustomModal<CreateCardModal>(
        data: CreateCardModal.fromJson(jsonDecode(response.body)),
        status: 200,
      );
    } else {
      return CustomModal<CreateCardModal>(status: 400);
    }
  }

//^ get card api
  Future<CustomModal<GetCardModal>> getCardApiCall() async {
    final res = await http.get(
      Uri.parse("${Strings.url}/cus_LbKH3ILA4kmh2n/sources?="),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Strings.secretKey}",
      },
    );

    if (res.statusCode == 200) {
      return CustomModal<GetCardModal>(
        data: GetCardModal.fromJson(jsonDecode(res.body)),
        status: 200,
      );
    } else {
      return CustomModal<GetCardModal>(status: 400);
    }
  }

  //^ delet
  Future<CustomModal<GetCardModal>> deletCard({required String id}) async {
    final res = await http.delete(
      Uri.parse("${Strings.url}/cus_LbKH3ILA4kmh2n/sources/$id"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Bearer ${Strings.secretKey}",
      },
    );
    print("${Strings.url}/$id");

    if (res.statusCode == 200) {
      return CustomModal<GetCardModal>(
        data: GetCardModal.fromJson(jsonDecode(res.body)),
        status: 200,
      );
    } else {
      return CustomModal<GetCardModal>(status: 400);
    }
  }
}
