class City {
  final String title;
  final int woeid;

  City(
      this.title,
      this.woeid
      );

  City.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        woeid = json['woeid'];

}