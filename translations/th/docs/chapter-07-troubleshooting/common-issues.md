# ปัญหาทั่วไปและวิธีแก้ไข

**การนำทางบทเรียน:**
- **📚 หน้าหลักคอร์ส**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 7 - การแก้ไขปัญหา & การดีบัก
- **⬅️ บทก่อนหน้า**: [บทที่ 6: การตรวจสอบก่อนบิน](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ ถัดไป**: [คู่มือการดีบัก](debugging.md)
- **🚀 บทถัดไป**: [บทที่ 8: รูปแบบการใช้งานในโปรดักชัน & องค์กร](../chapter-08-production/production-ai-practices.md)

## บทนำ

คู่มือแก้ไขปัญหาครอบคลุมนี้กล่าวถึงปัญหาที่พบบ่อยที่สุดเมื่อใช้ Azure Developer CLI เรียนรู้การวินิจฉัย แก้ไข และแก้ปัญหาทั่วไปเกี่ยวกับการตรวจสอบสิทธิ์ การปรับใช้งาน การจัดเตรียมโครงสร้างพื้นฐาน และการกำหนดค่าแอปพลิเคชัน แต่ละปัญหาจะมีอาการ สาเหตุหลัก และขั้นตอนการแก้ไขอย่างละเอียด

## เป้าหมายการเรียนรู้

โดยการทำคู่มือนี้ให้เสร็จ คุณจะ:
- เชี่ยวชาญเทคนิคการวินิจฉัยปัญหา Azure Developer CLI
- เข้าใจปัญหาการตรวจสอบสิทธิ์และสิทธิ์การใช้งานที่พบบ่อยพร้อมวิธีแก้ไข
- แก้ไขข้อผิดพลาดการปรับใช้งาน การจัดเตรียมโครงสร้างพื้นฐาน และปัญหาการกำหนดค่า
- นำกลยุทธ์การเฝ้าระวังและดีบักมาใช้เชิงรุก
- ใช้วิธีแก้ไขปัญหาอย่างเป็นระบบสำหรับปัญหาที่ซับซ้อน
- กำหนดค่าการบันทึกและการเฝ้าระวังอย่างเหมาะสมเพื่อป้องกันปัญหาในอนาคต

## ผลลัพธ์การเรียนรู้

เมื่อตัวคุณเสร็จสิ้น คุณจะสามารถ:
- วินิจฉัยปัญหา Azure Developer CLI โดยใช้เครื่องมือวินิจฉัยในตัว
- แก้ไขปัญหาการตรวจสอบสิทธิ์ การสมัครใช้งาน และปัญหาเกี่ยวกับสิทธิ์ได้ด้วยตัวเอง
- แก้ไขปัญหาการล้มเหลวในการปรับใช้งานและข้อผิดพลาดการจัดเตรียมโครงสร้างพื้นฐานได้อย่างมีประสิทธิภาพ
- ดีบักปัญหาการกำหนดค่าแอปพลิเคชันและปัญหาที่เกี่ยวกับสภาพแวดล้อมเฉพาะ
- นำการเฝ้าระวังและแจ้งเตือนมาใช้เพื่อระบุปัญหาได้ล่วงหน้า
- ใช้แนวปฏิบัติที่ดีที่สุดสำหรับการบันทึก ดีบัก และเวิร์กโฟลว์การแก้ไขปัญหา

## การวินิจฉัยอย่างรวดเร็ว

> แทนที่ชื่อ/รหัสตัวอย่างด้วยค่าของสภาพแวดล้อมคุณ ชิ้นส่วน Bash, Bicep, JavaScript และไฟล์พารามิเตอร์แยกต่างหากด้านล่าง; พวกมันไม่ใช่สคริปต์ที่สามารถรันได้ชุดเดียว ตรวจสอบการดำเนินการทำลายและลบความลับก่อนแชร์ผลวินิจฉัย `azd monitor --logs` เปิดเบราว์เซอร์; ไม่สตรีมล็อกเทอร์มินัล

ก่อนเข้าสู่ประเด็นปัญหาเฉพาะ ใช้คำสั่งเหล่านี้เพื่อรวบรวมข้อมูลวินิจฉัย:

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

## ปัญหาเกี่ยวกับการตรวจสอบสิทธิ์

### ปัญหา: "ไม่สามารถรับ access token"
**อาการ:**
- `azd up` ล้มเหลวด้วยข้อผิดพลาดการตรวจสอบสิทธิ์
- คำสั่งส่งกลับ "ไม่ได้รับอนุญาต" หรือ "การเข้าถึงถูกปฏิเสธ"

**วิธีแก้ไข:**
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

### ปัญหา: "สิทธิ์ไม่เพียงพอ" ระหว่างการปรับใช้งาน
**อาการ:**
- การปรับใช้งานล้มเหลวด้วยข้อผิดพลาดสิทธิ์
- ไม่สามารถสร้างทรัพยากร Azure บางชนิดได้

**วิธีแก้ไข:**
```bash
# 1. Check your Azure role assignments
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ensure you have required roles
# - Contributor (for resource creation)
# - User Access Administrator (for role assignments)

# 3. Contact your Azure administrator for proper permissions
```

### ปัญหา: ปัญหาการตรวจสอบสิทธิ์แบบ multi-tenant
**วิธีแก้ไข:**
```bash
# 1. Login with specific tenant
az login --tenant "your-tenant-id"

# 2. Authenticate azd with that tenant too
azd auth login --tenant-id "your-tenant-id"

# 3. Clear tenant cache if switching tenants
az account clear
```

## 🏗️ ข้อผิดพลาดในการจัดเตรียมโครงสร้างพื้นฐาน

### ปัญหา: การขัดกันของชื่อทรัพยากร
**อาการ:**
- ข้อผิดพลาด "ชื่อทรัพยากรนี้มีอยู่แล้ว"
- การปรับใช้งานล้มเหลวระหว่างสร้างทรัพยากร

**วิธีแก้ไข:**
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

### ปัญหา: สถานที่/ภูมิภาคไม่พร้อมใช้งาน
**อาการ:**
- "สถานที่ 'xyz' ไม่พร้อมใช้งานสำหรับชนิดทรัพยากร"
- SKU บางตัวไม่พร้อมใช้งานในภูมิภาคที่เลือก

**วิธีแก้ไข:**
```bash
# 1. Check available locations for resource types
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. For a NEW environment choose a region supported by all required services
azd env set AZURE_LOCATION eastus2

# 3. Check service availability by region
# Visit: https://azure.microsoft.com/global-infrastructure/services/
```

การเปลี่ยนตัวแปรสถานที่ไม่ย้ายทรัพยากรที่มีอยู่ กลุ่มทรัพยากรหรือทรัพยากรที่มีอยู่จะปฏิเสธการเปลี่ยนสถานที่ ใช้สภาพแวดล้อมแยกต่างหากสำหรับการปรับใช้ภูมิภาคใหม่

### ปัญหา: ข้อผิดพลาดเกินโควต้า
**อาการ:**
- "เกินโควต้าสำหรับชนิดทรัพยากร"
- "จำนวนทรัพยากรสูงสุดถึงแล้ว"

**วิธีแก้ไข:**
```bash
# 1. Check current quota usage
az vm list-usage --location eastus2 -o table

# 2. Request quota increase through Azure portal
# Go to: Subscriptions > Usage + quotas

```

สำหรับการพัฒนา ให้เลือก SKU ที่เล็กกว่าที่รองรับใน `infra/main.parameters.json`:

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

### ปัญหา: ข้อผิดพลาดเทมเพลต Bicep
**อาการ:**
- การตรวจสอบความถูกต้องเทมเพลตล้มเหลว
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

## 🚀 การปรับใช้งานล้มเหลว

### ปัญหา: การสร้างล้มเหลว
**อาการ:**
- แอปพลิเคชันสร้างล้มเหลวในระหว่างการปรับใช้งาน
- ข้อผิดพลาดการติดตั้งแพ็กเกจ

**วิธีแก้ไข:**
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

### ปัญหา: การปรับใช้ container ล้มเหลว
**อาการ:**
- แอป container ล้มเหลวในการเริ่มต้น
- ข้อผิดพลาดในการดึงภาพ

**วิธีแก้ไข:**
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

### ปัญหา: การเชื่อมต่อฐานข้อมูลล้มเหลว
**อาการ:**
- แอปไม่สามารถเชื่อมต่อกับฐานข้อมูลได้
- ข้อผิดพลาดหมดเวลาการเชื่อมต่อ

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

## 🔧 ปัญหาการกำหนดค่า

### ปัญหา: ตัวแปรสภาพแวดล้อมไม่ทำงาน
**อาการ:**
- แอปไม่สามารถอ่านค่าการกำหนดค่า
- ตัวแปรสภาพแวดล้อมดูเหมือนว่างเปล่า

**วิธีแก้ไข:**
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

### ปัญหา: ปัญหากำหนดค่า CORS
**อาการ:**
- หน้าเว็บไม่สามารถเรียก API ได้
- คำขอข้ามต้นทางถูกบล็อก

**วิธีแก้ไข:**
```bash
# 1. Configure CORS for App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

```

2. อัปเดตแอป Express ที่มีอยู่ของคุณ (โดยที่ `cors` ถูกนำเข้า):

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
azd env list

# 4. Create new environment if corrupted
azd env new production-new
azd env select production-new
```

### ปัญหา: การเสียหายของสภาพแวดล้อม
**อาการ:**
- สภาพแวดล้อมแสดงสถานะไม่ถูกต้อง
- ทรัพยากรไม่ตรงกับการกำหนดค่า

**วิธีแก้ไข:**
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

## 🔍 ปัญหาด้านประสิทธิภาพ

### ปัญหา: เวลาการปรับใช้งานช้า
**อาการ:**
- การปรับใช้งานใช้เวลานานเกินไป
- หมดเวลาระหว่างการปรับใช้งาน

**วิธีแก้ไข:**
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

### ปัญหา: ปัญหาประสิทธิภาพแอปพลิเคชัน
**อาการ:**
- เวลาตอบสนองช้า
- การใช้ทรัพยากรสูง

**วิธีแก้ไข:**
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

## 🛠️ เครื่องมือและคำสั่งสำหรับแก้ไขปัญหา

### คำสั่งดีบัก
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

### การวิเคราะห์ล็อก
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

### เมื่อไรควรยกระดับ
- ปัญหาการตรวจสอบสิทธิ์ยังคงมีอยู่หลังจากลองแก้ไขทุกรูปแบบ
- ปัญหาโครงสร้างพื้นฐานกับบริการ Azure
- ปัญหาที่เกี่ยวกับบิลหรือการสมัครใช้งาน
- ความกังวลหรือเหตุการณ์ด้านความปลอดภัย

### ช่องทางสนับสนุน
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

### ข้อมูลที่ต้องรวบรวม
ก่อนติดต่อฝ่ายสนับสนุน ให้รวบรวม:
- ผลลัพธ์จาก `azd version`
- ผลลัพธ์จาก `azd config show`
- ผลลัพธ์จาก `azd show` (สถานะการปรับใช้งานปัจจุบัน)
- ข้อความผิดพลาด (ข้อความเต็ม)
- ขั้นตอนการทำซ้ำปัญหา
- รายละเอียดสภาพแวดล้อมที่ถูกลบข้อมูลลับ (ไม่เคยแชร์ `azd env get-values` ที่เป็นดิบซึ่งอาจมีความลับ)
- ไทม์ไลน์เมื่อปัญหาเริ่มต้น

### สคริปต์เก็บล็อก
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

## 📊 การป้องกันปัญหา

### รายการตรวจสอบก่อนการปรับใช้งาน
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

### การตั้งค่าการเฝ้าระวัง
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

### การบำรุงรักษาปกติ
```bash
# Weekly health checks (project-specific script you must implement)
./scripts/health-check.sh

# Monthly cost review
# Review current Cost Management data in the portal; Consumption API support
# depends on your billing agreement.

# Quarterly security review
az security assessment list
```

## แหล่งข้อมูลที่เกี่ยวข้อง

- [คู่มือการดีบัก](debugging.md) - เทคนิคการดีบักขั้นสูง
- [การจัดเตรียมทรัพยากร](../chapter-04-infrastructure/provisioning.md) - การแก้ไขปัญหาโครงสร้างพื้นฐาน
- [การวางแผนความจุ](../chapter-06-pre-deployment/capacity-planning.md) - แนะแนวการวางแผนทรัพยากร
- [การเลือก SKU](../chapter-06-pre-deployment/sku-selection.md) - คำแนะนำระดับบริการ

---

**คำแนะนำ**: เก็บคู่มือนี้ไว้ในบุ๊กมาร์กและอ้างอิงเมื่อเจอปัญหา ปัญหาส่วนใหญ่เคยเห็นมาแล้วและมีวิธีแก้ไขที่กำหนดไว้!

---

**การนำทาง**
- **บทเรียนก่อนหน้า**: [การจัดเตรียมทรัพยากร](../chapter-04-infrastructure/provisioning.md)
- **บทเรียนถัดไป**: [คู่มือการดีบัก](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->