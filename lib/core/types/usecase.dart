abstract class Usecase<Output, Input> {
  Future<Output> call(Input input);
}

class NoParams {}
