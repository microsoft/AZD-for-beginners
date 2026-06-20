# अपनी खुद की azd टेम्पलेट बनाना

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 4 - Infrastructure as Code & Deployment
- **⬅️ पिछला**: [Deployment Guide](deployment-guide.md)
- **🚀 अगला अध्याय**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> जून 2026 में `azd 1.25.6` के खिलाफ सत्यापित किया गया।

## परिचय

अब तक आपने `azd init --template <name>` के साथ टेम्पलेट्स का उपयोग किया है। लेकिन जब आपकी टीम को कोई प्रोजेक्ट लेआउट पसंद आ जाता है — मान लीजिए, एक Container App के साथ Cosmos DB और सही मॉनिटरिंग — तो आप इसे अपनी पुन: उपयोग योग्य टेम्पलेट में बदलना चाहेंगे। एक टेम्पलेट वास्तव में एक Git रिपॉज़िटरी है जिसमें एक अनुमानित संरचना होती है जिसे azd पढ़ना जानता है। यह पाठ आपको दिखाता है कि इसे нscratch से कैसे बनाना है, परीक्षण कैसे करना है, और (वैकल्पिक रूप से) सामुदायिक गैलरी में कैसे प्रकाशित करना है।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- समझेंगे कि कौन सा फ़ोल्डर "azd टेम्पलेट" बनाता है
- आवश्यक फ़ाइलें और फ़ोल्डर लेआउट जानेंगे
- एक `azure.yaml` और `infra/` जोड़ना सीखेंगे जिसे अन्य लोग पुन: उपयोग कर सकें
- साझा करने से पहले स्थानीय रूप से अपने टेम्पलेट का परीक्षण करेंगे
- इसे प्रकाशित करेंगे और (वैकल्पिक) Awesome AZD को सबमिट करेंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:
- एक नया टेम्पलेट रिपॉज़िटरी स्कैफोल्ड करना
- इन्फ्रास्ट्रक्चर को पैरामीटराइज़ करना ताकि यह किसी भी सब्सक्रिप्शन में काम करे
- `azd init` और `azd up` के साथ टेम्पलेट को सत्यापित करना
- सामुदायिक गैलरी के लिए आवश्यक मेटाडाटा जोड़ना

---

## वास्तव में टेम्पलेट क्या है?

एक azd टेम्पलेट **एक Git रिपॉज़िटरी** है जिसमें कम से कम शामिल होता है:

| फ़ाइल / फ़ोल्डर | उद्देश्य | आवश्यक? |
|---------------|---------|-----------|
| `azure.yaml` | सेवाओं, होस्टों, और इन्फ्रा प्रदाता का वर्णन करता है | ✅ हाँ |
| `infra/` | संसाधनों को प्रावधान करने वाला Bicep, Terraform, या Pulumi | ✅ हाँ |
| `src/` (या आपका कोड) | वह एप्लिकेशन कोड जिसे azd तैनात करता है | ✅ हाँ |
| `README.md` | टेम्पलेट का उपयोग कैसे करें | ✅ दृढ़ता से अनुशंसित |
| `.azdo/` या `.github/` | CI/CD पाइपलाइन परिभाषाएँ | वैकल्पिक |
| `.devcontainer/` | पुनरुत्पादन योग्य विकास वातावरण | वैकल्पिक |
| `azure.yaml` `metadata` | गैलरी + टेलीमेट्री जानकारी | वैकल्पिक (प्रकाशित करने के लिए आवश्यक) |

यहाँ कोई जादू नहीं है: जब आप `azd init --template you/your-repo` चलाते हैं, तो azd रिपॉज़िटरी क्लोन करता है और `azure.yaml` पढ़ता है।

---

## चरण 1: रिपॉज़िटरी स्कैफोल्ड करें

फ़ोल्डर संरचना हाथ से बनाएं या एक न्यूनतम टेम्पलेट से शुरू करके संपादित करें:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# मानक लेआउट बनाएं
mkdir -p src infra
```

एक सामान्य समाप्त लेआउट इस तरह दिखता है:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## चरण 2: `azure.yaml` लिखें

यह टेम्पलेट का दिल है। यह azd को बताता है कि क्या तैनात करना है और कैसे:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> `metadata.template` फ़ील्ड वह है जिसका उपयोग गैलरी टेलीमेट्री उपयोग को गिनने के लिए करती है। `name@version` कन्वेंशन का उपयोग करें।

---

## चरण 3: इन्फ्रास्ट्रक्चर को पैरामीटराइज़ करें

एक *पुन: उपयोग योग्य* टेम्पलेट के लिए सबसे महत्वपूर्ण नियम: **कभी नामों, क्षेत्रों, या सब्सक्रिप्शन-विशिष्ट मानों को हार्डकोड न करें।** पैरामीटर और रिसोर्स टोकन पैटर्न का उपयोग करें ताकि वही टेम्पलेट किसी के भी सब्सक्रिप्शन में काम करे।

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

दो चीजें इस टेम्पलेट-फ्रेंडली बनाती हैं:

1. **`azd-env-name` टैग** — azd इसका उपयोग प्रत्येक पर्यावरण के अनुसार संसाधनों को ट्रैक और साफ करने के लिए करता है।
2. **`uniqueString(...)` रिसोर्स टोकन** — एक स्थिर, वैश्विक-विशिष्ट_SUFFIX उत्पन्न करता है ताकि नाम टकराव न हों।

एक मेल खाने वाली पैरामीटर्स फ़ाइल प्रदान करें जो पर्यावरण से azd द्वारा इंजेक्ट किए गए मानों को पढ़े:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd वर्तमान पर्यावरण से `${AZURE_ENV_NAME}` और `${AZURE_LOCATION}` को स्वचालित रूप से प्रतिस्थापित करता है।

---

## चरण 4: अपने टेम्पलेट का स्थानीय रूप से परीक्षण करें

शेयर करने से पहले, साबित करें कि टेम्पलेट एक साफ़ स्थिति से काम करता है।

**स्थानीय फ़ोल्डर से परीक्षण करें** (कोई Git पुश आवश्यक नहीं):

```bash
# एक खाली निर्देशिका से, अपने स्थानीय टेम्पलेट पथ का उपयोग करके आरंभ करें
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# प्रावधान और तैनाती अंत-से-अंत करें
azd auth login
azd up
```

**फिर teardown का परीक्षण करें**—एक अच्छा टेम्पलेट पूरी तरह से साफ़ करता है:

```bash
azd down --force --purge
```

यदि `azd down` संसाधन पीछे छोड़ देता है, तो संभवतः आपने किसी संसाधन पर `azd-env-name` टैग छुटा दिया है।

> **टिप:** पहले `azd provision --preview` चलाएँ। यह एक what-if प्रदर्शन करता है और किसी संसाधन के बनाए जाने से पहले टेम्पलेट त्रुटियों को सामने लाता है।

---

## चरण 5: टेम्पलेट प्रकाशित करें

रिपॉज़िटरी को GitHub पर पुश करें (यदि आप चाहते हैं कि अन्य लोग इसका उपयोग करें तो सार्वजनिक):

```bash
gh repo create my-azd-template --public --source=. --push
```

अब कोई भी इसे उपयोग कर सकता है:

```bash
azd init --template your-github-username/my-azd-template
```

---

## चरण 6 (वैकल्पिक): Awesome AZD में सबमिट करें

[Awesome AZD गैलरी](https://azure.github.io/awesome-azd/) समुदाय टेम्पलेट्स को सूचीबद्ध करती है। सूचीबद्ध होने के लिए आपकी रिपो में शामिल होना चाहिए:

- ✅ एक स्पष्ट `README.md` जिसमें पूर्वापेक्षाएँ, एक आर्किटेक्चर आरेख, और लागत नोट्स हों
- ✅ एक कार्यशील `azure.yaml` जिसमें `metadata.template` हो
- ✅ ऐसा इन्फ्रास्ट्रक्चर जो एक ताज़ा सब्सक्रिप्शन में साफ़-सुथरा रूप से प्रावधान करे
- ✅ एक `LICENSE` फ़ाइल
- ✅ (अनुशंसित) एक-क्लिक Codespaces के लिए `.devcontainer/`

गैलरी के डेटा फ़ाइल में अपना टेम्पलेट जोड़ने वाला पुल रिक्वेस्ट खोलकर सबमिट करें, और योगदान गाइड का पालन करें [Awesome AZD repository](https://github.com/Azure/awesome-azd) में।

---

## सामान्य गलतियाँ

| समस्या | समाधान |
|---------|-----|
| हार्डकोड किए गए संसाधन नाम | `uniqueString()` रिसोर्स टोकन का उपयोग करें |
| `azd down` संसाधन छोड़ देता है | प्रत्येक संसाधन (या रिसोर्स ग्रुप) पर `azd-env-name` टैग लगाएँ |
| टेम्पलेट आपके लिए काम करता है, दूसरों के लिए असफल होता है | सब्सक्रिप्शन IDs, टेनेन्ट IDs, और क्षेत्र संबंधी मान्यताओं को हटा दें |
| आउटपुट्स एप में वायर्ड नहीं हैं | `SERVICE_<NAME>_ENDPOINT_URL` और अन्य `AZURE_*` आउटपुट्स को एक्सपोर्ट करें |
| गैलरी सबमिशन अस्वीकृत | `README.md`, `LICENSE`, और `metadata.template` जोड़ें |

---

## सारांश

- एक टेम्पलेट केवल एक Git रिपॉज़िटरी है जिसमें `azure.yaml`, `infra/`, और आपका कोड होता है।
- सब कुछ पैरामीटराइज़ करें—नाम, क्षेत्र, और IDs—ताकि यह कहीं भी चले।
- हमेशा संसाधनों को `azd-env-name` से टैग करें ताकि `azd down` काम करे।
- प्रकाशित करने से पहले `azd init --template <local-path>` के साथ स्थानीय रूप से परीक्षण करें।
- Awesome AZD में सबमिट करने के लिए मेटाडाटा और README जोड़ें।

---

## 🔗 नेविगेशन

| दिशा | संसाधन |
|-----------|----------|
| **पिछला** | [Deployment Guide](deployment-guide.md) |
| **अध्याय गृह** | [Chapter 4: Infrastructure as Code](README.md) |
| **अगला अध्याय** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 संबंधित संसाधन

- [संसाधनों का प्रावधान](provisioning.md)
- [Awesome AZD गैलरी](https://azure.github.io/awesome-azd/)
- [आधिकारिक azd टेम्पलेट दस्तावेज़](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->