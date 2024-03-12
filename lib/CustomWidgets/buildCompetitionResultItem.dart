import 'package:flutter/material.dart';

Widget buildCompetitionResultItem(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'COMPETITION 1 RESULT-Ongoing',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Time Remaining-X  Days:Y  Hours:Z  Mins:Secs'),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text('1)  XXXXXX'),
                        SizedBox(height: 4),
                        Text('2)  YYYYYY'),
                        SizedBox(height: 4),
                        Text('3)  ZZZZZZ'),
                        SizedBox(height: 4),
                        Text('10)  Your Position'),
                        SizedBox(height: 4),
                        Text('11)  AAAAAA'),
                        SizedBox(height: 4),
                        Text('12)  BBBBBB'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Points',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text('XXX'),
                        SizedBox(height: 4),
                        Text('YYY'),
                        SizedBox(height: 4),
                        Text('ZZZ'),
                        SizedBox(height: 4),
                        Text('ABC'),
                        SizedBox(height: 4),
                        Text('AAA'),
                        SizedBox(height: 4),
                        Text('BBB'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

      ],
    ),
  );
}