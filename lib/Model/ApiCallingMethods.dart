// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:house_of_talent/CustomWidgets/Register_CustomWidgets.dart';
import 'package:house_of_talent/Screens/HomeScreen.dart';
import 'package:house_of_talent/Screens/PostPage.dart';
import 'package:house_of_talent/Screens/Profile.dart';
import 'package:house_of_talent/Screens/Wallet.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'https://testingonme.com/APIFolder/WebService1.asmx';
String token = 'HMNNOJMIFHAT';

// Future<void> updateProfileImage(
//     BuildContext context, {
//       required String pic,
//       required String emailId,
//     }) async {
//   Map<String, String> requestBody = {
//     "token": token,
//     'pic': pic,
//     'emailid': emailId,
//   };
//
//   try {
//     http.Response response = await http.post(
//       Uri.parse('$baseUrl/UpdateProfileImage'),
//       body: requestBody,
//     );
//
//     if (response.statusCode == 200) {
//       showSnackBar(context,
//           message: "Profile Updated Successfully", icon: Icons.done);
//     } else {
//       log("Failed to update profile image");
//     }
//   } catch (e) {
//     log("Error: $e");
//   }
// }

Future<void> checkFollow(
    BuildContext context, {
      required String followerName,
      required String followed,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'Followername': followerName,
    'followed': followed,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/CheckFollow'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> checkJoinCompetition(
    BuildContext context, {
      required String cid,
      required String userph,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'cid': cid,
    'userph': userph,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/CheckJoinCompetition'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> deleteComment(
    BuildContext context, {
      required String commentid,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'commentid': commentid,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/DeleteComment'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> deletePost(
    BuildContext context, {
      required String id,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'id': id,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/DeletePost'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> editProfile(
    BuildContext context, {
      required String type,
      required String fname,
      required String lname,
      required String email,
      required String ph,
      required String gender,
      required String DOB,
      required String username,
      required String image,
      required String BIO,
      required String Insta,
      required String YT,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'type': type,
    'fname': fname,
    'lname': lname,
    'email': email,
    'ph': ph,
    'gender': gender,
    'DOB': DOB,
    'username': username,
    'image': image,
    'BIO': BIO,
    'Insta': Insta,
    'YT': YT,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/EditProfile'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      var Response = jsonDecode(response.body)[
      "message"
      ];
      if(Response == "Updated!"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
      }else{
        snackbar(context, Response, 'Something Went Wrong');
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> insertBank(
    BuildContext context, {
      required String Holdername,
      required String Account,
      required String phone,
      required String IFSC,
      required String UPI,
      required String bankbranch,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'Holdername': Holdername,
    'Account': Account,
    'phone': phone,
    'IFSC': IFSC,
    'UPI': UPI,
    'bankbranch': bankbranch,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/InsertBank'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print('data successfully Added');
      var Response = jsonDecode(response.body)[
      "message"
      ];
      if(Response == "Bank Inserted!"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Wallet(),));
      }else{
        snackbar(context, Response, 'Something Went Wrong');
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> insertComment(
    BuildContext context, {
      required String comment,
      required String username,
      required String logo,
      required String videoid,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'comment': comment,
    'username': username,
    'logo': logo,
    'videoid': videoid,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/InsertComment'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> insertJoinCompetition(
    BuildContext context, {
      required String cid,
      required String userph,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'cid': cid,
    'userph': userph,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/InsertJoinCompetition'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> insertLikes(
    BuildContext context, {
      required String videoid,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'videoid': videoid,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/InsertLikes'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> insertVideoShare(
    BuildContext context, {
      required String videoid,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'videoid': videoid,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/InsertVideoShare'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> insertVideoViews(
    BuildContext context, {
      required String videoid,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'videoid': videoid,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/InsertVideoViews'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> register(
    BuildContext context, {
      required String type,
      required String fname,
      required String lname,
      required String email,
      required String ph,
      required String gender,
      required String DOB,
      required String username,
      required String image,
      required String BIO,
      required String Insta,
      required String YT,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'type': type,
    'fname': fname,
    'lname': lname,
    'email': email,
    'ph': ph,
    'gender': gender,
    'DOB': DOB,
    'username': username,
    'image': image,
    'BIO': BIO,
    'Insta': Insta,
    'YT': YT,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/Register'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      var Response = jsonDecode(response.body)[
      "message"
      ];
      if(Response == "Registered!"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }else{
        snackbar(context, Response, 'Something Went Wrong');
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> updateBank(
    BuildContext context, {
      required String Holdername,
      required String Account,
      required String phone,
      required String IFSC,
      required String UPI,
      required String bankbranch,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'Holdername': Holdername,
    'Account': Account,
    'phone': phone,
    'IFSC': IFSC,
    'UPI': UPI,
    'bankbranch': bankbranch,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/UpdateBank'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print('data successfully Added');
      var Response = jsonDecode(response.body)[
        "message"
      ];
      if(Response == "Bank Inserted!"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Wallet(),));
      }else{
        snackbar(context, Response, 'Something Went Wrong');
      }
    } else {
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print(e);
  }
}

Future<void> updateLikes(
    BuildContext context, {
      required String videoid,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'videoid': videoid,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/UpdateLikes'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> AddPost(
    BuildContext context, {
      required String mode,
      required String D,
      required String Thumbnail,
      required String creator,
      required String video,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'mode': mode,
    'D': D,
    'Thumbnail': Thumbnail,
    'creator': creator,
    'video': video,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/AddPost'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      var Response = jsonDecode(response.body)[
      "message"
      ];
      if(Response == "Insert!"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PostPage(),));
      }else{
        snackbar(context, Response, 'Something Went Wrong');
      }
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> updatePost(
    BuildContext context, {
      required String mode,
      required String D,
      required String Thumbnail,
      required String creator,
      required String id,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'mode': mode,
    'D': D,
    'Thumbnail': Thumbnail,
    'creator': creator,
    'id': id,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/UpdatePost'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> updateVideoShare(
    BuildContext context, {
      required String videoid,
      required String count,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'videoid': videoid,
    'count': count,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/UpdateVideoShare'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

Future<void> updateVideoViews(
    BuildContext context, {
      required String count,
      required String videoid,
    }) async {
  Map<String, String> requestBody = {
    'token': token,
    'count': count,
    'videoid': videoid,
  };

  try {
    http.Response response = await http.post(
      Uri.parse('$baseUrl/UpdateVideoViews'),
      body: requestBody,
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  } catch (e) {
    // Handle error
  }
}

void showSnackBar(BuildContext context,
    {required String message, required IconData icon}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(message),
        ],
      ),
    ),
  );
}

void log(String message) {
  print(message);
}