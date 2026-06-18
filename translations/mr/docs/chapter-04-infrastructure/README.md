# Chapter 4: Infrastructure as Code & Deployment

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## Overview

हा अध्याय Bicep टेम्पलेट्स, रिसोर्स प्रोव्हिजनिंग, आणि Azure Developer CLI वापरून डिप्लॉयमेंट धोरणांसह Infrastructure as Code (IaC) पॅटर्न्स कव्हर करतो.

> `azd 1.25.6` विरुद्ध जून 2026 मध्ये प्रमाणित.

## Learning Objectives

हा अध्याय पूर्ण केल्यावर, तुम्ही:
- Bicep टेम्पलेट संरचना आणि सिन्‍टॅक्स समजून घेणार
- `azd provision` वापरून Azure रिसोर्सेस प्रोव्हिजन करण्यास सक्षम असाल
- `azd deploy` वापरून ऍप्लिकेशन्स डिप्लॉय करता येतील
- ब्लू-ग्रीन आणि रोलिंग डिप्लॉयमेंट धोरणे अंमलात आणू शकाल

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | AZD सह Azure रिसोर्स व्यवस्थापन | 45 मिनिटे |
| 2 | [Deployment Guide](deployment-guide.md) | अनुप्रयोग डिप्लॉयमेंट धोरणे | 45 मिनिटे |
| 3 | [Authoring Your Own Template](custom-templates.md) | पुनर्वापर करण्याजोगे azd टेम्पलेट तयार व प्रकाशित करा | 30 मिनिटे |

---

## 🚀 Quick Start

```bash
# साच्यावरून सुरुवात करा
azd init --template azure-functions-python-v2-http

# काय तयार होणार आहे हे पूर्वावलोकन करा
azd provision --preview

# फक्त पूर्वसंरचना तयार करा
azd provision

# फक्त कोड तैनात करा
azd deploy

# किंवा दोन्ही एकत्र
azd up
```

---

## 📁 AZD Project Structure

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Essential Commands

| Command | Description |
|---------|-------------|
| `azd init` | प्रोजेक्ट सुरू करा |
| `azd provision` | Azure रिसोर्सेस तयार करा |
| `azd deploy` | ऍप्लिकेशन कोड डिप्लॉय करा |
| `azd up` | प्रोव्हिजन + डिप्लॉय |
| `azd down` | सर्व रिसोर्सेस हटवा |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Next** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Related Resources

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->