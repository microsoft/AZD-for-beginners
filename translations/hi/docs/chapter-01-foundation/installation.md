# इंस्टॉलेशन और सेटअप गाइड

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md)
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

यह विस्तृत गाइड आपको आपके सिस्टम पर Azure Developer CLI (azd) को स्थापित और कॉन्फ़िगर करने के बारे में चरण-दर-चरण मार्गदर्शन देगा। आप विभिन्न ऑपरेटिंग सिस्टम के लिए कई इंस्टॉलेशन तरीके, प्रमाणीकरण सेटअप, और Azure पर डिप्लॉयमेंट के लिए अपने विकास परिवेश की प्रारंभिक कॉन्फ़िगरेशन सीखेंगे।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- अपने ऑपरेटिंग सिस्टम पर सफलतापूर्वक Azure Developer CLI स्थापित करेंगे
- Azure के साथ प्रमाणीकरण को कई तरीकों से कॉन्फ़िगर करेंगे
- आवश्यक प्रीक्विज़िट्स के साथ अपना विकास पर्यावरण सेटअप करेंगे
- विभिन्न इंस्टॉलेशन विकल्पों को समझेंगे और कब किसे उपयोग करना है
- सामान्य इंस्टॉलेशन और सेटअप समस्याओं का निवारण करना सीखेंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:
- अपने प्लेटफ़ॉर्म के लिए उपयुक्त विधि का उपयोग करके azd स्थापित करना
- azd auth login का उपयोग करके Azure के साथ प्रमाणीकरण करना
- अपनी इंस्टॉलेशन सत्यापित करना और बुनियादी azd कमांड्स का परीक्षण करना
- azd के इष्टतम उपयोग के लिए अपने विकास परिवेश को कॉन्फ़िगर करना
- सामान्य इंस्टॉलेशन समस्याओं को स्वतंत्र रूप से हल करना

यह गाइड आपको आपके ऑपरेटिंग सिस्टम या विकास परिवेश की परवाह किए बिना Azure Developer CLI को इंस्टॉल और कॉन्फ़िगर करने में मदद करेगा।

## पूर्वापेक्षाएँ

azd स्थापित करने से पहले, सुनिश्चित करें कि आपके पास है:
- **Azure subscription** - [Create a free account](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण और संसाधन प्रबंधन के लिए
- **Git** - टेम्प्लेट क्लोन करने और वर्शन कंट्रोल के लिए
- **Docker** (वैकल्पिक) - कंटेनरीकृत एप्लिकेशन के लिए

## इंस्टॉलेशन विधियाँ

### Windows

#### Option 1: PowerShell (Recommended)
```powershell
# प्रशासक के रूप में या उन्नत विशेषाधिकारों के साथ चलाएँ
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3: Chocolatey
```cmd
choco install azd
```

#### Option 4: Manual Installation
1. Download the latest release from [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. Add to PATH environment variable

### macOS

#### Option 1: Homebrew (Recommended)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2: Install Script
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3: Manual Installation
```bash
# डाउनलोड और इंस्टॉल करें
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (Recommended)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft पैकेज रिपोजिटरी जोड़ें
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd स्थापित करें
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft पैकेज रिपॉज़िटरी जोड़ें
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd पहले से GitHub Codespaces में इंस्टॉल आता है। बस एक codespace बनाएं और तुरंत azd का उपयोग शुरू करें।

### Docker

```bash
# azd को एक कंटेनर में चलाएँ
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# आसान उपयोग के लिए एक उपनाम बनाएँ
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ इंस्टॉलेशन सत्यापित करें

इंस्टॉलेशन के बाद, सुनिश्चित करें कि azd सही ढंग से काम कर रहा है:

```bash
# संस्करण जांचें
azd version

# मदद देखें
azd --help

# उपलब्ध टेम्पलेट्स सूचीबद्ध करें
azd template list
```

Expected output:
```
azd version 1.x.x (commit xxxxxx)
```

**Note**: वास्तविक संस्करण संख्या भिन्न होगी। नवीनतम संस्करण के लिए जाँच करें [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases)।

**✅ इंस्टॉलेशन सफलता चेकलिस्ट:**
- [ ] `azd version` त्रुटियों के बिना संस्करण संख्या दिखाता है
- [ ] `azd --help` कमांड दस्तावेज़ दिखाता है
- [ ] `azd template list` उपलब्ध टेम्प्लेट दिखाता है
- [ ] `az account show` आपका Azure सब्सक्रिप्शन दिखाता है
- [ ] आप एक टेस्ट निर्देशिका बना सकते हैं और `azd init` सफलतापूर्वक चला सकते हैं

**यदि सभी चेक पास हो जाते हैं, तो आप [Your First Project](first-project.md) पर आगे बढ़ने के लिए तैयार हैं!**

## प्रमाणीकरण सेटअप

### Azure CLI Authentication (Recommended)
```bash
# यदि पहले से स्थापित नहीं है तो Azure CLI स्थापित करें
# विंडोज़: winget install Microsoft.AzureCLI
# मैकओएस: brew install azure-cli
# लिनक्स: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure में लॉग इन करें
az login

# प्रमाणीकरण सत्यापित करें
az account show
```

### Device Code Authentication
यदि आप किसी हेडलेस सिस्टम पर हैं या ब्राउज़र समस्याएँ आ रही हैं:
```bash
az login --use-device-code
```

### Service Principal (CI/CD)
स्वचालित वातावरणों के लिए:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## कॉन्फ़िगरेशन

### Global Configuration
```bash
# डिफ़ॉल्ट सदस्यता सेट करें
azd config set defaults.subscription <subscription-id>

# डिफ़ॉल्ट स्थान सेट करें
azd config set defaults.location eastus2

# सभी कॉन्फ़िगरेशन देखें
azd config list
```

### Environment Variables
अपने शेल प्रोफ़ाइल में जोड़ें (`.bashrc`, `.zshrc`, `.profile`):
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
2. Extensions (Ctrl+Shift+X) पर जाएँ
3. "Azure Developer CLI" खोजें
4. एक्सटेंशन इंस्टॉल करें

विशेषताएँ:
- azure.yaml के लिए IntelliSense
- एकीकृत टर्मिनल कमांड्स
- टेम्प्लेट ब्राउज़िंग
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
3. azd कमांड्स के लिए एकीकृत टर्मिनल का उपयोग करें

## 🐛 इंस्टॉलेशन समस्या निवारण

### सामान्य समस्याएँ

#### Permission Denied (Windows)
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
# पुरानी इंस्टॉलेशन हटाएं
# विंडोज़: winget uninstall Microsoft.Azd
# मैकओएस: brew uninstall azd
# लिनक्स: sudo apt remove azd

# कॉन्फ़िगरेशन साफ़ करें
rm -rf ~/.azd
```

### और मदद कहाँ प्राप्त करें
```bash
# डिबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd <command> --debug

# वर्तमान विन्यास देखें
azd config list

# वर्तमान तैनाती की स्थिति देखें
azd show
```

## azd अपडेट करना

### स्वचालित अपडेट
जब अपडेट उपलब्ध होंगे तो azd आपको सूचित करेगा:
```bash
azd version --check-for-updates
```

### मैन्युअल अपडेट

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

**Azure CLI (az)**: एकल Azure संसाधनों का प्रबंधन करने के लिए निम्न-स्तरीय उपकरण
- `az webapp create`, `az storage account create`
- एक समय में एक संसाधन
- इन्फ्रास्ट्रक्चर प्रबंधन पर केंद्रित

**Azure Developer CLI (azd)**: संपूर्ण एप्लिकेशन डिप्लॉयमेंट के लिए उच्च-स्तरीय उपकरण
- `azd up` पूरे एप को सभी संसाधनों के साथ डिप्लॉय करता है
- टेम्प्लेट-आधारित वर्कफ़्लो
- डेवलपर उत्पादकता पर केंद्रित

**आपको दोनों की ज़रूरत है**: azd प्रमाणीकरण के लिए az CLI का उपयोग करता है
</details>

<details>
<summary><strong>क्या मैं मौजूदा Azure संसाधनों के साथ azd का उपयोग कर सकता हूँ?</strong></summary>

हाँ! आप कर सकते हैं:
1. मौजूदा संसाधनों को azd एनवायरनमेंट्स में इम्पोर्ट करें
2. अपने Bicep टेम्प्लेट्स में मौजूदा संसाधनों का संदर्भ लें
3. मौजूदा इन्फ्रास्ट्रक्चर के साथ नए डिप्लॉयमेंट के लिए azd का उपयोग करें

विवरण के लिए देखें [Configuration Guide](configuration.md)।
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
<summary><strong>क्या मैं CI/CD पाइपलाइनों में azd का उपयोग कर सकता हूँ?</strong></summary>

बिल्कुल! azd ऑटोमेशन के लिए डिज़ाइन किया गया है:
- GitHub Actions एकीकरण
- Azure DevOps समर्थन
- सर्विस प्रिंसिपल प्रमाणीकरण
- नान-इंटरएक्टिव मोड

CI/CD पैटर्न्स के लिए देखें [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)।
</details>

<details>
<summary><strong>azd का उपयोग करने की लागत क्या है?</strong></summary>

azd स्वयं **पूरी तरह से मुफ़्त** और ओपन-सोर्स है। आपको केवल उन चीज़ों के लिए भुगतान करना होगा:
- आप जो Azure संसाधन डिप्लॉय करते हैं
- Azure खपत लागतें (compute, storage, आदि)

डिप्लॉयमेंट से पहले लागत का अनुमान लगाने के लिए `azd provision --preview` का उपयोग करें।
</details>

## अगले कदम

1. **प्रमाणीकरण पूरा करें**: सुनिश्चित करें कि आप अपने Azure सब्सक्रिप्शन तक पहुँच सकते हैं
2. **अपना पहला डिप्लॉयमेंट आज़माएं**: [First Project Guide](first-project.md) का पालन करें
3. **टेम्प्लेट्स एक्सप्लोर करें**: `azd template list` से उपलब्ध टेम्प्लेट ब्राउज़ करें
4. **अपने IDE को कॉन्फ़िगर करें**: अपना विकास परिवेश सेटअप करें

## समर्थन

यदि आपको समस्याएँ आती हैं:
- [Official Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Report Issues](https://github.com/Azure/azure-dev/issues)
- [Community Discussions](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [AZD Basics](azd-basics.md) 
- **➡️ Next**: [Your First Project](first-project.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ इंस्टॉलेशन पूर्ण हो गया!** azd के साथ बिल्ड करना शुरू करने के लिए [Your First Project](first-project.md) पर जाएँ।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। हम सटीकता के लिए प्रयास करते हैं, लेकिन कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सलाह दी जाती है। हम इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफ़हमी या गलत व्याख्या के लिए उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->