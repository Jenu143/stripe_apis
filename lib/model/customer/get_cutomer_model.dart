class GetCustomerModel {
  String? object;

  List<Data>? data;

  GetCustomerModel({
    required this.data,
    required this.object,
  });

  GetCustomerModel.fromJson(Map<String, dynamic> json) {
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
  String? address;
  int? balance;
  int? created;
  String? currency;
  String? defaultSource;
  bool? delinQuent;

  Data({
    this.id,
    this.object,
    this.address,
    this.balance,
    this.created,
    this.currency,
    this.defaultSource,
    this.delinQuent,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    object = json["object"];
    address = json["address"];
    balance = json["balance"];
    created = json["created"];
    currency = json["currency"];
    defaultSource = json["default_source"];
    delinQuent = json["delinquent"];
  }
}
