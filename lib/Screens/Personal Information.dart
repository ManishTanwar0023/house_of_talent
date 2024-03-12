import 'package:flutter/material.dart';
import 'package:house_of_talent/CustomWidgets/Wallet_CustomWidget.dart';
import 'package:house_of_talent/CustomWidgets/buildFieldRowDatePicker.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

var Email = TextEditingController();
var Phone = TextEditingController();
var gender = TextEditingController();
var dob = TextEditingController();

class _PersonalInformationState extends State<PersonalInformation> {
  String selectedGender = 'Select';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Personal Information'),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.check),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Column(
            children: [
              buildFieldRow2('Email ID', 'Email ID', 'assets/images/msg2.png', Email),
              buildFieldRow2('Phone No.', 'Phone No.', 'assets/images/phone.png', Phone),
              buildFieldRow3(context, "Gender", 'Gender', 'assets/images/gender.png', selectedGender, gender),
              // buildFieldRow2('Birthday', 'Birthday', 'assets/images/birthday-icon.png', dob),
              buildFieldRowDatePicker('Birthday', 'Birthday', 'assets/images/birthday-icon.png', dob, context)
            ],
          ),
        ),
      ),
    );
  }

  void updateSelectedGender(String newValue) {
    setState(() {
      selectedGender = newValue;
    });
  }
}

Widget buildFieldRow3(BuildContext context, String labelText, String hint, String imagePath, String selectedGender, TextEditingController controller) {
  return Row(
    children: [
      Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
      ),
      SizedBox(width: 30),
      Expanded(
        child: CustomDropdown(
          labelText: labelText,
          hintText: hint,
          controller: controller,
          value: selectedGender,
          onChanged: (String? newValue) {
            if (newValue != null) {
              (context as _PersonalInformationState).updateSelectedGender(newValue);
            }
          },
          items: <String>['Select','Male', 'Female', 'Other']
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ),
          )
              .toList(),
        ),
      ),
    ],
  );
}

class CustomDropdown extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller; // Nullable
  final String? value;
  final ValueChanged<String?>? onChanged;
  final List<DropdownMenuItem<String>>? items;

  const CustomDropdown({
    Key? key,
    this.labelText,
    this.hintText,
    required this.controller,
    this.value,
    this.onChanged,
    this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      items: items,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
