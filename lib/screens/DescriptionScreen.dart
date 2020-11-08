import 'package:flutter/material.dart';
import 'package:dartist_app/components/Job.dart';
import 'package:dartist_app/Constants.dart';
import 'package:dartist_app/components/DetailContent.dart';
import 'package:dartist_app/components/DetailHeader.dart';
import 'package:dartist_app/components/DetailFooter.dart';

class DescriptionScreen extends StatelessWidget {
  final Job data;
  const DescriptionScreen({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                DetailHeader(data: data),
                DetailContent(data: data),
              ],
            ),
            DetailFooter(),
          ],
        ),
      ),
    );
  }
}
