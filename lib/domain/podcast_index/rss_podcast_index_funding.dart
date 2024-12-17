import 'package:xml/xml.dart';

/// This class represents a (funding)[https://github.com/Podcastindex-org/podcast-namespace/blob/main/docs/1.0.md#funding] tag.
/// Links to an external web site.
class RssPodcastIndexFunding {
  /// The URL of the web page.
  final String? url;

  /// The text to display to the end user.
  final String? value;

  RssPodcastIndexFunding({
    this.url,
    this.value,
  });

  static RssPodcastIndexFunding? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexFunding(
      url: element.getAttribute('url'),
      value: element.innerText.trim(),
    );
  }
}
