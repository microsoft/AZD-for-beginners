# अध्याय 7: समस्या समाधान र डिबगिङ

**📚 Course**: [AZD शुरुआतीका लागि](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: मध्यम

---

## अवलोकन

यो अध्यायले Azure Developer CLI सँग काम गर्दा देखा पर्ने सामान्य समस्या पत्ता लगाउन र समाधान गर्न मद्दत गर्छ। परिनियोजन असफलताबाट लिएर AI-विशिष्ट समस्याहरू सम्म।

## सिक्ने उद्देश्यहरू

यो अध्याय पूरा गरेपछि, तपाईं:
- सामान्य AZD परिनियोजन असफलताहरू निदान गर्नुहोस्
- प्रमाणीकरण र अनुमति सम्बन्धी समस्याहरू डिबग गर्नुहोस्
- AI सेवा कनेक्टिभिटी समस्याहरू समाधान गर्नुहोस्
- समस्या समाधानका लागि Azure Portal र CLI प्रयोग गर्नुहोस्

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [सामान्य समस्याहरू](common-issues.md) | प्रायः सामना गरिने समस्याहरू | 30 मिनेट |
| 2 | [डिबगिङ मार्गदर्शिका](debugging.md) | कदम-दर-कदम डिबगिङ रणनीतिहरू | 45 मिनेट |
| 3 | [AI समस्या समाधान](ai-troubleshooting.md) | AI-विशिष्ट समस्याहरू | 30 मिनेट |

---

## 🚨 छिटो समाधानहरू

### प्रमाणीकरण समस्याहरू
```bash
azd auth login
az login
azd auth whoami
```

### प्रोभिजनिङ असफलताहरू
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### स्रोत टकरावहरू
```bash
azd down --force --purge
azd env new different-name
azd up
```

### कोटा नाघियो
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 त्रुटि कोड सन्दर्भ

| त्रुटि | कारण | समाधान |
|-------|-------|----------|
| `AuthenticationError` | लग इन गरिएको छैन | `azd auth login` |
| `ResourceNotFound` | स्रोत फेला परेन | स्रोतका नामहरू जाँच गर्नुहोस् |
| `QuotaExceeded` | सब्सक्रिप्सन सीमाहरू | कोटा वृद्धि अनुरोध गर्नुहोस् |
| `InvalidTemplate` | Bicep सिन्ट्याक्स त्रुटि | `az bicep build` |
| `Conflict` | स्रोत पहिले नै अवस्थित छ | नयाँ नाम प्रयोग गर्नुहोस् वा हटाउनुहोस् |
| `Forbidden` | पर्याप्त अनुमति छैन | RBAC भूमिका जाँच गर्नुहोस् |

---

## 🔄 रिसेट र रिकभरी

```bash
# नरम रिसेट (स्रोतहरू राख्ने, कोड पुनः परिनियोजन गर्ने)
azd deploy --force

# हार्ड रिसेट (सबै मेटाउने, नयाँबाट सुरु गर्ने)
azd down --force --purge
azd up
```

---

## 🔗 नेभिगेसन

| दिशा | अध्याय |
|-----------|---------|
| **अघिल्लो** | [अध्याय 6: पूर्व-परिनियोजन](../chapter-06-pre-deployment/README.md) |
| **अर्को** | [अध्याय 8: उत्पादन](../chapter-08-production/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [पूर्व-परिनियोजन जाँचहरू](../chapter-06-pre-deployment/preflight-checks.md)
- [कन्फिगरेसन मार्गदर्शिका](../chapter-03-configuration/configuration.md)
- [AZD GitHub इश्यूहरू](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सटीकताको लागि प्रयास गर्छौँ, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको मूल दस्तावेजलाई नै अधिकारिक स्रोत मानिनु पर्छ। महत्त्वपूर्ण जानकारीका लागि पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->