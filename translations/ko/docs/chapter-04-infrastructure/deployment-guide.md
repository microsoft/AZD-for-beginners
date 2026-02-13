# Deployment Guide - Mastering AZD Deployments

**Chapter Navigation:**
- **📚 강의 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 장**: 4장 - 코드형 인프라 및 배포
- **⬅️ 이전 장**: [3장: 구성](../chapter-03-configuration/configuration.md)
- **➡️ 다음**: [리소스 프로비저닝](provisioning.md)
- **🚀 다음 장**: [5장: 멀티 에이전트 AI 솔루션](../../examples/retail-scenario.md)

## 소개

이## Understanding the Deployment Process포괄적인 가이드는 Azure Developer CLI를 사용한 애플리케이션 배포에 대해 알아야 할 모든 것을 다룹니다. 기본 단일 명령 배포부터 맞춤 후크, 다중 환경 및 CI/CD 통합을 포함한 고급 운영 시나리오까지. 실용적인 예제와 모범 사례로 전체 배포 수명주기를 마스터하세요.

## 학습 목표

이 가이드를 완료하면 다음을 수행할 수 있습니다:
- Azure Developer CLI의 모든 배포 명령 및 워크플로 숙달
- 프로비저닝부터 모니터링까지 전체 배포 수명주기 이해
- 사전/사후 배포 자동화를 위한 사용자 정의 배포 후크 구현
- 환경별 매개변수를 사용한 다중 환경 구성
- 블루-그린 및 카나리아 배포를 포함한 고급 배포 전략 설정
- azd 배포를 CI/CD 파이프라인 및 DevOps 워크플로와 통합

## 학습 성과

완료 후 다음을 수행할 수 있습니다:
- 모든 azd 배포 워크플로를 독립적으로 실행하고 문제 해결
- 후크를 사용한 맞춤형 배포 자동화 설계 및 구현
- 적절한 보안 및 모니터링이 적용된 운영 환경 배포 구성
- 복잡한 다중 환경 배포 시나리오 관리
- 배포 성능 최적화 및 롤백 전략 구현
- azd 배포를 엔터프라이즈 DevOps 관행에 통합

## 배포 개요

Azure Developer CLI는 여러 배포 명령을 제공합니다:
- `azd up` - 전체 워크플로(프로비저닝 + 배포)
- `azd provision` - Azure 리소스만 생성/업데이트
- `azd deploy` - 애플리케이션 코드만 배포
- `azd package` - 애플리케이션 빌드 및 패키징

## 기본 배포 워크플로

### 전체 배포 (azd up)
새 프로젝트에서 가장 일반적인 워크플로:
```bash
# 모든 것을 처음부터 배포
azd up

# 특정 환경으로 배포
azd up --environment production

# 사용자 지정 매개변수로 배포
azd up --parameter location=westus2 --parameter sku=P1v2
```

### 인프라 전용 배포
Azure 리소스만 업데이트해야 할 때:
```bash
# 인프라를 프로비저닝/업데이트
azd provision

# 변경 사항을 미리보기 위한 드라이런(dry-run)으로 프로비저닝
azd provision --preview

# 특정 서비스를 프로비저닝
azd provision --service database
```

### 코드 전용 배포
빠른 애플리케이션 업데이트용:
```bash
# 모든 서비스를 배포
azd deploy

# 예상 출력:
# 서비스 배포 중 (azd deploy)
# - web: 배포 중... 완료
# - api: 배포 중... 완료
# 성공: 배포가 2분 15초 만에 완료되었습니다

# 특정 서비스 배포
azd deploy --service web
azd deploy --service api

# 사용자 지정 빌드 인수로 배포
azd deploy --service api --build-arg NODE_ENV=production

# 배포 확인
azd show --output json | jq '.services'
```

### ✅ 배포 검증

모든 배포 후 성공 여부를 확인하세요:

```bash
# 모든 서비스가 실행 중인지 확인
azd show

# 헬스 엔드포인트 테스트
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# 오류 모니터링 (기본적으로 브라우저에서 열림)
azd monitor --logs
```

**성공 기준:**
- ✅ 모든 서비스가 "Running" 상태 표시
- ✅ 헬스 엔드포인트가 HTTP 200 반환
- ✅ 지난 5분간 오류 로그 없음
- ✅ 애플리케이션이 테스트 요청에 응답

## 🏗️ 배포 프로세스 이해

### 1단계: 사전 프로비저닝 후크
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
- 인프라 템플릿(Bicep/Terraform) 읽기
- Azure 리소스 생성 또는 업데이트
- 네트워킹 및 보안 구성
- 모니터링 및 로깅 설정

### 3단계: 사후 프로비저닝 후크
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

### 5단계: 사전 배포 후크
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
- 패키지된 애플리케이션을 Azure 서비스에 배포
- 구성 설정 업데이트
- 서비스 시작/재시작

### 7단계: 사후 배포 후크
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
# 개발 환경
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# 스테이징 환경
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# 운영 환경
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
# 블루 환경 생성
azd env new production-blue
azd up --environment production-blue

# 블루 환경 테스트
./scripts/test-environment.sh production-blue

# 트래픽을 블루로 전환 (수동 DNS/로드밸런서 업데이트)
./scripts/switch-traffic.sh production-blue

# 그린 환경 정리
azd env select production-green
azd down --force
```

### 카나리아 배포
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

### 단계별 배포
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

### Container App 배포
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

### 서비스별 배포
```bash
# 더 빠른 반복을 위해 특정 서비스를 배포
azd deploy --service web
azd deploy --service api

# 모든 서비스를 배포
azd deploy
```

### 빌드 캐싱
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### 효율적인 코드 배포
```bash
# 코드만 변경할 경우 azd up이 아니라 azd deploy를 사용하세요
# 이렇게 하면 인프라 프로비저닝을 건너뛰어 훨씬 빨라집니다
azd deploy

# 가장 빠른 반복을 위해 특정 서비스만 배포하세요
azd deploy --service api
```

## 🔍 배포 모니터링

### 실시간 배포 모니터링
```bash
# 애플리케이션을 실시간으로 모니터링
azd monitor --live

# 애플리케이션 로그 보기
azd monitor --logs

# 배포 상태 확인
azd show
```

### 헬스 체크
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

# 애플리케이션 상태 확인
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

### 시크릿 관리
```bash
# 비밀을 안전하게 저장
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml에서 비밀을 참조
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

### ID 및 접근 관리
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
# AZD에는 내장된 롤백 기능이 없습니다. 권장 방법:

# 옵션 1: Git에서 재배포(권장)
git revert HEAD  # 문제가 있는 커밋을 되돌리기
git push
azd deploy

# 옵션 2: 특정 커밋 재배포
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### 인프라 롤백
```bash
# 적용하기 전에 인프라 변경사항을 미리 확인
azd provision --preview

# 인프라 롤백에는 버전 관리를 사용하세요:
git revert HEAD  # 인프라 변경사항 되돌리기
azd provision    # 이전 인프라 상태 적용
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

## 📊 배포 지표

### 배포 성능 추적
```bash
# 현재 배포 상태 보기
azd show

# Application Insights를 사용하여 애플리케이션 모니터링
azd monitor --overview

# 실시간 메트릭 보기
azd monitor --live
```

### 사용자 정의 지표 수집
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
# 일관된 명명 사용
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# 환경 간 일관성 유지
./scripts/sync-environments.sh
```

### 2. 인프라 검증
```bash
# 배포 전에 인프라 변경 사항을 미리 확인
azd provision --preview

# ARM/Bicep 린팅 사용
az bicep lint --file infra/main.bicep

# Bicep 구문 검증
az bicep build --file infra/main.bicep
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
# 배포 절차 문서화
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env show --output json | jq -r '.name')" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## 다음 단계

- [리소스 프로비저닝](provisioning.md) - 인프라 관리 심층 분석
- [배포 전 계획](../chapter-06-pre-deployment/capacity-planning.md) - 배포 전략 계획
- [일반 문제](../chapter-07-troubleshooting/common-issues.md) - 배포 문제 해결
- [모범 사례](../chapter-07-troubleshooting/debugging.md) - 운영 환경 배포 전략

## 🎯 실습 배포 연습

### 연습 1: 증분 배포 워크플로 (20분)
**목표**: 전체 배포와 증분 배포의 차이를 숙달

```bash
# 초기 배포
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# 초기 배포 시간 기록
echo "Full deployment: $(date)" > deployment-log.txt

# 코드 변경
echo "// Updated $(date)" >> src/api/src/server.js

# 코드만 배포 (빠름)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# 시간 비교
cat deployment-log.txt

# 정리
azd down --force --purge
```

**성공 기준:**
- [ ] 전체 배포 소요 시간 5-15분
- [ ] 코드 전용 배포 소요 시간 2-5분
- [ ] 코드 변경 사항이 배포된 앱에 반영
- [ ] `azd deploy` 후 인프라 변경 없음

**학습 성과**: `azd deploy`는 코드 변경 시 `azd up`보다 50-70% 빠릅니다

### 연습 2: 맞춤 배포 후크 (30분)
**목표**: 사전 및 사후 배포 자동화 구현

```bash
# 사전 배포 유효성 검사 스크립트 생성
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# 테스트 통과 여부 확인
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# 커밋되지 않은 변경사항 확인
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# 배포 후 스모크 테스트 생성
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# azure.yaml에 후크 추가
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# 후크를 사용한 배포 테스트
azd deploy
```

**성공 기준:**
- [ ] 사전 배포 스크립트가 배포 전에 실행됨
- [ ] 테스트 실패 시 배포가 중단됨
- [ ] 사후 배포 스모크 테스트로 헬스 검증
- [ ] 후크가 올바른 순서로 실행됨

### 연습 3: 다중 환경 배포 전략 (45분)
**목표**: 단계별 배포 워크플로 구현(dev → staging → production)

```bash
# 배포 스크립트 생성
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# 1단계: 개발 환경에 배포
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 2단계: 스테이징 환경에 배포
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# 3단계: 프로덕션 배포를 위한 수동 승인
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# 환경 생성
azd env new dev
azd env new staging
azd env new production

# 단계별 배포 실행
./deploy-staged.sh
```

**성공 기준:**
- [ ] 개발 환경이 성공적으로 배포됨
- [ ] 스테이징 환경이 성공적으로 배포됨
- [ ] 운영 환경은 수동 승인 필요
- [ ] 모든 환경에 작동하는 헬스 체크 존재
- [ ] 필요 시 롤백 가능

### 연습 4: 롤백 전략 (25분)
**목표**: Git을 사용한 배포 롤백 구현 및 테스트

```bash
# v1 배포
azd env set APP_VERSION "1.0.0"
azd up

# v1 커밋 해시 저장
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# 비호환적 변경이 포함된 v2 배포
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# 실패 감지 및 롤백
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git을 사용한 롤백
    git revert HEAD --no-edit
    
    # 환경 롤백
    azd env set APP_VERSION "1.0.0"
    
    # v1 재배포
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**성공 기준:**
- [ ] 배포 실패를 감지할 수 있음
- [ ] 롤백 스크립트가 자동으로 실행됨
- [ ] 애플리케이션이 작동 상태로 복구됨
- [ ] 롤백 후 헬스 체크 통과

## 📊 배포 지표 추적

### 배포 성능 추적

```bash
# 배포 지표 스크립트 생성
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env show --output json | jq -r '.name')"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# 로그를 파일에 기록
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env show --output json | jq -r '.name')" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# 사용하세요
./track-deployment.sh
```

**지표 분석:**
```bash
# 배포 기록 보기
cat deployment-metrics.csv

# 평균 배포 시간 계산
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## 추가 자료

- [Azure Developer CLI 배포 참고문서](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service 배포](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps 배포](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions 배포](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**탐색**
- **이전 강의**: [당신의 첫 프로젝트](../chapter-01-foundation/first-project.md)
- **다음 강의**: [리소스 프로비저닝](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 고지:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 포함될 수 있음을 알려드립니다. 원문(원어) 문서를 권위 있는 자료로 간주하시기 바라며, 중요한 정보의 경우 전문적인 인간 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사가 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->