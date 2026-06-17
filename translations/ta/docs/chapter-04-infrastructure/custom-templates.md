# உங்கள் சொந்த azd மாதிரியை உருவாக்குதல்

**Chapter Navigation:**
- **📚 Course Home**: [AZD தொடக்கத்திற்காக](../../README.md)
- **📖 Current Chapter**: அத்தியாயம் 4 - கட்டமைப்பு குறியீடாக மற்றும் பதிப்பேற்றம்
- **⬅️ Previous**: [பதிப்பேற்றக் கையேடு](deployment-guide.md)
- **🚀 Next Chapter**: [அத்தியாயம் 5: பல-ஏஜென்ட் தீர்வுகள்](../chapter-05-multi-agent/README.md)

> ஜூன் 2026-ல் `azd 1.25.6` பயன்படுத்தி சரிபார்க்கப்பட்டது.

## அறிமுகம்

இன்னும் வரை நீங்கள் `azd init --template <name>` மூலம் மாதிரிகளை *உபயோகித்துள்ளீர்கள்*. ஆனால் உங்கள் குழு விரும்பும் திட்ட அமைப்பு—உதாரணமாக, ஒரு Container App மற்றும் Cosmos DB மற்றும் சரியான கண்காணிப்பு—அதை உங்கள் சொந்த மறுபயன்பாட்டுக்கான மாதிரியாக மாற்ற விரும்புவீர்கள். ஒரு மாதிரி என்பது azd படிக்க தெரிந்து கொள்ளக்கூடிய முன்னறிவிக்கப்பட்ட அமைப்புக்குட்பட்ட ஒரு Git சேமிப்பகம் மட்டுமே. இந்த பாடம் அதனை ஆரம்பத்திலிருந்து உருவாக்குவது, சோதிப்பது மற்றும் ( விருப்பமுள்ளவர்களுக்கு) சமூக காட்சியிலே வெளியிடுவது எப்படி என்பதை காட்டுகிறது.

## கற்றல் இலக்குகள்

இந்த பாடம் முடியும் வரை, நீங்கள்:
- ஒரு ஃபோல்டரை "azd மாதிரி" ஆக்குவது என்ன என்பதை புரிந்துகொள்வீர்கள்
- தேவையான கோப்புகள் மற்றும் கோப்பு அமைப்பை அறிந்துகொள்வீர்கள்
- மற்றோர் மனிதர்கள் பயன்படுத்தக்கூடிய `azure.yaml` மற்றும் `infra/` சேர்க்கவேண்டியது எப்படி என்பதை செய்வீர்கள்
- பகிர்வதற்கு முன் உங்கள் மாதிரியை உள்ளூராக சோதிப்பது எப்படி என்பதை கற்கவீர்கள்
- அதை வெளியிடி (மறைப்பாக) Awesome AZD-க்கு சமர்ப்பிக்க முடியும்

## கற்றல் முடிவுகள்

இந்த பாடம் முடிந்ததும், நீங்கள் முடியும்:
- புதிய மாதிரி சேமிப்பகத்தை Scaffold செய்ய
- எந்த சந்தாவிலும் (subscription) செயல்படும் வகையில் கட்டமைப்பை பகுதியாக்க (parameterize) செய்ய
- `azd init` மற்றும் `azd up` மூலம் ஒரு மாதிரியை சரிபார்க்க
- சமூக காட்சிக் காட்சிக்குத் தேவையான மெட்டாடேட்டாவை சேர்க்க

---

## மாதிரி என்பது உண்மையில் என்ன?

azd மாதிரி என்பது குறைந்தபட்சம் கொண்டிருக்கும் **ஒரு Git சேமிப்பகம்**:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | சேவைகள், ஹோஸ்டுகள் மற்றும் இன்ப்ரா வழங்கியாளரை விவரிக்கிறது | ✅ ஆம் |
| `infra/` | வளங்களை ஏற்படுத்தும் Bicep, Terraform, அல்லது Pulumi | ✅ ஆம் |
| `src/` (or your code) | azd துறைமையால் பிரயோஜனப்படுத்தப்படும் செயலி குறியீடு | ✅ ஆம் |
| `README.md` | மாதிரியை எப்படி பயன்படுத்துவது என்பது | ✅ கடுமையாக பரிந்துரைக்கப்படுகிறது |
| `.azdo/` அல்லது `.github/` | CI/CD குழாய் வரையறைகள் | விருப்பமானது |
| `.devcontainer/` | மறுகலப்பு dev சூழல் | விருப்பமானது |
| `azure.yaml` `metadata` | காட்சி + தொலைநோக்கு தகவல் | விருப்பமானது (பதிப்பிக்க வேண்டுமானால் தேவையானது) |

இங்கே எந்த மாதிரியான மந்திரமுமில்லை: நீங்கள் `azd init --template you/your-repo` என்ற போது, azd அந்த ரெப்போவை கிளோன் செய்து `azure.yaml` ஐப் படிக்கிறது.

---

## படி 1: சேமிப்பகத்தை Scaffold செய்து உருவாக்கவும்

கைகள் மூலம் கோப்பு அமைப்பை உருவாக்கவும் அல்லது ஒரு குறைந்தபட்ச மாதிரியில் இருந்து துவங்கி அதைத் திருத்தவும்:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# தரநிலை வடிவமைப்பை உருவாக்கு
mkdir -p src infra
```

ஒரு சாதாரண முடிந்த அமைப்பு இப்படி இருக்கும்:

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

## படி 2: `azure.yaml` எழுதுங்கள்

இது மாதிரியின் மையம். இது azd என்னவை மற்றும் எப்படிதை பிரசுரிக்க வேண்டும் என்பதைக் கூறுகிறது:

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

> `metadata.template` புலம் காட்சி தொல்நோக்கி பயன்பாட்டை எண்ணிக்கையிட பயன்படுத்துகிறது. `name@version` பரம்பரைப் பயன்படுத்தவும்.

---

## படி 3: இன்ப்ராவை பகுதியாக்க (Parameterize) செய்யுங்கள்

*மறுபயன்பாடக்கமான* மாதிரிக்கு மிக முக்கியமான விதி: **பெயர்கள், பிராந்தியங்கள், அல்லது சந்தா-குறிப்பிட்ட மதிப்புகளை கடைசியாகச் (hardcode) செய்பவராகவோ இல்லை.** பரிமாற்றக்குறிகள் மற்றும் resource token மாதிரியைப் பயன்படுத்துங்கள், அதனால் அதே மாதிரி யாருடைய சந்தாவிலும் வேலை செய்வதாக இருக்கும்.

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

இரு விஷயங்கள் இந்த மாதிரியை தகுந்தவையாக்கின்றன:

1. **`azd-env-name` tag** — azd இது மூலம் சுற்றுச்சூழலுக்கு ஏற்ப வளங்களை கண்காணித்து சுத்தம் செய்யப் பயன்படும்.
2. **`uniqueString(...)` resource token** — பெயர்கள் மோதாமல் இருக்கும் நிலையான, உலகளாவிய-தனித்த suffix ஐ உருவாக்குகிறது.

azd சுற்றுச்சூழலிலிருந்து ஊடுருவிக்கச் சேர்க்கும் மதிப்புகளை வாசிக்கும் பொருத்தமான parameters கோப்பை வழங்குங்கள்:

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

azd தற்போதைய சூழலிலிருந்து `${AZURE_ENV_NAME}` மற்றும் `${AZURE_LOCATION}` ஐ தானாகவே மாற்றி செய்கிறது.

---

## படி 4: உங்கள் மாதிரியை உள்ளூராக சோதியுங்கள்

பகிர்வதற்கு முன், ஒரு சுத்தமான நிலையிலிருந்து மாதிரி வேலை செய்கிறதா என்பதை நிரூபிக்கவும்.

**உள்ளூரான கோப்பகம் இருந்து சோதியுங்கள்** (Git push தேவையில்லை):

```bash
# ஒரு காலியான அடைவிலிருந்து, உங்கள் உள்ளக மாதிரி பாதையைப் பயன்படுத்தி தொடங்கவும்
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# முழுமையாக வளங்களை ஏற்பாடு செய்து பயன்பாட்டை வெளியிடுதல்
azd auth login
azd up
```

**பின்னர் teardown ஐ சோதியுங்கள்** — ஒரு நல்ல மாதிரி முழுமையாக சுத்தமாக்க வேண்டும்:

```bash
azd down --force --purge
```

`azd down` வளங்களை விட்டுவிட்டால், நீங்கள் வெகுஜனமானதாக `azd-env-name` tagஐ வளத்தில் வைக்க மறந்திருக்கலாம்.

> **அறிவு:** முதலில் `azd provision --preview` ஐ இயக்குங்கள். இது ஒரு what-if செய்கிறது மற்றும் எந்த வளமும் உருவாகுவதற்கு முன்னர் மாதிரி பிழைகளை வெளிப்படுத்துகிறது.

---

## படி 5: மாதிரியை வெளியிடவும்

ரெப்போவை GitHub-க்கு தூள்ளுங்கள் (பகிர்வதற்கு பொதுவாக public ஆக இருக்கலாம்):

```bash
gh repo create my-azd-template --public --source=. --push
```

இப்போது எவரும் இதைப் பயன்படுத்தலாம்:

```bash
azd init --template your-github-username/my-azd-template
```

---

## படி 6 (விருப்பம்): Awesome AZDக்கு சமர்ப்பிக்கவும்

[Awesome AZD gallery](https://azure.github.io/awesome-azd/) சமூக மாதிரிகளை பட்டியலிடுகிறது. பட்டியலிடப்பட உங்கள் ரெப்போவில் இருக்க வேண்டியது:

- ✅ prerequisites, ஒரு கட்டமைப்பு வரைபடம், மற்றும் செலவு குறிப்பு உட்பட தெளிவான `README.md`
- ✅ `metadata.template` உடன் வேலைசெய்யும் `azure.yaml`
- ✅ புதிய சந்தாவில் சுத்தமாக provision ஆகும் இன்ப்ரா
- ✅ ஒரு `LICENSE` கோப்பு
- ✅ (பரிந்துரைக்கப்படுகிறது) ஒரு க்ளிக் Codespaces க்கான `.devcontainer/`

கேலரியின் தரவு கோப்பில் உங்கள் மாதிரியைச் சேர்க்கும் pull request ஒன்றைத் திறக்க submission செய்யுங்கள், [Awesome AZD repository](https://github.com/Azure/awesome-azd) இல் உள்ள பங்களிப்பு வழிகாட்டலை பின்பற்றவும்.

---

## பொதுத் தவறுகள்

| Pitfall | Fix |
|---------|-----|
| Hardcoded resource names | `uniqueString()` resource token ஐ பயன்படுத்தவும் |
| `azd down` வளங்களை விட்டுவிடுகின்றது | ஒவ்வொரு வளத்திலும் (அல்லது resource group) `azd-env-name` tag வைத்திருங்கள் |
| Template உங்களுக்கு வேலைசெய்கிறது, மற்றவர்களுக்கு தோல்வி | சந்தா IDs, டீனன்ட் IDs மற்றும் பிராந்திய நம்பிக்கைகளை நீக்குங்கள் |
| Outputs செயலியில் இணைக்கப்படவில்லை | `SERVICE_<NAME>_ENDPOINT_URL` மற்றும் மற்ற `AZURE_*` outputs ஐ export செய்யுங்கள் |
| Gallery சமர்ப்பிப்பு நிராகரிக்கப்பட்டது | `README.md`, `LICENSE`, மற்றும் `metadata.template` சேர்க்கவும் |

---

## சுருக்கம்

- ஒரு மாதிரி என்பது `azure.yaml`, `infra/`, மற்றும் உங்கள் குறியீடு கொண்ட ஒரு Git ரெப்போ மட்டுமே.
- அனைத்தையும் பகுதியாக்குங்கள்—பெயர்கள், பிராந்தியங்கள், மற்றும் IDs—அதனால் அது எங்கும் ஓடுகிறது.
- எப்போதும் வளங்களை `azd-env-name` உடன் tag செய்யுங்கள், அதனால் `azd down` வேலைசெய்யும்.
- வெளியிடுவதற்கு முன் `azd init --template <local-path>` கொண்டு உள்ளூராக சோதிக்கவும்.
- Awesome AZDக்கு சமர்ப்பிக்க மெட்டாடேட்டாவும் READMEயும் சேர்க்கவும்.

---

## 🔗 Navigation

| Direction | Resource |
|-----------|----------|
| **Previous** | [பதிப்பேற்றக் கையேடு](deployment-guide.md) |
| **Chapter Home** | [அத்தியாயம் 4: Infrastructure as Code](README.md) |
| **Next Chapter** | [அத்தியாயம் 5: பல-ஏஜென்ட் தீர்வுகள்](../chapter-05-multi-agent/README.md) |

## 📖 தொடர்புடைய வளங்கள்

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Official azd template documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->