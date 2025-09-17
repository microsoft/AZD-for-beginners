<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e3b1c94a2da4a497e880ebe7b89c2bb1",
  "translation_date": "2025-09-17T23:00:10+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "th"
}
-->
# ปัญหาทั่วไปและวิธีแก้ไข

**การนำทางบทเรียน:**
- **📚 หน้าแรกของคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทเรียนปัจจุบัน**: บทที่ 7 - การแก้ไขปัญหาและการดีบัก
- **⬅️ บทก่อนหน้า**: [บทที่ 6: การตรวจสอบก่อนการใช้งาน](../pre-deployment/preflight-checks.md)
- **➡️ ถัดไป**: [คู่มือการดีบัก](debugging.md)
- **🚀 บทถัดไป**: [บทที่ 8: รูปแบบการใช้งานในระดับองค์กรและการผลิต](../ai-foundry/production-ai-practices.md)

## บทนำ

คู่มือการแก้ไขปัญหาฉบับสมบูรณ์นี้ครอบคลุมปัญหาที่พบบ่อยที่สุดเมื่อใช้งาน Azure Developer CLI เรียนรู้วิธีวินิจฉัย แก้ไข และจัดการปัญหาทั่วไปเกี่ยวกับการยืนยันตัวตน การใช้งาน การจัดเตรียมโครงสร้างพื้นฐาน และการตั้งค่าการใช้งานแอปพลิเคชัน แต่ละปัญหามีการอธิบายอาการ สาเหตุ และขั้นตอนการแก้ไขอย่างละเอียด

## เป้าหมายการเรียนรู้

เมื่อจบคู่มือนี้ คุณจะ:
- เชี่ยวชาญเทคนิคการวินิจฉัยปัญหาของ Azure Developer CLI
- เข้าใจปัญหาการยืนยันตัวตนและสิทธิ์ที่พบบ่อย รวมถึงวิธีแก้ไข
- แก้ไขปัญหาการใช้งาน การจัดเตรียมโครงสร้างพื้นฐาน และการตั้งค่าการใช้งาน
- ใช้กลยุทธ์การตรวจสอบและการดีบักเชิงรุก
- ใช้กระบวนการแก้ไขปัญหาอย่างเป็นระบบสำหรับปัญหาที่ซับซ้อน
- ตั้งค่าการบันทึกและการตรวจสอบที่เหมาะสมเพื่อป้องกันปัญหาในอนาคต

## ผลลัพธ์การเรียนรู้

เมื่อจบคู่มือนี้ คุณจะสามารถ:
- วินิจฉัยปัญหา Azure Developer CLI โดยใช้เครื่องมือวินิจฉัยในตัว
- แก้ไขปัญหาการยืนยันตัวตน การสมัครสมาชิก และสิทธิ์ได้ด้วยตัวเอง
- แก้ไขปัญหาการใช้งานและการจัดเตรียมโครงสร้างพื้นฐานได้อย่างมีประสิทธิภาพ
- ดีบักปัญหาการตั้งค่าแอปพลิเคชันและปัญหาเฉพาะสภาพแวดล้อม
- ใช้การตรวจสอบและการแจ้งเตือนเพื่อระบุปัญหาที่อาจเกิดขึ้นล่วงหน้า
- ใช้แนวทางปฏิบัติที่ดีที่สุดสำหรับการบันทึก การดีบัก และกระบวนการแก้ไขปัญหา

## การวินิจฉัยเบื้องต้น

ก่อนที่จะเจาะลึกปัญหาเฉพาะ ให้รันคำสั่งเหล่านี้เพื่อรวบรวมข้อมูลการวินิจฉัย:

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

## ปัญหาการยืนยันตัวตน

### ปัญหา: "ไม่สามารถรับ access token ได้"
**อาการ:**
- `azd up` ล้มเหลวพร้อมข้อผิดพลาดการยืนยันตัวตน
- คำสั่งแสดง "unauthorized" หรือ "access denied"

**วิธีแก้ไข:**
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

### ปัญหา: "สิทธิ์ไม่เพียงพอ" ระหว่างการใช้งาน
**อาการ:**
- การใช้งานล้มเหลวพร้อมข้อผิดพลาดสิทธิ์
- ไม่สามารถสร้างทรัพยากร Azure บางอย่างได้

**วิธีแก้ไข:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### ปัญหา: ปัญหาการยืนยันตัวตนแบบหลายผู้เช่า
**วิธีแก้ไข:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Set tenant in configuration
azd config set auth.tenantId "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ ข้อผิดพลาดการจัดเตรียมโครงสร้างพื้นฐาน

### ปัญหา: ชื่อทรัพยากรซ้ำกัน
**อาการ:**
- ข้อผิดพลาด "ชื่อทรัพยากรมีอยู่แล้ว"
- การใช้งานล้มเหลวระหว่างการสร้างทรัพยากร

**วิธีแก้ไข:**
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

### ปัญหา: สถานที่/ภูมิภาคไม่พร้อมใช้งาน
**อาการ:**
- ข้อผิดพลาด "สถานที่ 'xyz' ไม่พร้อมใช้งานสำหรับประเภททรัพยากร"
- SKU บางตัวไม่พร้อมใช้งานในภูมิภาคที่เลือก

**วิธีแก้ไข:**
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

### ปัญหา: ข้อผิดพลาดเกินโควต้า
**อาการ:**
- ข้อผิดพลาด "เกินโควต้าสำหรับประเภททรัพยากร"
- "จำนวนทรัพยากรสูงสุดที่อนุญาต"

**วิธีแก้ไข:**
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

### ปัญหา: ข้อผิดพลาดในเทมเพลต Bicep
**อาการ:**
- การตรวจสอบเทมเพลตล้มเหลว
- ข้อผิดพลาดไวยากรณ์ในไฟล์ Bicep

**วิธีแก้ไข:**
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

## 🚀 ข้อผิดพลาดการใช้งาน

### ปัญหา: การสร้างแอปพลิเคชันล้มเหลว
**อาการ:**
- แอปพลิเคชันล้มเหลวระหว่างการใช้งาน
- ข้อผิดพลาดการติดตั้งแพ็กเกจ

**วิธีแก้ไข:**
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

### ปัญหา: การใช้งานคอนเทนเนอร์ล้มเหลว
**อาการ:**
- แอปคอนเทนเนอร์ไม่สามารถเริ่มต้นได้
- ข้อผิดพลาดการดึงภาพ

**วิธีแก้ไข:**
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

### ปัญหา: การเชื่อมต่อฐานข้อมูลล้มเหลว
**อาการ:**
- แอปพลิเคชันไม่สามารถเชื่อมต่อกับฐานข้อมูลได้
- ข้อผิดพลาดการหมดเวลาการเชื่อมต่อ

**วิธีแก้ไข:**
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

## 🔧 ปัญหาการตั้งค่า

### ปัญหา: ตัวแปรสภาพแวดล้อมไม่ทำงาน
**อาการ:**
- แอปไม่สามารถอ่านค่าการตั้งค่าได้
- ตัวแปรสภาพแวดล้อมแสดงค่าเป็นว่างเปล่า

**วิธีแก้ไข:**
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

### ปัญหา: ปัญหาใบรับรอง SSL/TLS
**อาการ:**
- HTTPS ไม่ทำงาน
- ข้อผิดพลาดการตรวจสอบใบรับรอง

**วิธีแก้ไข:**
```bash
# 1. Check SSL certificate status
az webapp config ssl list --resource-group myrg

# 2. Enable HTTPS only
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Add custom domain (if needed)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### ปัญหา: ปัญหาการตั้งค่า CORS
**อาการ:**
- ส่วนหน้าไม่สามารถเรียก API ได้
- การร้องขอข้ามต้นทางถูกบล็อก

**วิธีแก้ไข:**
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

## 🌍 ปัญหาการจัดการสภาพแวดล้อม

### ปัญหา: ปัญหาการสลับสภาพแวดล้อม
**อาการ:**
- ใช้สภาพแวดล้อมผิด
- การตั้งค่าไม่สลับอย่างถูกต้อง

**วิธีแก้ไข:**
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

### ปัญหา: สภาพแวดล้อมเสียหาย
**อาการ:**
- สภาพแวดล้อมแสดงสถานะไม่ถูกต้อง
- ทรัพยากรไม่ตรงกับการตั้งค่า

**วิธีแก้ไข:**
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

## 🔍 ปัญหาด้านประสิทธิภาพ

### ปัญหา: เวลาการใช้งานช้า
**อาการ:**
- การใช้งานใช้เวลานานเกินไป
- การหมดเวลาระหว่างการใช้งาน

**วิธีแก้ไข:**
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

### ปัญหา: ปัญหาประสิทธิภาพของแอปพลิเคชัน
**อาการ:**
- เวลาตอบสนองช้า
- การใช้ทรัพยากรสูง

**วิธีแก้ไข:**
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

## 🛠️ เครื่องมือและคำสั่งสำหรับการแก้ไขปัญหา

### คำสั่งดีบัก
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

### การวิเคราะห์บันทึก
```bash
# Application logs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure resource logs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Container logs (for Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### การตรวจสอบทรัพยากร
```bash
# List all resources
az resource list --resource-group myrg -o table

# Check resource status
az webapp show --name myapp --resource-group myrg --query state

# Network diagnostics
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 การขอความช่วยเหลือเพิ่มเติม

### เมื่อควรส่งต่อปัญหา
- ปัญหาการยืนยันตัวตนยังคงอยู่หลังจากลองวิธีแก้ไขทั้งหมด
- ปัญหาโครงสร้างพื้นฐานกับบริการ Azure
- ปัญหาด้านการเรียกเก็บเงินหรือการสมัครสมาชิก
- ความกังวลด้านความปลอดภัยหรือเหตุการณ์

### ช่องทางการสนับสนุน
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

### ข้อมูลที่ควรรวบรวม
ก่อนติดต่อฝ่ายสนับสนุน ให้รวบรวม:
- ผลลัพธ์ `azd version`
- ผลลัพธ์ `azd info`
- ข้อความแสดงข้อผิดพลาด (ข้อความเต็ม)
- ขั้นตอนการทำซ้ำปัญหา
- รายละเอียดสภาพแวดล้อม (`azd env show`)
- ไทม์ไลน์ของเวลาที่ปัญหาเริ่มต้น

### สคริปต์การรวบรวมบันทึก
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

## 📊 การป้องกันปัญหา

### รายการตรวจสอบก่อนการใช้งาน
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

### การตั้งค่าการตรวจสอบ
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

### การบำรุงรักษาอย่างสม่ำเสมอ
```bash
# Weekly health checks
./scripts/health-check.sh

# Monthly cost review
az consumption usage list --billing-period-name 202401

# Quarterly security review
az security assessment list --resource-group myrg
```

## แหล่งข้อมูลที่เกี่ยวข้อง

- [คู่มือการดีบัก](debugging.md) - เทคนิคการดีบักขั้นสูง
- [การจัดเตรียมทรัพยากร](../deployment/provisioning.md) - การแก้ไขปัญหาโครงสร้างพื้นฐาน
- [การวางแผนความจุ](../pre-deployment/capacity-planning.md) - คำแนะนำการวางแผนทรัพยากร
- [การเลือก SKU](../pre-deployment/sku-selection.md) - คำแนะนำการเลือกระดับบริการ

---

**เคล็ดลับ**: บุ๊กมาร์กคู่มือนี้ไว้และอ้างอิงเมื่อคุณพบปัญหา ปัญหาส่วนใหญ่เคยเกิดขึ้นมาก่อนและมีวิธีแก้ไขที่กำหนดไว้แล้ว!

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [การจัดเตรียมทรัพยากร](../deployment/provisioning.md)
- **บทเรียนถัดไป**: [คู่มือการดีบัก](debugging.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้