import 'package:flutter/material.dart';
import '../Colors/Palette.dart';
import '../Screens/Competition_Reg.dart';
import 'CompetitionCustomHelpWidget.dart';

class CompetitionCustomContainerWidget extends StatelessWidget {
  final double progressValue ; // Assuming you pass progress value from outside

  CompetitionCustomContainerWidget(Size size, {required this.progressValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.22,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('assets/images/pexels2.jpg'), // Assuming this path is correct
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(Palette.offWhiteColor.withOpacity(0.2), BlendMode.overlay),
          ),
        ),
        child: Column(
          children: [
            CompetitionCustomHelpWidget(title: 'Name'),
            CompetitionCustomHelpWidget(title: 'Duration'),
            CompetitionCustomHelpWidget(title: 'Winning Amount'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CompetitionCustomHelpWidget(title: 'Seats Available'),
                SizedBox(width: 5),
                Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
                  Text('45%')
                ],),
                
                SizedBox(width: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0,bottom: 5.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Competition_Reg(),));
                    },
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.28,
                      decoration: BoxDecoration(
                        color: Palette.offRedColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Tap To Enter',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
