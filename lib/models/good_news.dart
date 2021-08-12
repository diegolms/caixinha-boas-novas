class GoodNews {
  final int id;
  final String description;


  GoodNews(
      this.id,
      this.description
  );

  @override
  String toString() {
    return 'GoodNew{id: $id, text: $description}';
  }


}