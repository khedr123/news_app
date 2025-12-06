import 'package:flutter/material.dart';
import 'package:news_app/features/home/data/models/article_model.dart';

import '../../../../core/utilises/colors/colors.dart';

class TrendingNewsItemWidget extends StatelessWidget {
  const TrendingNewsItemWidget({
    super.key,
    required this.article,
    required this.index,
  });

  final ArticleModel article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(color: Colors.red, fontSize: 22),
          ),
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(25),
              child: Image.network(article.image, width: 150),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  softWrap: true,
                  maxLines: 1,
                  textWidthBasis: TextWidthBasis.parent,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  article.author,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
