import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var list = NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  onChange: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value)
                  {
                    if (value.isEmpty)
                    {
                      return 'Search must not be empty';
                    }
                  },
                  Label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true,)),
            ],
          ),
        );
      },
    );
  }
}
