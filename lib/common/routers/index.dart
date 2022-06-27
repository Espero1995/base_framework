library routers;

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/index.dart'; //获取所有的页面路径，并提供给pages.dart可进行访问

part 'names.dart'; //路由名称
part 'pages.dart'; //路由所指向的页面
part 'observers.dart'; //路由拦截 - 记录路由变化 - 需要在main.dart 设置路由监听
part 'transitions.dart'; //自定义路由动画
