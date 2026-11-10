# अध्याय ४: इन्फ्रास्ट्रक्चर ऐज कोड र डिप्लोयमेन्ट

**📚 कोर्स**: [AZD प्रारम्भकर्ताहरूका लागि](../../README.md) | **⏱️ अवधि**: २-३ घण्टा पढ्न; डिप्लोयमेन्ट अभ्यासहरूका लागि थप समयको अनुमति दिनुहोस् | **⭐ जटिलता**: मध्यम

---

## अवलोकन

यस अध्यायले Bicep टेम्प्लेटहरू, स्रोत व्यवस्थापन, र Azure Developer CLI प्रयोग गरी डिप्लोयमेन्ट रणनीतिहरू सहित इन्फ्रास्ट्रक्चर ऐज कोड (IaC) ढाँचाहरू समेट्छ।

> आदेश र कन्फिगरेसन समीक्षा लक्ष्य: `azd 1.37.2` (नोभेम्बर २०२६)। समीक्षा अवधिमा प्रत्यक्ष Azure स्रोत व्यवस्थापन गरिएको थिएन।

## सिकाइ लक्ष्यहरू

यो अध्याय पूरा गरेपछि तपाईले:
- Bicep टेम्प्लेट संरचना र व्याकरण बुझ्ने
- `azd provision` प्रयोग गरी Azure स्रोतहरू व्यवस्थापन गर्ने
- `azd deploy` प्रयोग गरी अनुप्रयोग तैनाथ गर्ने
- निलो-हरियो र रोलिङ डिप्लोयमेन्ट रणनीतिहरू कार्यान्वयन गर्ने

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [स्रोत व्यवस्थापन](provisioning.md) | AZD संग Azure स्रोत व्यवस्थापन | ४५ मिनेट |
| 2 | [डिप्लोयमेन्ट गाइड](deployment-guide.md) | अनुप्रयोग डिप्लोयमेन्ट रणनीतिहरू | ४५ मिनेट |
| 3 | [आफ्नो टेम्प्लेट लेखन](custom-templates.md) | पुन: प्रयोग हुने azd टेम्प्लेटहरू निर्माण र प्रकाशन | ३० मिनेट |

---

## 🚀 छिटो सुरु

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 AZD परियोजना संरचना

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

## 🔧 आवश्यक आदेशहरू

| आदेश | विवरण |
|---------|-------------|
| `azd init` | परियोजना सुरूवात |
| `azd provision` | Azure स्रोतहरू सिर्जना गर्नुहोस् |
| `azd deploy` | अनुप्रयोग कोड डिप्लोयमेन्ट गर्नुहोस् |
| `azd up` | व्यवस्थापन + डिप्लोयमेन्ट |
| `azd down` | सबै स्रोतहरू मेटाउनुहोस् |

---

## 🔗 नेभिगेसन

| दिशा | अध्याय |
|-----------|---------|
| **अघिल्लो** | [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/README.md) |
| **अर्को** | [अध्याय ५: बहु-एजेन्ट समाधानहरू](../chapter-05-multi-agent/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [प्री-डिप्लोयमेन्ट जाँचहरू](../chapter-06-pre-deployment/README.md)
- [कन्टेनर अनुप्रयोग उदाहरणहरू](../../examples/container-app/README.md)
- [डेटाबेस अनुप्रयोग उदाहरण](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->