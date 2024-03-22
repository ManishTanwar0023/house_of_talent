import 'package:flutter/material.dart';
import 'package:house_of_talent/Model/ApiCallingMethods.dart';
import 'package:house_of_talent/Screens/Wallet.dart';

import '../CustomWidgets/Wallet_CustomWidget.dart';

class AddBank extends StatefulWidget {
  const AddBank({super.key});

  @override
  State<AddBank> createState() => _AddBankState();
}

var PersonName = TextEditingController();
var Account = TextEditingController();
var Phone = TextEditingController();
var IFSC = TextEditingController();
var UPI = TextEditingController();
var Bank = TextEditingController();

class _AddBankState extends State<AddBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Bank Details'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildFieldRow2('Name', 'Name', 'assets/images/user.png', PersonName),
              SizedBox(height: 2,),
              buildFieldRow2('Account Number', 'Account Number', 'assets/images/bank.png', Account),
              SizedBox(height: 2,),
              buildFieldRow2('Phone Number', 'Phone Number', 'assets/images/phone.png', Phone),
              SizedBox(height: 2,),
              buildFieldRow2('IFSC Code', 'IFSC Code', 'assets/images/ifsc.png', IFSC),
              SizedBox(height: 2,),
              buildFieldRow2('UPI ID', 'UPI ID', 'assets/images/upi.png', UPI),
              SizedBox(height: 2,),
              buildFieldRow2('Bank Branch', 'Bank Branch', 'assets/images/bank.png', Bank),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                updateBank(context, Holdername: PersonName.text, Account: Account.text, phone: Phone.text, IFSC: IFSC.text, UPI: UPI.text, bankbranch: Bank.text);
              }, child: Text('Update'))
              
            ],
          ),
        ),
      ),
    );
  }
}
