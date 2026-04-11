# باب 7: خرابی دور کرنے اور ڈیبگنگ

**📚 کورس**: [ابتدائیوں کے لیے AZD](../../README.md) | **⏱️ دورانیہ**: 1-1.5 گھنٹے | **⭐ پیچیدگی**: متوسط

---

## جائزہ

یہ باب آپ کو Azure Developer CLI کے ساتھ کام کرتے وقت عام مسائل کی تشخیص اور حل کرنے میں مدد دیتا ہے۔ تعیناتی کی ناکامیوں سے لے کر AI مخصوص مسائل تک۔

> مارچ 2026 میں `azd 1.23.12` کے خلاف تصدیق شدہ۔

## تعلیمی مقاصد

اس باب کو مکمل کرنے کے بعد، آپ:
- عام AZD تعیناتی کی ناکامیوں کی تشخیص کر سکیں گے
- تصدیقی اور اجازت کے مسائل کا ڈیبگنگ کر سکیں گے
- AI سروس کنیکٹیویٹی کے مسائل کو حل کر سکیں گے
- Azure پورٹل اور CLI کو خرابی دور کرنے کے لیے استعمال کر سکیں گے

---

## 📚 اسباق

| # | سبق | وضاحت | وقت |
|---|--------|-------------|------|
| 1 | [عام مسائل](common-issues.md) | اکثر پیش آنے والے مسائل | 30 منٹس |
| 2 | [ڈیبگنگ گائیڈ](debugging.md) | مرحلہ وار ڈیبگنگ حکمت عملی | 45 منٹس |
| 3 | [AI خرابی دور کرنا](ai-troubleshooting.md) | AI مخصوص مسائل | 30 منٹس |

---

## 🚨 تیز حل

### تصدیقی مسائل  
```bash
# AZD ورک فلو کے لیے ضروری
azd auth login

# اگر آپ Azure CLI کمانڈز براہِ راست بھی استعمال کر رہے ہیں تو اختیاری
az login

azd auth status
```
  
### پروویژننگ کی ناکامیاں  
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```
  
### وسائل کے تنازعات  
```bash
azd down --force --purge
azd env new different-name
azd up
```
  
### کوٹا کی حد سے تجاوز  
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```
  
---

## 📋 ایرر کوڈ حوالہ

| ایرر | وجہ | حل |
|-------|-------|----------|
| `AuthenticationError` | لاگ ان نہیں | `azd auth login` |
| `ResourceNotFound` | وسائل موجود نہیں | وسائل کے نام چیک کریں |
| `QuotaExceeded` | سبسکرپشن کی حدیں | کوٹا میں اضافہ کی درخواست کریں |
| `InvalidTemplate` | بائسک کا سینٹیکس ایرر | `az bicep build` |
| `Conflict` | وسائل پہلے سے موجود ہے | نیا نام استعمال کریں یا حذف کریں |
| `Forbidden` | اجازت نامے ناکافی ہیں | RBAC رولز چیک کریں |

---

## 🔄 ری سیٹ اور بازیابی

```bash
# نرم ری سیٹ (وسائل برقرار رکھیں، کوڈ دوبارہ تعینات کریں)
azd deploy --force

# سخت ری سیٹ (سب کچھ حذف کریں، نیا آغاز کریں)
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

- [پیش از تعیناتی کی جانچ](../chapter-06-pre-deployment/preflight-checks.md)
- [تشکیلات کی گائیڈ](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**دسترخوان**:  
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ اگرچہ ہم درستگی کی کوشش کرتے ہیں، براہ کرم نوٹ کریں کہ خودکار ترجمے میں غلطیاں یا غیر درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنی مادری زبان میں معتبر ماخذ سمجھی جانی چاہیے۔ اہم معلومات کے لیے، پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ ہم اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کے ذمہ دار نہیں ہیں۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->