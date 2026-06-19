# مثال‌ها - الگوها و پیکربندی‌های عملی AZD

**یادگیری از طریق مثال - سازماندهی شده بر اساس فصل**
- **📚 صفحه دوره**: [AZD برای مبتدیان](../README.md)
- **📖 نگاشت فصل‌ها**: مثال‌ها سازماندهی شده بر اساس پیچیدگی یادگیری
- **🚀 مثال محلی**: [راهکار چندعامله خرده‌فروشی](retail-scenario.md)
- **🤖 مثال‌های خارجی هوش مصنوعی**: پیوندها به مخازن Azure Samples

> **📍 مهم: مثال‌های محلی در مقابل خارجی**  
> این مخزن شامل **۴ مثال محلی کامل** با پیاده‌سازی‌های کامل است:  
> - **Microsoft Foundry Models Chat** (استقرار gpt-4.1 با رابط چت)  
> - **Container Apps** (API ساده Flask + ریزخدمات)  
> - **Database App** (وب + پایگاه‌داده SQL)  
> - **Retail Multi-Agent** (راهکار هوش مصنوعی سازمانی)  
>  
> مثال‌های اضافی به‌عنوان **ارجاعات خارجی** به مخازن Azure-Samples هستند که می‌توانید کلون کنید.

## مقدمه

این دایرکتوری مثال‌ها و مراجع عملی را فراهم می‌کند تا به کمک تمرین‌های عملی Azure Developer CLI را بیاموزید. سناریوی Retail Multi-Agent یک پیاده‌سازی کامل و آماده تولید است که در این مخزن گنجانده شده است. مثال‌های اضافی به مخازن رسمی Azure Samples ارجاع می‌دهند که الگوهای مختلف AZD را نشان می‌دهند.

### راهنمای امتیازدهی پیچیدگی

- ⭐ **مبتدی** - مفاهیم پایه، یک سرویس، ۱۵–۳۰ دقیقه
- ⭐⭐ **متوسط** - چندین سرویس، یکپارچه‌سازی پایگاه‌داده، ۳۰–۶۰ دقیقه
- ⭐⭐⭐ **پیشرفته** - معماری پیچیده، یکپارچه‌سازی هوش مصنوعی، ۱–۲ ساعت
- ⭐⭐⭐⭐ **حرفه‌ای** - آماده تولید، الگوهای سازمانی، ۲+ ساعت

## 🎯 چه چیزی در واقع در این مخزن وجود دارد

### ✅ پیاده‌سازی محلی (آماده استفاده)

#### [برنامه چت Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**استقرار کامل gpt-4.1 با رابط چت در این مخزن گنجانده شده است**

- **محل:** `examples/azure-openai-chat/`
- **پیچیدگی:** ⭐⭐ (متوسط)
- **موارد گنجانده‌شده:**
  - استقرار کامل Microsoft Foundry Models (gpt-4.1)
  - رابط چت خط فرمان Python
  - یکپارچه‌سازی Key Vault برای کلیدهای API امن
  - الگوهای زیرساختی Bicep
  - ردیابی استفاده از توکن و هزینه
  - محدودسازی نرخ و مدیریت خطا

**شروع سریع:**
```bash
# به پوشهٔ example برو
cd examples/azure-openai-chat

# همه‌چیز را مستقر کنید
azd up

# وابستگی‌ها را نصب کنید و چت را شروع کنید
pip install -r src/requirements.txt
python src/chat.py
```

**تکنولوژی‌ها:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [مثال‌های Container App](container-app/README.md) 🆕
**مثال‌های جامع استقرار کانتینر در این مخزن گنجانده شده‌اند**

- **محل:** `examples/container-app/`
- **پیچیدگی:** ⭐-⭐⭐⭐⭐ (از مبتدی تا پیشرفته)
- **موارد گنجانده‌شده:**
  - [راهنمای اصلی](container-app/README.md) - نمای کلی کامل از استقرارهای کانتینری
  - [API ساده Flask](../../../examples/container-app/simple-flask-api) - مثال پایه‌ای REST API
  - [معماری ریزخدمات](../../../examples/container-app/microservices) - استقرار چندسرویسی آماده تولید
  - الگوهای شروع سریع، تولید و پیشرفته
  - مانیتورینگ، امنیت و بهینه‌سازی هزینه

**شروع سریع:**
```bash
# مشاهده راهنمای اصلی
cd examples/container-app

# استقرار یک API سادهٔ Flask
cd simple-flask-api
azd up

# استقرار نمونهٔ میکروسرویس‌ها
cd ../microservices
azd up
```

**تکنولوژی‌ها:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [راهکار چندعامله خرده‌فروشی](retail-scenario.md) 🆕
**پیاده‌سازی کامل آماده تولید در این مخزن گنجانده شده است**

- **محل:** `examples/retail-multiagent-arm-template/`
- **پیچیدگی:** ⭐⭐⭐⭐ (پیشرفته)
- **موارد گنجانده‌شده:**
  - قالب استقرار ARM کامل
  - معماری چندعامله (مشتری + موجودی)
  - یکپارچه‌سازی Microsoft Foundry Models
  - جستجوی هوش مصنوعی با RAG
  - مانیتورینگ جامع
  - اسکریپت استقرار با یک کلیک

**شروع سریع:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**تکنولوژی‌ها:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 نمونه‌های خارجی Azure (برای استفاده کلون کنید)

مثال‌های زیر در مخازن رسمی Azure-Samples نگهداری می‌شوند. آن‌ها را کلون کنید تا الگوهای مختلف AZD را بررسی کنید:

### برنامه‌های ساده (فصل‌های 1-2)

| الگو | مخزن | پیچیدگی | سرویس‌ها |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [محلی: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **ریزخدمات** | [محلی: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | چندسرویسی، Service Bus، Cosmos DB، SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**نحوه استفاده:**
```bash
# هر مثالی را کلون کنید
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# استقرار دهید
azd up
```

### مثال‌های برنامه‌های هوش مصنوعی (فصل‌های 2، 5، 8)

| الگو | مخزن | پیچیدگی | تمرکز |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [محلی: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | استقرار gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | چت پایه هوش مصنوعی |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | چارچوب عامل |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | الگوی RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | هوش مصنوعی سازمانی |

### الگوهای پایگاه‌داده و پیشرفته (فصل‌های 3-8)

| الگو | مخزن | پیچیدگی | تمرکز |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | یکپارچه‌سازی پایگاه‌داده |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | بدون‌سرور NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | چندسرویسی |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## اهداف یادگیری

با کار کردن روی این مثال‌ها، شما:
- گردش‌کارهای Azure Developer CLI را با سناریوهای کاربردی تمرین خواهید کرد
- معماری‌های مختلف برنامه و پیاده‌سازی‌های azd مربوطه را درک خواهید کرد
- الگوهای Infrastructure as Code را برای سرویس‌های مختلف Azure فرا خواهید گرفت
- مدیریت پیکربندی و استراتژی‌های استقرار مخصوص محیط‌ها را اعمال خواهید کرد
- الگوهای مانیتورینگ، امنیت و مقیاس‌دهی را در زمینه‌های عملی پیاده‌سازی خواهید کرد
- تجربه رفع اشکال و عیب‌یابی سناریوهای واقعی استقرار را کسب خواهید کرد

## نتایج یادگیری

پس از اتمام این مثال‌ها، شما قادر خواهید بود:
- انواع برنامه‌ها را با Azure Developer CLI با اطمینان استقرار دهید
- قالب‌های ارائه‌شده را برای نیازهای برنامه خود تطبیق دهید
- الگوهای زیرساخت سفارشی را با استفاده از Bicep طراحی و پیاده‌سازی کنید
- برنامه‌های چندسرویسی پیچیده را با وابستگی‌های مناسب پیکربندی کنید
- بهترین شیوه‌های امنیت، مانیتورینگ و عملکرد را در سناریوهای واقعی اعمال کنید
- بر اساس تجربه عملی، استقرارها را عیب‌یابی و بهینه‌سازی کنید

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

> **💡 تازه‌کار با AZD؟** با مثال شماره ۱ (Flask API) شروع کنید — حدود ۲۰ دقیقه طول می‌کشد و مفاهیم اصلی را آموزش می‌دهد.

### برای مبتدیان
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (محلی) ⭐  
   استقرار یک REST API ساده با مقیاس تا صفر  
   **زمان:** ۲۰–۲۵ دقیقه | **هزینه:** $0-5/ماه  
   **یاد خواهید گرفت:** گردش‌کار پایه azd، کانتینری‌سازی، پروب‌های سلامت  
   **نتیجه مورد انتظار:** نقطه انتهایی API کارآمد که "Hello, World!" را بازمی‌گرداند با مانیتورینگ

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   استقرار یک برنامه وب Node.js Express با MongoDB  
   **زمان:** ۲۵–۳۵ دقیقه | **هزینه:** $10-30/ماه  
   **یاد خواهید گرفت:** یکپارچه‌سازی پایگاه‌داده، متغیرهای محیطی، رشته‌های اتصال  
   **نتیجه مورد انتظار:** برنامه لیست Todo با قابلیت ایجاد/خواندن/به‌روزرسانی/حذف

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   میزبانی یک وب‌سایت استاتیک React با Azure Static Web Apps  
   **زمان:** ۲۰–۳۰ دقیقه | **هزینه:** $0-10/ماه  
   **یاد خواهید گرفت:** میزبانی استاتیک، توابع سرورلس، استقرار CDN  
   **نتیجه مورد انتظار:** رابط React با بک‌اند API، SSL خودکار، CDN جهانی

### برای کاربران متوسط
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (محلی) ⭐⭐  
   استقرار gpt-4.1 با رابط چت و مدیریت امن کلید API  
   **زمان:** ۳۵–۴۵ دقیقه | **هزینه:** $50-200/ماه  
   **یاد خواهید گرفت:** استقرار Microsoft Foundry Models، یکپارچه‌سازی Key Vault، ردیابی توکن  
   **نتیجه مورد انتظار:** برنامه چت کارآمد با gpt-4.1 و مانیتورینگ هزینه

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (محلی) ⭐⭐⭐⭐  
   معماری چندسرویسی آماده تولید  
   **زمان:** ۴۵–۶۰ دقیقه | **هزینه:** $50-150/ماه  
   **یاد خواهید گرفت:** ارتباط بین سرویس‌ها، صف پیام، ردیابی توزیع‌شده  
   **نتیجه مورد انتظار:** سیستم ۲ سرویسی (API Gateway + سرویس محصول) با مانیتورینگ

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   برنامه وب با API C# و پایگاه‌داده Azure SQL  
   **زمان:** ۳۰–۴۵ دقیقه | **هزینه:** $20-80/ماه  
   **یاد خواهید گرفت:** Entity Framework، مهاجرت‌های پایگاه‌داده، امنیت اتصال  
   **نتیجه مورد انتظار:** API C# با بک‌اند Azure SQL، استقرار خودکار اسکیمای پایگاه‌داده

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   توابع Azure با Python و تریگرهای HTTP و Cosmos DB  
   **زمان:** ۳۰–۴۰ دقیقه | **هزینه:** $10-40/ماه  
   **یاد خواهید گرفت:** معماری رویدادمحور، مقیاس‌دهی سرورلس، یکپارچه‌سازی NoSQL  
   **نتیجه مورد انتظار:** اپلیکیشن تابع که به درخواست‌های HTTP پاسخ می‌دهد با ذخیره‌سازی Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   برنامه چندسرویسی جاوا با Container Apps و API gateway  
   **زمان:** ۶۰–۹۰ دقیقه | **هزینه:** $80-200/ماه  
   **یاد خواهید گرفت:** استقرار Spring Boot، service mesh، متعادل‌سازی بار  
   **نتیجه مورد انتظار:** سیستم چندسرویسی جاوا با کشف سرویس و مسیریابی

### الگوهای Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   استقرار کامل gpt-4.1 با رابط چت  
   **زمان:** ۳۵–۴۵ دقیقه | **هزینه:** $50-200/ماه  
   **نتیجه مورد انتظار:** برنامه چت کارآمد با ردیابی توکن و مانیتورینگ هزینه

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   برنامه چت هوشمند با معماری RAG  
   **زمان:** ۶۰–۹۰ دقیقه | **هزینه:** $100-300/ماه  
   **نتیجه مورد انتظار:** رابط چت مبتنی بر RAG با جستجوی اسناد و استنادها

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   تحلیل اسناد با استفاده از سرویس‌های Azure AI  
   **زمان:** ۴۰–۶۰ دقیقه | **هزینه:** $20-80/ماه  
   **نتیجه مورد انتظار:** API استخراج متن، جداول و موجودیت‌ها از اسناد آپلودشده

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   گردش‌کار MLOps با Azure Machine Learning  
   **زمان:** ۲–۳ ساعت | **هزینه:** $150-500/ماه  
   **نتیجه مورد انتظار:** خط لوله خودکار ML با آموزش، استقرار و مانیتورینگ

### سناریوهای دنیای واقعی

#### **راهکار چندعامله خرده‌فروشی** 🆕  
**[راهنمای پیاده‌سازی کامل](./retail-scenario.md)**

یک راهکار جامع و آماده تولید چندعامله برای پشتیبانی مشتری که نشان‌دهنده استقرار برنامه‌های هوش مصنوعی در سطح سازمانی با AZD است. این سناریو ارائه می‌دهد:

- **معماری کامل**: سیستم چندعامله با عامل‌های تخصصی پشتیبانی مشتری و مدیریت موجودی
- **زیرساخت تولید**: استقرار چندمنطقه‌ای Microsoft Foundry Models، Azure AI Search، Container Apps، و نظارت جامع
- **قالب ARM آماده برای استقرار**: استقرار با یک کلیک با حالت‌های پیکربندی متعدد (Minimal/Standard/Premium)
- **ویژگی‌های پیشرفته**: اعتبارسنجی امنیتی red teaming، چارچوب ارزیابی agent، بهینه‌سازی هزینه، و راهنمای عیب‌یابی
- **زمینه کسب‌وکار واقعی**: مورد استفاده پشتیبانی مشتری خرده‌فروش با بارگذاری فایل، یکپارچه‌سازی جستجو، و مقیاس‌دهی پویا

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (پیشرفته - آماده‌ی تولید سازمانی)

**مناسب برای**: توسعه‌دهندگان هوش مصنوعی، معماران راه‌حل، و تیم‌هایی که سیستم‌های چندعامله‌ای تولیدی می‌سازند

**شروع سریع**: پیاده‌سازی حل کامل در کمتر از 30 دقیقه با استفاده از قالب ARM ضمیمه با `./deploy.sh -g myResourceGroup`

## 📋 دستورالعمل استفاده

### پیش‌نیازها

قبل از اجرای هر نمونه:
- ✅ اشتراک Azure با دسترسی Owner یا Contributor
- ✅ Azure Developer CLI نصب شده ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop در حال اجرا (برای مثال‌های کانتینری)
- ✅ سهمیه‌های مناسب Azure (نیازمندی‌های مربوط به هر مثال را بررسی کنید)

> **💰 هشدار هزینه:** همه مثال‌ها منابع واقعی Azure ایجاد می‌کنند که هزینه در پی دارند. تخمین هزینه‌ها را در فایل‌های README مربوطه ببینید. به یاد داشته باشید پس از اتمام برای جلوگیری از هزینه‌های مداوم دستور `azd down` را اجرا کنید.

### اجرای مثال‌ها به‌صورت محلی

1. **کلون یا کپی مثال**
   ```bash
   # به مثال موردنظر بروید
   cd examples/simple-web-app
   ```

2. **راه‌اندازی محیط AZD**
   ```bash
   # با قالب موجود مقداردهی اولیه کنید
   azd init
   
   # یا یک محیط جدید ایجاد کنید
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
   # استقرار زیرساخت و برنامه
   azd up
   ```

5. **تأیید استقرار**
   ```bash
   # دریافت نقاط انتهایی سرویس
   azd env get-values
   
   # آزمایش نقطهٔ انتهایی (مثال)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **نشانه‌های موفقیت مورد انتظار:**
   - ✅ `azd up` بدون خطا تکمیل می‌شود
   - ✅ نقطه‌پایان سرویس پاسخ HTTP 200 باز می‌گرداند
   - ✅ در پورتال Azure وضعیت "Running" نمایش داده می‌شود
   - ✅ Application Insights در حال دریافت تلماتری است

> **⚠️ مشکل دارید؟** برای عیب‌یابی استقرار به [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) مراجعه کنید

### تطبیق دادن مثال‌ها

هر مثال شامل موارد زیر است:
- **README.md** - دستورالعمل‌های مفصل راه‌اندازی و سفارشی‌سازی
- **azure.yaml** - پیکربندی AZD با توضیحات
- **infra/** - قالب‌های Bicep با توضیح پارامترها
- **src/** - کد نمونه برنامه
- **scripts/** - اسکریپت‌های کمکی برای کارهای متداول

## 🎯 اهداف یادگیری

### دسته‌بندی مثال‌ها

#### **استقرارهای پایه**
- برنامه‌های تک‌سرویسی
- الگوهای زیرساخت ساده
- مدیریت پیکربندی پایه
- تنظیمات توسعه مقرون‌به‌صرفه

#### **مفاهیم پیشرفته**
- معماری‌های چندسرویسی
- پیکربندی‌های شبکه پیچیده
- الگوهای یکپارچه‌سازی پایگاه داده
- پیاده‌سازی‌های امنیت و انطباق

#### **الگوهای آماده‌ی تولید**
- پیکربندی‌های با دسترسی بالا
- مانیتورینگ و قابل مشاهده بودن
- ادغام CI/CD
- تنظیمات بازیابی از فاجعه

## 📖 توضیحات مثال‌ها

### برنامه وب ساده - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: مبتدی  
**مفاهیم**: استقرار پایه، REST API، یکپارچه‌سازی پایگاه داده NoSQL

### وب‌سایت ایستا - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: مبتدی  
**مفاهیم**: میزبانی ایستا، بک‌اند سرورلس، توسعه وب مدرن

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: مبتدی  
**مفاهیم**: کانتینرسازی، REST API، scale-to-zero، health probes، مانیتورینگ  
**Location**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - معماری میکروسرویس‌ها
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: پیشرفته  
**مفاهیم**: معماری چندسرویسی، ارتباط سرویس‌ها، صف پیام، ره‌گیری توزیع‌شده  
**Location**: [Local Example](../../../examples/container-app/microservices)

### برنامه پایگاه‌داده - C# با Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: میان‌رده  
**مفاهیم**: Entity Framework، اتصال به پایگاه‌داده، توسعه وب API

### تابع سرورلس - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: میان‌رده  
**مفاهیم**: معماری رویدادمحور، محاسبات سرورلس، توسعه فول‌استک

### میکروسرویس‌ها - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: میان‌رده  
**مفاهیم**: ارتباط میکروسرویس‌ها، سیستم‌های توزیع‌شده، الگوهای سازمانی

### مثال‌های Microsoft Foundry

#### اپ چت Microsoft Foundry Models
**Technologies**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexity**: میان‌رده  
**مفاهیم**: معماری RAG، جستجوی برداری، ادغام LLM

#### پردازش اسناد با هوش مصنوعی
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: میان‌رده  
**مفاهیم**: تحلیل سند، OCR، استخراج داده

#### خط لوله یادگیری ماشین
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: پیشرفته  
**مفاهیم**: آموزش مدل، خط لوله‌های استقرار، مانیتورینگ

## 🛠 مثال‌های پیکربندی

دایرکتوری `configurations/` شامل مؤلفه‌های قابل استفاده مجدد است:

### پیکربندی‌های محیط
- تنظیمات محیط توسعه
- پیکربندی‌های محیط staging
- پیکربندی‌های آماده تولید
- تنظیمات استقرار چندمنطقه‌ای

### ماژول‌های Bicep
- مؤلفه‌های زیرساخت قابل استفاده مجدد
- الگوهای منابع رایج
- قالب‌های تقویت‌شده برای امنیت
- پیکربندی‌های بهینه‌شده برای هزینه

### اسکریپت‌های کمکی
- خودکارسازی تنظیم محیط
- اسکریپت‌های مهاجرت پایگاه داده
- ابزارهای اعتبارسنجی استقرار
- ابزارهای پایش هزینه

## 🔧 راهنمای سفارشی‌سازی

### تطبیق دادن مثال‌ها برای مورد استفاده شما

1. **بررسی پیش‌نیازها**
   - نیازمندی‌های سرویس‌های Azure را بررسی کنید
   - محدودیت‌های اشتراک را تأیید کنید
   - پیامدهای هزینه را درک کنید

2. **اصلاح پیکربندی**
   - تعاریف سرویس در `azure.yaml` را به‌روز کنید
   - قالب‌های Bicep را سفارشی کنید
   - متغیرهای محیطی را تنظیم کنید

3. **آزمایش کامل**
   - ابتدا در محیط توسعه مستقر کنید
   - عملکرد را اعتبارسنجی کنید
   - مقیاس‌دهی و عملکرد را آزمایش کنید

4. **بررسی امنیت**
   - کنترل‌های دسترسی را بازبینی کنید
   - مدیریت اسرار را پیاده‌سازی کنید
   - مانیتورینگ و اعلان‌ها را فعال کنید

## 📊 ماتریس مقایسه

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 مسیر یادگیری

### ترتیب پیشنهادی

1. **با برنامه وب ساده شروع کنید**
   - مفاهیم پایه AZD را یاد بگیرید
   - جریان کار استقرار را درک کنید
   - مدیریت محیط را تمرین کنید

2. **وب‌سایت ایستا را امتحان کنید**
   - گزینه‌های میزبانی مختلف را بررسی کنید
   - درباره یکپارچه‌سازی CDN بیاموزید
   - پیکربندی DNS را درک کنید

3. **به Container App بروید**
   - مبانی کانتینرسازی را یاد بگیرید
   - مفاهیم مقیاس‌دهی را درک کنید
   - با Docker تمرین کنید

4. **یکپارچه‌سازی پایگاه‌داده را اضافه کنید**
   - تامین پایگاه‌داده را یاد بگیرید
   - رشته‌های اتصال را درک کنید
   - مدیریت اسرار را تمرین کنید

5. **سرورلس را کاوش کنید**
   - معماری رویدادمحور را درک کنید
   - درباره triggers و bindings بیاموزید
   - با APIها تمرین کنید

6. **میکروسرویس‌ها را بسازید**
   - ارتباط سرویس‌ها را یاد بگیرید
   - سیستم‌های توزیع‌شده را درک کنید
   - استقرارهای پیچیده را تمرین کنید

## 🔍 یافتن مثال مناسب

### بر اساس پشته فناوری
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App، AI Document Processing، ML Pipeline، **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**، Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices)، **Retail Multi-Agent Solution**

### بر اساس الگوی معماری
- **Simple REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**، Microsoft Foundry Models Chat App، AI Document Processing، ML Pipeline، **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Local)](../../../examples/container-app/microservices)، **Retail Multi-Agent Solution**

### بر اساس سطح پیچیدگی
- **مبتدی**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)، Node.js Express Todo، React SPA + Functions
- **میان‌رده**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**، C# Web API + SQL، Python Functions + SPA، Java Microservices، Microsoft Foundry Models Chat App، AI Document Processing
- **پیشرفته**: ML Pipeline
- **آماده تولید سازمانی**: [Microservices (Local)](../../../examples/container-app/microservices) (چندسرویس با صف پیام)، **Retail Multi-Agent Solution** (سیستم کامل چندعامله با استقرار قالب ARM)

## 📚 منابع اضافی

### لینک‌های مستندات
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### مثال‌های جامعه
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [اپلیکیشن وب React با API نوشته‌شده با C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job در Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions با Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### بهترین روش‌ها
- [چارچوب Well-Architected برای Azure](https://learn.microsoft.com/en-us/azure/well-architected/)
- [چارچوب پذیرش ابری](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 مشارکت در نمونه‌ها

آیا نمونهٔ مفیدی برای به‌اشتراک‌گذاری دارید؟ ما از مشارکت‌ها استقبال می‌کنیم!

### راهنمای ارسال
1. از ساختار دایرکتوری تعیین‌شده پیروی کنید
2. README.md جامع را درج کنید
3. در فایل‌های پیکربندی توضیحات (کامنت) اضافه کنید
4. پیش از ارسال به‌طور کامل تست کنید
5. برآورد هزینه و پیش‌نیازها را وارد کنید

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

**نکتهٔ حرفه‌ای**: با ساده‌ترین نمونه‌ای که با پشتهٔ فناوری شما مطابقت دارد شروع کنید، سپس به‌تدریج به سناریوهای پیچیده‌تر بروید. هر نمونه بر مبنای مفاهیم نمونه‌های قبلی ساخته می‌شود!

## 🚀 آماده‌اید شروع کنید؟

### مسیر یادگیری شما

1. **کاملاً مبتدی؟** → با [Flask API](../../../examples/container-app/simple-flask-api) شروع کنید (⭐، 20 دقیقه)
2. **آیا دانش پایه‌ای از AZD دارید؟** → [Microservices](../../../examples/container-app/microservices) را امتحان کنید (⭐⭐⭐⭐، 60 دقیقه)
3. **در حال ساخت برنامه‌های هوش مصنوعی هستید؟** → با [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) شروع کنید (⭐⭐، 35 دقیقه) یا [Retail Multi-Agent](retail-scenario.md) را بررسی کنید (⭐⭐⭐⭐، بیش از 2 ساعت)
4. **به پشتهٔ فناوری خاصی نیاز دارید؟** → از بخش [یافتن مثال مناسب](#-finding-the-right-example) که در بالا است استفاده کنید

### گام‌های بعدی

- ✅ بررسی [پیش‌نیازها](#پیش‌نیازها) در بالا
- ✅ یک نمونه مناسب با سطح مهارت خود انتخاب کنید (به [راهنمای پیچیدگی](#راهنمای-امتیازدهی-پیچیدگی) مراجعه کنید)
- ✅ README مربوط به مثال را پیش از استقرار به‌دقت مطالعه کنید
- ✅ یادآوری تنظیم کنید تا پس از تست، `azd down` را اجرا کنید
- ✅ تجربهٔ خود را از طریق GitHub Issues یا Discussions به‌اشتراک بگذارید

### نیاز به کمک دارید؟

- 📖 [سؤالات متداول](../resources/faq.md) - پاسخ به پرسش‌های رایج
- 🐛 [راهنمای رفع اشکال](../docs/chapter-07-troubleshooting/common-issues.md) - رفع مشکلات استقرار
- 💬 [بحث‌های GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - پرسش از جامعه
- 📚 [راهنمای مطالعه](../resources/study-guide.md) - تقویت یادگیری

---

**ناوبری**
- **📚 صفحهٔ دوره**: [AZD برای مبتدیان](../README.md)
- **📖 مواد آموزشی**: [راهنمای مطالعه](../resources/study-guide.md) | [چیت‌شیت](../resources/cheat-sheet.md) | [واژه‌نامه](../resources/glossary.md)
- **🔧 منابع**: [پرسش‌های متداول](../resources/faq.md) | [رفع اشکال](../docs/chapter-07-troubleshooting/common-issues.md)

---

*آخرین به‌روزرسانی: نوامبر 2025 | [گزارش مشکلات](https://github.com/microsoft/AZD-for-beginners/issues) | [ارسال نمونه‌ها](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان مادری خود باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوء تفاهم یا برداشت نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->