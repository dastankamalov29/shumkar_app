import 'package:flutter/material.dart';
import 'package:soccer_app/core/models/news_model.dart';
import 'package:soccer_app/pages/main/widgets/image_loader_widget.dart';
import '../../commons/text_style_helper.dart';
import '../../core/widgets/custom_app_bar.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key, required this.newsModel}) : super(key: key);

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Новости'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                newsModel.title ?? '',
                style: TextStyleHelper.f25w700,
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageLoaderWidget(imageUrl: newsModel.image),
              ),
              const SizedBox(height: 20),
              Text(
                newsModel.subtitle ?? '',
                style: TextStyleHelper.f25w700,
              ),
              const SizedBox(height: 30),
              Text(
                newsModel.text ?? '',
                style: TextStyleHelper.f18w500,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
