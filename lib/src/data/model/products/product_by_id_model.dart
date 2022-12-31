import 'dart:convert';

List<ProductByIdModel> productByIdModelFromJson(String str) =>
    List<ProductByIdModel>.from(
        json.decode(str).map((x) => ProductByIdModel.fromJson(x)));

String productByIdModelToJson(List<ProductByIdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductByIdModel {
  ProductByIdModel({
    this.id,
    this.categoryId,
    this.name,
    this.image,
    this.votes,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? categoryId;
  String? name;
  String? image;
  String? votes;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ProductByIdModel.fromJson(Map<String, dynamic> json) =>
      ProductByIdModel(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        image: json["image"],
        votes: json["votes"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "image": image,
        "votes": votes,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
