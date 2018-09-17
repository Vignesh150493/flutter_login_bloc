Simple login screen.
Just validate email and password.
Not logging in. No authentication involved. Just plain client validation. 

Concepts Introduced
-> Dart Mixins
-> Dart getters
-> Introducing Streams
    -> StreamBuilder
    -> StreamTransformer
    -> StreamController

-> Bloc pattern
    -> Single global instance
    -> Scoped instance
        -> Inherited Widgets

-> Use RxDart to combine email and password streams, to enable/disable the submit button.
-> RxDart
    -> Help us work with streams.
    -> Here         Stream           ====> Observable
                    StreamController ====> Subject     