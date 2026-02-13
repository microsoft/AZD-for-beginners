# 7. Wrap-Up & Next Steps

!!! tip "முக்கிய எடுத்துக்கொள்ள வேண்டிய செய்திகள்"

    - [ ] AZD templates AI பயன்பாடுகளை உருவாக்கும் நேரத்தை நாட்களிலிருந்து மணிநேரங்களுக்கு குறைக்க உதவுகின்றன
    - [ ] Discovery → Deployment → Customization முறைமை ஒரு கட்டமைக்கப்பட்ட கற்றல் பாதையை வழங்குகிறது
    - [ ] GitHub Copilot மற்றும் MCP சேவையகங்கள் சிக்கலான கோட்‌பேஸ்களை இயற்கை மொழியில் ஆய்வு செய்ய உதவுகின்றன
    - [ ] Microsoft Foundry அமைப்பில் உள்ள கண்காணிப்பு, மதிப்பீடு மற்றும் பாதுகாப்பு சோதனைகள் கிடைக்கின்றன

---

## 1. நீங்கள் என்ன சாதித்தீர்கள்

வாழ்த்துக்கள்! இந்த பட்டறையில், நீங்கள் வெற்றிகரமாக:

| Module | சாதனை |
|:---|:---|
| **Module 1** | Azure Developer CLI ஐ கண்டறிந்து ஒரு AI template தேர்ந்தெடுத்தீர்கள் |
| **Module 2** | ஒரு முழுமையான AI agents தீர்வை ஒதுக்கி சரிபார்த்தீர்கள் |
| **Module 3** | அச்சடையை பிரித்து அதன் கட்டமைப்பை புரிந்துகொண்டீர்கள் |
| **Module 4** | `azure.yaml` கட்டமைப்பு மற்றும் வாழ்க்கைச் சுழற்சி ஹுக்குகளை ஆராய்ந்தீர்கள் |
| **Module 5** | உங்கள் சொந்த சூழ்நிலைக்காக அச்சடையை தனிப்பயனாக்கினீர்கள் |
| **Module 6** | வளங்களை பாதுகாப்பாக அகற்றி மற்றும் நிர்வகித்தீர்கள் |

---

## 2. Key Concepts Mastered

### Azure Developer CLI (azd)
- `azd init` - templates இலிருந்து திட்டங்களை ஆரம்பிக்கவும்
- `azd up` - ஒரு கட்டளையில் வளங்களை ஒதுக்கு மற்றும் வெளியிடவும்
- `azd env` - சுற்றுச்சூழல் மாறிலிகளை நிர்வகிக்கவும்
- `azd down` - வளங்களை பாதுகாப்பாக சுத்தம் செய்யவும்

### AZD Template Structure
- `azure.yaml` - கட்டமைப்பு மற்றும் டெப்ளாய்மென்ட் ஹுக்‌கள்
- `infra/` - Bicep மூலம் உள்கட்டமைப்பு-எனும்-கோடு
- `src/` - செயலியின் மூலக்கோடு
- `scripts/` - தானியக்க மற்றும் தொடக்க ஸ்கிரிப்டுகள்

### Microsoft Foundry Capabilities
- திறமைமிக்க உதவிகளுக்கான AI Agent சேவை
- அறிவுத் தேடலுக்கான File Search மற்றும் Azure AI Search
- உள்ளமைக்கப்பட்ட டிரேசிங், கண்காணிப்பு மற்றும் மதிப்பீடு
- AI பாதுகாப்பு சோதனைகளுக்கான red teaming

---

## 3. Continue Your Learning Journey

### Recommended Next Steps

| Path | Resource | Time |
|:---|:---|:---|
| **Complete Course** | [AZD for Beginners Curriculum](../../README.md) | 8-12 மணி |
| **Try Another Template** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 மணி |
| **Deep Dive** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | தொடர்ந்து |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | இன்றே சேருங்கள்! |

### Suggested Templates to Try Next

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - உங்கள் தரவுடன் அடிப்படை உரையாடல்
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - முன்னேற்றமான RAG முறைமைகள்
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - நிறுவன சில்லறை பயன்பாட்டு காட்சிகள்

---

## 4. Workshop Challenge

உங்கள் திறமைகளை சோதிக்க தயாரா? இச்சவால்களை முயற்சி செய்யுங்கள்:

| Challenge | Description | Difficulty |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | வேறு ஒரு தொழில் (உதா., மருத்துவம், நிதி) க்காக வெளியிட்டு தனிப்பயனாக்குங்கள் | ⭐⭐ |
| **2. Custom Knowledge Base** | உங்கள் சொந்த தரவு கோப்புகளைச் சேர்த்து தனிப்பயன் தேடல் குறியீட்டை உருவாக்கவும் | ⭐⭐⭐ |
| **3. Production Deployment** | `azd pipeline config` பயன்படுத்தி GitHub Actions மூலம் CI/CD ஐ அமைக்கவும் | ⭐⭐⭐⭐ |

---

## 5. Share Your Feedback

உங்கள் கருத்து இந்த பட்டறையை மேம்படுத்த உதவும்!

- **GitHub Issues**: [Post feedback](https://github.com/microsoft/azd-for-beginners/issues) - `Workshop` என்ற குறிச்சொல்லுடன் குறியிடவும்
- **Discord**: சேர [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - `#get-help` இல் பதிவு செய்யவும்
- **Contributions**: பட்டறையை மேம்படுத்த pull requests சமர்ப்பிப்பதன் மூலம் உதவுங்கள்!

---

## நன்றி! 🎉

AZD for AI Developers பட்டறையை முடித்ததற்கு நன்றி. இந்த அனுபவம் உங்களுக்கு Azure இல் AI பயன்பாடுகளை உருவாக்கி வெளியிட தேவையான திறன்கள் மற்றும் நம்பிக்கையை வழங்கியிருக்குமென நம்புகிறோம்.

**தொடர்ந்து உருவாக்குங்கள், தொடர்ந்தும் கற்றுக்கொள்ளுங்கள், Azure AI டெவலப்பர் சமுதாயத்திற்கு வரவேற்பு!**

---

| | |
|:---|:---|
| **📚 Course Home** | [AZD For Beginners](../../README.md) |
| **📖 Documentation** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Community** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயன்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் தவறுகள் அல்லது不சரியான தகவல்கள் இருக்கக்கூடாது என்பதை தயவுசெய்து அவகாசிக்கவும். அதன் தாய்மொழியில் இருக்கும் அசல் ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பை பயன்படுத்துவதால் ஏற்பட்ட எந்தவொரு தவறான புரிதலும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->