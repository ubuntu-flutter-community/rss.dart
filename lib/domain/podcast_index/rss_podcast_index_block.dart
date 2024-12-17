import 'package:xml/xml.dart';

/// This class represents a (block)[https://github.com/Podcastindex-org/podcast-namespace/blob/main/docs/1.0.md#block] tag.
/// The block tag allows a podcaster to express which platforms are allowed to publicly display this feed and its contents.
class RssPodcastIndexBlock {
  /// A single entry from the (service slug list)[https://github.com/Podcastindex-org/podcast-namespace/blob/main/serviceslugs.txt].
  final String? id;

  /// Whether to block or not.
  final bool? block;

  RssPodcastIndexBlock({
    this.id,
    this.block,
  });

  static RssPodcastIndexBlock? parse(XmlElement? element) {
    if (element == null) return RssPodcastIndexBlock(block: false);

    return RssPodcastIndexBlock(
      id: element.getAttribute('id'),
      block: element.innerText.toLowerCase() == 'yes' ? true : false,
    );
  }
}
