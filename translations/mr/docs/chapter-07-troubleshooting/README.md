# अध्याय ७: समस्या निवारण आणि डीबगिंग

**📚 कोर्स**: [AZD For Beginners](../../README.md) | **⏱️ कालावधी**: १-१.५ तास | **⭐ गुंतागुंत**: मध्यम

---

## आढावा

हा अध्याय Azure Developer CLI वापरताना सामान्य समस्या ओळखण्यात आणि सोडवण्यात मदत करतो. तैनातीतील अपयशांपासून AI-विशिष्ट समस्यांपर्यंत.

> कमांड मार्गदर्शन प्रकाशित `azd 1.37.2` संदर्भाशी तपासले गेले आहे. क्लाऊड तैनात्या पार पडल्या नाहीत. कमांड वापरण्यापूर्वी उदाहरण स्रोत नावे आणि आयडी बदला.

## शिकण्याचे उद्दिष्टे

या अध्यायास पूर्ण केल्यावर, आपण:
- सामान्य AZD तैनात्या अपयशांचे निदान कराल
- प्रमाणीकरण आणि परवानगीच्या समस्या डीबग कराल
- AI सेवा कनेक्टिव्हिटी समस्या सोडवाल
- समस्या निवारणासाठी Azure पोर्टल आणि CLI वापराल

---

## 📚 धडे

| # | धडा | वर्णन | वेळ |
|---|--------|-------------|------|
| १ | [सामान्य समस्या](common-issues.md) | वारंवार येणाऱ्या समस्या | ३० मिनिटे |
| २ | [डीबगिंग मार्गदर्शक](debugging.md) | टप्प्यानुसार डीबगिंग रणनीती | ४५ मिनिटे |
| ३ | [AI समस्या निवारण](ai-troubleshooting.md) | AI-विशिष्ट समस्या | ३० मिनिटे |

---

## 🚨 जलद निराकरणे

### प्रमाणीकरण समस्या
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### तैनाती अपयशे
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### संसाधन संघर्ष
आधी विद्यमान संसाधन आणि तैनाती त्रुटी तपासा. नावासंबंधी संघर्ष सोडवण्यासाठी सामायिक किंवा उत्पादन पर्यावरण हटवू नका. **नवीन वापरले जाणारे पर्यावरण** साठी एक अद्वितीय नाव वापरा:

```bash
azd env new different-name
azd up
```

### कोटा ओलांडले
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

`AZURE_LOCATION` बदलल्याने विद्यमान संसाधन हलत नाही आणि पुनःतैनातीवर स्थान संघर्ष होऊ शकतो.

---

## 📋 त्रुटी कोड संदर्भ

| त्रुटी | कारण | उपाय |
|-------|-------|----------|
| `AuthenticationError` | लॉगिन केलेले नाही | `azd auth login` |
| `ResourceNotFound` | संसाधन गायब आहे | संसाधनाच्या नावे तपासा |
| `QuotaExceeded` | सदस्यता मर्यादा | कोटा वाढीसाठी विनंती करा |
| `InvalidTemplate` | बाईसेप सिंटॅक्स त्रुटी | `az bicep build` |
| `Conflict` | संसाधन अस्तित्वात आहे | नवीन नाव वापरा किंवा हटवा |
| `Forbidden` | अपर्याप्त परवानग्या | RBAC भूमिका तपासा |

---

## 🔄 रीसेट आणि पुनर्प्राप्ती

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

हार्ड रीसेटने डेटा हटतो आणि एंडपॉइंट्स बदलू शकतात. आधी बॅकअप घ्या आणि परस्पर क्रियाशील हटवण्याच्या सूचना तपासा. `--force --purge` फक्त नष्ट होणाऱ्या पर्यावरणांसाठी योग्य आहे जेव्हा अपरिवर्तनीय हटवणे उद्दिष्ट असते.

---

## 🔗 नेव्हिगेशन

| दिशा | अध्याय |
|-----------|---------|
| **मागील** | [अध्याय ६: पूर्व-तैनाती](../chapter-06-pre-deployment/README.md) |
| **पुढील** | [अध्याय ८: उत्पादन](../chapter-08-production/README.md) |

---

## 📖 संबंधित संसाधने

- [पूर्व-तैनाती तपासण्या](../chapter-06-pre-deployment/preflight-checks.md)
- [संपादन मार्गदर्शक](../chapter-03-configuration/configuration.md)
- [AZD GitHub समस्या](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->