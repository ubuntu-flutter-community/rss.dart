import 'package:xml/xml.dart';


/// Specification: https://podlove.org/simple-chapters
class RssPodloveSimpleChapters {
  final Duration? start;
  final String? title;
  final String? href;
  final String? imageUrl;

  const RssPodloveSimpleChapters({
    this.start,
    required this.title,
    this.href,
    this.imageUrl,
  });

  static RssPodloveSimpleChapters? parse(XmlElement? element) {
    if (element == null) {
      return null;
    }

    final start = element.getAttribute('start');

    // start attribute is required
    if (start == null) {
      return null;
    }

    final chapter = RssPodloveSimpleChapters(
      start: parseNormalPlayTime(start),
      title: element.getAttribute('title'),
      href: element.getAttribute('href'),
      imageUrl: element.getAttribute('imageUrl'),
    );

    // start parsing failed
    if (chapter.start == null) {
      return null;
    }

    return chapter;
  }

}

Duration? parseNormalPlayTime(String input) {
  final parts = input.split(':');

  try {
    if (parts.length == 1) {
      // Case 37 -> 37 seconds
      final seconds = double.parse(parts[0]);
      return Duration(milliseconds: (seconds * 1000).round());
    } else if (parts.length == 2) {
      // Case 7:48 -> 7 minutes and 48 seconds
      final minutes = int.parse(parts[0]);
      final seconds = double.parse(parts[1]);
      return Duration(
        minutes: minutes,
        milliseconds: (seconds * 1000).round(),
      );
    } else if (parts.length == 3) {
      // Case 01:35:52 -> 1 hour, 35 minutes and 52 seconds
      final hours = int.parse(parts[0]);
      final minutes = int.parse(parts[1]);
      final secondsString = parts[2];
      if (secondsString.contains('.')) {
        // Case 01:35:52.5 -> 1 hour, 35 minutes, 52.5 seconds
        final secondsParts = secondsString.split('.');
        final seconds = int.parse(secondsParts[0]);
        final milliseconds = int.parse(secondsParts[1]);
        return Duration(
          hours: hours,
          minutes: minutes,
          seconds: seconds,
          milliseconds: milliseconds,
        );
      } else {
        // Case 01:35:52 -> 1 hour, 35 minutes and 52 seconds
        final seconds = int.parse(secondsString);
        return Duration(
          hours: hours,
          minutes: minutes,
          seconds: seconds,
        );
      }
    }
  } catch (e) {
    // null on error
    return null;
  }

  return null;
}
