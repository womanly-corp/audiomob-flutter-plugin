sealed class AudiomobException implements Exception {
  const AudiomobException([this.message]);
  final Object? message;
}

class AudiomobNotInitializedException extends AudiomobException {
  const AudiomobNotInitializedException()
      : super('use Audiomob.init() to initialize the plugin');
}
