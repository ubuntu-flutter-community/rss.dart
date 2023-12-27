import 'package:rss_dart/domain/podcast_index/rss_podcast_index_chapters.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_license.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_person.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_soudbite.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_transcript.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_value.dart';
import 'package:rss_dart/util/helpers.dart';
import 'package:xml/xml.dart';

class RssItemPodcastIndex {
  final RssPodcastIndexChapters? chapters;
  final List<RssPodcastIndexTranscript?> transcripts;
  final List<RssPodcastIndexSoundbite?> soundbites;
  final List<RssPodcastIndexPerson?> persons;
  final List<RssPodcastIndexValue?> value;
  final RssPodcastIndexLicense? license;

  RssItemPodcastIndex({
    this.chapters,
    this.transcripts = const <RssPodcastIndexTranscript>[],
    this.soundbites = const <RssPodcastIndexSoundbite>[],
    this.persons = const <RssPodcastIndexPerson>[],
    this.value = const <RssPodcastIndexValue>[],
    this.license,
  });

  factory RssItemPodcastIndex.parse(XmlElement element) {
    return RssItemPodcastIndex(
      chapters: RssPodcastIndexChapters.parse(
        findElementOrNull(element, 'podcast:chapters'),
      ),
      transcripts: element.findElements('podcast:transcript').map((e) {
        return RssPodcastIndexTranscript.parse(e);
      }).toList(),
      soundbites: element.findElements('podcast:soundbite').map((e) {
        return RssPodcastIndexSoundbite.parse(e);
      }).toList(),
      persons: element.findElements('podcast:person').map((e) {
        return RssPodcastIndexPerson.parse(e);
      }).toList(),
      value: element.findElements('podcast:value').map((e) {
        return RssPodcastIndexValue.parse(e);
      }).toList(),
      license: RssPodcastIndexLicense.parse(
        findElementOrNull(element, 'podcast:license'),
      ),
    );
  }
}
