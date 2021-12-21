import 'package:get/get_rx/src/rx_types/rx_types.dart';

mixin LoadingController {
  bool get loading => _loading.value;

  final RxBool _loading = true.obs;

  void toggleLoading() => _loading.value = !_loading.value;

  void setLoading(bool value) => _loading.value = value;
}
