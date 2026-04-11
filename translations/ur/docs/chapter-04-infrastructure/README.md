# باب 4: انفراسٹرکچر ایز کوڈ اور ڈیپلائمنٹ

**📚 کورس**: [AZD شروع کرنے والوں کے لیے](../../README.md) | **⏱️ دورانیہ**: 1-1.5 گھنٹے | **⭐ پیچیدگی**: درمیانہ

---

## جائزہ

یہ باب Bicep ٹیمپلیٹس کے ساتھ Infrastructure as Code (IaC) کے نمونے، وسائل کی فراہمی، اور Azure Developer CLI کے ذریعے تعیناتی کی حکمت عملیوں کا احاطہ کرتا ہے۔

> مارچ 2026 میں `azd 1.23.12` کے خلاف تصدیق شدہ۔

## سیکھنے کے مقاصد

اس باب کو مکمل کرنے سے آپ:
- Bicep ٹیمپلیٹ کی ساخت اور نحو کو سمجھیں گے
- `azd provision` کے ساتھ Azure وسائل فراہم کریں گے
- `azd deploy` کے ساتھ ایپلیکیشنز کو ڈیپلائے کریں گے
- نیلی-سبز اور رولنگ تعیناتی کی حکمت عملیاں نافذ کریں گے

---

## 📚 اسباق

| # | سبق | تفصیل | وقت |
|---|--------|-------------|------|
| 1 | [وسائل کی فراہمی](provisioning.md) | AZD کے ساتھ Azure وسائل کا انتظام | 45 منٹ |
| 2 | [تعیناتی گائیڈ](deployment-guide.md) | ایپلیکیشن تعیناتی کی حکمت عملی | 45 منٹ |

---

## 🚀 فوری آغاز

```bash
# سانچے سے آغاز کریں
azd init --template azure-functions-python-v2-http

# وہ دیکھیں جو بنایا جائے گا
azd provision --preview

# صرف بنیادی ڈھانچہ مہیا کریں
azd provision

# صرف کوڈ تعینات کریں
azd deploy

# یا دونوں اکٹھے
azd up
```

---

## 📁 AZD پروجیکٹ کی ساخت

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 ضروری کمانڈز

| کمانڈ | تفصیل |
|---------|-------------|
| `azd init` | پروجیکٹ کو شروع کریں |
| `azd provision` | Azure وسائل بنائیں |
| `azd deploy` | ایپلیکیشن کوڈ کو تعینات کریں |
| `azd up` | فراہمی + تعیناتی |
| `azd down` | تمام وسائل کو حذف کریں |

---

## 🔗 نیویگیشن

| سمت | باب |
|-----------|---------|
| **پچھلا** | [باب 3: ترتیب](../chapter-03-configuration/README.md) |
| **اگلا** | [باب 5: ملٹی ایجنٹ حل](../chapter-05-multi-agent/README.md) |

---

## 📖 متعلقہ وسائل

- [پری-تعیناتی چیکس](../chapter-06-pre-deployment/README.md)
- [کنٹینر ایپ کی مثالیں](../../examples/container-app/README.md)
- [ڈیٹا بیس ایپ کی مثال](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دستخطی معافی**:  
اس دستاویز کا ترجمہ AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے کیا گیا ہے۔ اگرچہ ہم درستگی کے لئے کوشاں ہیں، براہ کرم یاد رکھیں کہ خودکار تراجم میں غلطیاں یا بے ضابطگیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں ہی معتبر ذریعہ تصور کی جانی چاہئے۔ اہم معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم پر نہیں ہوگی۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->