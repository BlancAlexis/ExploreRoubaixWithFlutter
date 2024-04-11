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

    return Scaffold(
      body: Center(
            child: Text("MOI", style: TextStyle(fontSize: 20, color: Colors.blue)),
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
