import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_screen.dart';
import 'package:template_flutter_but/ui/screens/home/home.state.dart';
import 'package:template_flutter_but/ui/screens/home/paginate_scroll_listener.dart';

import 'home.viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends ConsumerState<HomeScreen> {
  PaginationScrollController paginationScrollController =
      PaginationScrollController();

  @override
  void initState() {
    super.initState();
    paginationScrollController.init(
        loadAction: () async => {ref.read(homeProvider.notifier).loadMore()});
  }

  @override
  void dispose() {
    paginationScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeProvider);

    return Scaffold(
        backgroundColor: Color.fromRGBO(85, 107, 47, 0.9),
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                controller: paginationScrollController.scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    title: Text('Monuments Historiques Roubaix'),
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text('Découvrez les monuments!'),
                      //// Your stretchable text
                      background: Container(
                        color: Colors.deepOrangeAccent,
                        height: 200, // Adjust the height if needed
                      ),
                    ),
                    expandedHeight: 200, // Adjust the height as needed
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Color(0xff5c63f1),
                      height: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(85, 107, 47, 0.9),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final place = state.listPlace!.details[index];
                      return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DetailViewScreen(resultEntity: place),
                                ],
                              ),
                            );
                          },
                          child: Card(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              color: Color.fromRGBO(5, 107, 47, 1.0),
                              elevation: 8,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Column(children: [
                                        if (place.photo != null)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: SizedBox(
                                                width: 100,
                                                height: 85,
                                                child: Image.network(
                                                  place.photo!.url!,
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                      ]),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Text(
                                                      "${place.appellationCourante}")),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Center(
                                                  child: Text(
                                                      "${place.adresseBanSig} ${place.epoque}",
                                                      overflow: TextOverflow
                                                          .ellipsis)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("${place.auteur}",
                                          style: const TextStyle(fontSize: 10),
                                          overflow: TextOverflow.clip)
                                    ],
                                  ),
                                ],
                              )));
                    }, childCount: state.listPlace?.details.length),
                  ),
                ],
              ));
  }

// LinearGradient getGradient(List<String> colors) {
//   return LinearGradient(
//     colors: colors.map((colorStr) => rgbaToColor(colorStr)).toList(),
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );
// }
//
// Color rgbaToColor(String rgba) {
//   final List<int> colorComponents = rgba
//       .substring(5, rgba.length - 1)
//       .split(',')
//       .map((str) => int.parse(str.trim()))
//       .toList();
//   return Color.fromRGBO(
//       colorComponents[0], colorComponents[1], colorComponents[2],255);
// }
}
