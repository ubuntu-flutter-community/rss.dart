import 'package:rss_dart/domain/podcast_index/rss_podcast_index_integrity.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_source.dart';
import 'package:xml/xml.dart';

/// Represents an instance of a <podcast:alternateEnclosure> tag as defined
/// (here)[https://github.com/Podcastindex-org/podcast-namespace/blob/main/docs/1.0.md#alternate-enclosure]
class RssPodcastIndexAlternateEnclosure {
  /// The Mime Type of tha enclosure.
  final String mimeType;

  /// Length of the file in bytes.
  final int? length;

  /// Average encoding bitrate of the media asset, expressed in bits per second.
  final int? bitRate;

  /// Height of the media asset for video formats.
  final int? height;

  /// An (IETF)[https://en.wikipedia.org/wiki/BCP_47] language tag (BCP 47) code identifying the language of this media.
  final String? lang;

  /// A human-readable string identifying the name of the media asset. Should be limited to 32 characters for UX.
  final String? title;

  /// Provides a method of offering and/or grouping together different media elements.
  final String? rel;

  /// An (RFC 6381)[https://tools.ietf.org/html/rfc6381] string specifying the codecs available in this media.
  final String? codecs;

  /// Specifies whether or not the given media is the same as the file from the enclosure element and should be the preferred media element.
  final bool defaultMedia;

  /// Defines one or more uri location for an alternate enclosure.
  final List<RssPodcastAlternateEnclosureSource?>? sources;

  /// defines a method of verifying integrity of the media given either an
  /// (SRI-compliant)[https://www.w3.org/TR/SRI/] integrity string (preferred)
  /// or a base64 encoded PGP signature.
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
      title: element.getAttribute('title'),
      mimeType: element.getAttribute('type') ?? '',
      length: int.tryParse(element.getAttribute('length') ?? ''),
      bitRate: int.tryParse(element.getAttribute('bitrate') ?? ''),
      height: int.tryParse(element.getAttribute('height') ?? ''),
      lang: element.getAttribute('lang'),
      rel: element.getAttribute('rel'),
      codecs: element.getAttribute('codecs'),
      defaultMedia:
          bool.tryParse(element.getAttribute('default') ?? '') ?? false,
      sources: element.findElements('podcast:source').map((e) {
        return RssPodcastAlternateEnclosureSource.parse(e);
      }).toList(),
      integrity: element.findElements('podcast:integrity').map((e) {
        return RssPodcastAlternateEnclosureIntegrity.parse(e);
      }).firstOrNull,
    );
  }
}
