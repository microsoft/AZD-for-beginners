# 명령어 치트 시트 - 필수 AZD 명령어

**모든 챕터를 위한 빠른 참조**
- **📚 코스 홈**: [AZD 초보자용](../README.md)
- **📖 빠른 시작**: [챕터 1: 기초 및 빠른 시작](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI 명령어**: [챕터 2: AI 우선 개발](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 고급**: [챕터 4: 코드로서의 인프라](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## 소개

이 포괄적인 치트 시트는 가장 자주 사용되는 Azure Developer CLI 명령어를 카테고리별로 정리하고 실용적인 예제를 제공합니다. 개발, 문제 해결, 그리고 azd 프로젝트와 함께하는 일상적인 작업 중 빠른 참조에 적합합니다.

## 학습 목표

이 치트 시트를 사용함으로써:
- 필수 Azure Developer CLI 명령어와 문법에 즉시 접근할 수 있습니다.
- 기능별 카테고리와 사용 사례에 따라 명령어를 이해할 수 있습니다.
- 일반적인 개발 및 배포 시나리오에 대한 실용적인 예제를 참조할 수 있습니다.
- 문제를 빠르게 해결할 수 있는 명령어를 찾을 수 있습니다.
- 고급 설정 및 사용자 정의 옵션을 효율적으로 찾을 수 있습니다.
- 환경 관리 및 다중 환경 워크플로 명령어를 찾을 수 있습니다.

## 학습 결과

이 치트 시트를 정기적으로 참조함으로써:
- 전체 문서를 참조하지 않고도 azd 명령어를 자신 있게 실행할 수 있습니다.
- 적절한 진단 명령어를 사용하여 일반적인 문제를 빠르게 해결할 수 있습니다.
- 여러 환경과 배포 시나리오를 효율적으로 관리할 수 있습니다.
- 필요에 따라 고급 azd 기능 및 설정 옵션을 적용할 수 있습니다.
- 체계적인 명령어 시퀀스를 사용하여 배포 문제를 해결할 수 있습니다.
- azd 단축키와 옵션을 효과적으로 사용하여 워크플로를 최적화할 수 있습니다.

## 시작하기 명령어

### 인증
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 프로젝트 초기화
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## 핵심 배포 명령어

### 전체 배포 워크플로
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### 인프라만 배포
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes (NEW)
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied

# Provision with what-if analysis
azd provision --what-if
```

### 애플리케이션만 배포
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### 빌드 및 패키징
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

## 🌍 환경 관리

### 환경 작업
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### 환경 변수
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ 설정 명령어

### 글로벌 설정
```bash
# List all configuration
azd config list

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### 프로젝트 설정
```bash
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 모니터링 및 로그

### 애플리케이션 로그
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### 모니터링
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
```

## 🛠️ 유지보수 명령어

### 정리
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### 업데이트
```bash
# Check for azd updates
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 고급 명령어

### 파이프라인 및 CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### 인프라 관리
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate

# 🧪 Infrastructure Preview & Planning (NEW)
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment
```

### 서비스 관리
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 빠른 워크플로

### 개발 워크플로
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
```

### 다중 환경 워크플로
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### 문제 해결 워크플로
```bash
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 디버깅 명령어

### 디버그 정보
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### 템플릿 디버깅
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 파일 및 디렉토리 명령어

### 프로젝트 구조
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 출력 형식

### JSON 출력
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### 테이블 출력
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 일반 명령어 조합

### 상태 확인 스크립트
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### 배포 검증
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### 환경 비교
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### 리소스 정리 스크립트
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 환경 변수

### 일반 환경 변수
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 긴급 명령어

### 빠른 수정
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### 복구 명령어
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 전문가 팁

### 빠른 워크플로를 위한 별칭
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### 함수 단축키
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 도움말 및 문서

### 도움말 받기
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### 문서 링크
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**팁**: 이 치트 시트를 북마크하고 `Ctrl+F`를 사용하여 필요한 명령어를 빠르게 찾으세요!

---

**탐색**
- **이전 레슨**: [사전 점검](../docs/pre-deployment/preflight-checks.md)
- **다음 레슨**: [용어집](glossary.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어를 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임지지 않습니다.