# 첫 번째 프로젝트 - 실습 튜토리얼

**챕터 네비게이션:**
- **📚 강좌 홈**: [AZD For Beginners](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [설치 및 설정](installation.md)
- **➡️ 다음**: [자신만의 앱 가져오기](bring-your-own-app.md)
- **🚀 다음 챕터**: [챕터 2: AI-First 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)

## 소개

첫 번째 Azure Developer CLI 프로젝트에 오신 것을 환영합니다! React 프런트엔드, Node.js API, Azure Cosmos DB를 사용한 todo 애플리케이션을 배포합니다. 템플릿은 예전 명칭 `todo-nodejs-mongo`을 유지하지만 현재 인프라는 NoSQL용 Cosmos DB를 사용하므로 다운로드한 README와 `infra/`를 확인하고 이름에서 데이터베이스 API를 추론하지 마세요.

> 2026년 11월 `azd 1.37.2`와 공개 템플릿을 기준으로 검토됨. 아래 예제는 Bash를 사용하며 JSON 추출에는 `jq`도 필요합니다. Azure 배포는 비용이 발생하며 이번 검토에서는 실행하지 않았습니다.

## 학습 목표

이 튜토리얼을 완료하면 다음을 할 수 있습니다:
- azd 템플릿을 사용한 프로젝트 초기화 워크플로우 숙달
- Azure Developer CLI 프로젝트 구조와 구성 파일 이해
- 인프라 프로비저닝과 함께 완전한 애플리케이션을 Azure에 배포
- 애플리케이션 업데이트 및 재배포 전략 구현
- 개발 및 스테이징을 위한 다중 환경 관리
- 리소스 정리 및 비용 관리 실습 적용

## 학습 성과

완료 후 다음을 할 수 있습니다:
- 템플릿에서 azd 프로젝트 독립적 초기화 및 구성
- azd 프로젝트 구조를 효과적으로 탐색 및 수정
- 단일 명령으로 Azure에 풀스택 애플리케이션 배포
- 일반적인 배포 및 인증 문제 해결
- 다양한 배포 단계를 위한 다중 Azure 환경 관리
- 애플리케이션 업데이트용 지속적 배포 워크플로우 구현

## 시작하기

### 전제 조건 체크리스트
- ✅ Azure Developer CLI 설치됨 ([설치 가이드](installation.md))
- ✅ `azd auth login`로 AZD 인증 완료
- ✅ Git이 시스템에 설치됨
- ✅ Node.js 22 LTS (또는 다운로드한 템플릿이 요구하는 지원 버전)
- ✅ Visual Studio Code (권장)

계속하기 전에 저장소 루트에서 설정 검사 프로그램을 실행하세요:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### 설치 확인
```bash
# Check azd installation
azd version

# Check AZD authentication
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

React 프런트엔드와 Node.js API 백엔드가 포함된 인기있는 todo 애플리케이션 템플릿으로 시작해 봅시다.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### 방금 무슨 일이 있었나요?
- 템플릿 코드가 로컬 디렉터리에 다운로드됨
- 서비스 정의를 담은 `azure.yaml` 파일 생성됨
- `infra/` 디렉터리에 인프라 코드 설정됨
- 환경 구성이 생성됨

## 2단계: 프로젝트 구조 살펴보기

azd가 생성한 내용을 살펴봅시다:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

다음이 보여야 합니다:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### 이해해야 할 주요 파일

**azure.yaml** - azd 프로젝트의 핵심:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - 인프라 정의:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 3단계: 프로젝트 맞춤화 (선택 사항)

배포 전에 애플리케이션을 맞춤화할 수 있습니다:

### 프런트엔드 수정
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

간단한 변경을 적용해 봅시다:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### 환경 변수 구성
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

이 두 사용자 지정 값은 로컬 저장소만 예시합니다. 기본 템플릿은 `WEBSITE_TITLE`나 `API_VERSION`를 사용하지 않아 앱을 변경하지 않습니다. 위의 명시적 소스 수정은 표시되는 제목을 변경합니다.

## 4단계: Azure에 배포

이제 흥미로운 부분 - 모든 것을 Azure에 배포합시다!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### 배포 중에 어떤 일이 일어나나요?

워크플로우는 인프라를 프로비저닝하고 코드를 패키징/배포합니다. 정확한 순서는 `workflows.up`을 `azure.yaml`에서 조정할 수 있으며, 이 템플릿은 프로비저닝 후 배포를 지정합니다. 모든 템플릿에 하나의 보편적 단계 순서에 의존하지 마십시오.

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

### 애플리케이션 접속
배포 출력에 제공된 URL을 클릭하거나 언제든지 확인:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Todo 앱 테스트
1. **할 일 추가** - "Add Todo" 클릭 후 작업 입력
2. **완료 표시** - 완료 항목 체크
3. **항목 삭제** - 더 이상 필요 없는 할 일 제거

### 애플리케이션 모니터링
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ 배포 확인

계속하기 전에 이 빠른 체크리스트로 실제 작동 여부를 확인하세요 — "배포 성공"이 곧 "앱 정상 작동"을 의미하지 않습니다:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**배포가 확인되려면:**
- ✅ `azd show`에서 접근 가능한 엔드포인트 URL 나열
- ✅ 브라우저에서 URL이 오류 없이 열림
- ✅ 핵심 기능 작동 (할 일 추가/완료/삭제)
- ✅ `azd monitor --logs`가 요청 도착을 예상치 못한 오류 없이 표시

체크에 실패하면 [챕터 7: 문제 해결](../chapter-07-troubleshooting/README.md)로 이동하세요.

## 6단계: 변경 사항 적용 및 재배포

변경 사항을 적용하고 업데이트가 얼마나 쉬운지 확인해 봅시다:

### API 수정
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

사용자 지정 응답 헤더 추가:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 코드 변경만 배포
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 7단계: 다중 환경 관리

프로덕션 전 변경 사항을 테스트할 스테이징 환경을 만드세요:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### 환경 비교
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## 8단계: 리소스 정리

실험을 마쳤으면 비용 발생을 막기 위해 정리하세요:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## 고전 앱 vs AI 기반 앱: 동일한 워크플로우

전통적인 웹 애플리케이션을 방금 배포했습니다. 그렇다면 Microsoft Foundry Models로 지원되는 채팅 애플리케이션 같은 AI 기반 앱을 배포하고 싶다면 어떨까요?

좋은 소식: **워크플로우는 동일합니다.**

| 단계 | 고전 할 일 앱 | AI 채팅 앱 |
|------|-----------------|-------------|
| 초기화 (빈 디렉터리) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| 인증 | `azd auth login` | `azd auth login` |
| 배포 | `azd up` | `azd up` |
| 모니터링 | `azd monitor` | `azd monitor` |
| 정리 | `azd down --force --purge` | `azd down --force --purge` |

라이프사이클 명령은 같으나 전제 조건은 다릅니다. AI 템플릿은 모델 접근, 지역 제한, 데이터 수집, 추가 구성 등이 필요할 수 있습니다. 배포 전 README를 읽으세요; `azd up`는 누락된 권한이나 제한을 제공할 수 없습니다.

이것이 azd의 핵심 원칙입니다: **하나의 워크플로우, 모든 워크로드.** 이 튜토리얼에서 연습한 초기화, 배포, 모니터링, 재배포, 정리 스킬은 AI 애플리케이션 및 에이전트에도 동일하게 적용됩니다.

---

## 학습한 내용

축하합니다! 다음을 성공적으로 수행했습니다:
- ✅ 템플릿에서 azd 프로젝트 초기화
- ✅ 프로젝트 구조 및 주요 파일 탐색
- ✅ Azure에 풀스택 애플리케이션 배포
- ✅ 코드 변경 적용 및 재배포
- ✅ 다중 환경 관리
- ✅ 리소스 정리

## 🎯 스킬 검증 연습

### 연습 1: 다른 템플릿 배포 (15분)
<strong>목표</strong>: azd init 및 배포 워크플로우 숙달 증명

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**성공 기준:**
- [ ] 오류 없이 애플리케이션 배포 완료
- [ ] 브라우저에서 애플리케이션 URL 접근 가능
- [ ] 애플리케이션이 정상 작동 (할 일 추가/삭제)
- [ ] 모든 리소스 정리 성공

### 연습 2: 구성 맞춤화 (20분)
<strong>목표</strong>: 런타임 구성과 착각하지 않고 로컬 환경 값 저장 연습

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**성공 기준:**
- [ ] 사용자 지정 환경 성공적으로 생성
- [ ] 환경 변수 설정 및 조회 가능
- [ ] `azd env get-value APP_TITLE`가 `My Custom Todo App` 출력
- [ ] 코드/인프라에서 소비하지 않는 한 이 값들이 기본 앱을 변경하지 않는 이유 설명 가능

### 연습 3: 다중 환경 워크플로우 (25분)
<strong>목표</strong>: 환경 관리 및 배포 전략 마스터

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**성공 기준:**
- [ ] 서로 다른 구성의 두 환경 생성
- [ ] 두 환경 모두 성공적으로 배포됨
- [ ] `azd env select`를 사용해 환경 간 전환 가능
- [ ] 환경별로 환경 변수가 다름
- [ ] 두 환경 모두 성공적으로 정리됨

## 📊 진행 상황

**투자 시간**: 약 60-90분  
**습득 스킬**:
- ✅ 템플릿 기반 프로젝트 초기화
- ✅ Azure 리소스 프로비저닝
- ✅ 애플리케이션 배포 워크플로우
- ✅ 환경 관리
- ✅ 구성 관리
- ✅ 리소스 정리 및 비용 관리

**다음 단계**: 고급 구성 패턴을 배우려면 [구성 가이드](../chapter-03-configuration/configuration.md)로 가세요!

## 일반적인 문제 해결

### 인증 오류
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### 배포 실패
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### 리소스 이름 충돌
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### 포트/네트워크 문제
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## 다음 단계

첫 번째 프로젝트를 완료했으니 다음 고급 주제들을 살펴보세요:

### 1. 인프라 맞춤화
- [인프라 코드](../chapter-04-infrastructure/provisioning.md)
- [데이터베이스 인프라 추가](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. CI/CD 설정
- [배포 가이드](../chapter-04-infrastructure/deployment-guide.md) - 완전한 CI/CD 워크플로우
- [Azure Developer CLI 문서](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - 파이프라인 구성

### 3. 운영 모범 사례
- [배포 가이드](../chapter-04-infrastructure/deployment-guide.md) - 보안, 성능, 모니터링

### 4. 더 많은 템플릿 탐색
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## 추가 자료

### 학습 자료
- [Azure Developer CLI 문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure 아키텍처 센터](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### 커뮤니티 및 지원
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer 커뮤니티](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 템플릿 및 예제
- [공식 템플릿 갤러리](https://azure.github.io/awesome-azd/)
- [커뮤니티 템플릿 기여](https://github.com/Azure/awesome-azd)
- [Todo 템플릿 소스](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**첫 번째 azd 프로젝트 완료를 축하합니다!** 이제 자신 있게 Azure에서 훌륭한 애플리케이션을 빌드하고 배포할 준비가 되었습니다.

---

**챕터 네비게이션:**
- **📚 강좌 홈**: [AZD For Beginners](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [설치 및 설정](installation.md)
- **➡️ 다음**: [자신만의 앱 가져오기](bring-your-own-app.md)
- **🚀 다음 챕터**: [챕터 2: AI-First 개발](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->