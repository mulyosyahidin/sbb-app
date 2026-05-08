// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchHomeDataHash() => r'e127031e0bdad97b62e23822839c4c090755ce97';

/// See also [fetchHomeData].
@ProviderFor(fetchHomeData)
final fetchHomeDataProvider = AutoDisposeFutureProvider<HomeState>.internal(
  fetchHomeData,
  name: r'fetchHomeDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchHomeDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchHomeDataRef = AutoDisposeFutureProviderRef<HomeState>;
String _$slidersHash() => r'500a2ddb9b9c2f62f235d913e23f7f07bf5fe9c1';

/// See also [sliders].
@ProviderFor(sliders)
final slidersProvider = FutureProvider<List<Slider>>.internal(
  sliders,
  name: r'slidersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$slidersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SlidersRef = FutureProviderRef<List<Slider>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
