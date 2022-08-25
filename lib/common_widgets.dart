// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CommonWidgets {
  static Widget commonButton(
      {required void Function()? onPressed, required String buttonTitle}) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.brown)),
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }

  static Widget commonTextField({controller, lableText}) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.brown),
      cursorColor: Colors.brown,
      decoration: InputDecoration(
        labelText: '$lableText',
        labelStyle: const TextStyle(color: Colors.brown),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.brown,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Colors.brown,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  static Widget loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.brown),
    );
  }

  static NavigatePush(context, route) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => route),
      ),
    );
  }

  static PushReplacement(context, route) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ));
  }
}
