import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactician/core/services/roadmap_api.dart';

import '../../modal/roadmap_modal.dart';




final roadmapDataProvider = FutureProvider<List<Roadmap>>((ref) async {
  return ref.watch(roadmapProvider).getRoadmap();
});