# स्थापना आणि सेटअप मार्गदर्शिका

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD प्रारंभिकांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - पाया आणि जलद प्रारंभ
- **⬅️ Previous**: [AZD मूलभूत](azd-basics.md)
- **➡️ Next**: [आपला पहिला प्रकल्प](first-project.md)
- **🚀 Next Chapter**: [अध्याय 2: एआय-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

ही सर्वसमावेशक मार्गदर्शिका आपल्याला आपल्या सिस्टमवर Azure Developer CLI (azd) स्थापित आणि कॉन्फिगर करण्याच्या प्रक्रियेत मार्गदर्शन करेल. आपण वेगवेगळ्या ऑपरेटिंग सिस्टीमसाठी अनेक स्थापनेच्या पद्धती, प्रमाणीकरण सेटअप, आणि Azure तैनातीसाठी आपल्या विकास वातावरणाची प्राथमिक संरचना कशी करायची ते शिकाल.

## शिकण्याची उद्दिष्टे

या lessons च्या शेवटी, आपण:
- आपल्या ऑपरेटिंग सिस्टीमवर Azure Developer CLI यशस्वीरित्या स्थापित कराल
- अनेक पद्धती वापरून Azure सह प्रमाणीकरण कॉन्फिगर कराल
- आवश्यक पूर्वअटींसह आपल्या विकास वातावरणाची सेटअप कराल
- विविध स्थापना पर्याय समजून घेऊन कुठे कोणता वापरायचा ते ठरवाल
- सामान्य स्थापना आणि सेटअप समस्यांचे निवारण कराल

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, आपण सक्षम असाल:
- आपल्या प्लॅटफॉर्मसाठी योग्य पद्धत वापरून azd स्थापित करणे
- `azd auth login` वापरून Azure सह प्रमाणीकरण करणे
- आपल्या स्थापनेची पडताळणी करणे आणि मूलभूत azd आदेश चाचणी करणे
- azd सर्वोत्तम प्रकारे वापरण्यासाठी विकास वातावरण कॉन्फिगर करणे
- सामान्य स्थापना समस्यांचा स्वतंत्रपणे निवारण करणे

ही मार्गदर्शिका आपल्याला आपल्या ऑपरेटिंग सिस्टीम किंवा विकास वातावरण काय असो, आपल्या सिस्टमवर Azure Developer CLI स्थापित आणि कॉन्फिगर करण्यात मदत करेल.

## पूर्वआवश्यकता

azd स्थापित करण्याआधी, सुनिश्चित करा की आपल्याकडे आहे:
- **Azure सदस्यता** - [मुफ्त खाते तयार करा](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण आणि रिसोर्स व्यवस्थापनासाठी
- **Git** - टेम्पलेट क्लोन करणे आणि आवृत्ती नियंत्रणासाठी
- **Docker** (ऐच्छिक) - कंटेनरयुक्त अनुप्रयोगांसाठी

## स्थापित करण्याच्या पद्धती

### Windows

#### पर्याय 1: PowerShell (शिफारसीत)
```powershell
# प्रशासक म्हणून किंवा उच्च अधिकारांसह चालवा
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### पर्याय 2: Windows पॅकेज मॅनेजर (winget)
```cmd
winget install Microsoft.Azd
```

#### पर्याय 3: Chocolatey
```cmd
choco install azd
```

#### पर्याय 4: मॅन्युअल स्थापना
1. नवीनतम रिलीज [GitHub](https://github.com/Azure/azure-dev/releases) वरून डाउनलोड करा
2. `C:\Program Files\azd\` येथे एक्सट्रॅक्ट करा
3. PATH पर्यावरण चलात जोडा

### macOS

#### पर्याय 1: Homebrew (शिफारसीत)
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

#### पर्याय 1: इंस्टॉल स्क्रिप्ट (शिफारसीत)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### पर्याय 2: पॅकेज मॅनेजर्स

**Ubuntu/Debian:**
```bash
# Microsoft पॅकेज रिपॉझिटरी जोडा
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd स्थापित करा
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft पॅकेज रेपॉझिटरी जोडा
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces मध्ये पूर्वस्थापित येतो. फक्त एक codespace तयार करा आणि तत्काळ azd वापरायला सुरुवात करा.

### Docker

```bash
# azd कंटेनरमध्ये चालवा
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# सुलभ वापरासाठी एक उपनाम तयार करा
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ स्थापना तपासा

स्थापनेनंतर, azd योग्यरित्या कार्यरत आहे का ते तपासा:

```bash
# आवृत्ती तपासा
azd version

# मदत पहा
azd --help

# उपलब्ध साच्यांची यादी
azd template list
```

अपेक्षित आउटपुट:
```
azd version 1.x.x (commit xxxxxx)
```

**टीप**: वास्तविक आवृत्ती क्रमांक वेगळा असू शकतो. नवीनतम आवृत्तीसाठी [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) तपासा.

**✅ स्थापना यशाची तपासणी सूची:**
- [ ] `azd version` त्रुटीशिवाय आवृत्ती क्रमांक दर्शविते
- [ ] `azd --help` आदेशांचे दस्तऐवजीकरण दर्शविते
- [ ] `azd template list` उपलब्ध टेम्पलेट्स दाखवते
- [ ] `az account show` आपली Azure सदस्यता दर्शवते
- [ ] आपण एक चाचणी निर्देशिका तयार करून `azd init` यशस्वीरीत्या चालवू शकता

**जर सर्व तपासण्या उत्तीर्ण झाल्या, तर आपण [आपला पहिला प्रकल्प](first-project.md) वर पुढे जाण्यास तयार आहात!**

## प्रमाणीकरण सेटअप

### Azure CLI प्रमाणीकरण (शिफारसीत)
```bash
# Azure CLI आधीपासून स्थापित नसेल तर स्थापित करा
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure मध्ये लॉग इन करा
az login

# प्रमाणीकरण सत्यापित करा
az account show
```

### डिव्हाइस कोड प्रमाणीकरण
आपण हेडलेस सिस्टमवर असाल किंवा ब्राउझर समस्यांचा सामना करत असाल तर:
```bash
az login --use-device-code
```

### सर्व्हिस प्रिन्सिपल (CI/CD)
स्वयंचलित वातावरणांसाठी:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## कॉन्फिगरेशन

### जागतिक कॉन्फिगरेशन
```bash
# डिफॉल्ट सदस्यता सेट करा
azd config set defaults.subscription <subscription-id>

# डिफॉल्ट स्थान सेट करा
azd config set defaults.location eastus2

# सर्व कॉन्फिगरेशन पहा
azd config list
```

### पर्यावरण चल
आपल्या शेल प्रोफाइलमध्ये जोडा (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure कॉन्फिगरेशन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd कॉन्फिगरेशन
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # डीबग लॉगिंग सक्षम करा
```

## IDE एकत्रीकरण

### Visual Studio Code
Azure Developer CLI एक्स्टेन्शन इन्स्टॉल करा:
1. VS Code उघडा
2. Extensions (Ctrl+Shift+X) वर जा
3. "Azure Developer CLI" शोधा
4. एक्स्टेन्शन इन्स्टॉल करा

वैशिष्ट्ये:
- azure.yaml साठी IntelliSense
- एकत्रित टर्मिनल आदेश
- टेम्पलेट ब्राउझिंग
- तैनातीचे मोनिटरिंग

### GitHub Codespaces
एक `.devcontainer/devcontainer.json` तयार करा:
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
1. Azure प्लगइन इन्स्टॉल करा
2. Azure क्रेडेन्शियल्स कॉन्फिगर करा
3. azd आदेशांसाठी एकत्रित टर्मिनल वापरा

## 🐛 त्रुटी निवारण (स्थापना)

### सामान्य समस्या

#### परवानगी नाकारली (Windows)
```powershell
# PowerShell प्रशासक म्हणून चालवा
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्या
azd आपल्या PATH मध्ये मॅन्युअली जोडा:

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

# SSL पडताळणी वगळा (उत्पादनासाठी शिफारस केलेले नाही)
azd config set http.insecure true
```

#### आवृत्ती संघर्ष
```bash
# जुनी स्थापना काढा
# विंडोज: winget uninstall Microsoft.Azd
# मॅकओएस: brew uninstall azd
# लिनक्स: sudo apt remove azd

# कॉन्फिगरेशन साफ करा
rm -rf ~/.azd
```

### अधिक मदत मिळवणे
```bash
# डीबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd <command> --debug

# सध्याचे कॉन्फिगरेशन पहा
azd config list

# सध्याची तैनातीची स्थिती पहा
azd show
```

## azd अपडेट करणे

### स्वयंचलित अपडेट
azd आपल्याला अपडेट उपलब्ध असले असल्याचे सूचित करेल:
```bash
azd version --check-for-updates
```

### मॅन्युअल अपडेट

**Windows (winget):**
```cmd
winget upgrade Microsoft.Azd
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
<summary><strong>azd आणि az CLI यामध्ये काय फरक आहे?</strong></summary>

**Azure CLI (az)**: निम्न-स्तरीय साधन वैयक्तिक Azure रिसोर्सेस व्यवस्थापित करण्यासाठी
- `az webapp create`, `az storage account create`
- एकावेळी एक संसाधन
- इन्फ्रास्ट्रक्चर व्यवस्थापनावर लक्ष

**Azure Developer CLI (azd)**: पूर्ण अनुप्रयोग तैनातीसाठी उच्च-स्तरीय साधन
- `azd up` संपूर्ण अॅप सर्व रिसोर्सेससह तैनात करते
- टेम्पलेट-आधारित कार्यप्रवाह
- डेव्हलपर उत्पादकत्वावर लक्ष

**आपल्याला दोन्हींची गरज आहे**: azd प्रमाणीकरणासाठी az CLI वापरतो
</details>

<details>
<summary><strong>मी विद्यमान Azure संसाधनांसह azd वापरू शकतो का?</strong></summary>

होय! आपण करू शकता:
1. विद्यमान संसाधने azd वातावरणात इम्पोर्ट करा
2. आपल्या Bicep templates मध्ये विद्यमान संसाधनांचा संदर्भ घ्या
3. विद्यमान इन्फ्रास्ट्रक्चरसोबत नवीन तैनातीसाठी azd वापरा

सविस्तर माहितीसाठी [कॉन्फिगरेशन मार्गदर्शिका](configuration.md) पहा.
</details>

<details>
<summary><strong>azd Azure Government किंवा Azure China मध्ये काम करते का?</strong></summary>

होय, क्लाउड कॉन्फिगर करा:
```bash
# Azure सरकारी
az cloud set --name AzureUSGovernment
az login

# Azure चीन
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>मी CI/CD पाइपलाइनमध्ये azd वापरू शकतो का?</strong></summary>

नक्कीच! azd ऑटोमेशनसाठी डिझाइन केले गेले आहे:
- GitHub Actions एकत्रीकरण
- Azure DevOps समर्थन
- सर्व्हिस प्रिन्सिपल प्रमाणीकरण
- नॉन-इंटरॅक्टिव मोड

CI/CD पॅटर्नसाठी [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) पहा.
</details>

<details>
<summary><strong>azd वापरण्याचा खर्च किती आहे?</strong></summary>

azd स्वतः **पूर्णपणे मोफत** आणि ओपन-सोर्स आहे. आपण फक्त त्यासाठी पैसे द्यायला लागतात:
- आपण जे Azure संसाधने तैनात करता ती
- Azure वापराचे (compute, storage, इ.) खर्च

तैनात करण्यापूर्वी खर्चाचा अंदाज घेण्यासाठी `azd provision --preview` वापरा.
</details>

## पुढील पावले

1. **प्रमाणीकरण पूर्ण करा**: सुनिश्चित करा की आपण आपल्या Azure सदस्यतेपर्यंत प्रवेश करू शकता
2. **आपली पहिली तैनाती प्रयत्न करा**: [First Project Guide](first-project.md) चे अनुसरण करा
3. **टेम्पलेट्स एक्सप्लोर करा**: `azd template list` वापरून उपलब्ध टेम्पलेट ब्राउझ करा
4. **आपले IDE कॉन्फिगर करा**: आपले विकास वातावरण सेटअप करा

## समर्थन

जर आपल्याला समस्या आल्यास:
- [अधिकारिक दस्तऐवजीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्या नोंदवा](https://github.com/Azure/azure-dev/issues)
- [समुदाय चर्चा](https://github.com/Azure/azure-dev/discussions)
- [Azure समर्थन](https://azure.microsoft.com/support/)

---

**अध्याय नेव्हिगेशन:**
- **📚 Course Home**: [AZD प्रारंभिकांसाठी](../../README.md)
- **📖 Current Chapter**: अध्याय 1 - पाया आणि जलद प्रारंभ
- **⬅️ Previous**: [AZD मूलभूत](azd-basics.md) 
- **➡️ Next**: [आपला पहिला प्रकल्प](first-project.md)
- **🚀 Next Chapter**: [अध्याय 2: एआय-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ स्थापना पूर्ण!** [आपला पहिला प्रकल्प](first-project.md) वर पुढे जा आणि azd सह बांधणी सुरू करा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा अचूकतेच्या कमतरता असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत म्हणून विचारात घ्या. महत्त्वाच्या माहितीबाबत व्यावसायिक मानवी अनुवाद करण्याची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थलागीसाठी आम्ही जबाबदार नाहीत.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->