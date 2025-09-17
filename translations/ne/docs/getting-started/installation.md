<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "90202d23bcaf40c8fd99b6a444ddce4a",
  "translation_date": "2025-09-12T18:58:00+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "ne"
}
-->
# स्थापना र सेटअप गाइड

**अघिल्लो:** [मुख्य दस्तावेज](../../README.md) | **अर्को:** [AZD आधारभूत](azd-basics.md)

## परिचय

यो विस्तृत गाइडले तपाईंलाई Azure Developer CLI (azd) लाई तपाईंको प्रणालीमा स्थापना र कन्फिगर गर्न सिकाउनेछ। तपाईं विभिन्न अपरेटिङ सिस्टमहरूका लागि स्थापना विधिहरू, प्रमाणीकरण सेटअप, र Azure तैनातीहरूको लागि तपाईंको विकास वातावरण तयार गर्न प्रारम्भिक कन्फिगरेसन सिक्नुहुनेछ।

## सिक्ने लक्ष्यहरू

यस पाठको अन्त्यसम्म, तपाईं:
- तपाईंको अपरेटिङ सिस्टममा Azure Developer CLI सफलतापूर्वक स्थापना गर्नुहुनेछ
- Azure सँग विभिन्न विधिहरू प्रयोग गरेर प्रमाणीकरण कन्फिगर गर्नुहुनेछ
- आवश्यक पूर्वापेक्षाहरू सहित तपाईंको विकास वातावरण सेटअप गर्नुहुनेछ
- विभिन्न स्थापना विकल्पहरू र तिनीहरू कहिले प्रयोग गर्ने बुझ्नुहुनेछ
- सामान्य स्थापना र सेटअप समस्याहरू समाधान गर्नुहुनेछ

## सिक्ने परिणामहरू

यस पाठ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- तपाईंको प्लेटफर्मको लागि उपयुक्त विधि प्रयोग गरेर azd स्थापना गर्न
- `azd auth login` प्रयोग गरेर Azure सँग प्रमाणीकरण गर्न
- तपाईंको स्थापना प्रमाणित गर्न र आधारभूत azd आदेशहरू परीक्षण गर्न
- azd को इष्टतम प्रयोगको लागि तपाईंको विकास वातावरण कन्फिगर गर्न
- सामान्य स्थापना समस्याहरू स्वतन्त्र रूपमा समाधान गर्न

यो गाइडले तपाईंलाई तपाईंको अपरेटिङ सिस्टम वा विकास वातावरणको पर्वाह नगरी Azure Developer CLI स्थापना र कन्फिगर गर्न मद्दत गर्नेछ।

## पूर्वापेक्षाहरू

azd स्थापना गर्नु अघि, सुनिश्चित गर्नुहोस् कि तपाईंले:
- **Azure सदस्यता** - [निःशुल्क खाता सिर्जना गर्नुहोस्](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण र स्रोत व्यवस्थापनको लागि
- **Git** - टेम्प्लेट क्लोन गर्न र संस्करण नियन्त्रणको लागि
- **Docker** (वैकल्पिक) - कन्टेनराइज्ड एप्लिकेसनहरूको लागि

## स्थापना विधिहरू

### Windows

#### विकल्प १: PowerShell (सिफारिस गरिएको)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### विकल्प २: Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### विकल्प ३: Chocolatey
```cmd
choco install azd
```

#### विकल्प ४: म्यानुअल स्थापना
1. [GitHub](https://github.com/Azure/azure-dev/releases) बाट पछिल्लो रिलीज डाउनलोड गर्नुहोस्
2. `C:\Program Files\azd\` मा एक्स्ट्र्याक्ट गर्नुहोस्
3. PATH वातावरण चरमा थप्नुहोस्

### macOS

#### विकल्प १: Homebrew (सिफारिस गरिएको)
```bash
brew tap azure/azd
brew install azd
```

#### विकल्प २: स्थापना स्क्रिप्ट
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प ३: म्यानुअल स्थापना
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### विकल्प १: स्थापना स्क्रिप्ट (सिफारिस गरिएको)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प २: प्याकेज म्यानेजरहरू

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

azd GitHub Codespaces मा पूर्व-स्थापित आउँछ। केवल एक कोडस्पेस सिर्जना गर्नुहोस् र तुरुन्तै azd प्रयोग गर्न सुरु गर्नुहोस्।

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ स्थापना प्रमाणित गर्नुहोस्

स्थापना पछि, सुनिश्चित गर्नुहोस् कि azd सही रूपमा काम गरिरहेको छ:

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

### Azure CLI प्रमाणीकरण (सिफारिस गरिएको)
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

### डिभाइस कोड प्रमाणीकरण
यदि तपाईं हेडलेस प्रणालीमा हुनुहुन्छ वा ब्राउजर समस्याहरू छन् भने:
```bash
az login --use-device-code
```

### सेवा प्रिन्सिपल (CI/CD)
स्वचालित वातावरणहरूको लागि:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## कन्फिगरेसन

### ग्लोबल कन्फिगरेसन
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### वातावरण चरहरू
तपाईंको शेल प्रोफाइल (`.bashrc`, `.zshrc`, `.profile`) मा थप्नुहोस्:
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## IDE एकीकरण

### Visual Studio Code
Azure Developer CLI एक्सटेन्सन स्थापना गर्नुहोस्:
1. VS Code खोल्नुहोस्
2. एक्सटेन्सनहरूमा जानुहोस् (Ctrl+Shift+X)
3. "Azure Developer CLI" खोज्नुहोस्
4. एक्सटेन्सन स्थापना गर्नुहोस्

विशेषताहरू:
- `azure.yaml` को लागि IntelliSense
- एकीकृत टर्मिनल आदेशहरू
- टेम्प्लेट ब्राउजिङ
- तैनाती निगरानी

### GitHub Codespaces
`.devcontainer/devcontainer.json` सिर्जना गर्नुहोस्:
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
1. Azure प्लगइन स्थापना गर्नुहोस्
2. Azure प्रमाणहरू कन्फिगर गर्नुहोस्
3. azd आदेशहरूको लागि एकीकृत टर्मिनल प्रयोग गर्नुहोस्

## 🐛 स्थापना समस्या समाधान

### सामान्य समस्याहरू

#### अनुमति अस्वीकृत (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्याहरू
azd लाई तपाईंको PATH मा म्यानुअल रूपमा थप्नुहोस्:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### नेटवर्क/प्रोक्सी समस्याहरू
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### संस्करण द्वन्द्व
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### थप सहयोग प्राप्त गर्नुहोस्
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## azd अपडेट गर्दै

### स्वचालित अपडेटहरू
azd ले तपाईंलाई अपडेटहरू उपलब्ध हुँदा सूचित गर्नेछ:
```bash
azd version --check-for-updates
```

### म्यानुअल अपडेटहरू

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

## अगाडि के गर्ने

1. **प्रमाणीकरण पूरा गर्नुहोस्**: सुनिश्चित गर्नुहोस् कि तपाईंले तपाईंको Azure सदस्यतामा पहुँच गर्न सक्नुहुन्छ
2. **तपाईंको पहिलो तैनाती प्रयास गर्नुहोस्**: [पहिलो परियोजना गाइड](first-project.md) अनुसरण गर्नुहोस्
3. **टेम्प्लेटहरू अन्वेषण गर्नुहोस्**: `azd template list` प्रयोग गरेर उपलब्ध टेम्प्लेटहरू ब्राउज गर्नुहोस्
4. **तपाईंको IDE कन्फिगर गर्नुहोस्**: तपाईंको विकास वातावरण सेटअप गर्नुहोस्

## सहयोग

यदि तपाईं समस्याहरू सामना गर्नुहुन्छ भने:
- [आधिकारिक दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्या रिपोर्ट गर्नुहोस्](https://github.com/Azure/azure-dev/issues)
- [समुदाय छलफलहरू](https://github.com/Azure/azure-dev/discussions)
- [Azure सहयोग](https://azure.microsoft.com/support/)

---

**अघिल्लो:** [मुख्य दस्तावेज](../../README.md) | **अर्को:** [AZD आधारभूत](azd-basics.md)

**स्थापना पूरा भयो!** [तपाईंको पहिलो परियोजना](first-project.md) मा अगाडि बढ्नुहोस् र azd प्रयोग गरेर निर्माण सुरु गर्नुहोस्।

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। यसको मूल भाषामा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।