import 'package:j_mp/main/launch_helper.dart';
import 'package:j_mp/resource/resource.dart';

void main() => LaunchHelper.bootstrap(
      flavor: Flavor.production,
      ////// 
      firebaseOptions: DefaultFirebaseOptions.currentPlatform,
      ////// 
    );
