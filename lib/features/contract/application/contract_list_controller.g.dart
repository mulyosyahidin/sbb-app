// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contractListControllerHash() =>
    r'ced8547c9f0079a2b38309f0b924b0c0025abef5';

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

abstract class _$ContractListController
    extends BuildlessAutoDisposeAsyncNotifier<ContractListState> {
  late final String? status;

  FutureOr<ContractListState> build(
    String? status,
  );
}

/// See also [ContractListController].
@ProviderFor(ContractListController)
const contractListControllerProvider = ContractListControllerFamily();

/// See also [ContractListController].
class ContractListControllerFamily
    extends Family<AsyncValue<ContractListState>> {
  /// See also [ContractListController].
  const ContractListControllerFamily();

  /// See also [ContractListController].
  ContractListControllerProvider call(
    String? status,
  ) {
    return ContractListControllerProvider(
      status,
    );
  }

  @override
  ContractListControllerProvider getProviderOverride(
    covariant ContractListControllerProvider provider,
  ) {
    return call(
      provider.status,
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
  String? get name => r'contractListControllerProvider';
}

/// See also [ContractListController].
class ContractListControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<ContractListController,
        ContractListState> {
  /// See also [ContractListController].
  ContractListControllerProvider(
    String? status,
  ) : this._internal(
          () => ContractListController()..status = status,
          from: contractListControllerProvider,
          name: r'contractListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contractListControllerHash,
          dependencies: ContractListControllerFamily._dependencies,
          allTransitiveDependencies:
              ContractListControllerFamily._allTransitiveDependencies,
          status: status,
        );

  ContractListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final String? status;

  @override
  FutureOr<ContractListState> runNotifierBuild(
    covariant ContractListController notifier,
  ) {
    return notifier.build(
      status,
    );
  }

  @override
  Override overrideWith(ContractListController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContractListControllerProvider._internal(
        () => create()..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ContractListController,
      ContractListState> createElement() {
    return _ContractListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContractListControllerProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContractListControllerRef
    on AutoDisposeAsyncNotifierProviderRef<ContractListState> {
  /// The parameter `status` of this provider.
  String? get status;
}

class _ContractListControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ContractListController,
        ContractListState> with ContractListControllerRef {
  _ContractListControllerProviderElement(super.provider);

  @override
  String? get status => (origin as ContractListControllerProvider).status;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
