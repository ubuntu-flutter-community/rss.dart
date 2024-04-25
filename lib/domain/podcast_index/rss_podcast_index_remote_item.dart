import 'package:xml/xml.dart';

/// This class represents the [podcast:remoteItem](https://github.com/Podcastindex-org/podcast-namespace/blob/main/docs/1.0.md#remote-item)
/// tag.
class RssPodcastIndexRemoteItem {
  String feedGuid;
  String? feedUrl;
  String? itemGuid;
  String? medium;

  RssPodcastIndexRemoteItem({
    required this.feedGuid,
    this.feedUrl,
    this.itemGuid,
    this.medium,
  });

  static RssPodcastIndexRemoteItem? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexRemoteItem(
      feedGuid: element.getAttribute('feedGuid') ?? '',
      feedUrl: element.getAttribute('feedUrl'),
      itemGuid: element.getAttribute('itemGuid'),
      medium: element.getAttribute('medium'),
    );
  }
}
