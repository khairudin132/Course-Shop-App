// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_courses.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiGetCoursesHash() => r'6633593e48c38c5435074455daaa7df7c8d614fd';

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

/// See also [apiGetCourses].
@ProviderFor(apiGetCourses)
const apiGetCoursesProvider = ApiGetCoursesFamily();

/// See also [apiGetCourses].
class ApiGetCoursesFamily extends Family<AsyncValue<GetCoursesApiResponse>> {
  /// See also [apiGetCourses].
  const ApiGetCoursesFamily();

  /// See also [apiGetCourses].
  ApiGetCoursesProvider call({
    int? categoryTypeId,
  }) {
    return ApiGetCoursesProvider(
      categoryTypeId: categoryTypeId,
    );
  }

  @override
  ApiGetCoursesProvider getProviderOverride(
    covariant ApiGetCoursesProvider provider,
  ) {
    return call(
      categoryTypeId: provider.categoryTypeId,
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
  String? get name => r'apiGetCoursesProvider';
}

/// See also [apiGetCourses].
class ApiGetCoursesProvider
    extends AutoDisposeFutureProvider<GetCoursesApiResponse> {
  /// See also [apiGetCourses].
  ApiGetCoursesProvider({
    int? categoryTypeId,
  }) : this._internal(
          (ref) => apiGetCourses(
            ref as ApiGetCoursesRef,
            categoryTypeId: categoryTypeId,
          ),
          from: apiGetCoursesProvider,
          name: r'apiGetCoursesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiGetCoursesHash,
          dependencies: ApiGetCoursesFamily._dependencies,
          allTransitiveDependencies:
              ApiGetCoursesFamily._allTransitiveDependencies,
          categoryTypeId: categoryTypeId,
        );

  ApiGetCoursesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryTypeId,
  }) : super.internal();

  final int? categoryTypeId;

  @override
  Override overrideWith(
    FutureOr<GetCoursesApiResponse> Function(ApiGetCoursesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiGetCoursesProvider._internal(
        (ref) => create(ref as ApiGetCoursesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryTypeId: categoryTypeId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<GetCoursesApiResponse> createElement() {
    return _ApiGetCoursesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiGetCoursesProvider &&
        other.categoryTypeId == categoryTypeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryTypeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApiGetCoursesRef on AutoDisposeFutureProviderRef<GetCoursesApiResponse> {
  /// The parameter `categoryTypeId` of this provider.
  int? get categoryTypeId;
}

class _ApiGetCoursesProviderElement
    extends AutoDisposeFutureProviderElement<GetCoursesApiResponse>
    with ApiGetCoursesRef {
  _ApiGetCoursesProviderElement(super.provider);

  @override
  int? get categoryTypeId => (origin as ApiGetCoursesProvider).categoryTypeId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
