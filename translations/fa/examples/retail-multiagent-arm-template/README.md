<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T17:13:38+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "fa"
}
-->
# راه‌حل چندعاملی خرده‌فروشی - استقرار قالب ARM

**فصل ۵: بسته استقرار تولید**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل مرتبط**: [فصل ۵: راه‌حل‌های هوش مصنوعی چندعاملی](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 راهنمای سناریو**: [پیاده‌سازی کامل](../retail-scenario.md)
- **🎯 استقرار سریع**: [استقرار با یک کلیک](../../../../examples/retail-multiagent-arm-template)

این پوشه شامل یک قالب کامل Azure Resource Manager (ARM) برای استقرار راه‌حل چندعاملی پشتیبانی مشتری در خرده‌فروشی است که زیرساخت به‌عنوان کد را برای کل معماری فراهم می‌کند.

## 🎯 چه چیزی مستقر می‌شود

### زیرساخت اصلی
- **خدمات Azure OpenAI** (چندمنطقه‌ای برای دسترسی بالا)
  - منطقه اصلی: GPT-4o برای عامل مشتری
  - منطقه ثانویه: GPT-4o-mini برای عامل موجودی  
  - منطقه سوم: مدل تعبیه متن
  - منطقه ارزیابی: مدل ارزیاب GPT-4o
- **جستجوی هوش مصنوعی Azure** با قابلیت‌های جستجوی برداری
- **حساب ذخیره‌سازی Azure** با کانتینرهای blob برای اسناد و آپلودها
- **محیط برنامه‌های کانتینری Azure** با مقیاس‌پذیری خودکار
- **برنامه‌های کانتینری** برای مسیریاب عامل و رابط کاربری
- **Azure Cosmos DB** برای ذخیره تاریخچه چت
- **Azure Key Vault** برای مدیریت اسرار (اختیاری)
- **Application Insights** و Log Analytics برای نظارت (اختیاری)
- **هوش اسنادی** برای پردازش اسناد
- **API جستجوی Bing** برای اطلاعات بلادرنگ

### حالت‌های استقرار

| حالت | توضیحات | مورد استفاده | منابع |
|------|-------------|----------|-----------|
| **حداقلی** | استقرار بهینه از نظر هزینه | توسعه، آزمایش | SKUs پایه، یک منطقه، ظرفیت کاهش‌یافته |
| **استاندارد** | استقرار متعادل برای بارهای کاری تولید | تولید، مقیاس متوسط | SKUs استاندارد، چندمنطقه‌ای، ظرفیت استاندارد |
| **پیشرفته** | استقرار با عملکرد بالا و درجه سازمانی | سازمانی، مقیاس بالا | SKUs پیشرفته، چندمنطقه‌ای، ظرفیت بالا |

## 📋 پیش‌نیازها

1. **Azure CLI** نصب و پیکربندی شده
2. **اشتراک فعال Azure** با سهمیه‌های کافی
3. **مجوزهای مناسب** برای ایجاد منابع در اشتراک هدف
4. **سهمیه‌های منابع** برای:
   - Azure OpenAI (بررسی دسترسی منطقه‌ای)
   - برنامه‌های کانتینری (متفاوت بر اساس منطقه)
   - جستجوی هوش مصنوعی (توصیه به استفاده از سطح استاندارد یا بالاتر)

## 🚀 استقرار سریع

### گزینه ۱: استفاده از Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### گزینه ۲: استفاده از پورتال Azure

[![استقرار در Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### گزینه ۳: استفاده مستقیم از Azure CLI

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ گزینه‌های پیکربندی

### پارامترهای قالب

| پارامتر | نوع | پیش‌فرض | توضیحات |
|-----------|------|---------|-------------|
| `projectName` | string | "retail" | پیشوند برای همه نام‌های منابع |
| `location` | string | مکان گروه منابع | منطقه اصلی استقرار |
| `secondaryLocation` | string | "westus2" | منطقه ثانویه برای استقرار چندمنطقه‌ای |
| `tertiaryLocation` | string | "francecentral" | منطقه برای مدل‌های تعبیه |
| `environmentName` | string | "dev" | تعیین محیط (dev/staging/prod) |
| `deploymentMode` | string | "standard" | پیکربندی استقرار (حداقلی/استاندارد/پیشرفته) |
| `enableMultiRegion` | bool | true | فعال‌سازی استقرار چندمنطقه‌ای |
| `enableMonitoring` | bool | true | فعال‌سازی Application Insights و ثبت |
| `enableSecurity` | bool | true | فعال‌سازی Key Vault و امنیت پیشرفته |

### سفارشی‌سازی پارامترها

ویرایش `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ نمای کلی معماری

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 استفاده از اسکریپت استقرار

اسکریپت `deploy.sh` تجربه استقرار تعاملی را فراهم می‌کند:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### ویژگی‌های اسکریپت

- ✅ **اعتبارسنجی پیش‌نیازها** (Azure CLI، وضعیت ورود، فایل‌های قالب)
- ✅ **مدیریت گروه منابع** (ایجاد در صورت عدم وجود)
- ✅ **اعتبارسنجی قالب** قبل از استقرار
- ✅ **نظارت بر پیشرفت** با خروجی رنگی
- ✅ **نمایش خروجی‌های استقرار**
- ✅ **راهنمایی پس از استقرار**

## 📊 نظارت بر استقرار

### بررسی وضعیت استقرار

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### خروجی‌های استقرار

پس از استقرار موفقیت‌آمیز، خروجی‌های زیر در دسترس هستند:

- **URL رابط کاربری**: نقطه پایانی عمومی برای رابط وب
- **URL مسیریاب**: نقطه پایانی API برای مسیریاب عامل
- **نقاط پایانی OpenAI**: نقاط پایانی خدمات OpenAI اصلی و ثانویه
- **خدمات جستجو**: نقطه پایانی خدمات جستجوی هوش مصنوعی Azure
- **حساب ذخیره‌سازی**: نام حساب ذخیره‌سازی برای اسناد
- **Key Vault**: نام Key Vault (در صورت فعال بودن)
- **Application Insights**: نام خدمات نظارت (در صورت فعال بودن)

## 🔧 پیکربندی پس از استقرار

### ۱. پیکربندی شاخص جستجو

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### ۲. آپلود داده اولیه

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### ۳. آزمایش نقاط پایانی عامل

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### ۴. پیکربندی برنامه‌های کانتینری

قالب ARM تصاویر کانتینری جایگزین را مستقر می‌کند. برای استقرار کد واقعی عامل:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ رفع اشکال

### مشکلات رایج

#### ۱. سهمیه Azure OpenAI تمام شده

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### ۲. استقرار برنامه‌های کانتینری شکست خورد

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### ۳. راه‌اندازی خدمات جستجو

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### اعتبارسنجی استقرار

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 ملاحظات امنیتی

### مدیریت کلید
- همه اسرار در Azure Key Vault ذخیره می‌شوند (در صورت فعال بودن)
- برنامه‌های کانتینری از هویت مدیریت‌شده برای احراز هویت استفاده می‌کنند
- حساب‌های ذخیره‌سازی دارای تنظیمات پیش‌فرض امن هستند (فقط HTTPS، بدون دسترسی عمومی به blob)

### امنیت شبکه
- برنامه‌های کانتینری از شبکه داخلی استفاده می‌کنند تا حد امکان
- خدمات جستجو با گزینه نقاط پایانی خصوصی پیکربندی شده‌اند
- Cosmos DB با حداقل مجوزهای لازم پیکربندی شده است

### پیکربندی RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 بهینه‌سازی هزینه

### برآورد هزینه‌ها (ماهانه، USD)

| حالت | OpenAI | برنامه‌های کانتینری | جستجو | ذخیره‌سازی | مجموع تخمینی |
|------|--------|----------------|--------|---------|------------|
| حداقلی | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| استاندارد | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| پیشرفته | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### نظارت بر هزینه‌ها

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 به‌روزرسانی‌ها و نگهداری

### به‌روزرسانی قالب
- فایل‌های قالب ARM را تحت کنترل نسخه قرار دهید
- تغییرات را ابتدا در محیط توسعه آزمایش کنید
- از حالت استقرار افزایشی برای به‌روزرسانی‌ها استفاده کنید

### به‌روزرسانی منابع
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### پشتیبان‌گیری و بازیابی
- پشتیبان‌گیری خودکار Cosmos DB فعال است
- حذف نرم Key Vault فعال است
- نسخه‌های برنامه کانتینری برای بازگشت به حالت قبلی حفظ می‌شوند

## 📞 پشتیبانی

- **مشکلات قالب**: [مشکلات GitHub](https://github.com/microsoft/azd-for-beginners/issues)
- **پشتیبانی Azure**: [پورتال پشتیبانی Azure](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **جامعه**: [Discord هوش مصنوعی Azure](https://discord.gg/microsoft-azure)

---

**⚡ آماده استقرار راه‌حل چندعاملی خود هستید؟**

شروع کنید با: `./deploy.sh -g myResourceGroup`

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.