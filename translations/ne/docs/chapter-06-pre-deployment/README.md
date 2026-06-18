# अध्याय ६: पूर्व-परिनियोजन योजना र प्रमाणीकरण

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 hour | **⭐ Complexity**: Intermediate

---

## अवलोकन

यस अध्यायले तपाईंको अनुप्रयोग परिनियोजन गर्नु अघि आवश्यक योजना र प्रमाणीकरण कदमहरू समेट्छ। उचित क्षमता योजना, SKU चयन, र प्रिफ्लाइट जाँचहरू मार्फत महँगो त्रुटिहरूबाट जोगिन सिक्नुहोस्।

> मान्य गरिएको `azd 1.25.6` जुन २०२६ मा।

## सिकाइ लक्ष्यहरू

यो अध्याय पूरा गरेपछि, तपाईंले:
- परिनियोजनभन्दा पहिले प्रिफ्लाइट जाँचहरू चलाउनुहोस्
- क्षमताको योजना बनाउनुहोस् र स्रोत आवश्यकताहरू अनुमान गर्नुहोस्
- लागत अनुकूलनका लागि उपयुक्त SKUहरू चयन गर्नुहोस्
- निगरानीका लागि Application Insights कन्फिगर गर्नुहोस्
- टोली समन्वय ढाँचाहरू बुझ्नुहोस्

---

## 📚 पाठहरू

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [प्रिफ्लाइट जाँचहरू](preflight-checks.md) | परिनियोजनअघि कन्फिगरेसन प्रमाणित गर्नुहोस् | 15 min |
| 2 | [क्षमता योजना](capacity-planning.md) | स्रोत आवश्यकताहरू अनुमान गर्नुहोस् | 20 min |
| 3 | [SKU चयन](sku-selection.md) | उपयुक्त मूल्य निर्धारण तहहरू रोज्नुहोस् | 15 min |
| 4 | [Application Insights](application-insights.md) | निगरानी कन्फिगर गर्नुहोस् | 20 min |
| 5 | [समन्वय ढाँचाहरू](coordination-patterns.md) | टोली परिनियोजन कार्यप्रवाहहरू | 15 min |

---

## 🚀 छिटो सुरुवात

```bash
# सब्सक्रिप्सन कोटा जाँच गर्नुहोस्
az vm list-usage --location eastus --output table

# डिप्लोयमेन्ट पूर्वावलोकन (कुनै संसाधनहरू सिर्जना हुँदैनन्)
azd provision --preview

# Bicep सिन्ट्याक्स जाँच गर्नुहोस्
az bicep build --file infra/main.bicep

# पर्यावरण विन्यास जाँच गर्नुहोस्
azd env get-values
```

---

## ☑️ पूर्व-परिनियोजन जाँचसूची

### `azd provision` भन्दा अघि

- [ ] क्षेत्रको कोटा प्रमाणित गरिएको
- [ ] SKUहरू उपयुक्त रूपमा चयन गरिएको
- [ ] लागत अनुमान समीक्षा गरिएको
- [ ] नामकरण प्रथा सुसंगत
- [ ] सुरक्षा/RBAC कन्फिगर गरिएको

### `azd deploy` भन्दा अघि

- [ ] वातावरण भेरिएबलहरू सेट गरिएको
- [ ] Key Vault मा secrets राखिएका छन्
- [ ] कनेक्शन स्ट्रिङहरू जाँचिएका छन्
- [ ] स्वास्थ्य जाँचहरू कन्फिगर गरिएको

---

## 💰 SKU चयन मार्गदर्शक

| वर्कलोड | विकास | उत्पादन |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 नेभिगेसन

| दिशा | अध्याय |
|-----------|---------|
| **अघिल्लो** | [अध्याय ५: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **अघिल्लो** maybe? | **Note**: There's an accidental duplication in original; keep only two rows? |

---

## 📖 सम्बन्धित स्रोतहरू

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->