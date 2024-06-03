# CLUe UI Component

## Introduction

The CLUe UI Component was created to ensure the uniformity of Suprema's frontend outputs. It is designed to easily and conveniently implement basic elements that make up the UI, such as various buttons, dropdowns, pop-ups, and more. In addition to the component's style, various functionalities are implemented. For instance, with a customized Dropdown component, some of the items may need to be disabled, multiple items may be clickable, or the default selected item may need to be indicated separately. 

## Usage
### When GlobalKey is already used in the app
```
import 'package:flutter/material.dart';

// import clue component module
import 'package:clue_ui_component/clue_ui_component.dart';

final GlobalKey<NavigatorState> myappKey = GlobalKey<NavigatorState>(debugLabel: 'in-your-app-key');

void main() {
  // CAUTION: You must register your key in the clue module.
  setClueGlobalKey(myappKey);

  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: myappKey,
      home: Scaffold(
        body: Center(
          child: ClueDropDownButton(
            itemMap: const {"Key1": "value1", "Key2": "value2"},
            onChanged: (String key) {
              ClueOverlay.showSuccessToast(key);
            },
          ),
        ),
      ),
    );
  }
}

```

### When GlobalKey is not used
```
import 'package:flutter/material.dart';

// import clue component module
import 'package:clue_ui_component/clue_ui_component.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: clueNavigatorKey, // << Add this line
      home: Scaffold(
        body: Center(
          child: ClueDropDownButton(
            itemMap: const {"Key1": "value1", "Key2": "value2"},
            onChanged: (String key) {
              ClueOverlay.showSuccessToast(key);
            },
          ),
        ),
      ),
    );
  }
}

```
![Alt sample1](https://firebasestorage.googleapis.com/v0/b/scloud-real-unmanned-store.appspot.com/o/1.png?alt=media&token=66c5a1ee-743e-436a-b205-741ca15ed178)
![Alt sample1](https://firebasestorage.googleapis.com/v0/b/scloud-real-unmanned-store.appspot.com/o/2.png?alt=media&token=2cc09b47-a5dc-4362-a6aa-95d6dfe62572)

### Description
When executed, the DropDown Component is present in the center, and when an item is clicked, the selected item is displayed as a Toast at the top.

## Examples

Visit the [HomePage](https://component.moon.supremainc.com) to see the full preview.