// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$galleryDetailHash() => r'49a6614745c4cde5b06c162d1d8dd4dc48a2d37c';

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

/// See also [galleryDetail].
@ProviderFor(galleryDetail)
const galleryDetailProvider = GalleryDetailFamily();

/// See also [galleryDetail].
class GalleryDetailFamily extends Family<AsyncValue<Gallery>> {
  /// See also [galleryDetail].
  const GalleryDetailFamily();

  /// See also [galleryDetail].
  GalleryDetailProvider call(
    int id,
  ) {
    return GalleryDetailProvider(
      id,
    );
  }

  @override
  GalleryDetailProvider getProviderOverride(
    covariant GalleryDetailProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'galleryDetailProvider';
}

/// See also [galleryDetail].
class GalleryDetailProvider extends AutoDisposeFutureProvider<Gallery> {
  /// See also [galleryDetail].
  GalleryDetailProvider(
    int id,
  ) : this._internal(
          (ref) => galleryDetail(
            ref as GalleryDetailRef,
            id,
          ),
          from: galleryDetailProvider,
          name: r'galleryDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$galleryDetailHash,
          dependencies: GalleryDetailFamily._dependencies,
          allTransitiveDependencies:
              GalleryDetailFamily._allTransitiveDependencies,
          id: id,
        );

  GalleryDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Gallery> Function(GalleryDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GalleryDetailProvider._internal(
        (ref) => create(ref as GalleryDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Gallery> createElement() {
    return _GalleryDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GalleryDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GalleryDetailRef on AutoDisposeFutureProviderRef<Gallery> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GalleryDetailProviderElement
    extends AutoDisposeFutureProviderElement<Gallery> with GalleryDetailRef {
  _GalleryDetailProviderElement(super.provider);

  @override
  int get id => (origin as GalleryDetailProvider).id;
}

String _$galleryControllerHash() => r'619f8ac8491d9dfb00ac5adc4b060a0ff45c8e91';

/// See also [GalleryController].
@ProviderFor(GalleryController)
final galleryControllerProvider =
    AutoDisposeAsyncNotifierProvider<GalleryController, GalleryState>.internal(
  GalleryController.new,
  name: r'galleryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$galleryControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GalleryController = AutoDisposeAsyncNotifier<GalleryState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
