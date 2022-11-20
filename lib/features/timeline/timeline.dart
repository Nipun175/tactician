import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactician/components/custom_appbar.dart';
import 'package:tactician/components/roadmap_card.dart';
import 'package:tactician/core/provider/timeline_provider.dart';
import 'package:tactician/core/services/roadmap_api.dart';
import 'package:tactician/modal/timeline_modal.dart';

import '../../components/timeline_card.dart';
import '../../core/services/timeline_api.dart';

class TimelineScreen extends ConsumerWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    var fid = args['fid'];
    var size = MediaQuery.of(context).size;
    var roadmapData = ref.watch(timelineDataProvider);
    var timelineData = ref.watch(timelineDataProvider);
    var roadmapDataList = [];

    timelineData.when(
        data: (timeline) {
          List<Timeline> timelineList = timeline.map((e) => e).toList();
          for (var i = 0; i < timelineList.length; i++) {
            if (timelineList[i].rid == fid) {
              roadmapDataList.add(timelineList[i]);
            }
          }
        },
        error: (err, s) => Text(err.toString()),
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
    print(roadmapDataList);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: CustomAppBar(
          title: args['name'],
        ),
        body: roadmapData.when(
          data: (roadmapData) {
            List<Timeline> roadmapList = roadmapData.map((e) => e).toList();
            return SizedBox(
              child: ListView.builder(
                  itemCount: roadmapList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => TimelineCard(
                        description: roadmapList[index].description,
                        title: roadmapList[index].title,
                        size: size,
                        image: roadmapList[index].image,
                      )),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
