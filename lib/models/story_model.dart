import 'package:booksface/models/user_model.dart';
import 'package:meta/meta.dart';

class Story {
  final User user;
  final String imageUrl;
  final bool isViewed;

  Story({required this.user, required this.imageUrl,
      this.isViewed = false});


}