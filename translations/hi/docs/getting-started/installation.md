<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e9fcb9121c8d0b570798d778f8904a22",
  "translation_date": "2025-09-09T16:49:44+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "hi"
}
-->
# इंस्टॉलेशन और सेटअप गाइड

## परिचय

यह विस्तृत गाइड आपको Azure Developer CLI (azd) को अपने सिस्टम पर इंस्टॉल और कॉन्फ़िगर करने की प्रक्रिया से परिचित कराएगा। आप विभिन्न ऑपरेटिंग सिस्टम के लिए कई इंस्टॉलेशन विधियों, ऑथेंटिकेशन सेटअप, और प्रारंभिक कॉन्फ़िगरेशन के बारे में जानेंगे ताकि Azure डिप्लॉयमेंट के लिए आपका डेवलपमेंट एनवायरनमेंट तैयार हो सके।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- अपने ऑपरेटिंग सिस्टम पर Azure Developer CLI को सफलतापूर्वक इंस्टॉल कर पाएंगे
- Azure के साथ कई तरीकों से ऑथेंटिकेशन कॉन्फ़िगर कर पाएंगे
- अपने डेवलपमेंट एनवायरनमेंट को आवश्यक प्रीरेक्विज़िट्स के साथ सेटअप कर पाएंगे
- विभिन्न इंस्टॉलेशन विकल्पों को समझ पाएंगे और जान पाएंगे कि किस स्थिति में कौन सा विकल्प उपयोग करना है
- सामान्य इंस्टॉलेशन और सेटअप समस्याओं को हल कर पाएंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप:
- अपने प्लेटफ़ॉर्म के लिए उपयुक्त विधि का उपयोग करके azd इंस्टॉल कर पाएंगे
- azd auth login का उपयोग करके Azure के साथ ऑथेंटिकेशन कर पाएंगे
- अपनी इंस्टॉलेशन को सत्यापित कर पाएंगे और azd के बेसिक कमांड्स को टेस्ट कर पाएंगे
- अपने डेवलपमेंट एनवायरनमेंट को azd के प्रभावी उपयोग के लिए कॉन्फ़िगर कर पाएंगे
- सामान्य इंस्टॉलेशन समस्याओं को स्वतंत्र रूप से हल कर पाएंगे

यह गाइड आपको आपके ऑपरेटिंग सिस्टम या डेवलपमेंट एनवायरनमेंट की परवाह किए बिना Azure Developer CLI को इंस्टॉल और कॉन्फ़िगर करने में मदद करेगा।

## आवश्यकताएँ

azd को इंस्टॉल करने से पहले, सुनिश्चित करें कि आपके पास:
- **Azure सब्सक्रिप्शन** - [फ्री अकाउंट बनाएं](https://azure.microsoft.com/free/)
- **Azure CLI** - ऑथेंटिकेशन और रिसोर्स मैनेजमेंट के लिए
- **Git** - टेम्पलेट्स को क्लोन करने और वर्जन कंट्रोल के लिए
- **Docker** (वैकल्पिक) - कंटेनराइज्ड एप्लिकेशन के लिए

## इंस्टॉलेशन विधियाँ

### Windows

#### विकल्प 1: PowerShell (अनुशंसित)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### विकल्प 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### विकल्प 3: Chocolatey
```cmd
choco install azd
```

#### विकल्प 4: मैनुअल इंस्टॉलेशन
1. [GitHub](https://github.com/Azure/azure-dev/releases) से लेटेस्ट रिलीज़ डाउनलोड करें
2. `C:\Program Files\azd\` में एक्सट्रैक्ट करें
3. PATH एनवायरनमेंट वेरिएबल में जोड़ें

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
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### विकल्प 1: इंस्टॉल स्क्रिप्ट (अनुशंसित)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प 2: पैकेज मैनेजर्स

**Ubuntu/Debian:**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd पहले से ही GitHub Codespaces में इंस्टॉल होता है। बस एक कोडस्पेस बनाएं और तुरंत azd का उपयोग शुरू करें।

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ इंस्टॉलेशन सत्यापन

इंस्टॉलेशन के बाद, सुनिश्चित करें कि azd सही तरीके से काम कर रहा है:

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

अपेक्षित आउटपुट:
```
azd version 1.5.0 (commit abc123)
```

## 🔐 ऑथेंटिकेशन सेटअप

### Azure CLI ऑथेंटिकेशन (अनुशंसित)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### डिवाइस कोड ऑथेंटिकेशन
यदि आप हेडलेस सिस्टम पर हैं या ब्राउज़र समस्याओं का सामना कर रहे हैं:
```bash
az login --use-device-code
```

### सर्विस प्रिंसिपल (CI/CD)
स्वचालित एनवायरनमेंट्स के लिए:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## 🛠️ कॉन्फ़िगरेशन

### ग्लोबल कॉन्फ़िगरेशन
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### एनवायरनमेंट वेरिएबल्स
अपने शेल प्रोफाइल (`.bashrc`, `.zshrc`, `.profile`) में जोड़ें:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## 🔧 IDE इंटीग्रेशन

### Visual Studio Code
Azure Developer CLI एक्सटेंशन इंस्टॉल करें:
1. VS Code खोलें
2. एक्सटेंशन्स पर जाएं (Ctrl+Shift+X)
3. "Azure Developer CLI" खोजें
4. एक्सटेंशन इंस्टॉल करें

विशेषताएँ:
- azure.yaml के लिए IntelliSense
- इंटीग्रेटेड टर्मिनल कमांड्स
- टेम्पलेट ब्राउज़िंग
- डिप्लॉयमेंट मॉनिटरिंग

### GitHub Codespaces
`.devcontainer/devcontainer.json` बनाएं:
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

## 🐛 इंस्टॉलेशन समस्याओं का समाधान

### सामान्य समस्याएँ

#### परमिशन डिनाइड (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्याएँ
azd को मैन्युअली PATH में जोड़ें:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### वर्जन कंफ्लिक्ट्स
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### अधिक सहायता प्राप्त करना
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd अपडेट करना

### स्वचालित अपडेट्स
azd आपको अपडेट्स उपलब्ध होने पर सूचित करेगा:
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

## अगले कदम

1. **ऑथेंटिकेशन पूरा करें**: सुनिश्चित करें कि आप अपने Azure सब्सक्रिप्शन तक पहुंच सकते हैं
2. **अपना पहला डिप्लॉयमेंट आज़माएं**: [First Project Guide](first-project.md) का पालन करें
3. **टेम्पलेट्स एक्सप्लोर करें**: `azd template list` के साथ उपलब्ध टेम्पलेट्स ब्राउज़ करें
4. **अपना IDE कॉन्फ़िगर करें**: अपना डेवलपमेंट एनवायरनमेंट सेटअप करें

## सहायता

यदि आपको समस्याओं का सामना करना पड़े:
- [आधिकारिक दस्तावेज़](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्याएँ रिपोर्ट करें](https://github.com/Azure/azure-dev/issues)
- [समुदाय चर्चा](https://github.com/Azure/azure-dev/discussions)
- [Azure सहायता](https://azure.microsoft.com/support/)

---

**नेविगेशन**
- **पिछला पाठ**: [AZD Basics](azd-basics.md)
- **अगला पाठ**: [Configuration](configuration.md)

**इंस्टॉलेशन पूरा हुआ!** [Your First Project](first-project.md) पर जाएं और azd के साथ निर्माण शुरू करें।

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।