import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class TimelineCard extends StatelessWidget {
  var description;
  var title;
  var size;
  var image;

  TimelineCard(
      {Key? key,
      required this.size,
      required this.title,
      required this.description,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardwidth = size.width * 0.6;
    var cardheight = size.height * 0.2;
    // print(image);
    if (image == "") {
      image = null;
    }
    if (image != null || image != "") {
      cardwidth = size.width * 0.75;
      cardheight = size.height * 0.3;
    }

    return TimelineTile(
      nodePosition: 0.13,
      contents: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: SizedBox(
          width: cardwidth,
          height: cardheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      //sigmaX is the Horizontal blur
                      sigmaX: 10.0,
                      //sigmaY is the Vertical blur
                      sigmaY: 10.0,
                    ),
                    //we use this container to scale up the blur effect to fit its
                    //  parent, without this container the blur effect doesn't appear.
                    child: Container(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white.withOpacity(0.8)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.18),
                            Colors.white.withOpacity(0.18),
                          ]),
                    ),
                  ),
                  //gradient effect ==> the second layer of stack

                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        image != null || image == ""
                            ? Image.network(
                                image,
                                width: cardwidth,
                                height: cardheight * 0.6,
                                fit: BoxFit.cover,
                              )
                            : Container(),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: size.width * 0.03),
                            child: SizedBox(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(cardwidth, cardheight),
                                  minimumSize: Size.zero,
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2)),
                                  ),
                                ),
                                onPressed: () {
                                  // Navigator.pushNamed(context, '/courseview');
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      0,
                                      size.width * 0.08,
                                      size.width * 0.08,
                                      size.width * 0.03),
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Text(
                                      description,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        backgroundColor: Colors.transparent,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.0008,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      node: const TimelineNode(
        indicator: DotIndicator(
          color: Colors.white,
        ),
        startConnector: SolidLineConnector(
          color: Colors.white,
        ),
        endConnector: SolidLineConnector(
          color: Colors.white,
        ),
      ),
    );
  }
}
