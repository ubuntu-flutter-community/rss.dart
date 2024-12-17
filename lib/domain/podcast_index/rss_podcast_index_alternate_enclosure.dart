import 'package:rss_dart/domain/podcast_index/rss_podcast_index_integrity.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_source.dart';
import 'package:xml/xml.dart';

class RssPodcastIndexAlternateEnclosure {
  final String? mimeType;
  final int? length;
  final int? bitRate;
  final int? height;
  final String? lang;
  final String? title;
  final String? rel;
  final String? codecs;
  final bool defaultMedia;

  final List<RssPodcastAlternateEnclosureSource?>? sources;
  final RssPodcastAlternateEnclosureIntegrity? integrity;

  RssPodcastIndexAlternateEnclosure({
    required this.mimeType,
    this.length,
    this.bitRate,
    this.height,
    this.lang,
    this.title,
    this.rel,
    this.codecs,
    this.defaultMedia = true,
    this.sources,
    this.integrity,
  });

  factory RssPodcastIndexAlternateEnclosure.parse(XmlElement element) {
    return RssPodcastIndexAlternateEnclosure(
      mimeType: element.getAttribute('type'),
      length: int.tryParse(element.getAttribute('length') ?? ''),
      bitRate: int.tryParse(element.getAttribute('bitrate') ?? ''),
      height: int.tryParse(element.getAttribute('height') ?? ''),
      lang: element.getAttribute('lang'),
      rel: element.getAttribute('rel'),
      codecs: element.getAttribute('codecs'),
      defaultMedia: bool.tryParse(element.getAttribute('default') ?? '') ?? false,
      sources: element.findElements('podcast:source').map((e) {
        return RssPodcastAlternateEnclosureSource.parse(e);
      }).toList(),
      integrity: element.findElements('podcast:integrity').map((e) {
        return RssPodcastAlternateEnclosureIntegrity.parse(e);
      }).firstOrNull,
    );
  }
}
