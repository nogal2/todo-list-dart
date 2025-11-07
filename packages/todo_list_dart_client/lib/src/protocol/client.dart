/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:todo_list_dart_client/src/protocol/entities/todo_entity.dart'
    as _i3;
import 'package:todo_list_dart_client/src/protocol/greeting.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointTodo extends _i1.EndpointRef {
  EndpointTodo(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'todo';

  _i2.Future<_i3.TodoEntity> addTodo(_i3.TodoEntity todo) =>
      caller.callServerEndpoint<_i3.TodoEntity>(
        'todo',
        'addTodo',
        {'todo': todo},
      );

  _i2.Future<List<_i3.TodoEntity>> getTodos() =>
      caller.callServerEndpoint<List<_i3.TodoEntity>>(
        'todo',
        'getTodos',
        {},
      );

  _i2.Future<_i3.TodoEntity> updateTodo(_i3.TodoEntity todo) =>
      caller.callServerEndpoint<_i3.TodoEntity>(
        'todo',
        'updateTodo',
        {'todo': todo},
      );

  _i2.Future<_i3.TodoEntity> deleteTodo(_i3.TodoEntity todo) =>
      caller.callServerEndpoint<_i3.TodoEntity>(
        'todo',
        'deleteTodo',
        {'todo': todo},
      );
}

/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  _i2.Future<_i4.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i4.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    todo = EndpointTodo(this);
    greeting = EndpointGreeting(this);
  }

  late final EndpointTodo todo;

  late final EndpointGreeting greeting;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'todo': todo,
        'greeting': greeting,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
