import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bodipo/data/models/temp/news_model.dart';
import 'package:flutter_bodipo/styles/data_formats.dart';
import 'package:flutter_bodipo/styles/main_theme.dart';
import 'package:flutter_bodipo/styles/text_style.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'bloc/news_bloc.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsBloc>(
      create: (BuildContext context) => NewsBloc()..add(InitialNewsDataEvent()),
      child: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
        return Scaffold(
            appBar: appBar(context), body: bodyWidget(context, state));
      }),
    );
  }

  Widget appBar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context).news),
      centerTitle: true,
    );
  }

  Widget bodyWidget(BuildContext context, NewsState _state) {
    return Builder(builder: (context) {
      if (_state is NewsInitialState) {
        return RefreshIndicator(
          onRefresh: () async {
            context.bloc<NewsBloc>().add(InitialNewsDataEvent());
            return true;
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              context.bloc<NewsBloc>().images.isNotEmpty
                  ? horizontalNews(context)
                  : Container(),
              vertiacalNews(context),
            ],
          ),
        );
      } else if (_state is NewsLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Container();
      }
    });
  }

  Widget horizontalNews(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 21),
      child: Container(
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: context.bloc<NewsBloc>().images.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == context.bloc<NewsBloc>().images.length - 1
                      ? 19
                      : 0),
              child: imageCard(context, context.bloc<NewsBloc>().images[index]),
            );
          },
        ),
      ),
    );
  }

  Widget imageCard(BuildContext context, String image) {
    return Padding(
      padding: const EdgeInsets.only(left: 19),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            width: 143,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          )),
    );
  }

  Widget vertiacalNews(BuildContext context) {
    return ListView.builder(
      itemCount: context.bloc<NewsBloc>().newsList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: index == context.bloc<NewsBloc>().newsList.length - 1
                  ? 24
                  : 0),
          child: textCard(context, context.bloc<NewsBloc>().newsList[index]),
        );
      },
    );
  }

  Widget textCard(BuildContext context, NewsModel _newsData) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: ColorPalette.mainLightDarkColor,
        ),
        padding: EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          _newsData.userName ?? '',
                          style: ProjectTextStyle.newsCardUserName,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          FormatsTheme.newsDate
                              .format(DateTime.parse(_newsData.postDate)),
                          style: ProjectTextStyle.grayText,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: Text(
                _newsData.data ?? '',
                style: ProjectTextStyle.newsCardData,
              ),
            ),
            textCardInfo(context, _newsData)
          ],
        ),
      ),
    );
  }

  Widget textCardInfo(BuildContext context, NewsModel _newsData) {
    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: Column(
        children: [
          Divider(
            height: 1,
            color: ColorPalette.textGrayBorderColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/ic_comment.svg'),
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Text(
                        AppLocalizations.of(context)
                            .comments(_newsData.comments.length),
                        style: ProjectTextStyle.grayText,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/ic_likes.svg'),
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Text(
                        AppLocalizations.of(context).likes(_newsData.likes),
                        style: ProjectTextStyle.grayText,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => context
                      .bloc<NewsBloc>()
                      .add(ShareNewsPressedEvent(newsData: _newsData)),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/ic_share.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 9),
                        child: Text(
                          AppLocalizations.of(context).share,
                          style: ProjectTextStyle.grayText,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
