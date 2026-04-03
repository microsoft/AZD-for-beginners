# अध्याय 3: कॉन्फिगरेशन आणि प्रमाणीकरण

**📚 Course**: [नवशिक्यांसाठी AZD](../../README.md) | **⏱️ Duration**: 45-60 minutes | **⭐ Complexity**: Intermediate

---

## आढावा

This chapter covers environment configuration, authentication patterns, and security best practices for Azure Developer CLI deployments.

> मार्च 2026 मध्ये `azd 1.23.12` शी पडताळले.

## शिकण्याची उद्दिष्टे

By completing this chapter, you will:
- AZD कॉन्फिगरेशन पदानुक्रम आत्मसात करा
- एकाधिक वातावरणे (dev, staging, prod) व्यवस्थापित करा
- मॅनेज्ड आयडेंटिटीजसह सुरक्षित प्रमाणीकरण लागू करा
- वातावरण-विशिष्ट सेटिंग्ज कॉन्फिगर करा

---

## 📚 धडे

| # | धडा | वर्णन | कालावधी |
|---|--------|-------------|------|
| 1 | [कॉन्फिगरेशन मार्गदर्शिका](configuration.md) | वातावरण सेटअप आणि व्यवस्थापन | 30 मिनिटे |
| 2 | [प्रमाणीकरण आणि सुरक्षा](authsecurity.md) | मॅनेज्ड आयडेंटिटी आणि RBAC नमुने | 30 मिनिटे |

---

## 🚀 त्वरीत प्रारंभ

```bash
# अनेक वातावरण तयार करा
azd env new dev
azd env new staging
azd env new prod

# वातावरण बदला
azd env select prod

# वातावरणातील चल सेट करा
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# कॉन्फिगरेशन पहा
azd env get-values
```

---

## 🔧 कॉन्फिगरेशन पदानुक्रम

AZD ही सेटिंग्ज खालील क्रमाने लागू करते (नंतरच्या सेटिंग्ज पूर्वीच्या सेटिंग्ज अधिलेखित करतात):

1. **पूर्वनिर्धारित मूल्ये** (टेम्पलेटमध्ये अंगभूत)
2. **azure.yaml** (प्रकल्प कॉन्फिगरेशन)
3. **पर्यावरण चल** (`azd env set`)
4. **कमांड-लाइन फ्लॅग्स** (`--location eastus`)

---

## 🔐 सुरक्षा सर्वोत्तम पद्धती

```bash
# व्यवस्थापित ओळख वापरा (शिफारस केलेले)
azd env set AZURE_USE_MANAGED_IDENTITY true

# AZD प्रमाणीकरण स्थिती तपासा
azd auth status

# ऐच्छिक: आपण az आदेश चालवण्याची योजना आखत असल्यास Azure CLI संदर्भाची पडताळणी करा
az account show

# गरज असल्यास पुन्हा प्रमाणीकरण करा
azd auth login

# ऐच्छिक: az आदेशांसाठी Azure CLI चे प्रमाणीकरण ताजे करा
az login
```

---

## 🔗 नेव्हिगेशन

| दिशा | अध्याय |
|-----------|---------|
| **मागील** | [अध्याय 2: एआय विकास](../chapter-02-ai-development/README.md) |
| **पुढील** | [अध्याय 4: पायाभूत संरचना](../chapter-04-infrastructure/README.md) |

---

## 📖 संबंधित संसाधने

- [डिप्लॉयमेंटपूर्व तपासणी](../chapter-06-pre-deployment/README.md)
- [समस्या निवारण](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ भाषेतील दस्तऐवजाला अधिकृत स्रोत म्हणून समजले पाहिजे. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवाद सुचवला जातो. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुती किंवा चुकीच्या अर्थलावांसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->