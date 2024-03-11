import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:your_body_lab/components/scaffold_nested_navigation.dart';
import 'package:your_body_lab/models/article.model.dart';
import 'package:your_body_lab/pages/area_detail/area_detail.dart';
import 'package:your_body_lab/pages/areas/areas_list.dart';
import 'package:your_body_lab/pages/article_detail/article_detail.dart';
import 'package:your_body_lab/pages/articles/article_list.dart';
import 'package:your_body_lab/pages/home/home_page.dart';
import 'package:your_body_lab/pages/root/detail/detail_page.dart';
import 'package:your_body_lab/pages/training_workouts/training_list/training_list.dart';
import 'package:your_body_lab/pages/training_workouts/training_workouts.dart';
import 'package:your_body_lab/pages/workout_detail/workout_detail.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
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
                      GoRoute(
                          path: 'schede',
                          builder: (context, state) {
                            if (state.pathParameters['areaTitle'] ==
                                'Allenamento') {
                              return const TrainingWorkouts();
                            } else {
                              return const Center(
                                child: Text('Nessuna scheda trovata'),
                              );
                            }
                          },
                          routes: [
                            GoRoute(
                                path: 'trainings/:difficulty',
                                builder: (context, state) => TrainingList(
                                      difficulty:
                                          state.pathParameters['difficulty']!,
                                    ),
                                routes: [
                                  GoRoute(
                                    path: ':workoutID',
                                    builder: (context, state) => WorkoutDetail(
                                      id: state.pathParameters['workoutID']!,
                                      title: state.extra! as String,
                                    ),
                                  )
                                ]),
                          ]),
                    ]),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
