# 자주 발생하는 문제 및 해결 방법

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: 제7장 - 문제 해결 및 디버깅
- **⬅️ Previous Chapter**: [제6장: 사전 점검](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [디버깅 가이드](debugging.md)
- **🚀 Next Chapter**: [제8장: 운영 및 엔터프라이즈 패턴](../chapter-08-production/production-ai-practices.md)

## 소개

이 종합적인 문제 해결 가이드는 Azure Developer CLI 사용 시 자주 발생하는 문제들을 다룹니다. 인증, 배포, 인프라 프로비저닝 및 애플리케이션 구성과 관련된 일반적인 문제를 진단하고 해결하는 방법을 배우세요. 각 문제에는 자세한 증상, 근본 원인 및 단계별 해결 절차가 포함되어 있습니다.

## 학습 목표

이 가이드를 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI 문제에 대한 진단 기법 습득
- 일반적인 인증 및 권한 문제와 그 해결 방법 이해
- 배포 실패, 인프라 프로비저닝 오류 및 구성 문제 해결
- 사전 모니터링 및 디버깅 전략 구현
- 복잡한 문제에 대한 체계적인 문제 해결 방법론 적용
- 향후 문제를 방지하기 위한 적절한 로깅 및 모니터링 구성

## 학습 성과

완료 후 다음을 수행할 수 있습니다:
- 내장 진단 도구를 사용하여 Azure Developer CLI 문제 진단
- 인증, 구독 및 권한 관련 문제를 독립적으로 해결
- 배포 실패 및 인프라 프로비저닝 오류를 효과적으로 문제 해결
- 애플리케이션 구성 문제 및 환경별 문제 디버깅
- 잠재적 문제를 사전에 식별하기 위한 모니터링 및 경고 구현
- 로깅, 디버깅 및 문제 해결 워크플로우에 대한 모범 사례 적용

## 빠른 진단

특정 문제로 들어가기 전에 진단 정보를 수집하려면 다음 명령을 실행하세요:

```bash
# azd 버전 및 상태 확인
azd version
azd config list

# Azure 인증 확인
az account show
az account list

# 현재 환경 확인
azd env show
azd env get-values

# 디버그 로깅 활성화
export AZD_DEBUG=true
azd <command> --debug
```

## 인증 문제

### 문제: "Failed to get access token"
**증상:**
- `azd up`가 인증 오류로 실패함
- 명령이 "unauthorized" 또는 "access denied"를 반환함

**해결 방법:**
```bash
# 1. Azure CLI로 다시 인증
az login
az account show

# 2. 캐시된 자격 증명 지우기
az account clear
az login

# 3. 디바이스 코드 흐름 사용 (헤드리스 시스템용)
az login --use-device-code

# 4. 명시적 구독 설정
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 문제: 배포 중 "Insufficient privileges"
**증상:**
- 권한 오류로 배포 실패
- 특정 Azure 리소스를 생성할 수 없음

**해결 방법:**
```bash
# 1. Azure 역할 할당을 확인하세요
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 필요한 역할이 있는지 확인하세요
# - Contributor (리소스 생성용)
# - User Access Administrator (역할 할당용)

# 3. 적절한 권한을 위해 Azure 관리자에게 문의하세요
```

### 문제: 다중 테넌트 인증 문제
**해결 방법:**
```bash
# 1. 특정 테넌트로 로그인
az login --tenant "your-tenant-id"

# 2. 구성에서 테넌트 설정
azd config set auth.tenantId "your-tenant-id"

# 3. 테넌트를 전환하는 경우 테넌트 캐시 삭제
az account clear
```

## 🏗️ 인프라 프로비저닝 오류

### 문제: 리소스 이름 충돌
**증상:**
- "The resource name already exists" 오류
- 리소스 생성 중 배포 실패

**해결 방법:**
```bash
# 1. 토큰을 사용하여 고유한 리소스 이름을 지정하세요
# Bicep 템플릿에서:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 환경 이름을 변경하세요
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 기존 리소스를 정리하세요
azd down --force --purge
```

### 문제: 위치/지역 사용 불가
**증상:**
- "The location 'xyz' is not available for resource type"
- 선택한 지역에서 특정 SKU를 사용할 수 없음

**해결 방법:**
```bash
# 1. 리소스 유형에 사용 가능한 위치를 확인하세요
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 일반적으로 사용 가능한 지역을 사용하세요
azd config set defaults.location eastus2
# 또는
azd env set AZURE_LOCATION eastus2

# 3. 지역별 서비스 가용성을 확인하세요
# 방문: https://azure.microsoft.com/global-infrastructure/services/
```

### 문제: 쿼터 초과 오류
**증상:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**해결 방법:**
```bash
# 1. 현재 쿼터 사용량 확인
az vm list-usage --location eastus2 -o table

# 2. Azure 포털에서 쿼터 증가 요청
# 다음으로 이동: 구독 > 사용량 + 쿼터

# 3. 개발용으로 더 작은 SKU 사용
# main.parameters.json에서:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. 사용하지 않는 리소스 정리
az resource list --query "[?contains(name, 'unused')]" -o table
```

### 문제: Bicep 템플릿 오류
**증상:**
- 템플릿 유효성 검사 실패
- Bicep 파일의 구문 오류

**해결 방법:**
```bash
# 1. Bicep 구문 유효성 검사
az bicep build --file infra/main.bicep

# 2. Bicep 린터 사용
az bicep lint --file infra/main.bicep

# 3. 매개변수 파일 구문 확인
cat infra/main.parameters.json | jq '.'

# 4. 배포 변경 사항 미리보기
azd provision --preview
```

## 🚀 배포 실패

### 문제: 빌드 실패
**증상:**
- 배포 중 애플리케이션 빌드 실패
- 패키지 설치 오류

**해결 방법:**
```bash
# 1. 디버그 플래그로 빌드 출력을 확인
azd deploy --service web --debug

# 2. 배포된 서비스 상태를 확인
azd show

# 3. 로컬에서 빌드 테스트
cd src/web
npm install
npm run build

# 3. Node.js/Python 버전 호환성 확인
node --version  # azure.yaml 설정과 일치해야 함
python --version

# 4. 빌드 캐시 비우기
rm -rf node_modules package-lock.json
npm install

# 5. 컨테이너를 사용하는 경우 Dockerfile 확인
docker build -t test-image .
docker run --rm test-image
```

### 문제: 컨테이너 배포 실패
**증상:**
- 컨테이너 앱이 시작되지 않음
- 이미지 풀 오류

**해결 방법:**
```bash
# 1. Docker 빌드를 로컬에서 테스트
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Azure CLI를 사용하여 컨테이너 로그 확인
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. azd를 통해 애플리케이션 모니터링
azd monitor --logs

# 3. 컨테이너 레지스트리 액세스 확인
az acr login --name myregistry

# 4. 컨테이너 앱 구성 확인
az containerapp show --name my-app --resource-group my-rg
```

### 문제: 데이터베이스 연결 실패
**증상:**
- 애플리케이션이 데이터베이스에 연결할 수 없음
- 연결 타임아웃 오류

**해결 방법:**
```bash
# 1. 데이터베이스 방화벽 규칙 확인
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. 애플리케이션에서 연결 테스트
# 앱에 일시적으로 추가:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 연결 문자열 형식 확인
azd env get-values | grep DATABASE

# 4. 데이터베이스 서버 상태 확인
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 구성 문제

### 문제: 환경 변수가 작동하지 않음
**증상:**
- 앱이 구성 값을 읽지 못함
- 환경 변수가 비어 있는 것처럼 보임

**해결 방법:**
```bash
# 1. 환경 변수가 설정되어 있는지 확인하세요
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml의 변수 이름을 확인하세요
cat azure.yaml | grep -A 5 env:

# 3. 애플리케이션을 재시작하세요
azd deploy --service web

# 4. 앱 서비스 구성을 확인하세요
az webapp config appsettings list --name myapp --resource-group myrg
```

### 문제: SSL/TLS 인증서 문제
**증상:**
- HTTPS 작동 안 함
- 인증서 검증 오류

**해결 방법:**
```bash
# 1. SSL 인증서 상태 확인
az webapp config ssl list --resource-group myrg

# 2. HTTPS만 사용하도록 설정
az webapp update --name myapp --resource-group myrg --https-only true

# 3. 필요하면 맞춤 도메인 추가
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 문제: CORS 구성 문제
**증상:**
- 프런트엔드가 API를 호출할 수 없음
- 교차 출처 요청이 차단됨

**해결 방법:**
```bash
# 1. App Service용 CORS 구성
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. API를 CORS를 처리할 수 있도록 업데이트
# Express.js에서:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. 올바른 URL에서 실행 중인지 확인
azd show
```

## 🌍 환경 관리 문제

### 문제: 환경 전환 문제
**증상:**
- 잘못된 환경이 사용됨
- 구성이 제대로 전환되지 않음

**해결 방법:**
```bash
# 1. 모든 환경을 나열
azd env list

# 2. 환경을 명시적으로 선택
azd env select production

# 3. 현재 환경을 확인
azd env show

# 4. 손상된 경우 새 환경을 생성
azd env new production-new
azd env select production-new
```

### 문제: 환경 손상
**증상:**
- 환경이 유효하지 않은 상태로 표시됨
- 리소스가 구성과 일치하지 않음

**해결 방법:**
```bash
# 1. 환경 상태 새로 고침
azd env refresh

# 2. 환경 구성을 재설정
azd env new production-reset
# 필요한 환경 변수를 복사
azd env set DATABASE_URL "your-value"

# 3. 기존 리소스 가져오기(가능한 경우)
# .azure/production/config.json을 리소스 ID로 수동 업데이트
```

## 🔍 성능 문제

### 문제: 배포 시간이 느림
**증상:**
- 배포가 너무 오래 걸림
- 배포 중 타임아웃 발생

**해결 방법:**
```bash
# 1. 더 빠른 반복을 위해 특정 서비스만 배포
azd deploy --service web
azd deploy --service api

# 2. 인프라가 변경되지 않았을 때 코드 전용 배포 사용
azd deploy  # azd up보다 빠름

# 3. 빌드 프로세스 최적화
# package.json에서:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. 리소스 위치 확인(같은 리전 사용)
azd config set defaults.location eastus2
```

### 문제: 애플리케이션 성능 문제
**증상:**
- 응답 시간이 느림
- 높은 자원 사용

**해결 방법:**
```bash
# 1. 리소스 확장
# main.parameters.json에서 SKU를 업데이트:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights 모니터링 활성화
azd monitor --overview

# 3. Azure에서 애플리케이션 로그 확인
az webapp log tail --name myapp --resource-group myrg
# 또는 Container Apps의 경우:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. 캐시 구현
# 인프라에 Redis 캐시 추가
```

## 🛠️ 문제 해결 도구 및 명령

### 디버그 명령
```bash
# 포괄적인 디버깅
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# azd 버전 확인
azd version

# 현재 구성 보기
azd config list

# 연결 테스트
curl -v https://myapp.azurewebsites.net/health
```

### 로그 분석
```bash
# Azure CLI를 통한 애플리케이션 로그
az webapp log tail --name myapp --resource-group myrg

# azd로 애플리케이션 모니터링
azd monitor --logs
azd monitor --live

# Azure 리소스 로그
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# 컨테이너 로그 (Container Apps용)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### 리소스 조사
```bash
# 모든 리소스 나열
az resource list --resource-group myrg -o table

# 리소스 상태 확인
az webapp show --name myapp --resource-group myrg --query state

# 네트워크 진단
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 추가 도움 받기

### 에스컬레이션 시점
- 모든 해결 방법을 시도한 후에도 인증 문제가 지속되는 경우
- Azure 서비스 관련 인프라 문제
- 결제 또는 구독 관련 문제
- 보안 문제 또는 사고

### 지원 채널
```bash
# 1. Azure 서비스 상태 확인
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure 지원 티켓 생성
# 다음으로 이동: https://portal.azure.com -> 도움말 및 지원

# 3. 커뮤니티 리소스
# - Stack Overflow: azure-developer-cli 태그
# - GitHub 이슈: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 수집할 정보
지원에 연락하기 전에 다음을 수집하세요:
- `azd version` 출력
- `azd config list` 출력
- `azd show` 출력 (현재 배포 상태)
- 오류 메시지(전체 텍스트)
- 문제를 재현하는 단계
- 환경 세부 정보 (`azd env show`)
- 문제가 시작된 시점의 타임라인

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
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 문제 예방

### 배포 전 체크리스트
```bash
# 1. 인증을 검증합니다
az account show

# 2. 할당량 및 한도를 확인합니다
az vm list-usage --location eastus2

# 3. 템플릿을 검증합니다
az bicep build --file infra/main.bicep

# 4. 먼저 로컬에서 테스트합니다
npm run build
npm run test

# 5. 모의 배포(dry-run)를 사용합니다
azd provision --preview
```

### 모니터링 설정
```bash
# Application Insights 활성화
# main.bicep에 추가:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# 알림 설정
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### 정기 유지보수
```bash
# 주간 건강 점검
./scripts/health-check.sh

# 월간 비용 검토
az consumption usage list --billing-period-name 202401

# 분기별 보안 검토
az security assessment list --resource-group myrg
```

## 관련 자료

- [디버깅 가이드](debugging.md) - 고급 디버깅 기법
- [리소스 프로비저닝](../chapter-04-infrastructure/provisioning.md) - 인프라 문제 해결
- [용량 계획](../chapter-06-pre-deployment/capacity-planning.md) - 리소스 계획 가이드
- [SKU 선택](../chapter-06-pre-deployment/sku-selection.md) - 서비스 등급 권장사항

---

**팁**: 이 가이드를 즐겨찾기에 추가하고 문제가 발생할 때마다 참고하세요. 대부분의 문제는 이전에 발생했던 사례가 있으며 확립된 해결책이 있습니다!

---

**탐색**
- **이전 레슨**: [리소스 프로비저닝](../chapter-04-infrastructure/provisioning.md)
- **다음 레슨**: [디버깅 가이드](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
면책 고지:
이 문서는 AI 번역 서비스 'Co-op Translator' (https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있으나 자동 번역에는 오류나 부정확성이 있을 수 있습니다. 원문(원어 문서)을 권위 있는 출처로 간주하시기 바랍니다. 중요한 정보의 경우 전문 번역가에 의한 번역을 권장합니다. 본 번역의 사용으로 인해 발생하는 오해나 잘못된 해석에 대해서는 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->