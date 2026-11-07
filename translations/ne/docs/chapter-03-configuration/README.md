# अध्याय ३ः कन्फिगरेसन र प्रमाणीकरण

**📚 कोर्स**: [AZD प्रविधिकहरूमार्फत](../../README.md) | **⏱️ अवधि**: ९०-१५० मिनेट इंटिग्रेसन अभ्यास सहित | **⭐ जटिलता**: मध्यम

---

## अवलोकन

यस अध्यायले Azure Developer CLI प्रक्षेपणका लागि वातावरण कन्फिगरेसन, प्रमाणीकरण ढाँचा, र सुरक्षा सर्वोत्तम अभ्यासहरु समेट्छ।

> आदेश र कन्फिगरेसन समीक्षा लक्षित: `azd 1.37.2` (नोभेम्बर २०२६)। समीक्षा क्रममा प्रत्यक्ष Azure प्रावधान सञ्चालन गरिएको थिएन।

## सिकाइ लक्ष्यहरू

यस अध्याय पूरा गरेर, तपाईं:
- AZD कन्फिगरेसन पदानुक्रममा दक्षता हासिल गर्नुहुनेछ
- धेरै वातावरणहरु (डेभ, स्टेजिङ, प्रोड) व्यवस्थापन गर्नुहुनेछ
- व्यवस्थापित पहिचानहरूसँग सुरक्षित प्रमाणीकरण कार्यान्वयन गर्नुहुनेछ
- वातावरण-विशिष्ट सेटिङहरू कन्फिगर गर्नुहुनेछ

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [कन्फिगरेसन मार्गदर्शक](configuration.md) | वातावरण सेटअप र व्यवस्थापन | ३० मिनेट |
| 2 | [प्रमाणीकरण र सुरक्षा](authsecurity.md) | व्यवस्थापित पहिचान र RBAC ढाँचा | ३० मिनेट |

---

## 🚀 छिटो सुरुवात

*पहिले नै सुरू गरिएको azd अनुप्रयोगको* रुटबाट चलाउनुहोस्, कोर्स रिपोजिटरीबाट होइन। यदि ती पहिले नै अवस्थित छन् भने नचाहिने वातावरण नामहरू प्रयोग गर्नुहोस्।

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

`SKU_NAME` उदाहरणका लागि हो: यसले तपाईंको ढाँचाले स्पष्ट रूपमा यसलाई सेवन नगरेको खण्डमा मात्र पूर्वाधारलाई असर गर्दछ। सामान्य `azd env set` मानहरू स्थानीय रूपमा सरल पाठमा सुरक्षित नगरी बचत गरिन्छ।

---

## 🔧 कन्फिगरेसन पदानुक्रम

तीन फरक कन्फिगरेसन सतहहरूलाई अलग राख्नुहोस्: ग्लोबल प्राथमिकता (`azd config`), परियोजना संरचना (`azure.yaml`), र प्रति-वातावरण मानहरू (`azd env`)। झण्डाहरूले मात्र तिनीहरूले वास्तवमा समर्थन गर्ने सेटिङहरूलाई ओभरराइड गर्छन्; कुनै सार्वभौमिक ओभरले arbitrary environment variables लाई `azure.yaml` वा Bicep मा लागु हुँदैन।

---

## 🔐 सुरक्षा सर्वोत्तम अभ्यासहरू

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

## 🔗 नेभिगेसन

| दिशा | अध्याय |
|-----------|---------|
| **अघिल्लो** | [अध्याय २: AI विकास](../chapter-02-ai-development/README.md) |
| **अर्को** | [अध्याय ४: पूर्वाधार](../chapter-04-infrastructure/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [पूर्व-प्रक्षेपण जाँच](../chapter-06-pre-deployment/README.md)
- [समस्या समाधान](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->