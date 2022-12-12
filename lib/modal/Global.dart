class Global {
// static List mostpopulaqutoes = [
  //   {
  //     "name": "Learning Quotes",
  //     "image":
  //         "https://media.istockphoto.com/id/1096257658/photo/many-colorful-hands-with-smileys.jpg?b=1&s=170667a&w=0&k=20&c=jvRq5LqEWnOMeEUNNBP7R4h99qGyiI8EeY0T1AhPiY4="
  //   },
  //   {
  //     "name": "Inspiration Quotes",
  //     "image":
  //         "https://images.unsplash.com/photo-1426604966848-d7adac402bff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60"
  //   },
  //   {
  //     "name": "Positive Quotes Quotes",
  //     "image":
  //         "https://images.unsplash.com/photo-1587502537104-aac10f5fb6f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MjJ8fG5hdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"
  //   },
  //   {
  //     "name": "Wisdom Quotes",
  //     "image":
  //         "https://images.unsplash.com/photo-1418065460487-3e41a6c84dc5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzJ8fG5hdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"
  //   },
  // ];
}

class QuotesAPI {
  final String quote;
  final String author;
  final String image;

  QuotesAPI({
    required this.quote,
    required this.author,
    required this.image,
  });

  factory QuotesAPI.fromJSON(Map<String, dynamic> data, String image) {
    return QuotesAPI(
        quote: data['content'], author: data['author'], image: image);
  }
}

class QuotesDB {
  final String quote;
  final String author;
  final String image;

  QuotesDB({
    required this.quote,
    required this.author,
    required this.image,
  });

  factory QuotesDB.fromAPI(Map<String, dynamic> data) {
    return QuotesDB(
        quote: data['quote'], author: data['author'], image: data['image']);
  }
}

class CatOrAuthArgs {
  final String title;
  final bool isAuthorCat;

  CatOrAuthArgs({
    required this.title,
    required this.isAuthorCat,
  });
}

class Arguments {
  final String title;
  final String name;
  final bool isAuthCat;

  Arguments({required this.title, required this.isAuthCat, required this.name});
}
