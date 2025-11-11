# Todo List Dart (Serverpod + Flutter)

## 1. 프로젝트 개요

- Dart 풀스택 학습용 Todo List 애플리케이션으로 Serverpod 백엔드와 Flutter 클라이언트가 동시에 동작합니다.
- 단일 저장소에서 서버, Flutter 앱, 공유 도메인, 클라이언트 SDK를 Melos로 관리합니다.
- 요구사항과 UX 세부 내용은 `PRD.md`에서 확인할 수 있습니다.

## 2. 주요 기능 요약

| 영역        | 설명                                                                                                                                                         |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| CRUD API    | `packages/todo_list_dart_server/lib/src/endpoints/todo_endpoint.dart`에서 Todo 추가/조회/수정/삭제 제공                                                      |
| 데이터 모델 | `packages/todo_list_dart_server/lib/src/entities/todo_entity.spy.yaml` 정의를 기반으로 Serverpod가 서버·클라이언트 클래스를 생성                             |
| Flutter UI  | `packages/todo_list_dart_flutter/lib/main.dart`에서 단일 화면으로 Todo 목록과 입력 필드 제공 예정                                                            |
| 공유 레이어 | `packages/todo_list_dart_core`가 도메인 모델을, `packages/todo_list_dart_core_flutter`가 Serverpod 어댑터(`serverpod_adapter.dart`)와 Repository 구현을 제공 |

## 3. 패키지 구조

| 패키지                        | 역할                                                       | 비고                                                                         |
| ----------------------------- | ---------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `todo_list_dart_server`       | Serverpod 백엔드, PostgreSQL/Redis 연동, 마이그레이션 보관 | `docker-compose.yaml`, `lib/src/endpoints`, `lib/src/entities`, `migrations` |
| `todo_list_dart_client`       | Serverpod가 생성하는 타입세이프 클라이언트 SDK             | Flutter·Core 패키지에서 의존                                                 |
| `todo_list_dart_core`         | Todo 도메인 모델(`TodoModel`)과 추상 Repository 정의       | `freezed` 기반                                                               |
| `todo_list_dart_core_flutter` | Flutter 측 데이터 계층, Serverpod 클라이언트 어댑터        | `TodoRepositoryServerpod`, `Client` 초기화                                   |
| `todo_list_dart_flutter`      | Flutter UI 애플리케이션                                    | 플랫폼별 타겟 포함                                                           |

## 4. 사전 준비물

1. Dart SDK 3.9.2
2. Flutter (안정 채널)
3. Docker Desktop (PostgreSQL, Redis 컨테이너 실행용)
4. Serverpod CLI

```bash
dart pub global activate serverpod_cli
```

5. Melos

```bash
dart pub global activate melos
```

1. (선택) VS Code / IntelliJ + Dart, Flutter 플러그인

## 5. 빠른 시작

### 5.1 패키지 의존성 설치

```bash
flutter pub get
melos bootstrap
```

- `melos.yaml`의 `bootstrap` 훅이 Serverpod 코드 생성 후 build_runner를 실행합니다.

### 5.2 백엔드 실행

```bash
cd packages/todo_list_dart_server
# PostgreSQL, Redis 기동
docker compose up --build --detach
# 서버 시작 및 마이그레이션 적용
dart bin/main.dart --apply-migrations
```

- 중지: `docker compose stop`
- 엔티티/엔드포인트 수정 후에는 `serverpod generate`를 다시 실행합니다.

### 5.3 Flutter 앱 실행

```bash
cd packages/todo_list_dart_flutter
flutter run
```

- 서버가 실행 중이어야 `TodoRepositoryServerpod`가 정상 동작합니다.

## 6. 개발 워크플로

1. **데이터 모델 변경**: `lib/src/entities/*.spy.yaml` 수정 → `serverpod generate` → `melos run build_runner:build`.
2. **비즈니스 로직**: `todo_endpoint.dart`에서 CRUD 로직 추가/수정.
3. **공유 모델**: `todo_list_dart_core/lib/src/domain/models`에서 `freezed` 모델 업데이트.
4. **데이터 계층**: `todo_list_dart_core_flutter`에서 Serverpod 응답을 도메인 모델로 매핑.
5. **UI 갱신**: Flutter 위젯에서 Repository를 주입하고 상태를 갱신.
6. **테스트 & 품질**: `melos run lint:all`로 분석/포맷, 필요 시 패키지별 테스트 추가.

## 7. 자주 사용하는 Melos 스크립트

| 스크립트                       | 명령                                  | 설명                    |
| ------------------------------ | ------------------------------------- | ----------------------- |
| `melos run clean:all`          | 모든 패키지 `flutter clean`           | 캐시 초기화             |
| `melos run pubget:all`         | 모든 패키지 `dart pub get`            | 의존성 동기화           |
| `melos run lint:analyze`       | `flutter analyze` 혹은 `dart analyze` | 정적 분석               |
| `melos run lint:format`        | `dart format` 체크                    | 포맷 일관성             |
| `melos run build_runner:build` | build_runner 일괄 실행                | Freezed, JSON 코드 생성 |
| `melos run build:server`       | Docker 서비스+Serverpod 기동          | 백엔드 통합 실행        |
| `melos run build:client`       | `serverpod generate`                  | 클라이언트 코드 재생성  |
| `melos run build:flutter`      | Flutter 앱 실행                       | 서버 실행 전제          |
| `melos run stop:server`        | Docker 서비스 중지                    | PostgreSQL/Redis 종료   |
