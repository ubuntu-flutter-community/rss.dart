import 'package:xml/xml.dart';

import '../../util/helpers.dart';
import 'rss_podlove_simple_chapters.dart';

class RssItemPodlove {
  final List<RssPodloveSimpleChapters>? chapters;

  RssItemPodlove({this.chapters});

  factory RssItemPodlove.parse(XmlElement element) {
    var chaptersElement = findElementOrNull(element, 'psc:chapters');

    // check version
    if (chaptersElement != null) {
      final version = chaptersElement.getAttribute('version');
      // only version 1.2 is tested
      if (version != null && version != '1.2') {
        chaptersElement = null;
      }
    }
    return RssItemPodlove(
      chapters:
      chaptersElement?.findElements('psc:chapter').map((e) {
        return RssPodloveSimpleChapters.parse(e);
      }).nonNulls.toList(),
    );
  }
}