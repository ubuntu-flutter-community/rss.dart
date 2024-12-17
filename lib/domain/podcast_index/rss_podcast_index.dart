import 'package:rss_dart/domain/podcast_index/rss_podcast_index_block.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_funding.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_license.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_person.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_remote_item.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_value.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_locked.dart';
import 'package:rss_dart/util/helpers.dart';
import 'package:xml/xml.dart';

/// Represents podcast namespace items at the channel level.
class RssPodcastIndex {
  /// Unique ID for the podcast
  final String? guid;

  /// List of optional funding tags.
  final List<RssPodcastIndexFunding?>? funding;

  /// List of optional people related to the podcast.
  final List<RssPodcastIndexPerson?>? persons;

  /// Optional Lightning block for the podcast
  final List<RssPodcastIndexValue?>? value;

  /// Should this RSS feed be ingested or not.
  final List<RssPodcastIndexBlock?>? block;

  /// List of remote items for the podcast.
  final List<RssPodcastIndexRemoteItem?>? remoteItem;

  /// Is this RSS feed locked or not?
  final RssPodcastIndexLocked? locked;

  /// Optional licence type for the podcast.
  final RssPodcastIndexLicense? license;

  /// Optional medium type for the podcast such as audiobook.
  final String? medium;

  RssPodcastIndex({
    this.guid,
    this.funding,
    this.persons,
    this.value,
    this.locked,
    this.block,
    this.license,
    this.medium,
    this.remoteItem,
  });

  static RssPodcastIndex? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    return RssPodcastIndex(
      guid: findElementOrNull(element, 'podcast:guid')?.innerText,
      funding: element.findElements('podcast:funding').map((e) {
        return RssPodcastIndexFunding.parse(e);
      }).toList(),
      persons: element.findElements('podcast:person').map((e) {
        return RssPodcastIndexPerson.parse(e);
      }).toList(),
      remoteItem: element.findElements('podcast:remoteItem').map((e) {
        return RssPodcastIndexRemoteItem.parse(e);
      }).toList(),
      value: element
          .findElements('podcast:value')
          .map((element) => RssPodcastIndexValue.parse(element))
          .toList(),
      block: element
          .findElements('podcast:block')
          .map((element) => RssPodcastIndexBlock.parse(element))
          .toList(),
      locked: RssPodcastIndexLocked.parse(
        findElementOrNull(element, 'podcast:locked'),
      ),
      license: RssPodcastIndexLicense.parse(
        findElementOrNull(element, 'podcast:license'),
      ),
      medium: findElementOrNull(element, 'podcast:medium')?.innerText,
    );
  }
}
