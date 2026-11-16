# अध्याय 3: कॉन्फ़िगरेशन और प्रमाणीकरण

**📚 कोर्स**: [AZD For Beginners](../../README.md) | **⏱️ अवधि**: 90-150 मिनट जिसमें इंटीग्रेशन अभ्यास शामिल है | **⭐ जटिलता**: मध्यम

---

## अवलोकन

यह अध्याय Azure Developer CLI डिप्लॉयमेंट के लिए पर्यावरण कॉन्फ़िगरेशन, प्रमाणीकरण पैटर्न और सुरक्षा सर्वोत्तम अभ्यास को कवर करता है।

> कमांड और कॉन्फ़िगरेशन समीक्षा लक्ष्य: `azd 1.37.2` (नवंबर 2026)। समीक्षा के दौरान लाइव Azure प्रावधान नहीं चलाया गया था।

## सीखने के उद्देश्य

इस अध्याय को पूरा करने के बाद, आप:
- AZD कॉन्फ़िगरेशन पदानुक्रम में महारत हासिल कर लेंगे
- कई पर्यावरणों (डेव, स्टेजिंग, प्रोड) का प्रबंधन करेंगे
- प्रबंधित पहचान के साथ सुरक्षित प्रमाणीकरण को लागू करेंगे
- पर्यावरण-विशिष्ट सेटिंग्स कॉन्फ़िगर करेंगे

---

## 📚 पाठ

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [कॉन्फ़िगरेशन गाइड](configuration.md) | पर्यावरण सेटअप और प्रबंधन | 30 मिनट |
| 2 | [प्रमाणीकरण और सुरक्षा](authsecurity.md) | प्रबंधित पहचान और RBAC पैटर्न | 30 मिनट |

---

## 🚀 त्वरित प्रारंभ

**पहले से इनिशियलाइज़्ड azd एप्लिकेशन** की रूट से चलाएँ, कोर्स रिपॉजिटरी से नहीं। यदि ये पहले से मौजूद हैं तो बिना उपयोग किए गए पर्यावरण नामों का उपयोग करें।

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

`SKU_NAME` उदाहरण स्वरूप है: यह केवल तभी इन्फ्रास्ट्रक्चर को प्रभावित करता है यदि आपकी टेम्पलेट इसे स्पष्ट रूप से उपयोग करती है। सामान्य `azd env set` मान स्थानीय तौर पर प्लेनटेक्स्ट में सहेजे जाते हैं; ये सुरक्षित गुप्त संग्रह नहीं हैं।

---

## 🔧 कॉन्फ़िगरेशन पदानुक्रम

तीन अलग-अलग कॉन्फ़िगरेशन सतहों को अलग रखें: वैश्विक प्राथमिकताएँ (`azd config`), प्रोजेक्ट संरचना (`azure.yaml`), और प्रति-पर्यावरण मान (`azd env`)। फ्लैग केवल उन्हीं सेटिंग्स को ओवरराइड करते हैं जिन्हें वे वास्तव में समर्थन करते हैं; कोई सार्वभौमिक ओवरले नहीं है जो मनमाने पर्यावरण चर को `azure.yaml` या बाइसप पर लागू करता हो।

---

## 🔐 सुरक्षा सर्वोत्तम अभ्यास

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

## 🔗 नेविगेशन

| दिशा | अध्याय |
|-----------|---------|
| **पिछला** | [अध्याय 2: AI विकास](../chapter-02-ai-development/README.md) |
| **अगला** | [अध्याय 4: इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/README.md) |

---

## 📖 संबंधित संसाधन

- [पूर्व-डिप्लॉयमेंट जांच](../chapter-06-pre-deployment/README.md)
- [समस्या निवारण](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->