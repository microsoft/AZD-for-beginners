# स्थापना व सेटअप मार्गदर्शक

**अध्याय नेव्हीगेशन:**  
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)  
- **📖 चालू अध्याय**: अध्याय 1 - पाया आणि जलद प्रारंभ  
- **⬅️ मागील**: [AZD Basics](azd-basics.md)  
- **➡️ पुढील**: [Your First Project](first-project.md)  
- **🚀 पुढील अध्याय**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)  

## परिचय

हा व्यापक मार्गदर्शक तुमच्या सिस्टिमवर Azure Developer CLI (azd) कसे इन्स्टॉल आणि कॉन्फिगर करायचे हे शिकवेल. तुम्हाला विविध ऑपरेटिंग सिस्टीमसाठी एकापेक्षा जास्त इन्स्टॉलेशन पद्धती, प्रमाणीकरण सेटअप आणि प्रारंभिक कॉन्फिगरेशन शिकलं जाईल जेणेकरून तुम्हीAzure डेप्लॉयमेंटसाठी तुमचं विकास पर्यावरण तयार करू शकाल.

## शिक्षणाचे उद्दिष्टे

या धड्याच्या शेवटी तुम्ही:  
- तुमच्या ऑपरेटिंग सिस्टीमवर यशस्वीपणे Azure Developer CLI इन्स्टॉल करू शकाल  
- azure सह प्रमाणीकरण विविध पद्धतीने कॉन्फिगर करू शकाल  
- आवश्यक पूर्वतयारीसह तुमचं विकास पर्यावरण सेट करू शकाल  
- वेगवेगळ्या इन्स्टॉलेशन पर्याय समजून घेऊ शकाल आणि कोणता उपयोग कधी करायचा ते समजाल  
- सामान्य इन्स्टॉलेशन आणि सेटअप समस्यांचे निराकरण करू शकाल  

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यावर तुम्ही सक्षम असाल:  
- तुमच्या प्लॅटफॉर्मसाठी योग्य पद्धतीने azd इन्स्टॉल करणे  
- azd auth login वापरून Azure सह प्रमाणीकरण करणे  
- तुमची इन्स्टॉलेशन तपासणे आणि azd चे मूलभूत आदेश तपासणे  
- azd च्या सर्वोत्तम वापरासाठी तुमच्या विकास पर्यावरणाची कॉन्फिगरेशन करणे  
- सामान्य इन्स्टॉलेशन समस्या स्वयंचलित पद्धतीने सोडवणे  

हा मार्गदर्शक तुम्हाला कोणतीही ऑपरेटिंग सिस्टीम किंवा विकास पर्यावरण असो तरी Azure Developer CLI इन्स्टॉल व कॉन्फिगर करण्यात मदत करेल.

## पूर्वतयारी

azd इन्स्टॉल करण्यापूर्वी खात्री करा की:  
- **Azure सदस्यता** - [मुफ्त खाते तयार करा](https://azure.microsoft.com/free/)  
- **Azure CLI** - प्रमाणीकरण आणि स्रोत व्यवस्थापनासाठी  
- **Git** - टेम्पलेट क्लोनिंग आणि व्हर्जन कंट्रोलसाठी  
- **Docker** (पर्यायी) - कंटेनरायझ्ड अनुप्रयोगांसाठी  

## इन्स्टॉलेशनच्या पद्धती

### Windows

#### पर्याय 1: PowerShell (शिफारस केलेले)  
```powershell
# प्रशासक म्हणून किंवा वाढीव अधिकारांसह चालवा
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
  
#### पर्याय 4: मॅन्युअल इन्स्टॉलेशन  
1. [GitHub](https://github.com/Azure/azure-dev/releases) वरून नवीनतम आवृत्ती डाउनलोड करा  
2. `C:\Program Files\azd\` मध्ये एक्स्ट्रॅक्ट करा  
3. PATH पर्यावरणीय चलामध्ये जोडा  

### macOS

#### पर्याय 1: Homebrew (शिफारस केलेले)  
```bash
brew tap azure/azd
brew install azd
```
  
#### पर्याय 2: इन्स्टॉलेशन स्क्रिप्ट  
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```
  
#### पर्याय 3: मॅन्युअल इन्स्टॉलेशन  
```bash
# डाउनलोड करा आणि स्थापित करा
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```
  

### Linux

#### पर्याय 1: इन्स्टॉलेशन स्क्रिप्ट (शिफारस केलेले)  
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```
  
#### पर्याय 2: पॅकेज मॅनेजर्स

**Ubuntu/Debian:**  
```bash
# Microsoft पॅकेज रिझर्व्हर जोडाः
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd प्रतिष्ठापित करा
sudo apt-get update
sudo apt-get install azd
```
  
**RHEL/CentOS/Fedora:**  
```bash
# Microsoft पॅकेज संग्रह जोडा
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```
  

### GitHub Codespaces

GitHub Codespaces मध्ये azd आधीच इन्स्टॉल केलेले असते. फक्त एक कोडस्पेस तयार करा आणि लगेच azd वापरण्यास सुरुवात करा.

### Docker

```bash
# कंटेनरमध्ये azd चालवा
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# सुलभ वापरासाठी एक उपनाम तयार करा
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```
  

## ✅ इन्स्टॉलेशन तपासा

इन्स्टॉलेशननंतर, azd योग्यरित्या काम करत आहे का ते तपासा:

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
  
**टीप**: वास्तविक आवृत्ती संख्या वेगळी असू शकते. नवीनतम आवृत्ती पाहण्यासाठी [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) तपासा.

**✅ इन्स्टॉलेशन यश तपासणी सूचीत:**  
- [ ] `azd version` मध्ये कोणतीही त्रुटी न ठेवता आवृत्ती क्रमांक दिसणे  
- [ ] `azd --help` मध्ये आदेशांची माहिती दिसणे  
- [ ] `azd template list` यादीतील टेम्पलेट्स दाखवणे  
- [ ] `az account show` मध्ये तुमची Azure सदस्यता दिसणे  
- [ ] तुम्ही चाचणी डिरेक्टरी तयार करून `azd init` यशस्वीरित्या चालवू शकणे  

**जर सर्व तपासण्या यशस्वी असतील, तर [Your First Project](first-project.md) कडे पुढे जा!**

## प्रमाणीकरण सेटअप

### Azure CLI प्रमाणीकरण (शिफारस केलेले)  
```bash
# Azure CLI स्थापित करा जर आधीपासून स्थापित नसेल तर
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure मध्ये लॉगिन करा
az login

# प्रमाणीकरणाची पुष्टी करा
az account show
```
  
### डिव्हाइस कोड प्रमाणीकरण  
जर तुम्ही हेडलेस सिस्टीमवर असाल किंवा ब्राउझरमध्ये समस्या येत असतील:  
```bash
az login --use-device-code
```
  
### सेवा प्रिन्सिपल (CI/CD)  
स्वयंचलित वातावरणासाठी:  
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```
  

## कॉन्फिगरेशन

### ग्लोबल कॉन्फिगरेशन  
```bash
# पूर्वनिर्धारित सदस्यता सेट करा
azd config set defaults.subscription <subscription-id>

# पूर्वनिर्धारित स्थान सेट करा
azd config set defaults.location eastus2

# सर्व कॉन्फिगरेशन पहा
azd config list
```
  
### पर्यावरण चल (Environment Variables)  
तुमच्या शेल प्रोफाइलमध्ये जोडा (`.bashrc`, `.zshrc`, `.profile`):  
```bash
# Azure संरचना
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd संरचना
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # डीबग लॉगिंग सक्षम करा
```
  

## आयडीई इंटीग्रेशन

### Visual Studio Code  
Azure Developer CLI एक्स्टेंशन इन्स्टॉल करा:  
1. VS Code उघडा  
2. एक्स्टेंशन्स (Ctrl+Shift+X) ला जा  
3. "Azure Developer CLI" शोधा  
4. एक्स्टेंशन इन्स्टॉल करा  

वैशिष्ट्ये:  
- azure.yaml साठी IntelliSense  
- इंटीग्रेटेड टर्मिनल आदेश  
- टेम्पलेट ब्राउझिंग  
- डेप्लॉयमेंट मॉनिटरिंग  

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
2. Azure क्रेडेन्शियल कॉन्फिगर करा  
3. azd आदेशांसाठी इंटीग्रेटेड टर्मिनल वापरा  

## 🐛 इन्स्टॉलेशनमध्ये समस्या

### सामान्य समस्या

#### Permission Denied (Windows)  
```powershell
# PowerShell प्रशासक म्हणून चालवा
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```
  
#### PATH समस्या  
azd मद्ये PATH मध्ये मॅन्युअली जोडा:  

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
# जुने संस्थापने काढा
# विंडोज: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# लिनक्स: sudo apt remove azd

# संरचना स्वच्छ करा
rm -rf ~/.azd
```
  
### अधिक मदत मिळवणे  
```bash
# डीबग लॉगिंग सक्षम करा
export AZD_DEBUG=true
azd <command> --debug

# वर्तमान संरचना पाहा
azd config list

# वर्तमान वितरण स्थिती पाहा
azd show
```
  

## azd अपडेट करणे

### स्वयंचलित अपडेट्स  
azd तुमच्यासमोर अपडेट उपलब्ध असल्यास सूचित करेल:  
```bash
azd version --check-for-updates
```
  
### मॅन्युअल अपडेट्स  

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

**Azure CLI (az)**: वेगवेगळ्या Azure संसाधनांचे व्यवस्थापन करण्यासाठी कमी पातळीचे टूल  
- `az webapp create`, `az storage account create`  
- एकावेळी एकच संसाधन  
- इन्फ्रास्ट्रक्चर व्यवस्थापनावर लक्ष केंद्रित  

**Azure Developer CLI (azd)**: पूर्ण अनुप्रयोग वितरणासाठी उच्च पातळीचे टूल  
- `azd up` संपूर्ण अॅप आणि सर्व संसाधने डिप्लॉय करते  
- टेम्पलेट-आधारित वर्कफ्लोस  
- विकासक उत्पादनक्षमतेवर लक्ष केंद्रित  

**तुम्हाला दोन्हीची गरज आहे**: azd प्रमाणीकरणासाठी az CLI वापरते  
</details>  

<details>  
<summary><strong>मी azd विद्यमान Azure संसाधनांसह वापरू शकतो का?</strong></summary>  

होय! तुम्ही करू शकता:  
1. विद्यमान संसाधने azd पर्यावरणात इम्पोर्ट करा  
2. तुमच्या Bicep टेम्पलेट्समध्ये विद्यमान संसाधनांचा संदर्भ द्या  
3. विद्यमान इन्फ्रास्ट्रक्चरबरोबर नवीन डिप्लॉयमेंटसाठी azd वापरा  

तपशीलांसाठी [Configuration Guide](configuration.md) पाहा.  
</details>  

<details>  
<summary><strong>azd Azure Government किंवा Azure China सोबत चालतो का?</strong></summary>  

होय, क्लाऊड कॉन्फिगर करा:  
```bash
# अॅझ्युअर सरकार
az cloud set --name AzureUSGovernment
az login

# अॅझ्युअर चीन
az cloud set --name AzureChinaCloud
az login
```
</details>  

<details>  
<summary><strong>मी azd CI/CD पाइपलाईन्समध्ये वापरू शकतो का?</strong></summary>  

नक्कीच! azd स्वयंचलनासाठी डिझाइन केलेले आहे:  
- GitHub Actions समाकलन  
- Azure DevOps समर्थन  
- सेवा प्रिन्सिपल प्रमाणीकरण  
- नॉन-इंटरॅक्टिव मोड  

CI/CD पॅटर्नसाठी [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) पहा.  
</details>  

<details>  
<summary><strong>azd वापरण्याचा खर्च काय आहे?</strong></summary>  

azd स्वतः **पूर्णपणे मोफत** आणि ओपन सोर्स आहे. तुम्हाला फक्त वापरासाठी पैसे द्यावे लागतात:  
- तुम्ही जे Azure संसाधने डिप्लॉय करता ती  
- Azure वापर खर्च (कॉम्प्युट, स्टोरेज, इ.)  

डिप्लॉयमेंटपूर्वी खर्च अंदाजासाठी `azd provision --preview` वापरा.  
</details>  

## पुढील पावले

1. **प्रमाणीकरण पूर्ण करा**: सुनिश्चित करा की तुम्ही तुमच्या Azure सदस्यतेपर्यंत प्रवेश करू शकता  
2. **पहिली डिप्लॉयमेंट करा**: [First Project Guide](first-project.md) फॉलो करा  
3. **टेम्पलेट्स एक्सप्लोर करा**: `azd template list` वापरून उपलब्ध टेम्पलेट्स पहा  
4. **IDE कॉन्फिगर करा**: तुमचं विकास पर्यावरण सेट करा  

## समर्थन

जर तुम्हाला समस्या येत असतील:  
- [अधिकृत दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [समस्या नोंदवा](https://github.com/Azure/azure-dev/issues)  
- [समुदाय चर्चा](https://github.com/Azure/azure-dev/discussions)  
- [Azure समर्थन](https://azure.microsoft.com/support/)  
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - तुमच्या एडिटरमध्ये `npx skills add microsoft/github-copilot-for-azure` वापरून Azure कमांड मार्गदर्शन मिळवा  

---

**अध्याय नेव्हीगेशन:**  
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)  
- **📖 चालू अध्याय**: अध्याय 1 - पाया आणि जलद प्रारंभ  
- **⬅️ मागील**: [AZD Basics](azd-basics.md)  
- **➡️ पुढील**: [Your First Project](first-project.md)  
- **🚀 पुढील अध्याय**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)  

**✅ स्थापना पूर्ण!** azd वापरून बांधणी सुरू करण्यासाठी [Your First Project](first-project.md) कडे पुढे जा.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात घ्या की स्वयंचलित अनुवादांमध्ये चुका किंवा असत्यता असू शकतात. मूळ दस्तऐवज त्याच्या स्थानिक भाषेमध्ये अधिकृत स्रोत मानले जावे. महत्त्वाची माहिती साठी व्यावसायिक मानवी अनुवाद शिफारसीय आहे. या अनुवादाच्या वापरामुळे उद्भवलेल्या कोणत्याही गैरसमजुतींसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->