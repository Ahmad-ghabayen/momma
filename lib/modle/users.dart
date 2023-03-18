class Users {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? image;

  Users({this.id, this.email, this.password, this.firstName,this.lastName,this.phone, this.image});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map();
    data['id'] = id;
    data['phone'] = phone;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['imageUrl'] = image;
    return data;
  }

  Users.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    firstName = data['firstName'];
    lastName = data['lastName'];
    email = data['email'];
    image = data['imageUrl'];
    phone = data['phone'];

  }
}