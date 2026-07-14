# باب 7: مسائل کا حل اور نقائص کی جانچ

**📚 کورس**: [AZD برائے ابتدائی] (../../README.md) | **⏱️ دورانیہ**: 1-1.5 گھنٹے | **⭐ پیچیدگی**: درمیانہ

---

## جائزہ

یہ باب آپ کو Azure Developer CLI کے ساتھ کام کرتے ہوئے عام مسائل کی تشخیص اور حل میں مدد دیتا ہے۔ تعیناتی کی ناکامیوں سے لے کر AI مخصوص مسائل تک۔

> جولائی 2026 میں `azd 1.27.1` کے خلاف تصدیق شدہ۔

## سیکھنے کے مقاصد

اس باب کو مکمل کرکے، آپ:
- عام AZD تعیناتی کی ناکامیوں کی تشخیص کریں گے
- توثیق اور اجازت کے مسائل کی جانچ کریں گے
- AI سروس کنیکٹیویٹی کے مسائل کو حل کریں گے
- مسائل کے حل کے لیے Azure پورٹل اور CLI استعمال کریں گے

---

## 📚 اسباق

| # | سبق | وضاحت | وقت |
|---|--------|-------------|------|
| 1 | [عام مسائل](common-issues.md) | کثرت سے پیش آنے والے مسائل | 30 منٹ |
| 2 | [نقصان دہی کا رہنما](debugging.md) | مرحلہ وار نقائص کی جانچ کی حکمت عملی | 45 منٹ |
| 3 | [AI مسائل کا حل](ai-troubleshooting.md) | AI مخصوص مسائل | 30 منٹ |

---

## 🚨 فوری حل

### توثیقی مسائل
```bash
# AZD ورک فلو کے لیے ضروری
azd auth login

# اگر آپ Azure CLI کے احکامات براہ راست استعمال کر رہے ہیں تو یہ اختیاری ہے
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

### مختص حد سے تجاوز
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 خرابی کوڈ حوالہ

| خرابی | وجہ | حل |
|-------|-------|----------|
| `AuthenticationError` | لاگ ان نہیں ہوا | `azd auth login` |
| `ResourceNotFound` | وسائل موجود نہیں | وسائل کے نام چیک کریں |
| `QuotaExceeded` | سبسکرپشن کی حدیں | کوٹہ بڑھانے کی درخواست کریں |
| `InvalidTemplate` | بائیسپ سینتیکس کی خرابی | `az bicep build` |
| `Conflict` | وسائل پہلے سے موجود | نیا نام استعمال کریں یا حذف کریں |
| `Forbidden` | اجازت نامہ ناکافی | RBAC کردار چیک کریں |

---

## 🔄 ری سیٹ اور بازیابی

```bash
# نرم ری سیٹ (وسائل برقرار رکھیں، کوڈ دوبارہ تعینات کریں)
azd deploy --force

# سخت ری سیٹ (سب کچھ حذف کریں، تازہ آغاز کریں)
azd down --force --purge
azd up
```

---

## 🔗 نیویگیشن

| سمت | باب |
|-----------|---------|
| **پچھلا** | [باب 6: پیش از تعیناتی](../chapter-06-pre-deployment/README.md) |
| **اگلا** | [باب 8: پیداوار](../chapter-08-production/README.md) |

---

## 📖 متعلقہ وسائل

- [پیش از تعیناتی کے چیک](../chapter-06-pre-deployment/preflight-checks.md)
- [تشکیل کا رہنما](../chapter-03-configuration/configuration.md)
- [AZD گیٹ ہب مسائل](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->