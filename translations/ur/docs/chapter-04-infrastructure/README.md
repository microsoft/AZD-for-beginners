# باب 4: انفراسٹرکچر بطور کوڈ اور تعیناتی

**📚 کورس**: [AZD برائے مبتدی](../../README.md) | **⏱️ دورانیہ**: 2-3 گھنٹے پڑھائی؛ تعیناتی کی مشقوں کے لیے اضافی وقت دیں | **⭐ پیچیدگی**: درمیانہ

---

## جائزہ

یہ باب انفراسٹرکچر بطور کوڈ (IaC) کے پیٹرنز، بائسک ٹیمپلیٹس، ریسورس کی فراہمی، اور ایزور ڈیولپر CLI کے ذریعے تعیناتی کی حکمت عملیوں کا احاطہ کرتا ہے۔

> کمانڈ اور کنفیگریشن کا جائزہ ہدف: `azd 1.37.2` (نومبر 2026)۔ جائزے کے دوران لائیو ایزور فراہمی نہیں چلا ئی گئی۔

## سیکھنے کے مقاصد

اس باب کو مکمل کرنے کے بعد آپ:
- بائسک ٹیمپلیٹ کی ساخت اور نحو کو سمجھیں گے
- `azd provision` کے ساتھ ایزور ریسورسز فراہم کریں گے
- `azd deploy` کے ساتھ ایپلیکیشنز تعینات کریں گے
- بلیو-گرین اور رولنگ تعیناتی کی حکمت عملیاں نافذ کریں گے

---

## 📚 اسباق

| # | سبق | وضاحت | وقت |
|---|--------|-------------|------|
| 1 | [ریسورسز کی فراہمی](provisioning.md) | AZD کے ساتھ ایزور ریسورس مینجمنٹ | 45 منٹ |
| 2 | [تعیناتی کا رہنما](deployment-guide.md) | ایپلیکیشن تعیناتی کی حکمت عملیاں | 45 منٹ |
| 3 | [اپنا ٹیمپلیٹ تیار کرنا](custom-templates.md) | ازڈ کے قابل استعمال ٹیمپلیٹس بنائیں اور شائع کریں | 30 منٹ |

---

## 🚀 تیز آغاز

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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

## 🔧 بنیادی کمانڈز

| کمانڈ | وضاحت |
|---------|-------------|
| `azd init` | پروجیکٹ کی ابتدائی تشکیل |
| `azd provision` | ایزور ریسورسز بنائیں |
| `azd deploy` | ایپلیکیشن کوڈ تعینات کریں |
| `azd up` | فراہمی + تعیناتی |
| `azd down` | تمام ریسورسز حذف کریں |

---

## 🔗 نیوی گیشن

| سمت | باب |
|-----------|---------|
| **پچھلا** | [باب 3: کنفیگریشن](../chapter-03-configuration/README.md) |
| **اگلا** | [باب 5: ملٹی ایجنٹ حل](../chapter-05-multi-agent/README.md) |

---

## 📖 متعلقہ وسائل

- [پہلے سے تعیناتی چیکز](../chapter-06-pre-deployment/README.md)
- [کنٹینر ایپ کی مثالیں](../../examples/container-app/README.md)
- [ڈیٹا بیس ایپ کی مثال](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->