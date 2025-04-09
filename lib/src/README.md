When there will be a need to add ios implementation, please follow correct plugin structure:

1. Separate android and ios implementation into two different packages
2. Create a new package for the plugin which will use the two packages

See example of how to do this in the [video_player](https://github.com/flutter/packages/tree/main/packages/video_player) repository.
And [Developing Packages](https://docs.flutter.dev/packages-and-plugins/developing-packages) doc.
