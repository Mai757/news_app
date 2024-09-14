
import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManager.dart';
import 'package:news_app/common/LoadingStateWidget.dart';
import 'package:news_app/common/base/BaseState.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/news/NewsViewModel.dart';
import 'package:news_app/tabs/tab_widget.dart';
import'package:news_app/categories/categoryDetailsViewModel.dart';
import 'package:provider/provider.dart';
import 'package:news_app/common/UiErrorWidget.dart';


class CategoryDetails extends StatefulWidget {
  Category category ;

   CategoryDetails(this.category);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
   var viewModel = CategoryDetailsViewModel();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
    builder: (context, child) {
        return Consumer<CategoryDetailsViewModel>(
          builder:(context, viewModel, child) {
            var state = viewModel.state;
            switch (state) {
              case ErrorState():{
                   return ErrorStateWidget(
                     serverError: state.serverError,
                     error: state.error,
                   );
                }
              case SuccessState():{
                  return TabWidget(state.data);
                }
              case LoadingState():{
                  return LoadingStateWidget(state.message);
                }
            }
          },
        );
        }



        );


  }
}
