class Music{

  late final String name;
  late final String link;
  late final String imageLink;

  Music({required this.name, required this.link, required this.imageLink});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['link'] = link;
    data['imageLink'] = imageLink;
    return data;
  }

  Music.fromJson(Map<String, dynamic> json){
    name = json['name'];
    link = json['link'];
    imageLink = json['imageLink'];
  }

}
