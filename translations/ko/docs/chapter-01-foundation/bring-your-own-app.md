# 나만의 앱 가져오기 - 기존 프로젝트에 azd 추가하기

**챕터 내비게이션:**
- **📚 과정 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 1장 - 기초 및 빠른 시작
- **⬅️ 이전**: [첫 번째 프로젝트](first-project.md)
- **➡️ 다음**: [개발 컨테이너 및 코드스페이스](dev-containers.md)

> 2026년 7월 `azd 1.27.1`에 대해 검증됨.

## 소개

[첫 번째 프로젝트](first-project.md)에서 템플릿에서 시작하여 앱을 배포했습니다. 하지만 대부분의 경우 이미 Node.js API, Python Flask 서비스, .NET 웹 앱 등 머신의 폴더에 *앱이 있습니다*. 이 레슨에서는 기존 코드에 azd를 추가하여 템플릿 없이 `azd up`으로 배포하는 방법을 보여줍니다.

## 학습 목표

이 레슨을 마치면:
- azd 프로젝트 시작하는 세 가지 방법을 이해합니다.
- 기존 코드베이스에서 `azd init` 실행하기
- `azure.yaml`과 `infra/` 폴더가 앱에 하는 역할 이해하기
- azd가 인프라를 생성할 때와 직접 작성할 때를 알기
- `azd up`으로 기존 앱을 Azure에 배포하기

## 학습 성과

이 레슨을 완료하면 할 수 있습니다:
- 이미 갖고 있는 프로젝트에서 azd 초기화하기
- 기본 `azure.yaml` 파일 읽고 편집하기
- `azd infra generate`로 시작 인프라 생성하기
- 앱에 적합한 Azure 호스트 선택하기
- 직접 애플리케이션 배포하고 정리하기

---

## azd 프로젝트를 시작하는 세 가지 방법

| 시작 지점 | 명령어 | 언제 사용하는가 |
|----------------|---------|-------------|
| **템플릿에서 시작** | `azd init --template <name>` | 학습하거나 검증된 샘플로 새로운 앱 시작 시 |
| **기존 코드에서 시작** | `azd init` (프로젝트 폴더에서) | 이미 앱이 있고 배포하려 할 때 |
| **Git 저장소에서 시작** | `azd init --from-code` (클론한 저장소에서) | 기존 저장소에 azd 도입 시 |

첫 번째 옵션은 이미 실습했습니다. 이 레슨은 두 번째—가장 일반적인 실제 시나리오를 다룹니다.

---

## 1단계: 프로젝트에서 `azd init` 실행하기

기존 프로젝트 폴더 <strong>내부에서</strong> 터미널을 열고 다음을 실행하세요:

```bash
cd my-existing-app
azd init
```

azd가 초기화 방식을 묻습니다. 선택하세요:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

<strong>"현재 디렉터리의 코드 사용."</strong>을 선택하세요. 그러면 azd가 폴더를 스캔해 언어와 프레임워크를 감지하고 호스트를 제안합니다.

### azd가 감지하는 것들

azd는 `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, `Dockerfile` 같은 신호를 찾아 적절한 Azure 호스트를 제안합니다:

| 앱 유형 | 감지되는 호스트 가능성 |
|----------|------------------------|
| Node.js / Python / .NET 웹 앱 | Azure App Service 또는 Container Apps |
| 컨테이너화된 앱 (`Dockerfile`) | Azure Container Apps |
| 함수 앱 | Azure Functions |
| 정적 사이트 (React/Vue 빌드 결과) | Azure Static Web Apps |

감지된 서비스를 확인하면 azd가 필요한 파일을 생성합니다.

---

## 2단계: azd가 생성한 것 이해하기

init 후 프로젝트에 새로 생긴 두 가지 항목:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — 프로젝트 정의 파일

azd 프로젝트의 핵심입니다. 최소한의 예는 다음과 같습니다:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

`services` 블록이 핵심 부분입니다: 각 항목은 코드 폴더를 Azure 호스트에 매핑합니다. 프론트엔드와 API가 있다면 두 개의 서비스가 있습니다.

### `infra/` — 코드로서 Azure 리소스

`infra/` 폴더는 앱에 필요한 Azure 리소스(Bicep 파일로 정의)를 담고 있습니다 (예: App Service, 데이터베이스). 직접 작성하지 않아도 되며 azd가 작동 가능한 시작점을 생성합니다. 나중에 리소스 추가나 보안 강화 시 편집할 수 있습니다([4장](../chapter-04-infrastructure/README.md) 참조).

> **팁:** 배포 전에 생성된 인프라 구조를 보고 싶거나 맞춤 설정하려면 `azd infra generate` (또는 `azd infra synth`)를 실행하여 IaC를 디스크에 작성해 검토 및 버전 관리할 수 있습니다.

---

## 3단계: 필수 설정 구성하기

앱에 설정이나 비밀(연결 문자열, API 키 등)이 필요하면 하드코딩하지 마세요. 환경 변수로 설정하세요:

```bash
# 환경을 생성합니다
azd env new dev

# 비밀이 아닌 값을 설정합니다
azd env set API_VERSION 1.0.0
```

실제 비밀은 Key Vault에 저장하고 인프라에서 참조하세요—[3장: 구성 및 인증](../chapter-03-configuration/authsecurity.md)을 참조하세요.

---

## 4단계: 배포하기

이미 아는 워크플로우를 사용하세요:

```bash
# 인증 (azd에 필요)
azd auth login

# 생성될 리소스 미리보기
azd provision --preview

# 인프라 프로비저닝 및 코드 배포
azd up
```

완료되면 azd가 앱 URL을 출력합니다. azd 앱과 동일하게 확인하세요:

```bash
azd show           # 엔드포인트 표시
azd monitor --logs # 필요시 로그 확인
```

---

## 일반적인 첫 실행 문제

| 증상 | 원인 가능성 | 해결 방법 |
|---------|--------------|----------|
| azd가 앱을 감지하지 못함 | 매니페스트 누락(`package.json` 등) | 매니페스트 추가 또는 `azd init` 시 호스트 수동 선택 |
| `azd up` 중 빌드 실패 | 앱에 빌드 단계 필요 | `azure.yaml` 내 서비스에 `buildCommand`/`outputPath` 추가 |
| 앱 시작은 되나 오류 발생 | 구성/비밀 누락 | `azd env set`으로 값 설정 또는 Key Vault 연결 |
| 잘못된 호스트 선택 | 자동 감지 오류 | `azure.yaml` 내 `host:` 수정 후 `azd up` 재실행 |

자세한 내용은 [7장: 문제 해결](../chapter-07-troubleshooting/README.md)을 참고하세요.

---

## 정리

```bash
azd down --force --purge
```

---

## 요약

- `azd init` → <strong>"현재 디렉터리의 코드 사용"</strong>을 선택하여 기존 앱에 azd를 추가합니다.
- `azure.yaml`는 코드 폴더를 Azure 호스트에 매핑하며, `infra/`는 리소스를 Bicep로 정의합니다.
- `azd infra generate`로 생성된 인프라를 검토하거나 맞춤 설정할 수 있습니다.
- 초기화 후, 기존 앱도 템플릿 기반 앱과 동일한 `azd up`/`azd down` 워크플로우를 사용합니다.

---

## 🔗 내비게이션

| 방향 | 레슨 |
|-----------|-------|
| <strong>이전</strong> | [첫 번째 프로젝트](first-project.md) |
| <strong>다음</strong> | [개발 컨테이너 및 코드스페이스](dev-containers.md) |

## 📖 관련 자료

- [AZD 기본](azd-basics.md)
- [4장: 코드로서의 인프라](../chapter-04-infrastructure/README.md)
- [구성 및 인증](../chapter-03-configuration/authsecurity.md)
- [명령어 치트 시트](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->