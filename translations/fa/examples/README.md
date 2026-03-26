# مثال‌ها - قالب‌ها و پیکربندی‌های عملی AZD

**یادگیری از طریق مثال - سازمان‌یافته بر اساس فصل**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../README.md)
- **📖 نگاشت فصل‌ها**: مثال‌ها بر اساس پیچیدگی آموزشی سازمان‌دهی شده‌اند
- **🚀 مثال محلی**: [راهکار چندعاملهٔ خرده‌فروشی](retail-scenario.md)
- **🤖 مثال‌های خارجی هوش مصنوعی**: پیوندها به مخازن Azure Samples

> **📍 مهم: مثال‌های محلی در مقابل خارجی**  
> این مخزن شامل **4 مثال محلی کامل** با پیاده‌سازی‌های کامل است:  
> - **گفت‌وگوی Microsoft Foundry Models** (استقرار gpt-4.1 با رابط گفتگو)  
> - **Container Apps** (API سادهٔ Flask + میکروسرویس‌ها)  
> - **برنامهٔ پایگاه داده** (وب + پایگاه داده SQL)  
> - **راهکار چندعاملهٔ خرده‌فروشی** (راهکار هوش مصنوعی سازمانی)  
>  
> مثال‌های اضافی، **ارجاعات خارجی** به مخازن Azure-Samples هستند که می‌توانید آنها را کلون کنید.

## مقدمه

این دایرکتوری مثال‌ها و منابع عملی را فراهم می‌کند تا با تمرین عملی، Azure Developer CLI را بیاموزید. سناریوی Retail Multi-Agent یک پیاده‌سازی کامل و آماده برای تولید است که در این مخزن گنجانده شده است. مثال‌های اضافی به نمونه‌های رسمی Azure اشاره می‌کنند که الگوهای مختلف AZD را نشان می‌دهند.

### راهنمای درجه‌بندی پیچیدگی

- ⭐ **مبتدی** - مفاهیم پایه، یک سرویس، 15-30 دقیقه
- ⭐⭐ **متوسط** - چند سرویس، ادغام پایگاه داده، 30-60 دقیقه
- ⭐⭐⭐ **پیشرفته** - معماری پیچیده، ادغام هوش مصنوعی، 1-2 ساعت
- ⭐⭐⭐⭐ **حرفه‌ای** - آمادهٔ تولید، الگوهای سازمانی، 2+ ساعت

## 🎯 آنچه در این مخزن واقعاً وجود دارد

### ✅ پیاده‌سازی محلی (آماده برای استفاده)

#### [برنامهٔ گفت‌وگوی Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**استقرار کامل gpt-4.1 با رابط گفتگو که در این مخزن گنجانده شده است**

- **مکان:** `examples/azure-openai-chat/`
- **پیچیدگی:** ⭐⭐ (متوسط)
- **موارد شامل:**
  - استقرار کامل Microsoft Foundry Models (gpt-4.1)
  - رابط گفتگو خط فرمان پایتون
  - ادغام با Key Vault برای نگهداری امن کلیدهای API
  - قالب‌های زیرساختی Bicep
  - ردیابی مصرف توکن و هزینه
  - محدودسازی نرخ و مدیریت خطا

**شروع سریع:**
```bash
# به پوشهٔ example برو
cd examples/azure-openai-chat

# همه چیز را مستقر کن
azd up

# وابستگی‌ها را نصب کن و شروع به گفتگو کن
pip install -r src/requirements.txt
python src/chat.py
```

**فناوری‌ها:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [مثال‌های برنامهٔ کانتینری](container-app/README.md) 🆕
**مثال‌های جامع استقرار کانتینر که در این مخزن گنجانده شده‌اند**

- **مکان:** `examples/container-app/`
- **پیچیدگی:** ⭐-⭐⭐⭐⭐ (از مبتدی تا پیشرفته)
- **موارد شامل:**
  - [راهنمای اصلی](container-app/README.md) - مرور کامل استقرار کانتینرها
  - [API سادهٔ Flask](../../../examples/container-app/simple-flask-api) - مثال پایهٔ REST API
  - [معماری میکروسرویس‌ها](../../../examples/container-app/microservices) - استقرار چندسرویسی آمادهٔ تولید
  - الگوهای شروع سریع، تولید، و پیشرفته
  - مانیتورینگ، امنیت، و بهینه‌سازی هزینه

**شروع سریع:**
```bash
# مشاهده راهنمای اصلی
cd examples/container-app

# استقرار API سادهٔ Flask
cd simple-flask-api
azd up

# استقرار نمونه‌ای از میکروسرویس‌ها
cd ../microservices
azd up
```

**فناوری‌ها:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [راهکار چندعاملهٔ خرده‌فروشی](retail-scenario.md) 🆕
**پیاده‌سازی کامل و آماده برای تولید که در این مخزن گنجانده شده است**

- **مکان:** `examples/retail-multiagent-arm-template/`
- **پیچیدگی:** ⭐⭐⭐⭐ (پیشرفته)
- **موارد شامل:**
  - قالب استقرار کامل ARM
  - معماری چندعامله (مشتری + موجودی)
  - ادغام با Microsoft Foundry Models
  - جستجوی هوش مصنوعی با RAG
  - مانیتورینگ جامع
  - اسکریپت استقرار با یک کلیک

**شروع سریع:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**فناوری‌ها:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 نمونه‌های خارجی Azure (برای استفاده کلون کنید)

مثال‌های زیر در مخازن رسمی Azure-Samples نگهداری می‌شوند. آنها را کلون کنید تا الگوهای مختلف AZD را بررسی کنید:

### برنامه‌های ساده (فصل‌های 1-2)

| قالب | مخزن | پیچیدگی | سرویس‌ها |
|:---------|:-----------|:-----------|:---------|
| **API پایتون (Flask)** | [محلی: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **میکروسرویس‌ها** | [محلی: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | چندسرویسی، Service Bus، Cosmos DB، SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **کانتینر پایتون Flask** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**نحوهٔ استفاده:**
```bash
# هر مثال را کلون کنید
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# مستقر کنید
azd up
```

### مثال‌های برنامهٔ هوش مصنوعی (فصل‌های 2، 5، 8)

| قالب | مخزن | پیچیدگی | تمرکز |
|:---------|:-----------|:-----------|:------|
| **گفت‌وگوی Microsoft Foundry Models** | [محلی: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | استقرار gpt-4.1 |
| **شروع سریع گفت‌وگوی AI** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | گفت‌وگوی پایهٔ هوش مصنوعی |
| **عامل‌های AI** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | چارچوب عامل‌ها |
| **نمونهٔ Search + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | الگوی RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | هوش مصنوعی سازمانی |

### الگوهای پایگاه داده و پیشرفته (فصل‌های 3-8)

| قالب | مخزن | پیچیدگی | تمرکز |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | ادغام با پایگاه داده |
| **پایتون + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL سرورلس |
| **میکروسرویس‌های جاوا** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | چندسرویسی |
| **خط لولهٔ ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## اهداف یادگیری

با کار کردن روی این مثال‌ها، شما:
- جریان‌های کاری Azure Developer CLI را با سناریوهای کاربردی تمرین خواهید کرد
- معماری‌های مختلف برنامه‌ها و پیاده‌سازی‌های azd مربوطه را خواهید شناخت
- الگوهای Infrastructure as Code برای سرویس‌های مختلف Azure را فرا خواهید گرفت
- مدیریت پیکربندی و استراتژی‌های استقرار مخصوص محیط را اعمال خواهید کرد
- الگوهای مانیتورینگ، امنیت و مقیاس‌پذیری را در بسترهای عملی پیاده‌سازی خواهید کرد
- تجربهٔ عیب‌یابی و دیباگ کردن سناریوهای استقرار واقعی را کسب خواهید کرد

## نتایج یادگیری

پس از تکمیل این مثال‌ها، شما قادر خواهید بود:
- انواع مختلف برنامه‌ها را با استفاده از Azure Developer CLI به‌طور مطمئن استقرار دهید
- قالب‌های ارائه‌شده را مطابق با نیازهای برنامهٔ خود تطبیق دهید
- الگوهای زیرساختی سفارشی را با استفاده از Bicep طراحی و پیاده‌سازی کنید
- برنامه‌های چندسرویسی پیچیده را با وابستگی‌های مناسب پیکربندی کنید
- بهترین روش‌های امنیت، مانیتورینگ و عملکرد را در سناریوهای واقعی اعمال کنید
- استقرارها را بر اساس تجربهٔ عملی عیب‌یابی و بهینه‌سازی کنید

## ساختار دایرکتوری

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## مثال‌های شروع سریع

> **💡 تازه با AZD آشنا شده‌اید؟** با مثال شمارهٔ 1 (API Flask) شروع کنید - حدوداً 20 دقیقه طول می‌کشد و مفاهیم اصلی را آموزش می‌دهد.

### برای مبتدیان
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (محلی) ⭐  
   استقرار یک REST API ساده با قابلیت scale-to-zero  
   **زمان:** 20-25 دقیقه | **هزینه:** $0-5/month  
   **آنچه خواهید آموخت:** جریان کاری پایهٔ azd، کانتینری‌سازی، پروب‌های سلامت  
   **نتیجهٔ مورد انتظار:** نقطهٔ پایانی API فعال که "Hello, World!" را بازمی‌گرداند همراه با مانیتورینگ

2. **[وب‌اپ ساده - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   استقرار یک برنامهٔ وب Node.js Express با MongoDB  
   **زمان:** 25-35 دقیقه | **هزینه:** $10-30/month  
   **آنچه خواهید آموخت:** ادغام با پایگاه داده، متغیرهای محیطی، رشته‌های اتصال  
   **نتیجهٔ مورد انتظار:** برنامهٔ Todo با قابلیت ایجاد/خواندن/به‌روزرسانی/حذف

3. **[وب‌سایت استاتیک - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   میزبانی یک وب‌سایت استاتیک React با Azure Static Web Apps  
   **زمان:** 20-30 دقیقه | **هزینه:** $0-10/month  
   **آنچه خواهید آموخت:** میزبانی استاتیک، توابع سرورلس، استقرار CDN  
   **نتیجهٔ مورد انتظار:** رابط کاربری React با بک‌اند API، SSL خودکار، CDN جهانی

### برای کاربران متوسط
4. **[گفت‌وگوی Microsoft Foundry Models](../../../examples/azure-openai-chat)** (محلی) ⭐⭐  
   استقرار gpt-4.1 با رابط گفتگو و مدیریت امن کلید API  
   **زمان:** 35-45 دقیقه | **هزینه:** $50-200/month  
   **آنچه خواهید آموخت:** استقرار Microsoft Foundry Models، ادغام Key Vault، ردیابی توکن  
   **نتیجهٔ مورد انتظار:** برنامهٔ گفت‌وگوی فعال با gpt-4.1 و مانیتورینگ هزینه

5. **[Container App - میکروسرویس‌ها](../../../examples/container-app/microservices)** (محلی) ⭐⭐⭐⭐  
   معماری چندسرویسی آمادهٔ تولید  
   **زمان:** 45-60 دقیقه | **هزینه:** $50-150/month  
   **آنچه خواهید آموخت:** ارتباط سرویس‌ها، صف پیام، ردیابی توزیع‌شده  
   **نتیجهٔ مورد انتظار:** سیستم دوخدمتی (API Gateway + سرویس محصول) با مانیتورینگ

6. **[برنامهٔ پایگاه داده - C# با Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   برنامهٔ وب با API سی‌شارپ و پایگاه دادهٔ Azure SQL  
   **زمان:** 30-45 دقیقه | **هزینه:** $20-80/month  
   **آنچه خواهید آموخت:** Entity Framework، مهاجرت‌های پایگاه داده، امنیت اتصال  
   **نتیجهٔ مورد انتظار:** API سی‌شارپ با بک‌اند Azure SQL و استقرار خودکار اسکیمای پایگاه داده

7. **[تابع سرورلس - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   توابع Azure پایتون با تریگرهای HTTP و Cosmos DB  
   **زمان:** 30-40 دقیقه | **هزینه:** $10-40/month  
   **آنچه خواهید آموخت:** معماری رویدادمحور، مقیاس‌دهی سرورلس، ادغام NoSQL  
   **نتیجهٔ مورد انتظار:** اپلیکیشن تابع که به درخواست‌های HTTP پاسخ می‌دهد و از Cosmos DB استفاده می‌کند

8. **[میکروسرویس‌ها - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   برنامهٔ چندسرویسی جاوا با Container Apps و دروازهٔ API  
   **زمان:** 60-90 دقیقه | **هزینه:** $80-200/month  
   **آنچه خواهید آموخت:** استقرار Spring Boot، سرویس مس، متوازن‌سازی بار  
   **نتیجهٔ مورد انتظار:** سیستم چندسرویسی جاوا با کشف سرویس و مسیریابی

### قالب‌های Microsoft Foundry

1. **[برنامهٔ گفت‌وگوی Microsoft Foundry Models - مثال محلی](../../../examples/azure-openai-chat)** ⭐⭐  
   استقرار کامل gpt-4.1 با رابط گفتگو  
   **زمان:** 35-45 دقیقه | **هزینه:** $50-200/month  
   **نتیجهٔ مورد انتظار:** برنامهٔ گفت‌وگوی فعال با ردیابی توکن و مانیتورینگ هزینه

2. **[جستجو در Azure + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   برنامهٔ گفت‌وگوی هوشمند با معماری RAG  
   **زمان:** 60-90 دقیقه | **هزینه:** $100-300/month  
   **نتیجهٔ مورد انتظار:** رابط گفت‌وگو با RAG و جستجوی اسناد و ارجاعات

3. **[پردازش اسناد AI](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   تحلیل اسناد با استفاده از سرویس‌های هوش مصنوعی Azure  
   **زمان:** 40-60 دقیقه | **هزینه:** $20-80/month  
   **نتیجهٔ مورد انتظار:** API استخراج متن، جداول و موجودیت‌ها از اسناد آپلودشده

4. **[خط لولهٔ یادگیری ماشین](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   جریان کاری MLOps با Azure Machine Learning  
   **زمان:** 2-3 ساعت | **هزینه:** $150-500/month  
   **نتیجهٔ مورد انتظار:** خط لولهٔ خودکار ML با آموزش، استقرار و مانیتورینگ

### سناریوهای دنیای واقعی

#### **راهکار چندعاملهٔ خرده‌فروشی** 🆕  
**[راهنمای پیاده‌سازی کامل](./retail-scenario.md)**

یک راهکار چندعاملهٔ جامع و آمادهٔ تولید برای پشتیبانی مشتری که استقرار برنامه‌های سازمانی مبتنی بر هوش مصنوعی با AZD را نشان می‌دهد. این سناریو ارائه می‌دهد:
- **معماری کامل**: سیستم چندعامله با عامل‌های اختصاصی پشتیبانی مشتری و مدیریت موجودی
- **زیرساخت تولید**: استقرارهای Microsoft Foundry Models در چند منطقه، AI Search، Container Apps و مانیتورینگ جامع
- **قالب ARM آماده برای استقرار**: استقرار با یک کلیک با چند حالت پیکربندی (Minimal/Standard/Premium)
- **ویژگی‌های پیشرفته**: اعتبارسنجی امنیتی red teaming، چارچوب ارزیابی عامل‌ها، بهینه‌سازی هزینه، و راهنماهای عیب‌یابی
- **زمینه کسب‌وکار واقعی**: مورد استفاده پشتیبانی مشتری خرده‌فروش با بارگذاری فایل، ادغام جستجو و مقیاس‌دهی پویا

**فناوری‌ها**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**پیچیدگی**: ⭐⭐⭐⭐ (پیشرفته - آماده تولید سازمانی)

**مناسب برای**: توسعه‌دهندگان هوش‌مصنوعی، معماران راه‌حل، و تیم‌هایی که سیستم‌های چندعامله تولیدی می‌سازند

**شروع سریع**: استقرار کل راه‌حل در کمتر از 30 دقیقه با استفاده از قالب ARM موجود با `./deploy.sh -g myResourceGroup`

## 📋 دستورالعمل‌های استفاده

### پیش‌نیازها

قبل از اجرای هر نمونه:
- ✅ اشتراک Azure با دسترسی Owner یا Contributor
- ✅ Azure Developer CLI نصب شده ([راهنمای نصب](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop در حال اجرا (برای مثال‌های کانتینری)
- ✅ سهمیه‌های مناسب Azure (نیازمندی‌های مخصوص هر مثال را بررسی کنید)

> **💰 هشدار هزینه:** تمام مثال‌ها منابع واقعی Azure ایجاد می‌کنند که هزینه در بر خواهند داشت. برای تخمین هزینه‌ها فایل‌های README مربوطه را ببینید. به یاد داشته باشید پس از اتمام `azd down` را اجرا کنید تا از هزینه‌های جاری جلوگیری شود.

### اجرای مثال‌ها به‌صورت محلی

1. **کلون یا کپی کردن مثال**
   ```bash
   # به مثال مورد نظر بروید
   cd examples/simple-web-app
   ```

2. **راه‌اندازی محیط AZD**
   ```bash
   # با قالب موجود مقداردهی اولیه کنید
   azd init
   
   # یا محیط جدید ایجاد کنید
   azd env new my-environment
   ```

3. **پیکربندی محیط**
   ```bash
   # متغیرهای مورد نیاز را تنظیم کنید
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **استقرار**
   ```bash
   # استقرار زیرساخت و برنامهٔ کاربردی
   azd up
   ```

5. **تأیید استقرار**
   ```bash
   # دریافت نقاط پایانی سرویس
   azd env get-values
   
   # آزمایش نقطه پایانی (نمونه)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **نشانه‌های موفقیت مورد انتظار:**
   - ✅ اجرای `azd up` بدون خطا به پایان می‌رسد
   - ✅ نقطه انتهایی سرویس کد وضعیت HTTP 200 بازمی‌گرداند
   - ✅ Azure Portal وضعیت "Running" را نشان می‌دهد
   - ✅ Application Insights تله‌متری دریافت می‌کند

> **⚠️ مشکل دارید؟** راه‌حل‌های عیب‌یابی استقرار را در [مسائل رایج](../docs/chapter-07-troubleshooting/common-issues.md) ببینید

### سازگارسازی مثال‌ها

هر مثال شامل:
- **README.md** - دستورالعمل‌های دقیق راه‌اندازی و سفارشی‌سازی
- **azure.yaml** - پیکربندی AZD با توضیحات
- **infra/** - قالب‌های Bicep با توضیحات پارامترها
- **src/** - کد نمونه برنامه
- **scripts/** - اسکریپت‌های کمکی برای کارهای متداول

## 🎯 اهداف یادگیری

### دسته‌بندی مثال‌ها

#### **استقرارهای پایه**
- برنامه‌های تک‌خدمتی
- الگوهای زیرساختی ساده
- مدیریت پیکربندی پایه
- تنظیمات توسعه با صرفه‌جویی هزینه

#### **سناریوهای پیشرفته**
- معماری‌های چندسرویسی
- پیکربندی‌های شبکه‌پیچیده
- الگوهای یکپارچه‌سازی پایگاه‌داده
- پیاده‌سازی‌های امنیت و انطباق

#### **الگوهای آماده تولید**
- پیکربندی‌های دسترسی بالا
- مانیتورینگ و قابلیت مشاهده
- ادغام CI/CD
- تنظیمات بازیابی از فاجعه

## 📖 توضیحات مثال‌ها

### Simple Web App - Node.js Express
**فناوری‌ها**: Node.js, Express, MongoDB, Container Apps  
**پیچیدگی**: مبتدی  
**مفاهیم**: استقرار پایه، REST API، یکپارچه‌سازی پایگاه‌داده NoSQL

### Static Website - React SPA
**فناوری‌ها**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**پیچیدگی**: مبتدی  
**مفاهیم**: میزبانی ایستا، بک‌اند بدون سرور، توسعه وب مدرن

### Container App - Python Flask
**فناوری‌ها**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**پیچیدگی**: مبتدی  
**مفاهیم**: کانتینرسازی، REST API، scale-to-zero، پروب‌های سلامت، مانیتورینگ  
**مکان**: [مثال محلی](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**فناوری‌ها**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**پیچیدگی**: پیشرفته  
**مفاهیم**: معماری چندخدمتی، ارتباط سرویس‌ها، صف پیام، ردیابی توزیع‌شده  
**مکان**: [مثال محلی](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**فناوری‌ها**: C# ASP.NET Core, Azure SQL Database, App Service  
**پیچیدگی**: متوسط  
**مفاهیم**: Entity Framework، اتصالات پایگاه‌داده، توسعه وب API

### Serverless Function - Python Azure Functions
**فناوری‌ها**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**پیچیدگی**: متوسط  
**مفاهیم**: معماری رویدادمحور، محاسبات بدون سرور، توسعه فول‌استک

### Microservices - Java Spring Boot
**فناوری‌ها**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**پیچیدگی**: متوسط  
**مفاهیم**: ارتباط میکروسرویس‌ها، سیستم‌های توزیع‌شده، الگوهای سازمانی

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**فناوری‌ها**: Microsoft Foundry Models, Cognitive Search, App Service  
**پیچیدگی**: متوسط  
**مفاهیم**: معماری RAG، جستجوی برداری، یکپارچه‌سازی LLM

#### AI Document Processing
**فناوری‌ها**: Azure AI Document Intelligence, Storage, Functions  
**پیچیدگی**: متوسط  
**مفاهیم**: تحلیل سند، OCR، استخراج داده

#### Machine Learning Pipeline
**فناوری‌ها**: Azure ML, MLOps, Container Registry  
**پیچیدگی**: پیشرفته  
**مفاهیم**: آموزش مدل، خط لوله‌های استقرار، مانیتورینگ

## 🛠 مثال‌های پیکربندی

دایرکتوری `configurations/` شامل اجزای قابل‌استفاده مجدد است:

### پیکربندی‌های محیط
- تنظیمات محیط توسعه
- پیکربندی‌های محیط staging
- پیکربندی‌های آماده برای تولید
- تنظیمات استقرار چندمنطقه‌ای

### ماژول‌های Bicep
- اجزای زیرساختی قابل استفاده مجدد
- الگوهای رایج منابع
- قالب‌های تقویت‌شده برای امنیت
- پیکربندی‌های بهینه‌شده برای هزینه

### اسکریپت‌های کمکی
- خودکارسازی راه‌اندازی محیط
- اسکریپت‌های مهاجرت پایگاه‌داده
- ابزارهای اعتبارسنجی استقرار
- ابزارهای مانیتورینگ هزینه

## 🔧 راهنمای سفارشی‌سازی

### تطبیق مثال‌ها برای مورد استفاده شما

1. **بررسی پیش‌نیازها**
   - نیازمندی‌های سرویس‌های Azure را بررسی کنید
   - محدودیت‌های اشتراک را تأیید کنید
   - پیامدهای هزینه را درک کنید

2. **تغییر پیکربندی**
   - به‌روزرسانی تعاریف سرویس در `azure.yaml`
   - سفارشی‌سازی قالب‌های Bicep
   - تنظیم متغیرهای محیطی

3. **آزمایش کامل**
   - ابتدا در محیط توسعه مستقر کنید
   - عملکرد را اعتبارسنجی کنید
   - مقیاس‌پذیری و عملکرد را آزمایش کنید

4. **بازبینی امنیت**
   - کنترل‌های دسترسی را بررسی کنید
   - مدیریت اسرار را پیاده‌سازی کنید
   - مانیتورینگ و هشداردهی را فعال کنید

## 📊 ماتریس مقایسه

| مثال | سرویس‌ها | پایگاه‌داده | احراز هویت | مانیتورینگ | پیچیدگی |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (محلی) | 2 | ❌ | Key Vault | کامل | ⭐⭐ |
| **Python Flask API** (محلی) | 1 | ❌ | پایه | کامل | ⭐ |
| **Microservices** (محلی) | 5+ | ✅ | سازمانی | پیشرفته | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | پایه | پایه | ⭐ |
| React SPA + Functions | 3 | ✅ | پایه | کامل | ⭐ |
| Python Flask Container | 2 | ❌ | پایه | کامل | ⭐ |
| C# Web API + SQL | 2 | ✅ | کامل | کامل | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | کامل | کامل | ⭐⭐ |
| Java Microservices | 5+ | ✅ | کامل | کامل | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | کامل | کامل | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | پایه | کامل | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | کامل | کامل | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (محلی) | **8+** | **✅** | **سازمانی** | **پیشرفته** | **⭐⭐⭐⭐** |

## 🎓 مسیر یادگیری

### ترتیب پیشنهادی

1. **با برنامه وب ساده شروع کنید**
   - مفاهیم اساسی AZD را بیاموزید
   - جریان کاری استقرار را درک کنید
   - مدیریت محیط را تمرین کنید

2. **وب‌سایت ایستا را امتحان کنید**
   - گزینه‌های مختلف میزبانی را بررسی کنید
   - درباره ادغام CDN بیاموزید
   - پیکربندی DNS را درک کنید

3. **به اپ کانتینر منتقل شوید**
   - اصول کانتینرسازی را بیاموزید
   - مفاهیم مقیاس‌پذیری را درک کنید
   - با Docker تمرین کنید

4. **ادغام پایگاه‌داده را اضافه کنید**
   - تأمین پایگاه‌داده را بیاموزید
   - رشته‌های اتصال را درک کنید
   - مدیریت اسرار را تمرین کنید

5. **به دنیای بدون‌سرور سر بزنید**
   - معماری رویدادمحور را درک کنید
   - درباره تریگرها و بایندینگ‌ها بیاموزید
   - با APIها تمرین کنید

6. **میکروسرویس‌ها را بسازید**
   - ارتباط سرویس‌ها را بیاموزید
   - سیستم‌های توزیع‌شده را درک کنید
   - استقرارهای پیچیده را تمرین کنید

## 🔍 یافتن مثال مناسب

### بر اساس پشته فناوری
- **Container Apps**: [Python Flask API (محلی)](../../../examples/container-app/simple-flask-api), [Microservices (محلی)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (محلی)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (محلی)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (محلی)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (محلی)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (محلی)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (محلی)](../../../examples/container-app/simple-flask-api), [Microservices (محلی)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (محلی)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (محلی)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **راه‌حل چندعامله خرده‌فروشی**
- **Multi-Agent Systems**: **راه‌حل چندعامله خرده‌فروشی**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (محلی)](../../../examples/azure-openai-chat)**, راه‌حل چندعامله خرده‌فروشی
- **Enterprise Production**: [Microservices (محلی)](../../../examples/container-app/microservices), **راه‌حل چندعامله خرده‌فروشی**

### بر اساس الگوی معماری
- **Simple REST API**: [Python Flask API (محلی)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (محلی)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (محلی)](../../../examples/container-app/simple-flask-api), [Microservices (محلی)](../../../examples/container-app/microservices), Java Microservices
- **AI-Powered**: **[Microsoft Foundry Models Chat (محلی)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **راه‌حل چندعامله خرده‌فروشی**
- **Multi-Agent Architecture**: **راه‌حل چندعامله خرده‌فروشی**
- **Enterprise Multi-Service**: [Microservices (محلی)](../../../examples/container-app/microservices), **راه‌حل چندعامله خرده‌فروشی**

### بر اساس سطح پیچیدگی
- **Beginner**: [Python Flask API (محلی)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermediate**: **[Microsoft Foundry Models Chat (محلی)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Advanced**: ML Pipeline
- **Enterprise Production-Ready**: [Microservices (محلی)](../../../examples/container-app/microservices) (چندخدمتی با صف پیام)، **راه‌حل چندعامله خرده‌فروشی** (سیستم چندعامله کامل با قالب ARM برای استقرار)

## 📚 منابع اضافی

### پیوندهای مستندسازی
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### مثال‌های جامعه
- [قالب‌های نمونه AZD Azure](https://github.com/Azure-Samples/azd-templates)
- [قالب‌های Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [گالری Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [برنامه Todo با C# و Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [برنامه Todo با Python و MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [برنامه Todo با Node.js و PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [برنامه وب React با API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [وظیفه Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions با Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### بهترین روش‌ها
- [چارچوب Well-Architected برای Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [چارچوب پذیرش ابر](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 مشارکت در ارسال مثال‌ها

یک مثال مفید برای به اشتراک‌گذاری دارید؟ ما از مشارکت‌ها استقبال می‌کنیم!

### راهنمای ارسال
1. از ساختار دایرکتوری تعیین‌شده پیروی کنید
2. README.md جامع را اضافه کنید
3. به فایل‌های پیکربندی توضیحات اضافه کنید
4. قبل از ارسال به‌طور کامل تست کنید
5. تخمین هزینه‌ها و پیش‌نیازها را اضافه کنید

### ساختار قالب نمونه
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**نکته حرفه‌ای**: با ساده‌ترین مثالی که با پشته فناوری شما مطابقت دارد شروع کنید، سپس به‌تدریج به سناریوهای پیچیده‌تر بروید. هر مثال بر پایه مفاهیم مثال‌های قبلی ساخته شده است!

## 🚀 آماده برای شروع؟

### مسیر یادگیری شما

1. **کاملاً مبتدی؟** → با [API فلاسک](../../../examples/container-app/simple-flask-api) شروع کنید (⭐، 20 دقیقه)
2. **دانش پایه‌ای از AZD دارید؟** → [میکروسرویس‌ها](../../../examples/container-app/microservices) را امتحان کنید (⭐⭐⭐⭐، 60 دقیقه)
3. **در حال ساخت برنامه‌های هوش‌مصنوعی هستید؟** → با [گفتگوی مدل‌های Microsoft Foundry](../../../examples/azure-openai-chat) شروع کنید (⭐⭐، 35 دقیقه) یا [Retail Multi-Agent](retail-scenario.md) را بررسی کنید (⭐⭐⭐⭐، بیش از 2 ساعت)
4. **به پشته فناوری خاصی نیاز دارید؟** → از بخش [یافتن مثال مناسب](#-finding-the-right-example) در بالا استفاده کنید

### گام‌های بعدی

- ✅ مرور [پیش‌نیازها](#پیش‌نیازها) در بالا
- ✅ یک مثال متناسب با سطح مهارت خود انتخاب کنید (نگاه کنید به [راهنمای پیچیدگی](#راهنمای-درجه‌بندی-پیچیدگی))
- ✅ README مثال را قبل از استقرار به‌دقت بخوانید
- ✅ یک یادآور برای اجرای `azd down` بعد از تست تنظیم کنید
- ✅ تجربه خود را از طریق Issues یا Discussions در GitHub به اشتراک بگذارید

### نیاز به کمک؟

- 📖 [سؤالات متداول](../resources/faq.md) - پاسخ به پرسش‌های رایج
- 🐛 [راهنمای عیب‌یابی](../docs/chapter-07-troubleshooting/common-issues.md) - رفع مشکلات استقرار
- 💬 [گفت‌وگوهای GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - از جامعه سؤال بپرسید
- 📚 [راهنمای مطالعه](../resources/study-guide.md) - یادگیری خود را تقویت کنید

---

**ناوبری**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../README.md)
- **📖 مطالب آموزشی**: [راهنمای مطالعه](../resources/study-guide.md) | [چیت‌شیت](../resources/cheat-sheet.md) | [واژه‌نامه](../resources/glossary.md)
- **🔧 منابع**: [سؤالات متداول](../resources/faq.md) | [عیب‌یابی](../docs/chapter-07-troubleshooting/common-issues.md)

---

*آخرین به‌روزرسانی: نوامبر ۲۰۲۵ | [گزارش مشکلات](https://github.com/microsoft/AZD-for-beginners/issues) | [ارسال مثال‌ها](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری‌اش باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->