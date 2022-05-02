import 'package:flutter/cupertino.dart';
import 'package:task1/APi/card_api_caling.dart';
import 'package:task1/model/cards/custom_card.dart';
import 'package:task1/model/cards/get_card_modal.dart';
import 'package:task1/model/cards/post_card_modal.dart';

class CardProvider extends ChangeNotifier {
  CardApiCall cardApiCall = CardApiCall();

  CustomModal<GetCardModal> customModal = CustomModal<GetCardModal>();

  //^ create card
  Future<CustomModal<CreateCardModal>> createCardProvider() async {
    final res = await cardApiCall.postCardApiCall();
    notifyListeners();
    return res;
  }

  //^ get card
  Future<CustomModal<GetCardModal>> getGetProvider() async {
    customModal = await cardApiCall.getCardApiCall();
    notifyListeners();
    return customModal;
  }

  //^ delet card
  Future<CustomModal<GetCardModal>> deleteCardProvider(
      {required String id}) async {
    customModal = await cardApiCall.deletCard(id: id);
    notifyListeners();
    return customModal;
  }
}
