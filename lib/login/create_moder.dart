class UserModel {
  String address;
  String age;
  String name;

  UserModel({required this.name, required this.age, required this.address});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      address: json['address'],
      age: json['age'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'address': address, 'age': age, 'name': name};
  }
}
