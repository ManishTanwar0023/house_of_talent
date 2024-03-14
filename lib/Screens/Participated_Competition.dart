import 'package:flutter/material.dart';
import '../CustomWidgets/buildCompetitionItem.dart';

class ParticipatedCompetition extends StatelessWidget {
  const ParticipatedCompetition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Participated Competitions'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCompetitionItem(
                  context,
                  'Comp1',
                  'DD/MM/YY to DD/MM/YY',
                  'XXXX',
                ),
                SizedBox(height: 10),
                buildCompetitionItem(
                  context,
                  'Comp2',
                  'DD/MM/YY to DD/MM/YY',
                  'XXXX',
                ),
                SizedBox(height: 10),
                buildCompetitionItem(
                  context,
                  'Comp3',
                  'DD/MM/YY to DD/MM/YY',
                  'XXXX',
                ),
                SizedBox(height: 10),
                buildCompetitionItem(
                  context,
                  'Comp4',
                  'DD/MM/YY to DD/MM/YY',
                  'XXXX',
                ),
                SizedBox(height: 10),
                buildCompetitionItem(
                  context,
                  'Comp5',
                  'DD/MM/YY to DD/MM/YY',
                  'XXXX',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}