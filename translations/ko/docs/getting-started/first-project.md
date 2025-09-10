<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T12:59:21+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ko"
}
-->
# 첫 번째 프로젝트 - 실습 튜토리얼

## 소개

Azure Developer CLI 프로젝트에 오신 것을 환영합니다! 이 포괄적인 실습 튜토리얼은 azd를 사용하여 Azure에서 풀스택 애플리케이션을 생성, 배포 및 관리하는 과정을 안내합니다. React 프론트엔드, Node.js API 백엔드, MongoDB 데이터베이스를 포함한 실제 할 일 관리 애플리케이션을 다룰 것입니다.

## 학습 목표

이 튜토리얼을 완료하면 다음을 할 수 있습니다:
- 템플릿을 사용한 azd 프로젝트 초기화 워크플로우 숙달
- Azure Developer CLI 프로젝트 구조 및 구성 파일 이해
- 인프라 프로비저닝과 함께 애플리케이션을 Azure에 완전 배포
- 애플리케이션 업데이트 및 재배포 전략 구현
- 개발 및 스테이징을 위한 여러 환경 관리
- 리소스 정리 및 비용 관리 실천

## 학습 결과

튜토리얼 완료 후, 다음을 수행할 수 있습니다:
- 템플릿에서 azd 프로젝트를 독립적으로 초기화 및 구성
- azd 프로젝트 구조를 효과적으로 탐색 및 수정
- 단일 명령으로 풀스택 애플리케이션을 Azure에 배포
- 일반적인 배포 문제 및 인증 문제 해결
- 다양한 배포 단계에 대한 여러 Azure 환경 관리
- 애플리케이션 업데이트를 위한 지속적 배포 워크플로우 구현

## 시작하기

### 사전 준비 체크리스트
- ✅ Azure Developer CLI 설치 ([설치 가이드](installation.md))
- ✅ Azure CLI 설치 및 인증 완료
- ✅ Git 시스템에 설치
- ✅ Node.js 16+ (이 튜토리얼에 필요)
- ✅ Visual Studio Code (권장)

### 설정 확인
```bash
# Check azd installation
azd version
```
### Azure 인증 확인

```bash
az account show
```

### Node.js 버전 확인
```bash
node --version
```

## 1단계: 템플릿 선택 및 초기화

React 프론트엔드와 Node.js API 백엔드를 포함한 인기 있는 할 일 관리 애플리케이션 템플릿으로 시작해봅시다.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### 방금 무슨 일이 일어났나요?
- 템플릿 코드를 로컬 디렉토리에 다운로드했습니다.
- 서비스 정의가 포함된 `azure.yaml` 파일을 생성했습니다.
- `infra/` 디렉토리에 인프라 코드 설정
- 환경 구성 생성

## 2단계: 프로젝트 구조 탐색

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

### 프론트엔드 수정
```bash
# Open the React app component
code src/web/src/App.tsx
```

간단한 변경 사항 적용:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### 환경 변수 구성
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## 4단계: Azure에 배포

이제 흥미로운 부분입니다 - 모든 것을 Azure에 배포해봅시다!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### 배포 중에 무슨 일이 일어나나요?

`azd up` 명령은 다음 단계를 수행합니다:
1. **프로비저닝** (`azd provision`) - Azure 리소스 생성
2. **패키징** - 애플리케이션 코드 빌드
3. **배포** (`azd deploy`) - Azure 리소스에 코드 배포

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

### 애플리케이션 액세스
배포 출력에 제공된 URL을 클릭하거나 언제든지 확인:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### 할 일 관리 앱 테스트
1. **할 일 항목 추가** - "Add Todo"를 클릭하고 작업 입력
2. **완료로 표시** - 완료된 항목 체크
3. **항목 삭제** - 더 이상 필요 없는 할 일 삭제

### 애플리케이션 모니터링
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## 6단계: 변경 사항 적용 및 재배포

변경 사항을 적용하고 업데이트가 얼마나 쉬운지 확인해봅시다:

### API 수정
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

사용자 정의 응답 헤더 추가:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 코드 변경 사항만 배포
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 7단계: 여러 환경 관리

프로덕션 전에 변경 사항을 테스트할 스테이징 환경을 생성:

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

실험이 끝나면 지속적인 비용을 방지하기 위해 정리:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## 배운 내용

축하합니다! 성공적으로:
- 템플릿에서 azd 프로젝트 초기화
- 프로젝트 구조 및 주요 파일 탐색
- 풀스택 애플리케이션을 Azure에 배포
- 코드 변경 및 재배포
- 여러 환경 관리
- 리소스 정리 완료

## 일반적인 문제 해결

### 인증 오류
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### 배포 실패
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
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

첫 번째 프로젝트를 완료한 후, 다음 고급 주제를 탐색해보세요:

### 1. 인프라 맞춤화
- [코드로서의 인프라](../deployment/provisioning.md)
- [데이터베이스, 스토리지 및 기타 서비스 추가](../deployment/provisioning.md#adding-services)

### 2. CI/CD 설정
- [GitHub Actions 통합](../deployment/cicd-integration.md)
- [Azure DevOps 파이프라인](../deployment/cicd-integration.md#azure-devops)

### 3. 프로덕션 모범 사례
- [보안 구성](../deployment/best-practices.md#security)
- [성능 최적화](../deployment/best-practices.md#performance)
- [모니터링 및 로깅](../deployment/best-practices.md#monitoring)

### 4. 더 많은 템플릿 탐색
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
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
- [Azure Developer 커뮤니티](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### 템플릿 및 예제
- [공식 템플릿 갤러리](https://azure.github.io/awesome-azd/)
- [커뮤니티 템플릿](https://github.com/Azure-Samples/azd-templates)
- [엔터프라이즈 패턴](https://github.com/Azure/azure-dev/tree/main/templates)

---

**첫 번째 azd 프로젝트를 완료한 것을 축하합니다!** 이제 Azure에서 놀라운 애플리케이션을 자신 있게 구축하고 배포할 준비가 되었습니다.

---

**탐색**
- **이전 레슨**: [구성](configuration.md)
- **다음 레슨**: [배포 가이드](../deployment/deployment-guide.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.