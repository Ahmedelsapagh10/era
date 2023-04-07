import 'package:shared_preferences/shared_preferences.dart';

String? userName;
String? email;
String? firstname;
String? lastname;

Future setuserData() async {
  final sharedpref = await SharedPreferences.getInstance();
  await sharedpref.setString('userName', userName!);
  await sharedpref.setString('email', email!);
  await sharedpref.setString('firstname', firstname!);
  await sharedpref.setString('lastname', lastname!);

  print(' U add value to user');
}

Future getuserData() async {
  try {
    final sharedpref = await SharedPreferences.getInstance();
    userName = sharedpref.getString('userName')!;
    email = sharedpref.getString('email')!;
    firstname = sharedpref.getString('firstname')!;
    lastname = sharedpref.getString('lastname')!;
    print('U get value of user');
  } catch (_) {
    userName = null;
  }
}

Future removeDate() async {
  final sharedpref = await SharedPreferences.getInstance();
  sharedpref.remove('userName');
  sharedpref.remove('email');
  sharedpref.remove('firstname');
  sharedpref.remove('lastname');
}
