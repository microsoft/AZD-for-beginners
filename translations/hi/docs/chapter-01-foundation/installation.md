# स्थापना और सेटअप गाइड

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - फाउंडेशन और क्विक स्टार्ट
- **⬅️ पिछला**: [AZD Basics](azd-basics.md)
- **➡️ अगला**: [Your First Project](first-project.md)
- **🚀 अगला अध्याय**: [अध्याय 2: AI-फर्स्ट डेवलपमेंट](../chapter-02-ai-development/microsoft-foundry-integration.md)

## परिचय

यह व्यापक मार्गदर्शिका आपको आपके सिस्टम पर Azure Developer CLI (azd) को स्थापित करने और कॉन्फ़िगर करने के लिए मार्गदर्शन करेगी। आप विभिन्न ऑपरेटिंग सिस्टम के लिए कई स्थापना विधियाँ, प्रमाणीकरण सेटअप, और Azure परिनियोजन के लिए आपके विकास पर्यावरण की प्रारंभिक कॉन्फ़िगरेशन सीखेंगे।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- अपने ऑपरेटिंग सिस्टम पर Azure Developer CLI सफलतापूर्वक स्थापित करेंगे
- Azure के साथ प्रमाणीकरण विभिन्न तरीकों से कॉन्फ़िगर करेंगे
- आवश्यक पूर्वापेक्षाओं के साथ अपना विकास वातावरण सेट अप करेंगे
- विभिन्न स्थापना विकल्पों को समझेंगे और कब किसका उपयोग करना है जानेंगे
- सामान्य स्थापना और सेटअप समस्याओं का निवारण कर पाएंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:
- अपने प्लेटफ़ॉर्म के लिए उपयुक्त तरीके से azd स्थापित करना
- azd auth login का उपयोग करके Azure के साथ प्रमाणीकरण करना
- अपनी स्थापना सत्यापित करना और बुनियादी azd कमांड परीक्षण करना
- azd के लिए अपने विकास वातावरण को अनुकूलित करना
- सामान्य स्थापना समस्याओं को स्वयं हल करना

यह गाइड आपके ऑपरेटिंग सिस्टम या विकास वातावरण की परवाह किए बिना Azure Developer CLI को आपके सिस्टम पर स्थापित और कॉन्फ़िगर करने में मदद करेगी।

## आवश्यकताएँ

azd स्थापित करने से पहले, सुनिश्चित करें कि आपके पास हैं:
- **Azure सदस्यता** - [एक मुफ्त खाता बनाएँ](https://azure.microsoft.com/free/)
- **Azure CLI** - प्रमाणीकरण और संसाधन प्रबंधन के लिए
- **Git** - टेम्प्लेट क्लोनिंग और संस्करण नियंत्रण के लिए
- **Docker** (वैकल्पिक) - कंटेनरयुक्त अनुप्रयोगों के लिए

## स्थापना विधियाँ

### विंडोज़

#### विकल्प 1: विंडोज़ पैकेज मैनेजर (अनुशंसित)
```cmd
winget install microsoft.azd
```

#### विकल्प 2: पॉवरशेल इंस्टॉल स्क्रिप्ट
```powershell
# उपयोगी जब winget उपलब्ध न हो
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### विकल्प 3: चॉकलेट्री
```cmd
choco install azd
```

#### विकल्प 4: मैनुअल इंस्टॉलेशन
1. नवीनतम रिलीज़ [GitHub](https://github.com/Azure/azure-dev/releases) से डाउनलोड करें
2. `C:\Program Files\azd\` में निकालें
3. PATH एनवायरनमेंट वेरिएबल में जोड़ें

### macOS

#### विकल्प 1: होमब्रू (अनुशंसित)
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

### लिनक्स

#### विकल्प 1: इंस्टॉल स्क्रिप्ट (अनुशंसित)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### विकल्प 2: पैकेज मैनेजर

**रिलीज़ एसेट्स से मैनुअल इंस्टॉलेशन:**
```bash
# अपने Linux आर्किटेक्चर के लिए नवीनतम आर्काइव को यहाँ से डाउनलोड करें:
# https://github.com/Azure/azure-dev/releases
# फिर इसे निकालें और azd बाइनरी को अपने PATH में जोड़ें।
```

### GitHub Codespaces

कुछ Codespaces और dev कंटेनर वातावरण में पहले से `azd` शामिल होता है, लेकिन आपको पुष्टि करनी चाहिए कि वह है या नहीं:

```bash
azd version
```

यदि `azd` गायब है, तो इसे पर्यावरण के लिए मानक स्क्रिप्ट के साथ स्थापित करें।

### डॉकर

```bash
# कंटेनर में azd चलाएं
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# आसान उपयोग के लिए एक उपनाम बनाएं
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ स्थापना सत्यापन

इंस्टॉलेशन के बाद, azd के सही काम करने की पुष्टि करें:

```bash
# संस्करण जांचें
azd version

# सहायता देखें
azd --help

# उपलब्ध टेम्पलेट्स की सूची बनाएं
azd template list
```

अपेक्षित आउटपुट:
```
azd version 1.x.x (commit xxxxxx)
```

**ध्यान दें**: वास्तविक संस्करण संख्या भिन्न होगी। नवीनतम संस्करण के लिए [Azure Developer CLI रिलीज़](https://github.com/Azure/azure-dev/releases) देखें।

**✅ स्थापना सफलता चेकलिस्ट:**
- [ ] `azd version` बिना त्रुटि के संस्करण संख्या दिखाए
- [ ] `azd --help` कमांड दस्तावेज़ दिखाए
- [ ] `azd template list` उपलब्ध टेम्प्लेट दिखाए
- [ ] आप एक परीक्षण निर्देशिका बना सकते हैं और `azd init` सफलतापूर्वक चला सकते हैं

**यदि सभी जांच पास हो जाएं, तो आप [Your First Project](first-project.md) पर आगे बढ़ने के लिए तैयार हैं!**

## प्रमाणीकरण सेटअप

### अनुशंसित शुरुआती सेटअप

AZD-प्रथम वर्कफ़्लोज़ के लिए, `azd auth login` के साथ साइन इन करें।

```bash
# azd up जैसे AZD कमांड्स के लिए आवश्यक
azd auth login

# AZD प्रमाणीकरण स्थिति सत्यापित करें
azd auth login --check-status
```

Azure CLI साइन-इन का उपयोग केवल तभी करें जब आप कोर्स के दौरान स्वयं `az` कमांड चलाने की योजना बनाते हों।

### Azure CLI प्रमाणीकरण (वैकल्पिक)
```bash
# यदि पहले से इंस्टॉल नहीं है तो Azure CLI इंस्टॉल करें
# विंडोज़: winget install Microsoft.AzureCLI
# मैकओएस: brew install azure-cli
# लिनक्स: अपने वितरण के लिए Azure CLI इंस्टॉल दस्तावेज़ देखें

# Azure में लॉगिन करें
az login

# प्रमाणीकरण सत्यापित करें
az account show
```

### कौन सा साइन-इन फ्लो उपयोग करें?

- यदि आप शुरुआती AZD मार्ग का पालन कर रहे हैं और मुख्य रूप से `azd` कमांड चला रहे हैं, तो `azd auth login` का उपयोग करें।
- जब आप Azure CLI कमांड जैसे `az account show` या सीधे संसाधनों का निरीक्षण करना चाहते हैं, तब `az login` भी उपयोग करें।
- यदि किसी अभ्यास में दोनों `azd` और `az` कमांड शामिल हों, तो शुरुआत में दोनों साइन-इन कमांड एक बार चलाएं।

### डिवाइस कोड प्रमाणीकरण
यदि आप हेडलेस सिस्टम पर हैं या ब्राउज़र में समस्या है:
```bash
azd auth login --use-device-code
```

### सर्विस प्रिंसिपल (CI/CD)
स्वचालित वातावरण के लिए:
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### अपना पूरा सेटअप मान्य करें

यदि आप अध्याय 1 शुरू करने से पहले त्वरित तैयारियों की जांच करना चाहते हैं:

**विंडोज़:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

## कॉन्फ़िगरेशन

### वैश्विक कॉन्फ़िगरेशन
```bash
# डिफ़ॉल्ट सदस्यता सेट करें
azd config set defaults.subscription <subscription-id>

# डिफ़ॉल्ट स्थान सेट करें
azd config set defaults.location eastus2

# सभी कॉन्फ़िगरेशन देखें
azd config show
```

### पर्यावरण वेरिएबल्स
अपने शेल प्रोफ़ाइल (`.bashrc`, `.zshrc`, `.profile`) में जोड़ें:
```bash
# एज्योर विन्यास
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd विन्यास
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # डिबग लॉगिंग सक्षम करें
```

## IDE एकीकरण

### विज़ुअल स्टूडियो कोड
Azure Developer CLI एक्सटेंशन इंस्टॉल करें:
1. VS Code खोलें
2. एक्सटेंशन (Ctrl+Shift+X) पर जाएं
3. "Azure Developer CLI" खोजें
4. एक्सटेंशन इंस्टॉल करें

विशेषताएँ:
- azure.yaml के लिए IntelliSense
- एकीकृत टर्मिनल कमांड
- टेम्प्लेट ब्राउज़िंग
- परिनियोजन मॉनिटरिंग

### GitHub Codespaces
एक `.devcontainer/devcontainer.json` बनाएँ:
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
2. Azure क्रेडेंशियल कॉन्फ़िगर करें
3. azd कमांड के लिए एकीकृत टर्मिनल का उपयोग करें

## 🐛 स्थापना समस्या निवारण

### सामान्य समस्याएँ

#### परमिशन डिनाइड (विंडोज़)
```powershell
# पावरशेल को व्यवस्थापक के रूप में चलाएँ
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### PATH समस्याएँ
azd को मैन्युअली अपने PATH में जोड़ें:

**विंडोज़:**
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

# एसएसएल सत्यापन छोड़ें (उत्पादन के लिए अनुशंसित नहीं)
azd config set http.insecure true
```

#### संस्करण संघर्ष
```bash
# पुराने इंस्टॉलेशन हटाएं
# विंडोज: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# लिनक्स: पुनर्स्थापना से पहले पिछले azd बाइनरी या सिमलिंक को हटाएं

# कॉन्फ़िगरेशन साफ़ करें
rm -rf ~/.azd
```

### और सहायता प्राप्त करना
```bash
# डीबग लॉगिंग सक्षम करें
export AZD_DEBUG=true
azd <command> --debug

# वर्तमान कॉन्फ़िगरेशन देखें
azd config show

# वर्तमान तैनाती स्थिति देखें
azd show
```

## azd अपडेट करना

### अपडेट जांच
azd तब चेतावनी देता है जब कोई नया रिलीज़ उपलब्ध हो, और आप अपनी वर्तमान बिल्ड की पुष्टि कर सकते हैं:
```bash
azd version
```

### मैनुअल अपडेट्स

**विंडोज़ (winget):**
```cmd
winget upgrade microsoft.azd
```

**macOS (होमब्रू):**
```bash
brew upgrade azd
```

**लिनक्स:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 अक्सर पूछे जाने वाले प्रश्न

<details>
<summary><strong>azd और az CLI में क्या अंतर है?</strong></summary>

**Azure CLI (az)**: व्यक्तिगत Azure संसाधनों के प्रबंधन के लिए निचले स्तर का टूल
- `az webapp create`, `az storage account create`
- एक बार में एक संसाधन
- अवसंरचना प्रबंधन केंद्रित

**Azure Developer CLI (azd)**: संपूर्ण एप्लिकेशन परिनियोजन के लिए उच्च स्तरीय टूल
- `azd up` पूरी ऐप और सभी संसाधनों को तैनात करता है
- टेम्प्लेट-आधारित वर्कफ़्लोज़
- डेवलपर उत्पादकता केंद्रित

**दोनों की जरूरत है**: azd प्रमाणीकरण के लिए az CLI का उपयोग करता है
</details>

<details>
<summary><strong>क्या मैं मौजूदा Azure संसाधनों के साथ azd का उपयोग कर सकता हूँ?</strong></summary>

हाँ! आप:
1. मौजूदा संसाधनों को azd पर्यावरणों में आयात कर सकते हैं
2. अपनी Bicep टेम्प्लेट में मौजूदा संसाधनों का संदर्भ दे सकते हैं
3. नई तैनाती के लिए azd का उपयोग मौजूदा अवसंरचना के साथ कर सकते हैं

विवरण के लिए देखें [कॉन्फ़िगरेशन गाइड](configuration.md)।
</details>

<details>
<summary><strong>क्या azd Azure Government या Azure China के साथ काम करता है?</strong></summary>

हाँ, क्लाउड कॉन्फ़िगर करें:
```bash
# एज्योर सरकारी
az cloud set --name AzureUSGovernment
az login

# एज्योर चीन
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>क्या मैं azd CI/CD पाइपलाइनों में उपयोग कर सकता हूँ?</strong></summary>

बिल्कुल! azd स्वचालन के लिए डिज़ाइन किया गया है:
- GitHub Actions एकीकरण
- Azure DevOps समर्थन
- सर्विस प्रिंसिपल प्रमाणीकरण
- नॉन-इंटरैक्टिव मोड

CI/CD पैटर्न के लिए देखें [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)।
</details>

<details>
<summary><strong>azd का उपयोग करने की लागत क्या है?</strong></summary>

azd स्वयं **पूरी तरह से मुफ्त** और ओपन-सोर्स है। आप केवल भुगतान करते हैं:
- Azure संसाधन जिनका आप तैनाती करते हैं
- Azure उपभोग लागत (कंप्यूट, संग्रहण, आदि)

तैनाती से पहले लागत का अनुमान लगाने के लिए `azd provision --preview` का उपयोग करें।
</details>

## अगले कदम

1. **प्रमाणीकरण पूरा करें**: सुनिश्चित करें कि आप अपनी Azure सदस्यता तक पहुँच सकते हैं
2. **अपनी पहली तैनाती का प्रयास करें**: [First Project Guide](first-project.md) का पालन करें
3. **टेम्प्लेट एक्सप्लोर करें**: `azd template list` से उपलब्ध टेम्प्लेट ब्राउज़ करें
4. **अपना IDE सेट अप करें**: अपने विकास पर्यावरण को सेट करें

## सहायता

यदि आपको समस्याएं आती हैं:
- [आधिकारिक दस्तावेज़ीकरण](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [समस्याएँ रिपोर्ट करें](https://github.com/Azure/azure-dev/issues)
- [समुदाय चर्चा](https://github.com/Azure/azure-dev/discussions)
- [Azure सपोर्ट](https://azure.microsoft.com/support/)
- [**Azure एजेंट स्किल्स**](https://skills.sh/microsoft/github-copilot-for-azure) - अपने एडिटर में सीधे Azure कमांड मार्गदर्शन पाएं `npx skills add microsoft/github-copilot-for-azure` के साथ

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 1 - फाउंडेशन और क्विक स्टार्ट
- **⬅️ पिछला**: [AZD Basics](azd-basics.md)
- **➡️ अगला**: [Your First Project](first-project.md)
- **🚀 अगला अध्याय**: [अध्याय 2: AI-फर्स्ट डेवलपमेंट](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ स्थापना पूर्ण!** azd के साथ निर्माण शुरू करने के लिए [Your First Project](first-project.md) पर जाएं।

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यह दस्तावेज़ [Co-op Translator](https://github.com/Azure/co-op-translator) एआई अनुवाद सेवा का उपयोग करके अनूदित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान रखें कि स्वचालित अनुवाद में त्रुटियाँ या असत्यताएँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में अधिकारिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->