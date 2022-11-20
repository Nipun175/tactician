import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactician/modal/roadmap_modal.dart';
import 'package:tactician/modal/timeline_modal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetRoadmap {
  final roadmapDataJson =
      'https://tanishq5414.github.io/tacticianapi/allRoadmapsList.json';
  Future<List<Roadmap>> getRoadmap() async {
    final roadmapData = await http.get(Uri.parse(roadmapDataJson));
    if (roadmapData.statusCode == 200) {
      final List jsonResponse = json.decode(roadmapData.body);
      return jsonResponse.map((roadmap) => Roadmap.fromJson(roadmap)).toList();
    } else {
      throw Exception('Failed to load notes from API');
    }
  }
}

final roadmapProvider = Provider<GetRoadmap>((ref) => GetRoadmap());

