import 'package:xml/xml.dart';

class RssPodcastAlternateEnclosureIntegrity {
  final String? type;
  final String? value;

  RssPodcastAlternateEnclosureIntegrity({
    required this.type,
    required this.value,
  });

  static RssPodcastAlternateEnclosureIntegrity? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastAlternateEnclosureIntegrity(
      type: element.getAttribute('type'),
      value: element.getAttribute('value'),
    );
  }
}
