class Book {
  static Set<String> urls = {};
  static List<String> urldata = [];

  static void convertData() {
    urldata = urls.toList();
  }
}
