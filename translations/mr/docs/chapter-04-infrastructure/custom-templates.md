# आपले स्वतःचे azd टेम्पलेट तयार करणे

**Chapter Navigation:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 सध्याचा अध्याय**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ पूर्वीचा**: [डिप्लॉयमेंट मार्गदर्शक](deployment-guide.md)
- **🚀 पुढील अध्याय**: [अध्याय 5: मल्टी-एजंट सोल्यूशन्स](../chapter-05-multi-agent/README.md)

> `azd 1.25.6` सोबत जून 2026 मध्ये पडताळले गेले.

## परिचय

आत्तापर्यंत आपण `azd init --template <name>` सह टेम्पलेट्स *वापरले* आहेत. परंतु एकदा तुमच्या टीमला आवडणारे प्रकल्प लेआउट—उदा., एक Container App सह Cosmos DB आणि योग्य मॉनिटरिंग—आपल्याकडे असेल, तर आपण ते आपल्या स्वतःच्या पुनर्वापर करण्यायोग्य टेम्पलेटमध्ये रूपांतरित करू इच्छिता. टेम्पलेट म्हणजे फक्त एक Git रिपॉझिटरी आहे ज्यात अशी पूर्वनिर्धारित रचना असते जी azd वाचण्यास जाणते. ही धडा तुम्हाला शून्यातून एक तयार कसे करायचे, त्याची चाचणी कशी करायची आणि (ऐच्छिक) समुदाय गॅलरीमध्ये कशी प्रकाशित करायची हे दाखवते.

## शिकण्याचे उद्दिष्टे

या धड्याच्या शेवटी, आपण:
- फोल्डर कोणाला "azd template" बनवते हे समजून घ्याल
- आवश्यक फाइल्स आणि फोल्डर लेआउट जाणून घ्याल
- इतर लोक वापरू शकतील असे `azure.yaml` आणि `infra/` जोडा
- सामायिक करण्यापूर्वी स्थानिकरित्या तुमचे टेम्पलेट चाचणी करा
- ते प्रकाशित करा आणि (ऐच्छिक) Awesome AZD मध्ये सबमिट करा

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, आपण सक्षम असाल:
- नवीन टेम्पलेट रिपॉझिटरी तयार करणे
- इन्फ्रास्ट्रक्चर पॅरामीटर करणे जेणेकरून ते कोणत्याही सबस्क्रिप्शनमध्ये काम करेल
- `azd init` आणि `azd up` सह टेम्पलेट सत्यापित करणे
- समुदाय गॅलरीसाठी आवश्यक मेटाडेटा जोडणे

---

## टेम्पलेट म्हणजे खरेतर काय?

एक azd टेम्पलेट म्हणजे **एक Git रिपॉझिटरी** जी किमान खालील गोष्टी समाविष्ट करते:

| फाइल / फोल्डर | उद्देश | आवश्यक? |
|---------------|---------|-----------|
| `azure.yaml` | सेवा, होस्ट आणि इन्फ्रा प्रोव्हायडरचे वर्णन करते | ✅ होय |
| `infra/` | रिसोर्स प्राव्हिजन करणारे Bicep, Terraform, किंवा Pulumi | ✅ होय |
| `src/` (किंवा तुमचा कोड) | azd जे अॅप्लॉय करतो ते अॅप्लिकेशन कोड | ✅ होय |
| `README.md` | टेम्पलेट कसे वापरायचे | ✅ कठोरपणे शिफारस केलेले |
| `.azdo/` किंवा `.github/` | CI/CD पाइपलाइन परिभाषा | पर्यायी |
| `.devcontainer/` | पुनरुत्पादनीय dev वातावरण | पर्यायी |
| `azure.yaml` `metadata` | गॅलरी आणि टेलिमेट्री माहिती | पर्यायी (प्रकाशित करण्यासाठी आवश्यक) |

इथे काही जादू नाही: जेव्हा आपण `azd init --template you/your-repo` चालवता, azd रेपो क्लोन करते आणि `azure.yaml` वाचते.

---

## पायरी 1: रिपॉझिटरी स्कॅफोल्ड करा

फोल्डर रचना हाताने तयार करा किंवा किमान टेम्पलेट पासून सुरू करा आणि संपादित करा:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# मानक लेआउट तयार करा
mkdir -p src infra
```

सामान्य पूर्ण लेआउट असे दिसते:

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

## पायरी 2: `azure.yaml` लिहा

हा टेम्पलेटचा हृदय आहे. हे azd ला काय डिप्लॉय करायचे आणि कसे हे सांगते:

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

> `metadata.template` फील्ड हा गॅलरी टेलिमेट्री वापरतो वापर मोजण्यासाठी. `name@version` कन्व्हेन्शन वापरा.

---

## पायरी 3: इन्फ्रास्ट्रक्चर पॅरामीटर करा

*पुनर्वापर करण्यायोग्य* टेम्पलेटसाठी एकच सर्वात महत्वाचा नियम: **नाव, प्रदेश किंवा सबस्क्रिप्शन-विशिष्ट मूल्ये कधीही हार्डकोड करू नका.** पॅरामीटर्स आणि रिसोर्स टोकन पॅटर्न वापरा त्यामुळे तोच टेम्पलेट कोणाच्या सबस्क्रिप्शनमध्येही काम करेल.

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

हे टेम्पलेट-फ्रेंडली बनवणारी दोन गोष्टी:

1. **`azd-env-name` tag** — azd हे प्रत्येक वातावरणानुसार संसाधने ट्रॅक आणि साफ करण्यासाठी वापरते.
2. **`uniqueString(...)` resource token** — स्थिर, जागतिक-विशिष्ट उपसर्ग तयार करते जेणेकरून नावे टकरावू नयेत.

पर्यायी पॅरामीटर्स फाइल द्या जी वातावरणातून azd अंतःप्रविष्ट करतो ती मूल्ये वाचते:

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

azd वर्तमान वातावरणातून `${AZURE_ENV_NAME}` आणि `${AZURE_LOCATION}` आपोआप प्रतिस्थापित करते.

---

## पायरी 4: तुमचे टेम्पलेट स्थानिकरित्या चाचणी करा

सामायिक करण्यापूर्वी, स्वच्छ स्थितीतून टेम्पलेट कार्यरत असल्याचे सिद्ध करा.

**स्थानिक फोल्डरमधून चाचणी करा** (Git पुश आवश्यक नाही):

```bash
# रिकाम्या निर्देशिकेतून आपल्या स्थानिक टेम्पलेट मार्गाचा वापर करून प्रारंभ करा
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# प्राव्हिजन करा आणि अखेरपर्यंत तैनात करा
azd auth login
azd up
```

**मग teardown ची चाचणी करा**—एक चांगले टेम्पलेट पूर्णपणे साफ करते:

```bash
azd down --force --purge
```

जर `azd down` संसाधने मागे ठेवत असेल, तर शक्यतो तुम्ही एखाद्या रिसोर्सवर `azd-env-name` टॅग लावणे चुकवले आहे.

> **टीप:** प्रथम `azd provision --preview` चालवा. हा एक what-if करतो आणि कोणतेही रिसोर्स तयार होण्यापूर्वी टेम्पलेट त्रुटी उघड करतो.

---

## पायरी 5: टेम्पलेट प्रकाशित करा

रिपॉझिटरी GitHub वर पुश करा (इतर लोक वापरू शकतील तर सार्वजनिक):

```bash
gh repo create my-azd-template --public --source=. --push
```

आता कोणतीही व्यक्ती हे वापरू शकते:

```bash
azd init --template your-github-username/my-azd-template
```

---

## पायरी 6 (ऐच्छिक): Awesome AZD मध्ये सबमिट करा

[Awesome AZD गॅलरी](https://azure.github.io/awesome-azd/) समुदाय टेम्पलेट्सची यादी करते. सूचीबद्ध होण्यासाठी तुमच्या रेपोमध्ये हे असावे:

- ✅ स्पष्ट `README.md` ज्यात पूर्वअट, आर्किटेक्चर आकृती आणि खर्चाच्या टीपा असतील
- ✅ कार्यरत `azure.yaml` ज्यात `metadata.template` असेल
- ✅ नवीन सबस्क्रिप्शनमध्ये स्वच्छपणे प्राव्हिजन होणारी इन्फ्रास्ट्रक्चर
- ✅ `LICENSE` फाइल
- ✅ (शिफारस) एक-क्लिक Codespaces साठी `.devcontainer/`

गॅलरीच्या डेटा फाईलमध्ये तुमचे टेम्पलेट जोडणारा पुल विनंती उघडून सबमिट करा, आणि योगदान मार्गदर्शकानुसार [Awesome AZD रिपॉझिटरी](https://github.com/Azure/awesome-azd) येथे अनुसरा.

---

## सामान्य अडचणी

| अडचण | दुरुस्त |
|---------|-----|
| हार्डकोडेड रिसोर्स नावे | `uniqueString()` resource token वापरा |
| `azd down` संसाधने ठेवतो | प्रत्येक रिसोर्स (किंवा रिसोर्स ग्रुप) वर `azd-env-name` टॅग लावा |
| टेम्पलेट तुमच्यासाठी काम करते, इतरांसाठी अयशस्वी होते | सबस्क्रिप्शन आयडी, टेनंट आयडी आणि प्रदेशाच्या गृहीतका काढा |
| आउटपुट्स अॅपमध्ये वायर केलेले नाहीत | `SERVICE_<NAME>_ENDPOINT_URL` आणि इतर `AZURE_*` आउटपुट्स एक्सपोर्ट करा |
| गॅलरी सबमिशन नाकारले गेले | `README.md`, `LICENSE`, आणि `metadata.template` जोडा |

---

## सारांश

- टेम्पलेट म्हणजे फक्त `azure.yaml`, `infra/`, आणि तुमचा कोड असलेली Git रेपो आहे.
- सर्वकाही पॅरामीटर करा—नावे, प्रदेश आणि आयडी—जेणेकरून ते कुठेही चालेल.
- नेहमी `azd-env-name` सह रिसोर्सेसवर टॅग लावा जेणेकरून `azd down` काम करेल.
- प्रकाशित करण्यापूर्वी `azd init --template <local-path>` सह स्थानिकपणे चाचणी करा.
- Awesome AZD मध्ये सादर करण्यासाठी मेटाडेटा आणि README जोडा.

---

## 🔗 नेव्हिगेशन

| दिशा | स्रोत |
|-----------|----------|
| **पुर्वीचा** | [डिप्लॉयमेंट मार्गदर्शक](deployment-guide.md) |
| **Chapter Home** | [अध्याय 4: Infrastructure as Code](README.md) |
| **पुढील अध्याय** | [अध्याय 5: मल्टी-एजंट सोल्यूशन्स](../chapter-05-multi-agent/README.md) |

## 📖 संबंधित स्त्रोत

- [संसाधने प्रोव्हिजन करणे](provisioning.md)
- [Awesome AZD गॅलरी](https://azure.github.io/awesome-azd/)
- [अधिकृत azd टेम्पलेट दस्तऐवजीकरण](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->