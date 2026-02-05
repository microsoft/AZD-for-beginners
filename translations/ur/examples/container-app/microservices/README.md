# مائیکرو سروسز آرکیٹیکچر - کنٹینر ایپ کی مثال

⏱️ **تخمینی وقت**: 25-35 منٹ | 💰 **تخمینی لاگت**: ~$50-100/ماہ | ⭐ **پیچیدگی**: اعلیٰ درجے کی

ایک **سادہ لیکن عملی** مائیکرو سروسز آرکیٹیکچر جو AZD CLI کے ذریعے Azure Container Apps پر تعینات کی گئی ہے۔ یہ مثال سروس سے سروس کی بات چیت، کنٹینر آرکیسٹریشن، اور مانیٹرنگ کو ایک عملی 2-سروس سیٹ اپ کے ساتھ ظاہر کرتی ہے۔

> **📚 سیکھنے کا طریقہ**: یہ مثال ایک کم سے کم 2-سروس آرکیٹیکچر (API گیٹ وے + بیک اینڈ سروس) سے شروع ہوتی ہے جسے آپ حقیقت میں تعینات کر سکتے ہیں اور سیکھ سکتے ہیں۔ اس بنیاد کو سمجھنے کے بعد، ہم مکمل مائیکرو سروسز ایکو سسٹم میں توسیع کے لیے رہنمائی فراہم کرتے ہیں۔

## آپ کیا سیکھیں گے

اس مثال کو مکمل کرکے، آپ:
- Azure Container Apps پر متعدد کنٹینرز تعینات کریں گے
- اندرونی نیٹ ورکنگ کے ساتھ سروس سے سروس کی بات چیت نافذ کریں گے
- ماحول پر مبنی اسکیلنگ اور صحت کی جانچ کو ترتیب دیں گے
- Application Insights کے ساتھ تقسیم شدہ ایپلیکیشنز کی نگرانی کریں گے
- مائیکرو سروسز کی تعیناتی کے نمونے اور بہترین طریقے سمجھیں گے
- سادہ سے پیچیدہ آرکیٹیکچرز تک ترقی پسند توسیع سیکھیں گے

## آرکیٹیکچر

### مرحلہ 1: ہم کیا بنا رہے ہیں (اس مثال میں شامل)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**سادہ سے شروع کیوں کریں؟**
- ✅ جلدی تعینات کریں اور سمجھیں (25-35 منٹ)
- ✅ مائیکرو سروسز کے بنیادی نمونے بغیر پیچیدگی کے سیکھیں
- ✅ کام کرنے والا کوڈ جسے آپ تبدیل اور تجربہ کر سکتے ہیں
- ✅ سیکھنے کے لیے کم لاگت (~$50-100/ماہ بمقابلہ $300-1400/ماہ)
- ✅ ڈیٹا بیسز اور میسج کیو شامل کرنے سے پہلے اعتماد پیدا کریں

**تشبیہ**: اسے ڈرائیونگ سیکھنے کی طرح سمجھیں۔ آپ ایک خالی پارکنگ لاٹ (2 سروسز) سے شروع کرتے ہیں، بنیادی باتوں میں مہارت حاصل کرتے ہیں، پھر شہر کی ٹریفک (5+ سروسز کے ساتھ ڈیٹا بیسز) کی طرف بڑھتے ہیں۔

### مرحلہ 2: مستقبل کی توسیع (حوالہ آرکیٹیکچر)

جب آپ 2-سروس آرکیٹیکچر میں مہارت حاصل کر لیں، تو آپ اسے بڑھا سکتے ہیں:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

"توسیع گائیڈ" سیکشن میں مرحلہ وار ہدایات دیکھیں۔

## شامل خصوصیات

✅ **سروس ڈسکوری**: کنٹینرز کے درمیان خودکار DNS پر مبنی دریافت  
✅ **لوڈ بیلنسنگ**: نقلوں کے درمیان بلٹ ان لوڈ بیلنسنگ  
✅ **آٹو اسکیلنگ**: HTTP درخواستوں کی بنیاد پر ہر سروس کے لیے آزادانہ اسکیلنگ  
✅ **صحت کی نگرانی**: دونوں سروسز کے لیے لائیو نیس اور ریڈینیس پروبز  
✅ **تقسیم شدہ لاگنگ**: Application Insights کے ساتھ مرکزی لاگنگ  
✅ **اندرونی نیٹ ورکنگ**: محفوظ سروس سے سروس کی بات چیت  
✅ **کنٹینر آرکیسٹریشن**: خودکار تعیناتی اور اسکیلنگ  
✅ **زیرو ڈاؤن ٹائم اپڈیٹس**: ریویژن مینجمنٹ کے ساتھ رولنگ اپڈیٹس  

## ضروریات

### مطلوبہ ٹولز

شروع کرنے سے پہلے، تصدیق کریں کہ آپ کے پاس یہ ٹولز انسٹال ہیں:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (ورژن 1.0.0 یا اس سے زیادہ)
   ```bash
   azd version
   # متوقع نتیجہ: azd ورژن 1.0.0 یا اس سے زیادہ
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (ورژن 2.50.0 یا اس سے زیادہ)
   ```bash
   az --version
   # متوقع نتیجہ: azure-cli 2.50.0 یا اس سے زیادہ
   ```

3. **[Docker](https://www.docker.com/get-started)** (مقامی ترقی/جانچ کے لیے - اختیاری)
   ```bash
   docker --version
   # متوقع نتیجہ: ڈاکر ورژن 20.10 یا اس سے زیادہ
   ```

### Azure کی ضروریات

- ایک فعال **Azure سبسکرپشن** ([مفت اکاؤنٹ بنائیں](https://azure.microsoft.com/free/))
- آپ کی سبسکرپشن میں وسائل بنانے کی اجازتیں
- سبسکرپشن یا ریسورس گروپ پر **کنٹریبیوٹر** رول

### علم کی ضروریات

یہ ایک **اعلیٰ درجے کی** مثال ہے۔ آپ کو:
- [سادہ Flask API مثال](../../../../../examples/container-app/simple-flask-api) مکمل کرنی چاہیے
- مائیکرو سروسز آرکیٹیکچر کی بنیادی سمجھ ہونی چاہیے
- REST APIs اور HTTP سے واقفیت ہونی چاہیے
- کنٹینر کے تصورات کی سمجھ ہونی چاہیے

**کنٹینر ایپس کے لیے نئے ہیں؟** پہلے [سادہ Flask API مثال](../../../../../examples/container-app/simple-flask-api) سے شروع کریں تاکہ بنیادی باتیں سیکھ سکیں۔

## فوری آغاز (مرحلہ وار)

### مرحلہ 1: کلون کریں اور نیویگیٹ کریں

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ کامیابی کی تصدیق**: تصدیق کریں کہ آپ `azure.yaml` دیکھتے ہیں:
```bash
ls
# متوقع: README.md، azure.yaml، infra/، src/
```

### مرحلہ 2: Azure کے ساتھ تصدیق کریں

```bash
azd auth login
```

یہ آپ کے براؤزر کو Azure تصدیق کے لیے کھولتا ہے۔ اپنے Azure اسناد کے ساتھ سائن ان کریں۔

**✓ کامیابی کی تصدیق**: آپ کو یہ دیکھنا چاہیے:
```
Logged in to Azure.
```

### مرحلہ 3: ماحول کو ابتدائی بنائیں

```bash
azd init
```

**آپ کو نظر آنے والے پرامپٹس**:
- **ماحول کا نام**: ایک مختصر نام درج کریں (جیسے، `microservices-dev`)
- **Azure سبسکرپشن**: اپنی سبسکرپشن منتخب کریں
- **Azure مقام**: ایک علاقہ منتخب کریں (جیسے، `eastus`, `westeurope`)

**✓ کامیابی کی تصدیق**: آپ کو یہ دیکھنا چاہیے:
```
SUCCESS: New project initialized!
```

### مرحلہ 4: انفراسٹرکچر اور سروسز کو تعینات کریں

```bash
azd up
```

**کیا ہوتا ہے** (8-12 منٹ لگتے ہیں):
1. کنٹینر ایپس کا ماحول بناتا ہے
2. مانیٹرنگ کے لیے Application Insights بناتا ہے
3. API گیٹ وے کنٹینر (Node.js) بناتا ہے
4. پروڈکٹ سروس کنٹینر (Python) بناتا ہے
5. دونوں کنٹینرز کو Azure پر تعینات کرتا ہے
6. نیٹ ورکنگ اور صحت کی جانچ کو ترتیب دیتا ہے
7. مانیٹرنگ اور لاگنگ کو ترتیب دیتا ہے

**✓ کامیابی کی تصدیق**: آپ کو یہ دیکھنا چاہیے:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ وقت**: 8-12 منٹ

### مرحلہ 5: تعیناتی کی جانچ کریں

```bash
# گیٹ وے اینڈ پوائنٹ حاصل کریں
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# API گیٹ وے کی صحت کو جانچیں
curl $GATEWAY_URL/health

# متوقع نتیجہ:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**گیٹ وے کے ذریعے پروڈکٹ سروس کی جانچ کریں**:
```bash
# مصنوعات کی فہرست
curl $GATEWAY_URL/api/products

# متوقع نتیجہ:
# [
#   {"id":1,"name":"لیپ ٹاپ","price":999.99,"stock":50},
#   {"id":2,"name":"ماؤس","price":29.99,"stock":200},
#   {"id":3,"name":"کی بورڈ","price":79.99,"stock":150}
# ]
```

**✓ کامیابی کی تصدیق**: دونوں اینڈپوائنٹس JSON ڈیٹا کو بغیر کسی غلطی کے واپس کرتے ہیں۔

---

**🎉 مبارک ہو!** آپ نے Azure پر مائیکرو سروسز آرکیٹیکچر تعینات کر دیا ہے!

## پروجیکٹ کی ساخت

تمام نفاذی فائلیں شامل ہیں—یہ ایک مکمل، کام کرنے والی مثال ہے:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**ہر جزو کیا کرتا ہے:**

**انفراسٹرکچر (infra/)**:
- `main.bicep`: تمام Azure وسائل اور ان کے انحصار کو ترتیب دیتا ہے
- `core/container-apps-environment.bicep`: کنٹینر ایپس کا ماحول اور Azure کنٹینر رجسٹری بناتا ہے
- `core/monitor.bicep`: تقسیم شدہ لاگنگ کے لیے Application Insights ترتیب دیتا ہے
- `app/*.bicep`: انفرادی کنٹینر ایپ کی تعریفیں اسکیلنگ اور صحت کی جانچ کے ساتھ

**API گیٹ وے (src/api-gateway/)**:
- عوامی سامنا کرنے والی سروس جو درخواستوں کو بیک اینڈ سروسز کی طرف روٹ کرتی ہے
- لاگنگ، غلطی سے نمٹنے، اور درخواست فارورڈنگ کو نافذ کرتا ہے
- سروس سے سروس HTTP بات چیت کو ظاہر کرتا ہے

**پروڈکٹ سروس (src/product-service/)**:
- پروڈکٹ کیٹلاگ کے ساتھ اندرونی سروس (سادگی کے لیے ان میموری)
- صحت کی جانچ کے ساتھ REST API
- بیک اینڈ مائیکرو سروس پیٹرن کی مثال

## سروسز کا جائزہ

### API گیٹ وے (Node.js/Express)

**پورٹ**: 8080  
**رسائی**: عوامی (بیرونی انگریس)  
**مقصد**: آنے والی درخواستوں کو مناسب بیک اینڈ سروسز کی طرف روٹ کرتا ہے  

**اینڈپوائنٹس**:
- `GET /` - سروس کی معلومات
- `GET /health` - صحت کی جانچ کا اینڈپوائنٹ
- `GET /api/products` - پروڈکٹ سروس کی طرف فارورڈ کریں (سب کو لسٹ کریں)
- `GET /api/products/:id` - پروڈکٹ سروس کی طرف فارورڈ کریں (ID کے ذریعے حاصل کریں)

**اہم خصوصیات**:
- axios کے ساتھ درخواست روٹنگ
- مرکزی لاگنگ
- غلطی سے نمٹنے اور ٹائم آؤٹ مینجمنٹ
- ماحول کے متغیرات کے ذریعے سروس ڈسکوری
- Application Insights انضمام

**کوڈ کی جھلک** (`src/api-gateway/app.js`):
```javascript
// داخلی سروس مواصلات
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### پروڈکٹ سروس (Python/Flask)

**پورٹ**: 8000  
**رسائی**: صرف اندرونی (کوئی بیرونی انگریس نہیں)  
**مقصد**: پروڈکٹ کیٹلاگ کو ان میموری ڈیٹا کے ساتھ منظم کرتا ہے  

**اینڈپوائنٹس**:
- `GET /` - سروس کی معلومات
- `GET /health` - صحت کی جانچ کا اینڈپوائنٹ
- `GET /products` - تمام پروڈکٹس کی لسٹ کریں
- `GET /products/<id>` - ID کے ذریعے پروڈکٹ حاصل کریں

**اہم خصوصیات**:
- Flask کے ساتھ RESTful API
- ان میموری پروڈکٹ اسٹور (سادہ، کوئی ڈیٹا بیس کی ضرورت نہیں)
- صحت کی نگرانی کے ساتھ پروبز
- ساختی لاگنگ
- Application Insights انضمام

**ڈیٹا ماڈل**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**صرف اندرونی کیوں؟**
پروڈکٹ سروس عوامی طور پر ظاہر نہیں کی گئی ہے۔ تمام درخواستیں API گیٹ وے کے ذریعے جانی چاہئیں، جو فراہم کرتا ہے:
- سیکیورٹی: کنٹرول شدہ رسائی پوائنٹ
- لچک: کلائنٹس کو متاثر کیے بغیر بیک اینڈ کو تبدیل کر سکتے ہیں
- مانیٹرنگ: مرکزی درخواست لاگنگ

## سروس کمیونیکیشن کو سمجھنا

### سروسز ایک دوسرے سے کیسے بات کرتی ہیں

اس مثال میں، API گیٹ وے پروڈکٹ سروس کے ساتھ **اندرونی HTTP کالز** کے ذریعے بات چیت کرتا ہے:

```javascript
// API گیٹ وے (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// داخلی HTTP درخواست بنائیں
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**اہم نکات**:

1. **DNS پر مبنی دریافت**: کنٹینر ایپس خود بخود اندرونی سروسز کے لیے DNS فراہم کرتی ہیں
   - پروڈکٹ سروس FQDN: `product-service.internal.<environment>.azurecontainerapps.io`
   - سادہ طور پر: `http://product-service` (کنٹینر ایپس اسے حل کرتی ہیں)

2. **کوئی عوامی نمائش نہیں**: پروڈکٹ سروس میں `external: false` ہے Bicep میں
   - صرف کنٹینر ایپس کے ماحول کے اندر قابل رسائی
   - انٹرنیٹ سے نہیں پہنچا جا سکتا

3. **ماحول کے متغیرات**: سروس URLs تعیناتی کے وقت انجیکٹ کیے جاتے ہیں
   - Bicep اندرونی FQDN کو گیٹ وے پر منتقل کرتا ہے
   - ایپلیکیشن کوڈ میں کوئی ہارڈ کوڈڈ URLs نہیں

**تشبیہ**: اسے دفتر کے کمروں کی طرح سمجھیں۔ API گیٹ وے استقبالیہ ڈیسک ہے (عوامی سامنا)، اور پروڈکٹ سروس ایک دفتر کا کمرہ ہے (صرف اندرونی)۔ زائرین کو کسی بھی دفتر تک پہنچنے کے لیے استقبالیہ سے گزرنا ہوگا۔

## تعیناتی کے اختیارات

### مکمل تعیناتی (تجویز کردہ)

```bash
# انفراسٹرکچر اور دونوں سروسز کو تعینات کریں
azd up
```

یہ تعینات کرتا ہے:
1. کنٹینر ایپس کا ماحول
2. Application Insights
3. کنٹینر رجسٹری
4. API گیٹ وے کنٹینر
5. پروڈکٹ سروس کنٹینر

**وقت**: 8-12 منٹ

### انفرادی سروس تعینات کریں

```bash
# صرف ایک سروس تعینات کریں (ابتدائی azd up کے بعد)
azd deploy api-gateway

# یا پروڈکٹ سروس تعینات کریں
azd deploy product-service
```

**استعمال کا کیس**: جب آپ نے ایک سروس میں کوڈ کو اپ ڈیٹ کیا ہو اور صرف اس سروس کو دوبارہ تعینات کرنا چاہتے ہوں۔

### کنفیگریشن کو اپ ڈیٹ کریں

```bash
# پیمانے کے پیرامیٹرز تبدیل کریں
azd env set GATEWAY_MAX_REPLICAS 30

# نئی تشکیل کے ساتھ دوبارہ تعینات کریں
azd up
```

## کنفیگریشن

### اسکیلنگ کنفیگریشن

دونوں سروسز کو ان کے Bicep فائلز میں HTTP پر مبنی آٹو اسکیلنگ کے ساتھ ترتیب دیا گیا ہے:

**API گیٹ وے**:
- کم از کم نقلیں: 2 (ہمیشہ کم از کم 2 دستیابی کے لیے)
- زیادہ سے زیادہ نقلیں: 20
- اسکیل ٹریگر: ہر نقل پر 50 متوازی درخواستیں

**پروڈکٹ سروس**:
- کم از کم نقلیں: 1 (ضرورت پڑنے پر صفر تک اسکیل کر سکتی ہے)
- زیادہ سے زیادہ نقلیں: 10
- اسکیل ٹریگر: ہر نقل پر 100 متوازی درخواستیں

**اسکیلنگ کو حسب ضرورت بنائیں** (`infra/app/*.bicep` میں):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### وسائل کی تقسیم

**API گیٹ وے**:
- CPU: 1.0 vCPU
- میموری: 2 GiB
- وجہ: تمام بیرونی ٹریفک کو ہینڈل کرتا ہے

**پروڈکٹ سروس**:
- CPU: 0.5 vCPU
- میموری: 1 GiB
- وجہ: ہلکی پھلکی ان میموری آپریشنز

### صحت کی جانچ

دونوں سروسز میں لائیو نیس اور ریڈینیس پروبز شامل ہیں:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**اس کا مطلب کیا ہے**:
- **لائیو نیس**: اگر صحت کی جانچ ناکام ہو جائے تو کنٹینر ایپس کنٹینر کو دوبارہ شروع کرتی ہیں
- **ریڈینیس**: اگر تیار نہ ہو تو کنٹینر ایپس اس نقل پر ٹریفک کو روکتی ہیں

## مانیٹرنگ اور مشاہدہ

### سروس لاگز دیکھیں

```bash
# API گیٹ وے سے لاگز کو اسٹریم کریں
azd logs api-gateway --follow

# حالیہ پروڈکٹ سروس لاگز دیکھیں
azd logs product-service --tail 100

# دونوں سروسز کے تمام لاگز دیکھیں
azd logs --follow
```

**متوقع آؤٹ پٹ**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Application Insights کے سوالات

Azure پورٹل میں Application Insights تک رسائی حاصل کریں، پھر یہ سوالات چلائیں:

**سست درخواستیں تلاش کریں**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**سروس سے سروس کالز کو ٹریک کریں**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**سروس کے ذریعے غلطی کی شرح**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**وقت کے ساتھ درخواست کا حجم**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### مانیٹرنگ ڈیش بورڈ تک رسائی حاصل کریں

```bash
# ایپلیکیشن انسائٹس کی تفصیلات حاصل کریں
azd env get-values | grep APPLICATIONINSIGHTS

# ایزور پورٹل مانیٹرنگ کھولیں
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### لائیو میٹرکس

1. Azure پورٹل میں Application Insights پر جائیں
2. "لائیو میٹرکس" پر کلک کریں
3. حقیقی وقت کی درخواستیں، ناکامیاں، اور کارکردگی دیکھیں
4. ٹیسٹ کریں: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products` چلائیں

## عملی مشقیں

[نوٹ: "عملی مشقیں" سیکشن میں مکمل مرحلہ وار مشقیں دیکھیں جن میں تعیناتی کی تصدیق، ڈیٹا میں ترمیم، آٹو اسکیلنگ ٹیسٹ، غلطی سے نمٹنے، اور تیسری سروس شامل کرنا شامل ہیں۔]

## لاگت کا تجزیہ

### تخمینی ماہانہ لاگتیں (اس 2-سروس مثال کے لیے)

| وسائل | کنفیگریشن | تخمینی لاگت |
|----------|--------------|----------------|
| API گیٹ وے | 2-20 نقلیں، 1 vCPU، 2GB RAM | $30-150 |
| پروڈکٹ سروس | 1-10 نقلیں، 0.5 vCPU، 1GB RAM | $15-75 |
| کنٹینر رجسٹری | بنیادی درجے | $5 |
| Application Insights | 1-2 GB/ماہ | $5-10 |
| لاگ اینالیٹکس | 1 GB/ماہ | $3 |
| **کل** |
آزمائش اور سیکھنے کے لیے غور کریں:
- Azure کے مفت کریڈٹس استعمال کریں (پہلے 30 دن)
- کم سے کم replicas رکھیں
- آزمائش کے بعد حذف کریں (کوئی جاری چارجز نہ ہوں)

---

## صفائی

جاری چارجز سے بچنے کے لیے تمام وسائل حذف کریں:

```bash
azd down --force --purge
```

**تصدیقی پرامپٹ**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

تصدیق کے لیے `y` ٹائپ کریں۔

**کیا حذف ہوگا**:
- Container Apps Environment
- دونوں Container Apps (gateway اور product service)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ صفائی کی تصدیق کریں**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

خالی واپس آنا چاہیے۔

---

## توسیعی رہنما: 2 سے 5+ سروسز تک

جب آپ اس 2-سروس آرکیٹیکچر کو سمجھ لیں، تو اسے بڑھانے کا طریقہ یہاں ہے:

### مرحلہ 1: ڈیٹا بیس پرسیسٹنس شامل کریں (اگلا قدم)

**Product Service کے لیے Cosmos DB شامل کریں**:

1. `infra/core/cosmos.bicep` بنائیں:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Product Service کو اپ ڈیٹ کریں تاکہ وہ in-memory ڈیٹا کے بجائے Cosmos DB استعمال کرے

3. تخمینی اضافی لاگت: ~$25/ماہ (serverless)

### مرحلہ 2: تیسری سروس شامل کریں (Order Management)

**Order Service بنائیں**:

1. نیا فولڈر: `src/order-service/` (Python/Node.js/C#)
2. نیا Bicep: `infra/app/order-service.bicep`
3. API Gateway کو `/api/orders` کے لیے route اپ ڈیٹ کریں
4. Order persistence کے لیے Azure SQL Database شامل کریں

**آرکیٹیکچر بن جائے گا**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### مرحلہ 3: Async Communication شامل کریں (Service Bus)

**Event-Driven Architecture نافذ کریں**:

1. Azure Service Bus شامل کریں: `infra/core/servicebus.bicep`
2. Product Service "ProductCreated" ایونٹس شائع کرے
3. Order Service پروڈکٹ ایونٹس کو سبسکرائب کرے
4. Notification Service شامل کریں تاکہ ایونٹس کو پراسیس کرے

**پیٹرن**: Request/Response (HTTP) + Event-Driven (Service Bus)

### مرحلہ 4: یوزر آتھینٹیکیشن شامل کریں

**User Service نافذ کریں**:

1. `src/user-service/` بنائیں (Go/Node.js)
2. Azure AD B2C یا custom JWT authentication شامل کریں
3. API Gateway ٹوکنز کی تصدیق کرے
4. سروسز یوزر پرمیشنز چیک کریں

### مرحلہ 5: پروڈکشن تیاری

**یہ اجزاء شامل کریں**:
- Azure Front Door (global load balancing)
- Azure Key Vault (secret management)
- Azure Monitor Workbooks (custom dashboards)
- CI/CD Pipeline (GitHub Actions)
- Blue-Green Deployments
- Managed Identity تمام سروسز کے لیے

**مکمل پروڈکشن آرکیٹیکچر کی لاگت**: ~$300-1,400/ماہ

---

## مزید سیکھیں

### متعلقہ دستاویزات
- [Azure Container Apps Documentation](https://learn.microsoft.com/azure/container-apps/)
- [Microservices Architecture Guide](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights for Distributed Tracing](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### اس کورس میں اگلے مراحل
- ← پچھلا: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - ابتدائی سنگل کنٹینر مثال
- → اگلا: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - AI صلاحیتیں شامل کریں
- 🏠 [Course Home](../../README.md)

### موازنہ: کب کیا استعمال کریں

**سنگل کنٹینر ایپ** (Simple Flask API مثال):
- ✅ سادہ ایپلیکیشنز
- ✅ Monolithic آرکیٹیکچر
- ✅ جلدی ڈیپلائے کرنے کے لیے
- ❌ محدود scalability
- **لاگت**: ~$15-50/ماہ

**Microservices** (یہ مثال):
- ✅ پیچیدہ ایپلیکیشنز
- ✅ ہر سروس کے لیے آزادانہ scalability
- ✅ ٹیم کی خود مختاری (مختلف سروسز، مختلف ٹیمیں)
- ❌ انتظام کرنے میں زیادہ پیچیدگی
- **لاگت**: ~$60-250/ماہ

**Kubernetes (AKS)**:
- ✅ زیادہ سے زیادہ کنٹرول اور لچک
- ✅ Multi-cloud portability
- ✅ ایڈوانس نیٹ ورکنگ
- ❌ Kubernetes کی مہارت درکار ہے
- **لاگت**: ~$150-500/ماہ کم از کم

**تجویز**: Container Apps سے شروع کریں (یہ مثال)، AKS پر صرف اس وقت جائیں جب آپ کو Kubernetes-specific فیچرز کی ضرورت ہو۔

---

## اکثر پوچھے گئے سوالات

**سوال: صرف 2 سروسز کیوں، 5+ کیوں نہیں؟**  
جواب: تعلیمی ترقی۔ بنیادی اصولوں (سروس کمیونیکیشن، مانیٹرنگ، اسکیلنگ) کو سادہ مثال کے ساتھ سمجھیں، پھر پیچیدگی شامل کریں۔ یہاں سیکھے گئے پیٹرنز 100-سروس آرکیٹیکچرز پر بھی لاگو ہوتے ہیں۔

**سوال: کیا میں خود مزید سروسز شامل کر سکتا ہوں؟**  
جواب: بالکل! اوپر دی گئی توسیعی رہنما کی پیروی کریں۔ ہر نئی سروس کا ایک ہی پیٹرن ہے: src فولڈر بنائیں، Bicep فائل بنائیں، azure.yaml اپ ڈیٹ کریں، ڈیپلائے کریں۔

**سوال: کیا یہ پروڈکشن کے لیے تیار ہے؟**  
جواب: یہ ایک مضبوط بنیاد ہے۔ پروڈکشن کے لیے شامل کریں: managed identity، Key Vault، persistent databases، CI/CD pipeline، monitoring alerts، اور backup strategy۔

**سوال: Dapr یا دیگر service mesh کیوں نہیں استعمال کیا؟**  
جواب: سیکھنے کے لیے سادہ رکھیں۔ جب آپ native Container Apps networking کو سمجھ لیں، تو advanced scenarios کے لیے Dapr شامل کر سکتے ہیں۔

**سوال: میں لوکل طور پر کیسے debug کروں؟**  
جواب: Docker کے ساتھ سروسز لوکل طور پر چلائیں:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**سوال: کیا میں مختلف پروگرامنگ زبانیں استعمال کر سکتا ہوں؟**  
جواب: جی ہاں! یہ مثال Node.js (gateway) + Python (product service) دکھاتی ہے۔ آپ کسی بھی زبان کو مکس کر سکتے ہیں جو کنٹینرز میں چلتی ہو۔

**سوال: اگر میرے پاس Azure کریڈٹس نہ ہوں تو؟**  
جواب: Azure کا مفت ٹائر استعمال کریں (پہلے 30 دن نئے اکاؤنٹس کے ساتھ) یا مختصر آزمائشی مدت کے لیے ڈیپلائے کریں اور فوراً حذف کریں۔

---

> **🎓 سیکھنے کا خلاصہ**: آپ نے ایک multi-service آرکیٹیکچر کو ڈیپلائے کرنا سیکھا جس میں automatic scaling، internal networking، centralized monitoring، اور production-ready پیٹرنز شامل ہیں۔ یہ بنیاد آپ کو پیچیدہ distributed systems اور enterprise microservices آرکیٹیکچرز کے لیے تیار کرتی ہے۔

**📚 کورس نیویگیشن**:
- ← پچھلا: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → اگلا: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Course Home](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**اعلانِ لاتعلقی**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کا استعمال کرتے ہوئے ترجمہ کی گئی ہے۔ ہم درستگی کے لیے کوشش کرتے ہیں، لیکن براہ کرم آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز کو اس کی اصل زبان میں مستند ذریعہ سمجھا جانا چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے لیے ہم ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->