# ਆਪਣਾ ਖੁਦ ਦਾ azd ਟੈਂਪਲੇਟ ਬਣਾਉਣਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖਪੰਨਾ**: [ਨਵਾਂ ਸਿੱਖਣ ਵਾਲਿਆਂ ਲਈ AZD](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 4 - ਕੋਡ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ਵਜੋਂ ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ
- **⬅️ ਪਿਛਲਾ**: [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ ਸੌਲਿਊਸ਼ਨ](../chapter-05-multi-agent/README.md)

> ਜੁਲਾਈ 2026 ਵਿੱਚ `azd 1.27.1` ਨਾਲ ਮਨਜ਼ੂਰਸ਼ੁਦਾ।

## ਪਰਿਚਯ

ਹੁਣ ਤੱਕ ਤੁਸੀਂ `azd init --template <name>` ਨਾਲ ਟੈਂਪਲੇਟ ਵਰਤੇ ਹਨ। ਪਰ ਜਦ ਤੁਹਾਡੇ ਕੋਲ ਆਪਣੀ ਟੀਮ ਨੂੰ ਪਸੰਦ ਆਉਣ ਵਾਲੀ ਪ੍ਰੋਜੈਕਟ ਲੇਆਉਟ ਹੁੰਦੀ ਹੈ—ਜਿਵੇਂ ਕਿ ਇੱਕ ਕਨਟੇਨਰ ਐਪ ਜਿਸ ਵਿੱਚ ਕੋਸਮੋਸ DB ਅਤੇ ਸਹੀ ਮਾਨੀਟਰਨਿੰਗ ਹੈ—ਤੁਹਾਨੂੰ ਇਸਨੂੰ ਆਪਣੇ ਲਈ ਇੱਕ ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ ਟੈਂਪਲੇਟ ਵਿੱਚ ਬਦਲਣਾ ਚਾਹੀਦਾ ਹੈ। ਇੱਕ ਟੈਂਪਲੇਟ ਸਿਰਫ਼ ਇੱਕ Git ਰਿਪੋਜ਼ਟਰੀ ਹੈ ਜਿਸ ਵਿੱਚ ਇੱਕ ਪੂਰੇ ਤੌਰ 'ਤੇ ਜਾਣਿਆ-ਪਹਚਾਣਿਆ ਢਾਂਚਾ ਹੁੰਦਾ ਹੈ ਜੋ azd ਸਮਝ ਸਕਦਾ ਹੈ। ਇਹ ਪਾਠ ਤੁਹਾਨੂੰ ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਇਸਨੂੰ ਲੇਖਣ ਕਰਕੇ, ਟੈਸਟ ਕਰਕੇ ਅਤੇ (ਚਾਹੁੰਦੇ ਹੋਏ) ਕਮਿਊਨਿਟੀ ਗੈਲਰੀ ਵਿੱਚ ਪ੍ਰਕਾਸ਼ਿਤ ਕਿਵੇਂ ਕਰਨਾ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- ਸਮਝ ਪਾਵੋਗੇ ਕਿ ਕਿਹੜਾ ਫੋਲਡਰ "azd ਟੈਂਪਲੇਟ" ਬਣਾਉਂਦਾ ਹੈ
- ਲੋੜੀਂਦੇ ਫਾਇਲਾਂ ਅਤੇ ਫੋਲਡਰ ਲੇਆਉਟ ਬਾਰੇ ਜਾਣੋਗੇ
- ਇੱਕ `azure.yaml` ਅਤੇ `infra/` ਸ਼ਾਮਲ ਕਰੋਂਗੇ ਜੋ ਹੋਰ ਲੋਕ ਦੁਹਰ ਸਕਣ
- ਟੈਂਪਲੇਟ ਨੂੰ ਸਾਂਝਾ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਲੋਕਲ ਟੈਸਟ ਕਰੋਂਗੇ
- ਇਸਨੂੰ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰਕੇ ਅਤੇ (ਚਾਹੇ ਤਾਂ) Awesome AZD ਨੂੰ ਜਮ੍ਹਾਂ ਕਰਵਾਓਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ مڪمل ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਨਵਾਂ ਟੈਂਪਲੇਟ ਰਿਪੋਜ਼ਟਰੀ ਬਣਾਉਣ ਲਈ ਸਕੈਫੋਲਡ ਕਰਨਾ
- ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਨੂੰ ਤਰਤੀਬਬੱਧ ਕਰਨਾ taaki ਇਹ ਕਿਸੇ ਵੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵਿੱਚ ਕੰਮ ਕਰੇ
- `azd init` ਅਤੇ `azd up` ਨਾਲ ਟੈਂਪਲੇਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨਾ
- ਕਮਿਊਨਿਟੀ ਗੈਲਰੀ ਦੇ ਲੋੜੀਂਦੇ ਮੈਟਾਡੇਟਾ ਸ਼ਾਮਲ ਕਰਨਾ

---

## ਟੈਂਪਲੇਟ ਕੀ ਹੁੰਦਾ ਹੈ, ਅਸਲ ਵਿੱਚ?

ਇੱਕ azd ਟੈਂਪਲੇਟ **ਇੱਕ Git ਰਿਪੋਜ਼ਟਰੀ** ਹੁੰਦਾ ਹੈ ਜਿਹੜੇ ਵਿੱਚ ਘੱਟੋ-ਘੱਟ ਇਹ ਹੁੰਦਾ ਹੈ:

| ਫਾਇਲ / ਫੋਲਡਰ | ਮਕਸਦ | ਲੋੜੀਂਦਾ? |
|---------------|---------|-----------|
| `azure.yaml` | ਸੇਵਾਵਾਂ, ਹੋਸਟ, ਅਤੇ ਇਨਫ੍ਰਾ ਪ੍ਰਦਾਤਾ ਨੂੰ ਵਰਣਨ ਕਰਦਾ ਹੈ | ✅ ਹਾਂ |
| `infra/` | ਬਾਇਸਪ, ਟੈਰਾਫਾਰਮ, ਜਾਂ ਪਲਮੀ ਜੋ ਸਰੋਤਾਂ ਦੀ ਪ੍ਰਦਾਨਗੀ ਕਰਦਾ ਹੈ | ✅ ਹਾਂ |
| `src/` (ਜਾਂ ਤੁਹਾਡਾ ਕੋਡ) | ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਜੋ azd ਡਿਪਲੋਇਮੈਂਟ ਕਰਦਾ ਹੈ | ✅ ਹਾਂ |
| `README.md` | ਟੈਂਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਿਵੇਂ ਕਰੀਏ | ✅ ਬਹੁਤ ਸਿਫ਼ਾਰਸ਼ੀ |
| `.azdo/` ਜਾਂ `.github/` | CI/CD ਪਾਇਪਲਾਈਨ ਪਰਿਭਾਸ਼ਾਵਾਂ | ਵਿਕਲਪੀ |
| `.devcontainer/` | ਦੁਹਰਾਉਣ ਯੋਗ ਵਿਕਾਸ ਵਾਤਾਵਰਨ | ਵਿਕਲਪੀ |
| `azure.yaml` `metadata` | ਗੈਲਰੀ + ਟੈਲੀਮੇਟਰੀ ਜਾਣਕਾਰੀ | ਵਿਕਲਪੀ (ਪ੍ਰਕਾਸ਼ਿਤ ਕਰਨ ਲਈ ਲੋੜੀਂਦਾ) |

ਇੱਥੇ ਕੋਈ ਜਾਦੂ ਨਹੀਂ ਹੈ: ਜਦ ਤੂੰ `azd init --template you/your-repo` ਚਲਾਉਂਦਾ ਹੈ, azd ਰਿਪੋ ਨੂੰ ਕਲੋਨ ਕਰਦਾ ਹੈ ਅਤੇ `azure.yaml` ਪੜ੍ਹਦਾ ਹੈ।

---

## ਕਦਮ 1: ਰਿਪੋਜ਼ਟਰੀ ਬਣਾਉਣ ਦਾ ਫਰੇਮਵਰਕ (ਸਕੈਫੋਲਡ) ਕਰੋ

ਫੋਲਡਰ ਸਟ੍ਰਕਚਰ ਨੂੰ ਹੱਥੋਂ ਬਣਾਓ ਜਾਂ ਇੱਕ ਘੱਟੋ-ਘੱਟ ਟੈਂਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਉਸਨੂੰ ਸੋਧੋ:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# ਮਿਆਰੀ ਲੇਆਉਟ ਬਣਾਓ
mkdir -p src infra
```

ਇੱਕ ਆਮ ਮੁਕੰਮਲ ਲੇਆਉਟ ਇਸ ਤਰ੍ਹਾਂ ਦਿਖਾਈ ਦਿੰਦਾ ਹੈ:

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

## ਕਦਮ 2: `azure.yaml` ਲਿਖੋ

ਇਹ ਟੈਂਪਲੇਟ ਦਾ ਦਿਲ ਹੈ। ਇਹ azd ਨੂੰ ਦੱਸਦਾ ਹੈ ਕਿ ਕੀ ਡਿਪਲੋਇ ਕਰਨਾ ਹੈ ਅਤੇ ਕਿਵੇਂ ਕਰਨਾ ਹੈ:

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

> `metadata.template` fielਡ ਗੈਲਰੀ ਟੈਲੀਮੇਟਰੀ ਨੂੰ ਵਰਤੋਂ ਦੀ ਗਿਣਤੀ ਲਈ ਵਰਤਿਆ ਜਾਂਦਾ ਹੈ। `name@version` ਰਿਵਾਜ਼ ਦੀ ਵਰਤੋਂ ਕਰੋ।

---

## ਕਦਮ 3: ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਨੂੰ ਪੈਰਾਮੀਟਰ ਬਣਾਓ

ਇੱਕ *ਦੁਬਾਰਾ ਵਰਤਣਯੋਗ* ਟੈਂਪਲੇਟ ਲਈ ਸਭ ਤੋਂ ਜਰੂਰੀ ਨਿਯਮ: **ਕਦੇ ਵੀ ਨਾਂ, ਖੇਤਰਾਂ ਜਾਂ ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਖਾਸ ਮੁੱਲ ਹਾਰਡਕੋਡ ਨਾ ਕਰੋ।** ਪੈਰਾਮੀਟਰ ਅਤੇ ਸਰੋਤ ਟੋਕਨ ਪੈਟਰਨ ਦੀ ਵਰਤੋਂ ਕਰੋ ਤਾਂ ਜੋ ਉਹੀ ਟੈਂਪਲੇਟ ਕਿਸੇ ਵੀ ਵਿਅਕਤੀ ਦੇ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵਿੱਚ ਕੰਮ ਕਰੇ।

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

ਦੋ ਚੀਜ਼ਾਂ ਇਸਨੂੰ ਟੈਂਪਲੇਟ-ਮਿੱਤਰ ਬਣਾਉਂਦੀਆਂ ਹਨ:

1. **`azd-env-name` ਟੈਗ** — azd ਇਸਦਾ ਇਸਤੇਮਾਲ ਹਰ ਵਾਤਾਵਰਨ ਅਨੁਸਾਰ ਸਰੋਤਾਂ ਨੂੰ ਟ੍ਰੈਕ ਅਤੇ ਸਾਫ਼ ਕਰਨ ਲਈ ਕਰਦਾ ਹੈ।
2. **`uniqueString(...)` ਸਰੋਤ ਟੋਕਨ** — ਇਸ ਨਾਲ ਇੱਕ ਸਥਿਰ, ਦੁਨੀਆ-ਵਿਆਪੀ ਅਦੁਤੀ ਸਮਾਪਤੀ ਬਣਦੀ ਹੈ ਤਾਂ ਕਿ ਨਾਂ ਇੱਕੋ ਨਾਂਹ ਨਾਲ ਟਕਰਾਉਂਦੇ ਨਾ ਹੋਣ।

ਇੱਕ ਮੈਚਿੰਗ ਪੈਰਾਮੀਟਰ ਫਾਇਲ ਦਿੱਤਾ ਕਰੋ ਜੋ ਵੈਲਯੂਜ਼ ਨੂੰ ਪੜ੍ਹਦਾ ਹੈ ਜੋ azd ਵਾਤਾਵਰਨ ਤੋਂ ਚੁਪਕੇ ਚੁਪਕੇ ਦਿੰਦਾ ਹੈ:

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

azd ਸਵੈਚਲਿਤ ਤੌਰ 'ਤੇ `${AZURE_ENV_NAME}` ਅਤੇ `${AZURE_LOCATION}` ਨੂੰ ਮੌਜੂਦਾ ਵਾਤਾਵਰਨ ਤੋਂ ਬਦਲਦਾ ਹੈ।

---

## ਕਦਮ 4: ਆਪਣਾ ਟੈਂਪਲੇਟ ਲੋਕਲੀ ਟੈਸਟ ਕਰੋ

ਸਾਂਝਾ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਟੈਂਪਲੇਟ ਨੂੰ ਇੱਕ ਸਾਫ਼ ਸਥਿਤੀ ਤੋਂ ਚਲਾਉਣ ਦੀ ਸਾਬਿਤੀ ਦਿਓ।

**ਸਥਾਨਕ ਫੋਲਡਰ ਤੋਂ ਟੈਸਟ ਕਰੋ** (ਕੋਈ Git ਧੱਕਾ ਲਾਉਣ ਦੀ ਜਰੂਰਤ ਨਹੀਂ):

```bash
# ਇੱਕ ਖਾਲੀ ਡਾਇਰੈਕਟਰੀ ਤੋਂ, ਆਪਣੇ ਸਥਾਨਕ ਟੈਂਪਲੇਟ ਪਾਥ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਸ਼ੁਰੂਆਤ ਕਰੋ
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# ਸੰਪੂਰਨ ਪ੍ਰੋਵੀਜ਼ਨ ਅਤੇ ਡਿਪਲੋਯ ਕਰੋ
azd auth login
azd up
```

**ਫਿਰ ਟੀਅਰਡਾਊਨ ਟੈਸਟ ਕਰੋ**—ਇੱਕ ਚੰਗਾ ਟੈਂਪਲੇਟ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਾਫ਼ ਕਰਦਾ ਹੈ:

```bash
azd down --force --purge
```

ਜੇ `azd down` ਸਰੋਤਾਂ ਨੂੰ ਛੱਡ ਜਾਂਦਾ ਹੈ, ਤਾਂ ਤੁਸੀਂ ਸਕਦਾ ਹੈ ਕਿ ਕਿਸੇ ਸਰੋਤ ਉੱਤੇ `azd-env-name` ਟੈਗ ਲਗਾਉਣਾ ਭੁੱਲ ਗਏ ਹੋਵੋ।

> **ਸੁਝਾਅ:** ਪਹਿਲਾਂ `azd provision --preview` ਚਲਾਓ। ਇਹ ਕੀ-ਜੇ ਕਰਦਾ ਹੈ ਅਤੇ ਕੋਈ ਸਰੋਤ ਬਣਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਟੈਂਪਲੇਟ ਗਲਤੀਆਂ ਨੂੰ ਉਜਾਗਰ ਕਰਦਾ ਹੈ।

---

## ਕਦਮ 5: ਟੈਂਪਲੇਟ ਨੂੰ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ

ਰਿਪੋਜ਼ਟਰੀ ਨੂੰ GitHub 'ਤੇ ਧੱਕੋ (ਜਨਤਕ ਜੇ ਤੁਸੀਂ ਚਾਹੁੰਦੇ ਹੋ ਕਿ ਹੋਰ ਲੋਕ ਇਸ ਦੀ ਵਰਤੋਂ ਕਰਨ):

```bash
gh repo create my-azd-template --public --source=. --push
```

ਹੁਣ ਕੋਈ ਵੀ ਇਸਦੀ ਵਰਤੋਂ ਕਰ ਸਕਦਾ ਹੈ:

```bash
azd init --template your-github-username/my-azd-template
```

---

## ਕਦਮ 6 (ਵਿਕਲਪੀ): Awesome AZD ਨੂੰ ਜਮ੍ਹਾਂ ਕਰੋ

[Awesome AZD ਗੈਲਰੀ](https://azure.github.io/awesome-azd/) ਵਿੱਚ ਕਮਿਊਨਿਟੀ ਟੈਂਪਲੇਟ ਲਿਸਟ ਕੀਤੇ ਜਾਂਦੇ ਹਨ। ਲਿਸਟ ਹੋਣ ਲਈ ਤੁਹਾਡੇ ਰਿਪੋ ਵਿੱਚ ਇਹ ਚੀਜ਼ਾਂ ਹੋਣੀਆਂ ਚਾਹੀਦੀਆਂ ਹਨ:

- ✅ ਸਾਫ਼-ਸੁਥਰੀ `README.md` ਜਿਸ ਵਿੱਚ ਪ੍ਰਾਥਮਿਕਤਾਵਾਂ, ਇੱਕ ਆਰਕੀਟੈਕਚਰ ਡਾਇਅਗ੍ਰਾਮ ਅਤੇ ਲਾਗਤ ਨੋਟਸ ਹੋਣ
- ✅ ਕੰਮ ਕਰ ਰਹੀ `azure.yaml` ਜਿਸ ਵਿੱਚ `metadata.template` ਸ਼ਾਮਲ ਹੋਵੇ
- ✅ ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਜੋ ਇਕ ਨਵੀਂ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵਿੱਚ ਸੁਚੱਜੀ ਤਰ੍ਹਾਂ ਪ੍ਰਦਾਨ ਕੀਤਾ ਜਾਵੇ
- ✅ ਇੱਕ `LICENSE` ਫਾਇਲ
- ✅ (ਸਿਫ਼ਾਰਸ਼ੀ) ਇੱਕ `.devcontainer/` ਜੋ ਇਕ ਕਲਿੱਕ ਨਾਲ Codespaces ਬਣਾਉਂਦਾ ਹੈ

[Awesome AZD ਰਿਪੋਜ਼ਟਰੀ](https://github.com/Azure/awesome-azd) ਤੇ ਦਾਨੀ ਦਾਇਰੈਕਸ਼ਨ ਦੀ ਪਾਲਣਾ ਕਰਦਿਆਂ ਆਪਣਾ ਟੈਂਪਲੇਟ ਗੈਲਰੀ ਦੇ ਡਾਟਾ ਫਾਇਲ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰਨ ਲਈ ਪੂਲ ਰਿਕਵੇਸਟ ਖੋਲ੍ਹ ਕੇ ਜਮ੍ਹਾਂ ਕਰੋ।

---

## ਆਮ ਗਲਤੀਆਂ

| ਗਲਤੀ | ਸੁਧਾਰ |
|---------|-----|
| ਹਾਰਡਕੋਡ ਕੀਤੇ ਸਰੋਤ ਨਾਮ | `uniqueString()` ਸਰੋਤ ਟੋਕਨ ਦੀ ਵਰਤੋਂ ਕਰੋ |
| `azd down` ਸਰੋਤ ਛੱਡ ਜਾਂਦਾ ਹੈ | ਹਰ ਸਰੋਤ (ਜਾਂ ਸਰੋਤ ਸਮੂਹ) ਨੂੰ `azd-env-name` ਟੈਗ ਕਰੋ |
| ਟੈਂਪਲੇਟ ਤੁਹਾਡੇ ਲਈ ਚੰਗਾ ਕੰਮ ਕਰਦਾ ਹੈ ਪਰ ਹੋਰਾਂ ਲਈ ਨਹੀਂ | ਸਬਸਕ੍ਰਿਪਸ਼ਨ IDਜ਼, ਟੇਨੈਂਟ IDਜ਼ ਅਤੇ ਖੇਤਰ ਫਰਜ਼ ਨੂੰ ਹਟਾਓ |
| ਆਉਟਪੁੱਟ ਐਪ ਨਾਲ ਨਹੀਂ ਜੁੜੇ | `SERVICE_<NAME>_ENDPOINT_URL` ਅਤੇ ਹੋਰ `AZURE_*` ਆਉਟਪੁੱਟ ਨਿਰਯਾਤ ਕਰੋ |
| ਗੈਲਰੀ ਵਿੱਚ ਜਮ੍ਹਾਂ ਕਰਨ ਤਬਜ਼ੀਅਤ ਕੀਤੀ ਗਈ | `README.md`, `LICENSE`, ਅਤੇ `metadata.template` ਸ਼ਾਮਲ ਕਰੋ |

---

## ਸਾਰ

- ਇੱਕ ਟੈਂਪਲੇਟ ਸਿਰਫ਼ ਇੱਕ Git ਰਿਪੋ ਹੁੰਦਾ ਹੈ ਜਿਸ ਵਿੱਚ `azure.yaml`, `infra/`, ਅਤੇ ਤੁਹਾਡਾ ਕੋਡ ਹੁੰਦਾ ਹੈ।
- ਸਭ ਕੁਝ ਪੈਰਾਮੀਟਰ ਕਰੋ—ਨਾਂ, ਖੇਤਰਾਂ, ਅਤੇ IDਜ਼—ਤਾਂ ਜੋ ਇਹ ਕਿਤੇ ਵੀ ਚੱਲ ਸਕੇ।
- ਹਮੇਸ਼ਾਂ ਸਰੋਤਾਂ ਨੂੰ `azd-env-name` ਟੈਗ ਨਾਲ ਜੋੜੋ ਤਾਂ ਜੋ `azd down` ਕੰਮ ਕਰੇ।
- ਪ੍ਰਕਾਸ਼ਿਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ `azd init --template <local-path>` ਨਾਲ ਲੋਕਲੀ ਟੈਸਟ ਕਰੋ।
- Awesome AZD ਨੂੰ ਜਮ੍ਹਾਂ ਕਰਨ ਲਈ ਮੈਟਾਡੇਟਾ ਅਤੇ README ਸ਼ਾਮਲ ਕਰੋ।

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਸਰੋਤ |
|-----------|----------|
| **ਪਿਛਲਾ** | [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md) |
| **ਅਧਿਆਇ ਮੁੱਖ ਪੰਨਾ** | [ਅਧਿਆਇ 4: ਕੋਡ ਵਜੋਂ ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ](README.md) |
| **ਅਗਲਾ ਅਧਿਆਇ** | [ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ ਸੌਲਿਊਸ਼ਨ](../chapter-05-multi-agent/README.md) |

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਸਰੋਤ ਪ੍ਰਦਾਨ ਕਰਨਾ](provisioning.md)
- [Awesome AZD ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [ਆਧਿਕਾਰਿਕ azd ਟੈਂਪਲੇਟ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->