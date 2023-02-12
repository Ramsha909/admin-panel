class Tailor {
  String name;
  String email;
  String number;

  Tailor({this.name, this.email, this.number});

  Tailor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['number'] = this.number;
    // data['category'] = this.category;
    // data['imgUrl'] = this.imgUrl;
    return data;
  }
}
