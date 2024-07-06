# Elegant Alert
### An elegant alert easy to display to your users with your customizations.
<hr>

## Features

- Display alerts to users with an easy setup
- Create customizable popups with multi actions
- built-in themes: Permission, multi-actions, caution and info
- Displayed with or without animations
- Support scale and slide transitions
- Customizable appearence

## Getting Started

To use this elegant notification package you need to add the dependency in `pubspec.yaml` file.

```yaml
dependencies:
	elegant_alert_dialog: ^0.0.1
```

## Parameters

`

````dart
  ///Alert content widget, it's required in all constructors
  ///[ElegantBodyWidget] contain two attributes [title] and [description] of type widgets
  ///both are required
  final ElegantBodyWidget alertContent;

  ///The alert dialog background color, by default alert is white
  ///it's used to render the alert content widget
  final Color backgroundColor;

  ///list of shadows applied to the alert dialog
  ///by default [dialogShadow] is null and a default shadow is applied
  ///
  ///if you want to remove shadow pass an empty list in [dialogShadow]
  final List<BoxShadow>? dialogShadow;

  ///the type of animation rendered
  ///[AnimationTypes.slideAnimation] to render a scale animation using [SlideTransition]
  ///[AnimationTypes.scaleAnimation] to show an animation using [Transform.scale]
  ///
  ///[animationCurve] is used to set the animation curve
  ///[animationDuration] is the animation duration of type [Duration]
  final AnimationTypes animationType;

  ///the animation curve used to render the animation
  ///by default its [Curves.ease]
  final Curve animationCurve;

  ///The animation duration of being rendered
  ///the default duration is set to one second
  final Duration animationDuration;

  ///indicate whether the barrier is dismissable or not
  ///by default {barrierDismissable == true}
  final bool barrierDismissable;

  ///the alert dialog height
  final double height;

  ///the alert dialog border radius
  final double borderRadius;

  ///the alert dialog border size
  final double borderSize;

  ///indicate whether the animation will be displayed when showing the alert
  ///by default [withAnimation == true]
  final bool withAnimation;

  ///The alert border color
  late Color? borderColor;

  ///the list of actions (widgets) that will be rendered as buttons
  ///required when using [custom] constructor
  late List<Widget> actions;

  ///The main button text
  ///[multiActions] constructor is the primaryActionButton
  ///[permission] is the allowButton text
  ///[caution] is the delete button text
  ///[info] is the confirmation button text
  late String? confirmButtonText;

  ///A secondary main button, displayed only when using [multiActions] constructor
  ///[multiActions] constructor is the primaryActionButton
  late String? secondButtonText;

  ///The cancel button text
  ///[multiActions] the cancel button text
  ///[permission] the deny button text
  ///[caution] the cancel button text
  late String? cancelButtonText;

  ///The main button callback action
  ///[multiActions] primary button callback action
  ///[permission] the allow button action callback
  ///[caution] the delete button action callback
  ///[info] the confirmation button action callback
  late Function()? onConfirmButtonPressed;

  ///A secondary main button, displayed only when using [multiActions] constructor
  /// the action callback will be called when pressing the secondary main button
  late Function()? onSecondaryButtonPressed;

  ///The cancel button action callback
  ///[multiActions] and [caution] constructors is the cancel button
  ///[permission] the deny button
  late Function()? onCancelPressed;

  ///The main button color
  ///[multiActions] constructor is the primary button
  ///[permission] constructor is  the allowButton
  ///[caution] constructor is  the delete button
  ///[info] constructor is  the confirmation button
  late Color? confirmButtonColor;

  ///A secondary main button, displayed only when using [multiActions] constructor
  ///the color in which the secondary button is rendered
  late Color? secondButtonColor;

  ///The cancel button color
  ///[multiActions] and [caution] constructors the cancel button
  ///[permission] the deny button text
  late Color? cancelButtonColor;
`

````

## Examples

- **Permission alert**

```dart
//TODO add code snippet here
```
<img src=""/>

- **Multi actions alert**


```dart
//TODO add code snippet here
```
<img src=""/>


- **Caution alert**


```dart
//TODO add code snippet here
```
<img src=""/>


- **Info alert**


```dart
//TODO add code snippet here
```
<img src=""/>

- **Custom alert**


```dart
//TODO add code snippet here
```
<img src=""/>

## Contribution

You can contribute to the project via [repository link](https://github.com/koukibadr/Elegant-Notification)

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Contributors

<a href="https://github.com/koukibadr/ElegantAlertDialog/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=koukibadr/ElegantAlertDialog" />
</a>
