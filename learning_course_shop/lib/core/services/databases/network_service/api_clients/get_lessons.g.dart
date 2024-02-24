// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lessons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiGetLessonsHash() => r'db7c3b6e924d7e9cda659bfeb09a6c958e6d27c9';

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

/// See also [apiGetLessons].
@ProviderFor(apiGetLessons)
const apiGetLessonsProvider = ApiGetLessonsFamily();

/// See also [apiGetLessons].
class ApiGetLessonsFamily extends Family<AsyncValue<GetLessonsApiResponse>> {
  /// See also [apiGetLessons].
  const ApiGetLessonsFamily();

  /// See also [apiGetLessons].
  ApiGetLessonsProvider call({
    required int courseId,
  }) {
    return ApiGetLessonsProvider(
      courseId: courseId,
    );
  }

  @override
  ApiGetLessonsProvider getProviderOverride(
    covariant ApiGetLessonsProvider provider,
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
  String? get name => r'apiGetLessonsProvider';
}

/// See also [apiGetLessons].
class ApiGetLessonsProvider
    extends AutoDisposeFutureProvider<GetLessonsApiResponse> {
  /// See also [apiGetLessons].
  ApiGetLessonsProvider({
    required int courseId,
  }) : this._internal(
          (ref) => apiGetLessons(
            ref as ApiGetLessonsRef,
            courseId: courseId,
          ),
          from: apiGetLessonsProvider,
          name: r'apiGetLessonsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiGetLessonsHash,
          dependencies: ApiGetLessonsFamily._dependencies,
          allTransitiveDependencies:
              ApiGetLessonsFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  ApiGetLessonsProvider._internal(
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
    FutureOr<GetLessonsApiResponse> Function(ApiGetLessonsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiGetLessonsProvider._internal(
        (ref) => create(ref as ApiGetLessonsRef),
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
  AutoDisposeFutureProviderElement<GetLessonsApiResponse> createElement() {
    return _ApiGetLessonsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiGetLessonsProvider && other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApiGetLessonsRef on AutoDisposeFutureProviderRef<GetLessonsApiResponse> {
  /// The parameter `courseId` of this provider.
  int get courseId;
}

class _ApiGetLessonsProviderElement
    extends AutoDisposeFutureProviderElement<GetLessonsApiResponse>
    with ApiGetLessonsRef {
  _ApiGetLessonsProviderElement(super.provider);

  @override
  int get courseId => (origin as ApiGetLessonsProvider).courseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
