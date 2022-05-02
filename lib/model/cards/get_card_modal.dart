class GetCardModal {
  String? object;
  List<Data>? data;

  GetCardModal({
    this.object,
    this.data,
  });

  GetCardModal.fromJson(Map<String, dynamic> json) {
    object = json["object"];

    if (json["data"] != null) {
      data = <Data>[];

      json["data"].forEach((e) {
        data?.add(Data.fromJson(e));
      });
    }
  }
}

class Data {
  String? id;
  String? object;
  String? addressCity;
  String? addressCountry;
  String? addressLine1;
  String? addressLine1Check;
  String? addressLine2;
  String? addressState;
  String? addressZip;
  String? addressZipCheck;
  String? brand;
  String? country;
  String? customer;
  String? cvcCheck;
  String? dynamicLast4;
  int? expMonth;
  int? expYear;
  String? fingerprint;
  String? funding;
  String? last4;
  String? name;
  String? tokenizationMethod;

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    object = json["object"];
    addressCity = json["address_city"];
    addressCountry = json["address_country"];
    addressLine1 = json["address_line1"];
    addressLine1Check = json["address_line1_check"];
    addressLine2 = json["address_line2"];
    addressState = json["address_state"];
    addressZip = json["address_zip"];
    addressZipCheck = json["address_zip_check"];
    brand = json["brand"];
    country = json["country"];
    customer = json["customer"];
    cvcCheck = json["cvc_check"];
    dynamicLast4 = json["dynamic_last4"];
    expMonth = json["exp_month"];
    expYear = json["exp_year"];
    fingerprint = json["fingerprint"];
    funding = json["funding"];
    last4 = json["last4"];
    name = json["name"];
    tokenizationMethod = json["tokenization_method"];
  }
}
