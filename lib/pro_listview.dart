import 'package:flutter/material.dart';

class ProListView extends StatefulWidget {
  final ListView listView;
  final Widget errorWidget, emptyWidget, moreLoadingWidget;
  final RefreshCallback onRefresh;

  ProListView(
      {@required this.listView,
      Key key,
      this.errorWidget,
      this.emptyWidget,
      this.moreLoadingWidget,
      this.onRefresh})
      : super(key: key);

  @override
  ProListViewState createState() => ProListViewState();
}

class ProListViewState extends State<ProListView> {
  bool _showMore = false,
      _showEmpty = false,
      _showError = false,
      _showList = true;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  showMoreProgress(bool b) {
    setState(() {
      _showMore = b;
    });
  }

  showErrorWidget() {
    setState(() {
      _showError = true;
      _showList = false;
      _showEmpty = false;
    });
  }

  showEmptyWidget() {
    setState(() {
      _showError = false;
      _showList = false;
      _showEmpty = true;
    });
  }

  showListView() {
    setState(() {
      _showError = false;
      _showList = true;
      _showEmpty = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: widget.onRefresh != null
          ? widget.onRefresh
          : () {
              return;
            },
      child: Stack(
        children: <Widget>[
          _showList ? Positioned.fill(child: widget.listView) : Container(),
          _showEmpty
              ? Positioned.fill(
                  child: widget.emptyWidget != null
                      ? widget.emptyWidget
                      : SizedBox.expand(child: Center(child: Text('Empty'))))
              : Container(),
          _showError
              ? Positioned.fill(
                  child: widget.errorWidget != null
                      ? widget.errorWidget
                      : SizedBox.expand(child: Center(child: Text('Error'))))
              : Container(),
          _showMore
              ? Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: widget.moreLoadingWidget != null
                      ? widget.moreLoadingWidget
                      : LinearProgressIndicator())
              : Container()
        ],
      ),
    );
  }
}
