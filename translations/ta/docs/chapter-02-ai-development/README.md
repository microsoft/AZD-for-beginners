# அத்தியாயம் 2: AI-முதன்மை மேம்பாடு

**📚 பாடநெறி**: [தொடக்கர்களுக்கான AZD](../../README.md) | **⏱️ Duration**: 1-2 மணிநேரம் | **⭐ Complexity**: இடைநிலை

---

## கண்ணோட்டம்

இந்த அத்தியாயம் Azure Developer CLI மற்றும் Microsoft Foundry சேவைகளை பயன்படுத்தி AI-ஆல் இயக்கப்படும் பயன்பாடுகளை வெளியீடு செய்வதற்கு கவனம் செலுத்துகிறது. எளிய AI அரட்டை செயலிகளைப் பற்றி இருந்து கருவிகளுடன் கூடிய நுண்ணறிவு ஏஜென்டுகள் வரை கையாள்வது covered செய்கிறது.

## கற்றல் நோக்கங்கள்

By completing this chapter, you will:
- முன்னமைக்கப்பட்ட AZD டெம்ப்ளேட்களைப் பயன்படுத்தி AI பயன்பாடுகளை வெளியிடுதல்
- AZD உடன் Microsoft Foundry இன் ஒருங்கிணைப்பைப் புரிந்துகொள்ளுதல்
- கருவிகளைப் பயன்படுத்தி AI ஏஜென்டுகளை கட்டமைக்கவும் தனிப்பயனாக்கவும்
- RAG (Retrieval-Augmented Generation) பயன்பாடுகளை வெளியேற்றுதல்

---

## 📚 பாடங்கள்

| # | பாடம் | விளக்கம் | நேரம் |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry ஒருங்கிணைவு](microsoft-foundry-integration.md) | AZD ஐ Foundry சேவைகளுடன் இணைப்பு | 30 நிமிடம் |
| 2 | [AI ஏஜென்ட்கள் கையேடு](agents.md) | கருவிகளுடன் கூடிய நுண்ணறிவு ஏஜென்டுகளை வெளியிடுதல் | 45 நிமிடம் |
| 3 | [AI மாடல் வெளியேற்றல்](ai-model-deployment.md) | AI மாடல்களை வெளியிட்டு அமைத்தல் | 30 நிமிடம் |
| 4 | [AI பயிற்சி ஆய்வகம்](ai-workshop-lab.md) | கைவினை: உங்கள் AI தீர்வை AZD-க்கு தயாராக்கி கொள்ளுதல் | 60 நிமிடம் |

---

## 🚀 விரைவு தொடக்கம்

```bash
# விருப்பம் 1: RAG அரட்டை செயலி
azd init --template azure-search-openai-demo
azd up

# விருப்பம் 2: ஏ.ஐ. முகவர்கள்
azd init --template get-started-with-ai-agents
azd up

# விருப்பம் 3: அதிவேக அரட்டை செயலி
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 முக்கிய AI வடிவங்கள்

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ஆவண மேற்கோள்களுடன் RAG அரட்டை | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | கருவிகளுடன் கூடிய AI ஏஜென்ட் | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | அடிப்படை AI அரட்டை | OpenAI + Container Apps |

---

## 💰 செலவு விழிப்புணர்வு

| Environment | Estimated Monthly Cost |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**குறிப்பு:** பரிசோதனை முடிந்தபின் கட்டணங்களைத் தவிர்க்க `azd down` இயக்கவும்.

---

## 🔗 வழிசெலுத்தல்

| திசை | அத்தியாயம் |
|-----------|---------|
| **முந்தைய** | [அத்தியாயம் 1: அடித்தளம்](../chapter-01-foundation/README.md) |
| **அடுத்தது** | [அத்தியாயம் 3: அமைப்பு](../chapter-03-configuration/README.md) |
| **தவிர்த்து செல்** | [அத்தியாயம் 8: உற்பத்தி மாதிரிகள்](../chapter-08-production/README.md) |

---

## 📖 தொடர்புடைய வளங்கள்

- [AI பிரச்சினை தீர்வு](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [உற்பத்தி AI நடைமுறைகள்](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
பொறுப்பு மறுப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டது. நாங்கள் துல்லியத்திற்காக முயலுகின்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியக்குறைவுகள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். மூல ஆவணம் அதன் சொந்த (அச்சிடப்பட்ட) மொழியில் அதிகாரப்பூர்வமான ஆதாரமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்காக, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பின் பயன்பாட்டினால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களிற்கும் நாங்கள் பொறுப்பேற்கமுடியாது.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->