# 첫 번째 프로젝트 - 실습 튜토리얼

**장 탐색:**
- **📚 코스 홈**: [AZD For Beginners](../../README.md)
- **📖 현재 장**: Chapter 1 - Foundation & Quick Start
- **⬅️ 이전**: [Installation & Setup](installation.md)
- **➡️ 다음**: [Configuration](configuration.md)
- **🚀 다음 챕터**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 소개

첫 번째 Azure Developer CLI 프로젝트에 오신 것을 환영합니다! 이 포괄적인 실습 튜토리얼은 azd를 사용하여 Azure에 풀스택 애플리케이션을 생성, 배포 및 관리하는 전체 과정을 안내합니다. React 프런트엔드, Node.js API 백엔드 및 MongoDB 데이터베이스를 포함하는 실제 todo 애플리케이션으로 실습합니다.

## 학습 목표

이 튜토리얼을 완료하면 다음을 수행할 수 있습니다:
- 템플릿을 사용한 azd 프로젝트 초기화 워크플로 숙달
- Azure Developer CLI 프로젝트 구조 및 구성 파일 이해
- 인프라 프로비저닝과 함께 애플리케이션을 Azure에 완전 배포 실행
- 애플리케이션 업데이트 및 재배포 전략 구현
- 개발 및 스테이징을 위한 다중 환경 관리
- 리소스 정리 및 비용 관리 실습 적용

## 학습 성과

완료 후 다음을 할 수 있습니다:
- 템플릿에서 azd 프로젝트를 독립적으로 초기화하고 구성
- azd 프로젝트 구조를 효과적으로 탐색 및 수정
- 단일 명령으로 Azure에 풀스택 애플리케이션 배포
- 일반적인 배포 문제 및 인증 문제 해결
- 다양한 배포 단계를 위한 다중 Azure 환경 관리
- 애플리케이션 업데이트를 위한 지속적 배포 워크플로 구현

## 시작하기

### 필수 조건 확인 목록
- ✅ Azure Developer CLI가 설치되어 있어야 함 ([설치 안내](installation.md))
- ✅ `azd auth login`으로 AZD 인증 완료
- ✅ 시스템에 Git이 설치되어 있음
- ✅ Node.js 16+ (이 튜토리얼용)
- ✅ Visual Studio Code (권장)

계속하기 전에 저장소 루트에서 설정 검증기를 실행하세요:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### 설정 확인
```bash
# azd 설치 확인
azd version

# AZD 인증 확인
azd auth login --check-status
```

### 선택적 Azure CLI 인증 확인

```bash
az account show
```

### Node.js 버전 확인
```bash
node --version
```

## 1단계: 템플릿 선택 및 초기화

React 프런트엔드와 Node.js API 백엔드를 포함하는 인기 있는 todo 애플리케이션 템플릿으로 시작해 보겠습니다.

```bash
# 사용할 수 있는 템플릿 보기
azd template list

# todo 앱 템플릿 초기화
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 안내에 따르세요:
# - 환경 이름 입력: "dev"
# - 구독 선택(여러 개가 있는 경우)
# - 지역 선택: "East US 2" (또는 선호하는 지역)
```

### 방금 무슨 일이 있었나요?
- 템플릿 코드를 로컬 디렉터리에 다운로드했습니다
- 서비스 정의가 포함된 `azure.yaml` 파일 생성됨
- `infra/` 디렉터리에 인프라 코드 설정됨
- 환경 구성이 생성됨

## 2단계: 프로젝트 구조 탐색

azd가 우리를 위해 생성한 내용을 살펴보겠습니다:

```bash
# 프로젝트 구조 보기
tree /f   # 윈도우
# 또는
find . -type f | head -20   # macOS/리눅스
```

다음 항목이 표시됩니다:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### 알아야 할 주요 파일

**azure.yaml** - azd 프로젝트의 핵심:
```bash
# 프로젝트 구성 보기
cat azure.yaml
```

**infra/main.bicep** - 인프라 정의:
```bash
# 인프라 코드 보기
head -30 infra/main.bicep
```

## 3단계: 프로젝트 사용자화 (선택 사항)

배포하기 전에 애플리케이션을 사용자화할 수 있습니다:

### 프런트엔드 수정
```bash
# React 앱 컴포넌트를 엽니다
code src/web/src/App.tsx
```

간단한 변경을 해보세요:
```typescript
// 제목을 찾아 변경하세요
<h1>My Awesome Todo App</h1>
```

### 환경 변수 구성
```bash
# 사용자 지정 환경 변수 설정
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# 모든 환경 변수 보기
azd env get-values
```

## 4단계: Azure에 배포

이제 흥미로운 부분입니다 - 모든 것을 Azure에 배포하세요!

```bash
# 인프라 및 애플리케이션 배포
azd up

# 이 명령은 다음을 수행합니다:
# 1. Azure 리소스(App Service, Cosmos DB 등)를 프로비저닝합니다
# 2. 애플리케이션을 빌드합니다
# 3. 프로비저닝된 리소스에 배포합니다
# 4. 애플리케이션 URL을 표시합니다
```

### 배포 중에 무슨 일이 일어나고 있나요?

`azd up` 명령은 다음 단계를 수행합니다:
1. **Provision** (`azd provision`) - Azure 리소스 생성
2. **Package** - 애플리케이션 코드를 빌드함
3. **Deploy** (`azd deploy`) - 코드를 Azure 리소스에 배포함

### 예상 출력
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5단계: 애플리케이션 테스트

### 애플리케이션에 접근
배포 출력에 제공된 URL을 클릭하거나 언제든지 가져오세요:
```bash
# 애플리케이션 엔드포인트 가져오기
azd show

# 브라우저에서 애플리케이션 열기
azd show --output json | jq -r '.services.web.endpoint'
```

### 투두 앱 테스트
1. **할 일 항목 추가** - "Add Todo"를 클릭하고 작업을 입력하세요
2. **완료로 표시** - 완료된 항목을 체크하세요
3. **항목 삭제** - 더 이상 필요 없는 투두 항목을 제거하세요

### 애플리케이션 모니터링
```bash
# 리소스에 대한 Azure 포털 열기
azd monitor

# 애플리케이션 로그 보기
azd monitor --logs

# 실시간 메트릭 보기
azd monitor --live
```

## 6단계: 변경하고 재배포하기

변경을 하고 업데이트가 얼마나 쉬운지 확인해보겠습니다:

### API 수정
```bash
# API 코드를 편집하세요
code src/api/src/routes/lists.js
```

커스텀 응답 헤더 추가:
```javascript
// 라우트 핸들러를 찾아 다음을 추가하세요:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 코드 변경만 배포하기
```bash
# 애플리케이션 코드만 배포합니다 (인프라 구성은 건너뜁니다)
azd deploy

# 인프라가 이미 존재하므로 'azd up'보다 훨씬 빠릅니다
```

## 7단계: 여러 환경 관리

프로덕션 이전에 변경사항을 테스트하기 위해 스테이징 환경을 생성하세요:

```bash
# 새 스테이징 환경을 생성
azd env new staging

# 스테이징에 배포
azd up

# 개발 환경으로 다시 전환
azd env select dev

# 모든 환경을 나열
azd env list
```

### 환경 비교
```bash
# 개발 환경 보기
azd env select dev
azd show

# 스테이징 환경 보기
azd env select staging
azd show
```

## 8단계: 리소스 정리

실험을 마쳤으면 지속적인 비용 발생을 피하기 위해 정리하세요:

```bash
# 현재 환경의 모든 Azure 리소스를 삭제
azd down

# 확인 없이 강제로 삭제하고 소프트 삭제된 리소스를 영구 삭제
azd down --force --purge

# 특정 환경을 삭제
azd env select staging
azd down --force --purge
```

## 기존 앱 vs. AI 기반 앱: 동일한 워크플로

지금 막 전통적인 웹 애플리케이션을 배포했습니다. 그렇다면 Microsoft Foundry Models로 백엔드가 구성된 챗 애플리케이션과 같은 AI 기반 앱을 배포하려면 어떻게 될까요?

좋은 소식: **워크플로는 동일합니다.**

| 단계 | 기존 Todo 앱 | AI 챗 앱 |
|------|--------------|----------|
| 초기화 | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| 인증 | `azd auth login` | `azd auth login` |
| 배포 | `azd up` | `azd up` |
| 모니터링 | `azd monitor` | `azd monitor` |
| 정리 | `azd down --force --purge` | `azd down --force --purge` |

유일한 차이는 시작하는 <strong>템플릿</strong>입니다. AI 템플릿은 Microsoft Foundry Models 리소스나 AI Search 인덱스와 같은 추가 인프라를 포함하지만, azd가 이 모든 것을 처리해 줍니다. 새로운 명령을 배우거나 다른 도구를 채택하거나 배포 방식에 대해 생각을 바꿀 필요가 없습니다.

이것이 azd의 핵심 원칙입니다: **하나의 워크플로, 모든 워크로드.** 이 튜토리얼에서 연습한 초기화, 배포, 모니터링, 재배포 및 정리 기술은 AI 애플리케이션 및 에이전트에도 동일하게 적용됩니다.

---

## 배운 내용

축하합니다! 다음을 성공적으로 수행했습니다:
- ✅ 템플릿에서 azd 프로젝트 초기화
- ✅ 프로젝트 구조와 주요 파일 탐색
- ✅ 풀스택 애플리케이션을 Azure에 배포
- ✅ 코드 변경을 수행하고 재배포
- ✅ 다중 환경 관리
- ✅ 리소스 정리

## 🎯 실력 검증 연습

### 연습 1: 다른 템플릿 배포 (15분)
<strong>목표</strong>: azd init 및 배포 워크플로 숙련도 증명

```bash
# Python + MongoDB 스택을 시도해 보세요
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# 배포 확인
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# 정리
azd down --force --purge
```

**성공 기준:**
- [ ] 애플리케이션이 오류 없이 배포됨
- [ ] 브라우저에서 애플리케이션 URL에 접근 가능
- [ ] 애플리케이션이 올바르게 작동함 (할 일 추가/삭제)
- [ ] 모든 리소스를 성공적으로 정리함

### 연습 2: 구성 사용자화 (20분)
<strong>목표</strong>: 환경 변수 구성 연습

```bash
cd my-first-azd-app

# 사용자 정의 환경 생성
azd env new custom-config

# 사용자 정의 변수 설정
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# 변수 확인
azd env get-values | grep APP_TITLE

# 사용자 정의 구성으로 배포
azd up
```

**성공 기준:**
- [ ] 사용자화된 환경이 성공적으로 생성됨
- [ ] 환경 변수가 설정되고 조회 가능함
- [ ] 사용자화된 구성으로 애플리케이션이 배포됨
- [ ] 배포된 앱에서 사용자화 설정을 확인할 수 있음

### 연습 3: 다중 환경 워크플로 (25분)
<strong>목표</strong>: 환경 관리 및 배포 전략 숙달

```bash
# 개발 환경 생성
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# 개발 URL 기록
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# 스테이징 환경 생성
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# 스테이징 URL 기록
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# 환경 비교
azd env list

# 두 환경 모두 테스트
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# 두 환경 모두 정리
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**성공 기준:**
- [ ] 서로 다른 구성으로 두 개의 환경이 생성됨
- [ ] 두 환경 모두 성공적으로 배포됨
- [ ] `azd env select`를 사용하여 환경 간 전환 가능
- [ ] 환경 간에 환경 변수가 다름
- [ ] 두 환경을 성공적으로 정리함

## 📊 진행 상황

**투자 시간**: ~60-90분  
**습득한 기술**:
- ✅ 템플릿 기반 프로젝트 초기화
- ✅ Azure 리소스 프로비저닝
- ✅ 애플리케이션 배포 워크플로
- ✅ 환경 관리
- ✅ 구성 관리
- ✅ 리소스 정리 및 비용 관리

**다음 단계**: 고급 구성 패턴을 학습하려면 [구성 가이드](configuration.md)를 확인하세요!

## 일반적인 문제 해결

### 인증 오류
```bash
# Azure에 다시 인증
az login

# 구독 액세스 확인
az account show
```

### 배포 실패
```bash
# 디버그 로깅 활성화
export AZD_DEBUG=true
azd up --debug

# Azure에서 애플리케이션 로그 보기
azd monitor --logs

# Container Apps의 경우 Azure CLI를 사용:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 리소스 이름 충돌
```bash
# 고유한 환경 이름을 사용하세요
azd env new dev-$(whoami)-$(date +%s)
```

### 포트/네트워크 문제
```bash
# 포트가 사용 가능한지 확인
netstat -an | grep :3000
netstat -an | grep :3100
```

## 다음 단계

첫 번째 프로젝트를 완료했으니 다음 고급 주제를 살펴보세요:

### 1. 인프라 사용자화
- [인프라 코드(Infrastructure as Code)](../chapter-04-infrastructure/provisioning.md)
- [데이터베이스, 스토리지 및 기타 서비스 추가](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. CI/CD 설정
- [배포 가이드](../chapter-04-infrastructure/deployment-guide.md) - 완전한 CI/CD 워크플로
- [Azure Developer CLI 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 파이프라인 구성

### 3. 운영 모범 사례
- [배포 가이드](../chapter-04-infrastructure/deployment-guide.md) - 보안, 성능 및 모니터링

### 4. 더 많은 템플릿 탐색
```bash
# 카테고리별로 템플릿을 찾아보세요
azd template list --filter web
azd template list --filter api
azd template list --filter database

# 다양한 기술 스택을 시도해 보세요
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## 추가 자료

### 학습 자료
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### 커뮤니티 및 지원
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 템플릿 및 예제
- [공식 템플릿 갤러리](https://azure.github.io/awesome-azd/)
- [커뮤니티 템플릿](https://github.com/Azure-Samples/azd-templates)
- [엔터프라이즈 패턴](https://github.com/Azure/azure-dev/tree/main/templates)

---

**첫 azd 프로젝트를 완료한 것을 축하합니다!** 이제 자신 있게 Azure에서 멋진 애플리케이션을 빌드하고 배포할 준비가 되었습니다.

---

**장 탐색:**
- **📚 코스 홈**: [AZD For Beginners](../../README.md)
- **📖 현재 장**: Chapter 1 - Foundation & Quick Start
- **⬅️ 이전**: [Installation & Setup](installation.md)
- **➡️ 다음**: [Configuration](configuration.md)
- **🚀 다음 챕터**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **다음 레슨**: [배포 가이드](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 고지**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있음을 유의하시기 바랍니다. 원래 언어로 된 원문을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 이 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->