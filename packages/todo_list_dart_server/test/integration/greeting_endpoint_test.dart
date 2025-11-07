import 'package:test/test.dart';
import 'package:todo_list_dart_server/src/generated/greeting.dart';

// Import the generated test helper file, it contains everything you need.
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Greeting endpoint', (
    TestSessionBuilder sessionBuilder,
    TestEndpoints endpoints,
  ) {
    test(
      'when calling `hello` with name then returned greeting includes name',
      () async {
        final Greeting greeting = await endpoints.greeting.hello(
          sessionBuilder,
          'Bob',
        );
        expect(greeting.message, 'Hello Bob');
      },
    );
  });
}
