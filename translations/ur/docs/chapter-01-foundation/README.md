# باب 1: بنیاد اور جلدی آغاز

**📚 کورس**: [AZD برائے مبتدی](../../README.md) | **⏱️ مدت**: 75-120 منٹ، پہلا تعیناتی شامل؛ اضافی مشقیں زیادہ وقت لیتی ہیں | **⭐ مشکل**: مبتدی

---

## جائزہ

یہ باب Azure Developer CLI (azd) کے بنیادی اصول متعارف کراتا ہے۔ آپ بنیادی تصورات سیکھیں گے، آلات انسٹال کریں گے، اور اپنا پہلا ایپلیکیشن Azure پر تعینات کریں گے۔

> کمانڈ اور کنفیگریشن کا جائزہ ہدف: `azd 1.37.2` (نومبر 2026). جائزے کے دوران لائیو Azure پروویژننگ نہیں چلائی گئی۔

## تعلیمی مقاصد

اس باب کو مکمل کرکے، آپ:
- سمجھیں گے کہ Azure Developer CLI کیا ہے اور یہ Azure CLI سے کیسے مختلف ہے
- اپنے پلیٹ فارم پر AZD انسٹال اور کنفیگر کریں گے
- اپنے پہلے ایپلیکیشن کو Azure پر `azd up` کے ذریعے تعینات کریں گے
- وسائل کو `azd down` کے ذریعے صاف کریں گے

---

## 📚 اسباق

| # | سبق | تفصیل | وقت |
|---|--------|-------------|------|
| 1 | [AZD بنیادی اصول](azd-basics.md) | بنیادی تصورات، اصطلاحات، اور پراجیکٹ کی ساخت | 15 منٹ |
| 2 | [انسٹالیشن اور سیٹ اپ](installation.md) | مخصوص پلیٹ فارم کے انسٹالیشن گائیڈ | 10 منٹ |
| 3 | [آپ کا پہلا پراجیکٹ](first-project.md) | عمل میں: Azure پر ویب ایپ کی تعیناتی | 20 منٹ |
| 4 | [اپنی ایپ لائیں](bring-your-own-app.md) | پہلے سے موجود پراجیکٹ میں azd شامل کریں | 15 منٹ |
| 5 | [ڈیولپمنٹ کنٹینرز اور کوڈسپیسز](dev-containers.md) | ڈیولپمنٹ کنٹینرز کے ساتھ قابل تولید azd ماحول | 15 منٹ |

---

## ✅ یہاں سے شروع کریں: اپنی ترتیب کی تصدیق کریں

شروع کرنے سے پہلے، یقینی بنائیں کہ آپ کا مقامی کمپیوٹر باب 1 کے ٹیمپلیٹ کے لیے تیار ہے:

**ونڈوز:**
```powershell
.\validate-setup.ps1
```

**macOS / لینکس:**
```bash
bash ./validate-setup.sh
```

اگر اسکرپٹ میں کوئی آلات غائب دکھائے، تو پہلے انہیں درست کریں پھر باب کے ساتھ جاری رکھیں۔

---

## 🚀 جلدی آغاز

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ کامیابی کے معیار

اس باب کو مکمل کرنے کے بعد، آپ کر سکیں گے:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 نیویگیشن

| سمت | باب |
|-----------|---------|
| **اگلا** | [باب 2: AI-فرسٹ ڈیولپمنٹ](../chapter-02-ai-development/README.md) |
| **چھلانگ لگائیں** | [باب 3: کنفیگریشن](../chapter-03-configuration/README.md) |

---

## 📖 متعلقہ وسائل

- [کمانڈ چیٹ شیٹ](../../resources/cheat-sheet.md)
- [عمومی سوالات](../../resources/faq.md)
- [اصطلاحات](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->