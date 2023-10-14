import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  @override
  Widget build(BuildContext context) {

    ///TODO SearchAnchor for filter

    return Padding(
      padding: const EdgeInsets.only(top: 8,),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.83,
        child: SearchBar(
          hintStyle: MaterialStatePropertyAll(TextStyle(color: Colors.grey, fontSize: 16)),
          hintText: "Search item",
          shape: MaterialStatePropertyAll(RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) )),
          backgroundColor: MaterialStatePropertyAll(Colors.black87),
          elevation: MaterialStatePropertyAll(0),
          textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis,)),
          padding: MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          leading: Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}