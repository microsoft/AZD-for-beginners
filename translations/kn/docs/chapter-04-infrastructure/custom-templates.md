# ನಿಮ್ಮದೇ azd ಟೆಂಪ್ಲೇಟನ್ನು ರಚಿಸುವುದು

**ಅಧ್ಯಾಯ ನ್ಯಾವಿಗೇಶನ್:**
- **📚 Course Home**: [AZD ಆರಂಭಿಕರಿಗೆ](../../README.md)
- **📖 Current Chapter**: ಅಧ್ಯಾಯ 4 - ಕೋಡ್ ಮೂಲಕ ಮೂಲಸೌಕರ್ಯ ಮತ್ತು ನಿಯೋಜನೆ
- **⬅️ Previous**: [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md)
- **🚀 Next Chapter**: [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ ಪರಿಹಾರಗಳು](../chapter-05-multi-agent/README.md)

> ಜೂನ್ 2026 ರಲ್ಲಿ `azd 1.25.6` ವಿರುದ್ಧ ಪರಿಶೀಲಿಸಲಾಯಿತು.

## ಪರಿಚಯ

ಈವರೆಗೆ ನೀವು `azd init --template <name>` ಬಳಸಿ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು *ಗ್ರಾಹಿಸುತ್ತಾ* ಬಂದಿದ್ದೀರಿ. ಆದರೆ ನಿಮ್ಮ ತಂಡಕ್ಕೆ ಇಚ್ಛಿತವಾದ ಪ್ರಾಜೆಕ್ಟ್ ರೂಪರೇಖೆ—ಉದಾಹರಣೆಗೆ, Cosmos DB ಮತ್ತು ಸರಿಯಾದ ಮಾನಿಟರಿಂಗ್‌ ಹೊಂದಿರುವ Container App—ಇದಕ್ಕೆ ಬಂದಾಗ ನೀವು ಅದನ್ನು ನಿಮ್ಮದೇ ಪುನಃಬಳಕೆಗೊಳ್ಳುವ ಟೆಂಪ್ಲೇಟುವಾಗಿ ಪರಿವರ್ತಿಸಲು ಇಚ್ಛಿಸುವಿರಿ. ಟೆಂಪ್ಲೇಟು ಎಂದರೆ azd ಓದ್ಯಿಸುತ್ತಾ ತಿಳಿದುಕೊಳ್ಳಲು ಸಾಧ್ಯವಾದ ನಿರ್ವಹಿತ ರಚನೆಯೊಂದನ್ನು ಹೊಂದಿರುವ ಒಂದು Git ರೆಪೊಸಿಟರಿ ಮಾತ್ರ. ಈ ಪಾಠವು ನಿಮಗೆ ಶೂನ್ಯದಿಂದ ಒಂದು ಟೆಂಪ್ಲೇಟನ್ನು ಹೇಗೆ ನಿರ್ಮಿಸಬೇಕು, ಪರೀಕ್ಷಿಸಬೇಕು, ಮತ್ತು (ಐಚ್ಛಿಕವಾಗಿ) ಸಮುದಾಯ ಗ್ಯಾಲರಿಯಲ್ಲಿ ಪ್ರಕಟಿಸಬಹುದೆಂದು ತೋರಿಸುತ್ತದೆ.

## ಕಲಿಕಾ ಗುರಿಗಳು

ಈ ಪಾಠವನ್ನು ಮುಗಿಸುವಾಗ ನೀವು:
- ಫೋಲ್ಡರ್ ಅನ್ನು "azd ಟೆಂಪ್ಲೇಟು" ಆಗಿಸಲು ಏನು ಬೇಕಾಗುತ್ತದೆ ಎಂಬುದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು
- ಅಗತ್ಯ ಫೈಲ್‌ಗಳು ಮತ್ತು ಫೋಲ್ಡರ್ ವಿನ್ಯಾಸವನ್ನು ಜ್ಞಾನಗೊಳ್ಳುವುದು
- ಇತರರು ಮರುಬಳಕೆಮಾಡಬಹುದಾಗುವ `azure.yaml` ಮತ್ತು `infra/` ಅನ್ನು ಸೇರಿಸುವುದು
- ಹಂಚಿಕೊಳ್ಳುವ ಮೊದಲು ಸ್ಥಳೀಯವಾಗಿ ನಿಮ್ಮ ಟೆಂಪ್ಲೇಟನ್ನು ಪರೀಕ್ಷಿಸುವುದು
- ಅದನ್ನು ಪ್ರಕಟಿಸುವುದು ಮತ್ತು (ಐಚ್ಛಿಕವಾಗಿ) Awesome AZD ಗೆ ಸಲ್ಲಿಸುವುದು

## ಕಲಿಕಾ ಫಲಿತಾಂಶಗಳು

ಈ ಪಾಠವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ ನೀವು ಸಾಧ್ಯವಾಗುತ್ತದೆ:
- ಹೊಸ ಟೆಂಪ್ಲೇಟ್ ರೆಪೊಸಿಟರಿ scaffold ಮಾಡಲು
- ಮೂಲಸೌಕರ್ಯವನ್ನು ಯಾವುದೇ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್‌ನಲ್ಲಿ ಕೆಲಸ ಮಾಡುವಂತೆ ಪರಾಮೆಟರೈಸ್ ಮಾಡುವುದು
- `azd init` ಮತ್ತು `azd up` ಜೊತೆಗೆ ಟೆಂಪ್ಲೇಟನ್ನು ಮಾನ್ಯಗೊಳಿಸುವುದು
- ಸಮುದಾಯ ಗ್ಯಾಲರಿ ಅಗತ್ಯವಿರುವ ಮೆಟಾಡೇಟಾವನ್ನು ಸೇರಿಸುವುದು

---

## ಟೆಂಪ್ಲೇಟು ಎಂದರೆ ಏನು, ನಿಜವಾಗಿಯೂ?

azd ಟೆಂಪ್ಲೇಟ್ ಎಂದರೆ ಕನಿಷ್ಠವಾಗಿ ಹೊಂದಿರುವ **Git ರೆಪೊಸಿಟರಿ**:

| File / folder | Purpose | Required? |
|---------------|---------|-----------|
| `azure.yaml` | ಸೇವೆಗಳು, ಹೋಸ್ಟ್‌ಗಳು, ಮತ್ತು ಮೂಲಸೌಕರ್ಯ ಪೂರೈಕೆದಾರರನ್ನು ವಿವರಿಸುತ್ತದೆ | ✅ ಹೌದು |
| `infra/` | ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸುವ Bicep, Terraform, ಅಥವಾ Pulumi | ✅ ಹೌದು |
| `src/` (ಅಥವಾ ನಿಮ್ಮ ಕೋಡ್) | azd ನಿರ್ವহಿಸುವ ಅಪ್ಲಿಕೇಶನ್ ಕೋಡ್ | ✅ ಹೌದು |
| `README.md` | ಟೆಂಪ್ಲೇಟನ್ನು ಹೇಗೆ ಬಳಸುವುದು | ✅ ಶಕ್ತವಾಗಿ ಶಿಫಾರಸು ಮಾಡಲಾಗಿದೆ |
| `.azdo/` or `.github/` | CI/CD ಪೈಪ್‌ಲೈನ್ ವ್ಯಾಖ್ಯಾನಗಳು | ಐಚ್ಛಿಕ |
| `.devcontainer/` | ಮರುಉತ್ಪಾದಿಸಬಹುದಾದ ಅಭಿವೃದ್ಧಿ ಪರಿಸರ | ಐಚ್ಛಿಕ |
| `azure.yaml` `metadata` | ಗ್ಯಾಲರಿ ಮತ್ತು ಟೆಲಿಮೆಟ್ರಿ ಮಾಹಿತಿ | ಐಚ್ಛಿಕ (ಪ್ರಕಟಿಸಲು ಅಗತ್ಯವಿದೆ) |

ಇಲ್ಲಿ ಯಾವುದೇ ಮಾಯಾಜಾಲವಿಲ್ಲ: ನೀವು `azd init --template you/your-repo` ಅನ್ನು 실행ಿಸಿದಾಗ, azd ರೆಪೊ ಅನ್ನು ಕ್ಲೋನ್ ಮಾಡುತ್ತದೆ ಮತ್ತು `azure.yaml` ಅನ್ನು ಓದುತ್ತದೆ.

---

## ಹಂತ 1: ರೆಪೊಸಿಟರಿ ರಚನೆ

ಫೋಲ್ಡರ್ ರಚನೆಯನ್ನು ಕೈಯಿಂದ ಸೃಷ್ಟಿಸಬಹುದು ಅಥವಾ ಕನಿಷ್ಠ ಟೆಂಪ್ಲೇಟಿನಿಂದ ಪ್ರಾರಂಭಿಸಿ ಅದನ್ನು ಸಂಪಾದಿಸಿ:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# ಪ್ರಮಾಣಿತ ವಿನ್ಯಾಸವನ್ನು ರಚಿಸಿ
mkdir -p src infra
```

ಸಾಮಾನ್ಯವಾಗಿ ಪೂರ್ಣಗೊಂಡ ವಿನ್ಯಾಸ ಹೀಗಿರುತ್ತದೆ:

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

## ಹಂತ 2: `azure.yaml` ರಚಿಸು

ಇದು ಟೆಂಪ್ಲೇಟಿನ ಹೃದಯವಾಗಿದೆ. ಇದು azd ಗೆ ಏನು ಮತ್ತು ಹೇಗೆ ನಿಯೋಜಿಸಬೇಕೆಂದು ಹೇಳುತ್ತದೆ:

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

> ಗ್ಯಾಲರಿ ಟೆಲಿಮೆಟ್ರಿ ಬಳಕೆ ಎಣಿಕೆಗಾಗಿ `metadata.template` ಕ್ಷೇತ್ರವನ್ನು ಬಳಸಲಾಗುತ್ತದೆ. `name@version` ಸಾಂಪ್ರದಾಯವನ್ನು ಬಳಸಿ.

---

## ಹಂತ 3: ಮೂಲಸೌಕರ್ಯವನ್ನು ಪರಾಮೆಟರೈಸ್ ಮಾಡಿ

*ಮರುಬಳಕೆಗೊಳ್ಳುವ* ಟೆಂಪ್ಲೇಟಿಗಾಗಿ ಒಂದೇ ಅತ್ಯಂತ ಮುಖ್ಯ ನಿಯಮ: **ಹೆಸರುಗಳು, ಪ್ರದೇಶಗಳು, ಅಥವಾ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್-ನಿರ್ದಿಷ್ಟ ಮೌಲ್ಯಗಳನ್ನು ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡಬೇಡಿ.** ಪ್ಯಾರಾಮಿಟರ್‌ಗಳನ್ನು ಮತ್ತು resource token ಮಾದರಿಯನ್ನು ಉಪಯೋಗಿಸಿ, ಹೀಗಾಗಿ ಅದೇ ಟೆಂಪ್ಲೇಟು ಯಾರಾದರೂ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್‌ನಲ್ಲಿ ಕೆಲಸ ಮಾಡುತ್ತದೆ.

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

ಈ ಟೆಂಪ್ಲೇಟನ್ನು ಸ್ನೇಹಿ ಮಾಡುವ ಎರಡು ವಿಚಾರಗಳು:

1. **`azd-env-name` ಟ್ಯಾಗ್** — azd ಪ್ರತಿ ವಾತಾವರಣಕ್ಕಾಗಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಟ್ರ್ಯಾಕ್ ಮಾಡಿ ತೆರವುಗೊಳಿಸಲು ಇದನ್ನು ಬಳಸುತ್ತದೆ.
2. **`uniqueString(...)` resource token** — ಹೆಸರುಗಳ ಗಟ್ಟಿಯಾದ, ಜಾಗತಿಕವಾಗಿ ವಿಶಿಷ್ಟ ಆಗಿರುವ_SUFFIX ಅನ್ನು ಉಂಟುಮಾಡುತ್ತದೆ ताकि ಹೆಸರುಗಳು ಸಹಸ್ಯವಾಗುವುದಿಲ್ಲ.

azd ಪರಿಸರದಿಂದ ಪ್ರбавೇಶಿಸುವ ಮೌಲ್ಯಗಳನ್ನು ಓದುವ ಒಂದು ಹೊಂದಾಣಿಕೆಯ ಪ್ಯಾರಾಮಿಟರ್ ಫೈಲ್ ಒದಗಿಸಿರಿ:

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

azd ಪ್ರಸ್ತುತ ಪರಿಸರದಿಂದ `${AZURE_ENV_NAME}` ಮತ್ತು `${AZURE_LOCATION}` ಅನ್ನು ಸ್ವಯಂಚಾಲಿತವಾಗಿ ಬದಲಾಗಿದೆ.

---

## ಹಂತ 4: ನಿಮ್ಮ ಟೆಂಪ್ಲೇಟನ್ನು ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ

ಹಂಚಿಕೊಳ್ಳುವ ಮೊದಲು, ಕ್ಲೀನ್ ಸ್ಥಿತಿಯಿಂದ ಟೆಂಪ್ಲೇಟು ಕೆಲಸ ಮಾಡುತ್ತಿದೆ ಎಂದು ಸಾಬೀತುಪಡಿಸಿರಿ.

**ಸ್ಥಳೀಯ ಫೋಲ್ಡರ್‌ನಿಂದ ಪರೀಕ್ಷಿಸಿ** (Git ಗೆ ಪುಷ್ ಮಾಡುವ ಅಗತ್ಯವಿಲ್ಲ):

```bash
# ಖಾಲಿ ಡೈರೆಕ್ಟರಿಯಿಂದ, ನಿಮ್ಮ ಸ್ಥಳೀಯ ಟೆಂಪ್ಲೇಟ್ ಮಾರ್ಗವನ್ನು ಬಳಸಿ ಪ್ರಾರಂಭಿಸಿ
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# ಆರಂಭದಿಂದ ಕೊನೆವರೆಗೂ ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸಿ ಮತ್ತು ಅಳವಡಿಸಿ
azd auth login
azd up
```

**ನಂತರ teardown ಅನ್ನು ಪರೀಕ್ಷಿಸಿ** — ಉತ್ತಮ ಟೆಂಪ್ಲೇಟು ಸಂಪೂರ್ಣವಾಗಿ ತೆರವುಗೊಳ್ಳುತ್ತದೆ:

```bash
azd down --force --purge
```

`azd down` ಸಂಪನ್ಮೂಲಗಳನ್ನು ಉಳಿಸಿರಲು ಕಾರಣವಾಗಿದ್ದರೆ, ನೀವು ಯಾವುದೇ ಸಂಪನ್ಮೂಲದಲ್ಲಿ `azd-env-name` ಟ್ಯಾಗ್ ಹಾಕಬೇಕೆಂಬುದನ್ನು ಮಿಸ್ ಆಗಿರಬಹುದು.

> **Idea:** ಮೊದಲಿಗೆ `azd provision --preview` ಅನ್ನು ರನ್ ಮಾಡಿ. ಇದು ಏನಾಗಬಹುದೆಂಬುದನ್ನು ಪ್ರದರ್ಶಿಸುತ್ತದೆ ಮತ್ತು ಯಾವುದೇ ಸಂಪನ್ಮೂಲ ಸೃಷ್ಟಿಯಾಗುವ ಮೊದಲು ಟೆಂಪ್ಲೇಟು ದೋಷಗಳನ್ನು surface ಮಾಡುತ್ತದೆ.

---

## ಹಂತ 5: ಟೆಂಪ್ಲೇಟನ್ನು ಪ್ರಕಟಿಸಿ

ರೆಪೊಸಿಟರಿಯನ್ನು GitHub ಗೆ ಪುಷ್ ಮಾಡಿ (ಇತರರು ಬಳಕೆಮಾಡಲು public ಆಗಿರಲಿ):

```bash
gh repo create my-azd-template --public --source=. --push
```

ಯಾರೂ ಈಗ ಇದನ್ನು ಬಳಸಬಹುದು:

```bash
azd init --template your-github-username/my-azd-template
```

---

## ಹಂತ 6 (ಐಚ್ಛಿಕ): Awesome AZD ಗೆ ಸಲ್ಲಿಸಿ

[Awesome AZD ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/) ಸಮುದಾಯ ಟೆಂಪ್ಲೇಟುಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡುತ್ತದೆ. ಪಟ್ಟಿ ಆಗಬೇಕಾದರೆ ನಿಮ್ಮ ರೆಪೊದಲ್ಲಿ ಈಗಳು ಇರಬೇಕು:

- ✅ ಸ್ಪಷ್ಟ `README.md` ಪ್ರಕೃತಿಗಳು, ಆರ್ಕಿಟೆಕ್ಚರ್ ಡಯಾಗ್ರಾಂ ಮತ್ತು ವೆಚ್ಚದ ಟಿಪ್ಪಣಿಗಳೊಂದಿಗೆ
- ✅ ಕಾರ್ಯನಿರ್ವಹಿಸುವ `azure.yaml` ಮತ್ತು `metadata.template`
- ✅ ಹೊಸ ಸಬ್‌ಸ್ಕ್ರಿಪ್ಶನ್‌ನಲ್ಲಿ ಸ್ವಚ್ಛವಾಗಿ ಬಳಸಬಹುದಾದ ಮೂಲಸೌಕರ್ಯ
- ✅ ಒಂದು `LICENSE` ಫೈಲ್
- ✅ (ಶಿಫಾರಸ್ಸು) ಒನ್-ಕ್ಲಿಕ್ Codespaces ಗಾಗಿ `.devcontainer/`

ಗ್ಯಾಲರಿಯ data ಫೈಲ್‌ಗೆ ನಿಮ್ಮ ಟೆಂಪ್ಲೇಟನ್ನು ಸೇರಿಸುವ pull request ತೆರೆಯುವ ಮೂಲಕ ಸಲ್ಲಿಸಿ, [Awesome AZD repository](https://github.com/Azure/awesome-azd) ನಲ್ಲಿ ಕೊಲಿದೆ ಕೊಡುಗೆ ಮಾರ್ಗದರ್ಶನವನ್ನು ಅನುಸರಿಸಿ.

---

## ಸಾಮಾನ್ಯ ತಪ್ಪುಗಳು

| ತಪ್ಪು | ಸರಿಪಡಣೆ |
|---------|-----|
| ಹಾರ್ಡ್‌ಕೋಡ್ ಮಾಡಿದ ಸಂಪನ್ಮೂಲ ಹೆಸರುಗಳು | `uniqueString()` resource token ಬಳಸಿ |
| `azd down` ಸಂಪನ್ಮೂಲಗಳನ್ನು ಉಳಿಸುತ್ತದೆ | ಪ್ರತಿ ಸಂಪನ್ಮೂಲವನ್ನು (ಅಥವಾ ಸಂಪನ್ಮೂಲ ಗುಂಪನ್ನು) `azd-env-name` ಟ್ಯಾಗ್ ಮಾಡಿ |
| ಟೆಂಪ್ಲೇಟ್ ನಿಮ್ಮಿಗೆ ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತದೆ, ಇತರರಿಗೆ ವಿಫಲವಾಗುತ್ತದೆ | ಸಬ್‌ಸ್ಕ್ರಿಪ್‌ಶನ್ IDಗಳು, ತೆನಂಟ್ IDಗಳು ಮತ್ತು ಪ್ರದೇಶ ಸಂಬಂಧಿ ಊಹಾಪೋಹಗಳನ್ನು ತೆಗೆದುಹಾಕಿ |
| ಔಟ್‌ಪುಟ್‌ಗಳು ಆ್ಯಪ್ನೊಂದಿಗೆ ಸಂಪರ್ಕದಲ್ಲಿಲ್ಲ | `SERVICE_<NAME>_ENDPOINT_URL` ಮತ್ತು ಇತರೆ `AZURE_*` ಔಟ್‌ಪುಟ್‌ಗಳನ್ನು ಎಕ್ಸ್ಪೋರ್ಟ್ ಮಾಡಿ |
| ಗ್ಯಾಲರಿ ಸಲ್ಲಿಕೆ ತಿರಸ್ಕೃತವಾಯಿತು | `README.md`, `LICENSE`, ಮತ್ತು `metadata.template` ಸೇರಿಸಿ |

---

## ಸಾರಾಂಶ

- ಟೆಂಪ್ಲೇಟು ಎಂದರೆ `azure.yaml`, `infra/`, ಮತ್ತು ನಿಮ್ಮ ಕೋಡ್ ಹೊಂದಿರುವ ಒಂದು Git ರೆಪೊ ಮಾತ್ರ.
- ಎಲ್ಲವನ್ನೂ ಪ್ಯಾರಾಮೆಟರೈಸ್ ಮಾಡಿ — ಹೆಸರುಗಳು, ಪ್ರದೇಶಗಳು ಮತ್ತು IDಗಳು — ಹೀಗಾಗಿ ಅದು ಎಲ್ಲೆಡೆ ಈಡೇರುತ್ತದೆ.
- ಯಾವಾಗಲೂ ಸಂಪನ್ಮೂಲಗಳನ್ನು `azd-env-name` ಟ್ಯಾಗ್ ಮಾಡಿ zodat `azd down` ಕಾರ್ಯನಿರ್ವಹಿಸುತ್ತಿರುತ್ತದೆ.
- ಪ್ರಕಟಿಸುವ ಮೊದಲು `azd init --template <local-path>` ಬಳಸಿ ಸ್ಥಳೀಯವಾಗಿ ಪರೀಕ್ಷಿಸಿ.
- Awesome AZD ಗೆ ಸಲ್ಲಿಸಲು ಮೆಟಾಡೇಟಾ ಮತ್ತು README ಸೇರಿಸಿ.

---

## 🔗 ನ್ಯಾವಿಗೇಶನ್

| Direction | Resource |
|-----------|----------|
| **Previous** | [ನಿಯೋಜನೆ ಮಾರ್ಗದರ್ಶಿ](deployment-guide.md) |
| **Chapter Home** | [ಅಧ್ಯಾಯ 4: ಕೋಡ್ ಮೂಲಕ ಮೂಲಸೌಕರ್ಯ](README.md) |
| **Next Chapter** | [ಅಧ್ಯಾಯ 5: ಬಹು-ಏಜೆಂಟ್ ಪರಿಹಾರಗಳು](../chapter-05-multi-agent/README.md) |

## 📖 ಸಂಬಂಧಿಸಿದ ಸಂಪನ್ಮೂಲಗಳು

- [ಸಂಪನ್ಮೂಲಗಳನ್ನು ಒದಗಿಸುವುದು](provisioning.md)
- [Awesome AZD ಗ್ಯಾಲರಿ](https://azure.github.io/awesome-azd/)
- [ಅಧಿಕೃತ azd ಟೆಂಪ್ಲೇಟು ಡಾಕ್ಯುಮೆಂಟೇಶನ್](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ಅಸ್ವೀಕಾರ**:
ಈ ದಸ್ತಾವೇಜು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವಾದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಯನ್ನು ಸಾಧಿಸಲು ಪ್ರಯತ್ನಿಸುತ್ತಿದ್ದರೂ, ದಯವಿಟ್ಟು ಗಮನಿಸಿ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ಅಸಡ್ಡೆಗಳು ಇರಬಹುದು. ಮೂಲ ಭಾಷೆಯಲ್ಲಿರುವ ಮೂಲ ದಸ್ತಾವೇಜು ಪ್ರಾಮಾಣಿಕ ಮೂಲವೆಂದು ಪರಿಗಣಿಸಬೇಕು. ಪ್ರಮುಖ ಮಾಹಿತಿಗಾಗಿ, ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದವನ್ನು ಬಳಸುವ ಮೂಲಕ ಉಂಟಾಗುವ ಯಾವುದೇ ತಪ್ಪು ಅರ್ಥಗಳ ಅಥವಾ ತಪ್ಪು ವ್ಯಾಖ್ಯಾನಗಳ ಬಗ್ಗೆ ನಾವು ಹೊಣೆಗಾರರಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->