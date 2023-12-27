import 'package:xml/xml.dart';

/// This class represents the [podcast:license](https://github.com/Podcastindex-org/podcast-namespace/blob/main/docs/1.0.md#license)
/// tag.
class RssPodcastIndexLicense {
  String license;
  String? url;

  RssPodcastIndexLicense({
    required this.license,
    this.url,
  });

  static RssPodcastIndexLicense? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexLicense(
      url: element.getAttribute('url'),
      license: element.innerText.toLowerCase(),
    );
  }
}
