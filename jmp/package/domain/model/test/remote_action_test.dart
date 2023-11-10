import 'package:flutter_test/flutter_test.dart';
import 'package:model/model.dart';

void main() {
  group('RemoteAction', () {
    final pushRouteActionJson =
        const PushRouteAction(routeName: 'mock-route').toJson();
    test('uses value equality', () {
      expect(
        const PushRouteAction(routeName: 'mock-route-name'),
        equals(const PushRouteAction(routeName: 'mock-route-name')),
      );

      expect(
        RemoteAction.fromJson(pushRouteActionJson),
        RemoteAction.fromJson(pushRouteActionJson),
      );
    });

    test('fromJson returns correct type', () {
      final action = RemoteAction.fromJson(
        const PushRouteAction(routeName: 'mock-route').toJson(),
      );
      expect(action, isA<PushRouteAction>());
    });

    test('toJson returns correct type', () {
      final action = RemoteAction.fromJson(pushRouteActionJson);
      final actionJson = action.toJson();

      expect(actionJson.toString(), pushRouteActionJson.toString());
    });

    test(
        'fromJson returns InvalidRemoteAction '
        'when parameters are malformatted for PushRouteAction', () {
      final action = RemoteAction.fromJson({
        'type': 'push_route',
      });

      expect(action, isA<InvalidRemoteAction>());
    });

    test(
        'fromJson returns InvalidRemoteAction '
        'when parameters do not contain type', () {
      final action = RemoteAction.fromJson({});

      expect(action, isA<InvalidRemoteAction>());
    });
  });
}
