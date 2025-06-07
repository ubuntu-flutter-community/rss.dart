import 'package:xml/xml.dart';

/// This class represents a (chapter)[https://github.com/Podcastindex-org/podcast-namespace/blob/main/docs/1.0.md#chapters] tag.
/// Links to an external file containing chapter data for the episode.
class RssPodcastIndexChapters {
  /// The URL of the chapter file.
  final String? url;

  /// The mime type of chapter file such as application/json+chapters.
  final String? type;

  RssPodcastIndexChapters({
    this.url,
    this.type,
  });

  static RssPodcastIndexChapters? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    return RssPodcastIndexChapters(
      url: element.getAttribute('url') ?? element.getAttribute('href'),
      type: element.getAttribute('type'),
    );
  }
}
