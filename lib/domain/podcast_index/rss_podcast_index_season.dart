import 'package:xml/xml.dart';

class RssPodcastIndexSeason {
  final int season;
  final String? name;

  RssPodcastIndexSeason({
    required this.season,
    this.name,
  });

  static RssPodcastIndexSeason? parse(XmlElement? element) {
    if (element == null) return null;

    return RssPodcastIndexSeason(
      season: int.tryParse(element.innerText.trim()) ?? 0,
      name: element.getAttribute('name'),
    );
  }
}
