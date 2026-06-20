# باب 7: مسائل کا حل اور ڈیبگنگ

**📚 کورس**: [AZD برائے مبتدیان](../../README.md) | **⏱️ دورانیہ**: 1-1.5 گھنٹے | **⭐ پیچیدگی**: متوسط

---

## جائزہ

یہ باب آپ کو Azure Developer CLI کے ساتھ کام کرتے ہوئے عام مسائل کی تشخیص اور حل کرنے میں مدد دیتا ہے۔ تعیناتی کی ناکامیوں سے لے کر AI مخصوص مسائل تک۔

> جون 2026 میں `azd 1.25.6` کے خلاف تصدیق شدہ۔

## سیکھنے کے مقاصد

اس باب کو مکمل کرنے کے بعد، آپ:
- عام AZD تعیناتی کی ناکامیوں کی تشخیص کریں گے
- تصدیق اور اجازت سے متعلق مسائل کو ڈیبگ کریں گے
- AI سروس کنیکٹویٹی کے مسائل حل کریں گے
- مسئلہ حل کرنے کے لیے Azure پورٹل اور CLI استعمال کریں گے

---

## 📚 اسباق

| # | سبق | تفصیل | وقت |
|---|-----|---------|-----|
| 1 | [عام مسائل](common-issues.md) | اکثر پیش آنے والے مسائل | 30 منٹ |
| 2 | [ڈیبگنگ گائیڈ](debugging.md) | مرحلہ وار ڈیبگنگ کی حکمت عملی | 45 منٹ |
| 3 | [AI مسائل کا حل](ai-troubleshooting.md) | AI مخصوص مسائل | 30 منٹ |

---

## 🚨 جلدی حل

### تصدیق کے مسائل
```bash
# AZD کے ورک فلو کے لیے ضروری
azd auth login

# اگر آپ براہ راست Azure CLI کمانڈز بھی استعمال کر رہے ہیں تو اختیاری
az login

azd auth status
```

### پروویژننگ کی ناکامیاں
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### وسائل کے تصادم
```bash
azd down --force --purge
azd env new different-name
azd up
```

### کوٹہ سے تجاوز
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 ایرر کوڈ حوالہ

| ایرر | سبب | حل |
|-------|-------|---------|
| `AuthenticationError` | لاگ ان نہیں کیا گیا | `azd auth login` |
| `ResourceNotFound` | وسائل غائب ہے | وسائل کے نام چیک کریں |
| `QuotaExceeded` | سبسکرپشن کی حدیں | کوٹہ بڑھانے کی درخواست کریں |
| `InvalidTemplate` | بائسیکپ سینٹیکس کی خرابی | `az bicep build` |
| `Conflict` | وسیلہ موجود ہے | نیا نام استعمال کریں یا حذف کریں |
| `Forbidden` | اجازت نامہ ناکافی | RBAC رولز چیک کریں |

---

## 🔄 ری سیٹ اور بحالی

```bash
# سوفٹ ری سیٹ (وسائل رکھیں، کوڈ دوبارہ تعینات کریں)
azd deploy --force

# ہارڈ ری سیٹ (سب کچھ حذف کریں، نیا آغاز کریں)
azd down --force --purge
azd up
```

---

## 🔗 نیویگیشن

| سمت | باب |
|-------|------|
| **پچھلا** | [باب 6: پری-ڈیپلائمنٹ](../chapter-06-pre-deployment/README.md) |
| **اگلا** | [باب 8: پیداوار](../chapter-08-production/README.md) |

---

## 📖 متعلقہ وسائل

- [پری-ڈیپلائمنٹ چیکس](../chapter-06-pre-deployment/preflight-checks.md)
- [تشکیلاتی رہنمائی](../chapter-03-configuration/configuration.md)
- [AZD گٹ ہب ایشوز](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->