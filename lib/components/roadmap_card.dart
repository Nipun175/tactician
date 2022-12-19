import 'package:flutter/material.dart';

class RoadmapCard extends StatelessWidget {
  var name;
  var tid;
  RoadmapCard(
      {Key? key, required this.name, required this.tid,})
      : super(key: key);
  var i = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/timelinePage',
              arguments: {'tid': tid, 'name': name});
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color.fromARGB(15, 125, 6, 6)),
            borderRadius: BorderRadius.circular(10),
          ),
          height: size.width * 0.25,
          width: size.width * 0.25,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 25,
                    height: 1.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
