# GEMINI / AI CODING ASSISTANT INSTRUCTIONS

You are acting as a Senior Flutter Developer working on this specific project. Before writing or modifying any code, you MUST read and strictly adhere to the following rules. Failure to do so will break the project architecture.

## 1. TECH STACK OVERVIEW
- **Framework:** Flutter (^3.6.2)
- **State Management:** Riverpod (`flutter_riverpod`, `riverpod_annotation`, `riverpod_generator`)
- **Routing:** GoRouter
- **Networking:** Dio
- **Architecture:** Domain-Driven Design (Clean Architecture variant)
- **Code Generation:** Freezed, Json Serializable, Riverpod Generator
- **Functional Programming:** `fpdart` (Specifically for `Either`)

## 2. STRICT CODING RULES

### A. DTOs & JSON Serialization (CRITICAL)
- **NEVER use `@JsonKey(name: '...')` for snake_case mapping.** 
- The project already uses `build.yaml` with `field_rename: snake`. Do not explicitly write the key names unless the API response completely deviates from standard snake_case naming conventions.
- All DTOs utilizing `@freezed` MUST be declared as `abstract class`.
- **API Response DTO Pattern (CRITICAL):**
  Every API response MUST be split into two classes within the same file:
  1. A `*Data` class (e.g., `GetSlidersResponseData`) that parses and holds the actual payload.
  2. A `*Dto` class (e.g., `GetSlidersResponseDto`) that extends `ApiResponseDto<*Data>`.
  You must follow this exact pattern for parsing, utilizing `ApiResponseDto.fromJson` to handle the base response structure (success, message, errors).

### B. State Management (Riverpod)
- When a provider depends on another provider, **ALWAYS use `ref.watch`**. 
- **NEVER use `ref.read`** to access another provider's state inside a provider's initialization or build method.
- Always evaluate if a provider needs `@Riverpod(keepAlive: true)` based on the use case.

### C. Repository & Error Handling
- All domain repositories must return `Future<Either<Failure, T>>` using the `fpdart` package.
- `Failure` class is already defined globally. Use it for the `Left` side.
- **The `Right` side MUST be the `*Data` class (e.g., `GetSlidersResponseData`) or a Domain Entity.** NEVER pass the wrapper `*Dto` class (e.g., `GetSlidersResponseDto`) to the Repository or Domain layer.

### D. Data Sources
- Every remote data source MUST have an `abstract class` interface.
- Implementations MUST use `Dio` for network requests.
- The Data Source layer is responsible for unpacking the `*Dto` and returning only the `*Data` (or throwing a mapped exception if the base `ApiResponseDto` indicates failure) to the Repository layer.

### E. Entities
- All domain entities MUST extend `Equatable` to ensure value equality.

### F. UI Components & Images
- **Network Images (CRITICAL):** ALWAYS use the custom wrapper `AppNetworkImage` imported from `lib/shared/widgets/app_network_image.dart` when displaying network images. NEVER use raw `Image.network` or `CachedNetworkImage` directly inside presentation layers.

## 3. ARCHITECTURE & DIRECTORY STRUCTURE
Every full module must strictly follow this folder hierarchy. Do not invent new directories or place files outside this structure:

- application/
  -- [module]_controller.dart
- data/
  -- datasources/
     --- [module]_remote_data_source.dart
  -- dtos/
     --- [module]_dto.dart
     --- responses/
         ---- get_[module]_response_dto.dart
         ---- ***_response_dto.dart
     --- requests/
         ---- ***_request_dto.dart
  -- mappers/
     --- [module]_mapper.dart
  -- repositories/
     --- [module]_repository_impl.dart
- domain/
  -- entities/
     --- [module].dart
  -- repository/
     --- [module]_repository.dart
- presentation/
  -- widgets/
  -- screens/
     --- [module]_page.dart

## 4. CONSISTENCY & CONTEXT INSTRUCTION
**Before generating code for a new module or modifying an existing one, you MUST search and read other existing modules in this project.** 
Mimic the existing naming conventions, file structures, mapper logic, and Dio implementations exactly. Pay special attention to how `ApiResponseDto` is implemented. Do not introduce a new coding style.

## 5. POST-GENERATION COMMAND
If you generate or modify ANY file that requires code generation (e.g., files using `@freezed`, `@JsonSerializable`, or `@riverpod`), you must instruct the user to run the following command, or run it yourself if you have terminal execution capabilities:

`dart run build_runner build --delete-conflicting-outputs`