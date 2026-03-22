# برنامه گفت‌وگو Microsoft Foundry Models

**مسیر یادگیری:** متوسط ⭐⭐ | **زمان:** 35-45 دقیقه | **هزینه:** $50-200/ماه

یک برنامه گفت‌وگو کامل Microsoft Foundry Models که با استفاده از Azure Developer CLI (azd) مستقر شده است. این مثال استقرار gpt-4.1، دسترسی ایمن به API و یک رابط گفت‌وگوی ساده را نشان می‌دهد.

## 🎯 آنچه خواهید آموخت

- استقرار سرویس Microsoft Foundry Models با مدل gpt-4.1
- ایمن‌سازی کلیدهای OpenAI با Key Vault
- ساخت یک رابط گفت‌وگوی ساده با پایتون
- پایش مصرف توکن و هزینه‌ها
- پیاده‌سازی محدودیت نرخ و مدیریت خطا

## 📦 موارد شامل

✅ **Microsoft Foundry Models Service** - استقرار مدل gpt-4.1  
✅ **Python Chat App** - رابط گفت‌وگوی خط فرمان ساده  
✅ **Key Vault Integration** - ذخیره‌سازی ایمن کلیدهای API  
✅ **ARM Templates** - زیرساخت به‌عنوان کد کامل  
✅ **Cost Monitoring** - پیگیری مصرف توکن  
✅ **Rate Limiting** - جلوگیری از تمام شدن سهمیه  

## Architecture

```mermaid
graph TD
    App[برنامه چت پایتون<br/>محلی/ابری<br/>رابط خط فرمان<br/>تاریخچه گفتگو<br/>پیگیری مصرف توکن] -- "HTTPS (کلید API)" --> Foundry[خدمات مدل‌های Microsoft Foundry<br/>مدل gpt-4.1<br/>ظرفیت 20K توکن در دقیقه<br/>بازیابی در هنگام خرابی چندمنطقه‌ای]
    Foundry --> KV[خزانه کلید Azure<br/>کلید API OpenAI<br/>URL نقطه پایانی]
    Foundry -. هویت مدیریت‌شده .-> KV
```
## پیش‌نیازها

### الزامی

- **Azure Developer CLI (azd)** - [راهنمای نصب](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **اشتراک Azure** با دسترسی به OpenAI - [درخواست دسترسی](https://aka.ms/oai/access)
- **Python 3.9+** - [نصب Python](https://www.python.org/downloads/)

### بررسی پیش‌نیازها

```bash
# نسخه azd را بررسی کنید (به نسخه 1.5.0 یا بالاتر نیاز است)
azd version

# ورود به Azure را بررسی کنید
azd auth login

# نسخه پایتون را بررسی کنید
python --version  # یا python3 --version

# دسترسی OpenAI را تأیید کنید (در پورتال Azure بررسی کنید)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Important:** Microsoft Foundry Models requires application approval. If you haven't applied, visit [aka.ms/oai/access](https://aka.ms/oai/access). Approval typically takes 1-2 business days.

## ⏱️ جدول زمان‌بندی استقرار

| Phase | Duration | What Happens |
|-------|----------|--------------|
| Prerequisites check | 2-3 minutes | Verify OpenAI quota availability |
| Deploy infrastructure | 8-12 minutes | Create OpenAI, Key Vault, model deployment |
| Configure application | 2-3 minutes | Set up environment and dependencies |
| **Total** | **12-18 minutes** | Ready to chat with gpt-4.1 |

**توجه:** استقرار اول OpenAI ممکن است به‌دلیل تهیه مدل زمان بیشتری ببرد.

## شروع سریع

```bash
# به مثال بروید
cd examples/azure-openai-chat

# محیط را مقداردهی اولیه کنید
azd env new myopenai

# همه چیز را مستقر کنید (زیرساخت + پیکربندی)
azd up
# از شما خواسته خواهد شد که:
# 1. اشتراک Azure را انتخاب کنید
# 2. منطقه‌ای را انتخاب کنید که OpenAI در آن در دسترس است (مثلاً eastus, eastus2, westus)
# 3. برای استقرار 12 تا 18 دقیقه صبر کنید

# وابستگی‌های پایتون را نصب کنید
pip install -r requirements.txt

# گفتگو را شروع کنید!
python chat.py
```

**خروجی مورد انتظار:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ تایید استقرار

### گام 1: بررسی منابع Azure

```bash
# مشاهدهٔ منابع مستقر
azd show

# خروجی مورد انتظار نشان می‌دهد:
# - سرویس OpenAI: (نام منبع)
# - مخزن کلید: (نام منبع)
# - استقرار: gpt-4.1
# - مکان: eastus (یا منطقه‌ای که انتخاب کرده‌اید)
```

### گام 2: آزمون API OpenAI

```bash
# دریافت نقطهٔ پایانی و کلید OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# تست فراخوانی API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
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

### گام 3: تایید دسترسی Key Vault

```bash
# فهرست کردن اسرار در مخزن کلید
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
- ✅ سرویس OpenAI با gpt-4.1 مستقر شده است
- ✅ فراخوانی API پاسخی معتبر برمی‌گرداند
- ✅ اسرار در Key Vault ذخیره شده‌اند
- ✅ ردیابی مصرف توکن کار می‌کند

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

### رابط گفت‌وگو (`chat.py`)

برنامه چت شامل موارد زیر است:

- **تاریخچه مکالمه** - حفظ زمینه بین پیام‌ها
- **شمارش توکن‌ها** - ردیابی مصرف و برآورد هزینه‌ها
- **مدیریت خطا** - رسیدگی مناسب به محدودیت‌های نرخ و خطاهای API
- **برآورد هزینه** - محاسبه هزینه در زمان واقعی برای هر پیام
- **پشتیبانی از استریم** - پاسخ‌های اختیاری به‌صورت جریان

### دستورات

در حین گفتگو می‌توانید از:
- `quit` یا `exit` - پایان جلسه
- `clear` - پاک کردن تاریخچه مکالمه
- `tokens` - نمایش مجموع مصرف توکن
- `cost` - نمایش برآورد کل هزینه

### پیکربندی (`config.py`)

بارگذاری پیکربندی از متغیرهای محیطی:
```python
AZURE_OPENAI_ENDPOINT  # از مخزن کلید
AZURE_OPENAI_API_KEY   # از مخزن کلید
AZURE_OPENAI_MODEL     # پیش‌فرض: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # پیش‌فرض: 800
```

## مثال‌های کاربردی

### چت پایه

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

### گفت‌وگوی نمونه

```
You: Explain Microsoft Foundry Models Service in 3 sentences.
Assistant: Microsoft Foundry Models Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like gpt-4.1 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Microsoft Foundry Models Service offers several model families including gpt-4.1 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## مدیریت هزینه

### قیمت‌گذاری توکن (gpt-4.1)

| Model | Input (per 1K tokens) | Output (per 1K tokens) |
|-------|----------------------|------------------------|
| gpt-4.1 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### هزینه‌های ماهیانه تخمینی

بر اساس الگوهای استفاده:

| Usage Level | Messages/Day | Tokens/Day | Monthly Cost |
|-------------|--------------|------------|--------------|
| **سبک** | 20 messages | 3,000 tokens | $3-5 |
| **متوسط** | 100 messages | 15,000 tokens | $15-25 |
| **سنگین** | 500 messages | 75,000 tokens | $75-125 |

**هزینه زیرساخت پایه:** $1-2/ماه (Key Vault + محاسبات حداقلی)

### نکات بهینه‌سازی هزینه

```bash
# ۱. برای وظایف ساده‌تر از GPT-3.5-Turbo استفاده کنید (۲۰ برابر ارزان‌تر)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# ۲. حداکثر توکن‌ها را کاهش دهید تا پاسخ‌ها کوتاه‌تر باشند
export AZURE_OPENAI_MAX_TOKENS=400

# ۳. مصرف توکن‌ها را رصد کنید
python chat.py --show-tokens

# ۴. هشدارهای بودجه را تنظیم کنید
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## نظارت

### مشاهده مصرف توکن

```bash
# در پورتال Azure:
# منبع OpenAI → متریک‌ها → انتخاب «تراکنش توکن»

# یا از طریق Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### مشاهده لاگ‌های API

```bash
# جریان‌دهی لاگ‌های تشخیصی
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# لاگ‌های پرس‌وجو
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## رفع اشکال

### مسئله: خطای «Access Denied»

**علائم:** 403 Forbidden هنگام فراخوانی API

**راه‌حل‌ها:**
```bash
# 1. مطمئن شوید دسترسی به OpenAI تأیید شده است
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. بررسی کنید که کلید API درست است
azd env get-value AZURE_OPENAI_API_KEY

# 3. فرمت URL نقطه پایانی را بررسی کنید
azd env get-value AZURE_OPENAI_ENDPOINT
# باید باشد: https://[name].openai.azure.com/
```

### مسئله: «Rate Limit Exceeded»

**علائم:** 429 Too Many Requests

**راه‌حل‌ها:**
```bash
# 1. بررسی سهمیه فعلی
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. درخواست افزایش سهمیه (در صورت نیاز)
# به پورتال Azure بروید → منبع OpenAI → سهمیه‌ها → درخواست افزایش

# 3. منطق تلاش مجدد را پیاده‌سازی کنید (قبلاً در chat.py پیاده‌سازی شده است)
# برنامه به‌طور خودکار با تاخیر نمایی دوباره تلاش می‌کند
```

### مسئله: «Model Not Found»

**علائم:** خطای 404 برای استقرار

**راه‌حل‌ها:**
```bash
# 1. فهرست استقرارهای موجود
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. نام مدل را در محیط بررسی کنید
echo $AZURE_OPENAI_MODEL

# 3. نام استقرار را به نام صحیح به‌روزرسانی کنید
export AZURE_OPENAI_MODEL=gpt-4.1  # یا gpt-35-turbo
```

### مسئله: تأخیر بالا

**علائم:** زمان پاسخ‌دهی کند (>5 ثانیه)

**راه‌حل‌ها:**
```bash
# ۱. تأخیر منطقه‌ای را بررسی کنید
# در نزدیک‌ترین منطقه به کاربران مستقر کنید

# ۲. برای پاسخ‌های سریع‌تر مقدار max_tokens را کاهش دهید
export AZURE_OPENAI_MAX_TOKENS=400

# ۳. برای تجربه کاربری بهتر از استریمینگ استفاده کنید
python chat.py --stream
```

## بهترین شیوه‌های امنیتی

### 1. محافظت از کلیدهای API

```bash
# هرگز کلیدها را در مخزن کنترل نسخه ثبت نکنید
# از Key Vault استفاده کنید (قبلاً پیکربندی شده است)

# کلیدها را به‌طور منظم تعویض کنید
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. پیاده‌سازی فیلترینگ محتوا

```python
# Microsoft Foundry Models شامل فیلترینگ محتوای داخلی است
# پیکربندی در پورتال Azure:
# منبع OpenAI → فیلترهای محتوا → ایجاد فیلتر سفارشی

# دسته‌بندی‌ها: نفرت، محتوای جنسی، خشونت، خودآسیب‌رسانی
# سطوح فیلترینگ: پایین، متوسط، بالا
```

### 3. استفاده از Managed Identity (محیط تولید)

```bash
# برای استقرارهای تولیدی، از شناسهٔ مدیریت‌شده استفاده کنید
# به‌جای کلیدهای API (نیاز به میزبانی برنامه در Azure دارد)

# فایل infra/openai.bicep را به‌روزرسانی کنید تا شامل شود:
# identity: { type: 'SystemAssigned' }
```

## توسعه

### اجرا به صورت محلی

```bash
# وابستگی‌ها را نصب کنید
pip install -r src/requirements.txt

# متغیرهای محیطی را تنظیم کنید
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# برنامه را اجرا کنید
python src/chat.py
```

### اجرای تست‌ها

```bash
# نصب وابستگی‌های تست
pip install pytest pytest-cov

# اجرای تست‌ها
pytest tests/ -v

# با گزارش پوشش کد
pytest tests/ --cov=src --cov-report=html
```

### به‌روزرسانی استقرار مدل

```bash
# نسخهٔ متفاوتی از مدل را مستقر کنید
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
# تمام منابع Azure را حذف کنید
azd down --force --purge

# این موارد را حذف می‌کند:
# - سرویس OpenAI
# - مخزن کلید (با حذف نرم به مدت ۹۰ روز)
# - گروه منابع
# - تمام استقرارها و پیکربندی‌ها
```

## گام‌های بعدی

### گسترش این مثال

1. **افزودن رابط وب** - ساخت فرانت‌اند با React/Vue
   ```bash
   # افزودن سرویس فرانت‌اند به azure.yaml
   # استقرار در Azure Static Web Apps
   ```

2. **پیاده‌سازی RAG** - افزودن جستجوی اسناد با Azure AI Search
   ```python
   # یکپارچه‌سازی سرویس جستجوی شناختی آژور
   # بارگذاری اسناد و ایجاد ایندکس برداری
   ```

3. **افزودن فراخوانی توابع** - فعال‌سازی استفاده از ابزار
   ```python
   # تعریف توابع در chat.py
   # اجازه دهید gpt-4.1 درخواست‌هایی به APIهای خارجی ارسال کند
   ```

4. **پشتیبانی از چند مدل** - استقرار چندین مدل
   ```bash
   # افزودن gpt-35-turbo و مدل‌های امبدینگ
   # پیاده‌سازی منطق مسیریابی مدل
   ```

### مثال‌های مرتبط

- **[چندعامل خرده‌فروشی](../retail-scenario.md)** - معماری چندعامله پیشرفته
- **[اپلیکیشن پایگاه‌داده](../../../../examples/database-app)** - افزودن ذخیره‌سازی دائمی
- **[Container Apps](../../../../examples/container-app)** - استقرار به‌عنوان سرویس کانتینری

### منابع آموزشی

- 📚 [دوره AZD برای مبتدیان](../../README.md) - صفحه اصلی دوره
- 📚 [Microsoft Foundry Models Documentation](https://learn.microsoft.com/azure/ai-services/openai/) - اسناد رسمی
- 📚 [OpenAI API Reference](https://platform.openai.com/docs/api-reference) - جزئیات API
- 📚 [Responsible AI](https://www.microsoft.com/ai/responsible-ai) - بهترین شیوه‌ها

## منابع اضافی

### مستندات
- **[Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/)** - راهنمای کامل
- **[gpt-4.1 Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - قابلیت‌های مدل
- **[Content Filtering](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - ویژگی‌های ایمنی
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - مرجع azd

### آموزش‌ها
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - اولین استقرار
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - ساخت برنامه‌های چت
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - قابلیت‌های پیشرفته

### ابزارها
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - محیط آزمایشی مبتنی بر وب
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - نوشتن پرامپت‌های بهتر
- **[Token Calculator](https://platform.openai.com/tokenizer)** - برآورد مصرف توکن

### جامعه
- **[Azure AI Discord](https://discord.gg/azure)** - دریافت کمک از جامعه
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - انجمن پرسش و پاسخ
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - آخرین به‌روزرسانی‌ها

---

**🎉 تبریک!** شما Microsoft Foundry Models را مستقر کرده‌اید و یک برنامه گفت‌وگوی عملی ساخته‌اید. شروع به کاوش قابلیت‌های gpt-4.1 کنید و با پرامپت‌ها و موارد استفاده مختلف آزمایش کنید.

**سؤالی دارید؟** [ایجاد یک مسئله](https://github.com/microsoft/AZD-for-beginners/issues) یا بررسی [FAQ](../../resources/faq.md)

**هشدار هزینه:** به یاد داشته باشید پس از اتمام تست‌ها `azd down` را اجرا کنید تا از هزینه‌های مداوم جلوگیری شود (~$50-100/ماه برای استفاده فعال).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
این سند با استفاده از سرویس ترجمهٔ هوش مصنوعی [Co-op Translator](https://github.com/Azure/co-op-translator) ترجمه شده است. گرچه ما در تلاش برای دقت هستیم، لطفاً توجه داشته باشید که ترجمه‌های خودکار ممکن است حاوی خطاها یا نادرستی‌هایی باشند. سند اصلی به زبان اصلی خود باید به‌عنوان منبع معتبر در نظر گرفته شود. برای اطلاعات حیاتی، ترجمهٔ حرفه‌ای انسانی توصیه می‌شود. ما در قبال هرگونه سوءتفاهم یا تفسیر نادرست ناشی از استفاده از این ترجمه مسئولیتی نداریم.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->