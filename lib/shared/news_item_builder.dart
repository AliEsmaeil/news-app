import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';
import 'package:news_app/utils/navigator.dart';

class NewsItemBuilder extends StatelessWidget {
  final Map<String,dynamic> item;

  const NewsItemBuilder({super.key, required this.item});

  @override
  Widget build(BuildContext context){

    return InkWell(
      onTap: (){
        navigateTo(WebViewScreen(url: item['url']), context);
      },
      overlayColor: MaterialStateProperty.all(Colors.grey.shade300),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 350,
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      item['urlToImage']?? 'https://picsum.photos/200/300?random=${item['title'].codeUnits.first}' // random image generator because a new may have no image
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Expanded(
              child: Text(
                item['title'],
                style: Theme.of(context).textTheme.titleMedium ,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Text(
                    item['author']??'Unknown Author',
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                  ),
                ),
                Text(
                  item['publishedAt'],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
      
              ],
      
            )
          ],
        ),
      ),
    );


  }

}
