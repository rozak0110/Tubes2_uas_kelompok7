searchview :
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewWidget extends SearchViewWidget {
  final Function(String) onSearch;
  final String hintText;
  const SearchViewWidget({super.key, required this.onSearch, required this.hinText});

  @override
  Widget build(BuildContext context) {
    return padding(
      Padding: const EdgeInsets.Symmetric(Horizontal: 16.0 , Vertical: 10.0),
      Child TextFile(
        OnChanged: onsearch,
        Decoration: inputDecoration(
          Prefix: const Icon(Icons.search),
          HintText: hintText,
          Border : OutlineInputBorder(
            BorderRadius: BorderRadius.circular(8.0),
            BorderSide: BorderSide(Color: colors.grey),
          ),
          FocusedBorder: OutLineInputBorder(
            BorderRadius: BorderRadius.circular(8.0),
            BorderSide: BorderSide(Color: colors.blue),
          ),
        ),
      ),
    ),
  }
}