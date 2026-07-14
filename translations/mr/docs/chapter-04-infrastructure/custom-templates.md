# आपले स्वतःचे azd टेम्प्लेट तयार करणे

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 चालू अध्याय**: अध्याय ४ - इन्फ्रास्ट्रक्चर एज कोड & डिप्लॉयमेंट
- **⬅️ मागील**: [Deployment Guide](deployment-guide.md)
- **🚀 पुढील अध्याय**: [अध्याय ५: मल्टी-एजंट सोल्यूशन्स](../chapter-05-multi-agent/README.md)

> `azd 1.27.1` विरुद्ध प्रमाणित जुलै 2026 मध्ये.

## परिचय

आतापर्यंत तुम्ही `azd init --template <name>` वापरून टेम्प्लेट्स *वापरले* आहेत. पण एकदा तुमच्या टीमला आवडेल असे प्रोजेक्ट लेआउट तयार झाले—जसे की, कॉस्मॉस DB सह कंटेनर अ‍ॅप आणि योग्य मॉनिटरिंग—तुम्हाला ते स्वतःचे पुनर्वापरू शकणारे टेम्प्लेट बनवायचे असेल. टेम्प्लेट म्हणजे फक्त एक Git रेपॉझिटरी ज्याची रचना निश्चित असते आणि azd ती कशी वाचावी ते माहित असते. हा धडा तुम्हाला शून्यापासून एक नवीन टेम्प्लेट तयार करण्याची, त्याची चाचणी करण्याची आणि (इच्छानुसार) ते समुदाय गॅलरीमध्ये प्रकाशित करण्याची माहिती देतो.

## शिकण्याचे उद्दिष्टे

या धड्याच्या शेवटी, तुम्ही:
- समजून घ्याल की "azd टेम्प्लेट" म्हणजे काय?
- आवश्यक फाइल्स आणि फोल्डर रचना ओळखाल
- `azure.yaml` आणि `infra/` कसे जोडायचे जे इतर लोक वापरू शकतील
- तुमचा टेम्प्लेट स्थानिक पद्धतीने कसा चाचणी करायचा ते शिका
- ते प्रकाशित करा आणि (इच्छानुसार) Awesome AZD मध्ये सबमिट करा

## शिकण्याचे परिणाम

हा धडा पूर्ण केल्यानंतर, तुम्ही पुढील बाबी करू शकता:
- नवीन टेम्प्लेट रेपॉझिटरी स्कॅफोल्ड करा
- इन्फ्रास्ट्रक्चरला कोणत्याही सबस्क्रिप्शनमध्ये काम करण्यायोग्य करण्यासाठी पॅरामीटराइज करा
- `azd init` आणि `azd up` वापरून टेम्प्लेटची चाचणी करा
- समुदाय गॅलरीसाठी आवश्यक मेटाडेटा जोडा

---

## टेम्प्लेट म्हणजे काय, खरोखर?

azd टेम्प्लेट म्हणजे **एक Git रेपॉझिटरी** ज्यामध्ये किमान असते:

| फाइल / फोल्डर | उद्देश | आवश्यक? |
|---------------|---------|-----------|
| `azure.yaml` | सेवा, होस्ट्स आणि इन्फ्राप्रदाता वर्णन करते | ✅ होय |
| `infra/` | बायसेप, टेराफॉर्म, किंवा पुलुमी ज्यामुळे संसाधने तयार केली जातात | ✅ होय |
| `src/` (किंवा तुमचा कोड) | अ‍ॅप्लिकेशन कोड ज्याला azd डिप्लॉय करते | ✅ होय |
| `README.md` | टेम्प्लेट वापरण्याचा मार्गदर्शन | ✅ अतिशय शिफारसीय |
| `.azdo/` किंवा `.github/` | CI/CD पाईपलाइन्सची व्याख्याने | ऐच्छिक |
| `.devcontainer/` | पुन्हा तयार करता येणारे डेवलपमेंट वातावरण | ऐच्छिक |
| `azure.yaml` मधील `metadata` | गॅलरी + टेलिमेट्री माहिती | ऐच्छिक (प्रकाशित करण्यासाठी आवश्यक) |

येथे काही जादू नाही: जेव्हा तुम्ही `azd init --template you/your-repo` चालवता, azd रेपॉ क्लोन करून `azure.yaml` वाचतो.

---

## टप्पा 1: रेपॉझिटरी स्कॅफोल्ड करा

फोल्डर रचना हाताने तयार करा किंवा किमान टेम्प्लेटवरून सुरू करा आणि ते संपादित करा:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# मानक लेआउट तयार करा
mkdir -p src infra
```

सामान्यतः पूर्ण झालेली रचना अशी दिसते:

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

## टप्पा 2: `azure.yaml` लिहा

हा टेम्प्लेटचा हृदय आहे. हा azd ला काय डिप्लॉय करायचे आहे आणि कसे हे सांगतो:

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

> `metadata.template` क्षेत्र गॅलरी टेलिमेट्री वापरते वापर प्रमाणित करण्यासाठी. `name@version` पद्धत वापरा.

---

## टप्पा 3: इन्फ्रास्ट्रक्चरला पॅरामीटराइज करा

एक *पुनर्वापरू शकणारे* टेम्प्लेटसाठी सर्वात महत्त्वाचा नियम: **नाव, प्रदेश किंवा सबस्क्रिप्शन-विशिष्ट मूल्ये कधीही हार्डकोड करू नका.** पॅरामीटर्स आणि रिसोर्स टोकन पॅटर्न वापरा जेणेकरून तोच टेम्प्लेट कोणाच्या सबस्क्रिप्शनमध्येही काम करेल.

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

दोन गोष्टी या टेम्प्लेटसाठी अनुकूल आहेत:

1. **`azd-env-name` टॅग** — azd प्रत्येक पर्यावरणात संसाधने ट्रॅक आणि साफसफाईसाठी वापरतो.
2. **`uniqueString(...)` रिसोर्स टोकन** — नावांचा टकराव टाळण्यासाठी स्थिर, जागतिक-विशिष्ट उपसर्ग तयार करतो.

पर्यावरणातून azd इंजेक्ट केलेली मूल्ये वाचणारी जुळणारी पॅरामीटर्स फाइल द्या:

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

azd सध्याच्या पर्यावरणातून स्वयंचलितपणे `${AZURE_ENV_NAME}` आणि `${AZURE_LOCATION}` ची जागा घेतो.

---

## टप्पा 4: स्थानिकपणे तुमचा टेम्प्लेट चाचणी करा

शेअर करण्यापूर्वी, साफ स्थितीतून टेम्प्लेट काम करते हे सिद्ध करा.

**स्थानिक फोल्डरमधून चाचणी करा** (Git पुश आवश्यक नाही):

```bash
# रिक्त निर्देशिकेतून, तुमच्या स्थानिक टेम्पलेट पाथ वापरून प्रारंभ करा
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# पूर्ण सत्रात प्राव्हिजन आणि तैनात करा
azd auth login
azd up
```

**मग teardown ची चाचणी करा** — एक चांगला टेम्प्लेट पूर्णपणे साफ करतो:

```bash
azd down --force --purge
```

जर `azd down` नंतर संसाधने उरलीत, तर कदाचित तुम्ही कोणत्यातरी संसाधनावर `azd-env-name` टॅग चुकून लावला नाही.

> **टीप:** आधी `azd provision --preview` चालवा. हे काय-जर विश्लेषण करते आणि कोणतीही संसाधने तयार होण्याआधी टेम्प्लेट त्रुटी दाखवते.

---

## टप्पा 5: टेम्प्लेट प्रकाशित करा

रेपॉझिटरी GitHub वर पुश करा (जर इतर लोकांसाठी सार्वजनिक असेल तर):

```bash
gh repo create my-azd-template --public --source=. --push
```

आता कोणत्याही व्यक्तीला ते वापरता येते:

```bash
azd init --template your-github-username/my-azd-template
```

---

## टप्पा 6 (ऐच्छिक): Awesome AZD मध्ये सबमिट करा

[Awesome AZD गॅलरी](https://azure.github.io/awesome-azd/) समुदाय टेम्प्लेट्सची यादी देते. तुमच्या रेपॉमध्ये असावे:

- ✅ स्पष्ट `README.md` ज्यात पूर्वअटी, आर्किटेक्चर आरेख, आणि खर्चाची नोंद असावी
- ✅ कार्यरत `azure.yaml` ज्यात `metadata.template` असावे
- ✅ इन्फ्रास्ट्रक्चर ज्यामुळे नवीन सबस्क्रिप्शनमध्ये स्वच्छ provisioning होईल
- ✅ एक `LICENSE` फाइल असावी
- ✅ (शिफारस केली आहे) एक-क्लिक Codespaces साठी `.devcontainer/`

Awesome AZD रेपॉ (https://github.com/Azure/awesome-azd) येथे योगदान मार्गदर्शना अनुसरून गॅलरी डेटा फाईलमध्ये तुमचा टेम्प्लेट जोडणारा पुल रिक्वेस्ट उघडून सबमिट करा.

---

## सामान्य चुका

| चूक | सुधारणा |
|---------|-----|
| हार्डकोड केलेली संसाधन नावे | `uniqueString()` रिसोर्स टोकन वापरा |
| `azd down` नंतर संसाधने उरतात | प्रत्येक संसाधनावर (किंवा रिसोर्स ग्रुपवर) `azd-env-name` टॅग लावा |
| टेम्प्लेट तुमच्यासाठी काम करतो, इतरांसाठी अयशस्वी होतो | सबस्क्रिप्शन आयडी, टेनंट आयडी, आणि प्रदेश संदर्भ वगळा |
| Outputs अ‍ॅपमध्ये जोडलेले नाहीत | `SERVICE_<NAME>_ENDPOINT_URL` आणि इतर `AZURE_*` Outputs निर्यात करा |
| गॅलरी सबमिशन नाकारले गेले | `README.md`, `LICENSE`, आणि `metadata.template` जोडा |

---

## सारांश

- टेम्प्लेट म्हणजे फक्त Git रेपॉ आहे ज्यामध्ये `azure.yaml`, `infra/`, आणि तुमचा कोड असतो.
- सर्वकाही पॅरामीटराइज करा—नावे, प्रदेश, आणि आयडी—जेणेकरून ते कुठेही चालेल.
- `azd-env-name` ने संसाधने नेहमी टॅग करा जेणेकरून `azd down` कार्यान्वित होईल.
- प्रकाशित करण्यापूर्वी `azd init --template <local-path>` सह स्थानिकपणे चाचणी करा.
- मेटाडेटा आणि README जोडा ज्यामुळे Awesome AZD मध्ये सबमिट करता येईल.

---

## 🔗 नेव्हिगेशन

| दिशा | साधन |
|-----------|----------|
| **मागील** | [Deployment Guide](deployment-guide.md) |
| **अध्याय होम** | [Chapter 4: Infrastructure as Code](README.md) |
| **पुढील अध्याय** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 संबंधित स्त्रोत

- [Resources Provisioning](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [अधिकृत azd टेम्प्लेट दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->