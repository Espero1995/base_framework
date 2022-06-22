# base_framework（flutter：2.10.5）

此模版主要是项目结构，基于getX搭建的基础框架项目。对于以后一些基本的项目整体框架搭建，复制此模板中的lib文件即可使用。

### 一、项目运行、Logo图标、App名称以及启动页一些相关配置说明。

#### 1、项目运行

默认的第三方库安装，见pubspec.yaml文件，均含注释。在当前项目目录下执行

```bash
flutter pub get
```

<font color=#F56C6C>问题：</font>在运行安卓手机时可能会失败，需要在 build.gradle文件中进行如下修改。

```.gradle
compileSdkVersion flutter.compileSdkVersion -> compileSdkVersion 31
minSdkVersion flutter.minSdkVersion -> minSdkVersion 21
targetSdkVersion flutter.targetSdkVersion -> targetSdkVersion 31
```



#### 2、Logo图标

<font color=#409EFF>（1）规格说明</font>
			Android 尺寸：512 x 512	 https://developer.android.com/google-play/resources/icon-design-specifications
			iOS 尺寸：1024 x 1024		https://developer.apple.com/design/human-interface-guidelines/ios/icons-and-images/app-icon/

<font color=#409EFF>（2）在线工具 - logo 设计模板</font>
			https://www.designevo.com/cn/logo-maker/

<font color=#409EFF>（3）因此我们采用 flutter 官方推荐的解决方案，flutter_launcher_icons 插件</font>
			https://pub.dev/packages/flutter_launcher_icons

<font color=#409EFF>（4）pubspec.yaml</font>

```yaml
dev_dependencies:
  # icons
  flutter_launcher_icons: ^0.7.5
flutter_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/icons/logo-1024.png"
  # 注意请在文件目录中建好 assets/icons/logo-1024.png 目录关系
```

<font color=#409EFF>（5）生成图标</font>

```bash
flutter pub run flutter_launcher_icons:main
```

<font color=#F56C6C>注意：</font>生成安卓图标库的时候可能会失败 请在android -> local.properties 文件下添加 

```properties
flutter.minSdkVersion=30
```

<font color=#409EFF>（6）图标目录</font>					

android/app/src/main/res

ios/Runner/Assets.xcassets/AppIcon.appiconset



#### 3、App名称

iOS App名称修改：

​	iOS：ios/Runner.xcworkspace 双击打开【会自动以Xcode打开】Info.plist目录下修改 <font color=#F56C6C>Bundle display name</font> 即可。

​	Android：android/app/src/main/AndroidManifest.xml 目录下修改 <font color=#F56C6C>android:label</font> 即可。



#### 4、启动图

<font color=#409EFF>（1）规格说明</font>

https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/adaptivity-and-layout/#device-screen-sizes-and-orientations

https://developer.android.com/about/dashboards/index.html#Screens

https://uiiiuiii.com/screen/   屏幕尺寸大全

生成完图片后，将其拖入对应的

Android： android/app/src/main/res，并且在drawable文件中打开launch_background.xml的注释即可。

iOS：ios/Runner.xcworkspace 双击打开【会自动以Xcode打开】在Runner/Assets.xcassets中替换 xx@1x、xx@2x和xx@3x 三张图片即可。