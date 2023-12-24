// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'package:rss_dart/dart_rss.dart';

void main() {
  final client = http.Client();

  // RSS feed
  client
      .get(
    Uri.parse(
      'https://feeds.podcastindex.org/pc20.xml',
    ),
  )
      .then((response) {
    return response.body;
  }).then((bodyString) {
    final channel = RssFeed.parse(bodyString);
    print(channel.title);
    print(channel.author);
    print(channel.copyright);
    print(channel.description);
    print(channel.docs);
    return channel;
  });

  // Atom feed
  client
      .get(Uri.parse('https://www.theverge.com/rss/index.xml'))
      .then((response) {
    return response.body;
  }).then((bodyString) {
    final feed = AtomFeed.parse(bodyString);
    print(feed.title);

    return feed;
  });
}
