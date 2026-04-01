# AZD for AI Developers Workshop

> 2026 மார்சில் `azd 1.23.12` மூலம் சோதிக்கப்பட்டது.

> [!IMPORTANT]  
> **இந்த பணிமுறை ஒரு வழிகாட்டுக் கையேடு மூலம் கருவூட்டப்பட்டுள்ளது, அதை உங்கள் உள்ளூர் உலாவியில் முன்னோட்டம் பார்க்கலாம். தொடங்க, repo-வை GitHub Codespaces‑இல், dev container‑இல், அல்லது MkDocs நிறுவப்பட்ட உள்ளூர் கிளோனில் திறக்கவும் — பின்னர் செயலில் உள்ள VS Code டெர்மினலை பார்க்கும் வரை காத்திருந்து தட்டச்சு செய்யவும்:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **உலாவியில் முன்னோட்டப் பக்கத்தை திறக்க ஒரு பாப்அப் பதிவை நீங்கள் காண்பீர்கள்.**

வழங்கப்படுகிற AZD (Azure Developer CLI) ஐ AI பயன்பாடுகள் உருவாக்கத்தில் பயன்படுத்த பயிற்சி பெற இந்த கைங்கர்யப் பயிற்சி வரவேற்கிறது. இந்த பணிமுறை AZD டெம்ப்ளேட்களை 3 படிகளால் செயல்திறனோடு புரிந்துகொள்ள உதவுகிறது:

1. **தேடல்** - உங்களுக்கு பொருத்தமான டெம்ப்ளேட்டை கண்டறிதல்.
1. **பதிவேற்றம்** - அமைத்து அதன் செயல்பாட்டை சரிபார்த்தல்.
1. **தனிப்பயனாக்கம்** - மாற்றங்கள் செய்து உங்கள் தேவைக்கு ஏற்ப உருவாக்கல்!

இந்த பணிமுறையின் போது, நீங்களும் முக்கியமான டெவலப்பர் கருவிகள் மற்றும் வேலைபாடுகள் தொடர்பாக அறிமுகம் பெற்றிருப்பீர்கள், இது உங்களின் முடிவில்-முடிவுப் படி வளர்ச்சியை எளிமைப்படுத்த உதவும்.

| | | 
|:---|:---|
| **📚 Course Home**| [AZD தொடக்கர்களுக்கான](../README.md)|
| **📖 Documentation** | [AI டெம்ப்ளேட்களுடன் துவங்குதல்](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry டெம்ப்ளேடுகள்](https://ai.azure.com/templates) |
|**🚀 Next Steps** | [சவாலை ஏற்றுக்கொள்ளுங்கள்](#workshop-challenge) |
| | |

## பணிமுறை கண்ணோட்டம்

**காலம்:** 3-4 மணி நேரம்  
**தரம்:** துவக்க நிலை முதல் நடுத்தர நிலை  
**முன் நிபந்தனைகள்:** Azure, AI கருத்துக்கள், VS Code மற்றும் கட்டளை வரிசை கருவிகளுடன் பரிச்சயம்.

இது செயலில் கற்று கொள்ளும் வகையிலான பணிமுறை; நீங்கள் செய்கிறதிலேயே கற்றுக் கொள்வீர்கள். பயிற்சி பயிற்சிகளை முடித்தவுடன், பாதுகாப்பு மற்றும் உற்பத்தித்திறன் சிறந்த நடைமுறைகளுக்கு தொடர AZD தொடக்கர்களுக்கான பாடத்திட்டத்தை மீண்டும் பரிசீலிக்க பரிந்துரைக்கப்படுகிறது.

| நேரம்| Module  | Objective |
|:---|:---|:---|
| 15 mins | Introduction | Set the stage, understand the goals |
| 30 mins | Select AI Template | Explore options and pick starter | 
| 30 mins | Validate AI Template | Deploy default solution to Azure |
| 30 mins | Deconstruct AI Template | Explore structure and configuration |
| 30 mins | Configure AI Template | Activate and try available features |
| 30 mins | Customize AI Template | Adapt the template to your needs |
| 30 mins | Teardown Infrastructure | Cleanup and release resources |
| 15 mins | Wrap-Up & Next Steps | Learning resources, Workshop challenge |
| | |

## நீங்கள் என்ன கற்றுக்கொள்வீர்கள்

AZD டெம்ப்ளேடை Microsoft Foundry இல் முடிவில்-முடிவாக உருவாக்க செயல்களைக் ஆய்வு செய்யும் கற்பனைக் கரைசல் (learning sandbox) என்று நினைக்கவும். இந்த பணிமுறை முடிவுக்கு வந்தபோது, இச் சூழலில் பயன்படுத்தப்படும் பல கருவிகள் மற்றும் கருத்துக்களுக்கு சிந்தனைமிகு உணர்வை நீங்கள் பெற்றிருப்பீர்கள்.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | கருவியின் கட்டளைகள் மற்றும் வேலைபாடுகளை அறிதல்|
| **AZD Templates**| திட்டத்தின் அமைப்பு மற்றும் கட்டமைப்பை புரிந்து கொள்வது|
| **Azure AI Agent**| Microsoft Foundry திட்டத்தை ஏற்பாடு செய்து பதிப்பேற்றுதல்  |
| **Azure AI Search**| ஏஜென்ட்களுடன் சூழ்நிலை பொறியியலை செயல்படுத்துதல் |
| **Observability**| டிரேசிங், கண்காணிப்பு மற்றும் மதிப்பீடுகளை ஆராய்தல் |
| **Red Teaming**| எதிர்மறை சோதனை மற்றும் தடுப்பு நடவடிக்கைகளை ஆராய்தல் |
| | |

## பணிமுறை தொகுதிகள்

தொடங்க தயாரா? பணிமுறை தொகுதிகளுக்குள் செல்லவும்:

- [Module 1: Select AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: Validate AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: Deconstruct AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: Configure AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: Customize AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: Teardown Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Wrap-up & Next Steps](instructions/7-Wrap-up.md)

## கருத்துக்கள் உள்ளதா?

இந்த repo-வில் ஒரு issue இடவும் (இதை `Workshop` என்று tag செய்யவும்) அல்லது [Discord](https://aka.ms/foundry/discord) இல் எங்களைச் சேர்ந்து `#get-help` சேனலில் பதிவிடவும்

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
இந்த ஆவணம் AI மொழிமாற்றுச் சேவையான [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சினாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான பொருள் இருக்கலாம் என்பதை தயவுசெய்து கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் உருவாகும் எந்த தவறான புரிதலுக்கோ அல்லது தவறான விளக்கங்களுக்கோ நாங்கள் பொறுப்பு ஏற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->