# स्थापना र सेटअप गाइड

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय १ - आधार र छिटो सुरु
- **⬅️ अघिल्लो**: [AZD Basics](azd-basics.md)
- **➡️ अर्को**: [Your First Project](first-project.md)
- **🚀 अर्को अध्याय**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

यो व्यापक गाइडले तपाईंलाई Azure Developer CLI (azd) लाई तपाईंको प्रणालीमा स्थापना र कन्फिगर गर्ने तरिका सिकाउने छ। तपाईंले विभिन्न अपरेटिङ सिस्टमहरूको लागि विभिन्न स्थापना विधिहरू, प्रमाणिकरण सेटअप, र Azure डिप्लोयमेन्टहरूको लागि विकास वातावरणको प्रारम्भिक कन्फिगरेसन सिक्नुहुनेछ।

## सिकाइ लक्ष्यहरू

यस पाठ अन्त्यसम्म, तपाईंले:
- आफ्नो अपरेटिङ सिस्टममा Azure Developer CLI सफलतापूर्वक स्थापना गर्ने
- Azure सँग प्रमाणिकरण गर्नका लागि विभिन्न विधिहरू प्रयोग गर्ने
- आवश्यक पूर्वशर्तहरू सहित आफ्नो विकास वातावरण सेटअप गर्ने
- विभिन्न स्थापना विकल्पहरू र तिनीहरूलाई कहिले प्रयोग गर्ने बुझ्ने
- सामान्य स्थापना र सेटअप समस्याहरू समाधान गर्ने

## सिकाइ परिणामहरू

यस पाठ पूरा पछि, तपाईं सक्षम हुनुहुनेछ:
- तपाईंको प्लेटफर्मको लागि उपयुक्त विधि प्रयोग गरी azd स्थापना गर्ने
- azd auth login प्रयोग गरेर Azure सँग प्रमाणिकरण गर्ने
- आफ्नो स्थापना जाँच्ने र आधारभूत azd आदेशहरू परीक्षण गर्ने
- अष्टतम azd प्रयोगका लागि विकास वातावरण कन्फिगर गर्ने
- सामान्य स्थापना समस्याहरू स्वतन्त्र रूपमा समाधान गर्ने

यो गाइडले तपाईंलाई Azure Developer CLI तपाईंको प्रणालीमा कसरी स्थापना गर्ने र कन्फिगर गर्नेमा मद्दत गर्नेछ, तपाईंको अपरेटिङ सिस्टम वा विकास वातावरण जे भएपनि।

## पूर्वशर्तहरू

azd स्थापना गर्नु अघि, सुनिश्चित गर्नुहोस् कि तपाईं संग:
- **Azure सब्स्क्रिप्सन** - [निःशुल्क खाता सिर्जना गर्नुहोस्](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणिकरण र स्रोत व्यवस्थापनका लागि
- **Git** - टेम्प्लेट क्लोनिङ र भर्सन कन्ट्रोलका लागि
- **Docker** (वैकल्पिक) - कन्टेनराइज्ड एप्लिकेशनहरूको लागि

## स्थापना विधिहरू

### विन्डोज

#### विकल्प १: विन्डोज प्याकेज म्यानेजर (सिफारिस गरिएको)
```cmd
winget install microsoft.azd
```

#### विकल्प २: PowerShell इन्स्टल स्क्रिप्ट
```powershell
# जब winget उपलब्ध नभएको बेला उपयोगी हुन्छ
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### विकल्प ३: चकलेटि
```cmd
choco install azd
```

#### विकल्प ४: म्यानुअल स्थापना
1. [GitHub](https://github.com/Azure/azure-dev/releases) बाट पछिल्लो रिलीज डाउनलोड गर्नुहोस्
2. `C:\Program Files\azd\` मा एक्स्ट्र्याक्ट गर्नुहोस्
3. PATH वातावरण भेरिएबलमा थप्नुहोस्

### macOS

#### विकल्प १: Homebrew (सिफारिस गरिएको)
```bash
brew tap azure/azd
brew install azd
```

#### विकल्प २: इन्स्टल स्क्रिप्ट
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प ३: म्यानुअल स्थापना
```bash
# डाउनलोड र स्थापन गर्नुहोस्
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### विकल्प १: इन्स्टल स्क्रिप्ट (सिफारिस गरिएको)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प २: प्याकेज म्यानेजरहरू

**रिलिज एस्सेटहरूबाट म्यानुअल स्थापना:**
```bash
# तपाईँको Linux आर्किटेक्चरको लागि सबैभन्दा नयाँ आर्काइभबाट डाउनलोड गर्नुहोस्:
# https://github.com/Azure/azure-dev/releases
# त्यसपछि यसलाई निकाल्नुहोस् र azd बायनरीलाई तपाईंको PATH मा थप्नुहोस्।
```

### GitHub Codespaces

केही Codespaces र देव कन्टेनर वातावरणहरूमा पहिले नै `azd` समावेश हुन्छ, तर तपाईंले यसलाई यकिन गर्नुपर्छ:

```bash
azd version
```

`azd` नभए, वातावरणको लागि मानक स्क्रिप्ट प्रयोग गरी स्थापना गर्नुहोस्।

### Docker

```bash
# कन्टेनरमा azd चलाउनुहोस्
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# सजिलो प्रयोगको लागि एक उपनाम सिर्जना गर्नुहोस्
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ स्थापना जाँच

स्थापना पछि, azd सहि छ कि छैन भनेर जाँच गर्नुहोस्:

```bash
# संस्करण जाँच गर्नुहोस्
azd version

# मद्दत हेर्नुहोस्
azd --help

# उपलब्ध ढाँचाहरूको सूची बनाउनुहोस्
azd template list
```

अपेक्षित आउटपुट:
```
azd version 1.x.x (commit xxxxxx)
```

**टिप्पणी**: वास्तविक संस्करण संख्या फरक पर्न सक्छ। पछिल्लो संस्करण हेर्नुहोस् [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases)।

**✅ स्थापना सफलता सूची:**
- [ ] `azd version` ले त्रुटि बिना संस्करण संख्या देखाउँछ
- [ ] `azd --help` ले आदेश कागजात देखाउँछ
- [ ] `azd template list` ले उपलब्ध टेम्प्लेटहरू देखाउँछ
- [ ] तपाईंले परीक्षण डाइरектरी सिर्जना गर्न र `azd init` सफलतापूर्वक चलाउन सक्नुहुन्छ

**यदि सबै परीक्षणहरू पास भए, तपाईं तयार हुनुहुन्छ [Your First Project](first-project.md) मा अगाडि बढ़्न!**

## प्रमाणिकरण सेटअप

### सिफारिस गरिएको शुरुआती सेटअप

AZD-प्रथम वर्कफ्लोको लागि, `azd auth login` सँग साइन इन गर्नुहोस्।

```bash
# azd up जस्ता AZD आदेशहरूको लागि आवश्यक
azd auth login

# AZD प्रमाणीकरण स्थिति पुष्टि गर्नुहोस्
azd auth login --check-status
```

कोर्समा `az` आदेशहरू आफैं चलाउने योजना भए मात्र Azure CLI साइन-इन प्रयोग गर्नुहोस्।

### Azure CLI प्रमाणिकरण (वैकल्पिक)
```bash
# Azure CLI स्थापना गर्नुहोस् यदि पहिले नै स्थापना गरिएको छैन भने
# विन्डोज: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: तपाईंको वितरणको लागि Azure CLI स्थापना कागजातहरू हेर्नुहोस्

# Azure मा लगइन गर्नुहोस्
az login

# प्रमाणिकरण पुष्टि गर्नुहोस्
az account show
```

### कुन साइन-इन प्रवाह प्रयोग गर्ने?

- तपाईं AZD सुरुवाती मार्ग पछ्याउँदै हुनुहुन्छ र मुख्य रूपमा `azd` आदेशहरू चलाउने हो भने `azd auth login` प्रयोग गर्नुहोस्।
- Azure CLI आदेशहरू (जस्तै `az account show`) वा स्रोतहरू प्रत्यक्ष निरीक्षण गर्न चाहनुहुन्छ भने पनि `az login` प्रयोग गर्नुहोस्।
- यदि कुनै अभ्यासमा दुबै `azd` र `az` आदेशहरू छन् भने, सुरुमा दुवै साइन-इन आदेशहरु चलाउनुहोस्।

### डिभाइस कोड प्रमाणिकरण
यदि तपाईं हेडलेस सिस्टममा हुनुहुन्छ वा ब्राउजर समस्या छ भने:
```bash
azd auth login --use-device-code
```

### सेवा प्रिन्सिपल (CI/CD)
स्वचालित वातावरणहरूका लागि:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### आफ्नो पूर्ण सेटअप मान्य गर्नुहोस्

यदि तपाईं अध्याय १ सुरु गर्नुअघि छिटो तयारी जाँच गर्न चाहनुहुन्छ भने:

**विन्डोज:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## कन्फिगरेसन

### ग्लोबल कन्फिगरेसन
```bash
# पूर्वनिर्धारित सदस्यता सेट गर्नुहोस्
azd config set defaults.subscription <subscription-id>

# पूर्वनिर्धारित स्थान सेट गर्नुहोस्
azd config set defaults.location eastus2

# सबै कन्फिगरेसनहरू हेर्नुहोस्
azd config show
```

### वातावरण भेरिएबलहरू
आफ्नो शेल प्रोफाइल (`.bashrc`, `.zshrc`, `.profile`) मा थप्नुहोस्:
```bash
# Azure कन्फिगरेसन
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd कन्फिगरेसन
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # डिबग लगिङ सक्षम पार्नुहोस्
```

## IDE एकीकरण

### Visual Studio Code
Azure Developer CLI एक्सटेन्सन स्थापना गर्नुहोस्:
1. VS Code खोल्नुहोस्
2. एक्सटेन्सनहरूमा जानुहोस् (Ctrl+Shift+X)
3. "Azure Developer CLI" खोज्नुहोस्
4. एक्सटेन्सन स्थापना गर्नुहोस्

फिचरहरू:
- azure.yaml का लागि IntelliSense
- इन्टिग्रेटेड टर्मिनल आदेशहरू
- टेम्प्लेट ब्राउजिङ
- डिप्लोयमेन्ट अनुगमन

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
2. Azure प्रमाणपत्रहरू कन्फिगर गर्नुहोस्
3. azd आदेशहरूको लागि इन्टिग्रेटेड टर्मिनल प्रयोग गर्नुहोस्

## 🐛 स्थापना समस्याहरू समाधान

### सामान्य समस्याहरू

#### अनुमति अस्वीकृत (विन्डोज)
```powershell
# पावरशेललाई प्रशासकको रूपमा चलाउनुहोस्
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्याहरू
म्यानुअल रूपमा azd लाई PATH मा थप्नुहोस्:

**विन्डोज:**
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
# प्रोक्सी कन्फिगर गर्नुहोस्
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# SSL प्रमाणीकरण छोड्नुहोस् (उत्पादनका लागि सिफारिस गरिंदैन)
azd config set http.insecure true
```

#### संस्करण द्वन्द्वहरू
```bash
# पुराना स्थापना हटाउनुहोस्
# विन्डोज: winget uninstall microsoft.azd
# म्याकओएस: brew uninstall azd
# लिनक्स: पुनः स्थापना गर्नु अघि पुरानो azd बाइनरी वा सिम्लिंक हटाउनुहोस्

# कन्फिगरेसन सफा गर्नुहोस्
rm -rf ~/.azd
```

### थप सहायता कसरी पाउने
```bash
# डिबग लगिङ सक्षम गर्नुहोस्
export AZD_DEBUG=true
azd <command> --debug

# वर्तमान कन्फिगरेसन हेर्नुहोस्
azd config show

# वर्तमान डिप्लोयमेन्ट स्थिति हेर्नुहोस्
azd show
```

## azd अपडेट गर्नुहोस्

### अपडेट जाँच
azd नयाँ रिलीज उपलब्ध हुँदा चेतावनी दिन्छ, र तपाईं आफ्नो हालको बिल्ड यस्ता कमाण्डले पुष्टि गर्न सक्नुहुन्छ:
```bash
azd version
```

### म्यानुअल अपडेटहरू

**विन्डोज (winget):**
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

## 💡 प्रायः सोधिने प्रश्नहरू

<details>
<summary><strong>azd र az CLI बिच के फरक छ?</strong></summary>

**Azure CLI (az)**: व्यक्तिगत Azure स्रोतहरू व्यवस्थापन गर्ने लो-लेवल उपकरण
- `az webapp create`, `az storage account create`
- एकचोटि एक स्रोत
- पूर्वाधार व्यवस्थापन केन्द्रित

**Azure Developer CLI (azd)**: सम्पूर्ण एप्लिकेशन डिप्लोयमेन्टका लागि उच्च-स्तर उपकरण
- `azd up` ले सम्पूर्ण एप सबै स्रोतहरूको साथ डिप्लोय गर्छ
- टेम्प्लेट-आधारित वर्कफ्लोहरू
- विकासकर्ता उत्पादकत्व केन्द्रित

**तपाईंलाई दुबै चाहिन्छ**: azd ले प्रमाणिकरणका लागि az CLI प्रयोग गर्छ
</details>

<details>
<summary><strong>के म विद्यमान Azure स्रोतहरूसँग azd प्रयोग गर्न सक्छु?</strong></summary>

हो! तपाईं सक्नुहुन्छ:
1. विद्यमान स्रोतहरूलाई azd वातावरणहरूमा आयात गर्न
2. आफ्नो Bicep टेम्प्लेटमा विद्यमान स्रोतहरू सन्दर्भ गर्न
3. नयाँ डिप्लोयमेन्टका लागि azd प्रयोग गर्न विद्यमान पूर्वाधारसँगै

विस्तृत जानकारीका लागि [Configuration Guide](configuration.md) हेर्नुहोस्।
</details>

<details>
<summary><strong>के azd Azure Government वा Azure China सँग काम गर्छ?</strong></summary>

हो, क्लाउड कन्फिगर गर्नुहोस्:
```bash
# अज्योर सरकार
az cloud set --name AzureUSGovernment
az login

# अज्योर चीन
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>के म CI/CD पाइपलाइनहरूमा azd प्रयोग गर्न सक्छु?</strong></summary>

पक्कै पनि! azd स्वचालित कार्यका लागि डिजाइन गरिएको:
- GitHub Actions एकीकरण
- Azure DevOps समर्थन
- सेवा प्रिन्सिपल प्रमाणिकरण
- गैर-इंटरएक्टिभ मोड

CI/CD ढाँचाहरूका लागि [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) हेर्नुहोस्।
</details>

<details>
<summary><strong>azd को लागत कति छ?</strong></summary>

azd आफैंमा **पूर्ण रूपमा निःशुल्क** र ओपन-सोर्स हो। तपाईंले मात्र तिर्नु हुन्छ:
- तपाईंले डिप्लोय गर्ने Azure स्रोतहरू
- Azure उपभोग लागतहरू (कम्प्युट, भण्डारण, आदि)

`azd provision --preview` प्रयोग गरेर डिप्लोयमेन्ट अघि लागत अनुमान गर्नुहोस्।
</details>

## अर्को चरणहरू

1. **प्रमाणिकरण पूरा गर्नुहोस्**: सुनिश्चित गर्नुहोस् तपाईंले Azure सब्स्क्रिप्सन पहुँच गर्न सक्नुहुन्छ
2. **पहिलो डिप्लोयमेन्ट प्रयास गर्नुहोस्**: [First Project Guide](first-project.md) पछ्याउनुहोस्
3. **टेम्प्लेट अन्वेषण गर्नुहोस्**: `azd template list` मार्फत उपलब्ध टेम्प्लेटहरू ब्राउज गर्नुहोस्
4. **IDE कन्फिगर गर्नुहोस्**: आफ्नो विकास वातावरण सेटअप गर्नुहोस्

## समर्थन

यदि तपाईं समस्यामा हुनुहुन्छ:
- [अधिकृत कागजात](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्या रिपोर्ट गर्नुहोस्](https://github.com/Azure/azure-dev/issues)
- [समुदाय छलफलहरू](https://github.com/Azure/azure-dev/discussions)
- [Azure समर्थन](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - `npx skills add microsoft/github-copilot-for-azure` प्रयोग गरी तपाईंको सम्पादकमा सीधा Azure कमाण्ड मार्गदर्शन प्राप्त गर्नुहोस्

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय १ - आधार र छिटो सुरु
- **⬅️ अघिल्लो**: [AZD Basics](azd-basics.md) 
- **➡️ अर्को**: [Your First Project](first-project.md)
- **🚀 अर्को अध्याय**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ स्थापना पूरा भयो!** अब [Your First Project](first-project.md) मा azd सँग विकास सुरु गर्न जारी राख्नुहोस्।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यो दस्तावेज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयासरत छौं भने पनि, कृपया जानकार रहनुहोस् कि स्वचालित अनुवादमा त्रुटिहरु वा गलतिहरु हुन सक्दछन्। मूल भाषामा रहेको दस्तावेजलाई आधिकारिक स्रोत रूपमा विचार गर्नुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा व्याख्याका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->