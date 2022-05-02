class CreateCustomerModel {
  String? id;
  String? object;
  String? address;
  int? balance;
  int? created;
  String? currency;
  String? defaultSource;
  bool? delinquent;
  String? description;
  String? discount;
  String? email;
  String? invoicePrefix;
  bool? livemode;
  String? name;
  String? phone;
  String? shipping;
  String? taxExempt;
  String? testClock;

  CreateCustomerModel(
      {this.id,
      this.object,
      this.address,
      this.balance,
      this.created,
      this.currency,
      this.defaultSource,
      this.delinquent,
      this.description,
      this.discount,
      this.email,
      this.invoicePrefix,
      this.livemode,
      this.name,
      this.phone,
      this.shipping,
      this.taxExempt,
      this.testClock});

  CreateCustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    address = json['address'];
    balance = json['balance'];
    created = json['created'];
    currency = json['currency'];
    defaultSource = json['default_source'];
    delinquent = json['delinquent'];
    description = json['description'];
    discount = json['discount'];
    email = json['email'];
    invoicePrefix = json['invoice_prefix'];
    livemode = json['livemode'];
    name = json['name'];
    phone = json['phone'];
    shipping = json['shipping'];
    taxExempt = json['tax_exempt'];
    testClock = json['test_clock'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'address': address,
        'balance': balance,
        'created': created,
        'currency': currency,
        'default_source': defaultSource,
        'delinquent': delinquent,
        'description': description,
        'discount': discount,
        'email': email,
        'invoice_prefix': invoicePrefix,
        'livemode': livemode,
        'name': name,
        'phone': phone,
        'shipping': shipping,
        'tax_exempt': taxExempt,
        'test_clock': testClock,
      };
}
