# अध्याय 5: बहु-एजेन्ट AI समाधान

**📚 पाठ्यक्रम**: [AZD For Beginners](../../README.md) | **⏱️ अवधी**: 2-3 घण्टा | **⭐ कठिनाई**: उन्नत

---

## अवलोकन

यस अध्यायले उन्नत बहु-एजेन्ट वास्तुकला ढाँचाहरू, एजेन्ट समन्वय, र जटिल परिदृश्यहरूको लागि उत्पादन-तैयार AI परिनियोजनहरू समेट्छ।

## सीख्ने उद्देश्यहरू

यस अध्याय पूरा गरेर, तपाईँले:
- बहु-एजेन्ट वास्तुकला ढाँचाहरू बुझ्ने
- समन्वयित AI एजेन्ट प्रणालीहरू परिनियोजन गर्ने
- एजेन्ट-देखि-एजेन्ट सञ्चार लागू गर्ने
- उत्पादन-तैयार बहु-एजेन्ट समाधानहरू निर्माण गर्ने

---

## 📚 पाठहरू

| # | पाठ | विवरण | समय |
|---|--------|-------------|------|
| 1 | [Retail Multi-Agent Solution](../../examples/retail-scenario.md) | पूर्ण कार्यान्वयन वाकथ्रु | 90 मिनेट |
| 2 | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) | एजेन्ट समन्वय रणनीतिहरू | 30 मिनेट |
| 3 | [ARM Template Deployment](../../examples/retail-multiagent-arm-template/README.md) | एक-क्लिक परिनियोजन | 30 मिनेट |

---

## 🚀 द्रुत सुरुवात

```bash
# खुद्रा बहु-एजेन्ट समाधान तैनाथ गर्नुहोस्
cd examples/retail-multiagent-arm-template
./deploy.sh

# वा ढाँचालाई सिधै प्रयोग गर्नुहोस्
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 बहु-एजेन्ट वास्तुकला

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 विशेष समाधान: खुद्रा बहु-एजेन्ट

The [Retail Multi-Agent Solution](../../examples/retail-scenario.md) demonstrates:

- **Customer Agent**: प्रयोगकर्ता अन्तरक्रिया र प्राथमिकताहरू व्यवस्थापन गर्छ
- **Inventory Agent**: स्टक र अर्डर प्रसोधन व्यवस्थापन गर्छ
- **Orchestrator**: एजेन्टहरू बीच समन्वय गर्छ
- **Shared Memory**: एजेन्ट-परस्पर प्रसंग व्यवस्थापन

### प्रयोग गरिएका सेवाहरू

| Service | Purpose |
|---------|---------|
| Azure OpenAI | भाषा बुझ्ने |
| Azure AI Search | उत्पादन सूची |
| Cosmos DB | एजेन्ट स्थिति र स्मृति |
| Container Apps | एजेन्ट होस्टिङ |
| Application Insights | अनुगमन |

---

## 🔗 नेभिगेसन

| Direction | Chapter |
|-----------|---------|
| **Previous** | [अध्याय 4: पूर्वाधार](../chapter-04-infrastructure/README.md) |
| **Next** | [अध्याय 6: पूर्व-परिनियोजन](../chapter-06-pre-deployment/README.md) |

---

## 📖 सम्बन्धित स्रोतहरू

- [AI Agents Guide](../chapter-02-ai-development/agents.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज एआई अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुनसक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारप्राप्त स्रोतको रूपमा मान्नुहोस्। महत्त्वपूर्ण जानकारीका लागि, पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। हामी यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा गलत व्याख्याको लागि जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->