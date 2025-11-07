# Todo List 프로젝트: 제품 요구사항 명세서 (PRD)

## 1. 개요

본 문서는 Dart 풀스택 개발 학습을 위한 Todo List 애플리케이션 토이 프로젝트의 요구사항을 정의합니다. 프로젝트는 Flutter를 사용한 클라이언트 앱과 Serverpod를 사용한 백엔드 서버로 구성됩니다.

## 2. 목표

- Dart 언어 생태계를 활용하여 클라이언트와 서버를 모두 개발하는 경험을 쌓습니다.
- Serverpod 프레임워크의 기본 사용법을 익힙니다.
- Flutter와 Serverpod 간의 데이터 통신 및 직렬화/역직렬화 과정을 이해합니다.
- Melos를 이용한 Dart 모노레포 관리 방법을 학습합니다.

## 3. 사용자

- 이 프로젝트의 유일한 사용자는 개발자 본인입니다.

## 4. 핵심 기능 (CRUD)

사용자는 다음과 같은 기본적인 Todo 관리 기능을 수행할 수 있어야 합니다.

- **C (Create):** 새로운 Todo 항목을 추가할 수 있습니다. 각 항목은 텍스트 내용을 가집니다.
- **R (Read):** 전체 Todo 목록을 볼 수 있습니다. 각 항목은 완료 여부와 함께 표시됩니다.
- **U (Update):** 특정 Todo 항목을 '완료' 또는 '미완료' 상태로 변경할 수 있습니다.
- **D (Delete):** 특정 Todo 항목을 목록에서 삭제할 수 있습니다.

## 5. 화면 상세 정의

- **단일 화면 (Single Screen) 구성**
  1. **앱 바 (App Bar):** 'Todo List' 제목 표시
  2. **Todo 목록 (List View):**
     - 각 항목은 `체크박스`, `할 일 내용`, `삭제 버튼`으로 구성됩니다.
     - 완료된 항목은 회색 처리 및 취소선으로 표시합니다.
  3. **입력 필드 (Text Input):** 화면 하단에 새로운 할 일을 입력하는 필드와 `추가` 버튼을 둡니다.

## 6. 기술 스택

- **서버 (Backend):** [Serverpod](https://serverpod.dev/)
- **클라이언트 (Frontend):** [Flutter](https://flutter.dev/)
- **데이터베이스 (Database):** PostgreSQL (Serverpod 기본 설정)
- **모노레포 도구 (Monorepo Tool):** [Melos](https://melos.invertase.dev/)
- **언어 (Language):** [Dart](https://dart.dev/)

## 7. 아키텍처

- **모노레포 구조:** `melos`를 사용하여 `server`, `client` (Flutter), `shared` (공유 데이터 모델) 패키지를 단일 저장소에서 관리합니다.
- **API 통신:** Flutter 클라이언트는 Serverpod 서버가 자동으로 생성하는 Dart 클라이언트 라이브러리를 사용하여 타입-세이프(type-safe)하게 API를 호출합니다.
- **데이터 모델:** `protocol` 디렉토리에서 Todo 항목에 대한 데이터 모델(YAML)을 정의하면, Serverpod가 서버와 클라이언트에서 사용할 수 있는 Dart 클래스를 자동으로 생성합니다.
