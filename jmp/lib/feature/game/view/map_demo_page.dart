import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jmp/extension/extension.dart';

@RoutePage()
class MapDemoPage extends StatefulWidget {
  const MapDemoPage({super.key});

  @override
  State<MapDemoPage> createState() => _MapDemoPageState();
}

class _MapDemoPageState extends State<MapDemoPage> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl:
                  'https://firebasestorage.googleapis.com/v0/b/junior-movement-platform.appspot.com/o/Screenshot%202021-03-08%20at%2020.23%201.png?alt=media&token=32ba15e9-3e1a-442f-90d0-42dafaaa66eb',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    TextButton(
                      onPressed: () => context.router.pop(),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // borderRadius: BorderRadius.circular(30),
                          color: theme.backgroundColor,
                          shape: BoxShape.circle,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.chevronLeft,
                          color: theme.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      'Choose area for\n your adventure',
                      style: theme.titleLarge.copyWith(color: theme.backgroundColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(
                    'It will be generated around you.',
                    style: theme.titleMedium.copyWith(
                      color: theme.backgroundColor,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.fromBorderSide(BorderSide(color: theme.backgroundColor, width: 2)),
                    color: theme.primaryColor.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.locationPin,
                      color: theme.onPrimaryColor,
                    ),
                  ),
                ),
                const Spacer(flex: 2),
                Row(
                  children: [
                    const Spacer(flex: 5),
                    Column(
                      children: [
                        Text(
                          'Diameter',
                          style: theme.titleMedium.copyWith(
                            color: theme.backgroundColor,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '3,4 km',
                          style: theme.titleMedium.copyWith(
                            color: theme.backgroundColor,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 4),
                    FaIcon(
                      FontAwesomeIcons.locationCrosshairs,
                      color: theme.backgroundColor,
                    ),
                    const Spacer(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '1 km',
                      style: theme.titleMedium.copyWith(
                        color: theme.backgroundColor,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 2,
                          width: 250,
                          // width: double.infinity,
                          color: theme.backgroundColor,
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.backgroundColor,
                          ),
                          // width: double.infinity,
                        ),
                      ],
                    ),
                    Text(
                      '5 km',
                      style: theme.titleMedium.copyWith(
                        color: theme.backgroundColor,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                    decoration: BoxDecoration(
                      color: theme.backgroundColor,
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    child: const Text('Start adventure now'),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
