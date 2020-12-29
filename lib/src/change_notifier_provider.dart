import 'package:flutter/widgets.dart';

import 'listenable_provider.dart';
import 'provider.dart';
import 'proxy_provider.dart';

///
class ChangeNotifierProvider<T extends ChangeNotifier>
    extends ListenableProvider<T> {
  static void _dispose(BuildContext context, ChangeNotifier notifier) {
    notifier?.dispose();
  }

  /// Creates a [ChangeNotifier] using `create` and automatically
  /// dispose it when [ChangeNotifierProvider] is removed from the widget tree.
  ChangeNotifierProvider({
    Key key,
    @required Create<T> create,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          dispose: _dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );

  /// Provides an existing [ChangeNotifier].
  ChangeNotifierProvider.value({
    Key key,
    @required T value,
    TransitionBuilder builder,
    Widget child,
  }) : super.value(
          key: key,
          builder: builder,
          value: value,
          child: child,
        );
}

/// {@template provider.changenotifierproxyprovider}
/// A [ChangeNotifierProvider] that builds and synchronizes a [ChangeNotifier]
/// with external values.
///
/// To understand better this variation of [ChangeNotifierProvider], we can
/// look into the following code using the original provider:
///
/// ```dart
/// ChangeNotifierProvider(
///   create: (context) {
///     return MyChangeNotifier(
///       myModel: Provider.of<MyModel>(context, listen: false),
///     );
///   },
///   child: ...
/// )
/// ```
///
/// In this example, we built a `MyChangeNotifier` from a value coming from
/// another provider: `MyModel`.
///
/// This works as long as `MyModel` never changes. But if it somehow updates,
/// then our [ChangeNotifier] will never update accordingly.
///
/// To solve this issue, we could instead use this class, like so:
///
/// ```dart
/// ChangeNotifierProxyProvider<MyModel, MyChangeNotifier>(
///   create: (_) => MyChangeNotifier(),
///   update: (_, myModel, myNotifier) => myNotifier
///     ..update(myModel),
///   child: ...
/// );
/// ```
///
/// In that situation, if `MyModel` were to update, then `MyChangeNotifier` will
/// be able to update accordingly.
///
/// Notice how `MyChangeNotifier` doesn't receive `MyModel` in its constructor
/// anymore. It is now passed through a custom setter/method instead.
///
/// A typical implementation of such `MyChangeNotifier` could be:
///
/// ```dart
/// class MyChangeNotifier with ChangeNotifier {
///   void update(MyModel myModel) {
///     // Do some custom work based on myModel that may call `notifyListeners`
///   }
/// }
/// ```
///
/// - **DON'T** create the [ChangeNotifier] inside `update` directly.
///
///   This will cause your state to be lost when one of the values used updates.
///   It will also cause unnecessary overhead because it will dispose the
///   previous notifier, then subscribes to the new one.
///
///  Instead reuse the previous instance, and update some properties or call
///  some methods.
///
/// ```dart
/// ChangeNotifierProxyProvider<MyModel, MyChangeNotifier>(
///   // may cause the state to be destroyed involuntarily
///   update: (_, myModel, myNotifier) => MyChangeNotifier(myModel: myModel),
///   child: ...
/// );
/// ```
///
/// - **PREFER** using [ProxyProvider] when possible.
///
///   If the created object is only a combination of other objects, without
///   http calls or similar side-effects, then it is likely that an immutable
///   object built using [ProxyProvider] will work.
/// {@endtemplate}
class ChangeNotifierProxyProvider<T, R extends ChangeNotifier>
    extends ListenableProxyProvider<T, R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider({
    Key key,
    @required Create<R> create,
    @required ProxyProviderBuilder<T, R> update,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}

/// {@macro provider.changenotifierproxyprovider}
class ChangeNotifierProxyProvider0<R extends ChangeNotifier>
    extends ListenableProxyProvider0<R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider0({
    Key key,
    @required Create<R> create,
    @required R Function(BuildContext, R value) update,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}

/// {@macro provider.changenotifierproxyprovider}
class ChangeNotifierProxyProvider2<T, T2, R extends ChangeNotifier>
    extends ListenableProxyProvider2<T, T2, R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider2({
    Key key,
    @required Create<R> create,
    @required ProxyProviderBuilder2<T, T2, R> update,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}

/// {@macro provider.changenotifierproxyprovider}
class ChangeNotifierProxyProvider3<T, T2, T3, R extends ChangeNotifier>
    extends ListenableProxyProvider3<T, T2, T3, R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider3({
    Key key,
    @required Create<R> create,
    @required ProxyProviderBuilder3<T, T2, T3, R> update,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}

/// {@macro provider.changenotifierproxyprovider}
class ChangeNotifierProxyProvider4<T, T2, T3, T4, R extends ChangeNotifier>
    extends ListenableProxyProvider4<T, T2, T3, T4, R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider4({
    Key key,
    @required Create<R> create,
    @required ProxyProviderBuilder4<T, T2, T3, T4, R> update,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}

/// {@macro provider.changenotifierproxyprovider}
class ChangeNotifierProxyProvider5<T, T2, T3, T4, T5, R extends ChangeNotifier>
    extends ListenableProxyProvider5<T, T2, T3, T4, T5, R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider5({
    Key key,
    @required Create<R> create,
    @required ProxyProviderBuilder5<T, T2, T3, T4, T5, R> update,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}

/// {@macro provider.changenotifierproxyprovider}
class ChangeNotifierProxyProvider6<T, T2, T3, T4, T5, T6,
        R extends ChangeNotifier>
    extends ListenableProxyProvider6<T, T2, T3, T4, T5, T6, R> {
  /// Initializes [key] for subclasses.
  ChangeNotifierProxyProvider6({
    Key key,
    @required Create<R> create,
    @required ProxyProviderBuilder6<T, T2, T3, T4, T5, T6, R> update,
    bool lazy,
    TransitionBuilder builder,
    Widget child,
  }) : super(
          key: key,
          create: create,
          update: update,
          dispose: ChangeNotifierProvider._dispose,
          lazy: lazy,
          builder: builder,
          child: child,
        );
}
