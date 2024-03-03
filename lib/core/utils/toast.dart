import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> toast({required String msg}) {
  return Fluttertoast.showToast(
    msg: msg,
    timeInSecForIosWeb: 5,
    toastLength: Toast.LENGTH_LONG,
  );
}
