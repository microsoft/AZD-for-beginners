# 자신만의 azd 템플릿 만들기

**챕터 내비게이션:**
- **📚 강의 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 4장 - 코드로서의 인프라 및 배포
- **⬅️ 이전**: [배포 가이드](deployment-guide.md)
- **🚀 다음 챕터**: [5장: 다중 에이전트 솔루션](../chapter-05-multi-agent/README.md)

> 2026년 7월에 `azd 1.27.1` 기준으로 검증됨.

## 소개

지금까지 `azd init --template <name>`로 템플릿을 <em>사용</em>해왔습니다. 그러나 팀이 좋아하는 프로젝트 레이아웃이 생기면 — 예를 들어, Cosmos DB가 포함된 컨테이너 앱과 적절한 모니터링이 있는 경우 — 이 레이아웃을 자신만의 재사용 가능한 템플릿으로 만들고 싶을 것입니다. 템플릿은 azd가 읽을 수 있는 예측 가능한 구조를 가진 Git 저장소일 뿐입니다. 이 수업은 처음부터 템플릿을 만드는 방법, 테스트하는 방법, 그리고 (선택적으로) 커뮤니티 갤러리에 게시하는 방법을 보여줍니다.

## 학습 목표

이 수업이 끝나면:
- 폴더가 "azd 템플릿"이 되는 요건을 이해합니다
- 필수 파일과 폴더 레이아웃을 알게 됩니다
- 다른 사람이 재사용할 수 있도록 `azure.yaml`과 `infra/`를 추가합니다
- 템플릿을 공유하기 전에 로컬에서 테스트합니다
- 템플릿을 게시하고 (선택적으로) Awesome AZD에 제출합니다

## 학습 성과

이 수업을 완료하면 다음을 할 수 있습니다:
- 새 템플릿 저장소를 스캐폴딩합니다
- 인프라를 매개변수화하여 어떤 구독에서도 작동하도록 만듭니다
- `azd init`과 `azd up`으로 템플릿을 검증합니다
- 커뮤니티 갤러리가 요구하는 메타데이터를 추가합니다

---

## 템플릿이란 정말 무엇인가?

azd 템플릿은 최소한 다음을 포함하는 <strong>Git 저장소</strong>입니다:

| 파일 / 폴더 | 목적 | 필수 여부 |
|---------------|---------|-----------|
| `azure.yaml` | 서비스, 호스트, 인프라 제공자를 설명 | ✅ 예 |
| `infra/` | 리소스를 프로비저닝하는 Bicep, Terraform 또는 Pulumi | ✅ 예 |
| `src/` (또는 코드) | azd가 배포하는 애플리케이션 코드 | ✅ 예 |
| `README.md` | 템플릿 사용법 | ✅ 강력히 권장 |
| `.azdo/` 또는 `.github/` | CI/CD 파이프라인 정의 | 선택 사항 |
| `.devcontainer/` | 재현 가능한 개발 환경 | 선택 사항 |
| `azure.yaml` 내 `metadata` | 갤러리 + 텔레메트리 정보 | 선택 사항 (게시 시 필수) |

특별한 마법은 없습니다: `azd init --template you/your-repo`를 실행하면 azd가 저장소를 복제하고 `azure.yaml`을 읽습니다.

---

## 1단계: 저장소 스캐폴딩

폴더 구조를 수동으로 만들거나 최소 템플릿에서 시작해 편집하세요:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# 표준 레이아웃을 생성하세요
mkdir -p src infra
```

보통 완성된 레이아웃은 다음과 같습니다:

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

이것이 템플릿의 핵심입니다. azd가 무엇을 배포하고 어떻게 배포할지 알려줍니다:

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

> `metadata.template` 필드는 갤러리 텔레메트리가 사용량을 집계하는 데 씁니다. `이름@버전` 규칙을 사용하세요.

---

## 3단계: 인프라 매개변수화

재사용 가능한 템플릿의 가장 중요한 규칙: **이름, 지역, 구독별 값을 절대 하드코딩하지 마세요.** 매개변수와 리소스 토큰 패턴을 사용하여 템플릿이 누구 구독에서도 작동하도록 만듭니다.

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

이 템플릿이 템플릿 친화적인 이유는 두 가지입니다:

1. **`azd-env-name` 태그** — azd는 이를 사용하여 환경별 리소스를 추적하고 정리합니다.
2. **`uniqueString(...)` 리소스 토큰** — 이름 충돌을 방지하는 안정적이고 전역적으로 고유한 접미사를 생성합니다.

환경에서 azd가 주입하는 값을 읽는 매개변수 파일을 제공합니다:

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

azd는 현재 환경에서 `${AZURE_ENV_NAME}`과 `${AZURE_LOCATION}`을 자동으로 치환합니다.

---

## 4단계: 템플릿 로컬 테스트

공유하기 전에 템플릿이 깨끗한 상태에서 작동함을 증명하세요.

**로컬 폴더에서 테스트** (Git 푸시 불필요):

```bash
# 빈 디렉토리에서 로컬 템플릿 경로를 사용하여 초기화
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# 프로비저닝 + 엔드 투 엔드 배포
azd auth login
azd up
```

**그런 다음 정리 작업 테스트** — 좋은 템플릿은 리소스를 완전히 정리합니다:

```bash
azd down --force --purge
```

`azd down`이 리소스를 남겨두면 아마도 리소스에 `azd-env-name` 태그를 빼먹은 것입니다.

> **팁:** 먼저 `azd provision --preview`를 실행하세요. 리소스 생성 전 템플릿 오류를 미리 확인할 수 있습니다.

---

## 5단계: 템플릿 게시

저장소를 GitHub에 푸시하세요 (다른 사람이 사용하려면 공개 저장소로):

```bash
gh repo create my-azd-template --public --source=. --push
```

이제 누구나 사용할 수 있습니다:

```bash
azd init --template your-github-username/my-azd-template
```

---

## 6단계 (선택): Awesome AZD에 제출하기

[Awesome AZD 갤러리](https://azure.github.io/awesome-azd/)는 커뮤니티 템플릿을 나열합니다. 목록에 포함되려면 저장소에 다음 항목이 있어야 합니다:

- ✅ 전제 조건, 아키텍처 다이어그램, 비용 메모가 포함된 명확한 `README.md`
- ✅ `metadata.template`이 포함된 작동하는 `azure.yaml`
- ✅ 새 구독에서 깔끔하게 프로비저닝되는 인프라
- ✅ `LICENSE` 파일
- ✅ (권장) 원클릭 Codespaces용 `.devcontainer/`

[Awesome AZD 저장소](https://github.com/Azure/awesome-azd)의 기여 가이드를 따라 갤러리 데이터 파일에 템플릿을 추가하는 풀 리퀘스트를 열어 제출하세요.

---

## 흔한 실수

| 실수 | 수정 방법 |
|---------|-----|
| 하드코딩된 리소스 이름 | `uniqueString()` 리소스 토큰 사용 |
| `azd down`이 리소스를 남김 | 모든 리소스(또는 리소스 그룹)에 `azd-env-name` 태그 지정 |
| 템플릿이 본인에겐 작동하지만 다른 사람에겐 실패 | 구독 ID, 테넌트 ID, 지역 가정을 제거 |
| 출력이 앱에 연결되지 않음 | `SERVICE_<NAME>_ENDPOINT_URL`와 기타 `AZURE_*` 출력을 내보냄 |
| 갤러리 제출 거절됨 | `README.md`, `LICENSE` 및 `metadata.template` 추가 |

---

## 요약

- 템플릿은 `azure.yaml`, `infra/`, 그리고 코드가 포함된 Git 저장소일 뿐입니다.
- 모든 것을 매개변수화하세요 — 이름, 지역, ID — 아무 곳에서나 실행되도록.
- 리소스에 항상 `azd-env-name` 태그를 붙여 `azd down`이 작동하도록 하세요.
- 게시하기 전에 `azd init --template <local-path>`로 로컬에서 테스트하세요.
- Awesome AZD에 제출하려면 메타데이터와 README를 추가하세요.

---

## 🔗 내비게이션

| 방향 | 리소스 |
|-----------|----------|
| <strong>이전</strong> | [배포 가이드](deployment-guide.md) |
| **챕터 홈** | [4장: 코드로서의 인프라](README.md) |
| **다음 챕터** | [5장: 다중 에이전트 솔루션](../chapter-05-multi-agent/README.md) |

## 📖 관련 리소스

- [리소스 프로비저닝](provisioning.md)
- [Awesome AZD 갤러리](https://azure.github.io/awesome-azd/)
- [공식 azd 템플릿 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->