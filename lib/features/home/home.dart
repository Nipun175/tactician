import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactician/components/custom_appbar.dart';
import 'package:tactician/components/roadmap_card.dart';
import 'package:tactician/core/provider/roadmap_provider.dart';
import 'package:tactician/core/provider/timeline_provider.dart';
import 'package:tactician/modal/roadmap_modal.dart';
import 'package:tactician/modal/timeline_modal.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    var size = MediaQuery.of(context).size;
    var roadmap = ref.watch(roadmapDataProvider);
    return Scaffold(
      appBar: AppBar(
      centerTitle: false,
      toolbarHeight: 50,
      backgroundColor: Colors.black,
      elevation: 0,
      title: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Hello User',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      ),
      body:roadmap.when(
          data: (roadmap) {
            List<Roadmap> roadmapList = roadmap.map((e) => e).toList();
            return SizedBox(
              child: ListView.builder(
                  itemCount: roadmapList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => RoadmapCard(name: roadmapList[index].name,tid: roadmapList[index].rid,)),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ), 
    );
  }
}