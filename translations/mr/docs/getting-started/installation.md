<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T18:53:33+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "mr"
}
-->
# स्थापना आणि सेटअप मार्गदर्शक

**मागील:** [मुख्य दस्तऐवज](../../README.md) | **पुढील:** [AZD मूलभूत गोष्टी](azd-basics.md)

## परिचय

ही सविस्तर मार्गदर्शिका तुम्हाला Azure Developer CLI (azd) तुमच्या प्रणालीवर स्थापित आणि कॉन्फिगर करण्याची प्रक्रिया शिकवेल. तुम्ही वेगवेगळ्या ऑपरेटिंग सिस्टमसाठी विविध स्थापना पद्धती, प्रमाणीकरण सेटअप, आणि Azure डिप्लॉयमेंटसाठी तुमचे विकास वातावरण तयार करण्यासाठी प्रारंभिक कॉन्फिगरेशन शिकाल.

## शिकण्याची उद्दिष्टे

या धड्याच्या शेवटी, तुम्ही:
- तुमच्या ऑपरेटिंग सिस्टमवर Azure Developer CLI यशस्वीरित्या स्थापित कराल
- विविध पद्धतींचा वापर करून Azure सोबत प्रमाणीकरण कॉन्फिगर कराल
- आवश्यक पूर्वतयारीसह तुमचे विकास वातावरण सेट कराल
- वेगवेगळ्या स्थापना पर्याय समजून घेऊन योग्य पर्याय कधी वापरायचा ते शिकाल
- सामान्य स्थापना आणि सेटअप समस्यांचे निराकरण कराल

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, तुम्ही:
- तुमच्या प्लॅटफॉर्मसाठी योग्य पद्धतीचा वापर करून azd स्थापित करू शकाल
- azd auth login वापरून Azure सोबत प्रमाणीकरण करू शकाल
- तुमची स्थापना सत्यापित करून azd चे मूलभूत आदेश तपासू शकाल
- azd चा सर्वोत्तम वापर करण्यासाठी तुमचे विकास वातावरण कॉन्फिगर करू शकाल
- सामान्य स्थापना समस्यांचे स्वयंपूर्णपणे निराकरण करू शकाल

ही मार्गदर्शिका तुम्हाला तुमच्या प्रणालीवर Azure Developer CLI स्थापित आणि कॉन्फिगर करण्यात मदत करेल, तुमच्या ऑपरेटिंग सिस्टम किंवा विकास वातावरण कोणतेही असो.

## पूर्वतयारी

azd स्थापित करण्यापूर्वी, खात्री करा की तुमच्याकडे:
- **Azure सदस्यता** - [फ्री खाते तयार करा](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण आणि संसाधन व्यवस्थापनासाठी
- **Git** - टेम्पलेट क्लोनिंग आणि आवृत्ती नियंत्रणासाठी
- **Docker** (पर्यायी) - कंटेनराइज्ड अनुप्रयोगांसाठी

## स्थापना पद्धती

### Windows

#### पर्याय 1: PowerShell (शिफारस केलेले)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### पर्याय 2: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### पर्याय 3: Chocolatey
```cmd
choco install azd
```

#### पर्याय 4: मॅन्युअल स्थापना
1. [GitHub](https://github.com/Azure/azure-dev/releases) वरून नवीनतम रिलीज डाउनलोड करा
2. `C:\Program Files\azd\` मध्ये एक्स्ट्रॅक्ट करा
3. PATH पर्यावरणीय व्हेरिएबलमध्ये जोडा

### macOS

#### पर्याय 1: Homebrew (शिफारस केलेले)
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
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### पर्याय 1: इंस्टॉल स्क्रिप्ट (शिफारस केलेले)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### पर्याय 2: पॅकेज मॅनेजर्स

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

azd GitHub Codespaces मध्ये पूर्व-स्थापित असतो. फक्त एक कोडस्पेस तयार करा आणि azd वापरण्यास सुरुवात करा.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ स्थापना सत्यापित करा

स्थापना केल्यानंतर, azd योग्य प्रकारे कार्य करत आहे का ते सत्यापित करा:

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

## प्रमाणीकरण सेटअप

### Azure CLI प्रमाणीकरण (शिफारस केलेले)
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

### डिव्हाइस कोड प्रमाणीकरण
जर तुम्ही हेडलेस सिस्टमवर असाल किंवा ब्राउझर समस्या असतील:
```bash
az login --use-device-code
```

### सर्व्हिस प्रिन्सिपल (CI/CD)
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
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### पर्यावरणीय व्हेरिएबल्स
तुमच्या शेल प्रोफाइलमध्ये जोडा (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE एकत्रीकरण

### Visual Studio Code
Azure Developer CLI एक्स्टेंशन स्थापित करा:
1. VS Code उघडा
2. एक्स्टेंशन्स (Ctrl+Shift+X) वर जा
3. "Azure Developer CLI" शोधा
4. एक्स्टेंशन स्थापित करा

वैशिष्ट्ये:
- azure.yaml साठी IntelliSense
- एकत्रित टर्मिनल आदेश
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
1. Azure प्लगइन स्थापित करा
2. Azure क्रेडेन्शियल्स कॉन्फिगर करा
3. azd आदेशांसाठी एकत्रित टर्मिनल वापरा

## 🐛 स्थापना समस्या निराकरण

### सामान्य समस्या

#### परवानगी नाकारली (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्या
azd तुमच्या PATH मध्ये मॅन्युअली जोडा:

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
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### आवृत्ती संघर्ष
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### अधिक मदत मिळवा
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd अपडेट करणे

### स्वयंचलित अपडेट्स
azd तुम्हाला अपडेट्स उपलब्ध असल्याचे सूचित करेल:
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

## पुढील पायऱ्या

1. **प्रमाणीकरण पूर्ण करा**: तुमच्या Azure सदस्यतेमध्ये प्रवेश सुनिश्चित करा
2. **तुमची पहिली डिप्लॉयमेंट करा**: [पहिल्या प्रोजेक्ट मार्गदर्शिका](first-project.md) अनुसरा
3. **टेम्पलेट्स एक्सप्लोर करा**: `azd template list` वापरून उपलब्ध टेम्पलेट्स ब्राउझ करा
4. **तुमचे IDE कॉन्फिगर करा**: तुमचे विकास वातावरण सेट करा

## समर्थन

जर तुम्हाला समस्या आल्या तर:
- [अधिकृत दस्तऐवज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्या नोंदवा](https://github.com/Azure/azure-dev/issues)
- [समुदाय चर्चा](https://github.com/Azure/azure-dev/discussions)
- [Azure समर्थन](https://azure.microsoft.com/support/)

---

**मागील:** [मुख्य दस्तऐवज](../../README.md) | **पुढील:** [AZD मूलभूत गोष्टी](azd-basics.md)

**स्थापना पूर्ण!** [तुमचा पहिला प्रोजेक्ट](first-project.md) सुरू करण्यासाठी पुढे जा आणि azd सह बिल्डिंग सुरू करा.

---

**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी, कृपया लक्षात ठेवा की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेचा अभाव असू शकतो. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.