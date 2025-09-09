<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9788ca3a01099b5a07db01554f915e27",
  "translation_date": "2025-09-09T17:07:13+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "ko"
}
-->
# 일반적인 문제 및 해결 방법

## 소개

이 포괄적인 문제 해결 가이드는 Azure Developer CLI를 사용할 때 자주 발생하는 문제를 다룹니다. 인증, 배포, 인프라 프로비저닝, 애플리케이션 구성과 관련된 일반적인 문제를 진단, 해결 및 해결하는 방법을 배울 수 있습니다. 각 문제는 상세한 증상, 근본 원인, 단계별 해결 절차를 포함합니다.

## 학습 목표

이 가이드를 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI 문제에 대한 진단 기술 숙달
- 일반적인 인증 및 권한 문제와 그 해결 방법 이해
- 배포 실패, 인프라 프로비저닝 오류 및 구성 문제 해결
- 사전 모니터링 및 디버깅 전략 구현
- 복잡한 문제에 대한 체계적인 문제 해결 방법론 적용
- 적절한 로깅 및 모니터링을 구성하여 미래의 문제 예방

## 학습 결과

완료 후, 다음을 수행할 수 있습니다:
- Azure Developer CLI 문제를 내장된 진단 도구를 사용하여 진단
- 인증, 구독 및 권한 관련 문제를 독립적으로 해결
- 배포 실패 및 인프라 프로비저닝 오류를 효과적으로 해결
- 애플리케이션 구성 문제 및 환경별 문제 디버깅
- 잠재적 문제를 사전에 식별하기 위한 모니터링 및 경고 구현
- 로깅, 디버깅 및 문제 해결 워크플로우에 대한 모범 사례 적용

## 빠른 진단

특정 문제를 다루기 전에, 다음 명령을 실행하여 진단 정보를 수집하세요:

```bash
# Check azd version and health
azd version
azd config list

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env show
azd env get-values

# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug
```

## 인증 문제

### 문제: "액세스 토큰을 가져오지 못했습니다"
**증상:**
- `azd up`이 인증 오류로 실패
- 명령이 "권한 없음" 또는 "액세스 거부"를 반환

**해결 방법:**
```bash
# 1. Re-authenticate with Azure CLI
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 문제: 배포 중 "권한 부족"
**증상:**
- 배포가 권한 오류로 실패
- 특정 Azure 리소스를 생성할 수 없음

**해결 방법:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### 문제: 멀티 테넌트 인증 문제
**해결 방법:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ 인프라 프로비저닝 오류

### 문제: 리소스 이름 충돌
**증상:**
- "리소스 이름이 이미 존재합니다" 오류
- 리소스 생성 중 배포 실패

**해결 방법:**
```bash
# 1. Use unique resource names with tokens
# In your Bicep template:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Clean up existing resources
azd down --force --purge
```

### 문제: 위치/지역 사용 불가
**증상:**
- "리소스 유형에 대해 위치 'xyz'가 사용 불가" 오류
- 선택한 지역에서 특정 SKU 사용 불가

**해결 방법:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Use commonly available regions
azd config set defaults.location eastus2
# or
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

### 문제: 할당량 초과 오류
**증상:**
- "리소스 유형에 대한 할당량 초과"
- "최대 리소스 수에 도달"

**해결 방법:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

# 3. Use smaller SKUs for development
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 문제: Bicep 템플릿 오류
**증상:**
- 템플릿 유효성 검사 실패
- Bicep 파일의 구문 오류

**해결 방법:**
```bash
# 1. Validate Bicep syntax
az bicep build --file infra/main.bicep

# 2. Use Bicep linter
az bicep lint --file infra/main.bicep

# 3. Check parameter file syntax
cat infra/main.parameters.json | jq '.'

# 4. Preview deployment changes
azd provision --preview
```

## 🚀 배포 실패

### 문제: 빌드 실패
**증상:**
- 배포 중 애플리케이션 빌드 실패
- 패키지 설치 오류

**해결 방법:**
```bash
# 1. Check build logs
azd logs --service web
azd deploy --service web --debug

# 2. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
rm -rf node_modules package-lock.json
npm install

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### 문제: 컨테이너 배포 실패
**증상:**
- 컨테이너 앱이 시작되지 않음
- 이미지 가져오기 오류

**해결 방법:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs
azd logs --service api --follow

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### 문제: 데이터베이스 연결 실패
**증상:**
- 애플리케이션이 데이터베이스에 연결할 수 없음
- 연결 시간 초과 오류

**해결 방법:**
```bash
# 1. Check database firewall rules
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectivity from application
# Add to your app temporarily:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verify connection string format
azd env get-values | grep DATABASE

# 4. Check database server status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 구성 문제

### 문제: 환경 변수 작동하지 않음
**증상:**
- 앱이 구성 값을 읽을 수 없음
- 환경 변수가 비어 있음

**해결 방법:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get DATABASE_URL

# 2. Check variable names in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restart the application
azd deploy --service web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### 문제: SSL/TLS 인증서 문제
**증상:**
- HTTPS 작동하지 않음
- 인증서 유효성 검사 오류

**해결 방법:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 문제: CORS 구성 문제
**증상:**
- 프론트엔드가 API를 호출할 수 없음
- 교차 출처 요청 차단

**해결 방법:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API to handle CORS
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Check if running on correct URLs
azd show
```

## 🌍 환경 관리 문제

### 문제: 환경 전환 문제
**증상:**
- 잘못된 환경이 사용됨
- 구성이 제대로 전환되지 않음

**해결 방법:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env show

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### 문제: 환경 손상
**증상:**
- 환경이 잘못된 상태로 표시됨
- 리소스가 구성과 일치하지 않음

**해결 방법:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. Import existing resources (if possible)
# Manually update .azure/production/config.json with resource IDs
```

## 🔍 성능 문제

### 문제: 느린 배포 시간
**증상:**
- 배포가 너무 오래 걸림
- 배포 중 시간 초과

**해결 방법:**
```bash
# 1. Enable parallel deployment
azd config set deploy.parallelism 5

# 2. Use incremental deployments
azd deploy --incremental

# 3. Optimize build process
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Check resource locations (use same region)
azd config set defaults.location eastus2
```

### 문제: 애플리케이션 성능 문제
**증상:**
- 느린 응답 시간
- 높은 리소스 사용량

**해결 방법:**
```bash
# 1. Scale up resources
# Update SKU in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Enable Application Insights monitoring
azd monitor

# 3. Check application logs for bottlenecks
azd logs --service api --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ 문제 해결 도구 및 명령

### 디버그 명령
```bash
# Comprehensive debugging
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Check system info
azd info

# Validate configuration
azd config validate

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### 로그 분석
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### 리소스 조사
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 추가 도움 받기

### 에스컬레이션 시점
- 모든 해결 방법을 시도한 후에도 인증 문제가 지속될 때
- Azure 서비스와 관련된 인프라 문제
- 청구 또는 구독 관련 문제
- 보안 문제 또는 사고

### 지원 채널
```bash
# 1. Check Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Create Azure support ticket
# Go to: https://portal.azure.com -> Help + support

# 3. Community resources
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 수집할 정보
지원에 연락하기 전에 다음 정보를 수집하세요:
- `azd version` 출력
- `azd info` 출력
- 오류 메시지 (전체 텍스트)
- 문제를 재현하는 단계
- 환경 세부 정보 (`azd env show`)
- 문제 시작 시점의 타임라인

### 로그 수집 스크립트
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

echo "Debug information collected in debug-logs/"
```

## 📊 문제 예방

### 배포 전 체크리스트
```bash
# 1. Validate authentication
az account show

# 2. Check quotas and limits
az vm list-usage --location eastus2

# 3. Validate templates
az bicep build --file infra/main.bicep

# 4. Test locally first
npm run build
npm run test

# 5. Use dry-run deployments
azd provision --preview
```

### 모니터링 설정
```bash
# Enable Application Insights
# Add to main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Set up alerts
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### 정기 유지보수
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## 관련 리소스

- [디버깅 가이드](debugging.md) - 고급 디버깅 기술
- [리소스 프로비저닝](../deployment/provisioning.md) - 인프라 문제 해결
- [용량 계획](../pre-deployment/capacity-planning.md) - 리소스 계획 지침
- [SKU 선택](../pre-deployment/sku-selection.md) - 서비스 계층 추천

---

**팁**: 이 가이드를 북마크에 추가하고 문제가 발생할 때마다 참조하세요. 대부분의 문제는 이미 발생한 적이 있으며 확립된 해결 방법이 있습니다!

---

**탐색**
- **이전 레슨**: [리소스 프로비저닝](../deployment/provisioning.md)
- **다음 레슨**: [디버깅 가이드](debugging.md)

---

**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 최선을 다하고 있으나, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전을 권위 있는 출처로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.