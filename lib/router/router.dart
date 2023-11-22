import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab_flutter/components/scaffold_nested_navigation.dart';
import 'package:your_body_lab_flutter/models/article.model.dart';
import 'package:your_body_lab_flutter/pages/areas/area_detail/area_detail.dart';
import 'package:your_body_lab_flutter/pages/areas/areas_list.dart';
import 'package:your_body_lab_flutter/pages/articles/article_detail/article_detail.dart';
import 'package:your_body_lab_flutter/pages/articles/article_list.dart';
import 'package:your_body_lab_flutter/pages/home/home_page.dart';
import 'package:your_body_lab_flutter/pages/root/detail/detail_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorSearchKey =
    GlobalKey<NavigatorState>(debugLabel: 'search');
final _shellNavigatorCategoriesKey =
    GlobalKey<NavigatorState>(debugLabel: 'categories');

final goRouter = GoRouter(
  initialLocation: '/home',
  // * Passing a navigatorKey causes an issue on hot reload:
  // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
  // * However it's still necessary otherwise the navigator pops back to
  // * root on hot reload
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    // Stateful navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomePage(label: 'Home', detailsPath: '/home/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) => const DetailsScreen(label: 'A'),
                ),
              ],
            ),
          ],
        ),
        // StatefulShellBranch(navigatorKey: _shellNavigatorSearchKey, routes: [
        //   GoRoute(
        //     path: '/search',
        //     pageBuilder: (context, state) => const NoTransitionPage(
        //         child: RootScreen(
        //             label: "Search", detailsPath: "/search/details")),
        //   )
        // ]),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCategoriesKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/areas',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AreasPage(),
              ),
              routes: [
                GoRoute(
                    path: ':areaTitle',
                    builder: (context, state) =>
                        AreaDetail(title: state.pathParameters['areaTitle']!),
                    routes: [
                      GoRoute(
                        path: 'articles',
                        builder: (context, state) => ArticleList(
                          // extra
                          title: state.pathParameters['areaTitle']!,
                        ),
                        routes: [
                          GoRoute(
                            path: ':articleTitle',
                            builder: (context, state) => ArticleDetail(
                              // extra
                              title: state.pathParameters['articleTitle']!,
                              article: state.extra! as ArticleModel,
                            ),
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
