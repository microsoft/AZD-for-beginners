# AZD for AI டெவலப்பர்களுக்கான பயிற்சி

> [!IMPORTANT]  
> **இந்த பயிற்சி பயிற்சி வழிகாட்டியுடன் இணைக்கப்பட்டுள்ளது, மேலும் அதை உங்கள் உள்ளூரு உலாவியில் முன்னோட்டமாக பார்க்கலாம். தொடங்க, நீங்கள் repo-இல் GitHub Codespaces ஐத் திறக்க வேண்டும் — பின்னர் செயலில் இருக்கும் VS Code டெர்மினலைப் பார்க்கும் வரை காத்திருந்து টাইப் செய்யுங்கள்:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **உலாவியில் முன்னோட்ட பக்கத்தைத் திறக்க ஒரு பாப்அப் உரையாடல் காண வேண்டும்.**

Azure Developer CLI (AZD) கற்றுக்கொள்ள கைமுறை பயிற்சிக்கு வரவேற்கிறோம், குறிப்பாக AI பயன்பாட்டு வெளியீட்டில் கவனம் செலுத்தும் வகையில். இந்த பயிற்சி உங்களுக்கு AZD டெம்ப்ளேட்டுகளை 3 படிகளில் நடைமுறை விளக்கமாக புரிந்துகொள்ள உதவுகிறது:

1. **Discovery** - உங்களுக்கு பொருத்தமான டெம்ப்ளேட்டை கண்டறிதல்.
1. **Deployment** - பயன்பாட்டை நிறுவி அது வேலை செய்கிறதை சரிபார்த்தல்.
1. **Customization** - அதை உங்கள் தேவைக்கு ஏற்ப மாற்றி மீண்டும் முயற்சித்தல்!

இந்த பயிற்சியின் போது, நீங்கள் முக்கியமான டெவலப்பர் கருவிகள் மற்றும் வேலைபாட்டு முறைகளைப் பற்றியும் அறிந்துகொள்வீர்கள், இது உங்கள் தொடக்கம் முதல் முடிவு வரை உள்ள டெவலப்மென்ட் பயணத்தை எளிதாக்க உதவும்.

| | | 
|:---|:---|
| **📚 பாடநெறி முகப்பு**| [AZD For Beginners](../README.md)|
| **📖 ஆவணம்** | [AI டெம்பிளேட்டுகளை தொடங்குவது](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 அடுத்த படிகள்** | [Take The Challenge](../../../../workshop/docs) |
| | |

## பயிற்சி மேலோட்டம்

**காலம்:** 3-4 மணி நேரம்  
**மட்டம்:** தொடக்கம் முதல் நடுத்தரம் வரை  
**முன் நிபந்தனைகள்:** Azure, AI கருத்துகள், VS Code மற்றும் கட்டளை வரி கருவிகளுடன் பரிச்சயம்.

இது ஒரு கைமுறை பயிற்சி ஆகும் — செய்வதன் மூலமே நீங்கள் கற்றுக்கொள்வீர்கள். பயிற்சிகளை முடித்த பின், Security மற்றும் Productivity சிறந்த நடைமுறைகள் பற்றி தொடர உங்கள் கற்றல் பயணத்தை விரிவுபடுத்த AZD For Beginners பாடத்திட்டத்தை பரிசீலிக்க பரிந்துரைக்கிறோம்.

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

## நீங்கள் கற்றுக்கொள்வது

AZD டெம்பிளேட்டை Microsoft Foundry இல் முடிவு முதல் முடிவு வரை கொண்டுவர பயன்படும் கற்கை மண்ணெடும்பாக கருதுங்கள். இந்த பயிற்சி முடிந்த பிறகு, நீங்கள் இந்த சூழ்நிலையில் பல கருவிகள் மற்றும் கருத்துக்களை உணர்ச்சிப்பூர்வமாக அறிந்திருப்பீர்கள்.

| கருத்து  | நோக்கம் |
|:---|:---|
| **Azure Developer CLI** | கருவி கட்டளைகள் மற்றும் வேலைபாடுகளை புரிந்துகொள்ளுதல்|
| **AZD Templates**| திட்டத்தின் கட்டமைப்பு மற்றும் கட்டமைவை புரிந்துகொள்ளுதல்|
| **Azure AI Agent**| Microsoft Foundry திட்டத்துக்காக ஒதுக்கீடு மற்றும் வெளியீடு செய்யுதல் |
| **Azure AI Search**| ஏஜென்ட்களுடன் context பொறியியலை இயக்கு |
| **Observability**| ட்ரேசிங், கண்காணிப்பு மற்றும் மதிப்பீடுகளை ஆய்வு செய்தல் |
| **Red Teaming**| எதிரி சோதனை மற்றும் போக்குகளைக் கண்டறிதல் |
| | |

## பயிற்சி அலகுகள்

தொடங்கத் தயாரா? பயிற்சி அலகுகளை வழிசெலுத்தவும்:

- [Module 1: Select AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: Validate AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: Deconstruct AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: Configure AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: Customize AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: Teardown Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Wrap-up & Next Steps](instructions/7-Wrap-up.md)

## கருத்துகள் உள்ளதா?

இந்த repo-இல் ஒரு issue பதிவிடுங்கள் (அதற்கு `Workshop` என குறிச்சொல்லை இடுங்கள்) அல்லது நமுடன் சேர [Discord](https://aka.ms/foundry/discord) இல் கலந்து, எங்கள் `#get-help` சேனலில் இடுகையிடுங்கள்

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு அறிவிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை Co-op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான பொருள் எடுத்துக்காட்டுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அதன் சொந்த மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்காக, தொழில்முறை மனித மொழிபெயர்ப்பை பரிந்துரைக்கிறோம். இந்த மொழிபெயர்ப்பைப் பயன்படுத்தியதால் ஏற்படும் எந்த தவறான புரிதல்களிற்கோ அல்லது தவறான விளக்கங்களிற்கோ நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->