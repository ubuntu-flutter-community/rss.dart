import 'package:xml/xml.dart';

class RssPodcastIndexValueRecipient {
  final String? name;
  final String? customKey;
  final String? type;
  final String? address;
  final int? split;
  final String? customValue;
  final bool? fee;

  RssPodcastIndexValueRecipient({
    this.name,
    this.customKey,
    this.type,
    this.address,
    this.split,
    this.customValue,
    this.fee,
  });

  static RssPodcastIndexValueRecipient? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    return RssPodcastIndexValueRecipient(
      name: element.getAttribute('name'),
      customKey: element.getAttribute('customKey'),
      type: element.getAttribute('type'),
      address: element.getAttribute('address'),
      split: int.parse(element.getAttribute('split') ?? '0'),
      customValue: element.getAttribute('customValue'),
      fee: (element.getAttribute('fee') ?? 'false') == 'true',
    );
  }
}
