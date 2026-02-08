# 명령어 치트 시트 - 필수 AZD 명령어

**모든 챕터에 대한 빠른 참조**
- **📚 강의 홈**: [초보자를 위한 AZD](../README.md)
- **📖 빠른 시작**: [1장: 기초 및 빠른 시작](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 명령어**: [2장: AI-우선 개발](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 고급**: [4장: 코드로서의 인프라](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 소개

이 종합 치트 시트는 가장 일반적으로 사용되는 Azure Developer CLI 명령어를 범주별로 정리하고 실용적인 예제를 포함하여 빠르게 참고할 수 있게 제공합니다. azd 프로젝트 개발, 문제 해결 및 일상 작업 중 빠른 검색에 적합합니다.

## 학습 목표

이 치트 시트를 사용하면:
- 필수 Azure Developer CLI 명령어와 구문에 즉시 액세스할 수 있습니다
- 명령어가 기능 범주 및 사용 사례별로 체계적으로 구성된 것을 이해할 수 있습니다
- 일반적인 개발 및 배포 시나리오에 대한 실용적인 예제를 참고할 수 있습니다
- 빠른 문제 해결을 위한 진단 명령어에 접근할 수 있습니다
- 고급 구성 및 맞춤 설정 옵션을 효율적으로 찾을 수 있습니다
- 환경 관리 및 다중 환경 워크플로우 명령어를 찾을 수 있습니다

## 학습 성과

이 치트 시트를 정기적으로 참고하면:
- 전체 문서를 참조하지 않고도 자신 있게 azd 명령어를 실행할 수 있습니다
- 적절한 진단 명령어를 사용하여 일반적인 문제를 신속하게 해결할 수 있습니다
- 여러 환경과 배포 시나리오를 효율적으로 관리할 수 있습니다
- 필요에 따라 고급 azd 기능과 구성 옵션을 적용할 수 있습니다
- 체계적인 명령어 시퀀스를 사용하여 배포 문제를 해결할 수 있습니다
- azd 단축키 및 옵션의 효과적인 사용을 통해 워크플로우를 최적화할 수 있습니다

## 시작 명령어

### 인증
```bash
# AZD를 통해 Azure에 로그인
azd auth login

# Azure CLI에 로그인 (AZD가 내부적으로 사용)
az login

# 현재 계정 확인
az account show

# 기본 구독 설정
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# AZD에서 로그아웃
azd auth logout

# Azure CLI에서 로그아웃
az logout
```

### 프로젝트 초기화
```bash
# 사용 가능한 템플릿을 탐색하세요
azd template list

# 템플릿에서 초기화하기
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# 현재 디렉토리에서 초기화하기
azd init .

# 사용자 지정 이름으로 초기화하기
azd init --template todo-nodejs-mongo my-awesome-app
```

## 핵심 배포 명령어

### 전체 배포 워크플로우
```bash
# 모든 것을 배포합니다 (프로비저닝 + 배포)
azd up

# 확인 요청 없이 배포합니다
azd up --confirm-with-no-prompt

# 특정 환경에 배포합니다
azd up --environment production

# 사용자 정의 매개변수로 배포합니다
azd up --parameter location=westus2
```

### 인프라만
```bash
# Azure 리소스 프로비저닝
azd provision

# 🧪 인프라 변경사항 미리보기
azd provision --preview
# 생성/수정/삭제될 리소스의 드라이런(dry-run) 뷰를 보여줌
# 'terraform plan' 또는 'bicep what-if'와 유사 - 안전하게 실행 가능, 변경사항 적용 없음
```

### 애플리케이션만
```bash
# 애플리케이션 코드 배포
azd deploy

# 특정 서비스 배포
azd deploy --service web
azd deploy --service api

# 모든 서비스 배포
azd deploy --all
```

### 빌드 및 패키징
```bash
# 애플리케이션 빌드
azd package

# 특정 서비스 빌드
azd package --service api
```

## 🌍 환경 관리

### 환경 작업
```bash
# 모든 환경 나열
azd env list

# 새 환경 만들기
azd env new development
azd env new staging --location westus2

# 환경 선택
azd env select production

# 현재 환경 표시
azd env show

# 환경 상태 새로 고침
azd env refresh
```

### 환경 변수
```bash
# 환경 변수 설정
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# 환경 변수 가져오기
azd env get API_KEY

# 모든 환경 변수 나열
azd env get-values

# 환경 변수 제거
azd env unset DEBUG
```

## ⚙️ 구성 명령어

### 전역 구성
```bash
# 모든 구성을 나열합니다
azd config list

# 전역 기본값 설정
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# 구성 제거
azd config unset defaults.location

# 모든 구성 재설정
azd config reset
```

### 프로젝트 구성
```bash
# azure.yaml을 검증합니다
azd config validate

# 프로젝트 정보를 표시합니다
azd show

# 서비스 엔드포인트를 가져옵니다
azd show --output json
```

## 📊 모니터링 및 진단

### 모니터링 대시보드
```bash
# Azure 포털 모니터링 대시보드 열기
azd monitor

# Application Insights 실시간 메트릭 열기
azd monitor --live

# Application Insights 로그 블레이드 열기
azd monitor --logs

# Application Insights 개요 열기
azd monitor --overview
```

### 컨테이너 로그 보기
```bash
# Azure CLI를 통해 로그 보기 (컨테이너 앱용)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# 로그를 실시간으로 팔로우하기
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Azure 포털에서 로그 보기
azd monitor --logs
```

### 로그 분석 쿼리
```bash
# Azure 포털을 통해 로그 분석에 액세스
azd monitor --logs

# Azure CLI를 사용하여 로그 쿼리하기
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ 유지보수 명령어

### 정리
```bash
# 모든 Azure 리소스 제거
azd down

# 확인 없이 강제 삭제
azd down --force

# 소프트 삭제된 리소스 영구 삭제
azd down --purge

# 완전 정리 완료
azd down --force --purge
```

### 업데이트
```bash
# azd 업데이트 확인
azd version

# 현재 버전 가져오기
azd version

# 현재 구성 보기
azd config list
```

## 🔧 고급 명령어

### 파이프라인 및 CI/CD
```bash
# GitHub 액션 구성
azd pipeline config

# Azure DevOps 구성
azd pipeline config --provider azdo

# 파이프라인 구성 표시
azd pipeline show
```

### 인프라 관리
```bash
# 인프라 템플릿 생성
azd infra generate

# 🧪 인프라 미리보기 및 계획
azd provision --preview
# 배포하지 않고 인프라 프로비저닝 시뮬레이션
# Bicep/Terraform 템플릿을 분석하고 다음을 표시:
# - 추가될 리소스 (초록색 +)
# - 수정될 리소스 (노란색 ~)
# - 삭제될 리소스 (빨간색 -)
# 안전한 실행 - Azure 환경에 실제 변경 없음

# azure.yaml에서 인프라 합성
azd infra synth
```

### 프로젝트 정보
```bash
# 프로젝트 상태 및 엔드포인트 표시
azd show

# JSON 형식의 상세 프로젝트 정보 표시
azd show --output json

# 서비스 엔드포인트 가져오기
azd show --output json | jq '.services'
```

## 🎯 빠른 워크플로우

### 개발 워크플로우
```bash
# 새 프로젝트 시작
azd init --template todo-nodejs-mongo
cd my-project

# 개발 환경에 배포
azd env new dev
azd up

# 변경 사항 적용 후 다시 배포
azd deploy

# 모니터링 대시보드 열기
azd monitor --live
```

### 다중 환경 워크플로우
```bash
# 환경 설정
azd env new dev
azd env new staging  
azd env new production

# 개발 환경에 배포
azd env select dev
azd up

# 테스트 및 스테이징으로 승격
azd env select staging
azd up

# 운영 환경에 배포
azd env select production
azd up
```

### 문제 해결 워크플로우
```bash
# 디버그 모드 활성화
export AZD_DEBUG=true

# 배포 상태 확인
azd show

# 구성 유효성 검사
azd config list

# 로그를 위한 모니터링 대시보드 열기
azd monitor --logs

# 리소스 상태 확인
azd show --output json
```

## 🔍 디버깅 명령어

### 디버그 정보
```bash
# 디버그 출력 활성화
export AZD_DEBUG=true
azd <command> --debug

# 더 깔끔한 출력을 위해 텔레메트리 비활성화
export AZD_DISABLE_TELEMETRY=true

# 현재 구성 확인
azd config list

# 인증 상태 확인
az account show
```

### 템플릿 디버깅
```bash
# 사용 가능한 템플릿을 세부 정보와 함께 나열
azd template list --output json

# 템플릿 정보 표시
azd template show <template-name>

# 초기화 전에 템플릿 유효성 검사
azd template validate <template-name>
```

## 📁 파일 및 디렉터리 명령어

### 프로젝트 구조
```bash
# 현재 디렉터리 구조 표시
tree /f  # 윈도우
find . -type f  # 리눅스/맥OS

# azd 프로젝트 루트로 이동
cd $(azd root)

# azd 구성 디렉터리 표시
echo $AZD_CONFIG_DIR  # 보통 ~/.azd
```

## 🎨 출력 형식

### JSON 출력
```bash
# 스크립팅을 위한 JSON 출력 받기
azd show --output json
azd env list --output json
azd config list --output json

# jq로 파싱하기
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 테이블 출력
```bash
# 표 형식으로
azd env list --output table

# 배포된 서비스 보기
azd show --output json | jq '.services | keys'
```

## 🔧 일반 명령 조합

### 상태 점검 스크립트
```bash
#!/bin/bash
# 빠른 상태 점검
azd show
azd env show
azd monitor --logs
```

### 배포 검증
```bash
#!/bin/bash
# 배포 전 검증
azd show
azd provision --preview  # 배포 전에 변경 사항 미리보기
az account show
```

### 환경 비교
```bash
#!/bin/bash
# 환경 비교
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### 리소스 정리 스크립트
```bash
#!/bin/bash
# 오래된 환경 정리하기
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 환경 변수

### 일반 환경 변수
```bash
# Azure 구성
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD 구성
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# 애플리케이션 구성
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 긴급 명령어

### 빠른 수정
```bash
# 인증 재설정
az account clear
az login

# 환경 강제 새로고침
azd env refresh

# 모든 서비스 재배포
azd deploy

# 배포 상태 확인
azd show --output json
```

### 복구 명령어
```bash
# 실패한 배포 복구 - 정리 후 재배포
azd down --force --purge
azd up

# 인프라만 다시 프로비저닝
azd provision

# 애플리케이션만 재배포
azd deploy
```

## 💡 전문가 팁

### 더 빠른 워크플로우를 위한 별칭
```bash
# .bashrc 또는 .zshrc에 추가하세요
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### 함수 단축키
```bash
# 빠른 환경 전환
azd-env() {
    azd env select $1 && azd show
}

# 모니터링을 통한 빠른 배포
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# 환경 상태
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 도움말 및 문서

### 도움말 받기
```bash
# 일반 도움말
azd --help
azd help

# 명령어 별 도움말
azd up --help
azd env --help
azd config --help

# 버전 및 빌드 정보 표시
azd version
azd version --output json
```

### 문서 링크
```bash
# 브라우저에서 문서 열기
azd docs

# 템플릿 문서 표시
azd template show <template-name> --docs
```

---

**팁**: 이 치트 시트를 북마크하고 `Ctrl+F`를 사용하여 필요한 명령어를 빠르게 찾으세요!

---

**내비게이션**
- **이전 강의**: [사전 검사](../docs/pre-deployment/preflight-checks.md)
- **다음 강의**: [용어집](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원문이 권위 있는 근거 자료로 간주되어야 합니다. 중요한 정보의 경우 전문 인력의 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->