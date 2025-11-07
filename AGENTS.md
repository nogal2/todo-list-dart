# 프로젝트 : Todo 리스트 (풀스택 다트)

## 1. 프로젝트 개요

이 프로젝트는 다트 언어 생태계를 사용하여 풀스택 "Todo 리스트" 애플리케이션을 구축하는 토이 프로젝트입니다. 목표는 다트를 사용하여 백엔드 서버와 프론트엔드 클라이언트를 모두 제작하는 능숙함을 연습하고 시연하는 것입니다.

- **백엔드:** 서버는 다트를 위한 현대적인 오픈 소스 백엔드 프레임워크인 [Serverpod](https://serverpod.dev/)로 구축되었습니다. 비즈니스 로직과 데이터베이스 상호 작용을 처리합니다.
- **프론트엔드:** 클라이언트는 여러 플랫폼(예: 모바일, 웹)에서 실행되도록 설계된 [Flutter](https://flutter.dev/) 애플리케이션입니다.
- **데이터베이스:** 이 프로젝트는 Serverpod의 기본 데이터베이스인 PostgreSQL을 사용합니다.
- **아키텍처:** 이 프로젝트는 [Melos](https://melos.invertase.dev/)에 의해 관리될 가능성이 있는 모노레포로 구조화되어 있습니다. 서버, Flutter 앱, 그리고 프론트엔드와 백엔드 간의 타입-세이프(type-safe) 통신을 가능하게 하는 공유 클라이언트 라이브러리를 위한 별도의 패키지를 포함합니다.

## 2. 빌드 및 실행 방법

### 백엔드 (Serverpod)

서버는 필요한 서비스(PostgreSQL 및 Redis)를 실행하기 위해 Docker가 필요합니다.

1.  **서버 및 서비스 시작:** 서버 디렉토리로 이동하여 Docker 서비스를 시작하고 서버를 실행합니다. `--apply-migrations` 플래그는 시작 시 보류 중인 데이터베이스 마이그레이션을 적용합니다.

    ```bash
    # 서버 디렉토리로 이동
    cd packages/todo_list_dart_server

    # 서비스 시작 (PostgreSQL 및 Redis)
    docker compose up --build --detach

    # 서버를 실행하고 보류중인 마이그레이션을 적용
    dart bin/main.dart --apply-migrations
    ```

2.  **서비스 중지:** 작업이 끝나면 Docker 컨테이너를 중지합니다. 이 명령어는 `packages/todo_list_dart_server` 디렉토리에서 실행해야 합니다.
    ```bash
    docker compose stop
    ```

### 코드 생성 (Serverpod)

새로운 엔드포인트를 만들거나 `todo_list_dart_server/lib/src/entities`의 데이터 모델을 수정할 때 클라이언트 측 코드를 다시 생성해야 합니다.

1. **코드 생성:** 서버의 디렉토리에서 `serverpod generate` 명령어를 실행합니다.

   ```bash
   # 서버 디렉토리로 이동
   cd packages/todo_list_dart_server

   # 코드 생성
   serverpod generate
   ```

### 프론트엔드 (Flutter)

Flutter 앱이 올바르게 작동하려면 서버가 활성 상태여야 합니다.

1. **서버 실행 확인:** 먼저 위 단계에 따라 백엔드 서버를 시작했는지 확인합니다.

2. **앱 실행:** Flutter 애플리케이션을 실행합니다.

   ```bash
   # flutter 앱 디렉토리로 이동
   cd packages/todo_list_dart_flutter

   # 앱 실행
   flutter run
   ```

## 3. 개발 컨벤션

- **타입 안전성:** 이 프로젝트는 타입 안전성을 강조합니다. Serverpod 서버는 다트 클라이언트 라이브러리(`todo_list_dart_client`)를 자동으로 생성하며, Flutter 앱은 이를 사용하여 모든 API 호출이 타입-세이프(type-safe)인지 확인합니다.
- **코드 스타일:** 이 프로젝트는 `analysis_options.yaml` 파일에 정의된 표준 다트 린팅 규칙을 사용하며, `flutter_lints`를 포함합니다.
- **모노레포 구조:** 코드는 `packages/` 디렉토리 내의 별도 패키지로 구성됩니다:
  - `todo_list_dart_server`: 백엔드 애플리케이션.
  - `todo_list_dart_flutter`: 프론트엔드 Flutter 애플리케이션.
  - `todo_list_dart_client`: API 통신을 위한 자동 생성된 클라이언트.
  - `todo_list_dart_core`: 도메인 계층
  - `todo_list_dart_core_flutter`: 데이터 계층
