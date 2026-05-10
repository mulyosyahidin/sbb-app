// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cow_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cowDetailHash() => r'f5d450d1286b16f76b8d42dcf4c28c37afde1fa2';

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

/// See also [cowDetail].
@ProviderFor(cowDetail)
const cowDetailProvider = CowDetailFamily();

/// See also [cowDetail].
class CowDetailFamily extends Family<AsyncValue<Cow>> {
  /// See also [cowDetail].
  const CowDetailFamily();

  /// See also [cowDetail].
  CowDetailProvider call(
    int id,
  ) {
    return CowDetailProvider(
      id,
    );
  }

  @override
  CowDetailProvider getProviderOverride(
    covariant CowDetailProvider provider,
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
  String? get name => r'cowDetailProvider';
}

/// See also [cowDetail].
class CowDetailProvider extends AutoDisposeFutureProvider<Cow> {
  /// See also [cowDetail].
  CowDetailProvider(
    int id,
  ) : this._internal(
          (ref) => cowDetail(
            ref as CowDetailRef,
            id,
          ),
          from: cowDetailProvider,
          name: r'cowDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cowDetailHash,
          dependencies: CowDetailFamily._dependencies,
          allTransitiveDependencies: CowDetailFamily._allTransitiveDependencies,
          id: id,
        );

  CowDetailProvider._internal(
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
    FutureOr<Cow> Function(CowDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CowDetailProvider._internal(
        (ref) => create(ref as CowDetailRef),
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
  AutoDisposeFutureProviderElement<Cow> createElement() {
    return _CowDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CowDetailProvider && other.id == id;
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
mixin CowDetailRef on AutoDisposeFutureProviderRef<Cow> {
  /// The parameter `id` of this provider.
  int get id;
}

class _CowDetailProviderElement extends AutoDisposeFutureProviderElement<Cow>
    with CowDetailRef {
  _CowDetailProviderElement(super.provider);

  @override
  int get id => (origin as CowDetailProvider).id;
}

String _$cowControllerHash() => r'aba0453331b9e28307122c27ac45b2a00e6fda07';

/// See also [CowController].
@ProviderFor(CowController)
final cowControllerProvider =
    AutoDisposeAsyncNotifierProvider<CowController, CowState>.internal(
  CowController.new,
  name: r'cowControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cowControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CowController = AutoDisposeAsyncNotifier<CowState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
