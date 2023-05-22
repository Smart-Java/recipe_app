import 'package:flutter/material.dart';
import 'package:home_test/config/appColors/app_colors.dart';

class RecipesCustomListItemWidget extends StatelessWidget {
  final String imageNetworkPath;
  final String title;
  final VoidCallback navFunctionality;
  const RecipesCustomListItemWidget({
    Key? key,
    required this.imageNetworkPath,
    required this.title,
    required this.navFunctionality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navFunctionality,
      child: SizedBox(
        height: 100.0,
        child: GridTile(
          footer: Container(
            height: 45.0,
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: AppColors.blackColor.withOpacity(0.8),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.whiteColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
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
        ),
      ),
    );
  }
}
