# Debugging Guide for AZD Deployments

**Chapter Navigation:**
- **📚 Trang Khóa Học**: [AZD Cho Người Mới](../../README.md)
- **📖 Chương Hiện Tại**: Chương 7 - Khắc phục sự cố & Gỡ lỗi
- **⬅️ Trước**: [Các sự cố phổ biến](common-issues.md)
- **➡️ Tiếp theo**: [Khắc phục sự cố cụ thể cho AI](ai-troubleshooting.md)
- **🚀 Chương Tiếp Theo**: [Chương 8: Mô hình Sản xuất & Doanh nghiệp](../chapter-08-production/production-ai-practices.md)

## Giới thiệu

Hướng dẫn toàn diện này cung cấp các chiến lược gỡ lỗi nâng cao, công cụ và kỹ thuật để chẩn đoán và giải quyết các sự cố phức tạp với việc triển khai bằng Azure Developer CLI. Tìm hiểu các phương pháp hệ thống để khắc phục sự cố, kỹ thuật phân tích nhật ký, phân tích hiệu năng và các công cụ chẩn đoán nâng cao để giải quyết hiệu quả các vấn đề triển khai và chạy thời gian.

## Mục tiêu học tập

Khi hoàn thành hướng dẫn này, bạn sẽ:
- Nắm vững các phương pháp gỡ lỗi hệ thống cho các sự cố Azure Developer CLI
- Hiểu cấu hình ghi nhật ký nâng cao và kỹ thuật phân tích nhật ký
- Triển khai các chiến lược phân tích và hồ sơ hiệu năng
- Sử dụng các công cụ và dịch vụ chẩn đoán của Azure để giải quyết các vấn đề phức tạp
- Áp dụng các kỹ thuật gỡ lỗi mạng và khắc phục sự cố bảo mật
- Cấu hình giám sát và cảnh báo toàn diện để phát hiện sự cố chủ động

## Kết quả học tập

Sau khi hoàn thành, bạn sẽ có thể:
- Áp dụng phương pháp TRIAGE để gỡ lỗi hệ thống các sự cố triển khai phức tạp
- Cấu hình và phân tích thông tin ghi nhật ký và theo dõi toàn diện
- Sử dụng Azure Monitor, Application Insights và các công cụ chẩn đoán một cách hiệu quả
- Gỡ lỗi kết nối mạng, xác thực và quyền truy cập một cách độc lập
- Triển khai các chiến lược giám sát và tối ưu hóa hiệu năng
- Tạo các script gỡ lỗi tùy chỉnh và tự động hóa cho các vấn đề lặp lại

## Phương pháp gỡ lỗi

### Cách tiếp cận TRIAGE
- **T**hời gian: Vấn đề bắt đầu khi nào?
- **R**eproduce: Bạn có thể tái hiện nó một cách nhất quán không?
- **I**solate: Thành phần nào đang gặp lỗi?
- **A**nalyze: Nhật ký cho chúng ta biết gì?
- **G**ather: Thu thập tất cả thông tin liên quan
- **E**scalate: Khi nào cần tìm trợ giúp thêm

## Bật Chế độ Gỡ lỗi

### Biến môi trường
```bash
# Bật gỡ lỗi toàn diện
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# Gỡ lỗi Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# Vô hiệu hóa telemetry để đầu ra gọn hơn
export AZD_DISABLE_TELEMETRY=true
```

### Cấu hình gỡ lỗi
```bash
# Đặt cấu hình gỡ lỗi toàn cục
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# Bật ghi nhật ký theo dõi
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 Kỹ thuật Phân tích Nhật ký

### Hiểu các Mức nhật ký
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### Phân tích Nhật ký Có cấu trúc
```bash
# Xem nhật ký bằng Azure Monitor (qua azd monitor)
azd monitor --logs

# Xem nhật ký ứng dụng theo thời gian thực
azd monitor --live

# Để phân tích nhật ký chi tiết, sử dụng Azure CLI với App Service hoặc Container App của bạn:
# Nhật ký App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# Nhật ký Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Xuất nhật ký Application Insights để phân tích
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### Tương quan Nhật ký
```bash
#!/bin/bash
# correlate-logs.sh - Tương quan nhật ký giữa các dịch vụ bằng Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# Tìm kiếm trong Application Insights các nhật ký tương quan
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# Tìm kiếm nhật ký hoạt động Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ Công cụ Gỡ lỗi Nâng cao

### Truy vấn Azure Resource Graph
```bash
# Truy vấn tài nguyên theo thẻ
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# Tìm các triển khai thất bại
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# Kiểm tra tình trạng sức khỏe của tài nguyên
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### Gỡ lỗi Mạng
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

# Cách sử dụng
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### Gỡ lỗi Container
```bash
# Gỡ lỗi sự cố ứng dụng container
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

### Gỡ lỗi Kết nối Cơ sở dữ liệu
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

## 🔬 Gỡ lỗi Hiệu năng

### Giám sát Hiệu năng Ứng dụng
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

### Phân tích Sử dụng Tài nguyên
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

## 🧪 Kiểm thử và Xác thực

### Gỡ lỗi Kiểm thử Tích hợp
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# Thiết lập môi trường gỡ lỗi
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# Lấy các điểm cuối của dịch vụ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# Kiểm tra các điểm cuối trạng thái
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

### Kiểm thử Tải để Gỡ lỗi
```bash
# Kiểm thử tải đơn giản để xác định các nút thắt hiệu năng
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

## 🔧 Gỡ lỗi Hạ tầng

### Gỡ lỗi Template Bicep
```bash
# Xác thực các mẫu Bicep với đầu ra chi tiết
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # Xác thực cú pháp
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # Kiểm tra lint
    az bicep lint --file "$template_file"
    
    # Triển khai mô phỏng (what-if)
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

### Phân tích Trạng thái Tài nguyên
```bash
# Phân tích trạng thái tài nguyên để tìm sự không nhất quán
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # Liệt kê tất cả tài nguyên cùng với trạng thái của chúng
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

## 🔒 Gỡ lỗi Bảo mật

### Gỡ lỗi Lưu đồ Xác thực
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

### Gỡ lỗi Bảo mật Mạng
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

## 📱 Gỡ lỗi Ứng dụng Cụ thể

### Gỡ lỗi Ứng dụng Node.js
```javascript
// debug-middleware.js - middleware gỡ lỗi cho Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // Ghi lại chi tiết của yêu cầu
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // Ghi đè res.json để ghi lại các phản hồi
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### Gỡ lỗi Truy vấn Cơ sở dữ liệu
```javascript
// database-debug.js - Tiện ích gỡ lỗi cơ sở dữ liệu
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

## 🚨 Quy trình Gỡ lỗi Khẩn cấp

### Phản ứng với Sự cố Ở Môi trường Sản xuất
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

# Chuyển sang môi trường chính xác
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
# Sử dụng Azure Monitor để xem nhật ký lỗi
azd monitor --logs
echo "Check Application Insights for detailed error analysis"

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

### Quy trình Rollback
```bash
# Tập lệnh hoàn nguyên nhanh
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # Chuyển môi trường
    azd env select "$environment"
    
    # Hoàn nguyên bằng Git (AZD không có chức năng hoàn nguyên tích hợp sẵn)
    git checkout "$previous_commit"
    azd deploy
    
    # Xác minh hoàn nguyên
    echo "Verifying rollback..."
    azd show
    
    # Kiểm tra các điểm cuối quan trọng
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 Bảng điều khiển Gỡ lỗi

### Bảng giám sát Tùy chỉnh
```bash
# Tạo các truy vấn Application Insights để gỡ lỗi
create_debug_queries() {
    local app_insights_name=$1
    
    # Truy vấn các lỗi
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

### Tổng hợp Nhật ký
```bash
# Tổng hợp nhật ký từ nhiều nguồn Azure
aggregate_logs() {
    local output_file="aggregated-logs-$(date +%Y%m%d_%H%M%S).json"
    local app_insights_name=$1
    
    echo "Aggregating logs to $output_file"
    
    {
        echo '{"source": "azure-activity", "logs": '
        az monitor activity-log list --start-time "$(date -d '1 hour ago' -Iseconds)" --output json
        echo '}'
        
        if [ -n "$app_insights_name" ]; then
            echo ',{"source": "app-insights", "logs": '
            az monitor app-insights query --app "$app_insights_name" \
                --analytics-query "union traces, exceptions | where timestamp > ago(1h)" --output json
            echo '}'
        fi
    } > "$output_file"
    
    echo "Logs aggregated in $output_file"
}
```

## 🔗 Tài nguyên Nâng cao

### Script Gỡ lỗi Tùy chỉnh
Create a `scripts/debug/` directory with:
- `health-check.sh` - Kiểm tra sức khỏe toàn diện
- `performance-test.sh` - Kiểm thử hiệu năng tự động
- `log-analyzer.py` - Phân tích và xử lý nhật ký nâng cao
- `resource-validator.sh` - Xác thực hạ tầng

### Tích hợp Giám sát
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

## Thực hành Tốt nhất

1. **Luôn bật ghi nhật ký gỡ lỗi** trong các môi trường không phải sản xuất
2. **Tạo trường hợp kiểm thử có thể tái hiện** cho các sự cố
3. **Ghi lại quy trình gỡ lỗi** cho nhóm của bạn
4. **Tự động hoá kiểm tra sức khỏe** và giám sát
5. **Giữ các công cụ gỡ lỗi được cập nhật** cùng với thay đổi của ứng dụng
6. **Luyện tập quy trình gỡ lỗi** vào những thời điểm không có sự cố

## Bước Tiếp theo

- [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md) - Lập kế hoạch yêu cầu tài nguyên
- [SKU Selection](../chapter-06-pre-deployment/sku-selection.md) - Chọn các hạng dịch vụ phù hợp
- [Preflight Checks](../chapter-06-pre-deployment/preflight-checks.md) - Xác thực trước triển khai
- [Cheat Sheet](../../resources/cheat-sheet.md) - Câu lệnh tham khảo nhanh

---

**Nhớ**: Gỡ lỗi tốt là phải có phương pháp, tỉ mỉ và kiên nhẫn. Các công cụ và kỹ thuật này sẽ giúp bạn chẩn đoán sự cố nhanh hơn và hiệu quả hơn.

---

**Điều hướng**
- **Bài học trước**: [Các sự cố phổ biến](common-issues.md)

- **Bài học tiếp theo**: [Capacity Planning](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Miễn trừ trách nhiệm:
Tài liệu này đã được dịch bằng dịch vụ dịch thuật AI Co-op Translator (https://github.com/Azure/co-op-translator). Mặc dù chúng tôi nỗ lực để đảm bảo độ chính xác, xin lưu ý rằng các bản dịch tự động có thể chứa sai sót hoặc không chính xác. Tài liệu gốc bằng ngôn ngữ ban đầu nên được coi là nguồn có thẩm quyền. Đối với những thông tin quan trọng, khuyến nghị sử dụng dịch vụ dịch thuật chuyên nghiệp do người dịch thực hiện. Chúng tôi không chịu trách nhiệm về bất kỳ hiểu lầm hoặc diễn giải sai nào phát sinh từ việc sử dụng bản dịch này.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->