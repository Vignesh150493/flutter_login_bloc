import 'package:flutter/material.dart';
import 'block.dart';

class Provider extends InheritedWidget {
  Provider({Key key, Widget child}) : super(key: key, child: child);

  final bloc = Bloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    /**
     * Context can be used go up to parent widgets to find their contexts.
     * Lets say, PARENT --> CHILD --> GRANDCHILD
     * So, the context of grandchild, is capable of getting context of child, and all the way up.
     * Now this inheritFromWidgetOfExactType function can be hence used to get a provider instance. This is how we use
     * scoped instance of BLOC. :)
     */
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }
}
