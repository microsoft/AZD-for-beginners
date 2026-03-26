# स्थापना र सेटअप मार्गदर्शक

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम होम**: [AZD सुरु गर्नेहरूको लागि](../../README.md)
- **📖 हालको अध्याय**: अध्याय 1 - आधार र द्रुत शुरुवात
- **⬅️ अघिल्लो**: [AZD आधारभूत](azd-basics.md)
- **➡️ पछि**: [तपाईंको पहिलो परियोजना](first-project.md)
- **🚀 अर्को अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

यो विस्तृत मार्गदर्शकले तपाईंलाई Azure Developer CLI (azd) आफ्नो प्रणालीमा कसरी स्थापना र कन्फिगर गर्ने भनेर चरणबद्ध रूपमा सिकाउनेछ। तपाईंले विभिन्न अपरेटिङ सिस्टमका लागि बहु स्थापना विधिहरू, प्रमाणीकरण सेटअप, र प्रारम्भिक कन्फिगरेसन सिक्नुहुनेछ जसले Azure तैनाथीका लागि तपाईंको विकास वातावरण तयार पार्न मद्दत गर्छ।

## सिकाइ लक्ष्यहरू

यस पाठको अन्त्यसम्म, तपाईंले:
- आफ्नो अपरेटिङ सिस्टममा Azure Developer CLI सफलतापूर्वक स्थापना गर्ने
- Azure सँग प्रमाणीकरण कन्फिगर गर्ने बहु विधिहरू प्रयोग गर्ने
- आवश्यक पूर्वापेक्षाहरू सहित आफ्नो विकास वातावरण सेटअप गर्ने
- विभिन्न स्थापना विकल्पहरू बुझ्ने र कुन अवस्थामा कुन प्रयोग गर्ने थाहा पाउने
- सामान्य स्थापना र सेटअप समस्याहरू सुल्झाउने

## सिकाइ परिणामहरू

यो पाठ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- आफ्नो प्लेटफर्मका लागि उपयुक्त विधि प्रयोग गरी azd स्थापना गर्न
- `azd auth login` प्रयोग गरेर Azure सँग प्रमाणीकरण गर्न
- आफ्नो स्थापना सत्यापित गरी आधारभूत azd आदेशहरू परीक्षण गर्न
- azd को लागि आफ्नो विकास वातावरण अनुकूल रूपमा कन्फिगर गर्न
- सामान्य स्थापना समस्याहरू स्वतन्त्र रूपमा समाधान गर्न

यस मार्गदर्शकले तपाईंलाई तपाईंको अपरेटिङ सिस्टम वा विकास वातावरण जे भए पनि Azure Developer CLI स्थापना र कन्फिगर गर्न मद्दत गर्नेछ।

## पूर्वआवश्यकताहरू

azd स्थापना गर्नु अघि, सुनिश्चित गर्नुहोस्:
- **Azure सदस्यता** - [निःशुल्क खाता सिर्जना गर्नुहोस्](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण र स्रोत व्यवस्थापनका लागि
- **Git** - टेम्प्लेट क्लोनिङ र भर्सन कन्ट्रोलका लागि
- **Docker** (वैकल्पिक) - कन्टेनरयुक्त अनुप्रयोगहरूको लागि

## स्थापना विधिहरू

### Windows

#### विकल्प 1: PowerShell (सिफारिस गरिएको)
```powershell
# प्रशासकको रूपमा चलाउनुहोस् वा उच्च विशेषाधिकारसहित चलाउनुहोस्
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### विकल्प 2: Windows प्याकेज म्यानेजर (winget)
```cmd
winget install Microsoft.Azd
```

#### विकल्प 3: Chocolatey
```cmd
choco install azd
```

#### विकल्प 4: म्यानुअल स्थापना
1. [GitHub](https://github.com/Azure/azure-dev/releases) बाट नवीनतम रिलिज डाउनलोड गर्नुहोस्
2. `C:\Program Files\azd\` मा अनजिप/निकाल्नुहोस्
3. PATH वातावरण चरमा थप्नुहोस्

### macOS

#### विकल्प 1: Homebrew (सिफारिस गरिएको)
```bash
brew tap azure/azd
brew install azd
```

#### विकल्प 2: इन्स्टल स्क्रिप्ट
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प 3: म्यानुअल स्थापना
```bash
# डाउनलोड र इन्स्टल गर्नुहोस्
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### विकल्प 1: इन्स्टल स्क्रिप्ट (सिफारिस गरिएको)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प 2: प्याकेज म्यानेजरहरू

**Ubuntu/Debian:**
```bash
# Microsoft प्याकेज रिपोजिटरी थप्नुहोस्
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

azd GitHub Codespaces मा पूर्व-स्थापित आउँछ। सिधै codespace सिर्जना गरेर azd तुरुन्तै प्रयोग सुरु गर्नुहोस्।

### Docker

```bash
# कन्टेनरमा azd चलाउनुहोस्
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# सजिलो प्रयोगका लागि उपनाम सिर्जना गर्नुहोस्
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ स्थापना पुष्टि गर्नुहोस्

स्थापना पछि, azd सहि रूपमा काम गर्छ कि गर्दैन जाँच गर्नुहोस्:

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

**नोट**: वास्तविक संस्करण नम्बर फरक हुनसक्छ। नवीनतम संस्करणका लागि [Azure Developer CLI रिलिजहरू](https://github.com/Azure/azure-dev/releases) जाँच गर्नुहोस्।

**✅ स्थापना सफलताको चेकलिस्ट:**
- [ ] `azd version` त्रुटि बिना संस्करण नम्बर देखाउँछ
- [ ] `azd --help` कमाण्ड दस्तावेज देखाउँछ
- [ ] `azd template list` उपलब्ध टेम्प्लेटहरू देखाउँछ
- [ ] `az account show` तपाइँको Azure सदस्यता देखाउँछ
- [ ] तपाईं परीक्षण डाइरेक्टरी सिर्जना गरी `azd init` सफलतापूर्वक चलाउन सक्नुहुन्छ

**यदि सबै जाँच पास भए, तपाईं [तपाईंको पहिलो परियोजना](first-project.md) मा अघि बढ्न तयार हुनुहुन्छ!**

## प्रमाणीकरण सेटअप

### Azure CLI प्रमाणीकरण (सिफारिस गरिएको)
```bash
# यदि पहिले नै स्थापना गरिएको छैन भने Azure CLI स्थापना गर्नुहोस्
# Windows: winget प्रयोग गरी Microsoft.AzureCLI इन्स्टल गर्नुहोस्
# macOS: brew प्रयोग गरी azure-cli इन्स्टल गर्नुहोस्
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash प्रयोग गरी स्थापना गर्नुहोस्

# Azure मा लगइन गर्नुहोस्
az login

# प्रमाणीकरण जाँच गर्नुहोस्
az account show
```

### डिभाइस कोड प्रमाणीकरण
यदि तपाईं हेडलेस सिस्टममा हुनुहुन्छ वा ब्राउजर समस्याहरू छन्:
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

### वैश्विक कन्फिगरेसन
```bash
# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
azd config set defaults.subscription <subscription-id>

# पूर्वनिर्धारित स्थान सेट गर्नुहोस्
azd config set defaults.location eastus2

# सबै कन्फिगरेसन हेर्नुहोस्
azd config list
```

### वातावरण चरहरू
आफ्नो शेल प्रोफाइलमा थप्नुहोस् (`.bashrc`, `.zshrc`, `.profile`):
```bash
# Azure कन्फिगरेसन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd कन्फिगरेसन
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # डिबग लगिङ सक्षम गर्नुहोस्
```

## IDE एकीकरण

### Visual Studio Code
Azure Developer CLI एक्सटेन्सन इन्स्टल गर्नुहोस्:
1. VS Code खोल्नुहोस्
2. Extensions मा जानुहोस् (Ctrl+Shift+X)
3. "Azure Developer CLI" खोज्नुहोस्
4. एक्सटेन्सन इन्स्टल गर्नुहोस्

विशेषताहरू:
- azure.yaml का लागि IntelliSense
- एकीकृत टर्मिनल कमाण्डहरू
- टेम्प्लेट ब्राउजिङ
- डिप्लोयमेन्ट मोनिटरिङ

### GitHub Codespaces
`.devcontainer/devcontainer.json` बनाउनुहोस्:
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
2. Azure क्रेडेन्सियल कन्फिगर गर्नुहोस्
3. azd कमाण्डहरूको लागि एकीकृत टर्मिनल प्रयोग गर्नुहोस्

## 🐛 स्थापना समस्यासमाधान

### सामान्य समस्या

#### अनुमति अस्वीकृत (Windows)
```powershell
# PowerShell लाई प्रशासकको रूपमा चलाउनुहोस्
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्या
हातैले azd लाई PATH मा थप्नुहोस्:

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

# SSL सत्यापन छोड्नुहोस् (उत्पादनका लागि सिफारिस गरिँदैन)
azd config set http.insecure true
```

#### संस्करण द्वन्द्व
```bash
# पुराना इन्स्टलेशनहरू हटाउनुहोस्
# विन्डोज: winget uninstall Microsoft.Azd
# म्याकओएस: brew uninstall azd
# लिनक्स: sudo apt remove azd

# कन्फिगरेसन सफा गर्नुहोस्
rm -rf ~/.azd
```

### थप सहयोग कसरी पाउने
```bash
# डिबग लगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd <command> --debug

# वर्तमान कन्फिगरेसन हेर्नुहोस्
azd config list

# वर्तमान परिनियोजन स्थिति हेर्नुहोस्
azd show
```

## azd अपडेट गर्दै

### स्वचालित अपडेटहरू
नयाँ अपडेट उपलब्ध हुँदा azd ले सूचित गर्नेछ:
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

**Azure CLI (az)**: व्यक्तिगत Azure स्रोतहरू व्यवस्थापन गर्नका लागि कम-स्तरीय उपकरण
- `az webapp create`, `az storage account create`
- एक पटकमा एक स्रोत
- पूर्वाधार व्यवस्थापनमा केन्द्रित

**Azure Developer CLI (azd)**: सम्पूर्ण अनुप्रयोग तैनाथीका लागि उच्च-स्तरीय उपकरण
- `azd up` ले सम्पूर्ण एप्लिकेसन र सबै स्रोतहरू तैनाथ गर्छ
- टेम्प्लेट-आधारित वर्कफ्लोहरू
- विकासकर्ता उत्पादनशीलतामा केन्द्रित

**तपाईंले दुबै चाहिन्छ**: azd ले प्रमाणीकरणका लागि az CLI प्रयोग गर्छ
</details>

<details>
<summary><strong>के म अवस्थित Azure स्रोतहरूसँग azd प्रयोग गर्न सक्छु?</strong></summary>

हो! तपाईं गर्नसक्नुहुन्छ:
1. अवस्थित स्रोतहरूलाई azd वातावरणहरूमा आयात गर्नुहोस्
2. तपाईंका Bicep टेम्प्लेटहरूमा अवस्थित स्रोतहरू सन्दर्भ गर्नुहोस्
3. नयाँ तैनाथीहरूको लागि azd सँग अवस्थित पूर्वाधारसँग सँगै प्रयोग गर्नुहोस्

विवरणका लागि [कन्फिगरेसन गाइड](configuration.md) हेर्नुहोस्।
</details>

<details>
<summary><strong>के azd Azure Government वा Azure China सँग काम गर्छ?</strong></summary>

हो, क्लाउड कन्फिगर गर्नुहोस्:
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
<summary><strong>के म CI/CD पाइपलाइनहरूमा azd प्रयोग गर्न सक्छु?</strong></summary>

निश्चितै! azd स्वचालनका लागि डिजाइन गरिएको हो:
- GitHub Actions एकीकरण
- Azure DevOps समर्थन
- सर्भिस प्रिन्सिपल प्रमाणीकरण
- गैर-इंटरएक्टिभ मोड

CI/CD ढाँचाहरूका लागि [डिप्लोयमेन्ट गाइड](../chapter-04-infrastructure/deployment-guide.md) हेर्नुहोस्।
</details>

<details>
<summary><strong>azd प्रयोग गर्दा लागत कति हो?</strong></summary>

azd आफैं **पूर्ण रूपमा निःशुल्क** र खुला स्रोत हो। तपाईंले मात्र निम्नका लागि तिर्नुहुन्छ:
- तपाइँले डिप्लोय गर्ने Azure स्रोतहरूको लागि
- Azure उपभोग लागत (compute, storage, आदि)

डिप्लोय गर्नु अघि लागत अनुमान गर्न `azd provision --preview` प्रयोग गर्नुहोस्।
</details>

## अर्को चरणहरू

1. **प्रमाणीकरण पूरा गर्नुहोस्**: सुनिश्चित गर्नुहोस् कि तपाईं आफ्नो Azure सदस्यतामा पहुँच गर्न सक्षम हुनुहुन्छ
2. **तपाईंको पहिलो तैनाथी प्रयास गर्नुहोस्**: [पहिलो परियोजना मार्गदर्शक](first-project.md) पालन गर्नुहोस्
3. **टेम्प्लेटहरू अन्वेषण गर्नुहोस्**: `azd template list` सँग उपलब्ध टेम्प्लेटहरू ब्राउज गर्नुहोस्
4. **आफ्नो IDE कन्फिगर गर्नुहोस्**: आफ्नो विकास वातावरण सेटअप गर्नुहोस्

## समर्थन

यदि तपाईंले समस्याहरू अनुभव गर्नुभयो भने:
- [आधिकारिक दस्तावेज](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्या रिपोर्ट गर्नुहोस्](https://github.com/Azure/azure-dev/issues)
- [समुदाय छलफलहरू](https://github.com/Azure/azure-dev/discussions)
- [Azure समर्थन](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` प्रयोग गरेर प्रत्यक्ष रूपमा तपाईंको सम्पादकमा Azure कमाण्ड मार्गदर्शन प्राप्त गर्नुहोस्

---

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम होम**: [AZD सुरु गर्नेहरूको लागि](../../README.md)
- **📖 हालको अध्याय**: अध्याय 1 - आधार र द्रुत शुरुवात
- **⬅️ अघिल्लो**: [AZD आधारभूत](azd-basics.md) 
- **➡️ पछि**: [तपाईंको पहिलो परियोजना](first-project.md)
- **🚀 अर्को अध्याय**: [अध्याय 2: AI-प्रथम विकास](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ स्थापना पूर्ण भयो!** azd सँग निर्माण सुरु गर्न [तपाईंको पहिलो परियोजना](first-project.md) मा जारी राख्नुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा असमानता हुनसक्छ। मूल दस्तावेज यसको मूल भाषामा प्राधिकृत स्रोत मानिनु पर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->