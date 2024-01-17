import 'dart:io';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../constants.dart';

Future<bool> isInternetConnected() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  } catch (_) {
    return false;
  }
}

void internetAlert(Function fun) {
  showDialog(
      context: navigatorKey.currentState!.context,
      builder: (_) => AlertDialog(
            title: const Text(INTERNET_ERROR, textAlign: TextAlign.center),
            content: IconButton(
                onPressed: () {
                  fun();
                  Navigator.pop(navigatorKey.currentState!.context);
                },
                icon: const Icon(Icons.refresh)),
          ));
}
