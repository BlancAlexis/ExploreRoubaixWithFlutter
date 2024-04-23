import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:template_flutter_but/domain/entities/result_entity.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_state.dart';
import 'package:template_flutter_but/ui/screens/detail_view/detail_view_viewmodel.dart';

class DetailViewScreen extends ConsumerStatefulWidget {
  const DetailViewScreen({super.key, required this.resultEntity});

  final ResultEntity resultEntity;

  @override
  ConsumerState<DetailViewScreen> createState() =>
      _DetailViewModal(resultEntity);
}

class _DetailViewModal extends ConsumerState<DetailViewScreen> {
  _DetailViewModal(ResultEntity resultEntity);

  @override
  Widget build(BuildContext context) {
    DetailViewState state = ref.watch(detailProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                state.resultEntity?.appellationCourante ?? '',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            if (state.resultEntity?.photo != null)
              SizedBox(
                width: double.infinity,
                height: 200,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                    // Optional rounded corners
                    image: DecorationImage(
                      image: NetworkImage(state.resultEntity!.photo!.url!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Adresse du lieu",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left),
            ),
            Text(state.resultEntity?.adresseBanSig ?? ''),
            Text(
                //'Latitude: ${state.resultEntity?.lat?.substring(0, 6) ?? ''} Longitude: ${state.resultEntity?.long?.substring(0, 6) ?? ''}',
                'a',
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            Text(
              'années : ${state.resultEntity?.epoque ?? ''}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Center(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Détails sur la protection du monument',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left),
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(state.resultEntity?.historique ?? '',
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: LikeButton(
                onTap: (isLiked) async {
                  await ref
                      .read(detailProvider.notifier)
                      .putFavPlaces(state.resultEntity!);
                  return !isLiked;
                },
                circleColor: CircleColor(
                    start: Color(0xffe57fa6), end: Color(0xff907fbc)),
                bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xffe57fa6),
                    dotSecondaryColor: Color(0xff907fbc)),
                likeBuilder: (bool isLiked) {
                  return Icon(
                    Icons.favorite,
                    color: isLiked ? Colors.red : Colors.grey,
                    size: 35.0,
                  );
                },
                padding: EdgeInsets.all(15.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    ref.read(detailProvider.notifier).init(widget.resultEntity);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
