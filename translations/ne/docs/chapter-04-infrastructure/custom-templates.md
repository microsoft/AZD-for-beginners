# आफ्नो azd टेम्पलेट लेख्ने

**अध्याय नेभिगेसन:**
- **📚 पाठ्यक्रम गृहपृष्ठ**: [AZD प्रारम्भकर्ताहरूका लागि](../../README.md)
- **📖 Current Chapter**: अध्याय ४ - इन्फ्रास्ट्रक्चर (कोडका रूपमा) र परिनियोजन
- **⬅️ अघिल्लो**: [परिनियोजन मार्गदर्शिका](deployment-guide.md)
- **🚀 अर्को अध्याय**: [अध्याय ५: बहु-एजेन्ट समाधानहरू](../chapter-05-multi-agent/README.md)

> जुन 2026 मा `azd 1.25.6` सँग मान्य गरिएको।

## परिचय

अबसम्म तपाईंले *प्रयोग* गरिएका टेम्पलेटहरू `azd init --template <name>` सँग उपभोग गर्नुभएको छ। तर एकपटक तपाइँसँग टिमले मन पराउने प्रोजेक्ट लेआउट—जस्तै, Cosmos DB र उपयुक्त मोनिटरिङ सहितको Container App—भएपछि, तपाइँले यसलाई आफ्नै पुन:प्रयोगयोग्य टेम्पलेटमा बदल्न चाहनुहुनेछ। टेम्पलेट भनेको azd ले पढ्न जान्ने पूर्वानुमेय संरचना भएको Git रिपोजिटरी हो। यस पाठले तपाईंलाई शून्यबाट एउटा बनाउने, परीक्षण गर्ने, र (वैकल्पिक रूपमा) समुदाय ग्यालेरीमा प्रकाशित गर्ने तरिका देखाउँछ।

## सिकाइ लक्ष्यहरू

यस पाठको अन्त्यसम्म, तपाईंले:
- एउटा फोल्डरलाई "azd template" बनाउने तत्वहरू बुझ्ने
- आवश्यक फाइलहरू र फोल्डर लेआउट जान्ने
- अरूले पुन:प्रयोग गर्न सक्ने `azure.yaml` र `infra/` थप्ने
- साझेदारी गर्नु अघि आफ्नो टेम्पलेट स्थानीय रूपमा परीक्षण गर्ने
- यसलाई प्रकाशित गर्ने र (वैकल्पिक) Awesome AZD मा सबमिट गर्ने

## सिकाइ नतिजाहरू

यस पाठ पूरा गरेपछि, तपाईं सक्षम हुनुहुनेछ:
- नयाँ टेम्पलेट रिपोजिटरी स्क्याफोल्ड गर्न सक्ने
- पूर्वाधारलाई प्यारामिटराइज गरी जुनसुकै सब्स्क्रिप्शनमा काम गर्ने बनाउने
- `azd init` र `azd up` सँग टेम्पलेट मान्य गर्ने
- समुदाय ग्यालेरीले माग्ने मेटाडाटा थप्ने

---

## वास्तवमा टेम्पलेट के हो?

An azd template is **a Git repository** that contains, at minimum:

| फाइल / फोल्डर | उद्देश्य | आवश्यक? |
|---------------|---------|-----------|
| `azure.yaml` | सर्भिसहरू, होस्टहरू, र इन्फ्रा प्रदायकलाई वर्णन गर्छ | ✅ हो |
| `infra/` | स्रोतहरू प्रोभिजन गर्ने Bicep, Terraform, वा Pulumi | ✅ हो |
| `src/` (वा तपाईंको कोड) | azd ले डिप्लोय गर्ने एप्लिकेसन कोड | ✅ हो |
| `README.md` | टेम्पलेट कसरी प्रयोग गर्ने | ✅ कडा सिफारिस |
| `.azdo/` or `.github/` | CI/CD पाइपलाइन परिभाषाहरू | वैकल्पिक |
| `.devcontainer/` | पुनरुत्पादनयोग्य विकास वातावरण | वैकल्पिक |
| `azure.yaml` `metadata` | ग्यालेरी + टेलिमेट्री जानकारी | वैकल्पिक (प्रकाशन गर्न आवश्यक) |

यहाँ कुनै जादु छैन: जब तपाईं `azd init --template you/your-repo` चलाउनुहुन्छ, azd ले रेपो क्लोन गर्छ र `azure.yaml` पढ्छ।

---

## चरण १: रिपोजिटरीको आधार संरचना तयार पार्ने

फोल्डर संरचना हातले सिर्जना गर्नुहोस् वा न्यूनतम टेम्पलेटबाट सुरु गरेर सम्पादन गर्नुहोस्:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# मानक लेआउट सिर्जना गर्नुहोस्
mkdir -p src infra
```

A typical finished layout looks like this:

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

## चरण २: `azure.yaml` लेख्नुहोस्

यो टेम्पलेटको मुटु हो। यसले azd लाई के र कसरी डिप्लोय गर्ने बताउँछ:

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

> `metadata.template` फिल्ड ग्यालेरी टेलिमेट्रीले प्रयोग गन्न प्रयोग गर्ने फिल्ड हो। `name@version` कन्वेन्सन प्रयोग गर्नुहोस्।

---

## चरण ३: पूर्वाधारलाई प्यारामिटराइज गर्ने

पुनःप्रयोगयोग्य टेम्पलेटका लागि सबैभन्दा महत्वपूर्ण नियम: **कहिल्यै नामहरू, क्षेत्रहरू, वा सब्सक्रिप्शन-विशेष मानहरू हार्डकोड नगर्नुहोस्।** प्यारामिटरहरू र रिसोर्स टोकन ढाँचा प्रयोग गर्नुहोस् ताकि एउटै टेम्पलेट कुनै पनि व्यक्तिको सब्स्क्रिप्शनमा काम गरोस्।

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

यी दुई कुराले यसलाई टेम्पलेट-मैत्री बनाउँछ:

1. **`azd-env-name` tag** — azd ले यसलाई वातावरणप्रति स्रोतहरू ट्र्याक र क्लिनअप गर्न प्रयोग गर्छ।
2. **`uniqueString(...)` resource token** — नामहरू टकरान नदिन स्थिर, विश्वव्यापी अनन्य उपसर्ग उत्पादन गर्दछ।

एउटा मिल्दोजुल्दो प्यारामिटर फाइल प्रदान गर्नुहोस् जुन वातावरणबाट azd द्वारा इन्जेक्ट गरिएका मानहरू पढ्छ:

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

azd ले वर्तमान वातावरणबाट `${AZURE_ENV_NAME}` र `${AZURE_LOCATION}` स्वतः प्रतिस्थापन गर्छ।

---

## चरण ४: आफ्नो टेम्पलेट स्थानीय रूपमा परीक्षण गर्नुहोस्

साझा गर्नु अघि, सफा अवस्थाबाट टेम्पलेटले काम गर्छ भनेर प्रमाणित गर्नुहोस्।

**स्थानीय फोल्डरबाट परीक्षण** (Git push आवश्यक छैन):

```bash
# खाली निर्देशिकाबाट, आफ्नो स्थानीय टेम्पलेट पथ प्रयोग गरेर प्रारम्भ गर्नुहोस्
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# सुरु देखि अन्त्यसम्म प्राविजन र तैनाथ गर्नुहोस्
azd auth login
azd up
```

**पछि teardown परीक्षण**—राम्रो टेम्पलेटले पूर्ण रूपमा क्लिनअप गर्छ:

```bash
azd down --force --purge
```

यदि `azd down` ले स्रोतहरू फर्केर छोड्छ भने, सम्भवतः तपाईंले स्रोतमा `azd-env-name` ट्याग छुटाउनु भएको छ।

> **सुझाव:** पहिले `azd provision --preview` चलाउनुहोस्। यसले what-if गर्दछ र कुनै स्रोत सिर्जना हुनु अघि टेम्पलेट त्रुटिहरू देखाउँछ।

---

## चरण ५: टेम्पलेट प्रकाशित गर्ने

रिपोजिटरी GitHub मा push गर्नुहोस् (यदि अरूले प्रयोग गर्न चाहनुहुन्छ भने public गर्नुहोस्):

```bash
gh repo create my-azd-template --public --source=. --push
```

अब जो कोहीले यसलाई प्रयोग गर्न सक्छ:

```bash
azd init --template your-github-username/my-azd-template
```

---

## चरण ६ (वैकल्पिक): Awesome AZD मा सबमिट गर्ने

The [Awesome AZD ग्यालेरी](https://azure.github.io/awesome-azd/) ले समुदायका टेम्पलेटहरू सूचीबद्ध गर्छ। सूचीमा आउने गरी तपाइँको रेपोले समावेश गर्नुपर्छ:

- ✅ स्पष्ट `README.md` जसमा पूर्वआवश्यकताहरू, आर्किटेक्चर डायग्राम, र लागत नोटहरू समावेश गरिएका छन्
- ✅ `metadata.template` सहित काम गर्ने `azure.yaml`
- ✅ नयाँ सब्स्क्रिप्शनमा सफा रूपमा प्रोभिजन हुने पूर्वाधार
- ✅ एक `LICENSE` फाइल
- ✅ (सिफारिस) एक-क्लिक Codespaces का लागि `.devcontainer/`

ग्यालेरीको डेटा फाइलमा तपाईंको टेम्पलेट थप्ने pull request खोलेर सबमिट गर्नुहोस्, योगदान मार्गदर्शिका अनुसरण गर्दै [Awesome AZD रिपोजिटरी](https://github.com/Azure/awesome-azd) मा।

---

## सामान्य गल्तीहरू

| समस्या | समाधान |
|---------|-----|
| हार्डकोड गरिएको स्रोत नामहरू | `uniqueString()` रिसोर्स टोकन प्रयोग गर्नुहोस् |
| `azd down` स्रोतहरू छोड्छ | हरेक स्रोत (वा स्रोत समूह) लाई `azd-env-name` ट्याग गर्नुहोस् |
| टेम्पलेट तपाईंको लागि काम गर्छ, अरूको लागि असफल हुन्छ | सब्स्क्रिप्शन IDs, tenant IDs, र क्षेत्र सम्बन्धी अनुमानहरू हटाउनुहोस् |
| आउटपुटहरू एपमा जोडिएका छैनन् | `SERVICE_<NAME>_ENDPOINT_URL` र अन्य `AZURE_*` आउटपुटहरू निर्यात गर्नुहोस् |
| ग्यालेरी सबमिशन अस्वीकृत | `README.md`, `LICENSE`, र `metadata.template` थप्नुहोस् |

---

## सारांश

- एक टेम्पलेट केवल `azure.yaml`, `infra/`, र तपाईंको कोड भएको Git रिपो हो।
- सबै कुरा प्यारामिटराइज गर्नुहोस्—नामहरू, क्षेत्रहरू, र IDs—ताकि यो जहाँसुकै चलोस्।
- `azd down` काम गरोस् भनी हरेक स्रोतमा सधैं `azd-env-name` ट्याग गर्नुहोस्।
- प्रकाशित गर्नु अघि `azd init --template <local-path>` संग स्थानीय रूपमा परीक्षण गर्नुहोस्।
- Awesome AZD मा सबमिट गर्न मेटाडाटा र README थप्नुहोस्।

---

## 🔗 नेभिगेसन

| दिशा | स्रोत |
|-----------|----------|
| **अघिल्लो** | [परिनियोजन मार्गदर्शिका](deployment-guide.md) |
| **अध्याय गृहपृष्ठ** | [अध्याय ४: इन्फ्रास्ट्रक्चर (कोडका रूपमा)](README.md) |
| **अर्को अध्याय** | [अध्याय ५: बहु-एजेन्ट समाधानहरू](../chapter-05-multi-agent/README.md) |

## 📖 सम्बन्धित स्रोतहरू

- [स्रोतहरूको प्रोभिजन](provisioning.md)
- [Awesome AZD ग्यालेरी](https://azure.github.io/awesome-azd/)
- [अधिकारिक azd टेम्पलेट दस्तावेज](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->