import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_app/commons/text_style_helper.dart';
import 'package:soccer_app/pages/main/widgets/image_loader_widget.dart';
import 'package:soccer_app/pages/main/widgets/loading_widget.dart';
import 'package:soccer_app/pages/soccer_fields_list/bloc/soccer_fields_bloc.dart';

import '../../commons/theme_helper.dart';
import '../../core/widgets/custom_app_bar.dart';

class SoccerFieldsListPage extends StatefulWidget {
  const SoccerFieldsListPage({Key? key}) : super(key: key);

  @override
  State<SoccerFieldsListPage> createState() => _SoccerFieldsListPageState();
}

class _SoccerFieldsListPageState extends State<SoccerFieldsListPage> {
  late SoccerFieldsBloc _soccerFieldsBloc;

  @override
  void initState() {
    _soccerFieldsBloc = BlocProvider.of(context);
    _soccerFieldsBloc.add(GetSoccerFieldsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.blueGrey,
      appBar: customAppBar(context, title: 'Поля'),
      body: RefreshIndicator(
        onRefresh: () async => _soccerFieldsBloc.add(GetSoccerFieldsEvent()),
        child: BlocConsumer<SoccerFieldsBloc, SoccerFieldsState>(
          bloc: _soccerFieldsBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingSoccerFieldsState) {
              return LoadingWidget(
                width: MediaQuery.of(context).size.width,
                height: 200,
              );
            }

            if (state is LoadedSoccerFieldsState) {
              var length = state.soccerFields.soccerFieldsList?.length ?? 0;
              return ListView.separated(
                itemCount: length,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                itemBuilder: (context, index) {
                  var soccerFields =
                      state.soccerFields.soccerFieldsList?[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: ThemeHelper.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                          child:
                              ImageLoaderWidget(imageUrl: soccerFields?.image),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 1,
                            vertical: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                soccerFields?.name ?? '',
                                style: TextStyleHelper.f20w600,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                soccerFields?.address ?? '',
                                style: TextStyleHelper.f16w500
                                    .copyWith(color: ThemeHelper.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
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
