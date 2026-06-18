# AZD 기초 - Azure Developer CLI 이해하기

# AZD 기초 - 핵심 개념과 기본 사항

**챕터 탐색:**
- **📚 코스 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [코스 개요](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ 다음**: [설치 및 설정](installation.md)
- **🚀 다음 챕터**: [챕터 2: AI-퍼스트 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 소개

이 수업에서는 Azure Developer CLI(azd)를 소개합니다. azd는 로컬 개발에서 Azure 배포까지의 여정을 가속화하는 강력한 명령 줄 도구입니다. 기본 개념과 핵심 기능을 배우고 azd가 클라우드 네이티브 애플리케이션 배포를 어떻게 간소화하는지 이해할 수 있습니다.

## 학습 목표

이 수업을 마치면 다음을 할 수 있습니다:
- Azure Developer CLI가 무엇이며 주요 목적이 무엇인지 이해하기
- 템플릿, 환경, 서비스의 핵심 개념 배우기
- 템플릿 기반 개발 및 코드로서의 인프라를 포함한 주요 기능 탐색
- azd 프로젝트 구조와 워크플로우 이해하기
- 개발 환경에 azd를 설치하고 구성할 준비하기

## 학습 결과

이 수업을 완료하면 다음을 할 수 있습니다:
- 현대 클라우드 개발 워크플로우에서 azd의 역할 설명
- azd 프로젝트 구조의 구성 요소 식별
- 템플릿, 환경, 서비스가 어떻게 함께 작동하는지 설명
- azd를 사용한 코드로서의 인프라의 이점 이해
- 다양한 azd 명령어와 그 용도 인식

## Azure Developer CLI(azd)란?

Azure Developer CLI(azd)는 로컬 개발에서 Azure 배포로 가는 여정을 가속화하도록 설계된 명령 줄 도구입니다. Azure에서 클라우드 네이티브 애플리케이션을 구축, 배포 및 관리하는 작업을 간소화합니다.

### azd로 무엇을 배포할 수 있나요?

azd는 다양한 워크로드를 지원하며 그 목록은 계속 늘어나고 있습니다. 현재 azd를 사용하여 배포할 수 있는 것들은:

| 워크로드 유형 | 예시 | 동일한 워크플로우? |
|---------------|----------|----------------|
| **전통적 애플리케이션** | 웹 앱, REST API, 정적 사이트 | ✅ `azd up` |
| **서비스 및 마이크로서비스** | 컨테이너 앱, 함수 앱, 다중 서비스 백엔드 | ✅ `azd up` |
| **AI 기반 애플리케이션** | Microsoft Foundry 모델을 사용하는 채팅 앱, AI 검색 기반 RAG 솔루션 | ✅ `azd up` |
| **지능형 에이전트** | Foundry 호스팅 에이전트, 다중 에이전트 오케스트레이션 | ✅ `azd up` |

핵심 인사이트는 <strong>azd 라이프사이클은 배포하는 것이 무엇이든 동일하다</strong>는 점입니다. 프로젝트를 초기화하고, 인프라를 제공(provision)하고, 코드를 배포하고, 앱을 모니터링하고, 정리하는 과정이 간단한 웹사이트든 복잡한 AI 에이전트든 같습니다.

이러한 연속성은 의도된 설계입니다. azd는 AI 기능을 애플리케이션이 사용할 수 있는 또 다른 서비스 유형으로 취급하며, 근본적으로 다르게 보지 않습니다. Microsoft Foundry 모델이 지원하는 채팅 엔드포인트는 azd 관점에서 단지 구성하고 배포해야 하는 또 다른 서비스일 뿐입니다.

### 🎯 왜 AZD를 사용할까요? 실제 비교

단순 웹 앱과 데이터베이스를 배포하는 예를 비교해 보겠습니다:

#### ❌ AZD 없이: 수동 Azure 배포 (30분 이상)

```bash
# 1단계: 리소스 그룹 생성
az group create --name myapp-rg --location eastus

# 2단계: 앱 서비스 플랜 생성
az appservice plan create --name myapp-plan \
  --resource-group myapp-rg \
  --sku B1 --is-linux

# 3단계: 웹 앱 생성
az webapp create --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --plan myapp-plan \
  --runtime "NODE:18-lts"

# 4단계: Cosmos DB 계정 생성 (10-15분 소요)
az cosmosdb create --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --kind MongoDB

# 5단계: 데이터베이스 생성
az cosmosdb mongodb database create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --name tododb

# 6단계: 컬렉션 생성
az cosmosdb mongodb collection create \
  --account-name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --database-name tododb \
  --name todos

# 7단계: 연결 문자열 가져오기
CONN_STR=$(az cosmosdb keys list \
  --name myapp-cosmos-unique123 \
  --resource-group myapp-rg \
  --type connection-strings \
  --query "connectionStrings[0].connectionString" -o tsv)

# 8단계: 앱 설정 구성
az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings MONGODB_URI="$CONN_STR"

# 9단계: 로깅 활성화
az webapp log config --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --application-logging filesystem \
  --detailed-error-messages true

# 10단계: Application Insights 설정
az monitor app-insights component create \
  --app myapp-insights \
  --location eastus \
  --resource-group myapp-rg

# 11단계: App Insights를 웹 앱에 연결
INSTRUMENTATION_KEY=$(az monitor app-insights component show \
  --app myapp-insights \
  --resource-group myapp-rg \
  --query "instrumentationKey" -o tsv)

az webapp config appsettings set \
  --name myapp-web-unique123 \
  --resource-group myapp-rg \
  --settings APPINSIGHTS_INSTRUMENTATIONKEY="$INSTRUMENTATION_KEY"

# 12단계: 애플리케이션 로컬 빌드
npm install
npm run build

# 13단계: 배포 패키지 생성
zip -r app.zip . -x "*.git*" "node_modules/*"

# 14단계: 애플리케이션 배포
az webapp deployment source config-zip \
  --resource-group myapp-rg \
  --name myapp-web-unique123 \
  --src app.zip

# 15단계: 기다리고 잘 되길 기도하기 🙏
# (자동 검증 없음, 수동 테스트 필요)
```

**문제점들:**
- ❌ 15개 이상의 명령어를 기억하고 순서대로 실행해야 함
- ❌ 30-45분의 수작업 필요
- ❌ 실수하기 쉬움 (오타, 잘못된 매개변수)
- ❌ 연결 문자열이 터미널 기록에 노출됨
- ❌ 실패 시 자동 롤백 없음
- ❌ 팀원이 복제하기 어려움
- ❌ 매번 다름 (재현 불가)

#### ✅ AZD 사용: 자동화된 배포 (5개 명령, 10-15분)

```bash
# 1단계: 템플릿에서 초기화
azd init --template todo-nodejs-mongo

# 2단계: 인증
azd auth login

# 3단계: 환경 생성
azd env new dev

# 4단계: 변경사항 미리보기 (선택 사항이지만 권장됨)
azd provision --preview

# 5단계: 모든 항목 배포
azd up

# ✨ 완료! 모든 항목이 배포되고, 구성되며, 모니터링됩니다
```

**장점들:**
- ✅ <strong>5개 명령어</strong>로 15개 이상의 수동 단계 대체
- ✅ 총 **10-15분** (주로 Azure 대기 시간)
- ✅ **수동 오류 감소** - 일관된 템플릿 기반 워크플로우
- ✅ **안전한 비밀 관리** - 많은 템플릿이 Azure 관리 비밀 저장소 사용
- ✅ **반복 가능한 배포** - 매번 동일한 워크플로우
- ✅ **완전 재현 가능** - 매번 동일 결과
- ✅ **팀 친화적** - 누구나 동일 명령으로 배포 가능
- ✅ **코드로서의 인프라** - 버전 관리되는 Bicep 템플릿
- ✅ **내장 모니터링** - Application Insights 자동 구성

### 📊 시간 및 오류 감소

| 지표 | 수동 배포 | AZD 배포 | 개선율 |
|:-------|:------------------|:---------------|:------------|
| **명령어 수** | 15개 이상 | 5개 | 67% 감소 |
| <strong>시간</strong> | 30-45분 | 10-15분 | 60% 빠름 |
| <strong>오류율</strong> | 약 40% | 5% 미만 | 88% 감소 |
| <strong>일관성</strong> | 낮음 (수동) | 100% (자동) | 완벽함 |
| **팀 온보딩 시간** | 2-4시간 | 30분 | 75% 빠름 |
| **롤백 시간** | 30분 이상 (수동) | 2분 (자동) | 93% 빠름 |

## 핵심 개념

### 템플릿
템플릿은 azd의 기초입니다. 포함 내용:
- **애플리케이션 코드** - 소스 코드 및 종속성
- **인프라 정의** - Bicep 또는 Terraform으로 정의된 Azure 리소스
- **구성 파일** - 설정 및 환경 변수
- **배포 스크립트** - 자동화된 배포 워크플로우

### 환경
환경은 서로 다른 배포 대상입니다:
- <strong>개발</strong> - 테스트 및 개발용
- <strong>스테이징</strong> - 사전 운영 환경
- <strong>운영</strong> - 실시간 운영 환경

각 환경은 다음을 유지합니다:
- Azure 리소스 그룹
- 구성 설정
- 배포 상태

### 서비스
서비스는 애플리케이션의 구성 요소입니다:
- <strong>프론트엔드</strong> - 웹 애플리케이션, SPA
- <strong>백엔드</strong> - API, 마이크로서비스
- <strong>데이터베이스</strong> - 데이터 저장 솔루션
- <strong>스토리지</strong> - 파일 및 Blob 스토리지

## 주요 기능

### 1. 템플릿 기반 개발
```bash
# 사용 가능한 템플릿 탐색
azd template list

# 템플릿에서 초기화하기
azd init --template <template-name>
```

### 2. 코드로서의 인프라
- **Bicep** - Azure의 도메인 특화 언어
- **Terraform** - 멀티 클라우드 인프라 도구
- **ARM 템플릿** - Azure 리소스 관리자 템플릿

### 3. 통합 워크플로우
```bash
# 전체 배포 워크플로우
azd up            # 프로비저닝 + 배포 이것은 첫 번째 설정을 위한 자동화 작업입니다

# 🧪 새로움: 배포 전에 인프라 변경 사항 미리보기 (안전)
azd provision --preview    # 변경 없이 인프라 배포 시뮬레이션

azd provision     # 인프라를 업데이트할 때 Azure 리소스를 생성하려면 이것을 사용하세요
azd deploy        # 애플리케이션 코드를 배포하거나 업데이트 후 재배포
azd down          # 리소스 정리
```

#### 🛡️ 안전한 인프라 계획을 위한 미리보기
`azd provision --preview` 명령어는 안전한 배포를 위한 혁신적인 기능입니다:
- **드라이런 분석** - 생성, 수정, 삭제될 항목 표시
- **제로 위험** - Azure 환경에 실제 변경 없음
- **팀 협업** - 배포 전 미리보기 결과 공유
- **비용 추정** - 가입 전 리소스 비용 파악 가능

```bash
# 예시 미리보기 워크플로우
azd provision --preview           # 변경될 내용을 확인하세요
# 결과물을 검토하고 팀과 논의하세요
azd provision                     # 자신감을 가지고 변경사항을 적용하세요
```

### 📊 시각적: AZD 개발 워크플로우

```mermaid
graph LR
    A[azd 초기화] -->|프로젝트 초기화| B[azd 인증 로그인]
    B -->|인증| C[azd 환경 새로 만들기]
    C -->|환경 생성| D{첫 배포인가요?}
    D -->|예| E[azd 실행]
    D -->|아니요| F[azd 프로비저닝 --미리보기]
    F -->|변경 사항 검토| G[azd 프로비저닝]
    E -->|프로비저닝 및 배포| H[리소스 실행 중]
    G -->|인프라 업데이트| H
    H -->|모니터링| I[azd 모니터]
    I -->|코드 변경하기| J[azd 배포]
    J -->|코드만 재배포| H
    H -->|정리| K[azd 종료]
    
    style A fill:#e1f5fe
    style E fill:#c8e6c9
    style F fill:#fff9c4
    style H fill:#c5e1a5
    style K fill:#ffcdd2
```

**워크플로우 설명:**
1. **초기화(Init)** - 템플릿 또는 새 프로젝트로 시작
2. **인증(Auth)** - Azure 인증
3. **환경(Environment)** - 격리된 배포 환경 생성
4. **미리보기(Preview)** - 🆕 인프라 변경을 항상 미리보기 (안전 관행)
5. **프로비저닝(Provision)** - Azure 리소스 생성/업데이트
6. **배포(Deploy)** - 애플리케이션 코드 푸시
7. **모니터링(Monitor)** - 애플리케이션 성능 관찰
8. **반복(Iterate)** - 변경하여 코드 재배포
9. **정리(Cleanup)** - 완료 후 리소스 제거

### 4. 환경 관리
```bash
# 환경을 생성하고 관리합니다
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

### 5. 확장 및 AI 명령어

azd는 핵심 CLI 기능 외에 확장 시스템을 사용해 기능을 추가합니다. AI 워크로드에 특히 유용합니다:

```bash
# 사용 가능한 확장 프로그램 목록
azd extension list

# Foundry 에이전트 확장 프로그램 설치
azd extension install azure.ai.agents

# 매니페스트에서 AI 에이전트 프로젝트 초기화
azd ai agent init -m agent-manifest.yaml

# 배포된 에이전트 테스트 (지연 시간 및 최초 바이트 수신 시간 표시)
azd ai agent invoke

# AI 지원 개발을 위한 MCP 서버 시작 (알파)
azd mcp start
```

**에이전트 라이프사이클, 끝에서 끝까지.** `azure.ai.agents`를 설치하면 아이디어에서 실행 및 모니터링되는 에이전트까지 한 워크플로우가 완성됩니다. 모두 첫날에 필요하지는 않지만 존재한다는 것을 알고 있으면 됩니다:

| 단계 | 명령어 | 기능 |
|-------|---------|--------------|
| <strong>스캐폴드</strong> | `azd ai agent init -m <manifest>` | 매니페스트에서 에이전트 프로젝트 생성 |
| <strong>테스트</strong> | `azd ai agent invoke` | 에이전트 호출 및 응답 시간 확인 |
| <strong>측정</strong> | `azd ai agent eval generate` | 에이전트용 평가 데이터셋 생성 |
| <strong>개선</strong> | `azd ai agent optimize` | 데이터 기반 에이전트 지침 최적화 |
| <strong>검사</strong> | `azd ai agent endpoint show` | 라이브 엔드포인트 구성 보기 |
| <strong>정리</strong> | `azd ai agent delete` | 호스팅된 에이전트 및 모든 버전 삭제 |

> 확장은 [챕터 2: AI-퍼스트 개발](../chapter-02-ai-development/agents.md) 및 [AZD AI CLI 명령어](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) 참고 자료에서 자세히 다룹니다.

## 📁 프로젝트 구조

일반적인 azd 프로젝트 구조:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 구성 파일

### azure.yaml
주요 프로젝트 구성 파일:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
환경별 구성:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 실제 워크플로우 연습 문제

> **💡 학습 팁:** 연습 문제를 순서대로 수행하여 AZD 기술을 단계적으로 쌓아가세요.

### 🎯 연습 1: 첫 프로젝트 초기화

**목표:** AZD 프로젝트 생성하고 구조 탐색하기

**단계:**
```bash
# 검증된 템플릿 사용
azd init --template todo-nodejs-mongo

# 생성된 파일 탐색
ls -la  # 숨김 파일 포함 모든 파일 보기

# 생성된 주요 파일:
# - azure.yaml (주 구성 파일)
# - infra/ (인프라 코드)
# - src/ (애플리케이션 코드)
```

**✅ 성공:** azure.yaml, infra/, src/ 디렉터리 생성됨

---

### 🎯 연습 2: Azure에 배포하기

**목표:** 엔드투엔드 배포 완료

**단계:**
```bash
# 1. 인증하기
az login && azd auth login

# 2. 환경 만들기
azd env new dev
azd env set AZURE_LOCATION eastus

# 3. 변경 사항 미리보기 (권장)
azd provision --preview

# 4. 모두 배포하기
azd up

# 5. 배포 확인하기
azd show    # 앱 URL 보기
```

**예상 소요 시간:** 10-15분  
**✅ 성공:** 애플리케이션 URL 브라우저에 열림

---

### 🎯 연습 3: 다중 환경 설정

**목표:** 개발(dev) 및 스테이징(staging)에 배포

**단계:**
```bash
# 이미 개발이 있으니 스테이징을 만드세요
azd env new staging
azd env set AZURE_LOCATION westus2
azd up

# 이들 사이를 전환하세요
azd env list
azd env select dev
```

**✅ 성공:** Azure 포털에서 두 개의 별도 리소스 그룹 확인

---

### 🛡️ 완전 초기화: `azd down --force --purge`

완전히 초기화가 필요할 때:

```bash
azd down --force --purge
```

**기능:**
- `--force`: 확인 요청 없이 실행
- `--purge`: 모든 로컬 상태 및 Azure 리소스 삭제

**사용 시기:**
- 배포 중간 실패 시
- 프로젝트 전환 시
- 새로 시작해야 할 때

---

## 🎪 원래 워크플로우 참고

### 새 프로젝트 시작
```bash
# 방법 1: 기존 템플릿 사용
azd init --template todo-nodejs-mongo

# 방법 2: 처음부터 시작
azd init

# 방법 3: 현재 디렉토리 사용
azd init .
```

### 개발 사이클
```bash
# 개발 환경 설정
azd auth login
azd env new dev
azd env select dev

# 모든 것을 배포
azd up

# 변경하고 다시 배포
azd deploy

# 작업 완료 후 정리
azd down --force --purge # Azure Developer CLI의 명령어는 환경에 대한 **하드 리셋**입니다—특히 실패한 배포를 문제 해결하거나 고아 리소스 정리, 새 배포 준비 시 유용합니다.
```

## `azd down --force --purge` 이해하기
`azd down --force --purge` 명령어는 azd 환경과 관련 모든 리소스를 완전히 제거하는 강력한 방법입니다. 플래그별 역할은 다음과 같습니다:
```
--force
```
- 확인 요청 건너뜀
- 자동화 또는 수동 입력이 어려운 상황에 유용
- CLI가 불일치를 감지해도 중단 없이 종료 진행

```
--purge
```
<strong>모든 관련 메타데이터</strong>를 삭제합니다:
환경 상태
로컬 `.azure` 폴더
캐시된 배포 정보
azd가 이전 배포를 "기억"하지 못하도록 하여 리소스 그룹 불일치나 오래된 레지스트리 참조 문제 예방


### 왜 둘 다 사용하는가?
`azd up` 실행 중 상태 문제나 부분 배포가 발생했을 경우 이 조합으로 **완전 초기화** 할 수 있습니다.

특히 Azure 포털에서 수동으로 리소스를 삭제했거나 템플릿, 환경, 리소스 그룹 이름 규칙을 변경할 때 유용합니다.


### 다중 환경 관리
```bash
# 스테이징 환경 생성
azd env new staging
azd env select staging
azd up

# 개발 환경으로 전환
azd env select dev

# 환경 비교
azd env list
```

## 🔐 인증 및 자격 증명

인증 이해는 성공적인 azd 배포에 필수적입니다. Azure는 다양한 인증 방법을 제공하며 azd는 다른 Azure 도구들이 사용하는 동일한 자격 증명 체인을 활용합니다.

### Azure CLI 인증 (`az login`)

azd 사용 전 Azure 인증이 필요합니다. 가장 일반적인 방법은 Azure CLI를 사용하는 것입니다:

```bash
# 대화형 로그인 (브라우저 열기)
az login

# 특정 테넌트로 로그인
az login --tenant <tenant-id>

# 서비스 프린서플로 로그인
az login --service-principal -u <app-id> -p <password> --tenant <tenant-id>

# 현재 로그인 상태 확인
az account show

# 사용 가능한 구독 목록
az account list --output table

# 기본 구독 설정
az account set --subscription <subscription-id>
```

### 인증 흐름
1. **대화형 로그인**: 기본 브라우저를 열어 인증
2. **디바이스 코드 플로우**: 브라우저 접근 불가 환경용
3. **서비스 프린서플**: 자동화 및 CI/CD 시나리오용
4. **관리되는 ID**: Azure 호스팅 애플리케이션용

### DefaultAzureCredential 체인

`DefaultAzureCredential`은 여러 인증 출처를 특정 순서로 자동 시도하여 인증 경험을 단순화하는 자격 증명 유형입니다:

#### 자격 증명 체인 순서
```mermaid
graph TD
    A[DefaultAzureCredential] --> B[환경 변수]
    B --> C[작업 부하 ID]
    C --> D[관리 ID]
    D --> E[비주얼 스튜디오]
    E --> F[비주얼 스튜디오 코드]
    F --> G[Azure CLI]
    G --> H[Azure PowerShell]
    H --> I[인터랙티브 브라우저]
```

#### 1. 환경 변수
```bash
# 서비스 프린시플을 위한 환경 변수를 설정하세요
export AZURE_CLIENT_ID="<app-id>"
export AZURE_CLIENT_SECRET="<password>"
export AZURE_TENANT_ID="<tenant-id>"
```

#### 2. 워크로드 아이덴티티 (Kubernetes/GitHub Actions)
자동으로 사용되는 곳:
- Workload Identity가 적용된 Azure Kubernetes Service (AKS)
- OIDC 연동이 된 GitHub Actions
- 기타 연동된 신원 시나리오

#### 3. 관리되는 ID
Azure 리소스용:
- 가상 머신 (VM)
- App Service
- Azure Functions
- 컨테이너 인스턴스

```bash
# 관리 ID가 있는 Azure 리소스에서 실행 중인지 확인
az account show --query "user.type" --output tsv
# 반환값: 관리 ID를 사용하는 경우 "servicePrincipal"
```

#### 4. 개발자 도구 통합
- **Visual Studio**: 로그인된 계정 자동 사용
- **VS Code**: Azure Account 확장 자격 증명 사용
- **Azure CLI**: `az login` 자격 증명 사용 (로컬 개발에서 가장 일반적)

### AZD 인증 설정

```bash
# 방법 1: Azure CLI 사용 (개발 환경에 권장됨)
az login
azd auth login  # 기존 Azure CLI 자격 증명 사용

# 방법 2: 직접 azd 인증
azd auth login --use-device-code  # 헤드리스 환경용

# 방법 3: 인증 상태 확인
azd auth login --check-status

# 방법 4: 로그아웃 후 재인증
azd auth logout
azd auth login
```

### 인증 모범 사례

#### 로컬 개발용
```bash
# 1. Azure CLI로 로그인하기
az login

# 2. 올바른 구독 확인하기
az account show
az account set --subscription "Your Subscription Name"

# 3. 기존 자격 증명으로 azd 사용하기
azd auth login
```

#### CI/CD 파이프라인용
```yaml
# GitHub Actions example
- name: Azure Login
  uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}

- name: Deploy with azd
  run: |
    azd auth login --client-id ${{ secrets.AZURE_CLIENT_ID }} \
                    --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
                    --tenant-id ${{ secrets.AZURE_TENANT_ID }}
    azd up --no-prompt
```

#### 프로덕션 환경용
- Azure 리소스에서 실행할 때 **Managed Identity** 사용
- 자동화 시나리오에는 **Service Principal** 사용
- 코드나 구성 파일에 자격 증명 저장 금지
- 민감한 구성에는 **Azure Key Vault** 사용

### 공통 인증 문제 및 해결 방법

#### 문제: "구독을 찾을 수 없습니다"
```bash
# 해결 방법: 기본 구독 설정
az account list --output table
az account set --subscription "<subscription-id>"
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"
```

#### 문제: "권한이 부족합니다"
```bash
# 솔루션: 필요한 역할 확인 및 할당
az role assignment list --assignee $(az account show --query user.name --output tsv)

# 공통 필요 역할:
# - 기여자 (리소스 관리용)
# - 사용자 액세스 관리자 (역할 할당용)
```

#### 문제: "토큰이 만료되었습니다"
```bash
# 해결책: 다시 인증하기
az logout
az login
azd auth logout
azd auth login
```

### 다양한 시나리오에서의 인증

#### 로컬 개발
```bash
# 개인 개발 계좌
az login
azd auth login
```

#### 팀 개발
```bash
# 조직을 위해 특정 테넌트를 사용하세요
az login --tenant contoso.onmicrosoft.com
azd auth login
```

#### 멀티 테넌트 시나리오
```bash
# 테넌트 간 전환
az login --tenant tenant1.onmicrosoft.com
# 테넌트 1에 배포
azd up

az login --tenant tenant2.onmicrosoft.com  
# 테넌트 2에 배포
azd up
```

### 보안 고려사항

1. **자격 증명 저장**: 자격 증명을 소스 코드에 절대 저장하지 마세요
2. **범위 제한**: 서비스 프린시펄에 최소 권한 원칙 적용
3. **토큰 갱신**: 서비스 프린시펄 비밀을 주기적으로 변경
4. **감사 추적**: 인증 및 배포 활동 모니터링
5. **네트워크 보안**: 가능한 경우 프라이빗 엔드포인트 사용

### 인증 문제 해결

```bash
# 인증 문제 디버그
azd auth login --check-status
az account show
az account get-access-token

# 일반 진단 명령어
whoami                          # 현재 사용자 컨텍스트
az ad signed-in-user show      # 마이크로소프트 엔트라 ID 사용자 세부 정보
az group list                  # 리소스 접근 테스트
```

## `azd down --force --purge` 이해하기

### 탐색
```bash
azd template list              # 템플릿 탐색
azd template show <template>   # 템플릿 세부정보
azd init --help               # 초기화 옵션
```

### 프로젝트 관리
```bash
azd show                     # 프로젝트 개요
azd env list                # 사용 가능한 환경 및 선택된 기본값
azd config show            # 구성 설정
```

### 모니터링
```bash
azd monitor                  # Azure 포털 모니터링 열기
azd monitor --logs           # 애플리케이션 로그 보기
azd monitor --live           # 실시간 지표 보기
azd pipeline config          # CI/CD 설정
```

## 모범 사례

### 1. 의미 있는 이름 사용
```bash
# 좋음
azd env new production-east
azd init --template web-app-secure

# 피하다
azd env new env1
azd init --template template1
```

### 2. 템플릿 활용
- 기존 템플릿에서 시작
- 필요에 맞게 사용자 정의
- 조직용 재사용 가능한 템플릿 생성

### 3. 환경 분리
- 개발/스테이징/프로덕션 환경 분리 사용
- 로컬 머신에서 프로덕션으로 직접 배포 금지
- 프로덕션 배포에는 CI/CD 파이프라인 사용

### 4. 구성 관리
- 민감한 데이터는 환경 변수 사용
- 구성은 버전 관리에 포함
- 환경별 설정 문서화

## 학습 진행

### 초급 (1~2주차)
1. azd 설치 및 인증
2. 간단한 템플릿 배포
3. 프로젝트 구조 이해
4. 기본 명령어 학습 (up, down, deploy)

### 중급 (3~4주차)
1. 템플릿 사용자 정의
2. 다중 환경 관리
3. 인프라 코드 이해
4. CI/CD 파이프라인 설정

### 고급 (5주차 이상)
1. 맞춤 템플릿 생성
2. 고급 인프라 패턴
3. 다중 지역 배포
4. 엔터프라이즈급 구성

## 다음 단계

**📖 1장 학습 계속:**
- [설치 및 설정](installation.md) - azd 설치 및 구성
- [첫 프로젝트](first-project.md) - 실습 튜토리얼 완료
- [구성 가이드](configuration.md) - 고급 구성 옵션

**🎯 다음 장 준비 완료?**
- [2장: AI-퍼스트 개발](../chapter-02-ai-development/microsoft-foundry-integration.md) - AI 애플리케이션 개발 시작

## 추가 자료

- [Azure Developer CLI 개요](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [템플릿 갤러리](https://azure.github.io/awesome-azd/)
- [커뮤니티 샘플](https://github.com/Azure-Samples)

---

## 🙋 자주 묻는 질문

### 일반 질문

**Q: AZD와 Azure CLI 차이점은 무엇인가요?**

A: Azure CLI (`az`)는 개별 Azure 리소스 관리를 위해 사용됩니다. AZD (`azd`)는 전체 애플리케이션 관리를 위한 도구입니다:

```bash
# Azure CLI - 저수준 리소스 관리
az webapp create --name myapp --resource-group rg
az sql server create --name myserver --resource-group rg
# ...더 많은 명령어 필요

# AZD - 애플리케이션 수준 관리
azd up  # 모든 리소스와 함께 전체 애플리케이션 배포
```

**이렇게 생각하세요:**
- `az` = 개별 레고 블록 조작
- `azd` = 완성된 레고 세트 작업

---

**Q: AZD를 사용하려면 Bicep이나 Terraform을 알아야 하나요?**

A: 아닙니다! 템플릿부터 시작하세요:
```bash
# 기존 템플릿 사용 - IaC 지식 불필요
azd init --template todo-nodejs-mongo
azd up
```

나중에 인프라를 사용자 정의하려면 Bicep을 배울 수 있습니다. 템플릿은 학습용 동작 예제를 제공합니다.

---

**Q: AZD 템플릿 실행 비용은 얼마인가요?**

A: 템플릿에 따라 비용이 다릅니다. 대부분 개발 템플릿은 월 50~150달러입니다:

```bash
# 배포 전에 비용 미리보기
azd provision --preview

# 사용하지 않을 때 항상 정리하세요
azd down --force --purge  # 모든 리소스 제거
```

**프로 팁:** 무료 티어를 활용하세요:
- App Service: F1 (무료) 티어
- Microsoft Foundry 모델: Azure OpenAI 월 50,000 토큰 무료
- Cosmos DB: 1000 RU/s 무료 티어

---

**Q: 기존 Azure 리소스와 AZD를 함께 사용할 수 있나요?**

A: 네, 가능하지만 새로 시작하는 것이 더 쉽습니다. AZD는 전체 수명 주기를 관리할 때 가장 효과적입니다. 기존 리소스의 경우:

```bash
# 옵션 1: 기존 리소스 가져오기 (고급)
azd init
# 그런 다음 infra/를 수정하여 기존 리소스를 참조합니다

# 옵션 2: 새로 시작하기 (권장)
azd init --template matching-your-stack
azd up  # 새 환경 생성
```

---

**Q: 프로젝트를 팀원과 공유하려면 어떻게 하나요?**

A: AZD 프로젝트를 Git에 커밋하지만 `.azure` 폴더는 제외하세요:

```bash
# 기본적으로 이미 .gitignore에 포함됨
.azure/        # 비밀 및 환경 데이터 포함
*.env          # 환경 변수

# 팀 구성원:
git clone <your-repo>
azd auth login
azd env new <their-name>-dev
azd up
```

모든 팀원이 동일한 템플릿에서 동일한 인프라를 받습니다.

---

### 문제 해결 질문

**Q: "azd up" 실행 도중 실패했습니다. 어떻게 해야 하나요?**

A: 오류를 확인하고 수정한 후 다시 시도하세요:

```bash
# 자세한 로그 보기
azd show

# 일반적인 수정 방법:

# 1. 쿼터 초과 시:
azd env set AZURE_LOCATION "westus2"  # 다른 지역 시도

# 2. 리소스 이름 충돌 시:
azd down --force --purge  # 초기화
azd up  # 재시도

# 3. 인증 만료 시:
az login
azd auth login
azd up
```

**가장 흔한 문제:** 잘못된 Azure 구독 선택
```bash
az account list --output table
az account set --subscription "<correct-subscription>"
```

---

**Q: 재프로비저닝 없이 코드 변경만 배포하려면?**

A: `azd up` 대신 `azd deploy` 사용:

```bash
azd up          # 처음 실행: 프로비저닝 + 배포 (느림)

# 코드 변경...

azd deploy      # 이후 실행: 배포만 (빠름)
```

속도 비교:
- `azd up`: 10-15분 (인프라 프로비저닝)
- `azd deploy`: 2-5분 (코드만)

---

**Q: 인프라 템플릿을 사용자 정의할 수 있나요?**

A: 네! `infra/` 폴더 내 Bicep 파일을 편집하세요:

```bash
# azd 초기화 후
cd infra/
code main.bicep  # VS Code에서 편집

# 변경 내용 미리보기
azd provision --preview

# 변경 내용 적용
azd provision
```

**팁:** 먼저 SKU를 변경하며 시작하세요:
```bicep
// infra/main.bicep
sku: {
  name: 'B1'  // Change to 'P1V2' for production
}
```

---

**Q: AZD가 생성한 모든 리소스를 삭제하려면?**

A: 한 번의 명령어로 모든 리소스 제거 가능:

```bash
azd down --force --purge

# 이것은 삭제합니다:
# - 모든 Azure 리소스
# - 리소스 그룹
# - 로컬 환경 상태
# - 캐시된 배포 데이터
```

**다음 경우 반드시 실행하세요:**
- 템플릿 테스트 완료 시
- 다른 프로젝트로 전환 시
- 새로 시작할 때

**비용 절감:** 사용하지 않는 리소스 삭제로 비용 제로화

---

**Q: 실수로 Azure Portal에서 리소스를 삭제했어요.**

A: AZD 상태가 불일치할 수 있습니다. 초기화 방법:

```bash
# 1. 로컬 상태 제거
azd down --force --purge

# 2. 새로 시작
azd up

# 대안: AZD가 감지하고 수정하도록 허용
azd provision  # 누락된 리소스를 생성합니다
```

---

### 고급 질문

**Q: CI/CD 파이프라인에서 AZD를 사용할 수 있나요?**

A: 네! GitHub Actions 예제:

```yaml
# .github/workflows/deploy.yml
name: Deploy with AZD

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Install azd
        run: curl -fsSL https://aka.ms/install-azd.sh | bash
      
      - name: Azure Login
        run: |
          azd auth login \
            --client-id ${{ secrets.AZURE_CLIENT_ID }} \
            --client-secret ${{ secrets.AZURE_CLIENT_SECRET }} \
            --tenant-id ${{ secrets.AZURE_TENANT_ID }}
      
      - name: Deploy
        run: azd up --no-prompt
```

---

**Q: 비밀 및 민감 정보 관리는 어떻게 하나요?**

A: AZD는 자동으로 Azure Key Vault와 통합됩니다:

```bash
# 비밀은 코드가 아닌 키 볼트에 저장됩니다
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)"

# AZD가 자동으로 수행합니다:
# 1. 키 볼트를 생성합니다
# 2. 비밀을 저장합니다
# 3. 관리되는 ID를 통해 앱 액세스를 부여합니다
# 4. 런타임에 주입합니다
```

**절대 커밋하지 마세요:**
- `.azure/` 폴더 (환경 데이터 포함)
- `.env` 파일 (로컬 비밀)
- 연결 문자열

---

**Q: 다중 지역에 배포할 수 있나요?**

A: 네, 각 지역별 환경 생성:

```bash
# 미국 동부 환경
azd env new prod-eastus
azd env set AZURE_LOCATION eastus
azd up

# 유럽 서부 환경
azd env new prod-westeurope
azd env set AZURE_LOCATION westeurope
azd up

# 각 환경은 독립적입니다
azd env list
```

진정한 다중 지역 앱은 Bicep 템플릿을 수정하여 동시에 여러 지역에 배포하세요.

---

**Q: 문제 발생 시 어디에서 도움을 얻을 수 있나요?**

1. **AZD 문서:** https://learn.microsoft.com/azure/developer/azure-developer-cli/
2. **GitHub 이슈:** https://github.com/Azure/azure-dev/issues
3. **Discord:** [Azure Discord](https://discord.gg/microsoft-azure) - #azure-developer-cli 채널
4. **Stack Overflow:** `azure-developer-cli` 태그 사용
5. **이 강의:** [문제 해결 가이드](../chapter-07-troubleshooting/common-issues.md)

**프로 팁:** 질문 전에 다음 명령을 실행하세요:
```bash
azd show       # 현재 상태를 표시합니다
azd version    # 당신의 버전을 표시합니다
```
빠른 지원을 위해 이 정보를 질문에 포함하세요.

---

## 🎓 다음은?

이제 AZD 기본을 이해하셨습니다. 경로를 선택하세요:

### 🎯 초보자용:
1. **다음:** [설치 및 설정](installation.md) - AZD 설치하기
2. **그다음:** [첫 프로젝트](first-project.md) - 첫 앱 배포
3. **연습:** 이 레슨의 3가지 실습 모두 완료

### 🚀 AI 개발자용:
1. **바로가기:** [2장: AI-퍼스트 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)
2. **배포 시작:** `azd init --template get-started-with-ai-chat`
3. **학습:** 배포하며 빌드하기

### 🏗️ 숙련 개발자용:
1. **검토:** [구성 가이드](configuration.md) - 고급 설정
2. **탐색:** [인프라 코드](../chapter-04-infrastructure/provisioning.md) - Bicep 심화
3. **개발:** 스택용 맞춤 템플릿 만들기

---

**장 이동:**
- **📚 강의 홈**: [초보자용 AZD](../../README.md)
- **📖 현재 장**: 1장 - 기초 및 빠른 시작  
- **⬅️ 이전**: [강의 개요](../../README.md#-chapter-1-foundation--quick-start)
- **➡️ 다음**: [설치 및 설정](installation.md)
- **🚀 다음 장**: [2장: AI-퍼스트 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->