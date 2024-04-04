import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final place = state.listPlace!.details![index];
                        return GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                                height: 30,
                                width: 10,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  color: Colors.blue,
                                  elevation: 8,
                                  child:  Center(
                                    child: Text("${place.appellationCourante}" ),
                                  ),
                                )));
                      },
                      childCount: state.listPlace!.details!.length
                    ),
                  ),
                ],
              ));
  }
}
