import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

getCurrentRoute(BuildContext context) {
  return GoRouter.of(context).routeInformationProvider.value.uri;
}
