import 'package:flutter/material.dart';
import 'package:house_of_talent/Colors/Palette.dart';
import '../CustomWidgets/BuildButton_CustomWidget.dart';
import '../CustomWidgets/CompetitionCustomContainerWidget.dart';
import '../CustomWidgets/CompetitionCustomHelpWidget.dart';

class Competition extends StatefulWidget {
  const Competition({Key? key}) : super(key: key);

  @override
  State<Competition> createState() => _CompetitionState();
}

class _CompetitionState extends State<Competition> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/tag1.png',
                width: 30,
                height: 30,
              ),
              SizedBox(width: 10),
              Text(
                'Competition',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              SizedBox(width: 10),
              Image.asset(
                'assets/images/tag1.png',
                width: 30,
                height: 30,
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Colors.black,
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              // Make the CompetitionCustomContainerWidget responsive
              SizedBox(
                width: size.width * 1, // 90% of screen width
                child: CompetitionCustomContainerWidget(size, progressValue: controller.value),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: size.width * 1, // 90% of screen width
                child: CompetitionCustomContainerWidget(size, progressValue: controller.value),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: size.width * 1, // 90% of screen width
                child: CompetitionCustomContainerWidget(size, progressValue: controller.value),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: size.width * 1, // 90% of screen width
                child: CompetitionCustomContainerWidget(size, progressValue: controller.value),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
