# برنامه چت Azure OpenAI

**مسیر یادگیری:** متوسط ⭐⭐ | **زمان:** ۳۵-۴۵ دقیقه | **هزینه:** ۵۰-۲۰۰ دلار در ماه

یک برنامه کامل چت Azure OpenAI که با استفاده از Azure Developer CLI (azd) مستقر شده است. این مثال شامل استقرار GPT-4، دسترسی امن به API و یک رابط چت ساده است.

## 🎯 آنچه یاد خواهید گرفت

- استقرار سرویس Azure OpenAI با مدل GPT-4  
- ایمن‌سازی کلیدهای API OpenAI با Key Vault  
- ساخت یک رابط چت ساده با پایتون  
- نظارت بر استفاده از توکن‌ها و هزینه‌ها  
- پیاده‌سازی محدودیت نرخ و مدیریت خطا  

## 📦 موارد موجود

✅ **سرویس Azure OpenAI** - استقرار مدل GPT-4  
✅ **برنامه چت پایتون** - رابط چت ساده خط فرمان  
✅ **ادغام Key Vault** - ذخیره امن کلیدهای API  
✅ **قالب‌های ARM** - زیرساخت کامل به عنوان کد  
✅ **نظارت بر هزینه‌ها** - ردیابی استفاده از توکن‌ها  
✅ **محدودیت نرخ** - جلوگیری از مصرف بیش از حد سهمیه  

## معماری

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## پیش‌نیازها

### الزامات

- **Azure Developer CLI (azd)** - [راهنمای نصب](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **اشتراک Azure** با دسترسی به OpenAI - [درخواست دسترسی](https://aka.ms/oai/access)  
- **پایتون ۳.۹+** - [نصب پایتون](https://www.python.org/downloads/)  

### بررسی پیش‌نیازها

```bash
# بررسی نسخه azd (نیاز به 1.5.0 یا بالاتر)
azd version

# تایید ورود به Azure
azd auth login

# بررسی نسخه پایتون
python --version  # یا python3 --version

# تایید دسترسی OpenAI (بررسی در پورتال Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ مهم:** سرویس Azure OpenAI نیاز به تأیید درخواست دارد. اگر هنوز درخواست نداده‌اید، به [aka.ms/oai/access](https://aka.ms/oai/access) مراجعه کنید. تأیید معمولاً ۱-۲ روز کاری طول می‌کشد.

## ⏱️ جدول زمانی استقرار

| مرحله | مدت زمان | چه اتفاقی می‌افتد |
|-------|----------|------------------|
| بررسی پیش‌نیازها | ۲-۳ دقیقه | بررسی دسترسی به سهمیه OpenAI |
| استقرار زیرساخت | ۸-۱۲ دقیقه | ایجاد OpenAI، Key Vault، استقرار مدل |
| پیکربندی برنامه | ۲-۳ دقیقه | تنظیم محیط و وابستگی‌ها |
| **مجموع** | **۱۲-۱۸ دقیقه** | آماده برای چت با GPT-4 |

**توجه:** استقرار اولیه OpenAI ممکن است به دلیل آماده‌سازی مدل زمان بیشتری ببرد.

## شروع سریع

```bash
# به مثال بروید
cd examples/azure-openai-chat

# محیط را مقداردهی اولیه کنید
azd env new myopenai

# همه چیز را مستقر کنید (زیرساخت + پیکربندی)
azd up
# از شما خواسته خواهد شد:
# 1. اشتراک Azure را انتخاب کنید
# 2. مکانی با دسترسی OpenAI انتخاب کنید (مانند eastus، eastus2، westus)
# 3. 12-18 دقیقه برای استقرار منتظر بمانید

# وابستگی‌های پایتون را نصب کنید
pip install -r requirements.txt

# شروع به گفتگو کنید!
python chat.py
```

**خروجی مورد انتظار:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ بررسی استقرار

### مرحله ۱: بررسی منابع Azure

```bash
# مشاهده منابع مستقر شده
azd show

# خروجی مورد انتظار نشان می‌دهد:
# - سرویس OpenAI: (نام منبع)
# - Key Vault: (نام منبع)
# - استقرار: gpt-4
# - موقعیت: eastus (یا منطقه انتخابی شما)
```

### مرحله ۲: آزمایش API OpenAI

```bash
# دریافت نقطه پایانی و کلید OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# آزمایش تماس API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**پاسخ مورد انتظار:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### مرحله ۳: بررسی دسترسی به Key Vault

```bash
# فهرست اسرار در Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**اسرار مورد انتظار:**
- `openai-api-key`  
- `openai-endpoint`  

**معیارهای موفقیت:**
- ✅ سرویس OpenAI با GPT-4 مستقر شده است  
- ✅ تماس API پاسخ معتبر بازگشت می‌دهد  
- ✅ اسرار در Key Vault ذخیره شده‌اند  
- ✅ ردیابی استفاده از توکن‌ها کار می‌کند  

## ساختار پروژه

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## ویژگی‌های برنامه

### رابط چت (`chat.py`)

برنامه چت شامل موارد زیر است:

- **تاریخچه مکالمه** - حفظ زمینه در پیام‌ها  
- **شمارش توکن‌ها** - ردیابی استفاده و تخمین هزینه‌ها  
- **مدیریت خطا** - مدیریت مناسب محدودیت نرخ و خطاهای API  
- **تخمین هزینه‌ها** - محاسبه هزینه در زمان واقعی برای هر پیام  
- **پشتیبانی از استریم** - پاسخ‌های استریمی اختیاری  

### دستورات

در حین چت، می‌توانید از دستورات زیر استفاده کنید:
- `quit` یا `exit` - پایان جلسه  
- `clear` - پاک کردن تاریخچه مکالمه  
- `tokens` - نمایش کل استفاده از توکن‌ها  
- `cost` - نمایش تخمین کل هزینه  

### پیکربندی (`config.py`)

بارگذاری پیکربندی از متغیرهای محیطی:
```python
AZURE_OPENAI_ENDPOINT  # از Key Vault
AZURE_OPENAI_API_KEY   # از Key Vault
AZURE_OPENAI_MODEL     # پیش‌فرض: gpt-4
AZURE_OPENAI_MAX_TOKENS # پیش‌فرض: 800
```

## مثال‌های استفاده

### چت ساده

```bash
python chat.py
```

### چت با مدل سفارشی

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### چت با استریم

```bash
python chat.py --stream
```

### نمونه مکالمه

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## مدیریت هزینه‌ها

### قیمت‌گذاری توکن‌ها (GPT-4)

| مدل | ورودی (به ازای هر ۱۰۰۰ توکن) | خروجی (به ازای هر ۱۰۰۰ توکن) |
|-----|-----------------------------|-----------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### هزینه‌های ماهانه تخمینی

بر اساس الگوهای استفاده:

| سطح استفاده | پیام‌ها/روز | توکن‌ها/روز | هزینه ماهانه |
|-------------|-------------|-------------|--------------|
| **سبک** | ۲۰ پیام | ۳۰۰۰ توکن | $3-5 |
| **متوسط** | ۱۰۰ پیام | ۱۵۰۰۰ توکن | $15-25 |
| **سنگین** | ۵۰۰ پیام | ۷۵۰۰۰ توکن | $75-125 |

**هزینه پایه زیرساخت:** $1-2 در ماه (Key Vault + حداقل محاسبات)

### نکات بهینه‌سازی هزینه

```bash
# ۱. از GPT-3.5-Turbo برای وظایف ساده‌تر استفاده کنید (۲۰ برابر ارزان‌تر)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# ۲. تعداد حداکثر توکن‌ها را برای پاسخ‌های کوتاه‌تر کاهش دهید
export AZURE_OPENAI_MAX_TOKENS=400

# ۳. استفاده از توکن‌ها را نظارت کنید
python chat.py --show-tokens

# ۴. هشدارهای بودجه را تنظیم کنید
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## نظارت

### مشاهده استفاده از توکن‌ها

```bash
# در پورتال Azure:
# منبع OpenAI → معیارها → انتخاب "تراکنش توکن"

# یا از طریق Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### مشاهده گزارش‌های API

```bash
# جریان گزارش‌های تشخیصی
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# گزارش‌های پرس‌وجو
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## رفع اشکال

### مشکل: خطای "Access Denied"

**علائم:** ۴۰۳ Forbidden هنگام فراخوانی API

**راه‌حل‌ها:**
```bash
# ۱. تأیید کنید که دسترسی به OpenAI تأیید شده است
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# ۲. بررسی کنید که کلید API صحیح است
azd env get-value AZURE_OPENAI_API_KEY

# ۳. قالب URL نقطه پایانی را تأیید کنید
azd env get-value AZURE_OPENAI_ENDPOINT
# باید باشد: https://[name].openai.azure.com/
```

### مشکل: "Rate Limit Exceeded"

**علائم:** ۴۲۹ درخواست‌های بیش از حد

**راه‌حل‌ها:**
```bash
# ۱. سهمیه فعلی را بررسی کنید
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# ۲. درخواست افزایش سهمیه (در صورت نیاز)
# به پورتال Azure بروید → منبع OpenAI → سهمیه‌ها → درخواست افزایش

# ۳. منطق تلاش مجدد را پیاده‌سازی کنید (قبلاً در chat.py وجود دارد)
# برنامه به‌طور خودکار با تأخیر نمایی تلاش مجدد می‌کند
```

### مشکل: "Model Not Found"

**علائم:** خطای ۴۰۴ برای استقرار

**راه‌حل‌ها:**
```bash
# ۱. فهرست استقرارهای موجود
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# ۲. تأیید نام مدل در محیط
echo $AZURE_OPENAI_MODEL

# ۳. به‌روزرسانی به نام استقرار صحیح
export AZURE_OPENAI_MODEL=gpt-4  # یا gpt-35-turbo
```

### مشکل: تأخیر بالا

**علائم:** زمان پاسخ‌دهی کند (>۵ ثانیه)

**راه‌حل‌ها:**
```bash
# ۱. بررسی تأخیر منطقه‌ای
# استقرار در منطقه نزدیک‌تر به کاربران

# ۲. کاهش max_tokens برای پاسخ‌های سریع‌تر
export AZURE_OPENAI_MAX_TOKENS=400

# ۳. استفاده از پخش زنده برای تجربه کاربری بهتر
python chat.py --stream
```

## بهترین شیوه‌های امنیتی

### ۱. محافظت از کلیدهای API

```bash
# هرگز کلیدها را به کنترل منبع متعهد نکنید
# از Key Vault استفاده کنید (قبلاً پیکربندی شده است)

# کلیدها را به طور منظم بچرخانید
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### ۲. پیاده‌سازی فیلتر محتوا

```python
# Azure OpenAI شامل فیلتر محتوای داخلی است
# پیکربندی در پورتال Azure:
# منبع OpenAI → فیلترهای محتوا → ایجاد فیلتر سفارشی

# دسته‌ها: نفرت، جنسی، خشونت، آسیب به خود
# سطوح: فیلتر کم، متوسط، زیاد
```

### ۳. استفاده از Managed Identity (تولید)

```bash
# برای استقرارهای تولیدی، از هویت مدیریت‌شده استفاده کنید
# به جای کلیدهای API (نیاز به میزبانی برنامه در Azure دارد)

# زیرساخت/ openai.bicep را به‌روزرسانی کنید تا شامل شود:
# identity: { type: 'SystemAssigned' }
```

## توسعه

### اجرا به صورت محلی

```bash
# نصب وابستگی‌ها
pip install -r src/requirements.txt

# تنظیم متغیرهای محیطی
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# اجرای برنامه
python src/chat.py
```

### اجرای تست‌ها

```bash
# نصب وابستگی‌های تست
pip install pytest pytest-cov

# اجرای تست‌ها
pytest tests/ -v

# با پوشش‌دهی
pytest tests/ --cov=src --cov-report=html
```

### به‌روزرسانی استقرار مدل

```bash
# استقرار نسخه‌های مختلف مدل
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## پاکسازی

```bash
# حذف تمام منابع Azure
azd down --force --purge

# این موارد را حذف می‌کند:
# - سرویس OpenAI
# - Key Vault (با حذف نرم ۹۰ روزه)
# - گروه منابع
# - تمام استقرارها و پیکربندی‌ها
```

## مراحل بعدی

### گسترش این مثال

۱. **افزودن رابط وب** - ساخت رابط کاربری React/Vue  
   ```bash
   # افزودن سرویس فرانت‌اند به azure.yaml
   # استقرار در Azure Static Web Apps
   ```

۲. **پیاده‌سازی RAG** - افزودن جستجوی اسناد با Azure AI Search  
   ```python
   # ادغام جستجوی شناختی Azure
   # بارگذاری اسناد و ایجاد شاخص برداری
   ```

۳. **افزودن Function Calling** - فعال‌سازی استفاده از ابزار  
   ```python
   # تعریف توابع در chat.py
   # اجازه دادن به GPT-4 برای فراخوانی API‌های خارجی
   ```

۴. **پشتیبانی از چند مدل** - استقرار چندین مدل  
   ```bash
   # اضافه کردن gpt-35-turbo، مدل‌های تعبیه
   # پیاده‌سازی منطق مسیریابی مدل
   ```

### مثال‌های مرتبط

- **[سناریوی چند عامل در خرده‌فروشی](../retail-scenario.md)** - معماری پیشرفته چند عامل  
- **[برنامه پایگاه داده](../../../../examples/database-app)** - افزودن ذخیره‌سازی پایدار  
- **[برنامه‌های کانتینری](../../../../examples/container-app)** - استقرار به عنوان سرویس کانتینری  

### منابع یادگیری

- 📚 [دوره مبتدی AZD](../../README.md) - صفحه اصلی دوره  
- 📚 [مستندات Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - مستندات رسمی  
- 📚 [مرجع API OpenAI](https://platform.openai.com/docs/api-reference) - جزئیات API  
- 📚 [AI مسئولانه](https://www.microsoft.com/ai/responsible-ai) - بهترین شیوه‌ها  

## منابع اضافی

### مستندات
- **[سرویس Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - راهنمای کامل  
- **[مدل‌های GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - قابلیت‌های مدل  
- **[فیلتر محتوا](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - ویژگی‌های ایمنی  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - مرجع azd  

### آموزش‌ها
- **[شروع سریع OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - استقرار اولیه  
- **[تکمیل چت](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - ساخت برنامه‌های چت  
- **[فراخوانی توابع](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - ویژگی‌های پیشرفته  

### ابزارها
- **[Azure OpenAI Studio](https://oai.azure.com/)** - محیط بازی مبتنی بر وب  
- **[راهنمای مهندسی پرامپت](https://platform.openai.com/docs/guides/prompt-engineering)** - نوشتن پرامپت‌های بهتر  
- **[ماشین حساب توکن](https://platform.openai.com/tokenizer)** - تخمین استفاده از توکن  

### جامعه
- **[Discord Azure AI](https://discord.gg/azure)** - دریافت کمک از جامعه  
- **[بحث‌های GitHub](https://github.com/Azure-Samples/openai/discussions)** - انجمن پرسش و پاسخ  
- **[وبلاگ Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - آخرین به‌روزرسانی‌ها  

---

**🎉 موفقیت!** شما سرویس Azure OpenAI را مستقر کرده و یک برنامه چت کاربردی ساخته‌اید. شروع به کشف قابلیت‌های GPT-4 کنید و با پرامپت‌ها و موارد استفاده مختلف آزمایش کنید.

**سؤالی دارید؟** [یک مشکل باز کنید](https://github.com/microsoft/AZD-for-beginners/issues) یا [سؤالات متداول](../../resources/faq.md) را بررسی کنید.

**هشدار هزینه:** به یاد داشته باشید که پس از پایان آزمایش `azd down` را اجرا کنید تا از هزینه‌های جاری (~۵۰-۱۰۰ دلار در ماه برای استفاده فعال) جلوگیری کنید.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**سلب مسئولیت**:  
این سند با استفاده از سرویس ترجمه هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. در حالی که ما تلاش می‌کنیم دقت را حفظ کنیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است شامل خطاها یا نادرستی‌ها باشند. سند اصلی به زبان اصلی آن باید به عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حساس، ترجمه حرفه‌ای انسانی توصیه می‌شود. ما مسئولیتی در قبال سوء تفاهم‌ها یا تفسیرهای نادرست ناشی از استفاده از این ترجمه نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->