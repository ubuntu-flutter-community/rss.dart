import 'package:rss_dart/domain/dublin_core/dublin_core.dart';
import 'package:rss_dart/domain/media/media.dart';
import 'package:rss_dart/domain/podlove/rss_podlove.dart';
import 'package:rss_dart/domain/rss_category.dart';
import 'package:rss_dart/domain/rss_content.dart';
import 'package:rss_dart/domain/rss_enclosure.dart';
import 'package:rss_dart/domain/rss_item_podcast_index.dart';
import 'package:rss_dart/domain/rss_source.dart';
import 'package:rss_dart/util/helpers.dart';
import 'package:xml/xml.dart';

import 'rss_item_itunes.dart';

class RssItem {
  final String? title;
  final String? description;
  final String? link;

  final List<RssCategory> categories;
  final String? guid;
  final String? pubDate;
  final String? author;
  final String? comments;
  final RssSource? source;
  final RssContent? content;
  final Media? media;
  final RssEnclosure? enclosure;
  final DublinCore? dc;
  final RssItemItunes? itunes;
  final RssItemPodcastIndex? podcastIndex;
  final RssItemPodlove? podlove;

  const RssItem({
    this.title,
    this.description,
    this.link,
    this.categories = const <RssCategory>[],
    this.guid,
    this.pubDate,
    this.author,
    this.comments,
    this.source,
    this.content,
    this.media,
    this.enclosure,
    this.dc,
    this.itunes,
    this.podcastIndex,
    this.podlove,
  });

  factory RssItem.parse(XmlElement element) {
    return RssItem(
      title: findElementOrNull(element, 'title')?.innerText,
      description: findElementOrNull(element, 'description')?.innerText,
      link: findElementOrNull(element, 'link')?.innerText,
      categories: element
          .findElements('category')
          .map((element) => RssCategory.parse(element))
          .toList(),
      guid: findElementOrNull(element, 'guid')?.innerText,
      pubDate: findElementOrNull(element, 'pubDate')?.innerText,
      author: findElementOrNull(element, 'author')?.innerText,
      comments: findElementOrNull(element, 'comments')?.innerText,
      source: RssSource.parse(findElementOrNull(element, 'source')),
      content: RssContent.parse(findElementOrNull(element, 'content:encoded')),
      media: Media.parse(element),
      enclosure: RssEnclosure.parse(findElementOrNull(element, 'enclosure')),
      dc: DublinCore.parse(element),
      itunes: RssItemItunes.parse(element),
      podcastIndex: RssItemPodcastIndex.parse(element),
      podlove: RssItemPodlove.parse(element),
    );
  }
}
