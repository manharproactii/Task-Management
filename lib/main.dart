import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:task_management/pages/login/login_screen.dart';

import 'bindings/main_binding.dart';
import 'routes/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Portal(
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginScreen(),
        initialRoute: Routes.splash,
        getPages: Pages.pages,
        initialBinding: MainBinding(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widgets is the home_loading page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widgets) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widgets. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widgets. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widgets.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// void main() => runApp(HtmlEditorExampleApp());
//
// class HtmlEditorExampleApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(),
//       darkTheme: ThemeData.dark(),
//       home: HtmlEditorExample(title: 'Flutter HTML Editor Example'),
//     );
//   }
// }

class HtmlEditorExample extends StatefulWidget {
  HtmlEditorExample({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HtmlEditorExampleState createState() => _HtmlEditorExampleState();
}

class _HtmlEditorExampleState extends State<HtmlEditorExample> {
  String result =
      '<p>hvvv</p><p>Jvuvugu</p><p>Gibivgghhhhhh</p><p>Huuuuuujjuuu<sup>uuuuuu<u>yyyyhibub<font size="7">uuuuu</font></u></sup></p>';
  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  if (kIsWeb) {
                    controller.reloadWeb();
                  } else {
                    controller.editorController!.reload();
                  }
                }),
            IconButton(
                icon: Icon(Icons.h_mobiledata),
                onPressed: () async {
                  print("controller ${await controller.getText()}");
                })
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     controller.toggleCodeView();
        //   },
        //   child: Text(r'<\>',
        //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: 'Your text here...',
                  // shouldEnsureVisible: true,
                  initialText: result,
                ),
                htmlToolbarOptions: HtmlToolbarOptions(
                  defaultToolbarButtons: [
                    FontButtons(clearAll: false),
                    ListButtons(listStyles: false),
                    InsertButtons(
                        video: true,
                        audio: true,
                        table: true,
                        hr: true,
                        otherFile: true),
                    ColorButtons(),
                    ParagraphButtons(
                        textDirection: true,
                        lineHeight: true,
                        caseConverter: true),
                    FontSettingButtons(fontSizeUnit: false),
                    StyleButtons(),
                  ],
                  toolbarPosition: ToolbarPosition.belowEditor,
                  //by default
                  // toolbarType: ToolbarType.nativeGrid, //by default
                  onButtonPressed:
                      (ButtonType type, bool? status, Function? updateStatus) {
                    print(
                        "button '${describeEnum(type)}' pressed, the current selected status is $status");
                    return true;
                  },
                  onDropdownChanged: (DropdownType type, dynamic changed,
                      Function(dynamic)? updateSelectedItem) {
                    print(
                        "dropdown '${describeEnum(type)}' changed to $changed");
                    return true;
                  },
                  mediaLinkInsertInterceptor:
                      (String url, InsertFileType type) {
                    print(url);
                    return true;
                  },
                  mediaUploadInterceptor:
                      (PlatformFile file, InsertFileType type) async {
                    print(file.name); //filename
                    print(file.size); //size in bytes
                    print(file.extension); //file extension (eg jpeg or mp4)
                    return true;
                  },
                ),
                otherOptions: OtherOptions(
                  height: 200,
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(width: 1, color: AppColors.greyColor1)),
                ),
                callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {
                  print('html before change is $currentHtml');
                }, onChangeContent: (String? changed) {
                  print('content changed to $changed');
                }, onChangeCodeview: (String? changed) {
                  print('code changed to $changed');
                }, onChangeSelection: (EditorSettings settings) {
                  print('parent element is ${settings.parentElement}');
                  print('font name is ${settings.fontName}');
                }, onDialogShown: () {
                  print('dialog shown');
                }, onEnter: () {
                  print('enter/return pressed');
                }, onFocus: () {
                  print('editor focused');
                }, onBlur: () {
                  print('editor unfocused');
                }, onBlurCodeview: () {
                  print('codeview either focused or unfocused');
                }, onInit: () {
                  print('init');
                },
                    //this is commented because it overrides the default Summernote handlers
                    /*onImageLinkInsert: (String? url) {
                    print(url ?? "unknown url");
                  },
                  onImageUpload: (FileUpload file) async {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                    print(file.base64);
                  },*/
                    onImageUploadError: (FileUpload? file, String? base64Str,
                        UploadError error) {
                  print(describeEnum(error));
                  print(base64Str ?? '');
                  if (file != null) {
                    print(file.name);
                    print(file.size);
                    print(file.type);
                  }
                }, onKeyDown: (int? keyCode) {
                  print('$keyCode key downed');
                  print(
                      'current character count: ${controller.characterCount}');
                }, onKeyUp: (int? keyCode) {
                  print('$keyCode key released');
                }, onMouseDown: () {
                  print('mouse downed');
                }, onMouseUp: () {
                  print('mouse released');
                }, onNavigationRequestMobile: (String url) {
                  print(url);
                  return NavigationActionPolicy.ALLOW;
                }, onPaste: () {
                  print('pasted into editor');
                }, onScroll: () {
                  print('editor scrolled');
                }),
                plugins: [
                  SummernoteAtMention(
                      getSuggestionsMobile: (String value) {
                        var mentions = <String>['test1', 'test2', 'test3'];
                        return mentions
                            .where((element) => element.contains(value))
                            .toList();
                      },
                      mentionsWeb: ['test1', 'test2', 'test3'],
                      onSelect: (String value) {
                        print(value);
                      }),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.undo();
            //         },
            //         child:
            //         Text('Undo', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.clear();
            //         },
            //         child:
            //         Text('Reset', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           var txt = await controller.getText();
            //           if (txt.contains('src=\"data:')) {
            //             txt =
            //             '<text removed due to base-64 data, displaying the text could cause the app to crash>';
            //           }
            //           setState(() {
            //             result = txt;
            //           });
            //         },
            //         child: Text(
            //           'Submit',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.redo();
            //         },
            //         child: Text(
            //           'Redo',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(result),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.disable();
            //         },
            //         child: Text('Disable',
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           controller.enable();
            //         },
            //         child: Text(
            //           'Enable',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.insertText('Google');
            //         },
            //         child: Text('Insert Text',
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.insertHtml(
            //               '''<p style="color: blue">Google in blue</p>''');
            //         },
            //         child: Text('Insert HTML',
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           controller.insertLink(
            //               'Google linked', 'https://google.com', true);
            //         },
            //         child: Text(
            //           'Insert Link',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.insertNetworkImage(
            //               'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png',
            //               filename: 'Google network image');
            //         },
            //         child: Text(
            //           'Insert network image',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.addNotification(
            //               'Info notification', NotificationType.info);
            //         },
            //         child:
            //         Text('Info', style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.addNotification(
            //               'Warning notification', NotificationType.warning);
            //         },
            //         child: Text('Warning',
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           controller.addNotification(
            //               'Success notification', NotificationType.success);
            //         },
            //         child: Text(
            //           'Success',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () {
            //           controller.addNotification(
            //               'Danger notification', NotificationType.danger);
            //         },
            //         child: Text(
            //           'Danger',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 16),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor: Colors.blueGrey),
            //         onPressed: () {
            //           controller.addNotification('Plaintext notification',
            //               NotificationType.plaintext);
            //         },
            //         child: Text('Plaintext',
            //             style: TextStyle(color: Colors.white)),
            //       ),
            //       SizedBox(
            //         width: 16,
            //       ),
            //       TextButton(
            //         style: TextButton.styleFrom(
            //             backgroundColor:
            //             Theme.of(context).colorScheme.secondary),
            //         onPressed: () async {
            //           controller.removeNotification();
            //         },
            //         child: Text(
            //           'Remove',
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

enum Sky { midnight, viridian, cerulean, red, green }

Map<Sky, Color> skyColors = <Sky, Color>{
  Sky.midnight: const Color(0xff191970),
  Sky.viridian: const Color(0xff40826d),
  Sky.cerulean: const Color(0xff007ba7),
  Sky.red: const Color(0xFF7D54BF),
  Sky.green: const Color(0xFFFE8F1D),
};

class SegmentedControlApp extends StatelessWidget {
  const SegmentedControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: SegmentedControlExample(),
    );
  }
}

class SegmentedControlExample extends StatefulWidget {
  const SegmentedControlExample({super.key});

  @override
  State<SegmentedControlExample> createState() =>
      _SegmentedControlExampleState();
}

class _SegmentedControlExampleState extends State<SegmentedControlExample> {
  Sky _selectedSegment = Sky.midnight;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: skyColors[_selectedSegment],
      navigationBar: CupertinoNavigationBar(
        // This Cupertino segmented control has the enum "Sky" as the type.
        middle: CupertinoSlidingSegmentedControl<Sky>(
          backgroundColor: CupertinoColors.systemGrey2,
          thumbColor: skyColors[_selectedSegment]!,
          // This represents the currently selected segmented control.
          groupValue: _selectedSegment,
          // Callback that sets the selected segmented control.
          onValueChanged: (Sky? value) {
            if (value != null) {
              setState(() {
                _selectedSegment = value;
              });
            }
          },
          children: const <Sky, Widget>{
            Sky.midnight: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'ss',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            Sky.viridian: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'bb',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            Sky.cerulean: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'dd',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            Sky.red: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Red',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
            Sky.green: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Green',
                style: TextStyle(color: CupertinoColors.white),
              ),
            ),
          },
        ),
      ),
      child: Center(
        child: Text(
          'Selected Segment: ${_selectedSegment.name}',
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ),
    );
  }
}
