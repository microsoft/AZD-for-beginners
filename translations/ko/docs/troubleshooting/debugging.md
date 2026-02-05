# AZD 배포 디버깅 가이드

**챕터 탐색:**
- **📚 코스 홈**: [AZD 초보자용](../../README.md)
- **📖 현재 챕터**: 챕터 7 - 문제 해결 및 디버깅
- **⬅️ 이전**: [일반적인 문제](common-issues.md)
- **➡️ 다음**: [AI 관련 문제 해결](ai-troubleshooting.md)
- **🚀 다음 챕터**: [챕터 8: 프로덕션 및 엔터프라이즈 패턴](../microsoft-foundry/production-ai-practices.md)

## 소개

이 포괄적인 가이드는 Azure Developer CLI 배포와 관련된 복잡한 문제를 진단하고 해결하기 위한 고급 디버깅 전략, 도구 및 기술을 제공합니다. 체계적인 문제 해결 방법론, 로그 분석 기술, 성능 프로파일링 및 고급 진단 도구를 배워 배포 및 런타임 문제를 효율적으로 해결하세요.

## 학습 목표

이 가이드를 완료하면 다음을 배울 수 있습니다:
- Azure Developer CLI 문제에 대한 체계적인 디버깅 방법론 숙달
- 고급 로그 구성 및 로그 분석 기술 이해
- 성능 프로파일링 및 모니터링 전략 구현
- 복잡한 문제 해결을 위한 Azure 진단 도구 및 서비스 사용
- 네트워크 디버깅 및 보안 문제 해결 기술 적용
- 사전 문제 감지를 위한 포괄적인 모니터링 및 알림 구성

## 학습 결과

완료 후, 다음을 수행할 수 있습니다:
- TRIAGE 방법론을 적용하여 복잡한 배포 문제를 체계적으로 디버깅
- 포괄적인 로그 및 추적 정보를 구성하고 분석
- Azure Monitor, Application Insights 및 진단 도구를 효과적으로 사용
- 네트워크 연결, 인증 및 권한 문제를 독립적으로 디버깅
- 성능 모니터링 및 최적화 전략 구현
- 반복적인 문제를 위한 맞춤형 디버깅 스크립트 및 자동화 생성

## 디버깅 방법론

### TRIAGE 접근법
- **T**ime: 문제가 언제 시작되었나요?
- **R**eproduce: 문제를 일관되게 재현할 수 있나요?
- **I**solate: 어떤 구성 요소가 실패하고 있나요?
- **A**nalyze: 로그에서 무엇을 알 수 있나요?
- **G**ather: 관련 정보를 모두 수집하세요
- **E**scalate: 추가 도움을 요청해야 할 때는 언제인가요?

## 디버그 모드 활성화

### 환경 변수
```bash
# 포괄적인 디버깅 활성화
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Azure CLI 디버깅
export AZURE_CLI_DIAGNOSTICS=true

# 더 깔끔한 출력을 위해 텔레메트리 비활성화
export AZD_DISABLE_TELEMETRY=true
```

### 디버그 구성
```bash
# 디버그 구성을 전역적으로 설정
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# 추적 로깅 활성화
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 로그 분석 기술

### 로그 레벨 이해
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### 구조화된 로그 분석
```bash
# 로그를 레벨별로 필터링
azd logs --level error --since 1h

# 서비스를 기준으로 필터링
azd logs --service api --level debug

# 분석을 위해 로그 내보내기
azd logs --output json > deployment-logs.json

# jq로 JSON 로그 파싱
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### 로그 상관 관계
```bash
#!/bin/bash
# correlate-logs.sh - 서비스 간 로그 상관 관계

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# 모든 서비스에서 검색
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Azure 로그 검색
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ 고급 디버깅 도구

### Azure Resource Graph 쿼리
```bash
# 태그로 리소스 조회
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# 실패한 배포 찾기
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# 리소스 상태 확인
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### 네트워크 디버깅
```bash
# 서비스 간 연결 테스트
test_connectivity() {
    local source=$1
    local dest=$2
    local port=$3
    
    echo "Testing connectivity from $source to $dest:$port"
    
    az network watcher test-connectivity \
        --source-resource "$source" \
        --dest-address "$dest" \
        --dest-port "$port" \
        --output table
}

# 사용법
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### 컨테이너 디버깅
```bash
# 디버그 컨테이너 앱 문제
debug_container() {
    local app_name=$1
    local resource_group=$2
    
    echo "=== Container App Status ==="
    az containerapp show --name "$app_name" --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,runningState:runningState}"
    
    echo "=== Container App Revisions ==="
    az containerapp revision list --name "$app_name" --resource-group "$resource_group" \
        --query "[].{name:name,active:properties.active,createdTime:properties.createdTime}"
    
    echo "=== Container Logs ==="
    az containerapp logs show --name "$app_name" --resource-group "$resource_group" --follow
}
```

### 데이터베이스 연결 디버깅
```bash
# 데이터베이스 연결 디버그
debug_database() {
    local db_server=$1
    local db_name=$2
    
    echo "=== Database Server Status ==="
    az postgres flexible-server show --name "$db_server" --resource-group "$resource_group" \
        --query "{state:state,version:version,location:location}"
    
    echo "=== Firewall Rules ==="
    az postgres flexible-server firewall-rule list --name "$db_server" --resource-group "$resource_group"
    
    echo "=== Connection Test ==="
    timeout 10 bash -c "</dev/tcp/$db_server.postgres.database.azure.com/5432" && echo "Port 5432 is open" || echo "Port 5432 is closed"
}
```

## 🔬 성능 디버깅

### 애플리케이션 성능 모니터링
```bash
# 애플리케이션 인사이트 디버깅 활성화
export APPLICATIONINSIGHTS_CONFIGURATION_CONTENT='{
  "role": {
    "name": "myapp-debug"
  },
  "sampling": {
    "percentage": 100
  },
  "instrumentation": {
    "logging": {
      "level": "DEBUG"
    }
  }
}'

# 사용자 지정 성능 모니터링
monitor_performance() {
    local endpoint=$1
    local duration=${2:-60}
    
    echo "Monitoring $endpoint for $duration seconds..."
    
    for i in $(seq 1 $duration); do
        response_time=$(curl -o /dev/null -s -w "%{time_total}" "$endpoint")
        status_code=$(curl -o /dev/null -s -w "%{http_code}" "$endpoint")
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Status: $status_code, Response Time: ${response_time}s"
        sleep 1
    done
}
```

### 리소스 활용 분석
```bash
# 리소스 사용량 모니터링
monitor_resources() {
    local resource_group=$1
    
    echo "=== CPU Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "CpuPercentage" \
        --interval PT1M \
        --aggregation Average
    
    echo "=== Memory Usage ==="
    az monitor metrics list \
        --resource-group "$resource_group" \
        --resource-type "Microsoft.Web/sites" \
        --metric "MemoryPercentage" \
        --interval PT1M \
        --aggregation Average
}
```

## 🧪 테스트 및 검증

### 통합 테스트 디버깅
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# 디버그 환경 설정
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# 서비스 엔드포인트 가져오기
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# 상태 확인 엔드포인트 테스트
test_health() {
    local service=$1
    local url=$2
    
    echo "Testing $service health..."
    
    response=$(curl -s -o /dev/null -w "%{http_code},%{time_total}" "$url/health")
    status_code=$(echo $response | cut -d',' -f1)
    response_time=$(echo $response | cut -d',' -f2)
    
    if [ "$status_code" = "200" ]; then
        echo "✅ $service is healthy (${response_time}s)"
    else
        echo "❌ $service health check failed ($status_code)"
        return 1
    fi
}

# 테스트 실행
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# 사용자 정의 통합 테스트 실행
npm run test:integration
```

### 디버깅을 위한 부하 테스트
```bash
# 성능 병목 현상을 식별하기 위한 간단한 부하 테스트
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Apache Bench 사용 (설치: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # 주요 메트릭 추출
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # 실패 여부 확인
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 인프라 디버깅

### Bicep 템플릿 디버깅
```bash
# Bicep 템플릿을 자세한 출력으로 검증
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # 구문 검증
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # 린트 검증
    az bicep lint --file "$template_file"
    
    # 가상 배포
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# 템플릿 배포 디버그
debug_deployment() {
    local deployment_name=$1
    local resource_group=$2
    
    echo "=== Deployment Status ==="
    az deployment group show \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,timestamp:timestamp}"
    
    echo "=== Deployment Operations ==="
    az deployment operation group list \
        --name "$deployment_name" \
        --resource-group "$resource_group" \
        --query "[].{operationId:operationId,provisioningState:properties.provisioningState,resourceType:properties.targetResource.resourceType,error:properties.statusMessage.error}"
}
```

### 리소스 상태 분석
```bash
# 불일치에 대한 리소스 상태 분석
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # 모든 리소스와 그 상태 나열
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # 실패한 리소스 확인
    failed_resources=$(az resource list --resource-group "$resource_group" \
        --query "[?properties.provisioningState != 'Succeeded'].{name:name,state:properties.provisioningState}" \
        --output tsv)
    
    if [ -n "$failed_resources" ]; then
        echo "❌ Failed resources found:"
        echo "$failed_resources"
    else
        echo "✅ All resources provisioned successfully"
    fi
}
```

## 🔒 보안 디버깅

### 인증 흐름 디버깅
```bash
# Azure 인증 디버그
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # JWT 토큰 디코드 (jq 및 base64 필요)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Key Vault 액세스 디버그
debug_keyvault() {
    local vault_name=$1
    
    echo "=== Key Vault Access Policies ==="
    az keyvault show --name "$vault_name" --query "properties.accessPolicies[].{objectId:objectId,permissions:permissions}"
    
    echo "=== RBAC Assignments ==="
    vault_id=$(az keyvault show --name "$vault_name" --query id -o tsv)
    az role assignment list --scope "$vault_id"
    
    echo "=== Test Secret Access ==="
    az keyvault secret list --vault-name "$vault_name" --query "[].name" || echo "❌ Cannot access secrets"
}
```

### 네트워크 보안 디버깅
```bash
# 네트워크 보안 그룹 디버그
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # 보안 규칙 확인
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 애플리케이션별 디버깅

### Node.js 애플리케이션 디버깅
```javascript
// debug-middleware.js - Express 디버깅 미들웨어
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // 요청 세부 정보를 기록합니다
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // 응답을 기록하기 위해 res.json을 재정의합니다
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### 데이터베이스 쿼리 디버깅
```javascript
// database-debug.js - 데이터베이스 디버깅 유틸리티
const { Pool } = require('pg');
const debug = require('debug')('app:db');

class DebuggingPool extends Pool {
    async query(text, params) {
        const start = Date.now();
        debug('Executing query:', { text, params });
        
        try {
            const result = await super.query(text, params);
            const duration = Date.now() - start;
            debug(`Query completed in ${duration}ms`, {
                rowCount: result.rowCount,
                command: result.command
            });
            return result;
        } catch (error) {
            const duration = Date.now() - start;
            debug(`Query failed after ${duration}ms:`, error.message);
            throw error;
        }
    }
}

module.exports = DebuggingPool;
```

## 🚨 긴급 디버깅 절차

### 프로덕션 문제 대응
```bash
#!/bin/bash
# emergency-debug.sh - 긴급 프로덕션 디버깅

set -e

RESOURCE_GROUP=$1
ENVIRONMENT=$2

if [ -z "$RESOURCE_GROUP" ] || [ -z "$ENVIRONMENT" ]; then
    echo "Usage: $0 <resource-group> <environment>"
    exit 1
fi

echo "🚨 EMERGENCY DEBUGGING STARTED: $(date)"
echo "Resource Group: $RESOURCE_GROUP"
echo "Environment: $ENVIRONMENT"

# 올바른 환경으로 전환
azd env select "$ENVIRONMENT"

# 중요한 정보 수집
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
azd logs --level error --since 30m > emergency-errors.log
echo "Error count: $(wc -l < emergency-errors.log)"

echo "=== 4. Resource Status ==="
az resource list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.provisioningState != 'Succeeded']" > failed-resources.json

if [ -s failed-resources.json ]; then
    echo "❌ Failed resources found!"
    cat failed-resources.json
else
    echo "✅ All resources are healthy"
fi

echo "=== 5. Recent Deployments ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.timestamp >= '$(date -d '1 hour ago' -Iseconds)']" \
    > recent-deployments.json

echo "Emergency debugging completed: $(date)"
echo "Files generated:"
echo "  - emergency-status.json"
echo "  - emergency-errors.log"
echo "  - failed-resources.json"
echo "  - recent-deployments.json"
```

### 롤백 절차
```bash
# 빠른 롤백 스크립트
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # 환경 전환
    azd env select "$environment"
    
    # 애플리케이션 롤백
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # 롤백 확인
    echo "Verifying rollback..."
    azd show
    
    # 중요한 엔드포인트 테스트
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 디버깅 대시보드

### 맞춤형 모니터링 대시보드
```bash
# 디버깅을 위한 Application Insights 쿼리 생성
create_debug_queries() {
    local app_insights_name=$1
    
    # 오류에 대한 쿼리
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # 성능 문제에 대한 쿼리
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # 종속성 실패에 대한 쿼리
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### 로그 집계
```bash
# 여러 소스에서 로그를 집계합니다
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azd", "logs": ['
        azd logs --output json --since 1h | sed '$ ! s/$/,/'
        echo ']}'
        
        echo ',{"source": "azure", "logs": ['
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json | sed '$ ! s/$/,/'
        echo ']}'
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 고급 리소스

### 맞춤형 디버깅 스크립트
`scripts/debug/` 디렉토리를 생성하여 다음을 포함하세요:
- `health-check.sh` - 포괄적인 상태 확인
- `performance-test.sh` - 자동화된 성능 테스트
- `log-analyzer.py` - 고급 로그 파싱 및 분석
- `resource-validator.sh` - 인프라 검증

### 모니터링 통합
```yaml
# azure.yaml - Add debugging hooks
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## 모범 사례

1. **디버그 로깅을 항상 활성화**하세요 (비프로덕션 환경에서)
2. **재현 가능한 테스트 케이스를 생성**하세요
3. **팀을 위한 디버깅 절차를 문서화**하세요
4. **상태 확인 및 모니터링을 자동화**하세요
5. **애플리케이션 변경 사항에 맞춰 디버깅 도구를 업데이트**하세요
6. **비사건 시간 동안 디버깅 절차를 연습**하세요

## 다음 단계

- [용량 계획](../pre-deployment/capacity-planning.md) - 리소스 요구 사항 계획
- [SKU 선택](../pre-deployment/sku-selection.md) - 적합한 서비스 계층 선택
- [사전 점검](../pre-deployment/preflight-checks.md) - 배포 전 검증
- [치트 시트](../../resources/cheat-sheet.md) - 빠른 참조 명령

---

**기억하세요**: 좋은 디버깅은 체계적이고 철저하며 인내심을 갖는 것입니다. 이 도구와 기술은 문제를 더 빠르고 효과적으로 진단하는 데 도움을 줄 것입니다.

---

**탐색**
- **이전 레슨**: [일반적인 문제](common-issues.md)

- **다음 레슨**: [용량 계획](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**면책 조항**:  
이 문서는 AI 번역 서비스 [Co-op Translator](https://github.com/Azure/co-op-translator)를 사용하여 번역되었습니다. 정확성을 위해 노력하고 있지만, 자동 번역에는 오류나 부정확성이 포함될 수 있습니다. 원본 문서의 원어 버전이 권위 있는 자료로 간주되어야 합니다. 중요한 정보의 경우, 전문적인 인간 번역을 권장합니다. 이 번역 사용으로 인해 발생하는 오해나 잘못된 해석에 대해 당사는 책임을 지지 않습니다.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->