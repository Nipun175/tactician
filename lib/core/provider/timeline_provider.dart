import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactician/core/services/timeline_api.dart';
import 'package:tactician/modal/timeline_modal.dart';

final timelineDataProvider = FutureProvider<List<Timeline>>((ref) async {
  return ref.watch(timelineProvider).getTimeline();
});
