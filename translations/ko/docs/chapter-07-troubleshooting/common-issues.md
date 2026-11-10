# 일반적인 문제 및 해결책

**챕터 탐색:**
- **📚 강좌 홈**: [초보자를 위한 AZD](../../README.md)
- **📖 현재 챕터**: 챕터 7 - 문제 해결 및 디버깅
- **⬅️ 이전 챕터**: [챕터 6: 사전 점검](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ 다음**: [디버깅 가이드](debugging.md)
- **🚀 다음 챕터**: [챕터 8: 프로덕션 및 엔터프라이즈 패턴](../chapter-08-production/production-ai-practices.md)

## 소개

이 종합 문제 해결 가이드는 Azure Developer CLI 사용 중 자주 발생하는 문제들을 다룹니다. 인증, 배포, 인프라 프로비저닝, 애플리케이션 구성에서 흔한 문제를 진단하고 해결하는 방법을 배웁니다. 각 문제는 상세한 증상, 근본 원인 및 단계별 해결 절차를 포함합니다.

## 학습 목표

이 가이드를 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI 문제 진단 기법 숙달
- 일반적인 인증 및 권한 문제 및 해결책 이해
- 배포 실패, 인프라 프로비저닝 오류 및 구성 문제 해결
- 사전 모니터링 및 디버깅 전략 구현
- 복잡한 문제에 대한 체계적 문제 해결 방법 적용
- 향후 문제 방지를 위한 적절한 로깅 및 모니터링 구성

## 학습 성과

완료 후 다음이 가능합니다:
- 내장 진단 도구를 사용한 Azure Developer CLI 문제 진단
- 인증, 구독 및 권한 관련 문제 독립적 해결
- 배포 실패 및 인프라 프로비저닝 오류 효과적으로 문제 해결
- 애플리케이션 구성 문제 및 환경별 문제 디버깅
- 잠재적 문제를 사전에 식별하기 위한 모니터링 및 경고 구현
- 로깅, 디버깅 및 문제 해결 워크플로우 모범 사례 적용

## 빠른 진단

> 예시 이름/ID는 환경에 맞게 바꾸세요. Bash, Bicep, JavaScript, 파라미터 파일 조각은 아래에서 별도로 표시됩니다; 하나의 실행 스크립트가 아닙니다. 파괴적 작업을 검토하고 진단 공유 전에 비밀을 가려주세요. `azd monitor --logs` 는 브라우저를 엽니다; 터미널 로그를 스트림하지 않습니다.

구체적 문제로 들어가기 전에, 진단 정보를 수집하려면 다음 명령을 실행하세요:

```bash
# Check azd version and health
azd version
azd config show

# Verify Azure authentication
az account show
az account list

# Check current environment
azd env list
azd env get-values

# Enable debug logging for the command being investigated
azd <command> --debug
```

## 인증 문제

### 문제: "액세스 토큰 가져오기 실패"
**증상:**
- `azd up`가 인증 오류로 실패
- 명령이 "권한 없음" 또는 "액세스 거부" 반환

**해결책:**
```bash
# 1. Authenticate azd separately (Azure CLI login alone may not authenticate azd)
azd auth login
azd auth login --check-status --output json

# 2. Authenticate Azure CLI when using az commands
az login
az account show

# 2. Clear cached credentials
az account clear
az login

# 3. Use device code flow (for headless systems)
az login --use-device-code

# 4. Set explicit subscription
az account set --subscription "your-subscription-id"
azd env set AZURE_SUBSCRIPTION_ID "your-subscription-id"
```

### 문제: 배포 중 "권한 부족"
**증상:**
- 권한 오류로 배포 실패
- 특정 Azure 리소스 생성 불가

**해결책:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### 문제: 다중 테넌트 인증 문제
**해결책:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ 인프라 프로비저닝 오류

### 문제: 리소스 이름 충돌
**증상:**
- "리소스 이름이 이미 존재합니다" 오류
- 리소스 생성 중 배포 실패

**해결책:**
```bicep
// 1. Fragment inside your Bicep template
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
// Inside a resource declaration:
name: '${applicationName}-${resourceToken}'
```

```bash
# 2. Change environment name
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Delete ONLY a disposable environment after inspecting it and backing up data
azd down
```

### 문제: 위치/지역 사용 불가
**증상:**
- "위치 'xyz' 는 리소스 유형에 사용할 수 없습니다"
- 선택한 지역에서 특정 SKU 사용 불가

**해결책:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

위치 변수를 변경해도 기존 리소스가 이동하지 않습니다. 기존 리소스 그룹이나 리소스는 위치 변경을 거부할 수 있으므로, 지역 재배포를 위해 별도의 환경을 사용하세요.

### 문제: 할당량 초과 오류
**증상:**
- "리소스 유형에 대한 할당량 초과"
- "최대 리소스 개수 도달"

**해결책:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

개발 시 `infra/main.parameters.json`에서 지원되는 더 작은 SKU를 선택하세요:

```json
{
  "appServiceSku": {
    "value": "B1"
  }
}
```

```bash
# 4. Clean up unused resources
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 문제: Bicep 템플릿 오류
**증상:**
- 템플릿 유효성 검사 실패
- Bicep 파일 문법 오류

**해결책:**
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

**해결책:**
```bash
# 1. Check build output with debug flag
azd deploy web --debug

# 2. View deployed service status
azd show

# 3. Test build locally
cd src/web
npm install
npm run build

# 3. Check Node.js/Python version compatibility
node --version  # Should match azure.yaml settings
python --version

# 4. Clear build cache
# Preserve the committed dependency lock for reproducibility
npm ci

# 5. Check Dockerfile if using containers
docker build -t test-image .
docker run --rm test-image
```

### 문제: 컨테이너 배포 실패
**증상:**
- 컨테이너 앱 시작 실패
- 이미지 가져오기 오류

**해결책:**
```bash
# 1. Test Docker build locally
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Check container logs using Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor application through azd
azd monitor --logs

# 3. Verify container registry access
az acr login --name myregistry

# 4. Check container app configuration
az containerapp show --name my-app --resource-group my-rg
```

### 문제: 데이터베이스 연결 실패
**증상:**
- 애플리케이션이 데이터베이스 연결 실패
- 연결 시간 초과 오류

**해결책:**
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

### 문제: 환경 변수 작동 안 함
**증상:**
- 앱이 구성 값을 읽지 못함
- 환경 변수가 비어 있음

**해결책:**
```bash
# 1. Verify environment variables are set
azd env get-values
azd env get-value DATABASE_URL

# 2. Check how your Bicep/template maps values into the deployed app.
# azd env set updates local environment values; it does not directly update runtime settings.

# 3. Restart the application
azd deploy web

# 4. Check app service configuration
az webapp config appsettings list --name myapp --resource-group myrg
```

### 문제: SSL/TLS 인증서 문제
**증상:**
- HTTPS 작동 안 함
- 인증서 검증 오류

**해결책:**
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
- 프론트엔드가 API 호출 불가
- 교차 출처 요청 차단됨

**해결책:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. 기존 Express 애플리케이션 업데이트( `cors` 임포트 포함 ):

```javascript
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));
```

```bash
# 3. Check if running on correct URLs
azd show
```

## 🌍 환경 관리 문제

### 문제: 환경 전환 문제
**증상:**
- 잘못된 환경 사용
- 구성 전환이 제대로 되지 않음

**해결책:**
```bash
# 1. List all environments
azd env list

# 2. Explicitly select environment
azd env select production

# 3. Verify current environment
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### 문제: 환경 손상
**증상:**
- 환경이 잘못된 상태 표시
- 리소스가 구성과 일치하지 않음

**해결책:**
```bash
# 1. Refresh environment state
azd env refresh

# 2. Reset environment configuration
azd env new production-reset
# Copy over required environment variables
azd env set DATABASE_URL "your-value"

# 3. azd env refresh reads outputs of a previous deployment; it does not
# import arbitrary existing resources or reconcile template drift.
# To adopt resources, use the template's documented existing-resource parameters.
```

## 🔍 성능 문제

### 문제: 배포 시간 지연
**증상:**
- 배포가 너무 오래 걸림
- 배포 중 타임아웃

**해결책:**
```bash
# 1. Deploy specific services for faster iteration
azd deploy web
azd deploy api

# 2. Use code-only deployment when infrastructure unchanged
azd deploy  # Faster than azd up

# 3. Optimize the project's actual build script and image layers.

# 4. Check resource locations (use same region)
# Do not change AZURE_LOCATION to fix the latency of an existing deployment.
```

### 문제: 애플리케이션 성능 문제
**증상:**
- 응답 시간 느림
- 높은 리소스 사용량

**해결책:**
```bash
# 1. Scale up resources
# Update the SKU parameter in infra/main.parameters.json, then review and
# provision infrastructure changes. azd deploy alone does not apply SKU changes.
azd provision --preview

# 2. Enable Application Insights monitoring
azd monitor --overview

# 3. Check application logs in Azure
az webapp log tail --name myapp --resource-group myrg
# or for Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implement caching
# Add Redis cache to your infrastructure
```

## 🛠️ 문제 해결 도구 및 명령어

### 디버그 명령어
```bash
# Comprehensive debugging
# Only rerun a mutating command when retrying is appropriate.
azd show --debug

# Check azd version
azd version

# View current configuration
azd config show

# Test connectivity
curl -v https://myapp.azurewebsites.net/health
```

### 로그 분석
```bash
# Application logs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor application with azd
azd monitor --logs
azd monitor --live

# Azure resource logs
az monitor activity-log list --resource-group myrg --offset 1h --max-events 50

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

## 🆘 추가 지원 받기

### 에스컬레이션 시기
- 모든 해결책 시도 후에도 인증 문제 지속
- Azure 서비스 관련 인프라 문제
- 청구 또는 구독 관련 문제
- 보안 우려 또는 사고

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
지원 요청 전 수집할 사항:
- `azd version` 출력
- `azd config show` 출력
- `azd show` 출력 (현재 배포 상태)
- 오류 메시지 (전체 텍스트)
- 문제 재현 단계
- 편집된 환경 세부사항 (비밀이 포함될 수 있는 `azd env get-values` 원본은 절대 공유 금지)
- 문제가 시작된 시점 타임라인

### 로그 수집 스크립트
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
# Do not collect environment values automatically: they can contain credentials.

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 문제 예방

### 배포 전 점검 목록
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
```bicep
// Illustrative fragment, not a complete resource definition:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}
```

```bash
# Example App Service PLAN CPU alert (not a site metric)
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/serverfarms/myplan \
  --condition "avg CpuPercentage > 80"
```

### 정기 유지보수
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## 관련 자료

- [디버깅 가이드](debugging.md) - 고급 디버깅 기법
- [리소스 프로비저닝](../chapter-04-infrastructure/provisioning.md) - 인프라 문제 해결
- [용량 계획](../chapter-06-pre-deployment/capacity-planning.md) - 리소스 계획 안내
- [SKU 선택](../chapter-06-pre-deployment/sku-selection.md) - 서비스 등급 권장 사항

---

<strong>팁</strong>: 이 가이드를 북마크해두고 문제가 발생할 때마다 참고하세요. 대부분 문제는 이전에 발생했고 검증된 해결책이 있습니다!

---

<strong>탐색</strong>
- **이전 강의**: [리소스 프로비저닝](../chapter-04-infrastructure/provisioning.md)
- **다음 강의**: [디버깅 가이드](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 기하기 위해 노력하고 있으나, 자동 번역은 오류나 부정확한 부분이 있을 수 있음을 유의하시기 바랍니다. 원본 문서의 원어본이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문가의 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->