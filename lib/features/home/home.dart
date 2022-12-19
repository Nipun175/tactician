import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tactician/components/roadmap_card.dart';
import 'package:tactician/core/provider/roadmap_provider.dart';
import 'package:tactician/modal/roadmap_modal.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var size = MediaQuery.of(context).size;
    var roadmap = ref.watch(roadmapDataProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50,
          elevation: 0,
          backgroundColor: Colors.black,
          title: const Text(
            'Tactician',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Vogue',
              fontWeight: FontWeight.w600,
              fontSize: 35,
            ),
          ),
        ),
        body: Column(
          children: [
            Center(child: const Text('What do you want to learn today?',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.06),
              child: roadmap.when(
                data: (roadmap) {
                  List<Roadmap> roadmapList = roadmap.map((e) => e).toList();
                  return SizedBox(
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // childAspectRatio: 0.8,
                        ),
                        itemCount: roadmapList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => RoadmapCard(
                              name: roadmapList[index].name,
                              tid: roadmapList[index].rid,
                            )),
                  );
                },
                error: (err, s) => Text(err.toString()),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
        // floatingActionButton: Container(height: size.height*0.1,width: size.height*0.1,child: FittedBox(child: FloatingActionButton(child: Icon(Icons.search,color: Colors.black,),onPressed: () => null,backgroundColor: Colors.white,))),
      ),
    );
  }
}
