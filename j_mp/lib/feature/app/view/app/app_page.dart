part of 'app.dart';

/// {@template app_page}
/// This page is all about keeping the app running smoothly. It's responsible for initializing
/// and disposing all the necessary app-wide services, and for serving as the starting point of
/// the app. Let's get this show on the road!
/// {@endtemplate}
@RoutePage()
class AppPage extends StatefulWidget {
  /// {@macro app_page}
  const AppPage({
    super.key,
    @visibleForTesting this.isTest = false,
  });

  /// Testing nested routes from auto_route has proven to be quite hard,
  /// so in tests will render a Placeholder instead of AutoRouter
  @visibleForTesting
  final bool isTest;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with WidgetsBindingObserver {
  WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();
  AppCubit? cubit;

  @override
  void initState() {
    binding.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    binding.removeObserver(this);
    cubit?.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    cubit?.setLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>.value(
      value: cubit ??= AppCubit(
        flavor: context.flavor,
        router: context.router,
        permissionRepository: context.read<PermissionRepository>(),

        databaseRepository: context.read<DatabaseRepository>(),

        ////// 
        authenticationRepository: context.read<AuthenticationRepository>(),
        ////// 
        ////// 
        analyticRepository: context.read<AnalyticRepository>(),
        ////// 
        ////// 
        notificationRepository: context.read<NotificationRepository>(),
        ////// 
        ////// 
        deepLinkRepository: context.read<DeepLinkRepository>(),
        ////// 
        cacheRepository: context.read<CacheRepository>(),
        ////// 
        cloudFunctionRepository: context.read<CloudFunctionRepository>(),
        ////// 

        ////// 
        storageRepository: context.read<StorageRepository>(),
        ////// 
      )..initialize(),
      child: AppView(isTest: widget.isTest),
    );
  }
}
