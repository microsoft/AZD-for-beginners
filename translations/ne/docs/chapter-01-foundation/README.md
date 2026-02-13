# अध्याय 1: आधार र छिटो सुरु

**📚 पाठ्यक्रम**: [AZD For Beginners](../../README.md) | **⏱️ अवधि**: 30-45 मिनेट | **⭐ कठिनाइ**: शुरुवाती

---

## अवलोकन

यस अध्यायले Azure Developer CLI (azd) का आधारभूत कुरा परिचय गराउँछ। तपाईंले मुख्य अवधारणाहरू सिक्नुहुनेछ, उपकरणहरू इन्स्टल गर्नुहुनेछ, र Azure मा तपाईंको पहिलो अनुप्रयोग तैनाथ गर्नुहुनेछ।

## अधिगम लक्ष्यहरू

यस अध्याय पूरा गरेपछि, तपाईंले:
- Azure Developer CLI के हो र यो Azure CLI भन्दा कसरी फरक छ बुझ्नुहुनेछ
- तपाईंको प्लेटफर्ममा AZD इन्स्टल र कन्फिगर गर्नुहोस्
- `azd up` प्रयोग गरेर Azure मा तपाईंको पहिलो अनुप्रयोग तैनाथ गर्नुहोस्
- `azd down` प्रयोग गरेर स्रोतहरू सफा गर्नुहोस्

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [AZD Basics](azd-basics.md) | मुख्य अवधारणाहरू, शब्दावली, र परियोजना संरचना | 15 मिनेट |
| 2 | [Installation & Setup](installation.md) | प्लेटफर्म-विशिष्ट इन्स्टलेशन मार्गदर्शिका | 10 मिनेट |
| 3 | [Your First Project](first-project.md) | व्यावहारिक: Azure मा वेब एप तैनाथ गर्नुहोस् | 20 मिनेट |

---

## 🚀 छिटो सुरु

```bash
# स्थापना जाँच गर्नुहोस्
azd version

# Azure मा लगइन गर्नुहोस्
azd auth login

# तपाईंको पहिलो अनुप्रयोग तैनाथ गर्नुहोस्
azd init --template todo-nodejs-mongo
azd up

# समाप्त भएपछि सफा गर्नुहोस्
azd down --force --purge
```

---

## ✅ सफलता मापदण्ड

यस अध्याय पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:

```bash
azd version              # स्थापित संस्करण देखाउँछ
azd init --template todo-nodejs-mongo  # परियोजना प्रारम्भ गर्छ
azd up                   # Azure मा परिनियोजन गर्छ
azd show                 # चलिरहेको अनुप्रयोगको URL देखाउँछ
azd down --force --purge # संसाधनहरू सफा गर्छ
```

---

## 🔗 नेभिगेसन

| Direction | Chapter |
|-----------|---------|
| **Next** | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Skip to** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossary](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौँ, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा असंगतता हुनसक्छ। मूल दस्तावेज त्यसको मूल भाषामा नै प्राधिकृत स्रोतको रूपमा मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिश गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलत बुझाइ वा गलत व्याख्याको लागि हामी जिम्मेवार हुनेछैनौँ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->