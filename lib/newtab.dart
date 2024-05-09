import 'package:compass_browser/provider/link_provider.dart';
import 'package:flutter/material.dart';

class NewTab extends StatelessWidget {
  const NewTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search or type URL',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
          onChanged: (value) {
            LinkProvider().updateLink(value);
            debugPrint(LinkProvider().currentLink);
          },
          onFieldSubmitted: (value) {
            if (value.isNotEmpty) {
              Navigator.of(context).pushReplacementNamed('/opentab');
            }
          },
        ),
      ],
    );
  }
}
