# باب 7: مسئلہ حل کرنا اور ڈیبگنگ

**📚 کورس**: [AZD مبتدیوں کے لیے](../../README.md) | **⏱️ دورانیہ**: 1-1.5 گھنٹے | **⭐ پیچیدگی**: وسطی درجے کی

---

## جائزہ

یہ باب Azure Developer CLI کے ساتھ کام کرتے وقت عمومی مسائل کی تشخیص اور حل میں مدد کرتا ہے۔ تعیناتی کی ناکامیوں سے لے کر AI مخصوص مسائل تک۔

> کمانڈ کی رہنمائی جاری کردہ `azd 1.37.2` حوالہ کے خلاف جائزہ لی گئی۔ کلاؤڈ کی تعیناتیاں انجام نہیں دی گئیں۔ کمانڈز استعمال کرنے سے پہلے مثالی وسائل کے نام اور شناختی نمبروں کو تبدیل کریں۔

## سیکھنے کے مقاصد

اس باب کو مکمل کرکے، آپ کو حاصل ہوگا:
- عمومی AZD تعیناتی کی ناکامیوں کی تشخیص
- توثیق اور اجازت کے مسائل کو ڈیبگ کرنا
- AI سروس کی کنیکٹیویٹی کے مسائل کو حل کرنا
- مسئلہ حل کرنے کے لیے Azure پورٹل اور CLI کا استعمال

---

## 📚 اسباق

| # | سبق | تفصیل | وقت |
|---|--------|-------------|------|
| 1 | [عام مسائل](common-issues.md) | اکثر پیش آنے والے مسائل | 30 منٹ |
| 2 | [ڈیبگنگ گائیڈ](debugging.md) | مرحلہ وار ڈیبگنگ کی حکمت عملی | 45 منٹ |
| 3 | [AI مسئلہ حل کرنا](ai-troubleshooting.md) | AI مخصوص مسائل | 30 منٹ |

---

## 🚨 فوری اصلاحات

### توثیقی مسائل
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### فراہمی کی ناکامیاں
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### وسائل کے تضادات
پہلے موجودہ وسائل اور تعیناتی کی غلطیوں کا معائنہ کریں۔ نام کے تصادم کو حل کرنے کے لیے مشترکہ یا پیداوار کے ماحول کو حذف نہ کریں۔ نئے **قابل تلف ماحول** کے لیے منفرد نام استعمال کریں:

```bash
azd env new different-name
azd up
```

### کوٹا زیادہ ہو جانا
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

`AZURE_LOCATION` کو تبدیل کرنا موجودہ وسائل کو منتقل نہیں کرتا اور دوبارہ تعیناتی پر مقام کے تصادمات پیدا کرسکتا ہے۔

---

## 📋 ایرر کوڈ حوالہ

| ایرر | سبب | حل |
|-------|-------|----------|
| `AuthenticationError` | لاگ ان نہیں ہوئے | `azd auth login` |
| `ResourceNotFound` | وسائل غائب ہے | وسائل کے نام چیک کریں |
| `QuotaExceeded` | سبسکرپشن کی حد | کوٹا بڑھانے کی درخواست کریں |
| `InvalidTemplate` | بائسپس نحوی خرابی | `az bicep build` |
| `Conflict` | وسائل موجود ہے | نیا نام استعمال کریں یا حذف کریں |
| `Forbidden` | اجازت نامے ناکافی ہیں | RBAC رولز چیک کریں |

---

## 🔄 ری سیٹ اور بازیابی

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

ہارڈ ری سیٹ ڈیٹا کو حذف کرتا ہے اور ممکن ہے اینڈ پوائنٹس کو تبدیل کرے۔ پہلے بیک اپ لیں اور انٹریکٹو حذف کرنے کے پرامپٹس کا جائزہ لیں۔ `--force --purge` صرف قابل تلف ماحول کے لیے مناسب ہے جب ناقابل واپسی حذف کرنے کا ارادہ ہو۔

---

## 🔗 نیویگیشن

| سمت | باب |
|-----------|---------|
| **پچھلا** | [باب 6: پری-ڈپلائمنٹ](../chapter-06-pre-deployment/README.md) |
| **اگلا** | [باب 8: پیداوار](../chapter-08-production/README.md) |

---

## 📖 متعلقہ وسائل

- [پری-ڈپلائمنٹ چیکس](../chapter-06-pre-deployment/preflight-checks.md)
- [تشکیلی رہنمائی](../chapter-03-configuration/configuration.md)
- [AZD GitHub مسائل](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->