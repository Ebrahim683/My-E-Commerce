class CarouselModel {
  String? name;
  String? url;

  CarouselModel({this.name, this.url});

  CarouselModel.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    url = map['url'];
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'url': url,
      };
}
