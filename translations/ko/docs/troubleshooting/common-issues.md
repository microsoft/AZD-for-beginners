# 일반적인 문제와 해결 방법

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 7 - 문제 해결 및 디버깅
- **⬅️ 이전 챕터**: [챕터 6: 사전 점검](../pre-deployment/preflight-checks.md)
- **➡️ 다음**: [디버깅 가이드](debugging.md)
- **🚀 다음 챕터**: [챕터 8: 프로덕션 및 엔터프라이즈 패턴](../microsoft-foundry/production-ai-practices.md)

## 소개

이 포괄적인 문제 해결 가이드는 Azure Developer CLI를 사용할 때 자주 발생하는 문제를 다룹니다. 인증, 배포, 인프라 프로비저닝 및 애플리케이션 구성과 관련된 일반적인 문제를 진단, 해결 및 처리하는 방법을 배울 수 있습니다. 각 문제는 상세한 증상, 근본 원인 및 단계별 해결 절차를 포함합니다.

## 학습 목표

이 가이드를 완료하면 다음을 할 수 있습니다:
- Azure Developer CLI 문제에 대한 진단 기술 숙달
- 일반적인 인증 및 권한 문제와 그 해결 방법 이해
- 배포 실패, 인프라 프로비저닝 오류 및 구성 문제 해결
- 사전 모니터링 및 디버깅 전략 구현
- 복잡한 문제에 대한 체계적인 문제 해결 방법론 적용
- 향후 문제를 방지하기 위한 적절한 로깅 및 모니터링 구성

## 학습 결과

완료 후, 다음을 수행할 수 있습니다:
- Azure Developer CLI 문제를 내장된 진단 도구를 사용하여 진단
- 인증, 구독 및 권한 관련 문제를 독립적으로 해결
- 배포 실패 및 인프라 프로비저닝 오류를 효과적으로 해결
- 애플리케이션 구성 문제 및 환경별 문제 디버깅
- 잠재적 문제를 사전에 식별하기 위한 모니터링 및 알림 구현
- 로깅, 디버깅 및 문제 해결 워크플로우에 대한 모범 사례 적용

## 빠른 진단

특정 문제를 다루기 전에, 다음 명령을 실행하여 진단 정보를 수집하세요:

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

### 문제: "액세스 토큰을 가져오지 못했습니다"
**증상:**
- `azd up`이 인증 오류로 실패
- 명령이 "권한 없음" 또는 "액세스 거부"를 반환

**해결 방법:**
```bash
# 1. Azure CLI로 다시 인증
az login
az account show

# 2. 캐시된 자격 증명 삭제
az account clear
az login

# 3. 디바이스 코드 흐름 사용 (헤드리스 시스템용)
az login --use-device-code

# 4. 명시적 구독 설정
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### 문제: 배포 중 "권한 부족"
**증상:**
- 배포가 권한 오류로 실패
- 특정 Azure 리소스를 생성할 수 없음

**해결 방법:**
```bash
# 1. Azure 역할 할당을 확인하세요
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. 필요한 역할이 있는지 확인하세요
# - 기여자 (리소스 생성용)
# - 사용자 액세스 관리자 (역할 할당용)

# 3. 적절한 권한을 위해 Azure 관리자에게 문의하세요
```

### 문제: 멀티 테넌트 인증 문제
**해결 방법:**
```bash
# 1. 특정 테넌트로 로그인
az login --tenant "your-tenant-id"

# 2. 설정에서 테넌트 설정
azd config set auth.tenantId "your-tenant-id"

# 3. 테넌트를 전환할 경우 테넌트 캐시 지우기
az account clear
```

## 🏗️ 인프라 프로비저닝 오류

### 문제: 리소스 이름 충돌
**증상:**
- "리소스 이름이 이미 존재합니다" 오류
- 리소스 생성 중 배포 실패

**해결 방법:**
```bash
# 1. 고유한 리소스 이름에 토큰 사용
# Bicep 템플릿에서:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. 환경 이름 변경
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. 기존 리소스 정리
azd down --force --purge
```

### 문제: 위치/지역 사용 불가
**증상:**
- "리소스 유형에 대해 위치 'xyz'를 사용할 수 없습니다"
- 선택한 지역에서 특정 SKU 사용 불가

**해결 방법:**
```bash
# 1. 리소스 유형에 대한 사용 가능한 위치 확인
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. 일반적으로 사용 가능한 지역 사용
azd config set defaults.location eastus2
# 또는
azd env set AZURE_LOCATION eastus2

# 3. 지역별 서비스 가용성 확인
# 방문: https://azure.microsoft.com/global-infrastructure/services/
```

### 문제: 할당량 초과 오류
**증상:**
- "리소스 유형에 대한 할당량 초과"
- "최대 리소스 수에 도달"

**해결 방법:**
```bash
# 1. 현재 할당량 사용량 확인
az vm list-usage --location eastus2 -o table

# 2. Azure 포털을 통해 할당량 증가 요청
# 이동 경로: 구독 > 사용량 + 할당량

# 3. 개발을 위해 더 작은 SKU 사용
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

# 4. 배포 변경 사항 미리 보기
azd provision --preview
```

## 🚀 배포 실패

### 문제: 빌드 실패
**증상:**
- 배포 중 애플리케이션 빌드 실패
- 패키지 설치 오류

**해결 방법:**
```bash
# 1. 빌드 로그 확인
azd logs --service web
azd deploy --service web --debug

# 2. 로컬에서 빌드 테스트
cd src/web
npm install
npm run build

# 3. Node.js/Python 버전 호환성 확인
node --version  # azure.yaml 설정과 일치해야 함
python --version

# 4. 빌드 캐시 삭제
rm -rf node_modules package-lock.json
npm install

# 5. 컨테이너를 사용하는 경우 Dockerfile 확인
docker build -t test-image .
docker run --rm test-image
```

### 문제: 컨테이너 배포 실패
**증상:**
- 컨테이너 앱이 시작되지 않음
- 이미지 가져오기 오류

**해결 방법:**
```bash
# 1. 로컬에서 Docker 빌드 테스트
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. 컨테이너 로그 확인
azd logs --service api --follow

# 3. 컨테이너 레지스트리 접근 확인
az acr login --name myregistry

# 4. 컨테이너 앱 구성 확인
az containerapp show --name my-app --resource-group my-rg
```

### 문제: 데이터베이스 연결 실패
**증상:**
- 애플리케이션이 데이터베이스에 연결할 수 없음
- 연결 시간 초과 오류

**해결 방법:**
```bash
# 1. 데이터베이스 방화벽 규칙 확인
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. 애플리케이션에서 연결 테스트
# 앱에 임시로 추가:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. 연결 문자열 형식 확인
azd env get-values | grep DATABASE

# 4. 데이터베이스 서버 상태 확인
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 구성 문제

### 문제: 환경 변수 작동 안 함
**증상:**
- 앱이 구성 값을 읽을 수 없음
- 환경 변수가 비어 있음

**해결 방법:**
```bash
# 1. 환경 변수가 설정되었는지 확인
azd env get-values
azd env get DATABASE_URL

# 2. azure.yaml에서 변수 이름 확인
cat azure.yaml | grep -A 5 env:

# 3. 애플리케이션 재시작
azd deploy --service web

# 4. 앱 서비스 구성 확인
az webapp config appsettings list --name myapp --resource-group myrg
```

### 문제: SSL/TLS 인증서 문제
**증상:**
- HTTPS 작동 안 함
- 인증서 유효성 검사 오류

**해결 방법:**
```bash
# 1. SSL 인증서 상태 확인
az webapp config ssl list --resource-group myrg

# 2. HTTPS만 활성화
az webapp update --name myapp --resource-group myrg --https-only true

# 3. 사용자 지정 도메인 추가 (필요한 경우)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### 문제: CORS 구성 문제
**증상:**
- 프론트엔드가 API를 호출할 수 없음
- 크로스 오리진 요청 차단

**해결 방법:**
```bash
# 1. App Service에 대한 CORS 구성
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. CORS를 처리하도록 API 업데이트
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
# 1. 모든 환경 나열
azd env list

# 2. 환경을 명시적으로 선택
azd env select production

# 3. 현재 환경 확인
azd env show

# 4. 손상된 경우 새 환경 생성
azd env new production-new
azd env select production-new
```

### 문제: 환경 손상
**증상:**
- 환경이 잘못된 상태로 표시됨
- 리소스가 구성과 일치하지 않음

**해결 방법:**
```bash
# 1. 환경 상태 새로 고침
azd env refresh

# 2. 환경 구성 재설정
azd env new production-reset
# 필요한 환경 변수를 복사
azd env set DATABASE_URL "your-value"

# 3. 기존 리소스 가져오기 (가능한 경우)
# 리소스 ID로 .azure/production/config.json 수동 업데이트
```

## 🔍 성능 문제

### 문제: 느린 배포 시간
**증상:**
- 배포 시간이 너무 오래 걸림
- 배포 중 시간 초과

**해결 방법:**
```bash
# 1. 병렬 배포 활성화
azd config set deploy.parallelism 5

# 2. 점진적 배포 사용
azd deploy --incremental

# 3. 빌드 프로세스 최적화
# package.json에서:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. 리소스 위치 확인 (같은 지역 사용)
azd config set defaults.location eastus2
```

### 문제: 애플리케이션 성능 문제
**증상:**
- 느린 응답 시간
- 높은 리소스 사용량

**해결 방법:**
```bash
# 1. 리소스 확장
# main.parameters.json에서 SKU 업데이트:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Application Insights 모니터링 활성화
azd monitor

# 3. 애플리케이션 로그에서 병목 현상 확인
azd logs --service api --follow

# 4. 캐싱 구현
# 인프라에 Redis 캐시 추가
```

## 🛠️ 문제 해결 도구 및 명령

### 디버그 명령
```bash
# 포괄적인 디버깅
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# 시스템 정보 확인
azd info

# 구성 유효성 검사
azd config validate

# 연결 테스트
curl -v https://myapp.azurewebsites.net/health
```

### 로그 분석
```bash
# 애플리케이션 로그
azd logs --service web --follow
azd logs --service api --since 1h

# Azure 리소스 로그
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# 컨테이너 로그 (컨테이너 앱용)
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
- 모든 해결 방법을 시도한 후에도 인증 문제가 지속될 때
- Azure 서비스와 관련된 인프라 문제
- 청구 또는 구독 관련 문제
- 보안 문제 또는 사고

### 지원 채널
```bash
# 1. Azure 서비스 상태 확인
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Azure 지원 티켓 생성
# 이동: https://portal.azure.com -> 도움말 + 지원

# 3. 커뮤니티 리소스
# - Stack Overflow: azure-developer-cli 태그
# - GitHub 이슈: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### 수집할 정보
지원팀에 연락하기 전에 다음 정보를 수집하세요:
- `azd version` 출력
- `azd info` 출력
- 오류 메시지 (전체 텍스트)
- 문제를 재현하는 단계
- 환경 세부 정보 (`azd env show`)
- 문제 시작 시점의 타임라인

### 로그 수집 스크립트
```bash
#!/bin/bash
# 디버그 정보를 수집하는 스크립트입니다.

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

### 사전 배포 체크리스트
```bash
# 1. 인증 확인
az account show

# 2. 할당량 및 제한 확인
az vm list-usage --location eastus2

# 3. 템플릿 확인
az bicep build --file infra/main.bicep

# 4. 먼저 로컬에서 테스트
npm run build
npm run test

# 5. 드라이런 배포 사용
azd provision --preview
```

### 모니터링 설정
```bash
# 애플리케이션 인사이트 활성화
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

## 관련 리소스

- [디버깅 가이드](debugging.md) - 고급 디버깅 기술
- [리소스 프로비저닝](../deployment/provisioning.md) - 인프라 문제 해결
- [용량 계획](../pre-deployment/capacity-planning.md) - 리소스 계획 가이드
- [SKU 선택](../pre-deployment/sku-selection.md) - 서비스 계층 추천

---

**팁**: 이 가이드를 북마크해 두고 문제가 발생할 때마다 참조하세요. 대부분의 문제는 이미 경험된 적이 있으며 확립된 해결 방법이 있습니다!

---

**탐색**
- **이전 레슨**: [리소스 프로비저닝](../deployment/provisioning.md)
- **다음 레슨**: [디버깅 가이드](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서를 해당 언어로 작성된 상태에서 권위 있는 자료로 간주해야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->