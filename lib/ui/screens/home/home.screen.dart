import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_screen.dart';
import 'package:template_flutter_but/ui/screens/home/home.state.dart';

import 'home.viewmodel.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeProvider);

    return Scaffold(
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: <Widget>[
                  const SliverAppBar(title: Center(child: Text('Home Screen'))),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final place = state.listPlace!.details![index];
                      return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  DetailViewScreen(resultEntity: place),
                                ],
                              ),
                            );
                          },
                          child: Container(
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  color: Colors.blue,
                                  elevation: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.yellow,
                                          Colors.orangeAccent,
                                          Colors.yellow.shade300,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
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
                                                            overflow:
                                                                TextOverflow
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
                                                style: const TextStyle(
                                                    fontSize: 10),
                                                overflow: TextOverflow.clip)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))));
                    }, childCount: state.listPlace?.details?.length ?? 0),
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
