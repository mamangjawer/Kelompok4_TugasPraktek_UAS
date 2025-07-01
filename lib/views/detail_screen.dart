import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../models/article_model.dart';
import 'utils/helper.dart';
import 'widgets/rich_text_widget.dart';

class DetailScreen extends StatelessWidget {
  final Article article;
  const DetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.keyboard_arrow_left_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              log('Bookmark onTap');
            },
            icon: Icon(Icons.bookmark_border_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage != null)
              Image.network(article.urlToImage!, height: 170.h),
            vsSmall,
            Text(
              article.title ?? 'No title',
              style: headline4.copyWith(fontWeight: semibold),
            ),
            vsTiny,
            RichTextWidget(
              textOne: article.source?.name ?? 'Unknown Source',
              textStyleOne: subtitle2.copyWith(color: cBlack),
              cTextOne: cBlack,
              textTwo:
                  article.publishedAt != null
                      ? DateFormat(
                        ' yyyy-MM-dd',
                      ).format(DateTime.parse(article.publishedAt!))
                      : 'No Date',
              textStyleTwo: subtitle2.copyWith(
                color: cBlack,
                fontWeight: semibold,
              ),
              cTextTwo: cBlack,
            ),
            vsTiny,
            Text(article.content ?? 'No content available', style: subtitle2),
          ],
        ),
      ),
    );
  }
}
