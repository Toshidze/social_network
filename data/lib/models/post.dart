import 'package:conduit/conduit.dart';

import 'author.dart';

class Post extends ManagedObject<_Post> implements _Post {}

class _Post {
  @primaryKey
  int? id;
  String? content;
  @Relate(#postList, isRequired: true, onDelete: DeleteRule.cascade)
  Author? author;
}
