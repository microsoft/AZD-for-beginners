<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T16:27:50+00:00",
  "source_file": "examples/README.md",
  "language_code": "fa"
}
-->
# مثال‌ها - قالب‌ها و پیکربندی‌های عملی AZD

**یادگیری از طریق مثال - سازماندهی شده بر اساس فصل**
- **📚 صفحه اصلی دوره**: [AZD برای مبتدیان](../README.md)
- **📖 نقشه فصل‌ها**: مثال‌ها بر اساس پیچیدگی یادگیری سازماندهی شده‌اند
- **🚀 شروع ساده**: [مثال‌های فصل ۱](../../../examples)
- **🤖 مثال‌های هوش مصنوعی**: [مثال‌های فصل ۲ و ۵](../../../examples)

## مقدمه

این پوشه شامل مثال‌های عملی، قالب‌ها و سناریوهای واقعی است که به شما کمک می‌کند با استفاده از تمرین عملی، Azure Developer CLI را یاد بگیرید. هر مثال شامل کد کامل، قالب‌های زیرساخت و دستورالعمل‌های دقیق برای معماری‌های مختلف برنامه و الگوهای استقرار است.

## اهداف یادگیری

با کار بر روی این مثال‌ها، شما:
- با سناریوهای واقعی برنامه، جریان‌های کاری Azure Developer CLI را تمرین می‌کنید
- معماری‌های مختلف برنامه و پیاده‌سازی‌های آن‌ها در AZD را درک می‌کنید
- الگوهای زیرساخت به عنوان کد را برای خدمات مختلف Azure یاد می‌گیرید
- استراتژی‌های مدیریت پیکربندی و استقرار محیطی را اعمال می‌کنید
- الگوهای نظارت، امنیت و مقیاس‌پذیری را در زمینه‌های عملی پیاده‌سازی می‌کنید
- تجربه‌ای در عیب‌یابی و رفع مشکلات سناریوهای واقعی استقرار کسب می‌کنید

## نتایج یادگیری

پس از تکمیل این مثال‌ها، شما قادر خواهید بود:
- با اطمینان انواع مختلف برنامه‌ها را با استفاده از Azure Developer CLI مستقر کنید
- قالب‌های ارائه شده را با نیازهای برنامه خود تطبیق دهید
- الگوهای زیرساخت سفارشی را با استفاده از Bicep طراحی و پیاده‌سازی کنید
- برنامه‌های چندسرویسی پیچیده را با وابستگی‌های مناسب پیکربندی کنید
- بهترین شیوه‌های امنیت، نظارت و عملکرد را در سناریوهای واقعی اعمال کنید
- استقرارها را بر اساس تجربه عملی عیب‌یابی و بهینه‌سازی کنید

## ساختار پوشه

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

### برای مبتدیان
1. **[برنامه وب ساده - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - استقرار یک برنامه وب Node.js Express با MongoDB  
2. **[وب‌سایت استاتیک - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - میزبانی یک وب‌سایت استاتیک React با Azure Static Web Apps  
3. **[برنامه کانتینری - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - استقرار یک برنامه کانتینری Python Flask  

### برای کاربران متوسط
4. **[برنامه پایگاه داده - C# با Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - برنامه وب با API C# و پایگاه داده Azure SQL  
5. **[تابع بدون سرور - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - توابع Azure Python با تریگرهای HTTP و Cosmos DB  
6. **[ریزسرویس‌ها - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - برنامه چندسرویسی جاوا با Container Apps و API Gateway  

### قالب‌های Azure AI Foundry

1. **[برنامه چت Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - برنامه چت هوشمند با Azure OpenAI  
2. **[پردازش اسناد هوش مصنوعی](https://github.com/Azure-Samples/azure-ai-document-processing)** - تحلیل اسناد با استفاده از خدمات هوش مصنوعی Azure  
3. **[خط لوله یادگیری ماشین](https://github.com/Azure-Samples/mlops-v2)** - جریان کاری MLOps با Azure Machine Learning  

### سناریوهای واقعی

#### **راه‌حل چندعاملی خرده‌فروشی** 🆕  
**[راهنمای کامل پیاده‌سازی](./retail-scenario.md)**  

یک راه‌حل جامع و آماده تولید برای پشتیبانی مشتری چندعاملی که استقرار برنامه‌های هوش مصنوعی در سطح سازمانی را با AZD نشان می‌دهد. این سناریو شامل موارد زیر است:

- **معماری کامل**: سیستم چندعاملی با عوامل تخصصی برای خدمات مشتری و مدیریت موجودی  
- **زیرساخت تولیدی**: استقرارهای چندمنطقه‌ای Azure OpenAI، جستجوی هوش مصنوعی، برنامه‌های کانتینری و نظارت جامع  
- **قالب ARM آماده استقرار**: استقرار با یک کلیک با حالت‌های پیکربندی مختلف (حداقلی/استاندارد/پیشرفته)  
- **ویژگی‌های پیشرفته**: اعتبارسنجی امنیتی، چارچوب ارزیابی عامل، بهینه‌سازی هزینه و راهنماهای عیب‌یابی  
- **زمینه واقعی کسب‌وکار**: مورد استفاده پشتیبانی مشتری خرده‌فروشی با آپلود فایل، یکپارچه‌سازی جستجو و مقیاس‌پذیری پویا  

**فناوری‌ها**: Azure OpenAI (GPT-4o, GPT-4o-mini)، Azure AI Search، Container Apps، Cosmos DB، Application Insights، Document Intelligence، Bing Search API  

**پیچیدگی**: ⭐⭐⭐⭐ (پیشرفته - آماده تولید سازمانی)  

**مناسب برای**: توسعه‌دهندگان هوش مصنوعی، معماران راه‌حل و تیم‌هایی که سیستم‌های چندعاملی تولیدی می‌سازند  

**شروع سریع**: راه‌حل کامل را در کمتر از ۳۰ دقیقه با استفاده از قالب ARM و اجرای `./deploy.sh -g myResourceGroup` مستقر کنید  

## 📋 دستورالعمل‌های استفاده

### اجرای مثال‌ها به صورت محلی

1. **کلون یا کپی کردن مثال**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```  

2. **راه‌اندازی محیط AZD**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```  

3. **پیکربندی محیط**  
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```  

4. **استقرار**  
   ```bash
   # Deploy infrastructure and application
   azd up
   ```  

### تطبیق مثال‌ها

هر مثال شامل موارد زیر است:
- **README.md** - دستورالعمل‌های دقیق برای راه‌اندازی و سفارشی‌سازی  
- **azure.yaml** - پیکربندی AZD با توضیحات  
- **infra/** - قالب‌های Bicep با توضیحات پارامترها  
- **src/** - کد نمونه برنامه  
- **scripts/** - اسکریپت‌های کمکی برای وظایف رایج  

## 🎯 اهداف یادگیری

### دسته‌بندی مثال‌ها

#### **استقرارهای پایه**
- برنامه‌های تک‌سرویسی  
- الگوهای ساده زیرساخت  
- مدیریت پیکربندی پایه  
- تنظیمات توسعه کم‌هزینه  

#### **سناریوهای پیشرفته**
- معماری‌های چندسرویسی  
- پیکربندی‌های پیچیده شبکه  
- الگوهای یکپارچه‌سازی پایگاه داده  
- پیاده‌سازی‌های امنیتی و انطباقی  

#### **الگوهای آماده تولید**
- پیکربندی‌های با دسترسی بالا  
- نظارت و مشاهده‌پذیری  
- یکپارچه‌سازی CI/CD  
- تنظیمات بازیابی از فاجعه  

## 📖 توضیحات مثال‌ها

### برنامه وب ساده - Node.js Express
**فناوری‌ها**: Node.js، Express، MongoDB، Container Apps  
**پیچیدگی**: مبتدی  
**مفاهیم**: استقرار پایه، REST API، یکپارچه‌سازی پایگاه داده NoSQL  

### وب‌سایت استاتیک - React SPA
**فناوری‌ها**: React، Azure Static Web Apps، Azure Functions، Cosmos DB  
**پیچیدگی**: مبتدی  
**مفاهیم**: میزبانی استاتیک، بک‌اند بدون سرور، توسعه وب مدرن  

### برنامه کانتینری - Python Flask
**فناوری‌ها**: Python Flask، Docker، Container Apps، Container Registry  
**پیچیدگی**: مبتدی  
**مفاهیم**: کانتینری‌سازی، معماری میکروسرویس، توسعه API  

### برنامه پایگاه داده - C# با Azure SQL
**فناوری‌ها**: C# ASP.NET Core، Azure SQL Database، App Service  
**پیچیدگی**: متوسط  
**مفاهیم**: Entity Framework، اتصالات پایگاه داده، توسعه وب API  

### تابع بدون سرور - Python Azure Functions
**فناوری‌ها**: Python، Azure Functions، Cosmos DB، Static Web Apps  
**پیچیدگی**: متوسط  
**مفاهیم**: معماری رویدادمحور، محاسبات بدون سرور، توسعه فول‌استک  

### ریزسرویس‌ها - Java Spring Boot
**فناوری‌ها**: Java Spring Boot، Container Apps، Service Bus، API Gateway  
**پیچیدگی**: متوسط  
**مفاهیم**: ارتباط ریزسرویس‌ها، سیستم‌های توزیع‌شده، الگوهای سازمانی  

### مثال‌های Azure AI Foundry

#### برنامه چت Azure OpenAI
**فناوری‌ها**: Azure OpenAI، Cognitive Search، App Service  
**پیچیدگی**: متوسط  
**مفاهیم**: معماری RAG، جستجوی برداری، یکپارچه‌سازی LLM  

#### پردازش اسناد هوش مصنوعی
**فناوری‌ها**: Azure AI Document Intelligence، Storage، Functions  
**پیچیدگی**: متوسط  
**مفاهیم**: تحلیل اسناد، OCR، استخراج داده  

#### خط لوله یادگیری ماشین
**فناوری‌ها**: Azure ML، MLOps، Container Registry  
**پیچیدگی**: پیشرفته  
**مفاهیم**: آموزش مدل، خطوط لوله استقرار، نظارت  

## 🛠 مثال‌های پیکربندی

پوشه `configurations/` شامل اجزای قابل استفاده مجدد است:

### پیکربندی‌های محیطی
- تنظیمات محیط توسعه  
- پیکربندی‌های محیط آزمایشی  
- پیکربندی‌های آماده تولید  
- تنظیمات استقرار چندمنطقه‌ای  

### ماژول‌های Bicep
- اجزای زیرساخت قابل استفاده مجدد  
- الگوهای منابع رایج  
- قالب‌های امنیتی  
- پیکربندی‌های بهینه‌سازی هزینه  

### اسکریپت‌های کمکی
- خودکارسازی راه‌اندازی محیط  
- اسکریپت‌های مهاجرت پایگاه داده  
- ابزارهای اعتبارسنجی استقرار  
- ابزارهای نظارت بر هزینه  

## 🔧 راهنمای سفارشی‌سازی

### تطبیق مثال‌ها با نیازهای شما

1. **بررسی پیش‌نیازها**
   - الزامات خدمات Azure را بررسی کنید  
   - محدودیت‌های اشتراک را تأیید کنید  
   - پیامدهای هزینه را درک کنید  

2. **تغییر پیکربندی**
   - تعاریف خدمات را در `azure.yaml` به‌روزرسانی کنید  
   - قالب‌های Bicep را سفارشی کنید  
   - متغیرهای محیطی را تنظیم کنید  

3. **آزمایش کامل**
   - ابتدا در محیط توسعه مستقر کنید  
   - عملکرد را اعتبارسنجی کنید  
   - مقیاس‌پذیری و عملکرد را آزمایش کنید  

4. **بررسی امنیتی**
   - کنترل‌های دسترسی را بررسی کنید  
   - مدیریت اسرار را پیاده‌سازی کنید  
   - نظارت و هشدارها را فعال کنید  

## 📊 ماتریس مقایسه

| مثال | خدمات | پایگاه داده | احراز هویت | نظارت | پیچیدگی |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | پایه | پایه | ⭐ |
| React SPA + Functions | 3 | ✅ | پایه | کامل | ⭐ |
| Python Flask Container | 2 | ❌ | پایه | کامل | ⭐ |
| C# Web API + SQL | 2 | ✅ | کامل | کامل | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | کامل | کامل | ⭐⭐ |
| Java Microservices | 5+ | ✅ | کامل | کامل | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | کامل | کامل | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | پایه | کامل | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | کامل | کامل | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **سازمانی** | **پیشرفته** | **⭐⭐⭐⭐** |

## 🎓 مسیر یادگیری

### پیشرفت پیشنهادی

1. **شروع با برنامه وب ساده**
   - مفاهیم پایه AZD را یاد بگیرید  
   - جریان کاری استقرار را درک کنید  
   - مدیریت محیط را تمرین کنید  

2. **امتحان وب‌سایت استاتیک**
   - گزینه‌های مختلف میزبانی را بررسی کنید  
   - درباره یکپارچه‌سازی CDN یاد بگیرید  
   - پیکربندی DNS را درک کنید  

3. **حرکت به برنامه کانتینری**
   - اصول کانتینری‌سازی را یاد بگیرید  
   - مفاهیم مقیاس‌پذیری را درک کنید  
   - با Docker تمرین کنید  

4. **افزودن یکپارچه‌سازی پایگاه داده**
   - درباره تأمین پایگاه داده یاد بگیرید  
   - رشته‌های اتصال را درک کنید  
   - مدیریت اسرار را تمرین کنید  

5. **کاوش در بدون سرور**
   - معماری رویدادمحور را درک کنید  
   - درباره تریگرها و بایندینگ‌ها یاد بگیرید  
   - با APIها تمرین کنید  

6. **ساخت ریزسرویس‌ها**
   - ارتباط سرویس‌ها را یاد بگیرید  
   - سیستم‌های توزیع‌شده را درک کنید  
   - استقرارهای پیچیده را تمرین کنید  

## 🔍 یافتن مثال مناسب

### بر اساس فناوری
- **Node.js**: برنامه Todo Node.js Express  
- **Python**: برنامه کانتینری Python Flask، Python Functions + SPA  
- **C#**: C# Web API + SQL Database، Azure OpenAI Chat App، ML Pipeline  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **کانتینرها**: برنامه کانتینری Python Flask، Java Microservices  
- **پایگاه داده‌ها**: Node.js + MongoDB، C# + Azure SQL، Python + Cosmos DB  
- **هوش مصنوعی/یادگیری ماشین**: Azure OpenAI Chat App، AI Document Processing، ML Pipeline، **راه‌حل چندعاملی خرده‌فروشی**  
- **سیستم‌های چندعاملی**: **راه‌حل چندعاملی خرده‌فروشی**  
- **تولید سازمانی**: **راه‌حل چندعاملی خرده‌فروشی**  

### بر اساس الگوی معماری
- **یکپارچه**: Node.js Express Todo، C# Web API + SQL  
- **استاتیک + بدون سرور**: React SPA + Functions، Python Functions + SPA  
- **ریزسرویس‌ها**: Java Spring Boot Microservices  
- **کانتینری‌شده**: Python Flask Container App  
- **هوش مصنوعی‌محور**: Azure OpenAI Chat App، AI Document Processing، ML Pipeline، **راه‌حل چندعاملی خرده‌فروشی**  
- **معماری چندعاملی**: **راه‌حل چندعاملی خرده‌فروشی**  
- **چندسرویسی سازمانی**: **راه‌حل چندعاملی خرده‌فروشی**  

### بر اساس سطح پیچیدگی
- **مبتدی**: Node.js Express Todo، React SPA + Functions، Python Flask Container App  
- **متوسط**: C# Web API + SQL، Python Functions + SPA، Java Microservices، Azure OpenAI Chat App، AI Document Processing  
- **پیشرفته**: ML Pipeline  
- **آماده تولید سازمانی**: **راه‌حل چندعاملی خرده‌فروشی** (سیستم چندعاملی کامل با استقرار قالب ARM)  

## 📚 منابع اضافی

### لینک‌های مستندات
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [قالب‌های AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [مستندات Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### مثال‌های جامعه
- [قالب‌های AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [قالب‌های Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [گالری Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [برنامه Todo با C# و Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [برنامه Todo با Python و MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [برنامه Todo با Node.js و PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [برنامه وب React با API نوشته شده با C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [وظایف Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions با Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### بهترین روش‌ها  
- [چارچوب معماری خوب Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [چارچوب پذیرش ابری](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 مشارکت در مثال‌ها  

آیا مثالی مفید برای اشتراک‌گذاری دارید؟ ما از مشارکت‌های شما استقبال می‌کنیم!  

### دستورالعمل‌های ارسال  
1. ساختار دایرکتوری تعیین‌شده را دنبال کنید  
2. README.md جامع را شامل کنید  
3. به فایل‌های تنظیمات توضیحات اضافه کنید  
4. قبل از ارسال، به‌طور کامل آزمایش کنید  
5. برآورد هزینه‌ها و پیش‌نیازها را درج کنید  

### ساختار قالب مثال  
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

**نکته حرفه‌ای**: با ساده‌ترین مثالی که با فناوری شما مطابقت دارد شروع کنید، سپس به تدریج به سمت سناریوهای پیچیده‌تر پیش بروید. هر مثال بر اساس مفاهیم مثال قبلی ساخته شده است!  

**گام‌های بعدی**:  
- مثالی را انتخاب کنید که با سطح مهارت شما مطابقت دارد  
- دستورالعمل‌های راه‌اندازی در README مثال را دنبال کنید  
- با سفارشی‌سازی‌ها آزمایش کنید  
- یادگیری‌های خود را با جامعه به اشتراک بگذارید  

---

**ناوبری**  
- **درس قبلی**: [راهنمای مطالعه](../resources/study-guide.md)  
- **بازگشت به**: [README اصلی](../README.md)  

---

**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوءتفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.