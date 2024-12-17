import 'package:xml/xml.dart';

class RssPodcastAlternateEnclosureSource {
  final String? uri;
  final String? contentType;

  RssPodcastAlternateEnclosureSource({
    required this.uri,
    this.contentType,
  });

  static RssPodcastAlternateEnclosureSource? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastAlternateEnclosureSource(
      uri: element.getAttribute('uri'),
      contentType: element.getAttribute('contentType'),
    );
  }
}
