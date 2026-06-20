# 자신만의 azd 템플릿 작성

**챕터 네비게이션:**
- **📚 강의 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 4장 - 코드로서의 인프라 및 배포
- **⬅️ 이전**: [배포 가이드](deployment-guide.md)
- **🚀 다음 챕터**: [5장: 멀티 에이전트 솔루션](../chapter-05-multi-agent/README.md)

> 2026년 6월, `azd 1.25.6`으로 검증됨.

## 소개

지금까지는 `azd init --template <name>`으로 템플릿을 <em>사용</em>했습니다. 하지만 팀이 선호하는 프로젝트 레이아웃 — 예를 들어 Cosmos DB와 적절한 모니터링이 설정된 Container App — 을 갖추게 되면, 이를 재사용 가능한 템플릿으로 만들어 두고 싶을 것입니다. 템플릿은 azd가 읽을 수 있는 예측 가능한 구조를 가진 Git 리포지토리일 뿐입니다. 이 레슨에서는 처음부터 템플릿을 만드는 방법, 테스트하는 방법, (선택적으로) 커뮤니티 갤러리에 게시하는 방법을 보여줍니다.

## 학습 목표

이 레슨을 마치면 다음을 수행할 수 있습니다:
- 폴더가 "azd 템플릿"이 되기 위한 조건을 이해합니다.
- 필요한 파일과 폴더 레이아웃을 압니다.
- 다른 사람이 재사용할 수 있는 `azure.yaml` 및 `infra/`를 추가합니다.
- 공유하기 전에 로컬에서 템플릿을 테스트합니다.
- 템플릿을 게시하고 (선택적으로) Awesome AZD에 제출합니다.

## 학습 성과

이 레슨을 완료하면 다음을 할 수 있습니다:
- 새 템플릿 리포지토리의 스캐폴딩을 수행할 수 있습니다.
- 모든 구독에서 작동하도록 인프라를 매개변수화할 수 있습니다.
- `azd init` 및 `azd up`으로 템플릿을 검증할 수 있습니다.
- 커뮤니티 갤러리가 요구하는 메타데이터를 추가할 수 있습니다.

---

## 템플릿이란, 정말 무엇인가?

azd 템플릿은 최소한 다음을 포함하는 <strong>Git 리포지토리</strong>입니다:

| 파일 / 폴더 | 용도 | 필수? |
|---------------|---------|-----------|
| `azure.yaml` | 서비스, 호스트 및 인프라 공급자를 설명 | ✅ 예 |
| `infra/` | 리소스를 프로비저닝하는 Bicep, Terraform 또는 Pulumi | ✅ 예 |
| `src/` (또는 코드) | azd가 배포하는 애플리케이션 코드 | ✅ 예 |
| `README.md` | 템플릿 사용 방법 | ✅ 강력 권장 |
| `.azdo/` or `.github/` | CI/CD 파이프라인 정의 | 선택 사항 |
| `.devcontainer/` | 재현 가능한 개발 환경 | 선택 사항 |
| `azure.yaml` `metadata` | 갤러리 + 텔레메트리 정보 | 선택 사항(게시하려면 필요) |

여기에는 특별한 마법이 없습니다: `azd init --template you/your-repo`를 실행하면 azd가 리포를 클론하고 `azure.yaml`을 읽습니다.

---

## 1단계: 리포지토리 스캐폴딩

폴더 구조를 수동으로 만들거나 최소 템플릿에서 시작해 편집하세요:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 표준 레이아웃을 생성합니다
mkdir -p src infra
```

전형적인 완성 레이아웃은 다음과 같습니다:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## 2단계: `azure.yaml` 작성

이 파일이 템플릿의 핵심입니다. azd에게 무엇을 어떻게 배포할지 알려줍니다:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` 필드는 갤러리 텔레메트리가 사용량을 집계하는 데 사용됩니다. `name@version` 규칙을 사용하세요.

---

## 3단계: 인프라 매개변수화

*재사용 가능한* 템플릿을 위한 가장 중요한 규칙 하나: **이름, 리전 또는 구독 관련 값을 하드코딩하지 마세요.** 매개변수와 리소스 토큰 패턴을 사용하면 같은 템플릿이 누구의 구독에서도 작동합니다.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

템플릿 친화적으로 만드는 두 가지 요소:

1. **`azd-env-name` 태그** — azd는 이를 사용해 환경별 리소스를 추적하고 정리합니다.
2. **`uniqueString(...)` 리소스 토큰** — 이름 충돌을 방지하기 위해 안정적이고 전역적으로 고유한 접미사를 생성합니다.

azd가 환경에서 주입하는 값을 읽는 일치하는 매개변수 파일을 제공하세요:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd는 현재 환경에서 `${AZURE_ENV_NAME}` 및 `${AZURE_LOCATION}`을 자동으로 대체합니다.

---

## 4단계: 로컬에서 템플릿 테스트

공유하기 전에 클린 상태에서 템플릿이 작동함을 증명하세요.

**로컬 폴더에서 테스트** (Git 푸시 불필요):

```bash
# 빈 디렉터리에서 로컬 템플릿 경로를 사용하여 초기화합니다
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 프로비저닝 및 배포를 처음부터 끝까지
azd auth login
azd up
```

**그런 다음 정리(teardown)를 테스트하세요** — 좋은 템플릿은 완전히 정리됩니다:

```bash
azd down --force --purge
```

`azd down`이 리소스를 남긴다면, 해당 리소스에 `azd-env-name` 태그를 빠뜨렸을 가능성이 큽니다.

> **팁:** 먼저 `azd provision --preview`를 실행하세요. 실제 리소스가 생성되기 전에 what-if를 수행하여 템플릿 오류를 노출합니다.

---

## 5단계: 템플릿 게시

리포지토리를 GitHub에 푸시하세요 (다른 사람이 사용하게 하려면 공개):

```bash
gh repo create my-azd-template --public --source=. --push
```

이제 누구나 사용할 수 있습니다:

```bash
azd init --template your-github-username/my-azd-template
```

---

## 6단계(선택): Awesome AZD에 제출

[Awesome AZD 갤러리](https://azure.github.io/awesome-azd/)에는 커뮤니티 템플릿이 나열됩니다. 목록에 포함되려면 리포지토리에 다음이 포함되어야 합니다:

- ✅ 명확한 `README.md`(사전 요구사항, 아키텍처 다이어그램, 비용 관련 주의사항 포함)
- ✅ `metadata.template`이 포함된 동작하는 `azure.yaml`
- ✅ 새로운 구독에서도 깔끔하게 프로비저닝되는 인프라
- ✅ `LICENSE` 파일
- ✅ (권장) 원클릭 Codespaces를 위한 `.devcontainer/`

갤러리의 데이터 파일에 템플릿을 추가하는 풀 리퀘스트를 열어 제출하세요. 기여 가이드는 [Awesome AZD 리포지토리](https://github.com/Azure/awesome-azd)를 참조하세요.

---

## 일반적인 함정

| 문제점 | 해결 방법 |
|---------|-----|
| 하드코딩된 리소스 이름 | `uniqueString()` 리소스 토큰 사용 |
| `azd down`이 리소스를 남김 | 모든 리소스(또는 리소스 그룹)에 `azd-env-name` 태그 추가 |
| 템플릿이 본인에게는 작동하지만 다른 사람에게는 실패 | 구독 ID, 테넌트 ID, 리전 가정 제거 |
| 출력값이 앱에 연결되지 않음 | `SERVICE_<NAME>_ENDPOINT_URL` 및 기타 `AZURE_*` 출력을 내보내기 |
| 갤러리 제출이 거절됨 | `README.md`, `LICENSE`, 그리고 `metadata.template` 추가 |

---

## 요약

- 템플릿은 `azure.yaml`, `infra/`, 그리고 코드가 포함된 단순한 Git 리포지토리입니다.
- 모든 항목(이름, 리전, ID)을 매개변수화하여 어디서나 실행 가능하게 만드세요.
- 항상 리소스에 `azd-env-name` 태그를 붙여 `azd down`이 작동하도록 하세요.
- 게시하기 전에 `azd init --template <local-path>`로 로컬에서 테스트하세요.
- Awesome AZD에 제출하려면 메타데이터와 README를 추가하세요.

---

## 🔗 내비게이션

| 방향 | 리소스 |
|-----------|----------|
| <strong>이전</strong> | [배포 가이드](deployment-guide.md) |
| **챕터 홈** | [4장: 코드로서의 인프라](README.md) |
| **다음 챕터** | [5장: 멀티 에이전트 솔루션](../chapter-05-multi-agent/README.md) |

## 📖 관련 리소스

- [리소스 프로비저닝](provisioning.md)
- [Awesome AZD 갤러리](https://azure.github.io/awesome-azd/)
- [공식 azd 템플릿 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->