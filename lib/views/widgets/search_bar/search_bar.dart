import 'package:flutter/material.dart';
import 'package:imt_framework_front/main.dart';
import 'package:imt_framework_front/views/pages/filter_page.dart';
import 'package:provider/provider.dart';

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    
    return Padding(
      padding: const EdgeInsets.only(top: 6,),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.83,
        child: SearchBar(
          onSubmitted:(text) {appState.filterSearchBar(text);},
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
          trailing: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_alt_rounded, color: Colors.white,),
              onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) { return FilterPage();}));},
            ),
          ],
        ),
      ),
    );
  }
}
