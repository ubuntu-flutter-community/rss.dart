import 'package:xml/xml.dart';

class RssPodcastIndexPerson {
  String name;
  String? role;
  String? group;
  String? image;
  String? link;

  RssPodcastIndexPerson({
    required this.name,
    this.role,
    this.group,
    this.image,
    this.link,
  });

  factory RssPodcastIndexPerson.parse(XmlElement element) {
    final role = element.getAttribute('role');
    final group = element.getAttribute('group');
    final image = element.getAttribute('img');
    final link = element.getAttribute('href');
    final name = element.innerText.trim();

    return RssPodcastIndexPerson(
      name: name,
      role: role,
      group: group,
      image: image,
      link: link,
    );
  }
}
