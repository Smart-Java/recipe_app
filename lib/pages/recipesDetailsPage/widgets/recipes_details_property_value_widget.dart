import 'package:flutter/material.dart';

class RecipesDetailsProperyValueWidget extends StatelessWidget {
  final String property;
  final String value;
  final bool isItForDescription;
  const RecipesDetailsProperyValueWidget({
    Key? key,
    required this.property,
    required this.value,
    required this.isItForDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7.0),
      child: isItForDescription == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  property,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Text(
                    value,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Text(
                  property,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Text(
                      value,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
