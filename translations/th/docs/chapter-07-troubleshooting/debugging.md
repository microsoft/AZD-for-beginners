# คู่มือการดีบักสำหรับการปรับใช้ AZD

**การนำทางบท:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: บทที่ 7 - การแก้ไขปัญหา & การดีบัก
- **⬅️ Previous**: [ปัญหาทั่วไป](common-issues.md)
- **➡️ Next**: [การแก้ปัญหาเฉพาะ AI](ai-troubleshooting.md)
- **🚀 Next Chapter**: [บทที่ 8: รูปแบบการผลิตและองค์กร](../chapter-08-production/production-ai-practices.md)

## บทนำ

คู่มือฉบับนี้ครอบคลุมกลยุทธ์ เครื่องมือ และเทคนิคการดีบักขั้นสูงสำหรับการวินิจฉัยและแก้ไขปัญหาที่ซับซ้อนในการปรับใช้ด้วย Azure Developer CLI เรียนรู้วิธีการตรวจสอบอย่างเป็นระบบ เทคนิคการวิเคราะห์ล็อก การโปรไฟล์ประสิทธิภาพ และเครื่องมือวินิจฉัยขั้นสูงเพื่อแก้ไขปัญหาการปรับใช้และปัญหารันไทม์อย่างมีประสิทธิภาพ

## เป้าหมายการเรียนรู้

เมื่อทำคู่มือนี้เสร็จ คุณจะสามารถ:
- เชี่ยวชาญวิธีการดีบักอย่างเป็นระบบสำหรับปัญหา Azure Developer CLI
- เข้าใจการกำหนดค่าการบันทึกขั้นสูงและเทคนิคการวิเคราะห์ล็อก
- นำกลยุทธ์การโปรไฟล์และการเฝ้าติดตามประสิทธิภาพไปใช้
- ใช้เครื่องมือและบริการวินิจฉัยของ Azure เพื่อแก้ไขปัญหาที่ซับซ้อน
- ประยุกต์ใช้การดีบักเครือข่ายและการแก้ไขปัญหาด้านความปลอดภัย
- กำหนดค่าการตรวจสอบและการแจ้งเตือนอย่างครอบคลุมเพื่อการตรวจจับปัญหาเชิงรุก

## ผลลัพธ์การเรียนรู้

หลังจากเสร็จสิ้น คุณจะสามารถ:
- นำวิธี TRIAGE ไปใช้เพื่อดีบักปัญหาการปรับใช้ที่ซับซ้อนอย่างเป็นระบบ
- กำหนดค่าและวิเคราะห์ข้อมูลการบันทึกและการติดตามอย่างครอบคลุม
- ใช้ Azure Monitor, Application Insights และเครื่องมือวินิจฉัยได้อย่างมีประสิทธิภาพ
- แก้ไขปัญหาการเชื่อมต่อเครือข่าย การยืนยันตัวตน และสิทธิ์การเข้าถึงได้อย่างอิสระ
- นำการตรวจสอบและการเพิ่มประสิทธิภาพ performance ไปใช้
- สร้างสคริปต์ดีบักแบบกำหนดเองและงานอัตโนมัติสำหรับปัญหาที่เกิดซ้ำ

## วิธีการดีบัก

### แนวทาง TRIAGE
- **T**ime: ปัญหาเริ่มเกิดขึ้นเมื่อไหร่?
- **R**eproduce: คุณสามารถทำให้เกิดซ้ำได้อย่างสม่ำเสมอหรือไม่?
- **I**solate: ส่วนประกอบใดที่ล้มเหลว?
- **A**nalyze: บันทึกแจ้งอะไรเรา?
- **G**ather: เก็บรวบรวมข้อมูลที่เกี่ยวข้องทั้งหมด
- **E**scalate: เมื่อใดควรขอความช่วยเหลือเพิ่มเติม

## การเปิดโหมดดีบัก

### ตัวแปรสภาพแวดล้อม
```bash
# เปิดการดีบักแบบครอบคลุม
export AZD_DEBUG=true
export AZD_LOG_LEVEL=debug
export AZURE_CORE_DIAGNOSTICS_DEBUG=true

# การดีบักของ Azure CLI
export AZURE_CLI_DIAGNOSTICS=true

# ปิดการส่งข้อมูลเทเลเมทรีเพื่อให้ผลลัพธ์สะอาดขึ้น
export AZD_DISABLE_TELEMETRY=true
```

### การกำหนดค่าแบบดีบัก
```bash
# ตั้งค่าการกำหนดค่าดีบักทั่วทั้งระบบ
azd config set debug.enabled true
azd config set debug.logLevel debug
azd config set debug.verboseOutput true

# เปิดการบันทึกการติดตาม
azd config set trace.enabled true
azd config set trace.outputPath ./debug-traces
```

## 📊 เทคนิคการวิเคราะห์ล็อก

### การทำความเข้าใจระดับล็อก
```
TRACE   - Most detailed, includes internal function calls
DEBUG   - Detailed diagnostic information
INFO    - General operational messages
WARN    - Warning conditions that should be noted
ERROR   - Error conditions that need attention
FATAL   - Critical errors that cause application termination
```

### การวิเคราะห์ล็อกแบบมีโครงสร้าง
```bash
# ดูบันทึกด้วย Azure Monitor (ผ่าน azd monitor)
azd monitor --logs

# ดูบันทึกของแอปแบบเรียลไทม์
azd monitor --live

# สำหรับการวิเคราะห์บันทึกอย่างละเอียด ให้ใช้ Azure CLI กับ App Service หรือ Container App ของคุณ:
# บันทึก App Service
az webapp log tail --name <app-name> --resource-group <rg-name>

# บันทึก Container App
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# ส่งออกบันทึก Application Insights เพื่อการวิเคราะห์
az monitor app-insights query \
    --app <app-insights-name> \
    --analytics-query "traces | where timestamp > ago(1h) | where severityLevel >= 3"
```

### การเชื่อมโยงล็อก
```bash
#!/bin/bash
# correlate-logs.sh - เชื่อมโยงบันทึกข้ามบริการโดยใช้ Azure Monitor

TRACE_ID=$1
APP_INSIGHTS_NAME=$2

if [ -z "$TRACE_ID" ] || [ -z "$APP_INSIGHTS_NAME" ]; then
    echo "Usage: $0 <trace-id> <app-insights-name>"
    exit 1
fi

echo "Correlating logs for trace ID: $TRACE_ID"

# ค้นหาใน Application Insights เพื่อหาบันทึกที่เกี่ยวข้อง
az monitor app-insights query \
    --app "$APP_INSIGHTS_NAME" \
    --analytics-query "union traces, exceptions, requests, dependencies | where operation_Id == '$TRACE_ID' | order by timestamp asc"

# ค้นหาบันทึกกิจกรรมของ Azure
az monitor activity-log list --correlation-id "$TRACE_ID"
```

## 🛠️ เครื่องมือดีบักขั้นสูง

### การสืบค้น Azure Resource Graph
```bash
# ค้นหาทรัพยากรตามแท็ก
az graph query -q "Resources | where tags['azd-env-name'] == 'production' | project name, type, location"

# ค้นหาการปรับใช้ที่ล้มเหลว
az graph query -q "ResourceContainers | where type == 'microsoft.resources/resourcegroups' | extend deploymentStatus = properties.provisioningState | where deploymentStatus != 'Succeeded'"

# ตรวจสอบสถานะของทรัพยากร
az graph query -q "HealthResources | where properties.targetResourceId contains 'myapp' | project properties.targetResourceId, properties.currentHealthStatus"
```

### การดีบักเครือข่าย
```bash
# ทดสอบการเชื่อมต่อระหว่างบริการ
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

# การใช้งาน
test_connectivity "/subscriptions/.../myapp-web" "myapp-api.azurewebsites.net" 443
```

### การดีบักคอนเทนเนอร์
```bash
# แก้ไขปัญหาแอปคอนเทนเนอร์
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

### การดีบักการเชื่อมต่อฐานข้อมูล
```bash
# ดีบักการเชื่อมต่อฐานข้อมูล
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

## 🔬 การดีบักประสิทธิภาพ

### การตรวจสอบประสิทธิภาพแอปพลิเคชัน
```bash
# เปิดการดีบักของ Application Insights
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

# การตรวจสอบประสิทธิภาพที่กำหนดเอง
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

### การวิเคราะห์การใช้งานทรัพยากร
```bash
# ตรวจสอบการใช้งานทรัพยากร
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

## 🧪 การทดสอบและการยืนยัน

### การดีบักการทดสอบแบบผสาน
```bash
#!/bin/bash
# debug-integration-tests.sh

set -e

echo "Running integration tests with debugging..."

# ตั้งค่าสภาพแวดล้อมสำหรับการดีบัก
export NODE_ENV=test
export DEBUG=*
export LOG_LEVEL=debug

# ดึงจุดสิ้นสุดของบริการ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing endpoints:"
echo "Web: $WEB_URL"
echo "API: $API_URL"

# ทดสอบจุดสิ้นสุดสำหรับตรวจสอบสถานะ
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

# เรียกใช้การทดสอบ
test_health "Web" "$WEB_URL"
test_health "API" "$API_URL"

# เรียกใช้การทดสอบแบบบูรณาการที่กำหนดเอง
npm run test:integration
```

### การทดสอบโหลดเพื่อการดีบัก
```bash
# การทดสอบโหลดแบบง่ายเพื่อระบุคอขวดด้านประสิทธิภาพ
load_test() {
    local url=$1
    local concurrent=${2:-10}
    local requests=${3:-100}
    
    echo "Load testing $url with $concurrent concurrent connections, $requests total requests"
    
    # ใช้ Apache Bench (ติดตั้ง: apt-get install apache2-utils)
    ab -n "$requests" -c "$concurrent" -v 2 "$url" > load-test-results.txt
    
    # ดึงเมตริกหลัก
    echo "=== Load Test Results ==="
    grep -E "(Time taken|Requests per second|Time per request)" load-test-results.txt
    
    # ตรวจสอบข้อผิดพลาด
    grep -E "(Failed requests|Non-2xx responses)" load-test-results.txt
}
```

## 🔧 การดีบักโครงสร้างพื้นฐาน

### การดีบักเทมเพลต Bicep
```bash
# ตรวจสอบเทมเพลต Bicep พร้อมผลลัพธ์โดยละเอียด
validate_bicep() {
    local template_file=$1
    
    echo "Validating Bicep template: $template_file"
    
    # การตรวจสอบไวยากรณ์
    az bicep build --file "$template_file" --stdout > /dev/null
    
    # การตรวจสอบลินท์
    az bicep lint --file "$template_file"
    
    # การปรับใช้แบบ What-if
    az deployment group what-if \
        --resource-group "myapp-dev-rg" \
        --template-file "$template_file" \
        --parameters @main.parameters.json
}

# ดีบักการปรับใช้เทมเพลต
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

### การวิเคราะห์สถานะทรัพยากร
```bash
# วิเคราะห์สถานะของทรัพยากรเพื่อหาความไม่สอดคล้อง
analyze_resources() {
    local resource_group=$1
    
    echo "=== Resource Analysis for $resource_group ==="
    
    # แสดงรายการทรัพยากรทั้งหมดพร้อมสถานะของแต่ละทรัพยากร
    az resource list --resource-group "$resource_group" \
        --query "[].{name:name,type:type,provisioningState:properties.provisioningState,location:location}" \
        --output table
    
    # ตรวจสอบทรัพยากรที่ล้มเหลว
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

## 🔒 การดีบักด้านความปลอดภัย

### การดีบักกระบวนการตรวจสอบสิทธิ์
```bash
# ดีบักการตรวจสอบสิทธิ์ของ Azure
debug_auth() {
    echo "=== Current Authentication Status ==="
    az account show --query "{user:user.name,tenant:tenantId,subscription:name}"
    
    echo "=== Token Information ==="
    token=$(az account get-access-token --query accessToken -o tsv)
    
    # ถอดรหัสโทเค็น JWT (ต้องการ jq และ base64)
    echo "$token" | cut -d'.' -f2 | base64 -d | jq '.'
    
    echo "=== Role Assignments ==="
    user_id=$(az account show --query user.name -o tsv)
    az role assignment list --assignee "$user_id" --query "[].{role:roleDefinitionName,scope:scope}"
}

# ดีบักการเข้าถึง Key Vault
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

### การดีบักความปลอดภัยเครือข่าย
```bash
# ดีบักกลุ่มความปลอดภัยของเครือข่าย
debug_network_security() {
    local resource_group=$1
    
    echo "=== Network Security Groups ==="
    az network nsg list --resource-group "$resource_group" --query "[].{name:name,location:location}"
    
    # ตรวจสอบกฎความปลอดภัย
    for nsg in $(az network nsg list --resource-group "$resource_group" --query "[].name" -o tsv); do
        echo "=== Rules for $nsg ==="
        az network nsg rule list --nsg-name "$nsg" --resource-group "$resource_group" \
            --query "[].{name:name,priority:priority,direction:direction,access:access,protocol:protocol,sourcePortRange:sourcePortRange,destinationPortRange:destinationPortRange}"
    done
}
```

## 📱 การดีบักเฉพาะแอปพลิเคชัน

### การดีบักแอป Node.js
```javascript
// debug-middleware.js - มิดเดิลแวร์ดีบักสำหรับ Express
const debug = require('debug')('app:debug');

module.exports = (req, res, next) => {
    const start = Date.now();
    
    // บันทึกรายละเอียดคำขอ
    debug(`${req.method} ${req.url}`, {
        headers: req.headers,
        query: req.query,
        body: req.body,
        userAgent: req.get('User-Agent'),
        ip: req.ip
    });
    
    // เขียนทับ res.json เพื่อบันทึกการตอบกลับ
    const originalJson = res.json;
    res.json = function(data) {
        const duration = Date.now() - start;
        debug(`Response ${res.statusCode} in ${duration}ms`, data);
        return originalJson.call(this, data);
    };
    
    next();
};
```

### การดีบักการสืบค้นฐานข้อมูล
```javascript
// database-debug.js - เครื่องมือสำหรับดีบักฐานข้อมูล
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

## 🚨 ขั้นตอนการดีบักฉุกเฉิน

### การตอบสนองต่อปัญหาในระบบผลิต
```bash
#!/bin/bash
# emergency-debug.sh - การดีบักฉุกเฉินในสภาพแวดล้อมการผลิต

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

# สลับไปยังสภาพแวดล้อมที่ถูกต้อง
azd env select "$ENVIRONMENT"

# รวบรวมข้อมูลที่สำคัญ
echo "=== 1. System Status ==="
azd show --output json > emergency-status.json
cat emergency-status.json | jq '.services[].endpoint'

echo "=== 2. Application Health ==="
for endpoint in $(cat emergency-status.json | jq -r '.services[].endpoint'); do
    echo "Testing $endpoint/health"
    curl -f "$endpoint/health" || echo "❌ Health check failed for $endpoint"
done

echo "=== 3. Recent Errors ==="
# ใช้ Azure Monitor สำหรับบันทึกข้อผิดพลาด
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

### ขั้นตอนการย้อนกลับ
```bash
# สคริปต์ย้อนกลับอย่างรวดเร็ว
quick_rollback() {
    local environment=$1
    local previous_commit=$2
    
    echo "🔄 INITIATING ROLLBACK for $environment"
    
    # สลับสภาพแวดล้อม
    azd env select "$environment"
    
    # ย้อนกลับโดยใช้ Git (AZD ไม่มีฟีเจอร์ย้อนกลับในตัว)
    git checkout "$previous_commit"
    azd deploy
    
    # ตรวจสอบการย้อนกลับ
    echo "Verifying rollback..."
    azd show
    
    # ทดสอบ endpoints ที่สำคัญ
    WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
    curl -f "$WEB_URL/health" || echo "❌ Rollback verification failed"
    
    echo "✅ Rollback completed"
}
```

## 📊 แดชบอร์ดสำหรับการดีบัก

### แดชบอร์ดการตรวจสอบที่กำหนดเอง
```bash
# สร้างคำสืบค้นของ Application Insights เพื่อการดีบัก
create_debug_queries() {
    local app_insights_name=$1
    
    # คำสืบค้นสำหรับข้อผิดพลาด
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "exceptions | where timestamp > ago(1h) | summarize count() by problemId, outerMessage"
    
    # คำสืบค้นสำหรับปัญหาด้านประสิทธิภาพ
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "requests | where timestamp > ago(1h) and duration > 5000 | project timestamp, name, duration, resultCode"
    
    # คำสืบค้นสำหรับการล้มเหลวของการพึ่งพา
    az monitor app-insights query \
        --app "$app_insights_name" \
        --analytics-query "dependencies | where timestamp > ago(1h) and success == false | project timestamp, name, target, resultCode"
}
```

### การรวมล็อก
```bash
# รวบรวมบันทึกจากแหล่งข้อมูล Azure หลายแหล่ง
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

## 🔗 ทรัพยากรขั้นสูง

### สคริปต์ดีบักที่กำหนดเอง
Create a `scripts/debug/` directory with:
- `health-check.sh` - การตรวจสอบสถานะแบบครอบคลุม
- `performance-test.sh` - การทดสอบประสิทธิภาพแบบอัตโนมัติ
- `log-analyzer.py` - การวิเคราะห์และแยกวิเคราะห์ล็อกขั้นสูง
- `resource-validator.sh` - การตรวจสอบความถูกต้องของโครงสร้างพื้นฐาน

### การรวมระบบการตรวจสอบ
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

## แนวปฏิบัติที่ดีที่สุด

1. **Always enable debug logging** in non-production environments
2. **Create reproducible test cases** for issues
3. **Document debugging procedures** for your team
4. **Automate health checks** and monitoring
5. **Keep debug tools updated** with your application changes
6. **Practice debugging procedures** during non-incident times

## ขั้นตอนถัดไป

- [การวางแผนความจุ](../chapter-06-pre-deployment/capacity-planning.md) - วางแผนความต้องการทรัพยากร
- [การเลือก SKU](../chapter-06-pre-deployment/sku-selection.md) - เลือกระดับบริการที่เหมาะสม
- [การตรวจสอบก่อนการปรับใช้](../chapter-06-pre-deployment/preflight-checks.md) - การยืนยันก่อนการปรับใช้
- [ชีทช่วยจำ](../../resources/cheat-sheet.md) - คำสั่งอ้างอิงด่วน

---

**จำไว้ว่า**: การดีบักที่ดีคือการทำอย่างเป็นระบบ รอบคอบ และอดทน เครื่องมือและเทคนิคเหล่านี้จะช่วยให้คุณวินิจฉัยปัญหาได้เร็วขึ้นและมีประสิทธิภาพมากขึ้น

---

**การนำทาง**
- **Previous Lesson**: [ปัญหาทั่วไป](common-issues.md)

- **Next Lesson**: [การวางแผนความจุ](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิด**:
เอกสารฉบับนี้ถูกแปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะมุ่งมั่นเพื่อความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้องได้ เอกสารต้นฉบับในภาษาต้นทางควรถือเป็นแหล่งอ้างอิงหลัก สำหรับข้อมูลที่มีความสำคัญ ขอแนะนำให้ใช้การแปลโดยนักแปลมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->