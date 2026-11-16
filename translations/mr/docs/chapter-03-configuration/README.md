# अध्याय 3: कॉन्फिगरेशन आणि प्रमाणीकरण

**📚 कोर्स**: [AZD फॉर बिगिनर्स](../../README.md) | **⏱️ कालावधी**: 90-150 मिनिटे, यामध्ये इंटीग्रेशन प्रॅक्टिस समाविष्ट आहे | **⭐ गुंतागुंत**: मध्यम

---

## अवलोकन

हा अध्याय Azure Developer CLI डिप्लॉयमेंटसाठी पर्यावरण कॉन्फिगरेशन, प्रमाणीकरण पद्धती, आणि सुरक्षा सर्वोत्तम प्रथांवर चर्चा करतो.

> कमांड आणि कॉन्फिगरेशन पुनरावलोकन लक्ष्य: `azd 1.37.2` (नोव्हेंबर 2026). पुनरावलोकनादरम्यान लाईव्ह Azure प्राव्हिजनिंग चालवले गेले नाही.

## शिकण्याचे उद्दिष्ट

हा अध्याय पूर्ण केल्यावर, तुम्ही:
- AZD कॉन्फिगरेशन क्रमवारीवर प्रभुत्व मिळवाल
- अनेक पर्यावरणे (dev, staging, prod) व्यवस्थापित कराल
- व्यवस्थापित ओळखपत्रांसह सुरक्षित प्रमाणीकरण अमलात आणाल
- पर्यावरण-विशिष्ट सेटिंग्ज कॉन्फिगर कराल

---

## 📚 धडे

| # | धडा | वर्णन | वेळ |
|---|--------|-------------|------|
| 1 | [कॉन्फिगरेशन मार्गदर्शक](configuration.md) | पर्यावरण सेटअप आणि व्यवस्थापन | 30 मिनिटे |
| 2 | [प्रमाणीकरण आणि सुरक्षा](authsecurity.md) | व्यवस्थापित ओळखणी आणि RBAC पॅटर्न्स | 30 मिनिटे |

---

## 🚀 झटपट प्रारंभ करा

**पूर्वीच इनिशियलाइज्ड azd ऍप्लिकेशन** च्या मूळ निर्देशिकेतून चालवा, कोर्स रेपॉजिटरीमधून नाही. जर या आधीच अस्तित्वात असलेली पर्यावरण नावे वापरू इच्छित असाल तर न वापरलेली नावे वापरा.

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

`SKU_NAME` हे उदाहरणार्थ आहे: जेव्हा तुमचा टेम्पलेट स्पष्टपणे त्याचा वापर करतो तेव्हाच ते इन्फ्रास्ट्रक्चरवर परिणाम करते. सामान्य `azd env set` मूल्ये स्थानिक पातळीवर प्लेनटेक्स्टमध्ये जतन केली जातात; ती सुरक्षित सीक्रेट स्टोरेज नाहीत.

---

## 🔧 कॉन्फिगरेशन क्रमवारी

तीन वेगवेगळ्या कॉन्फिगरेशन पृष्ठभाग वेगळे ठेवा: जागतिक प्राधान्ये (`azd config`), प्रोजेक्ट संरचना (`azure.yaml`), आणि प्रति-पर्यावरण मूल्ये (`azd env`). फ्लॅग्स फक्त त्या सेटिंग्जवर अधिलेखित करतात ज्या ते प्रत्यक्षात समर्थन करतात; `azure.yaml` किंवा Bicep वर मनमानी पर्यावरण चलांचे सार्वत्रिक ओव्हरले नाही.

---

## 🔐 सुरक्षा सर्वोत्तम प्रथा

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

## 🔗 नेव्हिगेशन

| दिशा | अध्याय |
|-----------|---------|
| **मागील** | [अध्याय 2: AI विकास](../chapter-02-ai-development/README.md) |
| **पुढील** | [अध्याय 4: इन्फ्रास्ट्रक्चर](../chapter-04-infrastructure/README.md) |

---

## 📖 संबंधित स्रोत

- [पूर्व-डिप्लॉयमेंट तपासणी](../chapter-06-pre-deployment/README.md)
- [समस्या निवारण](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->