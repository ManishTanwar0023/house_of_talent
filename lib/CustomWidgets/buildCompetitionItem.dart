import 'package:flutter/material.dart';

import '../Colors/Palette.dart';
import '../Screens/Competition_Result.dart';

Widget buildCompetitionItem(
    BuildContext context,
    String competitionName,
    String duration,
    String prizeMoney,
    ) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Competition Name: $competitionName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text('Duration: $duration'),
                SizedBox(height: 5),
                Text('Prize Money (INR): $prizeMoney'),
                Row(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(color: Palette.offRedColor, borderRadius: BorderRadius.circular(8)),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Competition_Result(),));
                        },
                        child: Text(
                          'View Results',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    ),
  );
}