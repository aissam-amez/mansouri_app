//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:mansouri/models/content.dart';
import 'package:mansouri/components/video.dart';

class ContentCard extends StatelessWidget {
  final Content content;
  ContentCard({Key? key, required this.content}) : super(key: key);

  Widget build(BuildContext context) {
    Widget fileWidget = Text('');
    if (content.type == 'jpg' ||
        content.type == 'jpeg' ||
        content.type == 'png') {
      fileWidget = Image.network(content.file);
    } else if (content.type == "mp4") {
      fileWidget = MyVideo(video: content.file);
    }
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.01,
            blurRadius: 9,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
            child: Column(
          children: [
            Text(content.title),
            Padding(
              padding: EdgeInsets.only(bottom: 8, top: 8),
              child: fileWidget,
            ),
          ],
        )),
      ),
    );
  }
}
