# 1. ஒரு டெம்ப்ளேட் தேர்ந்தெடுக்கவும்

!!! tip "இந்த தொகுப்பின் இறுதிக்குள் நீங்கள் قادر இருப்பீர்கள்"

    - [ ] AZD டெம்ப்ளேட்கள் என்ன என்பதை விளக்கவும்
    - [ ] AI-க்கான AZD டெம்ப்ளேட்களை கண்டறிந்து பயன்படுத்தவும்
    - [ ] AI Agents டெம்ப்ளேட்டுடன் தொடங்கவும்
    - [ ] **Lab 1:** GitHub Codespaces உடன் AZD Quickstart

---

## 1. ஒரு கட்டுமான ஒப்புமை

ஒரு நவீன நிறுவனத் தயாரான AI செயலியை _துவக்கத்திலிருந்து_ உருவாக்குவது பயமூட்டக்கூடும். இது உங்கள் புதிய வீடு ஒன்றை, செங்கல் ஒன்றாகக் கல் கொண்டு தனக்கே கட்டுவது போலவே இருக்கிறது. ஆம், அது செய்யக்கூடியது! ஆனால் நெறியாக வேண்டும் என்று நினைக்கப்படும் இறுதி முடிவை பெற இது சிறந்த வழி அல்ல!

பதிலாக, நாம் பெரும்பாலும் ஏற்கனவே உள்ள ஒரு _வடிவமைப்பு வரைபடத்துடன்_ ஆரம்பித்து, ஒரு ஆர்கிடெக்ட்டுடன் வேலைசெய்து அதை நமது தனிப்பட்ட தேவைகளுக்கு ஏற்ப தனிப்பயனாக்கிக் கொள்வோம். இந்த கணிக்கையான செயலிகளை உருவாக்கும்போது அதுவே சரியான அணுகுமுறை. முதலில், உங்கள் பிரச்சனை பகுதியுக்கு பொருந்தும் ஒரு நல்ல வடிவமைப்பு கட்டமைப்பைக் கண்டுபிடிக்கவும். பிறகு ஒரு தீர்வு ஆர்கிடெக்ட்டுடன் சேர்ந்து உங்கள் குறிப்பிட்ட சூழ்நிலைக்கு ஏற்ப அதை தனிப்பயனாக்கி வளர்க்கவும்.

ஆனால் இந்த வடிவமைப்பு வரைபடங்களை எங்கு காணலாம்? மேலும், இந்த வரைபடங்களை எவ்வாறு தனிச்செய்யவும் deploy செய்யவும் நமக்குத் திரும்பிச் சொல்லக் கூடிய ஒரு ஆர்கிடெக்ட்டைக் எப்படிச் சேமிக்கலாம்? இந்த வொர்க்ஷாபில், நாங்கள் இவற்றை மூன்று தொழில்நுட்பங்களை அறிமுகப்படுத்தி பதிலளிக்கிறோம்:

1. [Azure Developer CLI](https://aka.ms/azd) - உள்ளூரில் (build) தொடங்கி மேகத்தில் (ship) deploy செய்வதற்கான டெவலப்பர் பாதையை வேகப்படுத்தும் ஓபன்-சோர்ஸ் கருவி.
1. [Microsoft Foundry Templates](https://ai.azure.com/templates) - AI தீர்வு கட்டமைப்பை deploy செய்ய தேவையான உதாரணக் குறியீடு, கட்டமைப்பு மற்றும் கட்டமைப்பு கோப்புகள் கொண்ட ஸ்டேண்டர்டைஸ்ட்டு ஓபன்-சோர்ஸ் ரெப்பொசிடோரிகள்.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - Azure அறிவுபுரிய அடிப்படையில் கோட்படுத்தப்பட்ட ஒரு கோடிங் ஏஜன்ட், இது கோடு பயன்முறையை வழிநடத்தி மாற்றங்கள் செய்ய இயலாமை இயலுமையாக்கும் — இயல்பான மொழியைப் பயன்படுத்தி.

இந்த கருவிகள் இருந்தால், நாம் இப்போது சரியான டெம்ப்ளேட்டை _கண்டறிந்து_, அதைச் சரிபார்க்க deploy செய்து, மேலும் அதை நமது குறிப்பிட்ட சூழ்நிலைகளுக்கு ஏற்ப _தனிப்பயனாக்க_ செய்யலாம். இவை எப்படி வேலை செய்கிறன என்பதை கற்போம்.


---

## 2. Azure Developer CLI

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (or `azd`) என்பது உங்கள் குறியீட்டை மேகத்திற்கு கொண்டு செல்ல developer-இன் நடையை விரைவுபடுத்தும் ஒரு ஓபன்-சோர்ஸ் கமாந்த்-லைன் கருவி. இது உங்கள் IDE (development) மற்றும் CI/CD (devops) சூழ்நிலைகளில் ஒரே மாதிரியாக செயல்படும் developer-மக்களின் நடத்தை கூடிய சில கட்டளைகள் கொண்டுள்ளது.

With `azd`, your deployment journey can be as simple as:

- `azd init` - ஒரு உள்ளமைவான AZD டெம்ப்ளேட்டிலிருந்து புதிய AI திட்டத்தை 초기கிறது.
- `azd up` - ஒரு படியில் infrastructure-ஐ நியமித்து உங்கள் செயலியை deploy செய்கிறது.
- `azd monitor` - deploy செய்யப்பட்ட உங்கள் செயலிக்கான நேர்முக கண்காணிப்பு மற்றும் டயக்னோஸ்டிக்ஸ் பெறுங்கள்.
- `azd pipeline config` - Azure-க்குாப் deployment-ஐ தானாகச் செயற்கையான CI/CD பைப்லைன்களை அமைக்கவும்.

**🎯 | பயிற்சி**: <br/> உங்கள் GitHub Codespaces சூழலில் `azd` கமாண்ட்லைன் கருவியை இப்போது ஆராயுங்கள். கருவி என்ன செய்ய முடியும் என்பதைப் பார்க்க இந்த கட்டளையை தட்டச்சு செய்து ஆரம்பிக்கவும்:

```bash title="" linenums="0"
azd help
```

![செயல்முறை](../../../../../translated_images/ta/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. AZD டெம்ப்ளேட்

For `azd` to achieve this, it needs to know the infrastructure to provision, the configuration settings to enforce, and the application to deploy. This is where [AZD templates](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) come in. 

AZD டெம்ப்ளேட்கள் என்பது தீர்வு கட்டமைப்பை deploy செய்ய தேவையான உதாரணக் குறியீடு, கட்டமைப்பு மற்றும் கட்டமைப்பு கோப்புகளை இணைக்கும் ஓபன்-சோர்ஸ் ரெப்பொசிடோரிகள் ஆகும்.
_Infrastructure-as-Code_ (IaC) அணுகுமுறையைப் பயன்படுத்துவதன் மூலம், டெம்ப்ளேட் வள வரையறைகள் மற்றும் கட்டமைப்பு அமைப்புகளை ஆவணக் குறியீடு போலவே version-controller செய்து வைக்க முடிகிறது - இது திட்டத்தின் பயன்பாட்டாளர்களுக்கு மீளப் பயன்படுத்தக்கூடிய மற்றும் ஒரேபோல் செயல்திட்டங்களை உருவாக்குகிறது.

When creating or reusing an AZD template for _your_ scenario, consider these questions:

1. What are you building? → அந்த சூழ்நிலைக்கு ஆரம்பக் குறியீடு கொண்ட டெம்ப்ளேட் ஏதாவது இருக்கிறதா?
1. How is your solution architected? → தேவையான வளங்கள் உள்ள டெம்ப்ளேட் ஏதாவது இருக்கிறதா?
1. How is your solution deployed? → `azd deploy` உடன் முன்/பின் செயலாக்க ஹுக்குகளை நினைவில் கொள்ளுங்கள்!
1. How can you optimize it further? → கட்டமைக்கப்பட்ட கண்காணிப்பு மற்றும் தானியங்கி பைப்லைன்களைப் பற்றி யோசிக்கவும்!

**🎯 | பயிற்சி**: <br/> 
[Awesome AZD](https://azure.github.io/awesome-azd/) கலரியைப் பார்க்கவும் மற்றும் 250+ டெம்ப்ளேட்களில் உங்கள் தேவைகளை பொருந்தும் டெம்ப்ளேட்களை ஃபில்டர்கள் மூலம் ஆராயுங்கள். உங்கள் _சூழ்நிலைக்கு_ பொருந்தும் ஒன்றை கண்டுபிடிக்க முயற்சி செய்யுங்கள்.

![குறியீடு](../../../../../translated_images/ta/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. AI செயலி டெம்ப்ளேட்கள்

AI சக்தியூட்டப்பட்ட செயலிகளுக்கு, Microsoft **Microsoft Foundry** மற்றும் **Foundry Agents** இடம்பெறும் சிறப்பு டெம்ப்ளேட்களை வழங்குகிறது. இவை புத்திசாலி, தயாரிப்பு-தயாரான செயலிகளை கட்டுவதற்கான உங்கள் பாதையைக் குருதி செய்துத்துலக்குகின்றன.

### Microsoft Foundry & Foundry Agents டெம்ப்ளேட்கள்

கீழே உள்ள டெம்ப்ளேட்டில் ஒன்றை deploy செய்யத் தேர்ந்தெடுக்கவும். ஒவ்வொரு டெம்ப்ளேட்டும் [Awesome AZD](https://azure.github.io/awesome-azd/) இல் கிடைக்கும் மற்றும் ஒரு sèl கட்டளையால் 초기க்கலாம்.

| Template | Description | Deploy Command |
|----------|-------------|----------------|
| **[RAG உடன் AI உரையாடல்](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Microsoft Foundry-ஐ பயன்படுத்தி Retrieval Augmented Generation கொண்ட உரையாடல் செயலி | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent சேவை தொடக்கம்](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Foundry Agents மூலம் தானாக பணிகளை நிறைவேற்றும் AI முகவர்களை உருவாக்கவும் | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[பல முகவர் ஒருங்குப்பாடு](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | சிக்கலான வேலைநடப்புகளுக்காக பல Foundry Agents-ஐ ஒருங்கிணைக்கவும் | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI ஆவண நுண்ணறிவு](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Microsoft Foundry மாதிரிகளை பயன்படுத்தி ஆவணங்களை எடுத்து பகுப்பாய்வு செய்க | `azd init -t azure-samples/ai-document-processing` |
| **[உரையாடல் AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Microsoft Foundry ஒருங்கிணைப்புடன் புத்திசாலி உரையாடல் பாட்டுகளை உருவாக்கவும் | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI படம் உருவாக்கம்](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Microsoft Foundry மூலம் DALL-E பயன்படுத்தி படங்களை உருவாக்கவும் | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Foundry Agents உடன் Semantic Kernel பயன்படுத்தி AI முகவர்கள் | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen பல முகவர்](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | AutoGen கட்டமைப்பைப் பயன்படுத்தி பல-முகவர் அமைப்புகள் | `azd init -t azure-samples/autogen-multi-agent` |

### விரைவு துவக்கம்

1. **டெம்ப்ளேட்களை உலாவவும்**: [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) ஐப் பார்த்து `AI`, `Agents`, அல்லது `Microsoft Foundry` மூலம் ஃபில்டர் செய்யவும்
2. **உங்கள் டெம்ப்ளேட்டை தேர்ந்தெடுங்கள்**: உங்கள் பயன்பாட்டு வழக்கிற்கு பொருந்தும் ஒன்றைத் தேர்வு செய்யவும்
3. **இனிசியலைஸ் செய்யவும்**: தேர்ந்த டெம்ப்ளேட்டிற்காக `azd init` கட்டளையை இயக்கவும்
4. **Deploy செய்யவும்**: provision மற்றும் deploy செய்ய `azd up` ஐ இயக்கவும்

**🎯 | பயிற்சி**: <br/>
உங்கள் சூழ்நிலை அடிப்படையில் மேலே உள்ள டெம்ப்ளேடுகளில் ஒன்றை தேர்ந்தெடுக்கவும்:

- **ஒரு chatbot உருவாக்குகிறீர்களா?** → **RAG உடன் AI உரையாடல்** அல்லது **உரையாடல் AI Bot** மூலம் தொடங்கவும்
- **தானாக செயல்படும் முகவர்கள் வேண்டுமா?** → **Foundry Agent சேவை தொடக்கம்** அல்லது **பல முகவர் ஒருங்குப்பாடு** ஐ முயற்சிக்கவும்
- **ஆவணங்களை செயலாக்கவா?** → **AI ஆவண நுண்ணறிவு** ஐப் பயன்படுத்தவும்
- **AI குறியீடு உதவியை வேண்டுமா?** → **Semantic Kernel Agent** அல்லது **AutoGen பல முகவர்** ஐ ஆராயுங்கள்

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "மேலும் டெம்ப்ளேட்களை ஆராயுங்கள்"
    The [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) contains 250+ templates. Use the filters to find templates matching your specific requirements for language, framework, and Azure services.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
எச்சரிக்கை:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co-op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழியாக்கம் செய்யப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயலினாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அதன் சொந்த மொழியில் உள்ள அசல் ஆவணத்தை அதிகாரப்பூர்வ ஆதாரமாகக் கருத வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->