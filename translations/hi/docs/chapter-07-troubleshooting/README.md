# अध्याय 7: समस्या निवारण और डीबगिंग

**📚 कोर्स**: [AZD For Beginners](../../README.md) | **⏱️ अवधि**: 1-1.5 घंटे | **⭐ जटिलता**: मध्यवर्ती

---

## अवलोकन

यह अध्याय Azure Developer CLI के साथ काम करते समय आम समस्याओं का निदान और समाधान करने में आपकी सहायता करता है। परिनियोजन विफलताओं से लेकर AI-विशिष्ट समस्याओं तक।

> कमांड मार्गदर्शन जारी किए गए `azd 1.37.2` संदर्भ के खिलाफ समीक्षा की गई है। क्लाउड परिनियोजन निष्पादित नहीं किए गए। कमांड का उपयोग करने से पहले उदाहरण संसाधन नामों और आईडी को बदलें।

## सीखने के उद्देश्य

इस अध्याय को पूरा करके, आप:
- सामान्य AZD परिनियोजन विफलताओं का निदान करेंगे
- प्रमाणीकरण और अनुमति समस्याओं को डीबग करेंगे
- AI सेवा कनेक्टिविटी समस्याओं को हल करेंगे
- समस्या निवारण के लिए Azure पोर्टल और CLI का उपयोग करेंगे

---

## 📚 पाठ

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [सामान्य समस्याएँ](common-issues.md) | अक्सर आने वाली समस्याएँ | 30 मिनट |
| 2 | [डीबगिंग गाइड](debugging.md) | चरण-दर-चरण डीबगिंग रणनीतियाँ | 45 मिनट |
| 3 | [AI समस्या निवारण](ai-troubleshooting.md) | AI-विशिष्ट समस्याएँ | 30 मिनट |

---

## 🚨 त्वरित समाधान

### प्रमाणीकरण समस्याएँ
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### प्रोविजनिंग असफलताएँ
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### संसाधन संघर्ष
पहले मौजूदा संसाधन और परिनियोजन त्रुटियों का निरीक्षण करें। नामकरण संघर्ष को हल करने के लिए साझा या प्रोडक्शन पर्यावरण को न हटाएं। **नए डिस्पोजेबल पर्यावरण** के लिए एक अनूठा नाम उपयोग करें:

```bash
azd env new different-name
azd up
```

### कोटा अधिकतम
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

`AZURE_LOCATION` बदलने से मौजूदा संसाधन स्थानांतरित नहीं होते हैं और पुनः परिनियोजन पर स्थान संघर्ष हो सकते हैं।

---

## 📋 त्रुटि कोड संदर्भ

| त्रुटि | कारण | समाधान |
|-------|-------|----------|
| `AuthenticationError` | लॉग इन नहीं है | `azd auth login` |
| `ResourceNotFound` | संसाधन गायब | संसाधन नाम जांचें |
| `QuotaExceeded` | सदस्यता सीमाएं | कोटा वृद्धि का अनुरोध करें |
| `InvalidTemplate` | बाइसेप सिंटैक्स त्रुटि | `az bicep build` |
| `Conflict` | संसाधन मौजूद है | नया नाम उपयोग करें या हटाएं |
| `Forbidden` | अपर्याप्त अनुमतियाँ | RBAC भूमिकाएं जांचें |

---

## 🔄 रीसेट और पुनर्प्राप्ति

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

हार्ड रीसेट डेटा हटा देता है और एंडपॉइंट्स बदल सकता है। पहले बैकअप लें और इंटरैक्टिव हटाने के संकेतों की समीक्षा करें। `--force --purge` केवल जब अपरिवर्तनीय हटाना आवश्यक हो तब डिस्पोजेबल पर्यावरणों के लिए उपयुक्त है।

---

## 🔗 नेविगेशन

| दिशा | अध्याय |
|-----------|---------|
| **पिछला** | [अध्याय 6: प्री-डिप्लॉयमेंट](../chapter-06-pre-deployment/README.md) |
| **अगला** | [अध्याय 8: उत्पादन](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधन

- [प्री-डिप्लॉयमेंट चेक](../chapter-06-pre-deployment/preflight-checks.md)
- [कॉन्फ़िगरेशन गाइड](../chapter-03-configuration/configuration.md)
- [AZD GitHub Issues](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->