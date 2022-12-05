import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactician/modal/timeline_modal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetTimeline {
  final timelineDataJson =
      'https://tanishq5414.github.io/tacticianapi/timelinedata.json';
  Future<List<Timeline>> getTimeline() async {
    final roadmapData = await http.get(Uri.parse(timelineDataJson));
    if (roadmapData.statusCode == 200) {
      final List jsonResponse = json.decode(roadmapData.body);
      return jsonResponse.map((roadmap) => Timeline.fromJson(roadmap)).toList();
    } else {
      throw Exception('Failed to load notes from API');
    }
  }
}

final timelineProvider = Provider<GetTimeline>((ref) => GetTimeline());
