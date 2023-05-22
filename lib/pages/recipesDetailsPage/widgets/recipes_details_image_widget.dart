import 'package:flutter/material.dart';

class RecipesDetailsImageWidget extends StatelessWidget {
  final String imageNetworkPath;
  const RecipesDetailsImageWidget({Key? key, required this.imageNetworkPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      width: double.infinity,
      child: imageNetworkPath.isNotEmpty
          ? Image.network(
              imageNetworkPath,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const SizedBox(
                  height: 55,
                  width: 55,
                );
              },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: Text('Loading...'),
                );
              },
            )
          : const SizedBox(
              height: 55,
              width: 55,
            ),
    );
  }
}
