import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/commons/text_style_helper.dart';
import 'package:soccer_app/core/router/app_router.gr.dart';
import 'package:soccer_app/pages/main/widgets/image_loader_widget.dart';
import 'package:soccer_app/pages/main/widgets/loading_widget.dart';
import 'package:soccer_app/pages/news_list/bloc/news_bloc.dart';

import '../../commons/theme_helper.dart';
import '../../core/widgets/custom_app_bar.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  State<NewsListPage> createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  late NewsBloc _newsBloc;

  @override
  void initState() {
    _newsBloc = BlocProvider.of(context);
    _newsBloc.add(GetNewsListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.blueGrey,
      appBar: customAppBar(context, title: 'Новости'),
      body: RefreshIndicator(
        onRefresh: () async => _newsBloc.add(GetNewsListEvent()),
        child: BlocConsumer<NewsBloc, NewsState>(
          bloc: _newsBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingGetNewsListState) {
              return LoadingWidget(
                width: MediaQuery.of(context).size.width,
                height: 400,
              );
            }
            if (state is LoadedGetNewsListState) {
              var newsList = state.newsListModel.newsList!;
              return ListView.separated(
                itemCount: newsList.length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                itemBuilder: (context, index) {
                  var news = newsList[index];
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      foregroundColor: ThemeHelper.blueGrey,
                      backgroundColor: ThemeHelper.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child: ImageLoaderWidget(imageUrl: news.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                news.title ?? '',
                                style: TextStyleHelper.f20w600,
                              ),
                              Text(
                                news.subtitle ?? '',
                                maxLines: 5,
                                style: TextStyleHelper.f16w500
                                    .copyWith(color: ThemeHelper.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => context.router.push(
                      NewsPageRoute(newsModel: news),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 25),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
