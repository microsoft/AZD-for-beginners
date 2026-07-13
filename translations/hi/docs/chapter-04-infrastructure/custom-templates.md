# अपना खुद का azd टेम्प्लेट बनाना

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 4 - इन्फ्रास्ट्रक्चर एज कोड और डिप्लॉयमेंट
- **⬅️ पिछला**: [Deployment Guide](deployment-guide.md)
- **🚀 अगला अध्याय**: [अध्याय 5: मल्टी-एजेंट समाधान](../chapter-05-multi-agent/README.md)

> जुलाई 2026 में `azd 1.27.1` के खिलाफ सत्यापित।

## परिचय

अब तक आपने टेम्प्लेट्स को `azd init --template <name>` के साथ *उपयोग* किया है। लेकिन एक बार जब आपके पास आपकी टीम को पसंद आने वाला प्रोजेक्ट लेआउट होता है—जैसे कि एक कंटेनर ऐप के साथ एक कॉस्मॉस DB और सही मॉनिटरिंग—तो आप इसे अपनी खुद की पुन: उपयोग योग्य टेम्प्लेट में बदलना चाहेंगे। एक टेम्प्लेट सिर्फ एक Git रिपॉजिटरी है जिसमे एक अनुमानित संरचना होती है जिसे azd पढ़ना जानता है। यह पाठ आपको यह दिखाता है कि इसे स्क्रैच से कैसे बनाया जाए, परीक्षण करें, और (वैकल्पिक रूप से) समुदाय के गैलेरी में कैसे प्रकाशित करें।

## सीखने के लक्ष्य

इस पाठ के अंत तक, आप:
- समझेंगे कि एक फ़ोल्डर को "azd टेम्प्लेट" क्या बनाता है
- आवश्यक फ़ाइलें और फ़ोल्डर लेआउट जानेंगे
- एक `azure.yaml` और `infra/` जोड़ेंगे जिसे दूसरे लोग पुनः उपयोग कर सकें
- साझा करने से पहले अपने टेम्प्लेट का स्थानीय रूप से परीक्षण करेंगे
- प्रकाशित करेंगे और (वैकल्पिक रूप से) इसे Awesome AZD में सबमिट करेंगे

## सीखने के परिणाम

इस पाठ को पूरा करने के बाद, आप सक्षम होंगे:
- एक नया टेम्प्लेट रिपॉजिटरी स्कैफोल्ड करें
- इन्फ्रास्ट्रक्चर को पैरामीटराइज़ करें ताकि यह किसी भी सब्सक्रिप्शन में काम करे
- `azd init` और `azd up` के साथ एक टेम्प्लेट को सत्यापित करें
- वह मेटाडेटा जोड़ें जो समुदाय गैलेरी को चाहिए

---

## टेम्प्लेट वास्तव में क्या है?

एक azd टेम्प्लेट **एक Git रिपॉजिटरी** है जिसमें, न्यूनतम रूप से:

| फ़ाइल / फ़ोल्डर | उद्देश्य | आवश्यक? |
|---------------|---------|-----------|
| `azure.yaml` | सेवाओं, होस्ट और इन्फ्रास्ट्रक्चर प्रदाता का वर्णन करता है | ✅ हाँ |
| `infra/` | रिसोर्सेज प्रोविजन करने के लिए बाइसेप, टेराफॉर्म, या पुलुमी | ✅ हाँ |
| `src/` (या आपका कोड) | एज़ड द्वारा डिप्लॉय किया जाने वाला एप्लिकेशन कोड | ✅ हाँ |
| `README.md` | टेम्प्लेट का उपयोग कैसे करें | ✅ अत्यधिक अनुशंसित |
| `.azdo/` या `.github/` | CI/CD पाइपलाइन परिभाषाएं | वैकल्पिक |
| `.devcontainer/` | पुनरुत्पादनीय विकास वातावरण | वैकल्पिक |
| `azure.yaml` `metadata` | गैलेरी और टेलीमेट्री सूचना | वैकल्पिक (प्रकाशित करने के लिए आवश्यक) |

इसमें कोई जादू नहीं है: जब आप `azd init --template you/your-repo` चलाते हैं, azd रिपो को क्लोन करता है और `azure.yaml` पढ़ता है।

---

## चरण 1: रिपॉजिटरी स्कैफोल्ड करें

फ़ोल्डर संरचना को हाथ से बनाएँ या एक न्यूनतम टेम्प्लेट से शुरू करें और उसे संपादित करें:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# मानक लेआउट बनाएँ
mkdir -p src infra
```

एक सामान्य पूर्ण लेआउट इस प्रकार दिखता है:

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

यह टेम्प्लेट का हृदय है। यह azd को बताता है कि क्या डिप्लॉय करना है और कैसे:

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

> `metadata.template` फ़ील्ड गैलेरी टेलीमेट्री उपयोग को गिनती के लिए उपयोग करती है। `name@version` सम्मेलन का उपयोग करें।

---

## चरण 3: इन्फ्रास्ट्रक्चर पैरामीटराइज़ करें

एक *पुनः उपयोग योग्य* टेम्प्लेट के लिए सबसे महत्वपूर्ण नियम: **नाम, क्षेत्र, या सब्सक्रिप्शन-विशिष्ट मान कभी भी हार्डकोड न करें।** पैरामीटर और रिसोर्स टोकन पैटर्न का उपयोग करें ताकि वही टेम्प्लेट किसी के भी सब्सक्रिप्शन में काम कर सके।

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

यह टेम्प्लेट-अनुकूल बनाने वाली दो चीजें हैं:

1. **`azd-env-name` टैग** — azd इसका उपयोग प्रत्येक वातावरण के संसाधनों को ट्रैक और साफ़ करने के लिए करता है।
2. **`uniqueString(...)` रिसोर्स टोकन** — एक स्थिर, विश्वव्यापी-विशिष्ट उपसर्ग बनाता है ताकि नाम टकराएं नहीं।

एक मेल खाते पैरामीटर फ़ाइल प्रदान करें जो वातावरण से azd द्वारा इंजेक्ट किए गए मान पढ़ती है:

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

azd वर्तमान वातावरण से `${AZURE_ENV_NAME}` और `${AZURE_LOCATION}` को स्वचालित रूप से प्रतिस्थापित करता है।

---

## चरण 4: अपना टेम्प्लेट स्थानीय रूप से परीक्षण करें

साझा करने से पहले, साबित करें कि टेम्प्लेट एक साफ़ स्थिति से काम करता है।

**स्थानीय फ़ोल्डर से परीक्षण करें** (कोई Git पुश आवश्यक नहीं):

```bash
# एक खाली निर्देशिका से, अपने स्थानीय टेम्पलेट पथ का उपयोग करके प्रारंभ करें
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# अंत तक प्रावधान और तैनात करें
azd auth login
azd up
```

**फिर टेस्ट डाउन** — एक अच्छा टेम्प्लेट पूरी तरह से साफ़ कर देता है:

```bash
azd down --force --purge
```

अगर `azd down` संसाधन पीछे छोड़ता है, तो आपने संभवतः एक संसाधन पर `azd-env-name` टैग नहीं लगाया।

> **टिप:** पहले `azd provision --preview` चलाएँ। यह एक what-if करता है और संसाधन बनाए जाने से पहले टेम्प्लेट त्रुटियों को दिखाता है।

---

## चरण 5: टेम्प्लेट प्रकाशित करें

रिपॉजिटरी को GitHub पर पुश करें (यदि आप चाहते हैं कि अन्य लोग इसका उपयोग करें तो सार्वजनिक करें):

```bash
gh repo create my-azd-template --public --source=. --push
```

कोई भी अब इसका उपयोग कर सकता है:

```bash
azd init --template your-github-username/my-azd-template
```

---

## चरण 6 (वैकल्पिक): Awesome AZD में सबमिट करें

[Awesome AZD गैलेरी](https://azure.github.io/awesome-azd/) समुदाय टेम्प्लेट्स को सूचीबद्ध करती है। सूचीबद्ध होने के लिए आपका रिपॉजिटरी शामिल होना चाहिए:

- ✅ एक स्पष्ट `README.md` जिसमें आवश्यकताएँ, एक आर्किटेक्चर डायग्राम, और लागत नोट्स हों
- ✅ एक कार्यशील `azure.yaml` जिसमें `metadata.template` हो
- ✅ एक इन्फ्रास्ट्रक्चर जो एक नए सब्सक्रिप्शन में साफ़ सुथरे तरीके से प्रोविजन करता हो
- ✅ एक `LICENSE` फ़ाइल
- ✅ (अनुशंसित) एक `.devcontainer/` एक-क्लिक कोडस्पेस के लिए

योगदान मार्गदर्शिका का पालन करते हुए अपने टेम्प्लेट को गैलेरी के डेटा फ़ाइल में जोड़ने वाला एक पुल रिक्वेस्ट खोलकर सबमिट करें, जो [Awesome AZD रिपॉजिटरी](https://github.com/Azure/awesome-azd) में है।

---

## सामान्य गलतियाँ

| गलती | सुधार |
|---------|-----|
| हार्डकोडेड संसाधन नाम | `uniqueString()` रिसोर्स टोकन का उपयोग करें |
| `azd down` संसाधन छोड़ देता है | हर संसाधन (या संसाधन समूह) को `azd-env-name` टैग करें |
| टेम्प्लेट आपके लिए काम करता है, दूसरों के लिए विफल | सब्सक्रिप्शन आईडी, टेनेन्ट आईडी, और क्षेत्र के अनुमान हटाएं |
| आउटपुट ऐप में जुड़े नहीं हैं | `SERVICE_<NAME>_ENDPOINT_URL` और अन्य `AZURE_*` आउटपुट एक्सपोर्ट करें |
| गैलेरी सबमिशन अस्वीकृत | `README.md`, `LICENSE`, और `metadata.template` जोड़ें |

---

## सारांश

- टेम्प्लेट सिर्फ एक Git रिपो है जिसमें `azure.yaml`, `infra/`, और आपका कोड होता है।
- सब कुछ पैरामीटराइज करें — नाम, क्षेत्र, और IDs — ताकि यह कहीं भी चले।
- हमेशा संसाधनों को `azd-env-name` टैग से टैग करें ताकि `azd down` काम करे।
- प्रकाशित करने से पहले `azd init --template <local-path>` से स्थानीय रूप से परीक्षण करें।
- मेटाडेटा और README जोड़ें ताकि Awesome AZD में सबमिट किया जा सके।

---

## 🔗 नेविगेशन

| दिशा | संसाधन |
|-----------|----------|
| **पिछला** | [Deployment Guide](deployment-guide.md) |
| **अध्याय होम** | [अध्याय 4: इन्फ्रास्ट्रक्चर एज कोड](README.md) |
| **अगला अध्याय** | [अध्याय 5: मल्टी-एजेंट समाधान](../chapter-05-multi-agent/README.md) |

## 📖 संबंधित संसाधन

- [प्रोविजनिंग रिसोर्सेज](provisioning.md)
- [Awesome AZD गैलेरी](https://azure.github.io/awesome-azd/)
- [आधिकारिक azd टेम्प्लेट दस्तावेज़](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या अशुद्धियाँ हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में ही प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->