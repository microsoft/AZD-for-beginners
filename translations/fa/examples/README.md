<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T15:58:18+00:00",
  "source_file": "examples/README.md",
  "language_code": "fa"
}
-->
# مثال‌ها - قالب‌ها و تنظیمات عملی AZD

## مقدمه

این پوشه شامل مثال‌های عملی، قالب‌ها و سناریوهای واقعی است که به شما کمک می‌کند با استفاده از Azure Developer CLI به صورت عملی یاد بگیرید. هر مثال شامل کد کامل، قالب‌های زیرساخت و دستورالعمل‌های دقیق برای معماری‌های مختلف برنامه و الگوهای استقرار است.

## اهداف یادگیری

با کار کردن روی این مثال‌ها، شما:
- گردش کار Azure Developer CLI را با سناریوهای واقعی تمرین می‌کنید
- معماری‌های مختلف برنامه و پیاده‌سازی‌های آن‌ها در AZD را درک می‌کنید
- الگوهای زیرساخت به عنوان کد برای خدمات مختلف Azure را یاد می‌گیرید
- استراتژی‌های مدیریت تنظیمات و استقرار محیط‌های خاص را اعمال می‌کنید
- الگوهای نظارت، امنیت و مقیاس‌پذیری را در زمینه‌های عملی پیاده‌سازی می‌کنید
- تجربه‌ای در رفع اشکال و خطایابی سناریوهای واقعی استقرار کسب می‌کنید

## نتایج یادگیری

پس از تکمیل این مثال‌ها، شما قادر خواهید بود:
- انواع مختلف برنامه‌ها را با استفاده از Azure Developer CLI با اطمینان استقرار دهید
- قالب‌های ارائه شده را با نیازهای برنامه خود تطبیق دهید
- الگوهای زیرساخت سفارشی را با استفاده از Bicep طراحی و پیاده‌سازی کنید
- برنامه‌های چند سرویس پیچیده را با وابستگی‌های مناسب تنظیم کنید
- بهترین شیوه‌های امنیت، نظارت و عملکرد را در سناریوهای واقعی اعمال کنید
- استقرارها را بر اساس تجربه عملی رفع اشکال و بهینه‌سازی کنید

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
5. **[تابع بدون سرور - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - توابع Python Azure با محرک‌های HTTP و Cosmos DB  
6. **[معماری میکروسرویس‌ها - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - برنامه چند سرویس Java با Container Apps و API Gateway  

### قالب‌های Azure AI Foundry

1. **[برنامه چت Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - برنامه چت هوشمند با Azure OpenAI  
2. **[پردازش اسناد هوش مصنوعی](https://github.com/Azure-Samples/azure-ai-document-processing)** - تحلیل اسناد با استفاده از خدمات هوش مصنوعی Azure  
3. **[خط لوله یادگیری ماشین](https://github.com/Azure-Samples/mlops-v2)** - گردش کار MLOps با Azure Machine Learning  

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
- **azure.yaml** - تنظیمات AZD با توضیحات  
- **infra/** - قالب‌های Bicep با توضیحات پارامترها  
- **src/** - کد نمونه برنامه  
- **scripts/** - اسکریپت‌های کمکی برای وظایف رایج  

## 🎯 اهداف یادگیری

### دسته‌بندی مثال‌ها

#### **استقرارهای پایه**
- برنامه‌های تک‌سرویس  
- الگوهای زیرساخت ساده  
- مدیریت تنظیمات پایه  
- تنظیمات توسعه کم‌هزینه  

#### **سناریوهای پیشرفته**
- معماری‌های چند سرویس  
- تنظیمات شبکه پیچیده  
- الگوهای یکپارچه‌سازی پایگاه داده  
- پیاده‌سازی‌های امنیت و انطباق  

#### **الگوهای آماده تولید**
- تنظیمات با دسترسی بالا  
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
**مفاهیم**: کانتینری‌سازی، معماری میکروسرویس‌ها، توسعه API  

### برنامه پایگاه داده - C# با Azure SQL
**فناوری‌ها**: C# ASP.NET Core، پایگاه داده Azure SQL، App Service  
**پیچیدگی**: متوسط  
**مفاهیم**: Entity Framework، اتصالات پایگاه داده، توسعه وب API  

### تابع بدون سرور - Python Azure Functions
**فناوری‌ها**: Python، Azure Functions، Cosmos DB، Static Web Apps  
**پیچیدگی**: متوسط  
**مفاهیم**: معماری مبتنی بر رویداد، محاسبات بدون سرور، توسعه فول‌استک  

### میکروسرویس‌ها - Java Spring Boot
**فناوری‌ها**: Java Spring Boot، Container Apps، Service Bus، API Gateway  
**پیچیدگی**: متوسط  
**مفاهیم**: ارتباط میکروسرویس‌ها، سیستم‌های توزیع‌شده، الگوهای سازمانی  

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
**مفاهیم**: آموزش مدل، خط لوله‌های استقرار، نظارت  

## 🛠 مثال‌های تنظیمات

پوشه `configurations/` شامل اجزای قابل استفاده مجدد است:

### تنظیمات محیط
- تنظیمات محیط توسعه  
- تنظیمات محیط آزمایشی  
- تنظیمات آماده تولید  
- تنظیمات استقرار چند منطقه‌ای  

### ماژول‌های Bicep
- اجزای زیرساخت قابل استفاده مجدد  
- الگوهای منابع رایج  
- قالب‌های امنیتی  
- تنظیمات بهینه‌سازی هزینه  

### اسکریپت‌های کمکی
- خودکارسازی راه‌اندازی محیط  
- اسکریپت‌های مهاجرت پایگاه داده  
- ابزارهای اعتبارسنجی استقرار  
- ابزارهای نظارت بر هزینه  

## 🔧 راهنمای سفارشی‌سازی

### تطبیق مثال‌ها با موارد استفاده شما

1. **بررسی پیش‌نیازها**
   - الزامات خدمات Azure را بررسی کنید  
   - محدودیت‌های اشتراک را تأیید کنید  
   - پیامدهای هزینه را درک کنید  

2. **تغییر تنظیمات**
   - تعاریف خدمات `azure.yaml` را به‌روزرسانی کنید  
   - قالب‌های Bicep را سفارشی کنید  
   - متغیرهای محیطی را تنظیم کنید  

3. **آزمایش کامل**
   - ابتدا در محیط توسعه استقرار دهید  
   - عملکرد را اعتبارسنجی کنید  
   - مقیاس‌پذیری و عملکرد را آزمایش کنید  

4. **بررسی امنیت**
   - کنترل‌های دسترسی را بررسی کنید  
   - مدیریت اسرار را پیاده‌سازی کنید  
   - نظارت و هشدارها را فعال کنید  

## 📊 ماتریس مقایسه

| مثال | خدمات | پایگاه داده | احراز هویت | نظارت | پیچیدگی |
|------|-------|------------|------------|--------|---------|
| Node.js Express Todo | 2 | ✅ | پایه | پایه | ⭐ |
| React SPA + Functions | 3 | ✅ | پایه | کامل | ⭐ |
| Python Flask Container | 2 | ❌ | پایه | کامل | ⭐ |
| C# Web API + SQL | 2 | ✅ | کامل | کامل | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | کامل | کامل | ⭐⭐ |
| Java Microservices | 5+ | ✅ | کامل | کامل | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | کامل | کامل | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | پایه | کامل | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | کامل | کامل | ⭐⭐⭐⭐ |

## 🎓 مسیر یادگیری

### پیشرفت پیشنهادی

1. **شروع با برنامه وب ساده**
   - مفاهیم پایه AZD را یاد بگیرید  
   - گردش کار استقرار را درک کنید  
   - مدیریت محیط را تمرین کنید  

2. **آزمایش وب‌سایت استاتیک**
   - گزینه‌های مختلف میزبانی را بررسی کنید  
   - یکپارچه‌سازی CDN را یاد بگیرید  
   - تنظیمات DNS را درک کنید  

3. **حرکت به سمت برنامه کانتینری**
   - اصول کانتینری‌سازی را یاد بگیرید  
   - مفاهیم مقیاس‌پذیری را درک کنید  
   - با Docker تمرین کنید  

4. **افزودن یکپارچه‌سازی پایگاه داده**
   - تهیه پایگاه داده را یاد بگیرید  
   - رشته‌های اتصال را درک کنید  
   - مدیریت اسرار را تمرین کنید  

5. **کاوش در معماری بدون سرور**
   - معماری مبتنی بر رویداد را درک کنید  
   - محرک‌ها و اتصالات را یاد بگیرید  
   - با API‌ها تمرین کنید  

6. **ساخت میکروسرویس‌ها**
   - ارتباط خدمات را یاد بگیرید  
   - سیستم‌های توزیع‌شده را درک کنید  
   - استقرارهای پیچیده را تمرین کنید  

## 🔍 یافتن مثال مناسب

### بر اساس فناوری
- **Node.js**: برنامه Todo Node.js Express  
- **Python**: برنامه کانتینری Python Flask، توابع Python + SPA  
- **C#**: API وب C# + پایگاه داده SQL، برنامه چت Azure OpenAI، خط لوله ML  
- **Java**: میکروسرویس‌های Java Spring Boot  
- **React**: React SPA + Functions  
- **کانتینرها**: برنامه کانتینری Python Flask، میکروسرویس‌های Java  
- **پایگاه داده‌ها**: Node.js + MongoDB، C# + Azure SQL، Python + Cosmos DB  
- **AI/ML**: برنامه چت Azure OpenAI، پردازش اسناد هوش مصنوعی، خط لوله ML  

### بر اساس الگوی معماری
- **تک‌واحدی**: Node.js Express Todo، C# Web API + SQL  
- **استاتیک + بدون سرور**: React SPA + Functions، Python Functions + SPA  
- **میکروسرویس‌ها**: میکروسرویس‌های Java Spring Boot  
- **کانتینری‌شده**: برنامه کانتینری Python Flask  
- **هوش مصنوعی**: برنامه چت Azure OpenAI، پردازش اسناد هوش مصنوعی، خط لوله ML  

### بر اساس سطح پیچیدگی
- **مبتدی**: Node.js Express Todo، React SPA + Functions، برنامه کانتینری Python Flask  
- **متوسط**: C# Web API + SQL، Python Functions + SPA، میکروسرویس‌های Java، برنامه چت Azure OpenAI، پردازش اسناد هوش مصنوعی  
- **پیشرفته**: خط لوله ML  

## 📚 منابع اضافی

### لینک‌های مستندات
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [قالب‌های Azure AI Foundry AZD](https://github.com/Azure/ai-foundry-templates)  
- [مستندات Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [مرکز معماری Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### مثال‌های جامعه
- [قالب‌های AZD نمونه‌های Azure](https://github.com/Azure-Samples/azd-templates)  
- [قالب‌های Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [گالری Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [برنامه Todo با C# و Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [برنامه Todo با Python و MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [برنامه Todo با Node.js و PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [برنامه وب React با API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [وظیفه Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [توابع Azure با Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### بهترین شیوه‌ها
- [چارچوب معماری خوب Azure](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [چارچوب پذیرش ابر](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 مشارکت در مثال‌ها

آیا مثالی مفید برای اشتراک‌گذاری دارید؟ ما از مشارکت‌ها استقبال می‌کنیم!

### دستورالعمل‌های ارسال
1. ساختار پوشه تعیین‌شده را دنبال کنید  
2. README.md جامع شامل کنید  
3. به فایل‌های تنظیمات توضیحات اضافه کنید  
4. قبل از ارسال، به‌طور کامل آزمایش کنید  
5. برآورد هزینه‌ها و پیش‌نیازها را شامل کنید  

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

**نکته حرفه‌ای**: با ساده‌ترین مثالی که با فناوری شما مطابقت دارد شروع کنید، سپس به تدریج به سمت سناریوهای پیچیده‌تر حرکت کنید. هر مثال بر اساس مفاهیم مثال قبلی ساخته شده است!

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
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، توصیه می‌شود از ترجمه حرفه‌ای انسانی استفاده کنید. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.