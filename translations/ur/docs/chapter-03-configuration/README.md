# باب 3: ترتیبات اور توثیق

**📚 کورس**: [AZD برائے ابتدائی افراد](../../README.md) | **⏱️ دورانیہ**: 90-150 منٹ بشمول انٹیگریشن پریکٹس | **⭐ پیچیدگی**: درمیانہ

---

## جائزہ

یہ باب Azure Developer CLI کی تعیناتیوں کے لیے ماحول کی ترتیبات، توثیقی طریقے، اور سیکیورٹی کی بہترین کارروائیاں شامل کرتا ہے۔

> کمانڈ اور ترتیب کا جائزہ ہدف: `azd 1.37.2` (نومبر 2026)۔ جائزہ کے دوران لائیو Azure پروویژننگ نہیں چلائی گئی۔

## تعلیمی مقاصد

اس باب کو مکمل کر کے، آپ:
- AZD ترتیب کی درجہ بندی پر عبور حاصل کریں گے
- متعدد ماحولیات (dev, staging, prod) کا انتظام کریں گے
- منظم شناختوں کے ساتھ محفوظ توثیق نافذ کریں گے
- ماحول کے مخصوص ترتیبات ترتیب دیں گے

---

## 📚 اسباق

| # | سبق | تفصیل | وقت |
|---|--------|-------------|------|
| 1 | [ترتیب کا رہنما](configuration.md) | ماحول کی ترتیب اور انتظام | 30 منٹ |
| 2 | [توثیق اور سیکیورٹی](authsecurity.md) | منظم شناخت اور RBAC طریقے | 30 منٹ |

---

## 🚀 جلد آغاز

**پہلے سے شروع شدہ azd ایپلیکیشن** کی روٹ سے چلائیں، کورس ریپوزٹری سے نہیں۔ اگر یہ پہلے سے موجود ہیں تو غیر استعمال شدہ ماحول کے نام استعمال کریں۔

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` تصوراتی ہے: یہ صرف اس صورت میں انفراسٹرکچر کو متاثر کرتا ہے جب آپ کا ٹیمپلیٹ خاص طور پر اسے استعمال کرے۔ عام `azd env set` اقدار مقامی طور پر سادہ متن میں محفوظ ہوتی ہیں؛ یہ محفوظ خفیہ ذخیرہ نہیں ہیں۔

---

## 🔧 ترتیب کی درجہ بندی

تین مختلف ترتیب کے سطحوں کو الگ رکھیں: عالمی پسندیدگیاں (`azd config`)، پروجیکٹ کی ساخت (`azure.yaml`)، اور ہر ماحول کے مطابق اقدار (`azd env`)۔ جھنڈیاں صرف وہ ترتیبات اوور رائڈ کرتی ہیں جو وہ واقعی سپورٹ کرتی ہیں؛ کوئی عمومی اوورلے نہیں ہے جس میں بے ترتیب ماحول کے متغیرات کو `azure.yaml` یا Bicep پر نافذ کیا جائے۔

---

## 🔐 سیکیورٹی کی بہترین کارروائیاں

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 نیویگیشن

| سمت | باب |
|-----------|---------|
| **پچھلا** | [باب 2: AI ترقی](../chapter-02-ai-development/README.md) |
| **اگلا** | [باب 4: انفراسٹرکچر](../chapter-04-infrastructure/README.md) |

---

## 📖 متعلقہ وسائل

- [پہلے سے تعیناتی کے معائنہ](../chapter-06-pre-deployment/README.md)
- [مسائل کا حل](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ڈس کلیمر**:
یہ دستاویز AI ترجمہ سروس [Co-op Translator](https://github.com/Azure/co-op-translator) کے ذریعے ترجمہ کی گئی ہے۔ جبکہ ہم درستگی کے لیے کوشاں ہیں، براہ کرم اس بات سے آگاہ رہیں کہ خودکار ترجمے میں غلطیاں یا عدم درستیاں ہو سکتی ہیں۔ اصل دستاویز اپنے مادری زبان میں مستند ماخذ سمجھی جائے گی۔ حساس معلومات کے لیے پیشہ ور انسانی ترجمہ کی سفارش کی جاتی ہے۔ اس ترجمے کے استعمال سے پیدا ہونے والی کسی بھی غلط فہمی یا غلط تشریح کی ذمہ داری ہم قبول نہیں کرتے۔
<!-- CO-OP TRANSLATOR DISCLAIMER END -->