import 'package:flutter/material.dart';

class SearchForm extends StatefulWidget {
  final Function(String) onSearch;

  const SearchForm({super.key, required this.onSearch});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(),
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
          //<-- SEE HERE
          borderSide: BorderSide(width: 3, color: Colors.white),
        ),
        constraints: BoxConstraints(maxHeight: 48),
        hintText: "Search..",
        fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.search),
        prefixIconColor: Colors.white,
      ),
      //  textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 18, color: Colors.white),
      onSubmitted: ((value) {
        widget.onSearch(value);
      }),
    );
  }
}
