class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});

  static List<BoardingModel> boarders = [
    BoardingModel(image: "assets/images/intro2.png", title: "Title One", body: "Body One"),
    BoardingModel(image: "assets/images/intro3.png", title: "Title Two", body: "Body Two"),
    BoardingModel(image: "assets/images/intro2.png", title: "Title Three", body: "Body Three"),
  ];
}
