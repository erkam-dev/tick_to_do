abstract class Usecase<Output, Input> {
  Future<Output> call(Input input);
}

abstract class UsecaseNoFuture<Output, Input> {
  Output call(Input input);
}

class NoParams {}
