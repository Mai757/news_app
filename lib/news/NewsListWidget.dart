
import 'package:flutter/material.dart';
import 'package:news_app/api/model/Source.dart';
import 'package:news_app/common/base/BaseState.dart';
import 'package:news_app/news/NewsViewModel.dart';
import 'package:news_app/news/NewsWidget.dart';
import 'package:provider/provider.dart';
import 'package:news_app/common/UiErrorWidget.dart';
import 'package:news_app/common/LoadingStateWidget.dart';
class NewsListWidget extends StatefulWidget {
  Source? source;
   NewsListWidget(this.source ,{super.key});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
   NewsViewModel viewModel = NewsViewModel();

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source?.id??'');
  }

  @override
  void didUpdateWidget(covariant NewsListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.source != widget.source){
      viewModel.getNewsBySourceId(widget.source?.id??"");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: MultiProvider(
        providers: [
          Provider<NewsViewModel>(create: (_)=>viewModel),
        ],
        builder: (context, child) {
        return Consumer<NewsViewModel>(builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch(state){
            case ErrorState():
              {
                return ErrorStateWidget(serverError: state.serverError,
                    error: state.error,
                    retryButtonText: "Try Again",
                    retryButtonAction: () =>
                        viewModel.getNewsBySourceId(widget.source?.id ?? "")
                );
              }
            case SuccessState():
              {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return Newswidget(state.data[index]);
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 12,),
                    itemCount: state.data.length ?? 0);
              }
            case LoadingState():{
                return LoadingStateWidget(state.message);
              }
          }

        },);

        },),





   );

    }

}
