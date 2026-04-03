# स्थापना आणि सेटअप मार्गदर्शक

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 सध्याचा अध्याय**: Chapter 1 - Foundation & Quick Start
- **⬅️ मागील**: [AZD Basics](azd-basics.md)
- **➡️ पुढील**: [Your First Project](first-project.md)
- **🚀 पुढील अध्याय**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

हे सर्वसमावेशक मार्गदर्शन तुमच्या सिस्टमवर Azure Developer CLI (azd) स्थापित करण्याच्या आणि कॉन्फिगर करण्याच्या प्रक्रियेचे पाऊल-पाय़लाने मार्गदर्शन करेल. तुम्हाला विविध ऑपरेटिंग सिस्टिमसाठी अनेक प्रतिष्ठापन पद्धती, प्रमाणीकरण सेटअप, आणि Azure तैनातीसाठी तुमच्या विकास पर्यावरणाचे प्रारंभिक कॉन्फिगरेशन कसे करायचे हे शिकवले जाईल.

## शिकण्याची उद्दिष्टे

या धड्याच्या शेवटी, तुम्ही:
- तुमच्या ऑपरेटिंग सिस्टीमवर यशस्वीरित्या Azure Developer CLI इन्स्टॉल केलेले असेल
- विविध पद्धती वापरून Azure सह प्रमाणीकरण कॉन्फिगर केलेले असेल
- आवश्यक पूर्वअटींसह तुमचे विकास पर्यावरण सेट केलेले असेल
- वेगवेगळ्या इंस्टॉलेशन पर्यायांना आणि त्यांचा वापर कधी करायचा हे समजलेले असेल
- सामान्य इंस्टॉलेशन आणि सेटअप समस्या मिटवता येतील

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यावर, तुम्ही सक्षम असाल:
- तुमच्या प्लॅटफॉर्मसाठी योग्य पद्धतीने azd इन्स्टॉल करणे
- azd auth login वापरून Azure शी प्रमाणीकरण करणे
- तुमची इन्स्टॉलेशन सत्यापित करणे आणि मूलभूत azd कमांड्सची चाचणी करणे
- azd चा अनुकूल वापर करण्यासाठी तुमचे विकास पर्यावरण कॉन्फिगर करणे
- सामान्य इंस्टॉलेशन समस्या स्वावलंबीपणे सुटवणे

हा मार्गदर्शक तुमच्या ऑपरेटिंग सिस्टीम किंवा विकास वातावरण कोणते असले तरी तुमच्या सिस्टमवर Azure Developer CLI इन्स्टॉल आणि कॉन्फिगर करण्यात मदत करेल.

## पूर्वअटी

azd इन्स्टॉल करण्यापूर्वी, खात्री करा की तुमच्याकडे आहे:
- **Azure सदस्यता** - [फ्री अकाउंट तयार करा](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण आणि रिसोर्स व्यवस्थापनासाठी
- **Git** - टेम्पलेट क्लोन करण्यासाठी आणि व्हर्जन कंट्रोलसाठी
- **Docker** (ऐच्छिक) - कंटेनराइज्ड अॅप्लिकेशन्ससाठी

## स्थापना पद्धती

### Windows

#### पर्याय 1: Windows Package Manager (शिफारसीय)
```cmd
winget install microsoft.azd
```

#### पर्याय 2: PowerShell इंस्टॉल स्क्रिप्ट
```powershell
# विंगेट उपलब्ध नसल्यास उपयुक्त
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### पर्याय 3: Chocolatey
```cmd
choco install azd
```

#### पर्याय 4: मॅन्युअल स्थापना
1. नवीनतम रिलीज [GitHub](https://github.com/Azure/azure-dev/releases) वरून डाउनलोड करा
2. `C:\Program Files\azd\` मध्ये एक्स्ट्रॅक्ट करा
3. PATH पर्यावरणीय चलामध्ये जोडा

### macOS

#### पर्याय 1: Homebrew (शिफारसीय)
```bash
brew tap azure/azd
brew install azd
```

#### पर्याय 2: इंस्टॉल स्क्रिप्ट
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### पर्याय 3: मॅन्युअल स्थापना
```bash
# डाउनलोड करा आणि स्थापित करा
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### पर्याय 1: इंस्टॉल स्क्रिप्ट (शिफारसीय)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### पर्याय 2: पॅकेज मॅनेजर्स

**रिलीज आर्टिफॅक्ट्समधून मॅन्युअल इंस्टॉलेशन:**
```bash
# आपल्या Linux आर्किटेक्चरसाठी नवीनतम आर्काइव्ह खालील ठिकाणाहून डाउनलोड करा:
# https://github.com/Azure/azure-dev/releases
# नंतर ते काढून घ्या आणि azd बायनरी आपल्या PATH मध्ये जोडा.
```

### GitHub Codespaces

काही Codespaces आणि डेव्ह कंटेनर पर्यावरणांमध्ये पूर्वीपासूनच `azd` समाविष्ट असते, परंतु गृहित धरण्याऐवजी तुम्ही ते सत्यापित केले पाहिजे:

```bash
azd version
```

जर `azd` अनुपस्थित असेल, तर त्या पर्यावरणासाठी मानक स्क्रिप्टने ते इन्स्टॉल करा.

### Docker

```bash
# azd कंटेनरमध्ये चालवा
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# सुलभ वापरासाठी एक उपनाम तयार करा
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ स्थापना सत्यापित करा

स्थापनेनंतर, azd योग्यरित्या कार्य करत आहे का ते सत्यापित करा:

```bash
# आवृत्ती तपासा
azd version

# मदत पहा
azd --help

# उपलब्ध टेम्पलेट्सची यादी करा
azd template list
```

अपेक्षित आउटपुट:
```
azd version 1.x.x (commit xxxxxx)
```

**नोट**: वास्तविक आवृत्ती क्रमांक वेगळा असू शकतो. नवीनतम आवृत्ती साठी [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) तपासा.

**✅ स्थापना यशाची चेकलिस्ट:**
- [ ] `azd version` त्रुटीशिवाय आवृत्ती क्रमांक दाखवतो
- [ ] `azd --help` कमांड दस्तऐवज दाखवते
- [ ] `azd template list` उपलब्ध टेम्पलेट्स दर्शवते
- [ ] तुम्ही एक टेस्ट डिरेक्टरी तयार करून `azd init` यशस्वीरित्या चालवू शकता

**जर सर्व चेक्स पास झाले तर, तुम्ही [Your First Project](first-project.md) कडे पुढे जाण्यास तयार आहात!**

## प्रमाणीकरण सेटअप

### नवशिक्यांसाठी शिफारसीय सेटअप

AZD-प्रथम वर्कफ्लोजसाठी, `azd auth login` ने साइन इन करा.

```bash
# azd up सारख्या AZD कमांडसाठी आवश्यक
azd auth login

# AZD प्रमाणीकरण स्थिती सत्यापित करा
azd auth login --check-status
```

कोर्स दरम्यान तुम्ही स्वतः `az` कमांड्स चालवण्याचा विचार करत असाल तेव्हाच Azure CLI साइन-इन वापरा.

### Azure CLI प्रमाणीकरण (ऐच्छिक)
```bash
# जर आधीपासून स्थापित नसेल तर Azure CLI स्थापित करा
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: आपल्या वितरणासाठी Azure CLI इंस्टॉल दस्तऐवज पहा

# Azure मध्ये लॉगिन करा
az login

# प्रमाणीकरण सत्यापित करा
az account show
```

### तुम्ही कोणता साइन-इन फ्लो वापरला पाहिजे?

- तुम्ही जर नवशिक्या AZD मार्गाचे अनुसरण करत असाल आणि मुख्यतः `azd` कमांड्स चालवत असाल तर `azd auth login` वापरा.
- तुम्हाला Azure CLI कमांड्स जसे की `az account show` चालवायच्या असतील किंवा रिसोर्सेस थेट तपासायचे असतील तर `az login` देखील वापरा.
- जर एखाद्या व्यायामात दोन्ही `azd` आणि `az` कमांड्स समाविष्ट असतील, तर सुरुवातीला एकदाच दोन्ही साइन-इन कमांड्स चालवा.

### Device Code Authentication
जर तुम्ही हेडलेस सिस्टमवर आहात किंवा ब्राउझर समस्यांचा सामना करत असाल:
```bash
azd auth login --use-device-code
```

### Service Principal (CI/CD)
ऑटोमेटेड वातावरणांसाठी:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### तुमचे पूर्ण सेटअप प्रमाणित करा

Chapter 1 सुरू करण्यापूर्वी जर तुम्हाला जलद रेडीनेस चेक करायचा असेल:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## कॉन्फिगरेशन

### जागतिक कॉन्फिगरेशन
```bash
# पूर्वनिर्धारित सदस्यता सेट करा
azd config set defaults.subscription <subscription-id>

# पूर्वनिर्धारित स्थान सेट करा
azd config set defaults.location eastus2

# सर्व कॉन्फिगरेशन पहा
azd config show
```

### पर्यावरण चल
तुमच्या शेल प्रोफाइलमध्ये जोडा (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure कॉन्फिगरेशन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd कॉन्फिगरेशन
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # डिबग लॉगिंग सक्षम करा
```

## IDE एकत्रीकरण

### Visual Studio Code
Azure Developer CLI विस्तार इंस्टॉल करा:
1. VS Code उघडा
2. Extensions (Ctrl+Shift+X) वर जा
3. "Azure Developer CLI" शोधा
4. विस्तार इंस्टॉल करा

वैशिष्ट्ये:
- azure.yaml साठी IntelliSense
- इंटीग्रेटेड टर्मिनल कमांड्स
- टेम्पलेट ब्राउझिंग
- डिप्लॉयमेंट मॉनिटरिंग

### GitHub Codespaces
`.devcontainer/devcontainer.json` तयार करा:
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Azure प्लगइन इंस्टॉल करा
2. Azure क्रेडेन्शियल कॉन्फिगर करा
3. azd कमांड्ससाठी इंटीग्रेटेड टर्मिनल वापरा

## 🐛 स्थापना त्रुटी निवारण

### सामान्य समस्या

#### अनुमती नाकारली (Windows)
```powershell
# PowerShell प्रशासक म्हणून चालवा
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्या
हाताने azd तुमच्या PATH मध्ये जोडा:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### नेटवर्क/प्रॉक्सी समस्या
```bash
# प्रॉक्सी कॉन्फिगर करा
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL पडताळणी वगळा (उत्पादनासाठी शिफारस नाही)
azd config set http.insecure true
```

#### आवृत्ती संघर्ष
```bash
# जुने इंस्टॉलेशन्स काढा
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: पुन्हा स्थापित करण्यापूर्वी मागील azd बायनरी किंवा सिम्बॉलिक लिंक काढा

# कॉन्फिगरेशन साफ करा
rm -rf ~/.azd
```

### अधिक मदत मिळविणे
```bash
# डिबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd <command> --debug

# सध्याचे कॉन्फिगरेशन पहा
azd config show

# सध्याच्या तैनातीची स्थिती पहा
azd show
```

## azd अद्यतनित करा

### अपडेट तपासणी
azd नवीन रिलीज उपलब्ध असल्यास इशारा देते, आणि तुम्ही तुमचा सध्याचा बिल्ड खालीलप्रमाणे पुष्टी करू शकता:
```bash
azd version
```

### मॅन्युअल अपडेट्स

**Windows (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (Homebrew):**
```bash
brew upgrade azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 वारंवार विचारले जाणारे प्रश्न

<details>
<summary><strong>azd आणि az CLI मध्ये काय फरक आहे?</strong></summary>

**Azure CLI (az)**: वैयक्तिक Azure संसाधने व्यवस्थापित करण्यासाठी कमी-स्तरीय साधन
- `az webapp create`, `az storage account create`
- एकावेळी एका संसाधनावर काम
- इन्फ्रास्ट्रक्चर व्यवस्थापनावर लक्ष

**Azure Developer CLI (azd)**: संपूर्ण अॅप्लिकेशन तैनातींसाठी उच्च-स्तरीय साधन
- `azd up` संपूर्ण अॅप आणि सर्व रिसोर्सेस तैनात करते
- टेम्पलेट-आधारित वर्कफ्लोज
- विकासक उत्पादकता केंद्रित

**तुम्हाला दोन्ही आवश्यक आहेत**: azd प्रमाणीकरणासाठी az CLI वापरते
</details>

<details>
<summary><strong>मी azd विद्यमान Azure रिसोर्सेससह वापरू शकतो का?</strong></summary>

होय! तुम्ही करू शकता:
1. विद्यमान रिसोर्सेस azd पर्यावरणात इम्पोर्ट करा
2. तुमच्या Bicep टेम्पलेट्समध्ये विद्यमान रिसोर्सेस संदर्भित करा
3. विद्यमान इन्फ्रास्ट्रकचरसोबत नवीन तैनातींसाठी azd वापरा

सविस्तर माहिती साठी बघा [Configuration Guide](configuration.md).
</details>

<details>
<summary><strong>azd Azure Government किंवा Azure China सोबत काम करते का?</strong></summary>

होय, क्लाउड कॉन्फिगर करा:
```bash
# Azure सरकार
az cloud set --name AzureUSGovernment
az login

# Azure चीन
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>मी azd CI/CD पाइपलाइन्समध्ये वापरू शकतो का?</strong></summary>

नक्कीच! azd ऑटोमेशनसाठी डिझाइन केले आहे:
- GitHub Actions इंटीग्रेशन
- Azure DevOps समर्थन
- सेवा प्रिन्सिपल प्रमाणीकरण
- नॉन-इंटरॅक्टिव्ह मोड

CI/CD पॅटर्नसाठी पहा [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md).
</details>

<details>
<summary><strong>azd वापरण्याचा खर्च किती आहे?</strong></summary>

azd स्वतः **पूर्णपणे विनामूल्य** आणि ओपन-सोर्स आहे. तुम्हाला फक्त खालील गोष्टींसाठी पैसे द्यावे लागतात:
- तुम्ही जे Azure रिसोर्सेस तैनात करता त्यांची किंमत
- Azure वापरासंबंधी खर्च (compute, storage, इ.)

तैनातीपूर्वी `azd provision --preview` वापरून अंदाजित खर्च तपासा.
</details>

## पुढील पावले

1. **प्रमाणीकरण पूर्ण करा**: तुमच्या Azure सदस्यत्वात प्रवेश करू शकता याची खात्री करा
2. **तुमची पहिली तैनाती प्रयत्न करा**: [First Project Guide](first-project.md) अनुसरा
3. **टेम्पलेट्स एक्सप्लोर करा**: `azd template list` ने उपलब्ध टेम्पलेट ब्राउझ करा
4. **तुमचे IDE कॉन्फिगर करा**: तुमचे विकास पर्यावरण सेट करा

## समर्थन

तुम्हाला समस्या आढळल्यास:
- [ऑफिशियल डॉक्युमेंटेशन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्यांबद्दल रिपोर्ट करा](https://github.com/Azure/azure-dev/issues)
- [समुदाय चर्चा](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` वापरून तुमच्या एडिटरमध्ये थेट Azure कमांड मार्गदर्शन मिळवा

---

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 सध्याचा अध्याय**: Chapter 1 - Foundation & Quick Start
- **⬅️ मागील**: [AZD Basics](azd-basics.md) 
- **➡️ पुढील**: [Your First Project](first-project.md)
- **🚀 पुढील अध्याय**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ स्थापना पूर्ण!** azd सह बांधणी सुरू करण्यासाठी [Your First Project](first-project.md) कडे पुढे जा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला गेला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेतील त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत प्राधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी अनुवादाची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थनिर्वचनांसाठी आम्ही उत्तरदायी नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->