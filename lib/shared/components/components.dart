

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget BuildArticleItem(article, context) => InkWell(

  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(


    padding: const EdgeInsets.all(20.0),



    child: Row(



      children: [



        Container(



          width: 120.0,



          height: 120.0,



          decoration: BoxDecoration(



            borderRadius: BorderRadius.circular(10.0),



            image: article['urlToImage'] != null ?DecorationImage(



              image: NetworkImage('${article['urlToImage']}'),



              fit: BoxFit.cover,



            ) :DecorationImage(image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/3/34/ErrorMessage.png'),



            fit: BoxFit.cover,



            ),



          ),



        ),



        SizedBox(



          width: 20.0,



        ),



        Expanded(



          child: Container(



            height: 120.0,



            child: Column(



              crossAxisAlignment: CrossAxisAlignment.start,



              mainAxisAlignment: MainAxisAlignment.start,



              children: [



                Expanded(



                  child: Text('${article['title']}',



                    style: Theme.of(context).textTheme.bodyText1,



                    maxLines: 3,



                    overflow: TextOverflow.ellipsis,



                  ),



                ),



                Text('${article['publishedAt']}',



                  style: TextStyle(



                    color: Colors.grey,



                  ),



                ),



              ],



            ),



          ),



        ),



      ],



    ),



  ),
);

Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget articleBuilder(list, context, {isSearch = false }) => ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) =>ListView.separated(
      itemBuilder: (context, index) => BuildArticleItem(list[index], context),
      separatorBuilder: (context, index) => myDivider(),
      itemCount: list.length),
  fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  // required Function OnSubmit,
  Function(String)? onChange,
  //required Function onTap,
  required Function validate,
  required String Label,
  required IconData prefix,
  bool isClickable = true,
}
    ) => TextFormField
  (
  enabled: isClickable,
  controller: controller,
  keyboardType: type,
  // onFieldSubmitted: OnSubmit(),
  onChanged: onChange,
  //onTap:  ()
 // {
  //  onTap();
  //},
  validator: (String? value)
  {
    return validate(value);
  },
  decoration: InputDecoration(
    labelText: Label,
    prefixIcon: Icon(prefix),
    border: OutlineInputBorder(),
  ),
);

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);