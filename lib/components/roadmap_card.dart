import 'package:flutter/material.dart';

class RoadmapCard extends StatelessWidget {
  var name;
  var tid;
  RoadmapCard({Key? key, required this.name,required this.tid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/timelinePage',arguments: {'tid':tid,'name':name});
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: size.height * 0.15,
          width: size.width * 0.25,
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                height: 1.5),
          ),
        ),
      ),
    );
  }
}
