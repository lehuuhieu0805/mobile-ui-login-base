import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/commons/handle_exception/custom_exception.dart';
import 'package:mobile/commons/widgets/show_snackbar.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 201:
      onSuccess();
      break;
    case 204:
      onSuccess();
      break;
    case 400:
      throw CustomException(json.decode(response.body)['msg'], 400);
    case 500:
      showSnackBar(
        context,
        json.decode(response.body).toString(),
        color: Colors.red,
      );
      throw Exception();
    default:
      showSnackBar(context, response.body);
  }
}
