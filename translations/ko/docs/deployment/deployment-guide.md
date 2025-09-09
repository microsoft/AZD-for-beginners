<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eca806abfc53ae49028f8d34471ab8c7",
  "translation_date": "2025-09-09T16:59:13+00:00",
  "source_file": "docs/deployment/deployment-guide.md",
  "language_code": "ko"
}
-->
# 배포 가이드 - AZD 배포 마스터하기

## 소개

이 포괄적인 가이드는 Azure Developer CLI를 사용하여 애플리케이션을 배포하는 방법에 대해 기본적인 단일 명령 배포부터 사용자 정의 훅, 다중 환경, CI/CD 통합을 포함한 고급 프로덕션 시나리오까지 모든 것을 다룹니다. 실용적인 예제와 모범 사례를 통해 배포 라이프사이클을 완벽히 익히세요.

## 학습 목표

이 가이드를 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI 배포 명령과 워크플로를 마스터하기
- 프로비저닝부터 모니터링까지 배포 라이프사이클을 이해하기
- 배포 전후 자동화를 위한 사용자 정의 배포 훅 구현하기
- 환경별 매개변수를 사용하여 다중 환경 구성하기
- 블루-그린 및 카나리 배포를 포함한 고급 배포 전략 설정하기
- azd 배포를 CI/CD 파이프라인 및 DevOps 워크플로에 통합하기

## 학습 결과

가이드를 완료하면 다음을 수행할 수 있습니다:
- 모든 azd 배포 워크플로를 독립적으로 실행하고 문제 해결하기
- 사용자 정의 배포 자동화를 설계하고 구현하기
- 적절한 보안 및 모니터링을 갖춘 프로덕션 준비 배포 구성하기
- 복잡한 다중 환경 배포 시나리오 관리하기
- 배포 성능을 최적화하고 롤백 전략 구현하기
- azd 배포를 엔터프라이즈 DevOps 관행에 통합하기

## 배포 개요

Azure Developer CLI는 여러 배포 명령을 제공합니다:
- `azd up` - 전체 워크플로 (프로비저닝 + 배포)
- `azd provision` - Azure 리소스 생성/업데이트만 수행
- `azd deploy` - 애플리케이션 코드 배포만 수행
- `azd package` - 애플리케이션 빌드 및 패키징

## 기본 배포 워크플로

### 전체 배포 (azd up)
새 프로젝트에 가장 일반적으로 사용되는 워크플로:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2 --parameter sku=P1v2
```

### 인프라만 배포
Azure 리소스만 업데이트해야 할 때:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provision specific services
azd provision --service database
```

### 코드만 배포
빠른 애플리케이션 업데이트를 위해:
```bash
# Deploy all services
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy with custom build arguments
azd deploy --service api --build-arg NODE_ENV=production
```

## 🏗️ 배포 프로세스 이해하기

### 1단계: 프로비저닝 전 훅
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### 2단계: 인프라 프로비저닝
- 인프라 템플릿(Bicep/Terraform)을 읽음
- Azure 리소스를 생성 또는 업데이트
- 네트워킹 및 보안 구성
- 모니터링 및 로깅 설정

### 3단계: 프로비저닝 후 훅
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### 4단계: 애플리케이션 패키징
- 애플리케이션 코드 빌드
- 배포 아티팩트 생성
- 대상 플랫폼(컨테이너, ZIP 파일 등)에 맞게 패키징

### 5단계: 배포 전 훅
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### 6단계: 애플리케이션 배포
- 패키징된 애플리케이션을 Azure 서비스에 배포
- 구성 설정 업데이트
- 서비스 시작/재시작

### 7단계: 배포 후 훅
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

## 🎛️ 배포 구성

### 서비스별 배포 설정
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### 환경별 구성
```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 고급 배포 시나리오

### 다중 서비스 애플리케이션
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### 블루-그린 배포
```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### 카나리 배포
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### 단계적 배포
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 컨테이너 배포

### 컨테이너 앱 배포
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### 다단계 Dockerfile 최적화
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ 성능 최적화

### 병렬 배포
```bash
# Configure parallel deployment
azd config set deploy.parallelism 5

# Deploy services in parallel
azd deploy --parallel
```

### 빌드 캐싱
```yaml
# azure.yaml - Enable build caching
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    buildCache:
      enabled: true
      paths:
        - node_modules
        - .next/cache
```

### 증분 배포
```bash
# Deploy only changed services
azd deploy --incremental

# Deploy with change detection
azd deploy --detect-changes
```

## 🔍 배포 모니터링

### 실시간 배포 모니터링
```bash
# Monitor deployment progress
azd deploy --follow

# View deployment logs
azd logs --follow --service api

# Check deployment status
azd show --service api
```

### 상태 확인
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### 배포 후 검증
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 보안 고려사항

### 비밀 관리
```bash
# Store secrets securely
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# Reference secrets in azure.yaml
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### 네트워크 보안
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ID 및 액세스 관리
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 롤백 전략

### 빠른 롤백
```bash
# Rollback to previous deployment
azd deploy --rollback

# Rollback specific service
azd deploy --service api --rollback

# Rollback to specific version
azd deploy --service api --version v1.2.3
```

### 인프라 롤백
```bash
# Rollback infrastructure changes
azd provision --rollback

# Preview rollback changes
azd provision --rollback --preview
```

### 데이터베이스 마이그레이션 롤백
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 배포 메트릭

### 배포 성능 추적
```bash
# Enable deployment metrics
azd config set telemetry.deployment.enabled true

# View deployment history
azd history

# Get deployment statistics
azd metrics --type deployment
```

### 사용자 정의 메트릭 수집
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 모범 사례

### 1. 환경 일관성
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. 인프라 검증
```bash
# Validate before deployment
azd provision --preview
azd provision --what-if

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep
```

### 3. 테스트 통합
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. 문서화 및 로깅
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 다음 단계

- [리소스 프로비저닝](provisioning.md) - 인프라 관리 심층 분석
- [배포 전 계획](../pre-deployment/capacity-planning.md) - 배포 전략 계획
- [일반적인 문제](../troubleshooting/common-issues.md) - 배포 문제 해결
- [모범 사례](../troubleshooting/debugging.md) - 프로덕션 준비 배포 전략

## 추가 자료

- [Azure Developer CLI 배포 참조](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service 배포](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps 배포](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions 배포](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**탐색**
- **이전 레슨**: [첫 번째 프로젝트](../getting-started/first-project.md)
- **다음 레슨**: [리소스 프로비저닝](provisioning.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 신뢰할 수 있는 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.