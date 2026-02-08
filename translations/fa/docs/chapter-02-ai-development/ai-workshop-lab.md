# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: فصل 2 - توسعه‌ی مبتنی بر هوش مصنوعی
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Workshop Overview

این لابراتوار عملی توسعه‌دهندگان را در طی تبدیل یک قالب موجود هوش مصنوعی و استقرار آن با استفاده از Azure Developer CLI (AZD) راهنمایی می‌کند. شما الگوهای ضروری برای استقرارهای تولیدی هوش مصنوعی با استفاده از خدمات Microsoft Foundry را خواهید آموخت.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Learning Objectives

تا پایان این کارگاه، شما قادر خواهید بود:
- ✅ تبدیل یک برنامهٔ هوش مصنوعی موجود به استفاده از قالب‌های AZD
- ✅ پیکربندی خدمات Microsoft Foundry با AZD
- ✅ پیاده‌سازی مدیریت امن اعتبارنامه‌ها برای سرویس‌های هوش مصنوعی
- ✅ استقرار برنامه‌های هوش مصنوعی آمادهٔ تولید با مانیتورینگ
- ✅ رفع اشکال مشکلات رایج در استقرار هوش مصنوعی

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) نصب‌شده
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) نصب‌شده
- [Git](https://git-scm.com/) نصب‌شده
- ویرایشگر کد (پیشنهاد شده: VS Code)

### Azure Resources
- اشتراک Azure با دسترسی contributor
- دسترسی به خدمات Azure OpenAI (یا امکان درخواست دسترسی)
- مجوز ایجاد resource group

### Knowledge Prerequisites
- درک پایه‌ای از سرویس‌های Azure
- آشنایی با خط فرمان
- مفاهیم پایه‌ای AI/ML (APIها، مدل‌ها، پرامپت‌ها)

## Lab Setup

### Step 1: Environment Preparation

1. **Verify tool installations:**
```bash
# بررسی نصب AZD
azd version

# بررسی Azure CLI
az --version

# ورود به Azure
az login
azd auth login
```

2. **Clone the workshop repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

به فایل‌های کلیدی در یک قالب AZD آماده برای هوش مصنوعی نگاهی بیندازید:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab Exercise 1.1: Explore the Configuration**

1. **Examine the azure.yaml file:**
```bash
cat azure.yaml
```

**What to look for:**
- تعاریف سرویس برای اجزای هوش مصنوعی
- نگاشت متغیرهای محیطی
- پیکربندی‌های میزبان

2. **Review the main.bicep infrastructure:**
```bash
cat infra/main.bicep
```

**Key AI patterns to identify:**
- تهیه‌ی سرویس Azure OpenAI
- یکپارچگی با Cognitive Search
- مدیریت امن کلیدها
- پیکربندی‌های امنیت شبکه

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: برنامه‌های هوش مصنوعی اغلب به چندین سرویس هماهنگ نیاز دارند
- **Security**: کلیدهای API و نقاط انتهایی نیاز به مدیریت امن دارند
- **Scalability**: بارهای کاری هوش مصنوعی نیازهای مقیاس‌پذیری منحصربه‌فردی دارند
- **Cost Management**: خدمات هوش مصنوعی می‌توانند هزینه‌بر باشند اگر به‌درستی پیکربندی نشوند

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

1. **Create a new AZD environment:**
```bash
azd env new myai-workshop
```

2. **Set required parameters:**
```bash
# منطقهٔ دلخواه Azure خود را تنظیم کنید
azd env set AZURE_LOCATION eastus

# اختیاری: مدل مشخص OpenAI را تنظیم کنید
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Step 2.2: Deploy the Infrastructure and Application

1. **Deploy with AZD:**
```bash
azd up
```

**What happens during `azd up`:**
- ✅ تهیه‌ی سرویس Azure OpenAI
- ✅ ایجاد سرویس Cognitive Search
- ✅ راه‌اندازی App Service برای برنامهٔ وب
- ✅ پیکربندی شبکه و امنیت
- ✅ استقرار کد برنامه
- ✅ راه‌اندازی مانیتورینگ و لاگ‌گیری

2. **Monitor the deployment progress** و منابعی که ایجاد می‌شوند را مشاهده کنید.

### Step 2.3: Verify Your Deployment

1. **Check the deployed resources:**
```bash
azd show
```

2. **Open the deployed application:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Test the AI functionality:**
   - به برنامهٔ وب مراجعه کنید
   - پرس و جوهای نمونه را امتحان کنید
   - بررسی کنید که پاسخ‌های هوش مصنوعی کار می‌کنند

### **Lab Exercise 2.1: Troubleshooting Practice**

**Scenario**: استقرار شما موفق بوده اما هوش مصنوعی پاسخ نمی‌دهد.

**Common issues to check:**
1. **OpenAI API keys**: بررسی کنید که به‌درستی تنظیم شده‌اند
2. **Model availability**: بررسی کنید که منطقهٔ شما از مدل پشتیبانی می‌کند
3. **Network connectivity**: اطمینان حاصل کنید که سرویس‌ها می‌توانند با هم ارتباط برقرار کنند
4. **RBAC permissions**: بررسی کنید که برنامه بتواند به OpenAI دسترسی داشته باشد

**Debugging commands:**
```bash
# متغیرهای محیطی را بررسی کنید
azd env get-values

# لاگ‌های استقرار را مشاهده کنید
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# وضعیت استقرار OpenAI را بررسی کنید
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Update the OpenAI model:**
```bash
# به یک مدل دیگر تغییر دهید (اگر در منطقهٔ شما در دسترس است)
azd env set AZURE_OPENAI_MODEL gpt-4

# با پیکربندی جدید مجدداً مستقر کنید
azd deploy
```

2. **Add additional AI services:**

Edit `infra/main.bicep` to add Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Step 3.2: Environment-Specific Configurations

**Best Practice**: پیکربندی‌های متفاوت برای توسعه در برابر تولید.

1. **Create a production environment:**
```bash
azd env new myai-production
```

2. **Set production-specific parameters:**
```bash
# در محیط تولید معمولاً از SKUهای بالاتری استفاده می‌شود
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# قابلیت‌های امنیتی اضافی را فعال کنید
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Challenge**: قالب را برای توسعهٔ مقرون‌به‌صرفه پیکربندی کنید.

**Tasks:**
1. تعیین کنید کدام SKUها را می‌توان روی tierهای رایگان/ابتدایی تنظیم کرد
2. متغیرهای محیطی را برای حداقل هزینه پیکربندی کنید
3. استقرار دهید و هزینه‌ها را با پیکربندی تولید مقایسه کنید

**Solution hints:**
- در صورت امکان از tier F0 (رایگان) برای Cognitive Services استفاده کنید
- برای محیط توسعه از tier Basic برای Search Service استفاده کنید
- در نظر بگیرید از برنامهٔ Consumption برای Functions استفاده کنید

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Current challenge**: بسیاری از برنامه‌های هوش مصنوعی کلیدهای API را به‌صورت hardcode دارند یا از ذخیره‌سازی نا امن استفاده می‌کنند.

**AZD Solution**: Managed Identity + یکپارچگی با Key Vault.

1. **Review the security configuration in your template:**
```bash
# دنبال پیکربندی Key Vault و Managed Identity بگردید
grep -r "keyVault\|managedIdentity" infra/
```

2. **Verify Managed Identity is working:**
```bash
# بررسی کنید که برنامهٔ وب پیکربندی هویت صحیحی دارد
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Enable private endpoints** (if not already configured):

Add to your bicep template:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Step 4.3: Monitoring and Observability

1. **Configure Application Insights:**
```bash
# Application Insights باید به‌طور خودکار پیکربندی شود
# پیکربندی را بررسی کنید:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Set up AI-specific monitoring:**

Add custom metrics for AI operations:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab Exercise 4.1: Security Audit**

**Task**: استقرار خود را از نظر بهترین شیوه‌های امنیتی بررسی کنید.

**Checklist:**
- [ ] هیچ راز سخت‌رمزگذاری‌شده‌ای در کد یا پیکربندی وجود نداشته باشد
- [ ] از Managed Identity برای احراز هویت سرویس‌به‌سرویس استفاده شود
- [ ] Key Vault اطلاعات حساس پیکربندی را ذخیره کند
- [ ] دسترسی شبکه به‌درستی محدود شده باشد
- [ ] مانیتورینگ و لاگ‌گیری فعال شده باشد

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Before converting your app**, به این سوالات پاسخ دهید:

1. **Application Architecture:**
   - برنامهٔ شما از چه سرویس‌های هوش مصنوعی استفاده می‌کند؟
   - چه منابع محاسباتی نیاز دارد؟
   - آیا نیاز به پایگاه داده دارد؟
   - وابستگی‌های بین سرویس‌ها چیست؟

2. **Security Requirements:**
   - برنامهٔ شما چه داده‌های حساسی را مدیریت می‌کند؟
   - چه الزامات انطباقی دارید؟
   - آیا به شبکهٔ خصوصی نیاز دارید؟

3. **Scaling Requirements:**
   - بار مورد انتظار شما چقدر است؟
   - آیا به auto-scaling نیاز دارید؟
   - آیا الزامات منطقه‌ای وجود دارد؟

### Step 5.2: Create Your AZD Template

**Follow this pattern to convert your app:**

1. **Create the basic structure:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# قالب AZD را مقداردهی اولیه کنید
azd init --template minimal
```

2. **Create azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Create infrastructure templates:**

**infra/main.bicep** - Main template:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI module:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab Exercise 5.1: Template Creation Challenge**

**Challenge**: یک قالب AZD برای یک برنامهٔ پردازش اسناد مبتنی بر هوش مصنوعی ایجاد کنید.

**Requirements:**
- Azure OpenAI برای تحلیل محتوا
- Document Intelligence برای OCR
- Storage Account برای بارگذاری اسناد
- Function App برای منطق پردازش
- Web app برای رابط کاربری

**Bonus points:**
- افزودن هندلینگ مناسب خطا
- شامل برآورد هزینه
- راه‌اندازی داشبوردهای مانیتورینگ

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Symptoms:** استقرار با خطای سهمیه شکست می‌خورد
**Solutions:**
```bash
# سهمیه‌های فعلی را بررسی کنید
az cognitiveservices usage list --location eastus

# درخواست افزایش سهمیه دهید یا منطقه‌ی دیگری را امتحان کنید
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Symptoms:** پاسخ‌های هوش مصنوعی ناموفق هستند یا استقرار مدل خطا می‌دهد
**Solutions:**
```bash
# بررسی در دسترس بودن مدل بر اساس منطقه
az cognitiveservices model list --location eastus

# به‌روزرسانی به مدل موجود
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
**Symptoms:** خطاهای 403 Forbidden هنگام فراخوانی سرویس‌های هوش مصنوعی
**Solutions:**
```bash
# بررسی تخصیص نقش‌ها
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# افزودن نقش‌های مفقود
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Performance Issues

#### Issue 4: Slow AI Responses
**Investigation steps:**
1. بررسی Application Insights برای معیارهای عملکرد
2. بررسی معیارهای سرویس OpenAI در پرتال Azure
3. تایید اتصال شبکه و تاخیر

**Solutions:**
- پیاده‌سازی کش برای پرس‌وجوهای رایج
- استفاده از مدل OpenAI مناسب برای مورد استفادهٔ شما
- در نظر گرفتن read replicas برای سناریوهای بار بالا

### **Lab Exercise 6.1: Debugging Challenge**

**Scenario**: استقرار شما موفق بوده، اما برنامه خطای 500 برمی‌گرداند.

**Debugging tasks:**
1. لاگ‌های برنامه را بررسی کنید
2. اتصال سرویس‌ها را بررسی کنید
3. احراز هویت را تست کنید
4. پیکربندی را بازبینی کنید

**Tools to use:**
- `azd show` برای نمای کلی استقرار
- پرتال Azure برای لاگ‌های تفصیلی سرویس
- Application Insights برای تله‌متری برنامه

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Create custom dashboards:**

به پرتال Azure بروید و یک داشبورد با موارد زیر ایجاد کنید:
- تعداد درخواست‌ها و تاخیر OpenAI
- نرخ خطاهای برنامه
- استفاده از منابع
- پیگیری هزینه

2. **Set up alerts:**
```bash
# هشدار دربارهٔ نرخ بالای خطا
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analyze current costs:**
```bash
# برای دریافت داده‌های هزینه از Azure CLI استفاده کنید.
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implement cost controls:**
- تنظیم هشدارهای بودجه
- استفاده از سیاست‌های autoscaling
- پیاده‌سازی کش درخواست‌ها
- مانیتور کردن مصرف توکن برای OpenAI

### **Lab Exercise 7.1: Performance Optimization**

**Task**: برنامهٔ هوش مصنوعی خود را هم از لحاظ عملکرد و هم هزینه بهینه کنید.

**Metrics to improve:**
- کاهش میانگین زمان پاسخ 20%
- کاهش هزینه‌های ماهانه 15%
- حفظ 99.9% زمان بالا بودن

**Strategies to try:**
- پیاده‌سازی کش پاسخ
- بهینه‌سازی پرامپت‌ها برای کارایی توکن
- استفاده از SKUهای محاسباتی مناسب
- پیکربندی autoscaling مناسب

## Final Challenge: End-to-End Implementation

### Challenge Scenario

مسئولیت ایجاد یک چت‌بات خدمات مشتری مبتنی بر هوش مصنوعی آمادهٔ تولید با الزامات زیر به شما واگذار شده است:

**Functional Requirements:**
- رابط وب برای تعامل با مشتریان
- یکپارچه‌سازی با Azure OpenAI برای پاسخ‌ها
- قابلیت جستجوی اسناد با استفاده از Cognitive Search
- یکپارچه‌سازی با پایگاه دادهٔ مشتری موجود
- پشتیبانی از چند زبان

**Non-Functional Requirements:**
- پشتیبانی از 1000 کاربر همزمان
- SLA با 99.9% زمان بالا بودن
- انطباق SOC 2
- هزینه کمتر از $500/ماه
- استقرار در چند محیط (dev, staging, prod)

### Implementation Steps

1. **Design the architecture**
2. **Create the AZD template**
3. **Implement security measures**
4. **Set up monitoring and alerting**
5. **Create deployment pipelines**
6. **Document the solution**

### Evaluation Criteria

- ✅ **Functionality**: آیا همهٔ الزامات را برآورده می‌کند؟
- ✅ **Security**: آیا بهترین شیوه‌ها پیاده شده‌اند؟
- ✅ **Scalability**: آیا می‌تواند بار را تحمل کند؟
- ✅ **Maintainability**: آیا کد و زیرساخت سازمان‌دهی خوبی دارند؟
- ✅ **Cost**: آیا در بودجه می‌ماند؟

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate
تبریک! شما آزمایشگاه کارگاه هوش مصنوعی را به پایان رسانده‌اید. اکنون باید بتوانید:

- ✅ تبدیل برنامه‌های موجود هوش مصنوعی به الگوهای AZD
- ✅ استقرار برنامه‌های هوش مصنوعی آماده تولید
- ✅ اجرای بهترین شیوه‌های امنیتی برای بارهای کاری هوش مصنوعی
- ✅ نظارت و بهینه‌سازی عملکرد برنامه‌های هوش مصنوعی
- ✅ رفع عیب مشکلات متداول استقرار

### مراحل بعدی
1. اعمال این الگوها در پروژه‌های هوش مصنوعی خود
2. مشارکت با ارائهٔ الگوها به جامعه
3. برای دریافت پشتیبانی مداوم به Discord Microsoft Foundry بپیوندید
4. کاوش موضوعات پیشرفته مانند استقرار در چند منطقه

---

**بازخورد کارگاه**: با به اشتراک‌گذاری تجربه‌تان در [کانال #Azure در Microsoft Foundry Discord](https://discord.gg/microsoft-azure) به ما در بهبود این کارگاه کمک کنید.

---

**ناوبری فصل:**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../../README.md)
- **📖 فصل فعلی**: فصل 2 - توسعه مبتنی بر هوش مصنوعی
- **⬅️ قبلی**: [استقرار مدل هوش مصنوعی](ai-model-deployment.md)
- **➡️ بعدی**: [بهترین شیوه‌های هوش مصنوعی تولیدی](production-ai-practices.md)
- **🚀 فصل بعدی**: [فصل 3: پیکربندی](../chapter-03-configuration/configuration.md)

**نیاز به کمک دارید؟** برای دریافت پشتیبانی و گفتگو دربارهٔ استقرار AZD و هوش مصنوعی به جامعهٔ ما بپیوندید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
سلب مسئولیت:
این سند با استفاده از سرویس ترجمهٔ مبتنی بر هوش مصنوعی Co-op Translator (https://github.com/Azure/co-op-translator) ترجمه شده است. اگرچه ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل اشتباه یا نادرستی‌هایی باشند. سند اصلی به زبان مبدأ باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، توصیه می‌شود از ترجمهٔ حرفه‌ای انسانی استفاده شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->