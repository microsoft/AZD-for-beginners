# Chapter 6: प्री-डिप्लॉयमेंट योजना और सत्यापन

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1 hour | **⭐ Complexity**: Intermediate

---

## अवलोकन

यह अध्याय आपके एप्लिकेशन को डिप्लॉय करने से पहले आवश्यक योजना और सत्यापन चरणों को कवर करता है। सही क्षमता योजना, SKU चयन, और प्रीफ़्लाइट चेक्स के साथ महंगे गलतियों से बचना सीखें।

## सीखने के उद्देश्य

इस अध्याय को पूरा करने पर, आप:
- डिप्लॉयमेंट से पहले प्रीफ़्लाइट चेक चलाएँ
- क्षमता की योजना बनाना और संसाधन आवश्यकताओं का अनुमान लगाना
- लागत अनुकूलन के लिए उपयुक्त SKUs चुनना
- मॉनिटरिंग के लिए Application Insights कॉन्फ़िगर करना
- टीम समन्वय पैटर्न को समझना

---

## 📚 पाठ

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | डिप्लॉयमेंट से पहले कॉन्फ़िगरेशन मान्य करें | 15 मिनट |
| 2 | [Capacity Planning](capacity-planning.md) | संसाधन आवश्यकताओं का अनुमान लगाएँ | 20 मिनट |
| 3 | [SKU Selection](sku-selection.md) | उपयुक्त प्राइसिंग टियर्स चुनें | 15 मिनट |
| 4 | [Application Insights](application-insights.md) | मॉनिटरिंग कॉन्फ़िगर करें | 20 मिनट |
| 5 | [Coordination Patterns](coordination-patterns.md) | टीम डिप्लॉयमेंट वर्कफ़्लो | 15 मिनट |

---

## 🚀 त्वरित प्रारंभ

```bash
# सब्सक्रिप्शन कोटाएँ जाँचें
az vm list-usage --location eastus --output table

# डिप्लॉयमेंट का पूर्वावलोकन (कोई संसाधन नहीं बनाए जाएंगे)
azd provision --preview

# Bicep सिंटैक्स सत्यापित करें
az bicep build --file infra/main.bicep

# पर्यावरण कॉन्फ़िगरेशन जाँचें
azd env get-values
```

---

## ☑️ प्री-डिप्लॉयमेंट चेकलिस्ट

### `azd provision` से पहले

- [ ] क्षेत्र के लिए कोटा सत्यापित
- [ ] उपयुक्त SKUs चुने गए
- [ ] लागत अनुमान की समीक्षा की गई
- [ ] नामकरण कन्वेंशन सुसंगत
- [ ] सुरक्षा/RBAC कॉन्फ़िगर किया गया

### `azd deploy` से पहले

- [ ] पर्यावरण वेरिएबल्स सेट किए गए
- [ ] Key Vault में Secrets
- [ ] कनेक्शन स्ट्रिंग्स सत्यापित
- [ ] हेल्थ चेक्स कॉन्फ़िगर किए गए

---

## 💰 SKU चयन मार्गदर्शिका

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 नेविगेशन

| Direction | Chapter |
|-----------|---------|
| **Previous** | [अध्याय 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [अध्याय 7: Troubleshooting](../chapter-07-troubleshooting/README.md) |

---

## 📖 संबंधित संसाधन

- [Configuration Guide](../chapter-03-configuration/configuration.md)
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- [Common Issues](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न होने वाली किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->