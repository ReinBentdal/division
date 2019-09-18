# Division

>A simple to use yet powerfull styling widget with syntax inspired by CSS.


- **[Getting started](#getting-started)**
- **[Example](#simple-example)**
- **[Widgets]()**
  - [StyleClass]()
  - [GestureClass]()
  - [Txt]()
    - [TxtStyle]()
  - [Parent]()
    - [ParentStyle]()
  

### Built with Division
| [App designer](https://dribbble.com/shots/6459693-Creative-layout-design),  [Code](https://github.com/ReinBentdal/division/blob/master/example/example/example_1.dart) | [Code](https://github.com/ReinBentdal/division/blob/master/example/example/example_form.dart) |
|-|-|
| <img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/demo_app.gif" width="250"> | <img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/form_demo.gif" width="250"> |

## Getting Started

This package includes  a `Parent` widget and a `Txt` widget.

As the name suggests the `Parent` widget takes a `child` along its `Division` properties.

```dart
Parent(
  child: Widget,
  style: ParentStyle, 
  gesture: GestureClass,
);
```

The `Txt` widget is a styled widget just like the `Parent` widget but it is specialized with styling text.

```dart
Txt(
  'Some text',
  style: TxtStyle,
  gesture: GestureClass,
);
```

### Simple example

#### Import
```dart
import 'package:division/division.dart';
```

#### Code

```dart
Txt(
  'Klick me',
  style: TxtStyle()
    ..textColor(Colors.white)
    ..bold()
    ..padding(horizontal: 30, vertical: 15)
    ..background.hex('77A6F7')
    ..borderRadius(all: 30)
    ..alignment.center()
    ..elevation(10, color: rgb(150,150,150)),

  gesture: GestureClass()
    ..onTap(() => print('Button pressed')),
)
```

#### The result

<img src="https://raw.githubusercontent.com/ReinBentdal/division/master/example/assets/simple_example.jpg" width="300">

## Widgets