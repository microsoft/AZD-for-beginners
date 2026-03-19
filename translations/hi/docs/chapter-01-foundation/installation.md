# इंस्टॉलेशन और सेटअप गाइड

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - नींव और त्वरित प्रारंभ
- **⬅️ पिछला**: [AZD मूल बातें](azd-basics.md)
- **➡️ अगला**: [आपकी पहली परियोजना](first-project.md)
- **🚀 अगला अध्याय**: [अध्याय 2: एआई-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

यह व्यापक मार्गदर्शिका आपको आपके सिस्टम पर Azure Developer CLI (azd) इंस्टॉल और कॉन्फ़िगर करने के चरण-दर-चरण निर्देश देगी। आप विभिन्न ऑपरेटिंग सिस्टम के लिए कई इंस्टॉलेशन विधियाँ, प्रमाणीकरण सेटअप, और Azure पर डिप्लॉयमेंट के लिए अपने विकास परिवेश की प्रारंभिक कॉन्फ़िगरेशन सीखेंगे।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- अपने ऑपरेटिंग सिस्टम पर Azure Developer CLI सफलतापूर्वक स्थापित कर पाएंगे
- Azure के साथ प्रमाणीकरण को कई तरीकों से कॉन्फ़िगर कर पाएंगे
- आवश्यक पूर्व-आवश्यकताओं के साथ अपना विकास पर्यावरण सेट कर पाएंगे
- विभिन्न इंस्टॉलेशन विकल्पों और प्रत्येक के उपयोग के समय को समझ पाएंगे
- सामान्य इंस्टॉलेशन और सेटअप समस्याओं का समस्या निवारण कर पाएंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:
- अपने प्लेटफ़ॉर्म के लिए उपयुक्त विधि का उपयोग करके azd स्थापित करना
- azd auth login का उपयोग करके Azure के साथ प्रमाणीकृत करना
- अपनी इंस्टॉलेशन सत्यापित करना और बुनियादी azd कमांड्स का परीक्षण करना
- अनुकूल azd उपयोग के लिए अपनी विकास पर्यावरण को कॉन्फ़िगर करना
- सामान्य इंस्टॉलेशन समस्याओं का स्वतंत्र रूप से समाधान करना

यह मार्गदर्शिका आपको आपके ऑपरेटिंग सिस्टम या विकास परिवेश की परवाह किए बिना Azure Developer CLI इंस्टॉल और कॉन्फ़िगर करने में मदद करेगी।

## पूर्वापेक्षाएँ

azd इंस्टॉल करने से पहले, सुनिश्चित करें कि आपके पास है:
- **Azure सदस्यता** - [एक मुफ्त खाता बनाएँ](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण और संसाधन प्रबंधन के लिए
- **Git** - टेम्पलेट क्लोन करने और वर्शन कंट्रोल के लिए
- **Docker** (वैकल्पिक) - कंटेनरयुक्त एप्लिकेशन के लिए

## इंस्टॉलेशन विधियाँ

### Windows

#### विकल्प 1: PowerShell (अनुशंसित)
```powershell
# व्यवस्थापक के रूप में या उच्च विशेषाधिकारों के साथ चलाएँ
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### विकल्प 2: Windows पैकेज मैनेजर (winget)
```cmd
winget install Microsoft.Azd
```

#### विकल्प 3: Chocolatey
```cmd
choco install azd
```

#### विकल्प 4: मैनुअल इंस्टॉलेशन
1. GitHub से नवीनतम रिलीज़ डाउनलोड करें [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. PATH पर्यावरण चर में जोड़ें

### macOS

#### विकल्प 1: Homebrew (अनुशंसित)
```bash
brew tap azure/azd
brew install azd
```

#### विकल्प 2: इंस्टॉल स्क्रिप्ट
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प 3: मैनुअल इंस्टॉलेशन
```bash
# डाउनलोड और इंस्टॉल करें
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### विकल्प 1: इंस्टॉल स्क्रिप्ट (अनुशंसित)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प 2: पैकेज मैनेजर

**Ubuntu/Debian:**
```bash
# Microsoft पैकेज रिपॉजिटरी जोड़ें
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd स्थापित करें
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft पैकेज रिपॉजिटरी जोड़ें
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd पहले से GitHub Codespaces में इंस्टॉल आता है। केवल codespace बनाएं और तुरंत azd का उपयोग शुरू करें।

### Docker

```bash
# azd को एक कंटेनर में चलाएँ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# आसान उपयोग के लिए एक उपनाम बनाएँ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ इंस्टॉलेशन सत्यापित करें

इंस्टॉलेशन के बाद, सत्यापित करें कि azd सही ढंग से काम कर रहा है:

```bash
# संस्करण जांचें
azd version

# सहायता देखें
azd --help

# उपलब्ध टेम्पलेटों की सूची दिखाएँ
azd template list
```

अपेक्षित आउटपुट:
```
azd version 1.x.x (commit xxxxxx)
```

**नोट**: वास्तविक संस्करण संख्या अलग हो सकती है। नवीनतम संस्करण के लिए [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) जांचें।

**✅ इंस्टॉलेशन सफलता चेकलिस्ट:**
- [ ] `azd version` त्रुटियों के बिना संस्करण संख्या दिखाता है
- [ ] `azd --help` कमांड दस्तावेज़ दिखाता है
- [ ] `azd template list` उपलब्ध टेम्पलेट दिखाता है
- [ ] `az account show` आपकी Azure सदस्यता दिखाता है
- [ ] आप एक परीक्षण डायरेक्टरी बना सकते हैं और `azd init` सफलतापूर्वक चला सकते हैं

**यदि सभी जांचें पास हो जाती हैं, तो आप [आपकी पहली परियोजना](first-project.md) पर आगे बढ़ने के लिए तैयार हैं!**

## प्रमाणीकरण सेटअप

### Azure CLI प्रमाणीकरण (अनुशंसित)
```bash
# यदि पहले से स्थापित नहीं है तो Azure CLI स्थापित करें
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure में लॉग इन करें
az login

# प्रमाणीकरण सत्यापित करें
az account show
```

### डिवाइस कोड प्रमाणीकरण
यदि आप हेडलेस सिस्टम पर हैं या ब्राउज़र समस्याएँ हो रही हैं:
```bash
az login --use-device-code
```

### सर्विस प्रिंसिपल (CI/CD)
स्वचालित वातावरण के लिए:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## कॉन्फ़िगरेशन

### ग्लोबल कॉन्फ़िगरेशन
```bash
# डिफ़ॉल्ट सदस्यता सेट करें
azd config set defaults.subscription <subscription-id>

# डिफ़ॉल्ट स्थान सेट करें
azd config set defaults.location eastus2

# सभी कॉन्फ़िगरेशन देखें
azd config list
```

### पर्यावरण चर
अपने shell प्रोफ़ाइल (`.bashrc`, `.zshrc`, `.profile`) में जोड़ें:
```bash
# Azure कॉन्फ़िगरेशन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd कॉन्फ़िगरेशन
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # डिबग लॉगिंग सक्षम करें
```

## IDE एकीकरण

### Visual Studio Code
Azure Developer CLI एक्सटेंशन इंस्टॉल करें:
1. VS Code खोलें
2. Extensions पर जाएँ (Ctrl+Shift+X)
3. "Azure Developer CLI" खोजें
4. एक्सटेंशन इंस्टॉल करें

विशेषताएँ:
- azure.yaml के लिए IntelliSense
- इंटीग्रेटेड टर्मिनल कमांड्स
- टेम्पलेट ब्राउज़िंग
- डिप्लॉयमेंट मॉनिटरिंग

### GitHub Codespaces
एक `.devcontainer/devcontainer.json` बनाएं:
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
1. Azure प्लगइन इंस्टॉल करें
2. Azure क्रेडेंशियल्स कॉन्फ़िगर करें
3. azd कमांड्स के लिए इंटीग्रेटेड टर्मिनल का उपयोग करें

## 🐛 इंस्टॉलेशन समस्याएँ निवारण

### सामान्य समस्याएँ

#### अनुमति अस्वीकृत (Windows)
```powershell
# PowerShell को व्यवस्थापक के रूप में चलाएँ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्याएँ
मैन्युअली azd को अपने PATH में जोड़ें:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### नेटवर्क/प्रॉक्सी समस्याएँ
```bash
# प्रॉक्सी कॉन्फ़िगर करें
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL सत्यापन छोड़ें (उत्पादन के लिए अनुशंसित नहीं)
azd config set http.insecure true
```

#### संस्करण संघर्ष
```bash
# पुरानी इंस्टॉलेशनों को हटाएँ
# Windows: winget का उपयोग करके Microsoft.Azd अनइंस्टॉल करें
# macOS: brew का उपयोग करके azd अनइंस्टॉल करें
# Linux: sudo apt का उपयोग करके azd हटाएँ

# कॉन्फ़िगरेशन साफ़ करें
rm -rf ~/.azd
```

### अधिक मदद प्राप्त करना
```bash
# डिबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd <command> --debug

# वर्तमान कॉन्फ़िगरेशन देखें
azd config list

# वर्तमान तैनाती स्थिति देखें
azd show
```

## azd अपडेट करना

### स्वचालित अपडेट्स
जब अपडेट उपलब्ध होंगे तो azd आपको सूचित करेगा:
```bash
azd version --check-for-updates
```

### मैनुअल अपडेट्स

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

## 💡 अक्सर पूछे जाने वाले प्रश्न

<details>
<summary><strong>azd और az CLI में क्या अंतर है?</strong></summary>

**Azure CLI (az)**: व्यक्तिगत Azure संसाधनों का प्रबंधन करने के लिए लो-लेवल टूल
- `az webapp create`, `az storage account create`
- एक समय में एक संसाधन
- इन्फ्रास्ट्रक्चर प्रबंधन पर केंद्रित

**Azure Developer CLI (azd)**: संपूर्ण एप्लिकेशन डिप्लॉयमेंट के लिए हाई-लेवल टूल
- `azd up` पूरे ऐप को सभी संसाधनों के साथ डिप्लॉय करता है
- टेम्पलेट-आधारित वर्कफ़्लो
- डेवलपर उत्पादकता पर केंद्रित

**आपको दोनों की ज़रूरत है**: azd प्रमाणीकरण के लिए az CLI का उपयोग करता है
</details>

<details>
<summary><strong>क्या मैं azd को मौजूदा Azure संसाधनों के साथ उपयोग कर सकता हूँ?</strong></summary>

हाँ! आप कर सकते हैं:
1. मौजूदा संसाधनों को azd परिवेशों में आयात करें
2. अपने Bicep टेम्पलेट्स में मौजूदा संसाधनों का संदर्भ दें
3. मौजूदा इन्फ्रास्ट्रक्चर के साथ-साथ नए डिप्लॉयमेंट्स के लिए azd का उपयोग करें

विवरण के लिए [कॉन्फ़िगरेशन गाइड](configuration.md) देखें।
</details>

<details>
<summary><strong>क्या azd Azure Government या Azure China के साथ काम करता है?</strong></summary>

हाँ, क्लाउड कॉन्फ़िगर करें:
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
<summary><strong>क्या मैं azd को CI/CD पाइपलाइनों में उपयोग कर सकता हूँ?</strong></summary>

बिल्कुल! azd स्वचालन के लिए डिज़ाइन किया गया है:
- GitHub Actions इंटीग्रेशन
- Azure DevOps समर्थन
- सर्विस प्रिंसिपल प्रमाणीकरण
- नॉन-इंटरैक्टिव मोड

CI/CD पैटर्न के लिए [डिप्लॉयमेंट गाइड](../chapter-04-infrastructure/deployment-guide.md) देखें।
</details>

<details>
<summary><strong>azd का उपयोग करने की लागत क्या है?</strong></summary>

azd स्वयं **पूर्णतः मुफ़्त** और ओपन-सोर्स है। आप केवल निम्नलिखित के लिए भुगतान करते हैं:
- आप जो Azure संसाधन डिप्लॉय करते हैं
- Azure उपभोग लागत (compute, storage, आदि)

डिप्लॉयमेंट से पहले लागत का अनुमान लगाने के लिए `azd provision --preview` का उपयोग करें।
</details>

## अगले कदम

1. **प्रमाणीकरण पूरा करें**: सुनिश्चित करें कि आप अपनी Azure सदस्यता तक पहुँच सकते हैं
2. **अपनी पहली डिप्लॉयमेंट आज़माएँ**: [पहली परियोजना गाइड](first-project.md) का पालन करें
3. **टेम्पलेट एक्सप्लोर करें**: `azd template list` के साथ उपलब्ध टेम्पलेट ब्राउज़ करें
4. **अपना IDE कॉन्फ़िगर करें**: अपना विकास पर्यावरण सेट अप करें

## सहायता

यदि आपको समस्याएँ आती हैं:
- [आधिकारिक प्रलेखन](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्याएँ रिपोर्ट करें](https://github.com/Azure/azure-dev/issues)
- [समुदाय चर्चाएँ](https://github.com/Azure/azure-dev/discussions)
- [Azure सहायता](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - अपने एडिटर में सीधे Azure कमांड मार्गदर्शन प्राप्त करें `npx skills add microsoft/github-copilot-for-azure`

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - नींव और त्वरित प्रारंभ
- **⬅️ पिछला**: [AZD मूल बातें](azd-basics.md) 
- **➡️ अगला**: [आपकी पहली परियोजना](first-project.md)
- **🚀 अगला अध्याय**: [अध्याय 2: एआई-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ इंस्टॉलेशन पूरा!** आगे बढ़ने के लिए [आपकी पहली परियोजना](first-project.md) पर जाएँ और azd के साथ निर्माण शुरू करें.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में आधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->