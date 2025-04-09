/// Base class for all Audiomob exceptions
sealed class AudiomobException implements Exception {
  const AudiomobException([this.message]);
  final Object? message;
}

/// Exception thrown when the Audiomob plugin is not initialized
class AudiomobNotInitializedException extends AudiomobException {
  const AudiomobNotInitializedException()
    : super('use Audiomob.init() to initialize the plugin');
}
