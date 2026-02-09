# Chapter 3: कॉन्फिगरेशन व प्रमाणीकरण

**📚 पाठ्यक्रम**: [AZD नवशिक्यांसाठी](../../README.md) | **⏱️ काळ**: 45-60 मिनिटे | **⭐ कठीणता**: मध्यम

---

## आढावा

हा अध्याय Azure Developer CLI डिप्लॉयमेंटसाठी एन्व्हायर्नमेंट कॉन्फिगरेशन, प्रमाणीकरण पॅटर्न आणि सुरक्षा सर्वोत्तम पद्धती यावर प्रकाश टाकतो.

## शिकण्याचे उद्दिष्टे

या अध्यायाचे पूर्णकरण केल्यावर, आपण:
- AZD कॉन्फिगरेशन श्रेणीवर प्रभुत्व मिळवाल
- अनेक एन्व्हायर्नमेंट्स (dev, staging, prod) व्यवस्थापित कराल
- Managed identities वापरून सुरक्षित प्रमाणीकरण अंमलात आणाल
- एन्व्हायर्नमेंट-विशिष्ट सेटिंग्ज कॉन्फिगर कराल

---

## 📚 धडे

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Configuration Guide](configuration.md) | Environment setup and management | 30 मिनिटे |
| 2 | [Authentication & Security](authsecurity.md) | Managed identity and RBAC patterns | 30 मिनिटे |

---

## 🚀 त्वरित प्रारंभ

```bash
# एकाधिक वातावरणे तयार करा
azd env new dev
azd env new staging
azd env new prod

# वातावरणे बदला
azd env select prod

# वातावरणीय चल सेट करा
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# कॉन्फिगरेशन पहा
azd env get-values
```

---

## 🔧 कॉन्फिगरेशन श्रेणी

AZD सेटिंग्ज खालील क्रमाने लागू करते (नंतरची आधीची ओव्हरराइड करते):

1. **Default values** (टेम्पलेटमध्ये अंगभूत)
2. **azure.yaml** (प्रोजेक्ट कॉन्फिगरेशन)
3. **Environment variables** (`azd env set`)
4. **Command-line flags** (`--location eastus`)

---

## 🔐 सुरक्षा सर्वोत्तम पद्धती

```bash
# व्यवस्थापित ओळख वापरा (शिफारस केलेले)
azd env set AZURE_USE_MANAGED_IDENTITY true

# प्रमाणीकरण स्थिती तपासा
azd auth whoami
az account show

# गरज असल्यास पुन्हा प्रमाणीकरण करा
azd auth login
az login
```

---

## 🔗 नेव्हिगेशन

| Direction | Chapter |
|-----------|---------|
| **मागील** | [अध्याय 2: AI विकास](../chapter-02-ai-development/README.md) |
| **पुढील** | [अध्याय 4: पायाभूत सुविधा](../chapter-04-infrastructure/README.md) |

---

## 📖 संबंधित संसाधने

- [पूर्व-तैनाती तपासण्या](../chapter-06-pre-deployment/README.md)
- [समस्यांचे निराकरण](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हे दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केले गेले आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेतील त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून मानले जावे. महत्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे निर्माण झालेल्या कोणत्याही गैरसमजांबद्दल किंवा चुकीच्या अर्थलाव्याबद्दल आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->