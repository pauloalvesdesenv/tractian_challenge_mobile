import 'package:assets_follow_up/src/di/inejctable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
Future<void> configureDependencies() async {
  GetIt.instance.init();
}
