import 'package:flutter/material.dart';
import 'package:vocabulary_learning/colors.dart';

class SearchComponent extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String text;

  const SearchComponent({Key? key, required this.onChanged, required this.text})
      : super(key: key);

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: kmainOrange.withOpacity(0.46),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 16,
          ),
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white),
          enabledBorder: new OutlineInputBorder(
             borderRadius: new BorderRadius.circular(15.0),
             borderSide: const BorderSide(width: 0, color: kNudeGrammar),
             
             
          ),
          border: OutlineInputBorder(),
          filled: true),
      onChanged: this.widget.onChanged,
    );
  }
}
