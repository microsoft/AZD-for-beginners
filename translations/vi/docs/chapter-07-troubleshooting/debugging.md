# Hướng Dẫn Gỡ Lỗi cho Triển Khai AZD

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Khắc Phục Sự Cố & Gỡ Lỗi
- **⬅️ Trước Đó**: [Các Vấn Đề Thường Gặp](common-issues.md)
- **➡️ Tiếp Theo**: [Khắc Phục Sự Cố Đặc Thù AI](ai-troubleshooting.md)
- **🚀 Chương Tiếp Theo**: [Chương 8: Mô Hình Sản Xuất & Doanh Nghiệp](../chapter-08-production/production-ai-practices.md)

## Giới Thiệu

Hướng dẫn toàn diện này cung cấp các chiến lược gỡ lỗi nâng cao, công cụ và kỹ thuật để chẩn đoán và giải quyết các vấn đề phức tạp liên quan đến việc triển khai Azure Developer CLI. Tìm hiểu các phương pháp khắc phục sự cố có hệ thống, kỹ thuật phân tích nhật ký, phân tích hiệu năng và công cụ chẩn đoán nâng cao để giải quyết hiệu quả các sự cố triển khai và thời gian chạy.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo các phương pháp gỡ lỗi có hệ thống cho các vấn đề Azure Developer CLI
- Hiểu cấu hình ghi nhật ký nâng cao và kỹ thuật phân tích nhật ký
- Áp dụng hồ sơ hiệu năng và chiến lược giám sát
- Sử dụng công cụ và dịch vụ chẩn đoán Azure để giải quyết các vấn đề phức tạp
- Áp dụng kỹ thuật gỡ lỗi mạng và khắc phục sự cố bảo mật
- Cấu hình giám sát và cảnh báo toàn diện để phát hiện sự cố chủ động

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có thể:
- Áp dụng phương pháp TRIAGE để gỡ lỗi có hệ thống các vấn đề triển khai phức tạp
- Cấu hình và phân tích thông tin ghi nhật ký và theo dõi toàn diện
- Sử dụng hiệu quả Azure Monitor, Application Insights và các công cụ chẩn đoán
- Gỡ lỗi các vấn đề kết nối mạng, xác thực và quyền truy cập một cách độc lập
- Triển khai các chiến lược giám sát và tối ưu hóa hiệu năng
- Tạo các kịch bản gỡ lỗi và tự động hóa tùy chỉnh cho các vấn đề lặp lại

## Phương Pháp Gỡ Lỗi

### Phương Pháp TRIAGE
- **T**ime: Khi nào sự cố bắt đầu?
- **R**eproduce: Bạn có thể tái hiện nó liên tục không?
- **I**solate: Thành phần nào đang gặp lỗi?
- **A**nalyze: Nhật ký nói gì với chúng ta?
- **G**ather: Thu thập tất cả thông tin liên quan
- **E**scalate: Khi nào cần tìm sự trợ giúp thêm

## Bật Chế Độ Gỡ Lỗi

> **Phạm Vi:** Đây là các ví dụ chẩn đoán để điều chỉnh, không phải bộ kịch bản được cung cấp. Thay thế tên/ID tài nguyên; sử dụng Bash cho các khối shell. Dữ liệu `--debug` và giá trị môi trường có thể chứa thông tin nhạy cảm—xem xét/loại bỏ trước khi chia sẻ. Các ví dụ triển khai, quay lại hoặc thay đổi cấu hình đòi hỏi sự phê duyệt rõ ràng từ người vận hành.

### Biến Môi Trường
```bash
# Enable diagnostics on the command under investigation
azd show --debug
az account show --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true
```

### Cấu Hình Gỡ Lỗi
```bash
# Inspect supported flags rather than setting arbitrary config keys
azd show --help
azd config list
```

`azd config set` có thể lưu các khóa tùy ý; điều đó không có nghĩa `debug.enabled`, `debug.logLevel`, hoặc `trace.outputPath` là các cài đặt được hỗ trợ. Sử dụng cờ `--debug` của lệnh đã phát hành.

## 📊 Kỹ Thuật Phân Tích Nhật Ký

### Hiểu Các Cấp Độ Nhật Ký
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Phân Tích Nhật Ký Có Cấu Trúc
```bash
# View logs with Azure Monitor (via azd monitor)
azd monitor --logs

# Open Application Insights Live Metrics (not a terminal log stream)
azd monitor --live

# For detailed log analysis, use Azure CLI with your App Service or Container App:
# App Service logs
az webapp log tail --name "$APP_NAME" --resource-group "$RG_NAME"

# Container App logs
az containerapp logs show --name "$APP_NAME" --resource-group "$RG_NAME" --follow

# Export Application Insights logs for analysis
az monitor app-insights query \
    --app "$APPI_NAME" \
    --resource-group "$RG_NAME" \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Liên Kết Nhật Ký
```bash
#!/bin/bash
# correlate-logs.sh - Correlate logs across services using Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_ID=$2 # Application ID (GUID), not an ambiguous component name

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_ID" ]; then
    echo "Usage: $0 <trace-id> <application-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Search Application Insights for correlated logs
az monitor app-insights query \
    --app "$APP_INSIGHTS_ID" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Activity Log correlation IDs describe management operations and are not the
# same as application trace IDs. Obtain them from the failed ARM operation.
```

## 🛠️ Công Cụ Gỡ Lỗi Nâng Cao

### Truy Vấn Đồ Thị Tài Nguyên Azure
```bash
# Query resources by tags
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Find resource groups with non-success/missing provisioning state (NOT deployments)
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Check resource health
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Gỡ Lỗi Mạng
```bash
# Test connectivity between services
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

# Usage
# Source must be a supported Network Watcher source, e.g. a configured VM ID.
test_connectivity "/subscriptions/.../providers/Microsoft.Compute/virtualMachines/myvm" "myapp-api.azurewebsites.net" 443
```

### Gỡ Lỗi Container
```bash
# Debug container app issues
debug_container() {
    local app_name=$1
    local resource_group=$2
    
    echo "=== Container App Status ==="
    az containerapp show --name "$app_name" --resource-group "$resource_group" \
        --query "properties.{provisioningState:provisioningState,runningStatus:runningStatus}"
    
    echo "=== Container App Revisions ==="
    az containerapp revision list --name "$app_name" --resource-group "$resource_group" \
        --query "[].{name:name,active:properties.active,createdTime:properties.createdTime}"
    
    echo "=== Container Logs ==="
    az containerapp logs show --name "$app_name" --resource-group "$resource_group" --follow
}
```

### Gỡ Lỗi Kết Nối Cơ Sở Dữ Liệu
```bash
# Debug database connectivity
debug_database() {
    local db_server=$1
    local resource_group=$2
    
    echo "=== Database Server Status ==="
    az postgres flexible-server show --name "$db_server" --resource-group "$resource_group" \
        --query "{state:state,version:version,location:location}"
    
    echo "=== Firewall Rules ==="
    az postgres flexible-server firewall-rule list --name "$db_server" --resource-group "$resource_group"
    
    echo "=== Connection Test ==="
    timeout 10 bash -c "</dev/tcp/$db_server.postgres.database.azure.com/5432" && echo "Port 5432 is open" || echo "Port 5432 is closed"
}
```

## 🔬 Gỡ Lỗi Hiệu Năng

### Giám Sát Hiệu Năng Ứng Dụng
```bash
# SDK settings are language-specific. For Python OpenTelemetry role naming,
# set before configuring the Azure Monitor distro:
export OTEL_SERVICE_NAME=myapp-debug

# Custom performance monitoring
monitor_performance() {
    local endpoint=$1
    local duration=${2:-60}
    
    echo "Monitoring $endpoint for $duration seconds..."
    
    for i in $(seq 1 $duration); do
        # Capture status and duration from the SAME bounded request.
        measurement=$(curl --max-time 10 -o /dev/null -s -w "%{http_code},%{time_total}" "$endpoint") || return 1
        status_code=${measurement%,*}
        response_time=${measurement#*,}
        
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Status: $status_code, Response Time: ${response_time}s"
        sleep 1
    done
}
```

### Phân Tích Sử Dụng Tài Nguyên
```bash
# Monitor resource usage
monitor_resources() {
    local plan_id=$1 # Full Microsoft.Web/serverfarms resource ID
    
    echo "=== CPU Usage ==="
    az monitor metrics list \
        --resource "$plan_id" \
        --metrics "CpuPercentage" \
        --interval PT1M \
        --aggregation Average
    
    echo "=== Memory Usage ==="
    az monitor metrics list \
        --resource "$plan_id" \
        --metrics "MemoryPercentage" \
        --interval PT1M \
        --aggregation Average
}
```

## 🧪 Kiểm Tra và Xác Thực

### Gỡ Lỗi Kiểm Tra Tích Hợp
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Set debug environment
export NODE_ENV=test
export DEBUG='app:*'
export LOG_LEVEL=debug

# Get service endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl // .services.web.ingresUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl // .services.api.ingresUrl')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Test health endpoints
test_health() {
    local service=$1
    local url=$2
    
    echo "Testing $service health..."
    
    response=$(curl --max-time 10 -s -o /dev/null -w "%{http_code},%{time_total}" "$url/health")
    status_code=$(echo $response | cut -d',' -f1)
    response_time=$(echo $response | cut -d',' -f2)
    
    if [ "$status_code" = "200" ]; then
        echo "✅ $service is healthy (${response_time}s)"
    else
        echo "❌ $service health check failed ($status_code)"
        return 1
    fi
}

# Run tests
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Run custom integration tests
npm run test:integration
```

### Kiểm Tra Tải Để Gỡ Lỗi
```bash
# Simple load test to identify performance bottlenecks
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Using Apache Bench (install: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Extract key metrics
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Check for failures
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Gỡ Lỗi Hạ Tầng

### Gỡ Lỗi Mẫu Bicep
```bash
# Validate Bicep templates with detailed output
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Syntax validation
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Lint validation
    az bicep lint --file "$template_file"
    
    # From the initialized project: azd resolves its parameter substitutions
    # and deployment scope. Review hooks before provisioning preview.
    azd provision --preview
}

# Debug template deployment
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

### Phân Tích Trạng Thái Tài Nguyên
```bash
# Analyze resource states for inconsistencies
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # List all resources with their states
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Generic list responses often omit properties/provisioningState.
    # Null is unknown, not failure; inspect the service-specific show command
    # and deployment operations for the affected resource.
    az deployment group list --resource-group "$resource_group" \
        --query "[].{name:name,state:properties.provisioningState}" -o table
}
```

## 🔒 Gỡ Lỗi Bảo Mật

### Gỡ Lỗi Luồng Xác Thực
```bash
# Debug Azure authentication
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    # Do not print/decode bearer tokens into logs.
    az account get-access-token --query "{expiresOn:expiresOn,tenant:tenant,subscription:subscription}" -o json
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Debug Key Vault access
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

### Gỡ Lỗi Bảo Mật Mạng
```bash
# Debug network security groups
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Check security rules
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Gỡ Lỗi Đặc Thù Ứng Dụng

### Gỡ Lỗi Ứng Dụng Node.js
```javascript
// debug-middleware.js - Express debugging middleware
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Log request details
    debug(`${req.method} ${req.url}`, {
        // Do not log authorization headers, bodies, query strings, or client IPs.
        route: req.route?.path || '(unmatched)'
    });
    
    // Override res.json to log responses
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Gỡ Lỗi Truy Vấn Cơ Sở Dữ Liệu
```javascript
// database-debug.js - Database debugging utilities
const { Pool } = require('pg');
const debug = require('debug')('app:db');

class DebuggingPool extends Pool {
    async query(text, params) {
        const start = Date.now();
        // Promise-based query(text, params) demo only; not a drop-in replacement
        // for node-postgres callback/streaming overloads. Avoid query parameters.
        debug('Executing query');
        
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

## 🚨 Quy Trình Gỡ Lỗi Khẩn Cấp

### Ứng Phó Vấn Đề Sản Xuất
```bash
#!/bin/bash
# emergency-debug.sh - Emergency production debugging

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

# Switch to correct environment
azd env select "$ENVIRONMENT"

# Collect critical information
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[] | .ingressUrl // .ingresUrl'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[] | (.ingressUrl // .ingresUrl // empty)'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# Use Azure Monitor for error logs
azd monitor --logs
echo "Check Application Insights for detailed error analysis"

echo "=== 4. Resource Status ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.provisioningState == 'Failed']" > failed-resources.json

if jq -e 'length > 0' failed-resources.json >/dev/null; then
    echo "❌ Failed group deployments found (inspect subscription deployments too)!"
    cat failed-resources.json
else
    echo "No failed group deployment records found; resource health is not established."
fi

echo "=== 5. Recent Deployments ==="
az deployment group list --resource-group "$RESOURCE_GROUP" \
    --query "[?properties.timestamp >= '$(date -d '1 hour ago' -Iseconds)']" \
    > recent-deployments.json

echo "Emergency debugging completed: $(date)"
echo "Files generated:"
echo "  - emergency-status.json"
echo "  - failed-resources.json"
echo "  - recent-deployments.json"
```

### Quy Trình Quay Lại
```bash
# Quick rollback script
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Switch environment
    azd env select "$environment"
    
    # Rollback using Git (AZD doesn't have built-in rollback)
    git checkout "$previous_commit"
    azd deploy || return 1
    
    # Verify rollback
    echo "Verifying rollback..."
    azd show
    
    # Test critical endpoints
    WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl // .services.web.ingresUrl') || return 1
    curl --max-time 10 -f "$WEB_URL/health" || { echo "❌ Rollback verification failed"; return 1; }
    
    echo "✅ Rollback completed"
}
```

Việc quay lại chỉ bằng mã này không hoàn nguyên hạ tầng, di cư cơ sở dữ liệu hoặc bí mật. Sử dụng worktree sạch, ghi lại commit bắt đầu, và phục hồi sau đó; lệnh sẽ chuyển sang commit được chọn trong kho hiện tại.

## 📊 Bảng Điều Khiển Gỡ Lỗi

### Bảng Điều Khiển Giám Sát Tùy Chỉnh
```bash
# Create Application Insights queries for debugging
create_debug_queries() {
    local app_insights_name=$1 # Use the Application ID GUID to avoid name ambiguity
    
    # Query for errors
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Query for performance issues
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Query for dependency failures
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Tổng Hợp Nhật Ký
```bash
# Aggregate logs from multiple Azure sources
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    local app_insights_name=$1 # Application ID GUID
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '[{"source": "azure-activity", "logs": '
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json
        echo '}'
        
        if [ -n "$app_insights_name" ]; then
            echo ',{"source": "app-insights", "logs": '
            az monitor app-insights query --app "$app_insights_name" \
                --analytics-query "union traces, exceptions | where timestamp > ago(1h)" --output json
            echo '}'
        fi
        echo ']'
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 Tài Nguyên Nâng Cao

### Kịch Bản Gỡ Lỗi Tùy Chỉnh
Tạo thư mục `scripts/debug/` với:
- `health-check.sh` - Kiểm tra sức khỏe toàn diện
- `performance-test.sh` - Kiểm tra hiệu năng tự động
- `log-analyzer.py` - Phân tích và xử lý nhật ký nâng cao
- `resource-validator.sh` - Xác thực hạ tầng

### Tích Hợp Giám Sát
```yaml
# azure.yaml - Add debugging hooks
hooks:
  postdeploy:
    shell: sh
    run: |
      set -e
      echo "Running post-deployment debugging..."
      ./scripts/debug/health-check.sh
      ./scripts/debug/performance-test.sh
      
      if [ "$?" -ne 0 ]; then
        echo "❌ Post-deployment checks failed"
        exit 1
      fi
```

## Thực Tiễn Tốt Nhất

1. **Luôn bật ghi nhật ký gỡ lỗi** trong môi trường không phải sản xuất
2. **Tạo các trường hợp kiểm tra có thể tái hiện** cho các vấn đề
3. **Ghi chép quy trình gỡ lỗi** cho nhóm của bạn
4. **Tự động hóa kiểm tra sức khỏe** và giám sát
5. **Cập nhật công cụ gỡ lỗi** theo thay đổi ứng dụng của bạn
6. **Thực hành quy trình gỡ lỗi** trong thời gian không có sự cố

## Bước Tiếp Theo

- [Lập Kế Hoạch Dung Lượng](../chapter-06-pre-deployment/capacity-planning.md) - Lên kế hoạch yêu cầu tài nguyên
- [Chọn SKU](../chapter-06-pre-deployment/sku-selection.md) - Chọn lớp dịch vụ phù hợp
- [Kiểm Tra Trước Triển Khai](../chapter-06-pre-deployment/preflight-checks.md) - Xác thực trước khi triển khai
- [Bảng Tóm Tắt](../../resources/cheat-sheet.md) - Các lệnh tham khảo nhanh

---

**Hãy nhớ**: Gỡ lỗi tốt là phải có hệ thống, kỹ lưỡng và kiên nhẫn. Những công cụ và kỹ thuật này sẽ giúp bạn chẩn đoán sự cố nhanh hơn và hiệu quả hơn.

---

**Điều Hướng**
- **Bài Trước**: [Các Vấn Đề Thường Gặp](common-issues.md)

- **Bài Tiếp Theo**: [Lập Kế Hoạch Dung Lượng](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng bản dịch tự động có thể chứa lỗi hoặc sai sót. Tài liệu gốc bằng ngôn ngữ gốc nên được coi là nguồn tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp bởi con người. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc giải thích sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->