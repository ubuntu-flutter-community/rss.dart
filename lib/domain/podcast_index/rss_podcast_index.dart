import 'package:rss_dart/domain/podcast_index/rss_podcast_index_funding.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_person.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_locked.dart';
import 'package:rss_dart/util/helpers.dart';
import 'package:xml/xml.dart';

class RssPodcastIndex {
  final List<RssPodcastIndexFunding?>? funding;
  final List<RssPodcastIndexPerson?>? persons;
  final RssPodcastIndexLocked? locked;

  RssPodcastIndex({
    this.funding,
    this.persons,
    this.locked,
  });

  static RssPodcastIndex? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    return RssPodcastIndex(
      funding: element.findElements('podcast:funding').map((e) {
        return RssPodcastIndexFunding.parse(e);
      }).toList(),
      persons: element.findElements('podcast:person').map((e) {
        return RssPodcastIndexPerson.parse(e);
      }).toList(),
      locked: RssPodcastIndexLocked.parse(
        findElementOrNull(element, 'podcast:locked'),
      ),
    );
  }
}
