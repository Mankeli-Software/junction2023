import 'package:jmp/main/launch_helper.dart';
import 'package:jmp/resource/resource.dart';

void main() => LaunchHelper.bootstrap(
      flavor: Flavor.staging,
      firebaseOptions: DefaultFirebaseOptions.currentPlatform,
    );
