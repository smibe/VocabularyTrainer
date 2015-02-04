// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:Vocabulary/nav_menu.dart';
import 'package:Vocabulary/reverser.dart';
import 'package:route_hierarchical/client.dart';

void main() {
  initNavMenu();
  initReverser();

  // Webapps need routing to listen for changes to the URL.
  var router = new Router();
  router.root
      ..addRoute(name: 'home', defaultRoute: true, path: '/', enter: showView)
    ..addRoute(name: 'about', path: '/about', enter: showView)
    ..addRoute(name: 'units', path: '/units', enter: showView)
    ..addRoute(name: 'settings', path: '/settings', enter: showView);
  router.listen();
}

void showView(RouteEvent e)
{
  String activeView = e.route.name;
  querySelector(".view").style.display = 'none';
  querySelector("#" + activeView).style.display = '';
}
