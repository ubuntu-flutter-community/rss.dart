import 'package:rss_dart/domain/podcast_index/rss_podcast_index_alternate_enclosure.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_chapters.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_license.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_person.dart';
import 'package:rss_dart/domain/podcast_index/rss_podcast_index_season.dart';
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
  final List<RssPodcastIndexAlternateEnclosure?> alternateEnclosure;
  final RssPodcastIndexLicense? license;
  final RssPodcastIndexSeason? season;

  RssItemPodcastIndex({
    this.chapters,
    this.transcripts = const <RssPodcastIndexTranscript>[],
    this.soundbites = const <RssPodcastIndexSoundbite>[],
    this.persons = const <RssPodcastIndexPerson>[],
    this.value = const <RssPodcastIndexValue>[],
    this.alternateEnclosure = const <RssPodcastIndexAlternateEnclosure>[],
    this.license,
    this.season,
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
      alternateEnclosure: element.findElements('podcast:alternateEnclosure').map((e) {
        return RssPodcastIndexAlternateEnclosure.parse(e);
      }).toList(),
      license: RssPodcastIndexLicense.parse(
        findElementOrNull(element, 'podcast:license'),
      ),
      season: RssPodcastIndexSeason.parse(
        findElementOrNull(element, 'podcast:season'),
      ),
    );
  }
}
