import 'package:flutter/material.dart';
import 'package:house_of_talent/CustomWidgets/Register_CustomWidgets.dart';

import '../CustomWidgets/Wallet_CustomWidget.dart';
import 'AddBank.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

var WalletBalance = TextEditingController();
var WalletHistory = TextEditingController();
var AddMoney = TextEditingController();
var AddBankDetails = TextEditingController();

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildFieldRow2('Wallet Balance', 'Wallet Balance', 'assets/images/wallet.png', WalletBalance),
              SizedBox(height: 2,),
              buildFieldRow2('Wallet History', 'Wallet History', 'assets/images/walletHistory.png', WalletHistory),
              SizedBox(height: 2,),
              buildFieldRow2('Add Money', 'Add Money', 'assets/images/addMoney.png', AddMoney),
              SizedBox(height: 2,),
              buildFieldRow2('Add Bank Details', 'Add Bank Details', 'assets/images/bank.png', AddBankDetails),
              SizedBox(height: 2,),
              SizedBox(height: 40,),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddBank(),));
              }, child: Text('Add Bank'))
            ],
          ),
        ),
      ),
    );
  }
}
