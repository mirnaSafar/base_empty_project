class ProductModel {
  String? sId;
  String? country;
  String? category;
  String? image;
  String? name;
  double? price;
  Null recommended;
  Null containMilk;
  int? order;
  String? createdDate;
  int? iV;

  ProductModel(
      {this.sId,
      this.country,
      this.category,
      this.image,
      this.name,
      this.price,
      this.recommended,
      this.containMilk,
      this.order,
      this.createdDate,
      this.iV});

  ProductModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    country = json['country'];
    category = json['category'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
    recommended = json['recommended'];
    containMilk = json['contain_milk'];
    order = json['order'];
    createdDate = json['created_date'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['country'] = this.country;
    data['category'] = this.category;
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    data['recommended'] = this.recommended;
    data['contain_milk'] = this.containMilk;
    data['order'] = this.order;
    data['created_date'] = this.createdDate;
    data['__v'] = this.iV;
    return data;
  }
}
