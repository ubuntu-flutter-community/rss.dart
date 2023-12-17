import 'package:xml/xml.dart';

class RssPodcastIndexBlock {
  final String? id;
  final bool? block;

  RssPodcastIndexBlock({
    this.id,
    this.block,
  });

  static RssPodcastIndexBlock? parse(XmlElement? element) {
    if (element == null) return RssPodcastIndexBlock(block: false);

    return RssPodcastIndexBlock(
      id: element.getAttribute('id'),
      block: element.innerText.toLowerCase() == 'yes' ? true : false,
    );
  }
}
