import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            if (state.resultEntity?.photo != null)
              SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(state.resultEntity!.photo!.url!,
                      fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(state.resultEntity?.historique ?? '',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.justify),
            ),
            Text(
                'Latitude: ${state.resultEntity?.lat?.substring(0, 6) ?? ''} Longitude: ${state.resultEntity?.long?.substring(0, 6) ?? ''}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left),
            Text(
              'années : ${state.resultEntity?.epoque ?? ''}',
            ),
            const Center(
                child: Column(
              children: <Widget>[
                Text('Détails sur la protection du monument',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ],
            )),

            // Text(data)
            // Text(data)
            Container(
              alignment: Alignment.centerRight,
              child: RawMaterialButton(
                onPressed: () async {
                  await ref
                      .read(detailProvider.notifier)
                      .putFavPlaces(state.resultEntity!);
                },
                elevation: 15.0,
                fillColor: Colors.white,
                child: Icon(
                  color: _getColor(state.resultEntity!.isFav),
                  Icons.favorite,
                  size: 35.0,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(bool isFav) {
    if (isFav == true) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
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
