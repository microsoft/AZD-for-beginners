# अध्याय 3: कन्फिगरेसन र प्रमाणिकरण

**📚 Course**: [AZD आरम्भकर्ताका लागि](../../README.md) | **⏱️ Duration**: 45-60 मिनेट | **⭐ Complexity**: मध्यम

---

## अवलोकन

यो अध्यायले Azure Developer CLI डिप्लोयमेन्टका लागि वातावरण कन्फिगरेसन, प्रमाणिकरण ढाँचाहरू, र सुरक्षा उत्तम अभ्यासहरू समेट्छ।

> `azd 1.25.6` सँग जून 2026 मा मान्य गरिएको।

## अधिगम उद्देश्यहरू

यस अध्याय पूरा गरेपछि, तपाईं:
- AZD कन्फिगरेसन पदानुक्रममा निपुण हुनुहुनेछ
- एकैसाथ धेरै वातावरणहरू (dev, staging, prod) व्यवस्थापन गर्न सक्नुहुनेछ
- प्रबन्धित पहिचानहरू प्रयोग गरी सुरक्षित प्रमाणिकरण लागू गर्न सक्नुहुनेछ
- वातावरण-विशिष्ट सेटिङहरू कन्फिगर गर्न सक्नुहुनेछ

---

## 📚 पाठहरू

| # | पाठ | वर्णन | समय |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | वातावरण सेटअप र व्यवस्थापन | 30 मिनेट |
| 2 | [Authentication & Security](authsecurity.md) | प्रबन्धित पहिचान र RBAC ढाँचाहरू | 30 मिनेट |

---

## 🚀 छिटो सुरूवात

```bash
# एकाधिक वातावरणहरू सिर्जना गर्नुहोस्
azd env new dev
azd env new staging
azd env new prod

# वातावरणहरू साट्नुहोस्
azd env select prod

# वातावरण चरहरू सेट गर्नुहोस्
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# कन्फिगरेसन हेर्नुहोस्
azd env get-values
```

---

## 🔧 कन्फिगरेसन पदानुक्रम

AZD ले सेटिङहरू यस क्रममा लागू गर्छ (पछिका सेटिङहरूले पहिलालाई ओभरराइड गर्छ):

1. **डिफल्ट मानहरू** (टेम्पलेटमा समावेश)
2. **azure.yaml** (project configuration)
3. **पर्यावरण भेरिएबलहरू** (`azd env set`)
4. **कमाण्ड-लाइन फ्ल्यागहरू** (`--location eastus`)

---

## 🔐 सुरक्षा उत्तम अभ्यासहरू

```bash
# प्रबन्धित पहिचान प्रयोग गर्नुहोस् (सिफारिस गरिन्छ)
azd env set AZURE_USE_MANAGED_IDENTITY true

# AZD प्रमाणिकरण स्थिति जाँच गर्नुहोस्
azd auth status

# वैकल्पिक: az आदेशहरू चलाउने योजना भएमा Azure CLI सन्दर्भ जाँच गर्नुहोस्
az account show

# आवश्यक भए पुन: प्रमाणिकरण गर्नुहोस्
azd auth login

# वैकल्पिक: az आदेशहरूको लागि Azure CLI प्रमाणिकरण नवीकरण गर्नुहोस्
az login
```

---

## 🔗 नेभिगेसन

| Direction | Chapter |
|-----------|---------|
| **पछिल्लो** | [Chapter 2: AI Development](../chapter-02-ai-development/README.md) |
| **अर्को** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Troubleshooting](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->