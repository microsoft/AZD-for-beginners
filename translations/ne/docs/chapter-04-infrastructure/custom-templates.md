# आफ्नो azd टेम्प्लेट सिर्जना गर्दै

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय ४ - इन्फ्रास्ट्रक्चर as कोड र डिप्लोयमेन्ट
- **⬅️ अघिल्लो**: [Deployment Guide](deployment-guide.md)
- **🚀 अर्को अध्याय**: [अध्याय ५: मल्टि-एजेन्ट समाधानहरू](../chapter-05-multi-agent/README.md)

> `azd 1.27.1` मा जुलाई २०२६ मा मान्य गरियो।

## परिचय

अहिलेसम्म तपाईंले `azd init --template <name>` प्रयोग गरेर टेम्प्लेटहरू *सेवन* गर्नुभयो। तर एक चोटि तपाईंको टोलीले मन पराएको परियोजना लेआउट - जस्तै, एक कन्टेनर एप जसमा Cosmos DB र उपयुक्त मोनिटरिङ छ - तपाईं यसलाई आफ्नो पुनःप्रयोग गर्न मिल्ने टेम्प्लेटमा बदल्न चाहनुहुन्छ। टेम्प्लेट भनेको एउटै Git रिपोजिटोरी हो जसको पूर्वानुमानित संरचना हुन्छ जुन azd ले कसरी पढ्ने थाहा छ। यो पाठले तपाईंलाई नयाँबाट कसरी बनाउने, परीक्षण गर्ने र (वैकल्पिक रूपमा) समुदाय ग्यालरीमा प्रकाशन गर्ने देखाउँछ।

## सिकाइ लक्ष्यहरू

यस पाठको अन्त्यसम्म, तपाईं:
- फोल्डरलाई "azd टेम्प्लेट" बनाउने कुराहरू बुझ्नुहुनेछ
- आवश्यक फाइलहरू र फोल्डर संरचना जान्नुहुनेछ
- अरूले पुनःप्रयोग गर्न सक्ने `azure.yaml` र `infra/` थप्नुहुनेछ
- साझेदारी गर्नु अघि आफ्नो टेम्प्लेट स्थानीय रूपमा परीक्षण गर्नुहुनेछ
- टेम्प्लेट प्रकाशन गर्नुहोस् र (वैकल्पिक रूपमा) Awesome AZD मा बुझाउनुहोस्

## सिकाइ परिणामहरू

यस पाठबाट पछिसम्म, तपाईं सक्षम हुनुहुनेछ:
- नयाँ टेम्प्लेट रिपोजिटोरी तयार गर्ने
- इन्फ्रास्ट्रक्चरलाई यस्तो बनाउने कि कुनै पनि सदस्यतामा काम गरोस्
- `azd init` र `azd up`सँग टेम्प्लेटको प्रमाणीकरण गर्ने
- समुदाय ग्यालरीको लागि आवश्यक मेटाडाटा थप्ने

---

## टेम्प्लेट भनेको के हो, साँच्चै?

azd टेम्प्लेट भनेको **Git रिपोजिटोरी** हो जसमा कम्तीमा तलको हुन्छ:

| फाइल / फोल्डर | उद्देश्य | आवश्यक? |
|---------------|---------|-----------|
| `azure.yaml` | सेवा, होस्टहरू, र इन्फ्रा प्रदायक वर्णन गर्दछ | ✅ हो |
| `infra/` | Bicep, Terraform वा Pulumi जसले स्रोतहरू प्रबन्ध गर्दछ | ✅ हो |
| `src/` (वा तपाईंको कोड) | एप्लिकेशन कोड जसलाई azd ले डिप्लोय गर्छ | ✅ हो |
| `README.md` | टेम्प्लेट प्रयोग गर्ने तरिका | ✅ धेरै सिफारिस गरिएको |
| `.azdo/` वा `.github/` | CI/CD पाइपलाइन परिभाषाहरू | वैकल्पिक |
| `.devcontainer/` | पुनर्निर्माण योग्य विकास वातावरण | वैकल्पिक |
| `azure.yaml` `metadata` | ग्यालरी + टेलिमेट्री जानकारी | वैकल्पिक (प्रकाशनका लागि आवश्यक) |

यहाँ केही जादू छैन: जब तपाईं `azd init --template you/your-repo` चलाउनुहुन्छ, azd ले रिपोजिटोरी क्लोन गर्छ र `azure.yaml` पढ्छ।

---

## चरण १: रिपोजिटोरी तयार पार्नुहोस्

फोल्डर संरचना हातले बनाउनुहोस् वा न्यूनतम टेम्प्लेटबाट सुरु गरेर सबैलाई सम्पादन गर्नुहोस्:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# मानक लेआउट बनाउनुहोस्
mkdir -p src infra
```

सामान्य समाप्त गरिएको लेआउट यस्तो देखिन्छ:

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

यो टेम्प्लेटको मुटु हो। यसले azd लाई के डिप्लोय गर्न र कसरी भन्ने बताउँछ:

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

> `metadata.template` फिल्ड ग्यालरी टेलिमेट्रीले प्रयोग गर्छ प्रयोग गन्न। `name@version` कनभेन्सन प्रयोग गर्नुहोस्।

---

## चरण ३: इन्फ्रास्ट्रक्चरलाई प्यारामिटराइज गर्नुहोस्

*पुनःप्रयोग गर्न मिल्ने* टेम्प्लेटको लागि सबैभन्दा महत्त्वपूर्ण नियम: **नामहरू, क्षेत्रहरू, वा सदस्यता-विशिष्ट मानहरू कहिल्यै हार्डकोड नगरिऊन्।** प्यारामिटरहरू र स्रोत टोकन ढाँचाको प्रयोग गर्नुहोस् ताकि एउटै टेम्प्लेट कुनै पनि सदस्यतामा काम गरोस।

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

यसले दुई कुराले टेम्प्लेट मैत्री बनाउँछ:

१. **`azd-env-name` ट्याग** — azd यसलाई वातावरण अनुसार स्रोतहरू ट्र्याक र सफा गर्न प्रयोग गर्छ।
२. **`uniqueString(...)` स्रोत टोकन** — स्थिर, विश्वव्यापी रूपमा अद्वितीय उपसर्ग उत्पादन गर्छ ताकि नामहरू टकराउने नहुने।

वातावरणबाट azd ले इन्जेक्ट गर्ने मानहरू पढ्ने मेल खाने प्यारामिटर फाइल दिनुहोस्:

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

azd स्वतः हालको वातावरणबाट `${AZURE_ENV_NAME}` र `${AZURE_LOCATION}` प्रतिस्थापन गर्छ।

---

## चरण ४: आफ्नो टेम्प्लेट स्थानीय रूपमा परीक्षण गर्नुहोस्

साझा गर्नु अघि, सफा अवस्थामा टेम्प्लेट काम गर्छ भनेर प्रमाणित गर्नुहोस्।

**स्थानीय फोल्डरबाट परीक्षण गर्नुहोस्** (कुनै Git पुश आवश्यक छैन):

```bash
# खाली डाइरेक्टरीबाट, आफ्नो स्थानीय टेम्प्लेट पथ प्रयोग गरी आरम्भ गर्नुहोस्
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# पूर्ति गर्नुहोस् + अन्त्यदेखि अन्त्यसम्म परिचालन गर्नुहोस्
azd auth login
azd up
```

**पछि टियरडाउन परीक्षण गर्नुहोस्**—राम्रो टेम्प्लेट पूर्ण रूपमा सफा गर्छ:

```bash
azd down --force --purge
```

यदि `azd down` स्रोतहरू छोड्छ भने, तपाईंले सम्भवतः स्रोतमा `azd-env-name` ट्याग छुटाउनु भएको हो।

> **टिप:** पहिलो `azd provision --preview` चलाउनुहोस्। यसले के-के हुन्छ हेर्छ र कुनै स्रोत सिर्जना हुनु अघि टेम्प्लेट त्रुटिहरू देखाउँछ।

---

## चरण ५: टेम्प्लेट प्रकाशन गर्नुहोस्

रिपोजिटोरी GitHub मा पुश गर्नुहोस् (यदि तपाईं अरूले प्रयोग गर्न चाहनुहुन्छ भने सार्वजनिक):

```bash
gh repo create my-azd-template --public --source=. --push
```

अब कोही पनि यसलाई प्रयोग गर्न सक्दछ:

```bash
azd init --template your-github-username/my-azd-template
```

---

## चरण ६ (वैकल्पिक): Awesome AZD मा बुझाउनुहोस्

[Awesome AZD ग्यालरी](https://azure.github.io/awesome-azd/) मा समुदायका टेम्प्लेटहरू सूचीबद्ध हुन्छन्। सूचीमा पर्न तपाईंको रिपोमा तलहरू हुनु पर्छ:

- ✅ स्पष्ट `README.md` जसमा पूर्वाधारहरू, आर्किटेक्चर डायग्राम, र लागत नोटहरू छन्
- ✅ कार्यरत `azure.yaml` जसमा `metadata.template` छ
- ✅ नयाँ सदस्यतामा सफा रूपमा उत्पादन गर्ने इन्फ्रास्ट्रक्चर
- ✅ `LICENSE` फाइल
- ✅ (सिफारिस) एक-क्लिक कोडस्पेसका लागि `.devcontainer/`

योगदान निर्देशन अनुसार [Awesome AZD रिपोजिटोरी](https://github.com/Azure/awesome-azd) मा ग्यालरीको डेटा फाइलमा आफ्नो टेम्प्लेट थप्ने पुल अनुरोध खोलेर बुझाउनुहोस्।

---

## सामान्य समस्याहरू

| समस्या | समाधान |
|---------|-----|
| हार्डकोड गरिएको स्रोत नामहरू | `uniqueString()` स्रोत टोकन प्रयोग गर्नुहोस् |
| `azd down` स्रोतहरू छोड्छ | प्रत्येक स्रोत (वा स्रोत समूह) मा `azd-env-name` ट्याग लगाउनुहोस् |
| टेम्प्लेट तपाईंलाई काम गर्छ, अरूलाई असफल | सदस्यता ID, टेनेन्ट ID, र क्षेत्र धारणाहरू हटाउनुहोस् |
| आउटपुटहरू एपसँग जोडिएका छैनन् | `SERVICE_<NAME>_ENDPOINT_URL` र अन्य `AZURE_*` आउटपुट एक्स्पोर्ट गर्नुहोस् |
| ग्यालरी बुझाइ अस्वीकृत | `README.md`, `LICENSE`, र `metadata.template` थप्नुहोस् |

---

## सारांश

- टेम्प्लेट भनेको Git रिपो हो जसमा `azure.yaml`, `infra/` र तपाईंको कोड हुन्छ।
- सबै कुरा प्यारामिटराइज गर्नुहोस्—नामहरू, क्षेत्रहरू, र ID—ताकि यो कहीं पनि चलोस्।
- स्रोतहरू सधैं `azd-env-name` ट्याग लगाउनुहोस् ताकि `azd down` काम गरोस्।
- प्रकाशन अघि `azd init --template <local-path>` बाट स्थानीय रूपमा परीक्षण गर्नुहोस्।
- मेटाडाटा र README थपेर Awesome AZD मा बुझाउनुहोस्।

---

## 🔗 नेभिगेसन

| दिशा | स्रोत |
|-----------|----------|
| **अघिल्लो** | [Deployment Guide](deployment-guide.md) |
| **अध्याय होम** | [अध्याय ४: इन्फ्रास्ट्रक्चर as कोड](README.md) |
| **अर्को अध्याय** | [अध्याय ५: मल्टि-एजेन्ट समाधानहरू](../chapter-05-multi-agent/README.md) |

## 📖 सम्बन्धित स्रोतहरू

- [स्रोत प्रबन्धन](provisioning.md)
- [Awesome AZD ग्यालरी](https://azure.github.io/awesome-azd/)
- [अधिकारिक azd टेम्प्लेट दस्तावेज](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->