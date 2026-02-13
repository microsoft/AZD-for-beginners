# সহজ Flask API - Container App উদাহরণ

**শিখন পথ:** শুরুতি ⭐ | **সময়:** 25-35 minutes | **খরচ:** $0-15/month

একটি সম্পূর্ণ, কার্যকর Python Flask REST API যা Azure Developer CLI (azd) ব্যবহার করে Azure Container Apps-এ ডিপ্লয় করা হয়েছে। এই উদাহরণ কন্টেইনার ডিপ্লয়মেন্ট, অটো-স্কেলিং, এবং মনিটরিং মৌলিক বিষয়গুলো দেখায়।

## 🎯 আপনি যা শিখবেন

- Azure-এ কন্টেইনারকৃত Python অ্যাপ্লিকেশন ডিপ্লয় করবেন
- scale-to-zero সহ অটো-স্কেলিং কনফিগার করবেন
- হেলথ প্রোব এবং রেডিনেস চেক বাস্তবায়ন করবেন
- অ্যাপ্লিকেশনের লগ ও মেট্রিক মনিটর করবেন
- দ্রুত ডিপ্লয়ের জন্য Azure Developer CLI ব্যবহার করবেন

## 📦 অন্তর্ভুক্ত

✅ **Flask অ্যাপ্লিকেশন** - সম্পূর্ণ REST API CRUD অপারেশনসহ (`src/app.py`)  
✅ **Dockerfile** - প্রোডাকশন-রেডি কন্টেইনার কনফিগারেশন  
✅ **Bicep অবকাঠামো** - Container Apps পরিবেশ এবং API ডিপ্লয়মেন্ট  
✅ **AZD Configuration** - এক-কমান্ড ডিপ্লয়মেন্ট সেটআপ  
✅ **Health Probes** - Liveness এবং readiness চেক কনফিগার করা হয়েছে  
✅ **Auto-scaling** - HTTP লোড অনুযায়ী 0-10 রেপ্লিকা  

## আর্কিটেকচার

```
┌─────────────────────────────────────────┐
│   Azure Container Apps Environment      │
│                                         │
│  ┌───────────────────────────────────┐ │
│  │   Flask API Container             │ │
│  │   - Health endpoints              │ │
│  │   - REST API                      │ │
│  │   - Auto-scaling (0-10 replicas)  │ │
│  └───────────────────────────────────┘ │
│                                         │
│  Application Insights ────────────────┐ │
└────────────────────────────────────────┘
```

## পূর্বশর্ত

### প্রয়োজনীয়
- **Azure Developer CLI (azd)** - [ইনস্টলেশন নির্দেশিকা](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure subscription** - [ফ্রি অ্যাকাউন্ট](https://azure.microsoft.com/free/)
- **Docker Desktop** - [ডকার ইনস্টল করুন](https://www.docker.com/products/docker-desktop/) (স্থানীয় পরীক্ষার জন্য)

### পূর্বশর্ত যাচাই করুন

```bash
# azd সংস্করণ পরীক্ষা করুন (প্রয়োজন 1.5.0 বা তার বেশি)
azd version

# Azure লগইন যাচাই করুন
azd auth login

# Docker পরীক্ষা করুন (ঐচ্ছিক, স্থানীয় পরীক্ষার জন্য)
docker --version
```

## ⏱️ ডিপ্লয়মেন্ট সময়রেখা

| ধাপ | সময়কাল | কি ঘটে |
|-------|----------|--------------||
| Environment setup | 30 সেকেন্ড | azd পরিবেশ তৈরি করুন |
| Build container | 2-3 মিনিট | Docker দিয়ে Flask অ্যাপ বিল্ড |
| Provision infrastructure | 3-5 মিনিট | Container Apps, registry, monitoring তৈরি করুন |
| Deploy application | 2-3 মিনিট | ইমেজ পুশ করে Container Apps-এ ডিপ্লয় |
| **মোট** | **8-12 মিনিট** | পূর্ণ ডিপ্লয়মেন্ট প্রস্তুত |

## দ্রুত শুরু

```bash
# উদাহরণে যান
cd examples/container-app/simple-flask-api

# পরিবেশ আরম্ভ করুন (একটি অনন্য নাম বেছে নিন)
azd env new myflaskapi

# সবকিছু ডিপ্লয় করুন (ইনফ্রাস্ট্রাকচার + অ্যাপ্লিকেশন)
azd up
# আপনাকে অনুরোধ করা হবে:
# 1. Azure সাবস্ক্রিপশন নির্বাচন করুন
# 2. অবস্থান নির্বাচন করুন (যেমন, eastus2)
# 3. ডিপ্লয়ের জন্য 8-12 মিনিট অপেক্ষা করুন

# আপনার API এন্ডপয়েন্ট পান
azd env get-values

# API পরীক্ষা করুন
curl $(azd env get-value API_ENDPOINT)/health
```

**প্রত্যাশিত আউটপুট:**
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z",
  "service": "simple-flask-api",
  "version": "1.0.0"
}
```

## ✅ ডিপ্লয়মেন্ট যাচাই করুন

### ধাপ ১: ডিপ্লয়মেন্ট স্থিতি যাচাই করুন

```bash
# ডিপ্লয় করা সার্ভিসগুলো দেখুন
azd show

# প্রত্যাশিত আউটপুট প্রদর্শিত হবে:
# - সার্ভিস: api
# - এন্ডপয়েন্ট: https://ca-api-[env].xxx.azurecontainerapps.io
# - স্ট্যাটাস: চলমান
```

### ধাপ ২: API এন্ডপয়েন্ট পরীক্ষা করুন

```bash
# API এন্ডপয়েন্ট পান
API_URL=$(azd env get-value API_ENDPOINT)

# স্বাস্থ্য পরীক্ষা করুন
curl $API_URL/health

# রুট এন্ডপয়েন্ট পরীক্ষা করুন
curl $API_URL/

# একটি আইটেম তৈরি করুন
curl -X POST $API_URL/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "My first item"}'

# সমস্ত আইটেম পান
curl $API_URL/api/items
```

**সফলতার মানদণ্ড:**
- ✅ হেলথ এন্ডপয়েন্ট HTTP 200 রিটার্ন করে
- ✅ রুট এন্ডপয়েন্ট API তথ্য দেখায়
- ✅ POST আইটেম তৈরি করে এবং HTTP 201 রিটার্ন করে
- ✅ GET তৈরি করা আইটেমগুলো রিটার্ন করে

### ধাপ ৩: লগ দেখুন

```bash
# azd monitor ব্যবহার করে লাইভ লগ স্ট্রিম করুন
azd monitor --logs

# বা Azure CLI ব্যবহার করুন:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# আপনি দেখতে পাবেন:
# - Gunicorn স্টার্টআপ বার্তা
# - HTTP অনুরোধ লগ
# - অ্যাপ্লিকেশন তথ্য লগ
```

## প্রকল্প কাঠামো

```
simple-flask-api/
├── azure.yaml              # AZD configuration
├── infra/
│   ├── main.bicep         # Main infrastructure
│   ├── main.parameters.json
│   └── app/
│       ├── container-env.bicep
│       └── api.bicep
└── src/
    ├── app.py             # Flask application
    ├── requirements.txt
    └── Dockerfile
```

## API এন্ডপয়েন্টস

| এন্ডপয়েন্ট | মেথড | বর্ণনা |
|----------|--------|-------------|
| `/health` | GET | হেলথ চেক |
| `/api/items` | GET | সব আইটেম দেখায় |
| `/api/items` | POST | নতুন আইটেম তৈরি করে |
| `/api/items/{id}` | GET | নির্দিষ্ট আইটেম পান |
| `/api/items/{id}` | PUT | আইটেম আপডেট করে |
| `/api/items/{id}` | DELETE | আইটেম মুছে ফেলে |

## কনফিগারেশন

### পরিবেশ ভেরিয়েবল

```bash
# কাস্টম কনফিগারেশন সেট করুন
azd env set PORT 8000
azd env set LOG_LEVEL info
azd env set MAX_REPLICAS 20
```

### স্কেলিং কনফিগারেশন

API স্বয়ংক্রিয়ভাবে HTTP ট্রাফিক অনুযায়ী স্কেল করে:
- **ন্যূনতম রেপ্লিকা**: 0 (নিষ্ক্রিয় থাকলে শূন্যে স্কেল করে)
- **সর্বোচ্চ রেপ্লিকা**: 10
- **প্রতিটি রেপ্লিকায় সমান্তরাল অনুরোধ**: 50

## ডেভেলপমেন্ট

### স্থানীয়ভাবে চালান

```bash
# নির্ভরশীলতা ইনস্টল করুন
cd src
pip install -r requirements.txt

# অ্যাপটি চালান
python app.py

# স্থানীয়ভাবে পরীক্ষা করুন
curl http://localhost:8000/health
```

### কন্টেইনার বিল্ড ও টেস্ট করুন

```bash
# Docker ইমেজ তৈরি করুন
docker build -t flask-api:local ./src

# কনটেইনার লোকালি চালান
docker run -p 8000:8000 flask-api:local

# কনটেইনার পরীক্ষা করুন
curl http://localhost:8000/health
```

## ডিপ্লয়মেন্ট

### সম্পূর্ণ ডিপ্লয়মেন্ট

```bash
# ইনফ্রাস্ট্রাকচার এবং অ্যাপ্লিকেশন মোতায়েন করুন
azd up
```

### কেবল কোড ডিপ্লয়মেন্ট

```bash
# শুধুমাত্র অ্যাপ্লিকেশন কোড ডিপ্লয় করুন (ইনফ্রাস্ট্রাকচার অপরিবর্তিত)
azd deploy api
```

### কনফিগারেশন আপডেট করুন

```bash
# পরিবেশ ভেরিয়েবলগুলো আপডেট করুন
azd env set API_KEY "new-api-key"

# নতুন কনফিগারেশনের সাথে পুনরায় স্থাপন করুন
azd deploy api
```

## মনিটরিং

### লগ দেখুন

```bash
# azd monitor ব্যবহার করে লাইভ লগ স্ট্রিম করুন
azd monitor --logs

# অথবা Container Apps-এর জন্য Azure CLI ব্যবহার করুন:
az containerapp logs show --name api --resource-group $RG_NAME --follow

# শেষ ১০০ লাইন দেখুন
az containerapp logs show --name api --resource-group $RG_NAME --tail 100
```

### মেট্রিক্স মনিটর করুন

```bash
# Azure Monitor ড্যাশবোর্ড খুলুন
azd monitor --overview

# নির্দিষ্ট মেট্রিক্স দেখুন
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "Requests,ResponseTime"
```

## টেস্টিং

### হেলথ চেক

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/health
```

প্রত্যাশিত প্রতিক্রিয়া:
```json
{
  "status": "healthy",
  "timestamp": "2025-11-19T10:30:00Z"
}
```

### আইটেম তৈরি করুন

```bash
curl -X POST $(azd show --output json | jq -r '.services.api.endpoint')/api/items \
  -H "Content-Type: application/json" \
  -d '{"name": "Test Item", "description": "A test item"}'
```

### সব আইটেম পেতে

```bash
curl $(azd show --output json | jq -r '.services.api.endpoint')/api/items
```

## খরচ অপ্টিমাইজেশন

এই ডিপ্লয়মেন্ট scale-to-zero ব্যবহার করে, তাই আপনি শুধুমাত্র তখনই পরিশোধ করবেন যখন API অনুরোধ প্রক্রিয়া করছে:

- **নিষ্ক্রিয় খরচ**: ~$0/মাস (শূন্যে স্কেল করা)
- **সক্রিয় খরচ**: ~$0.000024/সেকেন্ড প্রতি রেপ্লিকা
- **প্রত্যাশিত মাসিক খরচ** (কম ব্যবহারে): $5-15

### খরচ আরও কমান

```bash
# ডেভের জন্য সর্বোচ্চ রেপ্লিকা সংখ্যা কমান
azd env set MAX_REPLICAS 3

# ছোট নিষ্ক্রিয় সময়সীমা ব্যবহার করুন
azd env set SCALE_TO_ZERO_TIMEOUT 300  # ৫ মিনিট
```

## সমস্যা সমাধান

### কন্টেইনার শুরু হবে না

```bash
# Azure CLI ব্যবহার করে কন্টেইনার লগগুলি পরীক্ষা করুন
az containerapp logs show --name api --resource-group $RG_NAME --tail 100

# স্থানীয়ভাবে Docker ইমেজ তৈরি হচ্ছে কি না যাচাই করুন
docker build -t test ./src
```

### API অ্যাক্সেসযোগ্য নয়

```bash
# ইনগ্রেস বাহ্যিক কিনা যাচাই করুন
az containerapp show --name api --resource-group rg-simple-flask-api \
  --query properties.configuration.ingress.external
```

### উচ্চ প্রতিক্রিয়া সময়

```bash
# CPU/মেমরি ব্যবহার পরীক্ষা করুন
az monitor metrics list \
  --resource $(azd show --output json | jq -r '.services.api.resourceId') \
  --metric "CPUPercentage,MemoryPercentage"

# প্রয়োজনে সম্পদ বৃদ্ধি করুন
az containerapp update --name api --resource-group rg-simple-flask-api \
  --cpu 1.0 --memory 2Gi
```

## ক্লিন আপ

```bash
# সমস্ত সম্পদ মুছে ফেলুন
azd down --force --purge
```

## পরবর্তী ধাপসমূহ

### এই উদাহরণটি প্রসারিত করুন

1. **ডাটাবেস যুক্ত করুন** - Azure Cosmos DB বা SQL Database ইন্টিগ্রেট করুন
   ```bash
   # infra/main.bicep-এ Cosmos DB মডিউল যোগ করুন
   # app.py-এ ডাটাবেস সংযোগ যোগ করে ফাইলটি আপডেট করুন
   ```

2. **প্রমাণীকরণ যোগ করুন** - Azure AD বা API কী বাস্তবায়ন করুন
   ```python
   # app.py-এ প্রমাণীকরণ মিডলওয়্যার যোগ করুন
   from functools import wraps
   ```

3. **CI/CD কনফিগার করুন** - GitHub Actions ওয়ার্কফ্লো
   ```yaml
   # Create .github/workflows/deploy.yml
   name: Deploy to Azure
   on: [push]
   ```

4. **Managed Identity যোগ করুন** - Azure সার্ভিসে নিরাপদ অ্যাক্সেস
   ```bicep
   # Update infra/app/api.bicep
   identity: { type: 'SystemAssigned' }
   ```

### সম্পর্কিত উদাহরণসমূহ

- **[ডাটাবেস অ্যাপ](../../../../../examples/database-app)** - SQL Database সহ সম্পূর্ণ উদাহরণ
- **[Microservices](../../../../../examples/container-app/microservices)** - মাল্টি-সার্ভিস আর্কিটেকচার
- **[Container Apps মাষ্টার গাইড](../README.md)** - সব কন্টেইনার প্যাটার্ন

### শিক্ষণ সম্পদ

- 📚 [AZD For Beginners Course](../../../README.md) - মূল কোর্স হোম
- 📚 [Container Apps Patterns](../README.md) - আরও ডিপ্লয়মেন্ট প্যাটার্ন
- 📚 [AZD Templates Gallery](https://azure.github.io/awesome-azd/) - কমিউনিটি টেমপ্লেট

## অতিরিক্ত সম্পদ

### ডকুমেন্টেশন
- **[Flask Documentation](https://flask.palletsprojects.com/)** - Flask ফ্রেমওয়ার্ক গাইড
- **[Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)** - অফিসিয়াল Azure ডকুমেন্টেশন
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd কমান্ড রেফারেন্স

### টিউটোরিয়াল
- **[Container Apps Quickstart](https://learn.microsoft.com/azure/container-apps/quickstart-portal)** - আপনার প্রথম অ্যাপ ডিপ্লয় করুন
- **[Python on Azure](https://learn.microsoft.com/azure/developer/python/)** - Python ডেভেলপমেন্ট গাইড
- **[Bicep Language](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)** - ইনফ্রাস্ট্রাকচার অ্যাজ কোড

### টুলস
- **[Azure Portal](https://portal.azure.com)** - ভিজ্যুয়ালি রিসোর্স ম্যানেজ করুন
- **[VS Code Azure Extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurecontainerapps)** - IDE ইন্টিগ্রেশন

---

**🎉 অভিনন্দন!** আপনি অটো-স্কেলিং এবং মনিটরিং সহ একটি প্রোডাকশন-রেডি Flask API Azure Container Apps-এ ডিপ্লয় করেছেন।

**প্রশ্ন আছে?** [ইস্যু খুলুন](https://github.com/microsoft/AZD-for-beginners/issues) অথবা [প্রশ্নোত্তর](../../../resources/faq.md) দেখুন

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়মুক্তি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাযথতার জন্য চেষ্টা করি, তবুও অনুগ্রহ করে জেনে রাখুন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা ভুল থাকতে পারে। মূল নথিটি তার নিজ ভাষায় কর্তৃপক্ষপূর্ণ উৎস হিসেবে গণ্য করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ করা উত্তম। এই অনুবাদ ব্যবহারের ফলে সৃষ্ট কোনো ভুল বোঝাবুঝি বা ভ্রান্ত ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->