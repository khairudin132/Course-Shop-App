// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_sign_in.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseSignInHash() => r'fc720bae13253e72d8bc8ee1256f6f58cb6322d4';

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

/// See also [firebaseSignIn].
@ProviderFor(firebaseSignIn)
const firebaseSignInProvider = FirebaseSignInFamily();

/// See also [firebaseSignIn].
class FirebaseSignInFamily extends Family<AsyncValue<void>> {
  /// See also [firebaseSignIn].
  const FirebaseSignInFamily();

  /// See also [firebaseSignIn].
  FirebaseSignInProvider call({
    required String email,
    required String password,
  }) {
    return FirebaseSignInProvider(
      email: email,
      password: password,
    );
  }

  @override
  FirebaseSignInProvider getProviderOverride(
    covariant FirebaseSignInProvider provider,
  ) {
    return call(
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
  String? get name => r'firebaseSignInProvider';
}

/// See also [firebaseSignIn].
class FirebaseSignInProvider extends AutoDisposeFutureProvider<void> {
  /// See also [firebaseSignIn].
  FirebaseSignInProvider({
    required String email,
    required String password,
  }) : this._internal(
          (ref) => firebaseSignIn(
            ref as FirebaseSignInRef,
            email: email,
            password: password,
          ),
          from: firebaseSignInProvider,
          name: r'firebaseSignInProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$firebaseSignInHash,
          dependencies: FirebaseSignInFamily._dependencies,
          allTransitiveDependencies:
              FirebaseSignInFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  FirebaseSignInProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<void> Function(FirebaseSignInRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirebaseSignInProvider._internal(
        (ref) => create(ref as FirebaseSignInRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _FirebaseSignInProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirebaseSignInProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FirebaseSignInRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _FirebaseSignInProviderElement
    extends AutoDisposeFutureProviderElement<void> with FirebaseSignInRef {
  _FirebaseSignInProviderElement(super.provider);

  @override
  String get email => (origin as FirebaseSignInProvider).email;
  @override
  String get password => (origin as FirebaseSignInProvider).password;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
