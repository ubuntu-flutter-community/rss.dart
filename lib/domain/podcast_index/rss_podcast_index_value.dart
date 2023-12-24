import 'package:rss_dart/domain/podcast_index/rss_podcast_index_value_recipient.dart';
import 'package:xml/xml.dart';

class RssPodcastIndexValue {
  final String? type;
  final String? method;
  final double? suggested;
  final List<RssPodcastIndexValueRecipient?>? recipients;

  RssPodcastIndexValue({
    this.type,
    this.method,
    this.suggested,
    this.recipients,
  });

  static RssPodcastIndexValue? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    return RssPodcastIndexValue(
      type: element.getAttribute('type'),
      method: element.getAttribute('method'),
      suggested: double.parse(element.getAttribute('suggested') ?? '0.0'),
      recipients: element.findElements('podcast:valueRecipient').map((e) {
        return RssPodcastIndexValueRecipient.parse(e);
      }).toList(),
    );
  }
}
