<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "5395583c1a88847b97d186dd5f5b1a69",
  "translation_date": "2025-11-22T08:32:44+00:00",
  "source_file": "docs/troubleshooting/debugging.md",
  "language_code": "vi"
}
-->
# Hướng Dẫn Gỡ Lỗi Cho Triển Khai AZD

**Điều Hướng Chương:**
- **📚 Trang Chủ Khóa Học**: [AZD Cho Người Mới Bắt Đầu](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Xử Lý Sự Cố & Gỡ Lỗi
- **⬅️ Trước**: [Các Vấn Đề Thường Gặp](common-issues.md)
- **➡️ Tiếp Theo**: [Xử Lý Sự Cố Liên Quan Đến AI](ai-troubleshooting.md)
- **🚀 Chương Tiếp Theo**: [Chương 8: Mô Hình Sản Xuất & Doanh Nghiệp](../microsoft-foundry/production-ai-practices.md)

## Giới Thiệu

Hướng dẫn toàn diện này cung cấp các chiến lược gỡ lỗi nâng cao, công cụ và kỹ thuật để chẩn đoán và giải quyết các vấn đề phức tạp liên quan đến triển khai Azure Developer CLI. Học các phương pháp xử lý sự cố có hệ thống, kỹ thuật phân tích nhật ký, phân tích hiệu suất, và các công cụ chẩn đoán nâng cao để giải quyết hiệu quả các vấn đề triển khai và vận hành.

## Mục Tiêu Học Tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Thành thạo các phương pháp gỡ lỗi có hệ thống cho các vấn đề Azure Developer CLI
- Hiểu cấu hình nhật ký nâng cao và kỹ thuật phân tích nhật ký
- Thực hiện các chiến lược giám sát và phân tích hiệu suất
- Sử dụng các công cụ và dịch vụ chẩn đoán của Azure để giải quyết các vấn đề phức tạp
- Áp dụng các kỹ thuật gỡ lỗi mạng và xử lý sự cố bảo mật
- Cấu hình giám sát toàn diện và cảnh báo để phát hiện vấn đề chủ động

## Kết Quả Học Tập

Sau khi hoàn thành, bạn sẽ có thể:
- Áp dụng phương pháp TRIAGE để gỡ lỗi có hệ thống các vấn đề triển khai phức tạp
- Cấu hình và phân tích thông tin nhật ký và truy vết toàn diện
- Sử dụng Azure Monitor, Application Insights, và các công cụ chẩn đoán hiệu quả
- Tự gỡ lỗi các vấn đề kết nối mạng, xác thực, và quyền truy cập
- Thực hiện các chiến lược giám sát và tối ưu hóa hiệu suất
- Tạo các script gỡ lỗi tùy chỉnh và tự động hóa cho các vấn đề lặp lại

## Phương Pháp Gỡ Lỗi

### Phương Pháp TRIAGE
- **T**hời gian: Vấn đề bắt đầu từ khi nào?
- **R**eproduce: Bạn có thể tái hiện vấn đề một cách nhất quán không?
- **I**solate: Thành phần nào đang gặp lỗi?
- **A**nalyze: Nhật ký cho chúng ta biết điều gì?
- **G**ather: Thu thập tất cả thông tin liên quan
- **E**scalate: Khi nào cần tìm sự hỗ trợ thêm

## Kích Hoạt Chế Độ Gỡ Lỗi

### Biến Môi Trường
```bash
# Bật gỡ lỗi toàn diện
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Gỡ lỗi Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Tắt thu thập dữ liệu để đầu ra sạch hơn
export AZD_DISABLE_TELEMETRY=true
```

### Cấu Hình Gỡ Lỗi
```bash
# Đặt cấu hình gỡ lỗi toàn cục
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Bật ghi nhật ký theo dõi
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Kỹ Thuật Phân Tích Nhật Ký

### Hiểu Các Mức Nhật Ký
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
# Lọc nhật ký theo cấp độ
azd logs --level error --since 1h

# Lọc theo dịch vụ
azd logs --service api --level debug

# Xuất nhật ký để phân tích
azd logs --output json > deployment-logs.json

# Phân tích nhật ký JSON với jq
cat deployment-logs.json | jq '.[] | select(.level == "ERROR")'
```

### Tương Quan Nhật Ký
```bash
#!/bin/bash
# correlate-logs.sh - Tương quan nhật ký giữa các dịch vụ

TRACE_ID=$1
if [ -z "$TRACE_ID" ]; then
    echo "Usage: $0 <trace-id>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Tìm kiếm trên tất cả các dịch vụ
for service in web api worker; do
    echo "=== $service logs ==="
    azd logs --service $service | grep "$TRACE_ID"
done

# Tìm kiếm nhật ký Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Công Cụ Gỡ Lỗi Nâng Cao

### Truy Vấn Azure Resource Graph
```bash
# Truy vấn tài nguyên theo thẻ
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Tìm các triển khai thất bại
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Kiểm tra trạng thái sức khỏe của tài nguyên
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Gỡ Lỗi Mạng
```bash
# Kiểm tra kết nối giữa các dịch vụ
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

# Sử dụng
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Gỡ Lỗi Container
```bash
# Gỡ lỗi các vấn đề ứng dụng container
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

### Gỡ Lỗi Kết Nối Cơ Sở Dữ Liệu
```bash
# Gỡ lỗi kết nối cơ sở dữ liệu
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

## 🔬 Gỡ Lỗi Hiệu Suất

### Giám Sát Hiệu Suất Ứng Dụng
```bash
# Bật gỡ lỗi Application Insights
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

# Giám sát hiệu suất tùy chỉnh
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

### Phân Tích Sử Dụng Tài Nguyên
```bash
# Giám sát việc sử dụng tài nguyên
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

## 🧪 Kiểm Tra và Xác Thực

### Gỡ Lỗi Kiểm Tra Tích Hợp
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Thiết lập môi trường gỡ lỗi
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Lấy các điểm cuối dịch vụ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Kiểm tra các điểm cuối sức khỏe
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

# Chạy các bài kiểm tra
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# Chạy các bài kiểm tra tích hợp tùy chỉnh
npm run test:integration
```

### Kiểm Tra Tải Để Gỡ Lỗi
```bash
# Kiểm tra tải đơn giản để xác định các điểm nghẽn hiệu suất
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # Sử dụng Apache Bench (cài đặt: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # Trích xuất các chỉ số chính
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # Kiểm tra lỗi
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 Gỡ Lỗi Hạ Tầng

### Gỡ Lỗi Mẫu Bicep
```bash
# Xác thực các mẫu Bicep với đầu ra chi tiết
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Xác thực cú pháp
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Xác thực lint
    az bicep lint --file "$template_file"
    
    # Triển khai giả định
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# Gỡ lỗi triển khai mẫu
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
# Phân tích trạng thái tài nguyên để tìm sự không nhất quán
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Liệt kê tất cả các tài nguyên với trạng thái của chúng
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # Kiểm tra các tài nguyên bị lỗi
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

## 🔒 Gỡ Lỗi Bảo Mật

### Gỡ Lỗi Luồng Xác Thực
```bash
# Gỡ lỗi xác thực Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # Giải mã token JWT (yêu cầu jq và base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# Gỡ lỗi truy cập Key Vault
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
# Gỡ lỗi nhóm bảo mật mạng
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # Kiểm tra các quy tắc bảo mật
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 Gỡ Lỗi Ứng Dụng Cụ Thể

### Gỡ Lỗi Ứng Dụng Node.js
```javascript
// debug-middleware.js - Middleware gỡ lỗi Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Ghi lại chi tiết yêu cầu
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Ghi đè res.json để ghi lại phản hồi
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Gỡ Lỗi Truy Vấn Cơ Sở Dữ Liệu
```javascript
// database-debug.js - Các tiện ích gỡ lỗi cơ sở dữ liệu
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

## 🚨 Quy Trình Gỡ Lỗi Khẩn Cấp

### Phản Hồi Sự Cố Sản Xuất
```bash
#!/bin/bash
# emergency-debug.sh - Gỡ lỗi khẩn cấp trong môi trường sản xuất

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

# Chuyển sang môi trường đúng
azd env select "$ENVIRONMENT"

# Thu thập thông tin quan trọng
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

### Quy Trình Rollback
```bash
# Kịch bản khôi phục nhanh
quick_rollback() {
    local environment=$1
    local backup_timestamp=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment to $backup_timestamp"
    
    # Chuyển đổi môi trường
    azd env select "$environment"
    
    # Khôi phục ứng dụng
    azd deploy --rollback --timestamp "$backup_timestamp"
    
    # Xác minh khôi phục
    echo "Verifying rollback..."
    azd show
    
    # Kiểm tra các điểm cuối quan trọng
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Bảng Điều Khiển Gỡ Lỗi

### Bảng Điều Khiển Giám Sát Tùy Chỉnh
```bash
# Tạo các truy vấn Application Insights để gỡ lỗi
create_debug_queries() {
    local app_insights_name=$1
    
    # Truy vấn lỗi
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # Truy vấn các vấn đề hiệu suất
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # Truy vấn các lỗi phụ thuộc
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### Tập Hợp Nhật Ký
```bash
# Tổng hợp nhật ký từ nhiều nguồn
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

## 🔗 Tài Nguyên Nâng Cao

### Script Gỡ Lỗi Tùy Chỉnh
Tạo thư mục `scripts/debug/` với:
- `health-check.sh` - Kiểm tra sức khỏe toàn diện
- `performance-test.sh` - Kiểm tra hiệu suất tự động
- `log-analyzer.py` - Phân tích và xử lý nhật ký nâng cao
- `resource-validator.sh` - Xác thực hạ tầng

### Tích Hợp Giám Sát
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

## Các Thực Hành Tốt Nhất

1. **Luôn kích hoạt nhật ký gỡ lỗi** trong môi trường không phải sản xuất
2. **Tạo các trường hợp kiểm tra có thể tái hiện** cho các vấn đề
3. **Ghi lại quy trình gỡ lỗi** cho nhóm của bạn
4. **Tự động hóa kiểm tra sức khỏe** và giám sát
5. **Cập nhật công cụ gỡ lỗi** theo thay đổi của ứng dụng
6. **Thực hành quy trình gỡ lỗi** trong thời gian không có sự cố

## Bước Tiếp Theo

- [Lập Kế Hoạch Năng Lực](../pre-deployment/capacity-planning.md) - Lập kế hoạch yêu cầu tài nguyên
- [Lựa Chọn SKU](../pre-deployment/sku-selection.md) - Chọn cấp dịch vụ phù hợp
- [Kiểm Tra Trước Khi Triển Khai](../pre-deployment/preflight-checks.md) - Xác thực trước khi triển khai
- [Tài Liệu Tham Khảo Nhanh](../../resources/cheat-sheet.md) - Các lệnh tham khảo nhanh

---

**Nhớ rằng**: Gỡ lỗi tốt là về việc có hệ thống, kỹ lưỡng, và kiên nhẫn. Những công cụ và kỹ thuật này sẽ giúp bạn chẩn đoán vấn đề nhanh hơn và hiệu quả hơn.

---

**Điều Hướng**
- **Bài Học Trước**: [Các Vấn Đề Thường Gặp](common-issues.md)

- **Bài Học Tiếp Theo**: [Lập Kế Hoạch Năng Lực](../pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tuyên bố miễn trừ trách nhiệm**:  
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI [Co-op Translator](https://github.com/Azure/co-op-translator). Mặc dù chúng tôi cố gắng đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa lỗi hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ bản địa nên được coi là nguồn thông tin chính thức. Đối với thông tin quan trọng, nên sử dụng dịch vụ dịch thuật chuyên nghiệp của con người. Chúng tôi không chịu trách nhiệm cho bất kỳ sự hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->