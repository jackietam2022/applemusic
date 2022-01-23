import 'dart:convert';
import 'dart:io';
import 'package:applemusic/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:applemusic/models/appleddate.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchScreenStats createState() => SearchScreenStats();
}

class SearchScreenStats extends State<SearchScreen> {
  TextEditingController _text = TextEditingController();
  AppleDate? appleDate;
  String value = "";

  Future getData() async {
    value = _text.text;
    final response = await http.get(
      Uri.parse("https://itunes.apple.com/search?term=$value"),
      headers: {
        HttpHeaders.authorizationHeader: 'Basic your_api_token_here',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        appleDate = AppleDate.fromJson(jsonDecode(response.body)) as AppleDate;
      });
    } else {
      throw Exception("failed");
    }
  }


  onPressed() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.grey[900],
          elevation: 0,
          title: Text(
            "Search",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            CupertinoSearchTextField(
              controller: _text,
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: onPressed,
                ),
              ),
            ),
            Container(
              child: _buildsearch(),
            ),SizedBox(height: 20,width: 20,)
          ],
        ),
    );
  }

  Widget _buildsearch() {
    if (appleDate != null) {
      print(appleDate!.resultCount);
      return Expanded(
          child: ListView.builder(
        shrinkWrap: true,
        itemCount: appleDate!.results.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                color: greyColor,
                margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          appleDate!.results[index].artworkUrl100,
                        ),
                      ),
                      Column(children: [
                        Container(
                            width: 250,
                            child: Text(
                              appleDate!.results[index].artistName,textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(appleDate!.results[index].wrapperType,style: TextStyle(color: Colors.white54,fontSize: 15,fontWeight: FontWeight.bold),),
                        ),

                      ],
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
                ),
            ],
          );
        },
      )
      );
    } else {
      return Center(child: Text("Search"),);
    }
  }
}
