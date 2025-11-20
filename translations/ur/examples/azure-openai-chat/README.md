<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-20T10:23:23+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "ur"
}
-->
# Azure OpenAI چیٹ ایپلیکیشن

**سیکھنے کا راستہ:** درمیانی ⭐⭐ | **وقت:** 35-45 منٹ | **لاگت:** $50-200/ماہ

ایک مکمل Azure OpenAI چیٹ ایپلیکیشن جو Azure Developer CLI (azd) کے ذریعے تعینات کی گئی ہے۔ یہ مثال GPT-4 تعیناتی، محفوظ API رسائی، اور ایک سادہ چیٹ انٹرفیس کو ظاہر کرتی ہے۔

## 🎯 آپ کیا سیکھیں گے

- Azure OpenAI سروس کو GPT-4 ماڈل کے ساتھ تعینات کریں  
- Key Vault کے ذریعے OpenAI API کیز کو محفوظ کریں  
- Python کے ساتھ ایک سادہ چیٹ انٹرفیس بنائیں  
- ٹوکن استعمال اور لاگت کی نگرانی کریں  
- ریٹ محدودیت اور غلطی ہینڈلنگ نافذ کریں  

## 📦 کیا شامل ہے

✅ **Azure OpenAI سروس** - GPT-4 ماڈل کی تعیناتی  
✅ **Python چیٹ ایپ** - سادہ کمانڈ لائن چیٹ انٹرفیس  
✅ **Key Vault انضمام** - محفوظ API کیز اسٹوریج  
✅ **ARM ٹیمپلیٹس** - مکمل انفراسٹرکچر کوڈ کے طور پر  
✅ **لاگت کی نگرانی** - ٹوکن استعمال کی ٹریکنگ  
✅ **ریٹ محدودیت** - کوٹہ ختم ہونے سے بچاؤ  

## آرکیٹیکچر

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

## ضروریات

### مطلوبہ

- **Azure Developer CLI (azd)** - [انسٹال گائیڈ](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- **Azure سبسکرپشن** OpenAI رسائی کے ساتھ - [رسائی کی درخواست کریں](https://aka.ms/oai/access)  
- **Python 3.9+** - [Python انسٹال کریں](https://www.python.org/downloads/)  

### ضروریات کی تصدیق کریں

```bash
# azd ورژن چیک کریں (1.5.0 یا اس سے زیادہ کی ضرورت ہے)
azd version

# Azure لاگ ان کی تصدیق کریں
azd auth login

# Python ورژن چیک کریں
python --version  # یا python3 --version

# OpenAI رسائی کی تصدیق کریں (Azure پورٹل میں چیک کریں)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ اہم:** Azure OpenAI کو ایپلیکیشن کی منظوری درکار ہوتی ہے۔ اگر آپ نے درخواست نہیں دی ہے، تو [aka.ms/oai/access](https://aka.ms/oai/access) پر جائیں۔ منظوری عام طور پر 1-2 کاروباری دنوں میں ہوتی ہے۔

## ⏱️ تعیناتی کا وقت

| مرحلہ | دورانیہ | کیا ہوتا ہے |
|-------|----------|--------------|
| ضروریات کی تصدیق | 2-3 منٹ | OpenAI کوٹہ دستیابی کی تصدیق کریں |
| انفراسٹرکچر تعینات کریں | 8-12 منٹ | OpenAI، Key Vault، ماڈل تعیناتی بنائیں |
| ایپلیکیشن ترتیب دیں | 2-3 منٹ | ماحول اور انحصارات سیٹ کریں |
| **کل** | **12-18 منٹ** | GPT-4 کے ساتھ چیٹ کے لیے تیار |

**نوٹ:** پہلی بار OpenAI تعیناتی میں ماڈل پروویژننگ کی وجہ سے زیادہ وقت لگ سکتا ہے۔

## فوری آغاز

```bash
# مثال پر جائیں
cd examples/azure-openai-chat

# ماحول کو شروع کریں
azd env new myopenai

# سب کچھ تعینات کریں (انفراسٹرکچر + ترتیب)
azd up
# آپ سے پوچھا جائے گا:
# 1. Azure سبسکرپشن منتخب کریں
# 2. OpenAI دستیابی کے ساتھ مقام منتخب کریں (جیسے، eastus، eastus2، westus)
# 3. تعیناتی کے لیے 12-18 منٹ انتظار کریں

# Python کی ضروریات انسٹال کریں
pip install -r requirements.txt

# چیٹنگ شروع کریں!
python chat.py
```

**متوقع آؤٹ پٹ:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ تعیناتی کی تصدیق کریں

### مرحلہ 1: Azure وسائل چیک کریں

```bash
# تعینات کردہ وسائل دیکھیں
azd show

# متوقع نتیجہ دکھاتا ہے:
# - اوپن اے آئی سروس: (وسائل کا نام)
# - کلیدی والٹ: (وسائل کا نام)
# - تعیناتی: gpt-4
# - مقام: eastus (یا آپ کا منتخب کردہ علاقہ)
```

### مرحلہ 2: OpenAI API ٹیسٹ کریں

```bash
# اوپن اے آئی اینڈ پوائنٹ اور کلید حاصل کریں
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API کال کا تجربہ کریں
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**متوقع جواب:**
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

### مرحلہ 3: Key Vault رسائی کی تصدیق کریں

```bash
# کلیدی والٹ میں رازوں کی فہرست
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**متوقع راز:**
- `openai-api-key`  
- `openai-endpoint`  

**کامیابی کے معیار:**
- ✅ GPT-4 کے ساتھ OpenAI سروس تعینات  
- ✅ API کال درست تکمیل واپس کرتی ہے  
- ✅ راز Key Vault میں محفوظ ہیں  
- ✅ ٹوکن استعمال کی ٹریکنگ کام کرتی ہے  

## پروجیکٹ کا ڈھانچہ

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

## ایپلیکیشن کی خصوصیات

### چیٹ انٹرفیس (`chat.py`)

چیٹ ایپلیکیشن میں شامل ہیں:

- **گفتگو کی تاریخ** - پیغامات کے درمیان سیاق و سباق برقرار رکھتی ہے  
- **ٹوکن گنتی** - استعمال کی ٹریکنگ اور لاگت کا تخمینہ لگاتی ہے  
- **غلطی ہینڈلنگ** - ریٹ محدودیت اور API غلطیوں کا شائستہ ہینڈلنگ  
- **لاگت کا تخمینہ** - ہر پیغام کے لیے حقیقی وقت کی لاگت کا حساب  
- **اسٹریمنگ سپورٹ** - اختیاری اسٹریمنگ جوابات  

### کمانڈز

چیٹ کرتے وقت آپ استعمال کر سکتے ہیں:
- `quit` یا `exit` - سیشن ختم کریں  
- `clear` - گفتگو کی تاریخ صاف کریں  
- `tokens` - کل ٹوکن استعمال دکھائیں  
- `cost` - کل تخمینی لاگت دکھائیں  

### ترتیب (`config.py`)

ماحول کے متغیرات سے ترتیب لوڈ کرتا ہے:
```python
AZURE_OPENAI_ENDPOINT  # کلیدی والٹ سے
AZURE_OPENAI_API_KEY   # کلیدی والٹ سے
AZURE_OPENAI_MODEL     # ڈیفالٹ: gpt-4
AZURE_OPENAI_MAX_TOKENS # ڈیفالٹ: 800
```

## استعمال کی مثالیں

### بنیادی چیٹ

```bash
python chat.py
```

### کسٹم ماڈل کے ساتھ چیٹ

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### اسٹریمنگ کے ساتھ چیٹ

```bash
python chat.py --stream
```

### مثال گفتگو

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

## لاگت کا انتظام

### ٹوکن قیمتیں (GPT-4)

| ماڈل | ان پٹ (فی 1K ٹوکن) | آؤٹ پٹ (فی 1K ٹوکن) |
|-------|----------------------|------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### تخمینی ماہانہ لاگت

استعمال کے نمونوں کی بنیاد پر:

| استعمال کی سطح | پیغامات/دن | ٹوکن/دن | ماہانہ لاگت |
|-------------|--------------|------------|--------------|
| **ہلکا** | 20 پیغامات | 3,000 ٹوکن | $3-5 |
| **درمیانہ** | 100 پیغامات | 15,000 ٹوکن | $15-25 |
| **بھاری** | 500 پیغامات | 75,000 ٹوکن | $75-125 |

**بنیادی انفراسٹرکچر لاگت:** $1-2/ماہ (Key Vault + کم سے کم کمپیوٹ)

### لاگت کو بہتر بنانے کے نکات

```bash
# 1. آسان کاموں کے لیے GPT-3.5-Turbo استعمال کریں (20x سستا)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. مختصر جوابات کے لیے زیادہ سے زیادہ ٹوکنز کم کریں
export AZURE_OPENAI_MAX_TOKENS=400

# 3. ٹوکن کے استعمال کی نگرانی کریں
python chat.py --show-tokens

# 4. بجٹ الرٹس ترتیب دیں
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## نگرانی

### ٹوکن استعمال دیکھیں

```bash
# ایزور پورٹل میں:
# اوپن اے آئی ریسورس → میٹرکس → "ٹوکن ٹرانزیکشن" منتخب کریں

# یا ایزور کمانڈ لائن انٹرفیس کے ذریعے:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API لاگز دیکھیں

```bash
# تشخیصی لاگز کو اسٹریم کریں
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# لاگز کو سوال کریں
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## خرابیوں کا سراغ لگانا

### مسئلہ: "Access Denied" غلطی

**علامات:** API کال کرتے وقت 403 Forbidden

**حل:**
```bash
# 1. تصدیق کریں کہ اوپن اے آئی تک رسائی منظور شدہ ہے
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. چیک کریں کہ API کلید درست ہے
azd env get-value AZURE_OPENAI_API_KEY

# 3. تصدیق کریں کہ اختتامی نقطہ URL فارمیٹ درست ہے
azd env get-value AZURE_OPENAI_ENDPOINT
# ہونا چاہئے: https://[name].openai.azure.com/
```

### مسئلہ: "Rate Limit Exceeded"

**علامات:** 429 Too Many Requests

**حل:**
```bash
# 1. موجودہ کوٹہ چیک کریں
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. کوٹہ بڑھانے کی درخواست کریں (اگر ضرورت ہو)
# Azure پورٹل پر جائیں → OpenAI ریسورس → کوٹہ → درخواست میں اضافہ کریں

# 3. دوبارہ کوشش کرنے کی منطق نافذ کریں (پہلے سے chat.py میں موجود ہے)
# ایپلیکیشن خود بخود ایکسپونینشل بیک آف کے ساتھ دوبارہ کوشش کرتی ہے
```

### مسئلہ: "Model Not Found"

**علامات:** تعیناتی کے لیے 404 غلطی

**حل:**
```bash
# دستیاب تعیناتیوں کی فہرست بنائیں۔
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# ماحول میں ماڈل کا نام تصدیق کریں۔
echo $AZURE_OPENAI_MODEL

# درست تعیناتی نام پر اپ ڈیٹ کریں۔
export AZURE_OPENAI_MODEL=gpt-4  # یا gpt-35-turbo
```

### مسئلہ: زیادہ تاخیر

**علامات:** سست جواب کا وقت (>5 سیکنڈ)

**حل:**
```bash
# 1. علاقائی تاخیر چیک کریں
# صارفین کے قریب ترین علاقے میں تعینات کریں

# 2. تیز تر جوابات کے لیے زیادہ سے زیادہ ٹوکنز کم کریں
export AZURE_OPENAI_MAX_TOKENS=400

# 3. بہتر UX کے لیے اسٹریمنگ استعمال کریں
python chat.py --stream
```

## سیکیورٹی کے بہترین طریقے

### 1. API کیز کی حفاظت کریں

```bash
# کبھی بھی کنٹرول سورس میں چابیاں شامل نہ کریں
# کلیدی والٹ استعمال کریں (پہلے سے ترتیب دیا گیا)

# چابیاں باقاعدگی سے تبدیل کریں
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. مواد فلٹرنگ نافذ کریں

```python
# Azure OpenAI میں بلٹ ان مواد فلٹرنگ شامل ہے
# Azure پورٹل میں ترتیب دیں:
# OpenAI وسائل → مواد فلٹرز → کسٹم فلٹر بنائیں

# اقسام: نفرت، جنسی، تشدد، خود کو نقصان پہنچانا
# سطحیں: کم، درمیانی، اعلی فلٹرنگ
```

### 3. منظم شناخت استعمال کریں (پروڈکشن)

```bash
# پیداوار کی تعیناتی کے لیے، منظم شناخت استعمال کریں
# API کیز کے بجائے (Azure پر ایپ کی میزبانی کی ضرورت ہے)

# infra/openai.bicep کو شامل کرنے کے لیے اپ ڈیٹ کریں:
# شناخت: { قسم: 'SystemAssigned' }
```

## ترقی

### مقامی طور پر چلائیں

```bash
# انحصار انسٹال کریں
pip install -r src/requirements.txt

# ماحول کے متغیرات سیٹ کریں
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# ایپلیکیشن چلائیں
python src/chat.py
```

### ٹیسٹ چلائیں

```bash
# ٹیسٹ کی ضروریات انسٹال کریں
pip install pytest pytest-cov

# ٹیسٹ چلائیں
pytest tests/ -v

# کوریج کے ساتھ
pytest tests/ --cov=src --cov-report=html
```

### ماڈل تعیناتی کو اپ ڈیٹ کریں

```bash
# مختلف ماڈل ورژن کو نافذ کریں
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

## صفائی

```bash
# تمام Azure وسائل کو حذف کریں
azd down --force --purge

# یہ ہٹاتا ہے:
# - OpenAI سروس
# - Key Vault (90 دن کی نرم حذف کے ساتھ)
# - وسائل گروپ
# - تمام تعیناتیاں اور ترتیبیں
```

## اگلے مراحل

### اس مثال کو وسعت دیں

1. **ویب انٹرفیس شامل کریں** - React/Vue فرنٹ اینڈ بنائیں  
   ```bash
   # فرنٹ اینڈ سروس کو azure.yaml میں شامل کریں
   # Azure Static Web Apps پر تعینات کریں
   ```

2. **RAG نافذ کریں** - Azure AI Search کے ساتھ دستاویز تلاش شامل کریں  
   ```python
   # Azure Cognitive Search کو ضم کریں
   # دستاویزات اپ لوڈ کریں اور ویکٹر انڈیکس بنائیں
   ```

3. **فنکشن کالنگ شامل کریں** - ٹول استعمال کو فعال کریں  
   ```python
   # چیٹ.py میں فنکشنز کی تعریف کریں
   # GPT-4 کو بیرونی APIs کال کرنے دیں
   ```

4. **ملٹی ماڈل سپورٹ** - متعدد ماڈلز تعینات کریں  
   ```bash
   # جی پی ٹی-35-ٹربو، ایمبیڈنگ ماڈلز شامل کریں
   # ماڈل روٹنگ منطق نافذ کریں
   ```

### متعلقہ مثالیں

- **[ریٹیل ملٹی ایجنٹ](../retail-scenario.md)** - جدید ملٹی ایجنٹ آرکیٹیکچر  
- **[ڈیٹا بیس ایپ](../../../../examples/database-app)** - مستقل اسٹوریج شامل کریں  
- **[کنٹینر ایپس](../../../../examples/container-app)** - کنٹینرائزڈ سروس کے طور پر تعینات کریں  

### سیکھنے کے وسائل

- 📚 [AZD For Beginners کورس](../../README.md) - مرکزی کورس ہوم  
- 📚 [Azure OpenAI دستاویزات](https://learn.microsoft.com/azure/ai-services/openai/) - آفیشل ڈاکس  
- 📚 [OpenAI API حوالہ](https://platform.openai.com/docs/api-reference) - API تفصیلات  
- 📚 [ذمہ دار AI](https://www.microsoft.com/ai/responsible-ai) - بہترین طریقے  

## اضافی وسائل

### دستاویزات
- **[Azure OpenAI سروس](https://learn.microsoft.com/azure/ai-services/openai/)** - مکمل گائیڈ  
- **[GPT-4 ماڈلز](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - ماڈل کی صلاحیتیں  
- **[مواد فلٹرنگ](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - حفاظتی خصوصیات  
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd حوالہ  

### ٹیوٹوریلز
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - پہلی تعیناتی  
- **[چیٹ تکمیل](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - چیٹ ایپس بنانا  
- **[فنکشن کالنگ](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - جدید خصوصیات  

### ٹولز
- **[Azure OpenAI اسٹوڈیو](https://oai.azure.com/)** - ویب پر مبنی پلے گراؤنڈ  
- **[پرومپٹ انجینئرنگ گائیڈ](https://platform.openai.com/docs/guides/prompt-engineering)** - بہتر پرومپٹس لکھنا  
- **[ٹوکن کیلکولیٹر](https://platform.openai.com/tokenizer)** - ٹوکن استعمال کا تخمینہ لگائیں  

### کمیونٹی
- **[Azure AI Discord](https://discord.gg/azure)** - کمیونٹی سے مدد حاصل کریں  
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - سوال و جواب فورم  
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - تازہ ترین اپ ڈیٹس  

---

**🎉 کامیابی!** آپ نے Azure OpenAI تعینات کیا اور ایک کام کرنے والی چیٹ ایپلیکیشن بنائی۔ GPT-4 کی صلاحیتوں کو دریافت کریں اور مختلف پرومپٹس اور استعمال کے کیسز کے ساتھ تجربہ کریں۔

**سوالات؟** [ایک مسئلہ کھولیں](https://github.com/microsoft/AZD-for-beginners/issues) یا [FAQ](../../resources/faq.md) چیک کریں  

**لاگت کی تنبیہ:** جب ٹیسٹنگ ختم ہو جائے تو `azd down` چلائیں تاکہ جاری چارجز سے بچا جا سکے (~$50-100/ماہ فعال استعمال کے لیے)۔

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ لاتعلقی**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کی بھرپور کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->