import 'package:flutter/material.dart';
import 'package:house_of_talent/Colors/Palette.dart';
import 'package:house_of_talent/CustomWidgets/BuildButton_CustomWidget.dart';

import '../CustomWidgets/Custom_TextField2.dart';
import 'Participated_Competition.dart';

class Competition_Reg extends StatefulWidget {
  const Competition_Reg({Key? key}) : super(key: key);

  @override
  State<Competition_Reg> createState() => _Competition_RegState();
}

class _Competition_RegState extends State<Competition_Reg> {
  final TextEditingController compNameController = TextEditingController();
  final TextEditingController compDepositAmountController = TextEditingController();
  final TextEditingController compWinningAmountController = TextEditingController();
  final TextEditingController compDurationController = TextEditingController();
  final TextEditingController compResultDateController = TextEditingController();
  final TextEditingController compCriteriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Competition',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
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
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Custom_TextField2('Name', 'Name', false, false, compNameController),
              Custom_TextField2('Deposit Amount', 'Deposit Amount', false, false, compDepositAmountController),
              Custom_TextField2('Winning Amount', 'Winning Amount', false, false, compWinningAmountController),
              Custom_TextField2('Duration', 'Duration', false, false, compDurationController),
              Custom_TextField2('Result Date', 'Result Date', false, false, compResultDateController),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Competition Criteria',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: compCriteriaController,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Disqualification Criteria',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: compCriteriaController,
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        ),
                      ),
                    ),

                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: size.height*0.12,
                      width: size.width*0.15,
                      child: Image(image: AssetImage('assets/images/cloud_icon_logo2.jpg'))),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ParticipatedCompetition(),));
                    },
                    child: Container(
                      height: size.height*0.05,
                      width: size.width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Palette.offRedColor
                      ),
                      child: Center(
                        child: Text('Upload Your Video',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
