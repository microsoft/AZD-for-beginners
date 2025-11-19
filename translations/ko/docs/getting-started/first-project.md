<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-19T19:24:50+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "ko"
}
-->
# 첫 번째 프로젝트 - 실습 튜토리얼

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [설치 및 설정](installation.md)
- **➡️ 다음**: [구성](configuration.md)
- **🚀 다음 챕터**: [챕터 2: AI-우선 개발](../microsoft-foundry/microsoft-foundry-integration.md)

## 소개

첫 번째 Azure Developer CLI 프로젝트에 오신 것을 환영합니다! 이 포괄적인 실습 튜토리얼은 azd를 사용하여 Azure에서 풀스택 애플리케이션을 생성, 배포 및 관리하는 전체 과정을 안내합니다. React 프론트엔드, Node.js API 백엔드, MongoDB 데이터베이스를 포함한 실제 할 일 애플리케이션을 작업하게 됩니다.

## 학습 목표

이 튜토리얼을 완료하면 다음을 배울 수 있습니다:
- 템플릿을 사용한 azd 프로젝트 초기화 워크플로우 숙달
- Azure Developer CLI 프로젝트 구조 및 구성 파일 이해
- 인프라 프로비저닝과 함께 Azure에 애플리케이션을 완전 배포
- 애플리케이션 업데이트 및 재배포 전략 구현
- 개발 및 스테이징을 위한 여러 환경 관리
- 리소스 정리 및 비용 관리 실천

## 학습 결과

완료 후, 다음을 수행할 수 있습니다:
- 템플릿에서 azd 프로젝트를 독립적으로 초기화 및 구성
- azd 프로젝트 구조를 효과적으로 탐색 및 수정
- 단일 명령으로 Azure에 풀스택 애플리케이션 배포
- 일반적인 배포 문제 및 인증 문제 해결
- 다양한 배포 단계를 위한 여러 Azure 환경 관리
- 애플리케이션 업데이트를 위한 지속적 배포 워크플로우 구현

## 시작하기

### 사전 준비 체크리스트
- ✅ Azure Developer CLI 설치 ([설치 가이드](installation.md))
- ✅ Azure CLI 설치 및 인증 완료
- ✅ 시스템에 Git 설치
- ✅ Node.js 16+ (이 튜토리얼용)
- ✅ Visual Studio Code (권장)

### 설정 확인
```bash
# azd 설치 확인
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

React 프론트엔드와 Node.js API 백엔드를 포함한 인기 있는 할 일 애플리케이션 템플릿으로 시작해 봅시다.

```bash
# 사용 가능한 템플릿을 탐색하세요
azd template list

# 할 일 앱 템플릿 초기화
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# 프롬프트를 따르세요:
# - 환경 이름 입력: "dev"
# - 구독 선택 (여러 개가 있는 경우)
# - 지역 선택: "East US 2" (또는 선호하는 지역)
```

### 방금 무슨 일이 일어났나요?
- 템플릿 코드를 로컬 디렉토리에 다운로드했습니다
- 서비스 정의가 포함된 `azure.yaml` 파일을 생성했습니다
- `infra/` 디렉토리에 인프라 코드를 설정했습니다
- 환경 구성을 생성했습니다

## 2단계: 프로젝트 구조 탐색

azd가 생성한 내용을 살펴봅시다:

```bash
# 프로젝트 구조 보기
tree /f   # 윈도우
# 또는
find . -type f | head -20   # macOS/리눅스
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
# 프로젝트 구성을 확인하세요
cat azure.yaml
```

**infra/main.bicep** - 인프라 정의:
```bash
# 인프라 코드를 확인하세요
head -30 infra/main.bicep
```

## 3단계: 프로젝트 맞춤화 (선택 사항)

배포 전에 애플리케이션을 맞춤화할 수 있습니다:

### 프론트엔드 수정
```bash
# React 앱 컴포넌트를 엽니다
code src/web/src/App.tsx
```

간단한 변경 사항 적용:
```typescript
// 제목을 찾아 변경하세요
<h1>My Awesome Todo App</h1>
```

### 환경 변수 구성
```bash
# 사용자 지정 환경 변수를 설정합니다
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# 모든 환경 변수를 확인합니다
azd env get-values
```

## 4단계: Azure에 배포

이제 흥미로운 부분입니다 - 모든 것을 Azure에 배포하세요!

```bash
# 인프라 및 애플리케이션 배포
azd up

# 이 명령은 다음을 수행합니다:
# 1. Azure 리소스 프로비저닝 (App Service, Cosmos DB 등)
# 2. 애플리케이션 빌드
# 3. 프로비저닝된 리소스에 배포
# 4. 애플리케이션 URL 표시
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
배포 출력에 제공된 URL을 클릭하거나 언제든지 가져올 수 있습니다:
```bash
# 애플리케이션 엔드포인트 가져오기
azd show

# 브라우저에서 애플리케이션 열기
azd show --output json | jq -r '.services.web.endpoint'
```

### 할 일 앱 테스트
1. **할 일 항목 추가** - "Add Todo"를 클릭하고 작업 입력
2. **완료로 표시** - 완료된 항목 체크
3. **항목 삭제** - 더 이상 필요하지 않은 할 일 삭제

### 애플리케이션 모니터링
```bash
# Azure 포털에서 리소스를 엽니다
azd monitor

# 애플리케이션 로그 보기
azd logs
```

## 6단계: 변경 사항 적용 및 재배포

변경 사항을 적용하고 업데이트가 얼마나 쉬운지 확인해 봅시다:

### API 수정
```bash
# API 코드를 수정하세요
code src/api/src/routes/lists.js
```

사용자 정의 응답 헤더 추가:
```javascript
// 경로 핸들러를 찾아 추가:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### 코드 변경 사항만 배포
```bash
# 애플리케이션 코드만 배포 (인프라 제외)
azd deploy

# 인프라가 이미 존재하므로 'azd up'보다 훨씬 빠릅니다.
```

## 7단계: 여러 환경 관리

프로덕션 전에 변경 사항을 테스트하기 위해 스테이징 환경을 생성하세요:

```bash
# 새로운 스테이징 환경 생성
azd env new staging

# 스테이징에 배포
azd up

# 개발 환경으로 전환
azd env select dev

# 모든 환경 나열
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

실험이 끝나면 지속적인 비용을 피하기 위해 정리하세요:

```bash
# 현재 환경의 모든 Azure 리소스를 삭제합니다
azd down

# 확인 없이 강제 삭제하고 소프트 삭제된 리소스를 정리합니다
azd down --force --purge

# 특정 환경을 삭제합니다
azd env select staging
azd down --force --purge
```

## 배운 내용

축하합니다! 성공적으로:
- ✅ 템플릿에서 azd 프로젝트 초기화
- ✅ 프로젝트 구조 및 주요 파일 탐색
- ✅ Azure에 풀스택 애플리케이션 배포
- ✅ 코드 변경 및 재배포
- ✅ 여러 환경 관리
- ✅ 리소스 정리

## 🎯 기술 검증 연습

### 연습 1: 다른 템플릿 배포 (15분)
**목표**: azd 초기화 및 배포 워크플로우 숙달

```bash
# Python + MongoDB 스택을 시도하세요
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
- [ ] 브라우저에서 애플리케이션 URL에 액세스 가능
- [ ] 애플리케이션이 정상적으로 작동 (할 일 추가/삭제)
- [ ] 모든 리소스를 성공적으로 정리

### 연습 2: 구성 맞춤화 (20분)
**목표**: 환경 변수 구성 연습

```bash
cd my-first-azd-app

# 사용자 지정 환경 생성
azd env new custom-config

# 사용자 지정 변수 설정
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# 변수 확인
azd env get-values | grep APP_TITLE

# 사용자 지정 구성으로 배포
azd up
```

**성공 기준:**
- [ ] 사용자 정의 환경이 성공적으로 생성됨
- [ ] 환경 변수가 설정되고 검색 가능
- [ ] 사용자 정의 구성으로 애플리케이션 배포
- [ ] 배포된 앱에서 사용자 정의 설정 확인 가능

### 연습 3: 다중 환경 워크플로우 (25분)
**목표**: 환경 관리 및 배포 전략 숙달

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

# 둘 다 정리
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**성공 기준:**
- [ ] 서로 다른 구성을 가진 두 환경 생성
- [ ] 두 환경이 성공적으로 배포됨
- [ ] `azd env select`를 사용하여 환경 간 전환 가능
- [ ] 환경 변수는 환경 간에 다름
- [ ] 두 환경을 성공적으로 정리

## 📊 진행 상황

**투자 시간**: 약 60-90분  
**습득한 기술**:
- ✅ 템플릿 기반 프로젝트 초기화
- ✅ Azure 리소스 프로비저닝
- ✅ 애플리케이션 배포 워크플로우
- ✅ 환경 관리
- ✅ 구성 관리
- ✅ 리소스 정리 및 비용 관리

**다음 단계**: [구성 가이드](configuration.md)를 통해 고급 구성 패턴을 배우세요!

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

# 자세한 로그 보기
azd logs --service api
azd logs --service web
```

### 리소스 이름 충돌
```bash
# 고유한 환경 이름을 사용하세요
azd env new dev-$(whoami)-$(date +%s)
```

### 포트/네트워크 문제
```bash
# 포트가 사용 가능한지 확인하세요
netstat -an | grep :3000
netstat -an | grep :3100
```

## 다음 단계

첫 번째 프로젝트를 완료한 후, 다음 고급 주제를 탐색하세요:

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
# 카테고리별 템플릿 탐색
azd template list --filter web
azd template list --filter api
azd template list --filter database

# 다양한 기술 스택 시도
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

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 1 - 기초 및 빠른 시작
- **⬅️ 이전**: [설치 및 설정](installation.md)
- **➡️ 다음**: [구성](configuration.md)
- **🚀 다음 챕터**: [챕터 2: AI-우선 개발](../microsoft-foundry/microsoft-foundry-integration.md)
- **다음 레슨**: [배포 가이드](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->