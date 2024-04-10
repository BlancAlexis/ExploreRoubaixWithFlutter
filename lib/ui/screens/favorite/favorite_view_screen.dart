
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_state.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_viewmodel.dart';
import 'package:template_flutter_but/ui/screens/favorite/favorite_view_state.dart';
import 'package:template_flutter_but/ui/screens/favorite/favorite_view_viewmodel.dart';
import 'package:template_flutter_but/ui/screens/home/home.state.dart';


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
    ref.read(favoriteProvider.notifier).init();
    if(state.loading){
return const Center(child: CircularProgressIndicator());    }
    else {
      return Column(
        children: [
          Text("Favorite"),
          CustomScrollView(
            slivers: <Widget>[
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SearchGifPage(
                        //       selectedCategory: categories[index].name,
                        //     ),
                        //   ),
                        // );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Image.network(
                          //   categories[index].image,
                          //   fit: BoxFit.cover,
                          // ),
                          Text(
                              "sssss"
                            // '${categories[index].name}',
                            // style: TextStyle(
                            //   color: Colors.white,
                            //   fontSize: 16.0,
                            //   fontWeight: FontWeight.bold,
                            //   shadows: [
                            //     Shadow(
                            //       offset: Offset(2.0, 2.0),
                            //       blurRadius: 4.0,
                            //       color: Colors.black.withOpacity(0.5),
                            //     ),
                            //   ],
                            // ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: state.resultsEntity!.length,
                ),
              ),
            ],
          ),
        ],
      );
    }
}

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();


  }

}


