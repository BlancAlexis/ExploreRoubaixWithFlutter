import 'package:flutter/cupertino.dart';

class PaginationScrollController {
  late ScrollController scrollController;
  bool isLoading = false;
  bool stopLoading = false;
  int currentMaxItem = 1;
  double boundaryOffset = 0.5;
  late Function loadAction;

  void init({Function? initAction, required Function loadAction}) {
    if (initAction != null) {
      initAction();
    }
    this.loadAction = loadAction;
    scrollController = ScrollController()..addListener(scrollListener);
  }

  void dispose() {
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
  }

  void scrollListener() {
    if (!stopLoading) {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent * boundaryOffset &&
          !isLoading) {
        isLoading = true;
        loadAction().then((shouldStop) {
          isLoading = false;
          currentMaxItem++;
          boundaryOffset = 1 - 1 / (currentMaxItem * 2);
          if (shouldStop == true) {
            stopLoading = true;
          }
        });
      }
    }
  }
}
