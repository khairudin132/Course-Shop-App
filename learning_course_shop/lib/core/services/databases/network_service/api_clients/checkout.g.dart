// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiCheckoutHash() => r'6070826ebd10c284500bbe1281e1f0f7dc2634a1';

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

/// See also [apiCheckout].
@ProviderFor(apiCheckout)
const apiCheckoutProvider = ApiCheckoutFamily();

/// See also [apiCheckout].
class ApiCheckoutFamily extends Family<AsyncValue<GetCheckoutApiResponse>> {
  /// See also [apiCheckout].
  const ApiCheckoutFamily();

  /// See also [apiCheckout].
  ApiCheckoutProvider call({
    required int courseId,
  }) {
    return ApiCheckoutProvider(
      courseId: courseId,
    );
  }

  @override
  ApiCheckoutProvider getProviderOverride(
    covariant ApiCheckoutProvider provider,
  ) {
    return call(
      courseId: provider.courseId,
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
  String? get name => r'apiCheckoutProvider';
}

/// See also [apiCheckout].
class ApiCheckoutProvider
    extends AutoDisposeFutureProvider<GetCheckoutApiResponse> {
  /// See also [apiCheckout].
  ApiCheckoutProvider({
    required int courseId,
  }) : this._internal(
          (ref) => apiCheckout(
            ref as ApiCheckoutRef,
            courseId: courseId,
          ),
          from: apiCheckoutProvider,
          name: r'apiCheckoutProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiCheckoutHash,
          dependencies: ApiCheckoutFamily._dependencies,
          allTransitiveDependencies:
              ApiCheckoutFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  ApiCheckoutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
  }) : super.internal();

  final int courseId;

  @override
  Override overrideWith(
    FutureOr<GetCheckoutApiResponse> Function(ApiCheckoutRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiCheckoutProvider._internal(
        (ref) => create(ref as ApiCheckoutRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GetCheckoutApiResponse> createElement() {
    return _ApiCheckoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiCheckoutProvider && other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApiCheckoutRef on AutoDisposeFutureProviderRef<GetCheckoutApiResponse> {
  /// The parameter `courseId` of this provider.
  int get courseId;
}

class _ApiCheckoutProviderElement
    extends AutoDisposeFutureProviderElement<GetCheckoutApiResponse>
    with ApiCheckoutRef {
  _ApiCheckoutProviderElement(super.provider);

  @override
  int get courseId => (origin as ApiCheckoutProvider).courseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
