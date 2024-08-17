import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  var imgUrl = "";

  getImageUrl() async {
    var client = HttpClient();
    var uri = Uri.parse('https://api.thecatapi.com/v1/images/search');
    HttpClientRequest request = await client.getUrl(uri);
    HttpClientResponse response = await request.close();
    var data = await response.transform(utf8.decoder).join();
    var map = json.decode(data);
    notifyListeners();
    imgUrl = map[0]['url'].toString();
  }
}