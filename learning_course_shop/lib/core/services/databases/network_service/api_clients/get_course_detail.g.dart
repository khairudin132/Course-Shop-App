// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_course_detail.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$apiGetCourseDetailHash() =>
    r'd22b3494750082d49d0cc38ed2ea31ab6243a595';

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

/// See also [apiGetCourseDetail].
@ProviderFor(apiGetCourseDetail)
const apiGetCourseDetailProvider = ApiGetCourseDetailFamily();

/// See also [apiGetCourseDetail].
class ApiGetCourseDetailFamily
    extends Family<AsyncValue<GetCourseDetailApiResponse>> {
  /// See also [apiGetCourseDetail].
  const ApiGetCourseDetailFamily();

  /// See also [apiGetCourseDetail].
  ApiGetCourseDetailProvider call({
    required int courseId,
  }) {
    return ApiGetCourseDetailProvider(
      courseId: courseId,
    );
  }

  @override
  ApiGetCourseDetailProvider getProviderOverride(
    covariant ApiGetCourseDetailProvider provider,
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
  String? get name => r'apiGetCourseDetailProvider';
}

/// See also [apiGetCourseDetail].
class ApiGetCourseDetailProvider
    extends AutoDisposeFutureProvider<GetCourseDetailApiResponse> {
  /// See also [apiGetCourseDetail].
  ApiGetCourseDetailProvider({
    required int courseId,
  }) : this._internal(
          (ref) => apiGetCourseDetail(
            ref as ApiGetCourseDetailRef,
            courseId: courseId,
          ),
          from: apiGetCourseDetailProvider,
          name: r'apiGetCourseDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$apiGetCourseDetailHash,
          dependencies: ApiGetCourseDetailFamily._dependencies,
          allTransitiveDependencies:
              ApiGetCourseDetailFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  ApiGetCourseDetailProvider._internal(
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
    FutureOr<GetCourseDetailApiResponse> Function(
            ApiGetCourseDetailRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ApiGetCourseDetailProvider._internal(
        (ref) => create(ref as ApiGetCourseDetailRef),
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
  AutoDisposeFutureProviderElement<GetCourseDetailApiResponse> createElement() {
    return _ApiGetCourseDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ApiGetCourseDetailProvider && other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ApiGetCourseDetailRef
    on AutoDisposeFutureProviderRef<GetCourseDetailApiResponse> {
  /// The parameter `courseId` of this provider.
  int get courseId;
}

class _ApiGetCourseDetailProviderElement
    extends AutoDisposeFutureProviderElement<GetCourseDetailApiResponse>
    with ApiGetCourseDetailRef {
  _ApiGetCourseDetailProviderElement(super.provider);

  @override
  int get courseId => (origin as ApiGetCourseDetailProvider).courseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
