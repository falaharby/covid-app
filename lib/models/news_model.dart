class News {
  String source, title, url, imageUrl, date;

  News({this.source, this.title, this.url, this.imageUrl, this.date});

  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return {
      "source": source,
      "title": title,
      "url": url,
      "imageUrl": imageUrl,
      "date": date,
    };
  }
}
