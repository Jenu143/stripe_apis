class CreateCardModal {
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

  CreateCardModal({
    this.id,
    this.object,
    this.addressCity,
    this.addressCountry,
    this.addressLine1,
    this.addressLine1Check,
    this.addressLine2,
    this.addressState,
    this.addressZip,
    this.addressZipCheck,
    this.brand,
    this.country,
    this.customer,
    this.cvcCheck,
    this.dynamicLast4,
    this.expMonth,
    this.expYear,
    this.fingerprint,
    this.funding,
    this.last4,
    this.name,
    this.tokenizationMethod,
  });

  CreateCardModal.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "address_city": addressCity,
        "address_country": addressCountry,
        "address_line1": addressLine1,
        "address_line1_check": addressLine1Check,
        "address_line2": addressLine2,
        "address_state": addressState,
        "address_zip": addressZip,
        "address_zip_check": addressZipCheck,
        "brand": brand,
        "country": country,
        "customer": customer,
        "cvc_check": cvcCheck,
        "dynamic_last4": dynamicLast4,
        "exp_month": expMonth,
        "exp_year": expYear,
        "fingerprint": fingerprint,
        "funding": funding,
        "last4": last4,
        "name": name,
        "tokenization_method": tokenizationMethod,
      };
}
