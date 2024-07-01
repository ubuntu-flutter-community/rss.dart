import 'package:rss_dart/domain/media/category.dart';
import 'package:rss_dart/domain/media/content.dart';
import 'package:rss_dart/domain/media/credit.dart';
import 'package:rss_dart/domain/media/rating.dart';
import 'package:rss_dart/domain/media/thumbnail.dart';
import 'package:rss_dart/util/helpers.dart';
import 'package:xml/xml.dart';

class Group {
  final List<Content> contents;
  final List<Credit> credits;
  final List<Thumbnail> thumbnails;
  final Category? category;
  final Rating? rating;

  const Group({
    this.contents = const <Content>[],
    this.credits = const <Credit>[],
    this.thumbnails = const <Thumbnail>[],
    this.category,
    this.rating,
  });

  static Group? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }
    return Group(
      contents: element
          .findElements('media:content')
          .map((e) => Content.parse(e))
          .toList(),
      credits: element
          .findElements('media:credit')
          .map((e) => Credit.parse(e))
          .toList(),
      thumbnails: element
          .findElements('media:thumbnail')
          .map((e) => Thumbnail.parse(e))
          .toList(),
      category: Category.parse(findElementOrNull(element, 'media:category')),
      rating: Rating.parse(findElementOrNull(element, 'media:rating')),
    );
  }
}
