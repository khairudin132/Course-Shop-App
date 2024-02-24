// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_sign_up.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseSignUpHash() => r'bffe10d9394ed159b87f43df0323e091f3001b34';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [firebaseSignUp].
@ProviderFor(firebaseSignUp)
const firebaseSignUpProvider = FirebaseSignUpFamily();

/// See also [firebaseSignUp].
class FirebaseSignUpFamily extends Family<AsyncValue<void>> {
  /// See also [firebaseSignUp].
  const FirebaseSignUpFamily();

  /// See also [firebaseSignUp].
  FirebaseSignUpProvider call({
    required String username,
    required String email,
    required String password,
  }) {
    return FirebaseSignUpProvider(
      username: username,
      email: email,
      password: password,
    );
  }

  @override
  FirebaseSignUpProvider getProviderOverride(
    covariant FirebaseSignUpProvider provider,
  ) {
    return call(
      username: provider.username,
      email: provider.email,
      password: provider.password,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'firebaseSignUpProvider';
}

/// See also [firebaseSignUp].
class FirebaseSignUpProvider extends AutoDisposeFutureProvider<void> {
  /// See also [firebaseSignUp].
  FirebaseSignUpProvider({
    required String username,
    required String email,
    required String password,
  }) : this._internal(
          (ref) => firebaseSignUp(
            ref as FirebaseSignUpRef,
            username: username,
            email: email,
            password: password,
          ),
          from: firebaseSignUpProvider,
          name: r'firebaseSignUpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firebaseSignUpHash,
          dependencies: FirebaseSignUpFamily._dependencies,
          allTransitiveDependencies:
              FirebaseSignUpFamily._allTransitiveDependencies,
          username: username,
          email: email,
          password: password,
        );

  FirebaseSignUpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.email,
    required this.password,
  }) : super.internal();

  final String username;
  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<void> Function(FirebaseSignUpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirebaseSignUpProvider._internal(
        (ref) => create(ref as FirebaseSignUpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _FirebaseSignUpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirebaseSignUpProvider &&
        other.username == username &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FirebaseSignUpRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _FirebaseSignUpProviderElement
    extends AutoDisposeFutureProviderElement<void> with FirebaseSignUpRef {
  _FirebaseSignUpProviderElement(super.provider);

  @override
  String get username => (origin as FirebaseSignUpProvider).username;
  @override
  String get email => (origin as FirebaseSignUpProvider).email;
  @override
  String get password => (origin as FirebaseSignUpProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
