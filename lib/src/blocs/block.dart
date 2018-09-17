import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

//  A notable Mention about mixins
//  Mixins are always applied to a base class
//  For eg, Car extends (Vehicle with Parkable, Drivable{}).
//  So we need to extend something and then use mixins.

class Bloc extends Object with Validators {
  //Any time a stream controller is created, we get a sink along with it. Sink stays open and waits for events to be added to it, for forever.
  //So we have to close sink

  ///We are using broadcast, because we are listening to it more than once.
  ///Using a single subscription stream would throw an error "Bad state: Stream has already been listened to."
  //Replacing StreamControllers with BehaviourSubjects
  final _emailSubject = BehaviorSubject<String>();
  final _passwordSubject = BehaviorSubject<String>();

  //Add data to stream
  Stream<String> get email => _emailSubject.stream.transform(validateEmail);

  Stream<String> get password =>
      _passwordSubject.stream.transform(validatePassword);

  //Give some random name e,p. We are not going to give a damn abt it.
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);

  //Change data
  Function(String) get changeEmail => _emailSubject.sink.add;

  Function(String) get changePassword => _passwordSubject.sink.add;

  submit() {
    final validEmail = _emailSubject.value;
    final validPassword = _passwordSubject.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  dispose() {
    _emailSubject.close();
    _passwordSubject.close();
  }
}

//Single global instance. If we want to go with this way.
//final bloc = Bloc();

/**
 * Applying a bloc
 * =======================> Single Global Instance <=====================
 * Maybe okay for small apps
 * Create an instance of Bloc() and use it wherever u want to.
 * So, maybe we will need a lot of Bloc(s) in a large app, so this approach might not help.
 * Less code but less control. We dont get to scope(No seperate data source)
 *
 *
 * =======================> Scoped Instance <=====================
 * Maybe better for large apps
 * Create instance of a block specific to one widget, and this apparently can be used by
 * all the child widgets.
 * This apparently will involve more code, which makes it more complicated.
 *
 **/

/**
 * Using blocs instead of statefulwidgets to share information around the app
 * Bloc can be used as single instance or scoped instance.
 * Bloc use sinks and streams.
 * Widgets use Streambuilders to change their contents based on the value in stream.
 * RxDart might be awesome. Have to use it more. :)
 */
