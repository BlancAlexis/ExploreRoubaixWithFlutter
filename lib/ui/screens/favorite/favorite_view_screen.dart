import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';
import 'package:template_flutter_but/ui/screens/favorite/favorite_view_state.dart';
import 'package:template_flutter_but/ui/screens/favorite/favorite_view_viewmodel.dart';

import '../detail_view/detail_view_screen.dart';

class FavoriteViewScreen extends ConsumerStatefulWidget {
  const FavoriteViewScreen({super.key});

  @override
  ConsumerState<FavoriteViewScreen> createState() => _FavoriteViewScreen();
}

class _FavoriteViewScreen extends ConsumerState<FavoriteViewScreen> {
  _FavoriteViewScreen();

  @override
  Widget build(BuildContext context) {
    FavoriteViewState state = ref.watch(favoriteProvider);
    return Scaffold(
        body: state.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state.listrResultEntity.isEmpty
                ? const Center(
                    child: Text(
                    "Vous n'avez aucun favori pour le moment",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ))
                : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              ResultEntity resultEntity = state.listrResultEntity[index];
                              return GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    showDragHandle: true,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) => Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        DetailViewScreen(
                                            resultEntity: resultEntity),
                                      ],
                                    ),
                                  );
                                },
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: ClipRRect(
                                                child: SizedBox(
                                                  height: 200,
                                                  child: Image.network(
                                                    resultEntity.photo!.url!,
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Center(
                                                child: Text(
                                                  resultEntity.appellationCourante,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.bold,
                                                    shadows: [
                                                      Shadow(
                                                        offset: const Offset(
                                                            2.0, 2.0),
                                                        blurRadius: 4.0,
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              );
                            },
                            childCount: state.listrResultEntity.length,
                          ),
                        ),
                      ],
                    ),
                  ));
  }

  @override
  void initState() {
    super.initState();
    ref.read(favoriteProvider.notifier).init();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
