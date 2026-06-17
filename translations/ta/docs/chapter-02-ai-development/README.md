# அத்தியாயம் 2: செயற்கை நுண்ணறிவு-முதல் அபிவிருத்தி

**📚 பாடத்திட்டம்**: [AZD தொடக்கத்திற்கான](../../README.md) | **⏱️ கால அளவு**: 1-2 மணிநேரம் | **⭐ சிரமம்**: இடைநிலை

---

## கண்ணோட்டம்

இப்பத்தி Azure Developer CLI மற்றும் Microsoft Foundry சேவைகளைப் பயன்படுத்தி செயற்கை நுண்ணறிவு இயக்கவியல் செயலிகளை (AI-powered applications) орналுத்துவதில் கவனம் செலுத்துகிறது. எளிய AI உரையாடல் பயன்பாடுகளிலிருந்து கருவிகள் உடைய புத்திசாலி முகவர்கள் வரை.

> **சரிபார்க்கும் குறிப்பு (2026-06-15):** இந்த அத்தியாயத்தில் உள்ள கட்டளை சாதாரணம் மற்றும் நீட்சிப் பரிந்துரைகள் `azd` `1.25.6` மற்றும் தற்போதைய முன்னோட்ட AI முகவர் நீட்சிப் வெளியீடு `azure.ai.agents` `0.1.40-preview` ஐ எதிர்பார்த்து மதிப்பீடு செய்யப்பட்டன. நீங்கள் பழைய AZD கட்டுமானத்தில் இருந்தால், முதலில் புதுப்பித்து பிறகு பயிற்சிகளை தொடரவும்.

## கற்றல் நோக்கங்கள்

By completing this chapter, you will:
- முன்னமைக்கப்பட்ட AZD டெம்ப்ளேட்டுகளைப் பயன்படுத்தி AI செயலிகளை орналுத்துதல்
- Microsoft Foundry-இன் AZD உடன் ஒருங்கிணைப்பை புரிந்துகொள்ளுதல்
- கருவிகள் உடன் AI முகவர்களை அமைத்து தனிப்பயனாக்குதல்
- RAG (Retrieval-Augmented Generation) பயன்பாடுகளை орналுத்துதல்

---

## 📚 பாடங்கள்

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry ஒருங்கிணைப்பு](microsoft-foundry-integration.md) | AZD-ஐ Foundry சேவைகளுடன் இணைத்தல் | 30 நிமிடம் |
| 2 | [AI முகவர்கள் கையேடு](agents.md) | கருவிகள் உடன் புத்திசாலி முகவர்களை орналுத்துதல் | 45 நிமிடம் |
| 3 | [AI மாதிரி орналுத்துதல்](ai-model-deployment.md) | AI மாதிரிகளை орналுத்தி அமைத்தல் | 30 நிமிடம் |
| 4 | [AI பட்டறை பயிற்சி](ai-workshop-lab.md) | கைமுறை: உங்கள் AI தீர்வை AZD-க்கு தயார்செய்யவும் | 60 நிமிடம் |

---

## 🚀 துவக்கம் விரைவில்

```bash
# விருப்பம் 1: RAG சாட் செயலி
azd init --template azure-search-openai-demo
azd up

# விருப்பம் 2: ஏஐ முகவர்கள்
azd init --template get-started-with-ai-agents
azd up

# விருப்பம் 3: விரைவான சாட் செயலி
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 சிறப்பு AI டெம்பிளேட்டுகள்

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | சான்றுகளுடன் RAG உரையாடல் | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | கருவிகள் உடைய AI முகவர் | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | அடிப்படை AI உரையாடல் | OpenAI + Container Apps |

---

## 💰 செலவுக் கண்ணோட்டம்

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**குறிப்பு:** சோதனைக்கு பிறகு கட்டணங்களைத் தவிர்ப்பதற்காக `azd down` இயக்கவும்.

---

## 🔗 வழிசூচনা

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Next** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Skip to** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 சம்பந்தப்பட்ட வளங்கள்

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->