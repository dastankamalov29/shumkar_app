import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soccer_app/commons/theme_helper.dart';

class ImageLoaderWidget extends StatelessWidget {
  const ImageLoaderWidget({Key? key, required this.imageUrl}) : super(key: key);

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    var defaulImage =
        'https://neurobet.ru/wp-content/uploads/2020/03/news-bg.png';
    return Image.network(
      imageUrl ?? defaulImage,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            color: ThemeHelper.black,
          ),
        );
      },
    );
  }
}
