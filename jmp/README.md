
[![style: mankeli analysis][mankeli_analysis_badge]][mankeli_analysis_badge_link]



# Project Overview
A Flutter app template that gives an unfair head start to the development of a new application. This project comes preconfigured with
- **flavors** - *different environments for `development`, `staging` and `production`*
- **app icons** - *different app icons for each flavor and easy ways of customizing them*
- **splash screens** - *different splash screens for each flavor and easy ways of customizing them*
- **localizations** - *localize your app to multiple languages with ease*
- **tool** - *speed up the development process with custom scripts*
- **editor settings & snippets** - *development environment setup is minimal, as most of the useful settings and snippets for VSCode comes from `dot_vscode` brick*
- **github settings and workflows** - *collabrating with others is made easy with CI/CD pipelines and github configs from `dot_github` brick*
- **features and packages** - *we have bricks which help implement new features and packages blazingly fast*
- **permission handling, routing & more** - *this project has plenty of useful packages and features already implemented*
- **good practices & clean architecture** - *this project follows the good practices used internally at Mankeli Solutions*


# Table of contents
- [Project Overview](#project-overview)
- [Table of contents](#table-of-contents)
- [Quick Start 🚀](#quick-start-)
  - [setup environment](#setup-environment)
  - [setup new project](#setup-new-project)
- [Architecture 🏛️](#architecture-️)
  - [application layer](#application-layer)
  - [domain layer](#domain-layer)
  - [data layer](#data-layer)
- [Project Walkthrough 🦮](#project-walkthrough-)
  - [flavors](#flavors)
  - [derry](#derry)
  - [conventional commits](#conventional-commits)
  - [mankeli CLI](#mankeli-cli)
  - [code gen](#code-gen)
  - [tool](#tool)
- [Development 🧑🏼‍💻](#development-)
  - [router](#router)
  - [assets](#assets)
  - [app icons \& splash screen](#app-icons--splash-screen)
  - [localizations](#localizations)
  - [snippets](#snippets)
  - [packages](#packages)
  - [subfeatures](#subfeatures)




# Quick Start 🚀
## setup environment
1. Download Flutter SDK by following the [official documentation][1]
2. Download VSCode by following the [official documentation][2].
3. Activate derry
    ```sh
    dart pub global activate derry
    ```
4. Activate mankeli_cli
    ```sh
    dart pub global activate https://github.com/Mankeli-Software/mankeli_cli.git --source=git --git-ref=main
    ```
    NOTE: if you don't have the necessary permissions to mankeli_cli, don't hesitate to message contact@mankeli.co
## setup new project
1. Create a new project
    ```sh
    mankeli gen j_mp
    ```
2. Navigate to the newly created directory
    ```sh
    cd <project_name>
    ```
3. Install VSCode settings and snippets
    ```sh
    mankeli gen dot_vscode
    ```
4. Install github settings and workflows
    ```sh
    mankeli gen dot_github
    ```
5. Open project in VSCode, and install the recommended extensions when prompted
    ```sh
    code .
    ```

# Architecture 🏛️
![architecture diagram][3]
The architecture of j_mp is divided into 3 layers; `application`, `domain` and `data`. Let's walk through the layers one-by-one, starting from the one closest to the user.

## application layer 
Everything the user sees belongs to this layer, making it responsible for presentation logic. The main building blocks of this layer are `views`, `cubits` and `states`.

 A `cubit` contains all of the business logic in application layer. It defines **when** should something be displayed to the user. It interacts with one or more `repositories`, and updates a `state` based on the data received.

 A `state` is the foundation of a `view`; it defines **what** to render.

 A `view` is the part that interacts directly with the user. It defines **how** to render the `state`.

## domain layer
This layer acts as a middleman between application layer and data layer. It receives raw data from data layer, filters it and serializes into domain models, which the application layer can consume. The main building blocks of this layer are `repositories` and `domain models`. 

A repository can depend on one or more `data providers`, and can be used by one or more `cubits`.

A `domain model` is a dart class, which makes the data accessible and easy to use for application layer.

## data layer
This layer is the furthest from the user. It is responsible for interacting with raw data providers, databases, hardware and native libraries or features. 

Usually this layer is implemented by the Flutter community, and used through packages on [pub.dev][4]. However, sometimes it may be self implemented, ie. an API client.

# Project Walkthrough 🦮
This section contains stuff that's good to know about the project setup.

## flavors
This project uses [flavors][17] to enable different environments. There are three different environments for this app; `development`, `staging` and `production`. These environments may use different databases, API endpoints or have some other differentiating config. There are derry scripts and VSCode launch settings to enable running and building the app easily with different flavors. To add new config for the flavors, please take a look at the files under `lib/main/`.


> `development` is used by the devs to implement and try new features. 

> `staging` is used by external or internal testers, who test and validate the app before production release.

> `production` is used by the end users of the application.

## derry
[Derry][5] is a command line tool, which makes it possible to define project-wide scripts and run them with ease. 

Derry functions much like the scripts in npm projects. The scripts can be defined in `derry.yaml` (which is referenced in `pubspec.yaml`), and run with

```sh
derry <script-name>
```

To list all the available scripts, run 
```sh
derry ls
```

## conventional commits
[Conventional commits][7] is a specification for adding human and machine readable meaning to commit messages. It allows us to automatically bump version numbers and create changelogs based on the commit messages.

The structure of a conventional commit is as follows

```
<type>(<optional scope>): <description>

<optional body>

<optional footer(s)>
```

Since the syntax is very specific and prone to errors, we recommend using the conventional commit tools from `mankeli CLI` (see below)

## mankeli CLI
[Mankeli CLI][6] is a command line tool, which aims to ease and speed the development at Mankeli Solutions Oy. It has commands for making conventional commits, using our internal mason bricks and more! See its own github repo for more detailed and up to date info! Here we'll just go through the most useful commands for this projects sake.

To make conventional commits easily, run
```sh
mankeli git conjure
```
_NOTE: this command shall be ran at the root of the project._

To add new local packages, run
```sh
mankeli gen mhs_flutter_package
```
_NOTE: this command shall be ran in the directory where the package will be created._

To add new subfeatures, run
```sh
mankeli gen mhs_flutter_subfeature
```
_NOTE: this command shall be ran at the root of the project._

## code gen
This project takes advantage of code generation. It uses [package:build_runner][8] to run the generators. To customize the behavior of the generator, edit `build.yaml` in the root of the project. Here are other few handy code gen packages used in this project.

- [package:freezed][9] to generate immutable classes
- [package:json_serializable][10] to generate serialization functions for dart classes
- [package:auto_route][11] to generate router related boilerplate
- [package:flutter_gen][12] to generate asset related boilerplate
- [package:intl][16] to generate localization related boilerplate
- [package:icons_launcher][13] to generate app icons
- [package:flutter_native_splash][14] to generate splash screens
- [package:mason][15] to generate custom reusable bricks of code (from Mankeli-Solutions/mason)

Running the generators is as simple as 
```sh
derry gen asset # This will generate platform specific configurations for splash screens and app icons
```
OR
```sh
derry gen code # This will generate boilerplate dart code
```

## tool
This project comes with its own lightweight dart package, `tool/`, which aims to speed up the development process by automating repetitive tasks. 

This tool contains dart scripts, which are easy to run from the command line
```dart
dart tool/script/my_script.dart
```

To make running these scripts even easier, add entries for the scripts into `derry.yaml`.

For instance you could add
```yaml
my_script:
    - dart tool/script/my_script.dart
```

And this would shorten the syntax of running the script to
```sh
derry my_script
```


# Development 🧑🏼‍💻
This section contains concrete steps on how to do certain common tasks in this project.

## router
To add a new entry to router
1. Annotate your router entry widget with `@RoutePage()`
    ```dart
    @RoutePage() // Add this annotation to your routable pages    
    class MyPage extends StatelessWidget {}     
    ```
2. Open `lib/utility/src/app_router.dart`
3. Inside `AppRouter`, add a new `AutoRoute` inside `routes`
    ```dart
    @AutoRouterConfig()
    class AppRouter extends _$AppRouter {
        @override
        List<AutoRoute> get routes => [
                AutoRoute(
                    page: MyRoute.page, // Notice how MyPage -> MyRoute, this is the case because MyRoute is a generated class, whereas MyPage is the original widget.
                ),
            ];
    }
    ```
4. Run the generator
    ```sh
    derry gen code
    ```
5. Push your route
    ```dart
    context.router.navigate(const MyRoute());
    ```

To create new route guards
1. Extend `AutoRouteGuard` or `AutoRedirectGuard`
    ```dart
    class AuthGuard extends AutoRouteGuard {}
    ```
2. Override `onNavigation` method. Call `resolver.next()` to allow / forbid the new route. For instance this guard won't open a route unless authenticated.
    ```dart
    class AuthGuard extends AutoRedirectGuard {
        AuthGuard(this.authRepo) {
            authRepo.authenticationStream.listen((e) {
                /// React to changes in auth stream
                reevaluate();
            });
        }

        final AuthenticationRepository authRepo;

        @override
        void onNavigation(
            NavigationResolver resolver,
            StackRouter router,
        ) {
            if (isAuthenticated) {
                // if some condition is met
                resolver.next();
            } else {
                // we may push other pages
                router.push(
                    AuthenticationRoute(onResult: (success) {
                        resolver.next(success);
                        router.removeLast();
                    }),
                );
            }
        }

        @override
        Future<bool> canNavigate(RouteMatch<dynamic> route) {
            return Future.value(true);
        }
    }
    ```
3. Use the guard in a router entry
    ```dart
    AutoRoute(
        page: MyRoute.page,
        guards: [AuthGuard(authRepo)],
    ),
    ```
4. Run the generator
    ```sh
    derry gen code
    ```


## assets
To add new assets
1. Place your new assets under the `asset/` folder (you may create subfolders)
2. If you created subfolders, reference the subfolders in `pubspec.yaml`
    ```yaml
    flutter:
      assets:
        - asset/svg/
        - asset/app/development/
        - asset/app/staging/
        - asset/app/production/
        - asset/<your>/<new>/<folder>/
    ```
3. Run the generator
    ```sh
    derry gen code
    ```
4. Use the assets
    ```dart
    // Access ie. image through generated class [Assets]
    return Image.asset(
        Assets.app.development.icon.path,
    );

    // OR, the generator creates boilerplate widgets
    return Assets.app.development.image();
    ```


## app icons & splash screen
To customize app icons and splash screen
1. Make a copy of this [figma template][18]
2. Edit the components to your liking
3. Export the generated icons under `asset/app/<flavor>`
   
    *NOTE: each flavor has its own folder under `asset/app/`, be careful to export the correct assets under the correct folder.*
4. Run generator
    ```sh
    derry gen asset
    ```

## localizations
To add new localized strings
1. Open `l10n/intl_en.arb`
2. Use `arb_entry` VSCode snippets to add new entries
3. Save the file
   
    *NOTE: this will run code generators which create the necessary dart boilerplate*
4. Use the localized string
    ```dart
    /// This is the long syntax
    final value1 = AppLocalizations.of(context)!.<key>;
    
    /// This is the short syntax
    final value2 = context.localizations.<key>;
    ```

## snippets
This project contains loads of code snippets from `dot_vscode` brick. If you find yourself writing repetitive code over and over, consider adding a code snippet for it to `Mankeli-Solutions/dot_vscode`. All of the company-wide snippets are stored there, so they can be easily fetched to every project.

If you are creating a snippet which is only relevant to this project, add it to the pre-defined file `.vscode/<project-name>.code-snippets`.

## packages
To add local packages or create global packages
1. Use the brick from mankeli_cli
    ```sh
    mankeli gen mhs_flutter_package
    ```

    *NOTE: make sure to run this in the directory where the package shall be created. For local packages specific to a project, place the package under `package/<layer>/`, where layer is the architecture layer the package belongs to (`application`, `domain` or `data`)*
2. Answer the questions when prompted


## subfeatures
To add a subfeature to this project
1. Use the brick from mankeli_cli
    ```sh
    mankeli gen mhs_flutter_subfeature
    ```

    *NOTE: make sure to run this in the root of the project*
2. Answer the questions when prompted









[1]: https://docs.flutter.dev/get-started/install
[2]: https://code.visualstudio.com/download
[3]: doc/asset/architecture.jpg
[4]: https://pub.dev
[5]: https://pub.dev/packages/derry
[6]: https://github.com/Mankeli-Software/mankeli_cli
[7]: https://www.conventionalcommits.org/en/v1.0.0/
[8]: https://pub.dev/packages/build_runner
[9]: https://pub.dev/packages/freezed
[10]: https://pub.dev/packages/json_serializable
[11]: https://pub.dev/packages/auto_route
[12]: https://pub.dev/packages/flutter_gen
[13]: https://pub.dev/packages/icons_launcher
[14]: https://pub.dev/packages/flutter_native_splash
[15]: https://pub.dev/packages/mason
[16]: https://pub.dev/packages/intl
[17]: https://docs.flutter.dev/deployment/flavors
[18]: https://www.figma.com/file/x3bQuIKYkJ49b3c5VALs0L/Flutter-app-icon-generator?node-id=103%3A380&t=QJsJTFQ9cTrYvSDd-1
[mankeli_analysis_badge]: https://img.shields.io/badge/style-mankeli__analysis-blue
[mankeli_analysis_badge_link]: https://pub.dev/packages/mankeli_analysis

