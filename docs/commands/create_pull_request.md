# Git Diff 기반 Pull Request 생성

## 0. PR 목표 설명 및 코드 변경사항 분석

**사용자:** "제가 이번에 하려는 작업은 ~입니다. 이 변경사항을 기반으로 PR을 생성해주세요" 와 같이 원하는 작업 내용을 프롬프트로 전달합니다.

**AI:** 전달받은 프롬프트를 기반으로 git diff 명령을 실행하여 실제 코드 변경사항을 파악하고, 사용자의 의도와 코드 변경 내역을 종합적으로 분석하여 다음 단계를 준비합니다. 이 분석 결과가 브랜치 이름, 커밋 메시지, PR 설명의 기반이 됩니다. 전달받은 프롬프트를 기반으로 1~5번을 진행해주세요.

## 1. `브랜치`방식을 참고하여 브랜치 제목을 만들고 브랜치를 생성합니다

- 브랜치를 생성하는 과정은 checkout이 아니라 switch로 한다.
  - **예시**:
    생성: `git switch -c feat/add-page`

### 브랜치

프로젝트 변경사항 분석 후 아래 Conventional Commits 명세에 따라 브랜치 이름을 제안합니다.

- **형식:** `type/description`
- **언어:** 타입, 스코프, 제목 모두 영어로 작성합니다.
- **타입(type):**

  - `feat`: 새로운 기능 추가 (A new feature)
  - `fix`: 버그 수정 (A bug fix)
  - `docs`: 문서 수정 (Documentation only changes)
  - `style`: 코드 스타일 수정 (Changes that do not affect the meaning of the code - white-space, formatting, missing semi-colons, etc)
  - `refactor`: 코드 리팩토링 (A code change that neither fixes a bug nor adds a feature)
  - `perf`: 성능 개선 (A code change that improves performance)
  - `test`: 테스트 코드 추가 또는 수정 (Adding missing tests or correcting existing tests)
  - `chore`: 빌드 과정, 보조 도구, 설정 등 수정 (Changes to the build process or auxiliary tools and libraries such as documentation generation)

- **좋은 예시**

  - feat/add-user-authentication-API

  - docs/update-README-file

  - chore/update-ESLint-configuration

## 2. 커밋 메세지를 영어로 작성하고 커밋 및 푸시를 진행합니다

- **예시**:
  - 스태이징: `git add -A`
  - 커밋: `git commit -m "${commit message}"`
  - 푸시: `git push origin feat/add-page`

## 3. `Pull Request 설명 생성 지침`을 참고하여 `gh Cli`를 통해 PR설명을 `root/docs/plans/pr-body.md`에 작성합니다

## 4. gh pr create --title "${title}" --body-file pr-body.md

## 5. `pr-body.md`를 삭제합니다

## 6. 어떤 작업을했는지 요약합니다

### Pull Request 설명 생성 지침

프로젝트 변경사항 분석 후 아래 마크다운 템플릿에 따라 PR 설명을 제안합니다.

- **언어:** 제목은 영어로하고 내용은 한국어로 명확하고 친절하게 작성합니다.

## PR 작성 예시입니다

```markdown
## 개요 (Overview)

- Bluetooth 어댑터 관련 로직을 `care_hub` 패키지에서 `care_hub_core_flutter` 패키지로 이동하여 코드 구조를 개선하고 재사용성을 높입니다.
- 백그라운드 서비스와 Bluetooth 통신 간의 결합도를 낮추고, Bluetooth 관련 핵심 로직을 중앙에서 관리하도록 변경합니다.

## 주요 변경 사항 (Key Changes)

- `packages/care_hub/lib/infrastructure/background_services/background_adapter_blutooth.dart` 파일 삭제
- `packages/care_hub_core_flutter/lib/src/data/adapters/background_bluetooth_adapter.dart` 파일 신규 생성 (기존 로직 이동)
- `packages/care_hub/lib/infrastructure/background_services/background_service_entry_point.dart`에서 `BackgroundBluetoothAdapter` 임포트 경로 및 생성자 변경
- `packages/care_hub_core_flutter/lib/care_hub_core_flutter.dart` 및 `packages/care_hub_core_flutter/lib/src/data/adapters/adapters.dart`에 `BackgroundBluetoothAdapter` export 추가
- `packages/care_hub_core_flutter/lib/src/data/adapters/constants/background_channel_methods.dart`에 `pairState` 및 `disconnectDevice` 상수 추가
- `packages/care_hub_core_flutter/lib/src/data/repositories/wearable_device_repository_bluetooth.dart`에서 Bluetooth 연결 및 페어링 로직을 백그라운드 서비스 채널을 통해 `BackgroundBluetoothAdapter`를 호출하도록 변경
  - `establishDeviceConnection`, `handleConnectedDevice`, `findAndAssignCharacteristics` 메서드 삭제
  - `deviceConnectAndPairing` 메서드 추가 (백그라운드 서비스 호출)
  - `connectPairStateFromBackgroundStream` 메서드 추가 (백그라운드 서비스로부터 페어링 상태 수신)

## 상세 설명 (Detailed Description)

기존에는 `care_hub` 패키지의 백그라운드 서비스 내에 Bluetooth 어댑터 로직이 직접 포함되어 있었습니다. 이번 변경을 통해 Bluetooth 통신과 관련된 핵심 로직을 `care_hub_core_flutter` 패키지의 `BackgroundBluetoothAdapter` 클래스로 분리했습니다.

- `WearableDeviceRepositoryBluetooth`는 이제 직접 Bluetooth 연결을 관리하는 대신, `FlutterBackgroundService`를 통해 `BackgroundBluetoothAdapter`의 메서드를 호출하여 Bluetooth 장치 연결, 페어링, 연결 해제 등의 작업을 수행합니다.
- 페어링 상태(`PairState`) 또한 `FlutterBackgroundService` 채널을 통해 `BackgroundBluetoothAdapter`에서 `WearableDeviceRepositoryBluetooth`로 전달됩니다.

이를 통해 다음과 같은 이점을 얻을 수 있습니다:

- **관심사 분리:** Bluetooth 통신 로직과 백그라운드 서비스 로직이 명확하게 분리됩니다.
- **재사용성 향상:** `BackgroundBluetoothAdapter`는 다른 부분에서도 Bluetooth 통신이 필요할 경우 재사용될 수 있습니다.
- **테스트 용이성:** 각 모듈을 독립적으로 테스트하기 용이해집니다.

## 참고 사항 (Additional Notes)

- 이번 리팩토링은 Bluetooth 통신 로직의 안정성과 유지보수성을 향상시키는 데 중점을 두었습니다.
```
