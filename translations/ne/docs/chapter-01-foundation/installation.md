# इन्स्टलेशन र सेटअप मार्गदर्शन

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD सुरुआतीहरूका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - आधार र छिटो सुरु
- **⬅️ अघिल्लो**: [AZD Basics](azd-basics.md)
- **➡️ अर्को**: [तपाईंको पहिलो परियोजना](first-project.md)
- **🚀 अर्को अध्याय**: [अध्याय 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

यो व्यापक मार्गदर्शनले तपाईंलाई तपाईंको प्रणालीमा Azure Developer CLI (azd) इन्स्टल र कन्फिगर गर्ने प्रक्रिया मार्फत लैजानेछ। तपाईंले विभिन्न अपरेटिङ सिस्टमहरूका लागि धेरै इन्स्टलेशन विधिहरू, प्रमाणीकरण सेटअप, र Azure डिप्लोइमेन्टका लागि विकास वातावरण प्रारम्भिक कन्फिगरेसन सिक्नुहुनेछ।

## सिकाइ लक्ष्यहरू

यस पाठको अन्त्यसम्ममा, तपाईं:
- आफ्नो अपरेटिङ सिस्टममा Azure Developer CLI सफलतापूर्वक इन्स्टल गर्न सक्षम हुनुहुनेछ
- Azure सँग प्रमाणीकरणको लागि बहु विधिहरू कन्फिगर गर्न सक्नुहुनेछ
- आवश्यक पूर्वआवश्यकताहरू सहित विकास वातावरण सेटअप गर्न सक्नुहुनेछ
- विभिन्न इन्स्टलेशन विकल्पहरू र कहिले कुन प्रयोग गर्ने बुझ्नुहुनेछ
- सामान्य इन्स्टलेशन र सेटअप समस्याहरू समाधान गर्ने क्षमता प्राप्त गर्नुहुनेछ

## सिकाइ नतिजा

यस पाठ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- आफ्नो प्लेटफर्मका लागि उपयुक्त विधि प्रयोग गरी azd इन्स्टल गर्न
- azd auth login प्रयोग गरी Azure सँग प्रमाणीकरण गर्न
- आफ्नो इन्स्टलेशन प्रमाणित गर्न र आधारभूत azd कमाण्डहरू परीक्षण गर्न
- azd को प्रभावकारी प्रयोगका लागि आफ्नो विकास वातावरण कन्फिगर गर्न
- सामान्य इन्स्टलेशन समस्याहरू स्वतन्त्र रूपमा समाधान गर्न

यो मार्गदर्शनले तपाईंलाई तपाईंको अपरेटिङ सिस्टम वा विकास वातावरण जे भए पनि Azure Developer CLI इन्स्टल र कन्फिगर गर्न मद्दत गर्नेछ।

## पूर्वआवश्यकताहरू

azd इन्स्टल गर्नु अघि, सुनिश्चित गर्नुहोस् कि तपाईंसँग छ:
- **Azure subscription** - [निशुल्क खाता सिर्जना गर्नुहोस्](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण र स्रोत व्यवस्थापनका लागि
- **Git** - टेम्पलेट क्लोन गर्न र भर्सन कन्ट्रोलका लागि
- **Docker** (वैकल्पिक) - कन्टेनराइज्ड एप्लिकेसनहरूको लागि

## इन्स्टलेशन विधिहरू

### Windows

#### Option 1: PowerShell (सिफारिस गरिन्छ)
```powershell
# प्रशासकको रूपमा वा उच्च अधिकारसहित चलाउनुहोस्
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
1. नवीनतम रिलिज डाउनलोड गर्नुहोस् [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extract to `C:\Program Files\azd\`
3. PATH वातावरणचरमा थप्नुहोस्

### macOS

#### Option 1: Homebrew (सिफारिस गरिन्छ)
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
# डाउनलोड र स्थापना गर्नुहोस्
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1: Install Script (सिफारिस गरिन्छ)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2: Package Managers

**Ubuntu/Debian:**
```bash
# Microsoft प्याकेज भण्डार थप्नुहोस्
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# azd स्थापना गर्नुहोस्
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora:**
```bash
# Microsoft प्याकेज रिपोजिटरी थप्नुहोस्
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd GitHub Codespaces मा पूर्व-इन्स्टल गरिएको आउँछ। केवल codespace सिर्जना गर्नुहोस् र तुरुन्तै azd प्रयोग गर्न सुरु गर्नुहोस्।

### Docker

```bash
# azd लाई कन्टेनरमा चलाउनुहोस्
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# सजिलो प्रयोगका लागि एउटा उपनाम सिर्जना गर्नुहोस्
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ इन्स्टलेशन जाँच गर्नुहोस्

इन्स्टलेशन पछि, azd सही रूपमा काम गरिरहेको छ कि छैन जाँच गर्नुहोस्:

```bash
# संस्करण जाँच गर्नुहोस्
azd version

# सहायता हेर्नुहोस्
azd --help

# उपलब्ध टेम्पलेटहरू सूचीबद्ध गर्नुहोस्
azd template list
```

अपेक्षित आउटपुट:
```
azd version 1.x.x (commit xxxxxx)
```

**नोट**: वास्तविक संस्करण नम्बर फरक हुन सक्छ। नवीनतम संस्करणका लागि हेर्नुहोस् [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases)।

**✅ इन्स्टलेशन सफलताको चेकलिस्ट:**
- [ ] `azd version` त्रुटिविहीन रूपमा संस्करण नम्बर देखाउँछ
- [ ] `azd --help` कमाण्ड डकुमेन्टेसन देखाउँछ
- [ ] `azd template list` उपलब्ध टेम्पलेटहरू देखाउँछ
- [ ] `az account show` तपाईंको Azure subscription देखाउँछ
- [ ] तपाईं टेस्ट डाइरेक्टरी सिर्जना गरी `azd init` सफलतापूर्वक चलाउन सक्नुहुन्छ

**यदि सबै जाँचहरू पास भए, तपाईं [तपाईंको पहिलो परियोजना](first-project.md) मा अगाडि बढ्न तयार हुनुहुन्छ!**

## प्रमाणीकरण सेटअप

### Azure CLI प्रमाणीकरण (सिफारिस गरिन्छ)
```bash
# Azure CLI स्थापना गर्नुहोस् यदि पहिलेदेखि स्थापना गरिएको छैन भने
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Azure मा लगइन गर्नुहोस्
az login

# प्रमाणीकरण जाँच गर्नुहोस्
az account show
```

### डिभाइस कोड प्रमाणीकरण
यदि तपाईं हेड्लेस सिस्टममा हुनुहुन्छ वा ब्राउजर समस्याहरू भएमा:
```bash
az login --use-device-code
```

### सर्भिस प्रिन्सिपल (CI/CD)
स्वचालित वातावरणहरूका लागि:
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## कन्फिगरेसन

### ग्लोबल कन्फिगरेसन
```bash
# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
azd config set defaults.subscription <subscription-id>

# पूर्वनिर्धारित स्थान सेट गर्नुहोस्
azd config set defaults.location eastus2

# सबै विन्यासहरू हेर्नुहोस्
azd config list
```

### वातावरण चरहरू
तपाईंको shell प्रोफाइलमा थप्नुहोस् (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure कन्फिगरेशन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd कन्फिगरेशन
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # डिबग लॉगिङ सक्षम गर्नुहोस्
```

## IDE एकीकरण

### Visual Studio Code
Azure Developer CLI एक्सटेन्शन इन्स्टल गर्नुहोस्:
1. VS Code खोल्नुहोस्
2. Extensions (Ctrl+Shift+X) मा जानुहोस्
3. "Azure Developer CLI" खोज्नुहोस्
4. एक्सटेन्शन इन्स्टल गर्नुहोस्

विशेषताहरू:
- azure.yaml का लागि IntelliSense
- इन्टिग्रेटेड टर्मिनल कमाण्डहरू
- टेम्पलेट ब्राउजिङ
- डिप्लोइमेन्ट मोनिटरिङ

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
1. Azure प्लगइन इन्स्टल गर्नुहोस्
2. Azure क्रेडेन्सियल्स कन्फिगर गर्नुहोस्
3. azd कमाण्डहरूका लागि इन्टिग्रेटेड टर्मिनल प्रयोग गर्नुहोस्

## 🐛 इन्स्टलेशन त्रुटि निवारण

### सामान्य समस्याहरू

#### अनुमति अस्वीकृत (Windows)
```powershell
# PowerShell लाई प्रशासकको रूपमा चलाउनुहोस्
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्या
azd लाई म्यानुअली PATH मा थप्नुहोस्:

**Windows:**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux:**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### नेटवर्क/प्रोक्सी समस्या
```bash
# प्रोक्सी कन्फिगर गर्नुहोस्
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL प्रमाणीकरण जाँच छोड्नुहोस् (उत्पादनमा सिफारिस गरिँदैन)
azd config set http.insecure true
```

#### संस्करण टकराव
```bash
# पुराना स्थापना(हरू) हटाउनुहोस्
# विन्डोज: winget uninstall Microsoft.Azd
# म्याकओएस: brew uninstall azd
# लिनक्स: sudo apt remove azd

# कन्फिगरेसन सफा गर्नुहोस्
rm -rf ~/.azd
```

### थप सहयोग कसरी पाउने
```bash
# डेबग लगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd <command> --debug

# हालको कन्फिगरेसन हेर्नुहोस्
azd config list

# हालको तैनाती स्थिति हेर्नुहोस्
azd show
```

## azd अपडेट गर्ने

### स्वचालित अपडेटहरू
azd ले अपडेटहरू उपलब्ध हुँदा तपाईंलाई सूचित गर्नेछ:
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

## 💡 बारम्बार सोधिने प्रश्नहरू

<details>
<summary><strong>azd र az CLI बीच के फरक छ?</strong></summary>

**Azure CLI (az)**: व्यक्तिगत Azure स्रोतहरू व्यवस्थापन गर्नको लागि लो-लेभल उपकरण
- `az webapp create`, `az storage account create`
- एकपटकमा एक स्रोत
- इन्फ्रास्ट्रक्चर व्यवस्थापनमा फोकस

**Azure Developer CLI (azd)**: पूरा एप्लिकेसन डिप्लोइमेन्टका लागि हाई-लेभल उपकरण
- `azd up` सम्पूर्ण एप्लिकेसन र सबै स्रोतहरूसँग डिप्लोइ गराउँछ
- टेम्पलेट-आधारित वर्कफ्लोहरू
- विकासकर्ता उत्पादकत्वमा फोकस

**तपाईंलाई दुवै आवश्यक हुन्छ**: azd ले प्रमाणीकरणको लागि az CLI प्रयोग गर्छ
</details>

<details>
<summary><strong>के म azd लाई अवस्थित Azure स्रोतहरूसँग प्रयोग गर्न सक्छु?</strong></summary>

हो! तपाईं गर्न सक्नुहुन्छ:
1. अवस्थित स्रोतहरूलाई azd वातावरणहरूमा इम्पोर्ट गर्नुहोस्
2. आफ्नो Bicep टेम्पलेटहरूमा अवस्थित स्रोतहरू सन्दर्भ गर्नुहोस्
3. नयाँ डिप्लोइमेन्टहरूका लागि azd लाई अवस्थित इन्फ्रास्ट्रक्चरसँग सँगै प्रयोग गर्नुहोस्

विवरणका लागि हेर्नुहोस् [Configuration Guide](configuration.md)।
</details>

<details>
<summary><strong>के azd Azure Government वा Azure China सँग काम गर्छ?</strong></summary>

हो, क्लाउड कन्फिगर गर्नुहोस्:
```bash
# एज़्योर सरकार
az cloud set --name AzureUSGovernment
az login

# एज़्योर चीन
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>के म CI/CD पाइपलाइनहरूमा azd प्रयोग गर्न सक्छु?</strong></summary>

पक्कै! azd स्वचालनका लागि डिजाइन गरिएको हो:
- GitHub Actions एकीकरण
- Azure DevOps समर्थन
- सर्भिस प्रिन्सिपल प्रमाणीकरण
- नन-इन्टरएक्टिभ मोड

CI/CD ढाँचाहरूका लागि हेर्नुहोस् [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)।
</details>

<details>
<summary><strong>azd प्रयोग गर्दा लागत कति पर्छ?</strong></summary>

azd आफैंमा **पूर्ण रूपमा निःशुल्क** र ओपन-सोर्स छ। तपाईंले मात्र तिर्नुहुनेछ:
- तपाईँले डिप्लोइ गर्ने Azure स्रोतहरूको लागत
- Azure उपभोग लागत (compute, storage, आदि)

डिप्लोइमेन्ट अघि लागत अनुमान गर्न `azd provision --preview` प्रयोग गर्नुहोस्।
</details>

## अर्को कदमहरू

1. **प्रमाणीकरण पूरा गर्नुहोस्**: सुनिश्चित गर्नुहोस् कि तपाईं आफ्नो Azure subscription पहुँच गर्न सक्नुहुन्छ
2. **तपाईंको पहिलो डिप्लोइमेन्ट प्रयास गर्नुहोस्**: अनुसरण गर्नुहोस् [First Project Guide](first-project.md)
3. **टेम्पलेटहरू अन्वेषण गर्नुहोस्**: `azd template list` प्रयोग गरी उपलब्ध टेम्पलेटहरू ब्राउज गर्नुहोस्
4. **आफ्नो IDE कन्फिगर गर्नुहोस्**: विकास वातावरण सेटअप गर्नुहोस्

## समर्थन

यदि तपाईं समस्यामा परिरहनु भएको छ:
- [आधिकारिक दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्याहरू रिपोर्ट गर्नुहोस्](https://github.com/Azure/azure-dev/issues)
- [समुदाय चर्चा](https://github.com/Azure/azure-dev/discussions)
- [Azure Support](https://azure.microsoft.com/support/)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD सुरुआतीहरूका लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - आधार र छिटो सुरु
- **⬅️ अघिल्लो**: [AZD Basics](azd-basics.md) 
- **➡️ अर्को**: [तपाईंको पहिलो परियोजना](first-project.md)
- **🚀 अर्को अध्याय**: [अध्याय 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ इन्स्टलेशन पूरा भयो!** azd सँग निर्माण सुरु गर्न [तपाईंको पहिलो परियोजना](first-project.md) मा जारी राख्नुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सटीकताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धि हुन सक्छ। मूल दस्तावेजलाई त्यसको मूल भाषामा अधिकारिक स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि पेशेवर मानवीय अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा गलत व्याख्याको लागि हामी जिम्मेवार रहने छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->