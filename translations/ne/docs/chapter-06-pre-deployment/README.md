# अध्याय 6: पूर्व-परिनियोजन योजना र मान्यकरण

**📚 पाठ्यक्रम**: [AZD For Beginners](../../README.md) | **⏱️ अवधि**: 1 घण्टा | **⭐ जटिलता**: मध्यम

---

## अवलोकन

यो अध्यायले तपाईंको आवेदन परिनियोजन गर्नु अघि आवश्यक योजना र मान्यकरण चरणहरूलाई समेट्छ। उचित क्षमता योजना, SKU चयन, र प्रीफ्लाइट जाँचहरूसँग महँगो त्रुटिहरूबाट कसरी जोगिने सिक्नुहोस्।

## शिक्षण लक्ष्यहरू

यस अध्याय पूरा गरेपछि, तपाईं:
- परिनियोजन अघि प्रीफ्लाइट जाँचहरू चलाउन सक्नुहुनेछ
- क्षमता योजना बनाउने र स्रोत आवश्यकताहरू अनुमान गर्ने
- लागत अनुकूलनका लागि उपयुक्त SKUs छनौट गर्ने
- अनुगमनका लागि Application Insights कन्फिगर गर्ने
- टिम समन्वय ढाँचाहरू बुझ्ने

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | परिनियोजन अघि कन्फिगरेसन मान्य गर्नुहोस् | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | स्रोत आवश्यकताहरू अनुमान गर्नुहोस् | 20 min |
| 3 | [SKU Selection](sku-selection.md) | उपयुक्त मूल्य निर्धारण तहहरू चयन गर्नुहोस् | 15 min |
| 4 | [Application Insights](application-insights.md) | अनुगमन कन्फिगर गर्नुहोस् | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | टिम परिनियोजन कार्यप्रवाहहरू | 15 min |

---

## 🚀 छिटो सुरु

```bash
# सदस्यता कोटा जाँच गर्नुहोस्
az vm list-usage --location eastus --output table

# परिनियोजन पूर्वावलोकन (कुनै संसाधनहरू सिर्जना गरिँदैनन्)
azd provision --preview

# Bicep सिन्ट्याक्स मान्य गर्नुहोस्
az bicep build --file infra/main.bicep

# पर्यावरण कन्फिगरेसन जाँच गर्नुहोस्
azd env get-values
```

---

## ☑️ पूर्व-परिनियोजन चेकलिष्ट

### `azd provision` अघि

- [ ] क्षेत्रका लागि कोटा जाँच गरिएको
- [ ] SKUs उपयुक्त रूपमा चयन गरिएको
- [ ] लागत अनुमान समीक्षा गरिएको
- [ ] नामकरण परम्परा एकरूप छ
- [ ] सुरक्षा/RBAC कन्फिगर गरिएको

### `azd deploy` अघि

- [ ] वातावरण चरहरू सेट गरिएको
- [ ] Key Vault मा गुप्त वस्तुहरू छन्
- [ ] कनेक्शन स्ट्रिङ्हरू जाँच गरिएको
- [ ] हेल्थ चेकहरू कन्फिगर गरिएको

---

## 💰 SKU चयन मार्गदर्शक

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 नेभिगेसन

| Direction | Chapter |
|-----------|---------|
| **अघिल्लो** | [Chapter 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **अर्को** | [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुनसक्छ। मूल भाषामा रहेको मूल दस्तावेजलाई अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->