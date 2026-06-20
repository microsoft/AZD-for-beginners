# ਆਪਣਾ ਖੁਦ ਦਾ azd ਟੈਮਪਲੇਟ ਬਣਾਉਣਾ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: Chapter 4 - Infrastructure as Code & Deployment
- **⬅️ ਪਹਿਲਾਂ**: [Deployment Guide](deployment-guide.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> ਇਸ ਦੀ ਜਾਂਚ `azd 1.25.6` ਨਾਲ ਜੂਨ 2026 ਵਿੱਚ ਕੀਤੀ ਗਈ ਸੀ।

## ਪਰਿਚਯ

ਇਤੋਂ ਤਕ ਤੁਸੀਂ `azd init --template <name>` ਨਾਲ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਖਪਤ ਕੀਤਾ ਹੈ। ਪਰ ਜਦੋਂ ਤੁਹਾਡੇ ਕੋਲ ਇੱਕ ਪ੍ਰੋਜੈਕਟ ਲੇਆਉਟ ਹੋਵੇ ਜੋ ਤੁਹਾਡੀ ਟੀਮ ਨੂੰ ਪਸੰਦ ਆਉਂਦੀ ਹੋਵੇ—ਜਿਵੇਂ ਕਿ ਇੱਕ Container App ਨਾਲ Cosmos DB ਅਤੇ ਠੀਕ ਮਾਨੀਟਰਿੰਗ—ਤਤੋਂ ਤੁਸੀਂ ਉਨ੍ਹਾਂ ਨੂੰ ਆਪਣਾ ਦੁਬਾਰਾ ਵਰਤਨਯੋਗ ਟੈਮਪਲੇਟ ਬਣਾਉਣਾ ਚਾਹੋਗੇ। ਇੱਕ ਟੈਮਪਲੇਟ ਸਿਰਫ਼ ਇੱਕ Git ਰਿਪੋਜ਼ਟਰੀ ਹੈ ਜਿਸ ਵਿੱਚ ਇੱਕ ਪੇਸ਼ਗੀ ਢਾਂਚਾ ਹੁੰਦਾ ਹੈ ਜੋ azd ਪੜ੍ਹ ਸਕਦਾ ਹੈ। ਇਹ ਪਾਠ ਤੁਹਾਨੂੰ ਦਿਖਾਵੇਗਾ ਕਿ ਕਿਵੇਂ ਸ਼ੁਰੂ ਤੋਂ ਇੱਕ ਬਣਾਉਣੀ ਹੈ, ਟੈਸਟ ਕਰਨੀ ਹੈ, ਅਤੇ (ਵਿਕਲਪਿਕ ਤੌਰ 'ਤੇ) ਕਮਿਊਨਿਟੀ ਗੈਲਰੀ 'ਚ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰਨੀ ਹੈ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਪਾਠ ਦੇ ਅਖੀਰ ਤੱਕ, ਤੁਸੀਂ:
- ਸਮਝੋਗੇ ਕਿ ਕਿਸ ਗੱਲ ਨੇ ਇੱਕ ਫੋਲਡਰ ਨੂੰ "azd ਟੈਮਪਲੇਟ" ਬਣਾਇਆ ਹੋਇਆ ਦਿਖਾਉਂਦਾ ਹੈ
- ਲਾਜ਼ਮੀ ਫਾਇਲਾਂ ਅਤੇ ਫੋਲਡਰ ਲੇਆਉਟ ਨੂੰ ਜਾਣੋਗੇ
- ਇੱਕ `azure.yaml` ਅਤੇ `infra/` ਸ਼ਾਮਲ ਕਰੋਗੇ ਜੋ ਹੋਰ ਲੋਕ ਲੱਭ ਸਕਣ
- ਆਪਣੇ ਟੈਮਪਲੇਟ ਨੂੰ ਸਾਂਝਾ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋਗੇ
- ਇਸਨੂੰ ਪਬਲਿਸ਼ ਕਰੋਗੇ ਅਤੇ (ਵਿਕਲਪਿਕ) Awesome AZD 'ਚ ਸਬਮਿਟ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਨਵਾਂ ਟੈਮਪਲੇਟ ਰਿਪੋ ਸਕੈਫੋਲਡ ਤਿਆਰ ਕਰਨਾ
- ਇੰਫਰਾਸਟਰੱਕਚਰ ਨੂੰ ਐਸਾ ਬਣਾਉਣਾ ਕਿ ਇਹ ਕਿਸੇ ਵੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ 'ਚ ਕੰਮ ਕਰੇ
- `azd init` ਅਤੇ `azd up` ਨਾਲ ਟੈਮਪਲੇਟ ਦੀ ਪੁਸ਼ਟੀ ਕਰਨੀ
- ਕਮਿਊਨਿਟੀ ਗੈਲਰੀ ਲਈ ਲੋੜੀਂਦਾ ਮੈਟਾਡੇਟਾ ਸ਼ਾਮਲ ਕਰਨਾ

---

## ਟੈਮਪਲੇਟ, ਅਸਲ ਵਿੱਚ ਕੀ ਹੈ?

ਇੱਕ azd ਟੈਮਪਲੇਟ ਇੱਕ Git ਰਿਪੋਜ਼ਟਰੀ ਹੈ ਜੋ ਘੱਟੋ-ਘੱਟ ਇਹ ਸਮੇਤ ਰੱਖਦਾ ਹੈ:

| ਫਾਇਲ / ਫੋਲਡਰ | ਮਕਸਦ | ਲੋੜੀਂਦਾ? |
|---------------|---------|-----------|
| `azure.yaml` | ਸੇਵਾਵਾਂ, ਹੋਸਟ ਅਤੇ ਇੰਫਰਾ ਪ੍ਰੋਵਾਈਡਰ ਦਾ ਵਰਣਨ ਕਰਦਾ ਹੈ | ✅ ਹਾਂ |
| `infra/` | Bicep, Terraform, ਜਾਂ Pulumi ਜੋ ਰਿਸੋਰਸ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ | ✅ ਹਾਂ |
| `src/` (ਜਾਂ ਤੁਹਾਡਾ ਕੋਡ) | ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਜੋ azd ਡਿਪਲੋਅ ਕਰਦਾ ਹੈ | ✅ ਹਾਂ |
| `README.md` | ਟੈਮਪਲੇਟ ਵਰਤਣ ਦਾ ਤਰੀਕਾ | ✅ ਜ਼ੋਰਦਾਰ ਸਿਫਾਰਿਸ਼ |
| `.azdo/` ਜਾਂ `.github/` | CI/CD ਪਾਈਪਲਾਈਨ ਪਰਿਭਾਸ਼ਾਵਾਂ | ਵਿਕਲਪਿਕ |
| `.devcontainer/` | ਦੁਹਰਾਏ ਜਾ ਸਕਣ ਵਾਲਾ ਡੈਵ ਵਾਤਾਵਰਨ | ਵਿਕਲਪਿਕ |
| `azure.yaml` `metadata` | ਗੈਲਰੀ + ਟੈਲੀਮੇਟਰੀ ਜਾਣਕਾਰੀ | ਵਿਕਲਪਿਕ (ਪਬਲਿਸ਼ ਕਰਨ ਲਈ ਲਾਜ਼ਮੀ) |

ਇੱਥੇ ਕੁਝ ਜਾਦੂ ਨਹੀਂ ਹੈ: ਜਦੋਂ ਤੁਸੀਂ `azd init --template you/your-repo` ਚਲਾਉਂਦੇ ਹੋ, azd ਰਿਪੋ ਨੂੰ ਕਲੋਨ ਕਰਦਾ ਹੈ ਅਤੇ `azure.yaml` ਨੂੰ ਪੜ੍ਹਦਾ ਹੈ।

---

## ਕਦਮ 1: ਰਿਪੋ ਦਾ ਢਾਂਚਾ ਤਿਆਰ ਕਰੋ

ਫੋਲਡਰ ਢਾਂਚਾ ਹੱਥੋਂ ਬਣਾਓ ਜਾਂ ਇਕ ਘੱਟੋ-ਘੱਟ ਟੈਮਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰਕੇ ਸੋਧ ਕਰੋ:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# ਮਿਆਰੀ ਲੇਆਉਟ ਬਣਾਓ
mkdir -p src infra
```

ਆਮ ਤੌਰ 'ਤੇ ਮੁਕੰਮਲ ਲੇਆਉਟ ਇਸ ਤਰ੍ਹਾਂ ਦਿੱਸਦਾ ਹੈ:

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

ਇਹ ਟੈਮਪਲੇਟ ਦਾ ਦਿਲ ਹੈ। ਇਹ azd ਨੂੰ ਦੱਸਦਾ ਹੈ ਕਿ ਕੀ ਡਿਪਲੋਯ ਕਰਨਾ ਹੈ ਅਤੇ ਕਿਵੇਂ:

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

> `metadata.template` ਫੀਲਡ ਉਹ ਹੈ ਜੋ ਗੈਲਰੀ ਟੈਲੀਮੇਟਰੀ ਉਪਯੋਗ ਨੂੰ ਗਿਣਨ ਲਈ ਵਰਤਦੀ ਹੈ। `name@version` ਰੀਤੀ ਵਰਤੋ।

---

## ਕਦਮ 3: ਇੰਫਰਾਸਟਰੱਕਚਰ ਨੂੰ ਪੈਰਾਮੀਟਰ ਬਣਾਓ

ਇੱਕ *ਪੁਨਰ-ਉਪਯੋਗ* ਟੈਮਪਲੇਟ ਲਈ ਸਭ ਤੋਂ ਜ਼ਰੂਰੀ ਨਿਯਮ: **ਕਦੇ ਵੀ ਨਾਮ, ਰੀਜਨ ਜਾਂ ਸਬਸਕ੍ਰਿਪਸ਼ਨ-ਨਿਰਧਾਰਤ ਮੁੱਲ ਹਾਰਡਕੋਡ ਨਾ ਕਰੋ।** ਪੈਰਾਮੀਟਰਾਂ ਅਤੇ resource token ਪੈਟਰਨ ਦੀ ਵਰਤੋਂ ਕਰੋ ਤਾਂ ਜੋ ਉਹੀ ਟੈਮਪਲੇਟ ਕਿਸੇ ਵੀ ਵਿਅਕਤੀ ਦੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ 'ਚ ਕੰਮ ਕਰੇ।

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

ਇਹ ਟੈਮਪਲੇਟ-ਅਨੁਕੂਲ ਬਣਾਉਣ ਵਾਲੀਆਂ ਦੋ ਗੱਲਾਂ ਹਨ:

1. **`azd-env-name` ਟੈਗ** — azd ਇਸਨੂੰ ਪ੍ਰਤੀ ਵਾਤਾਵਰਨ ਰਿਸੋਰਸਾਂ ਨੂੰ ਟਰੈਕ ਅਤੇ ਸਾਫ਼ ਕਰਨ ਲਈ ਵਰਤਦਾ ਹੈ।
2. **`uniqueString(...)` resource token** — ਇੱਕ ਸਥਿਰ, ਗਲੋਬਲੀ-ਯੂਨੀਕ ਸਫਿਕਸ ਉਤਪੰਨ ਕਰਦਾ ਹੈ ਤਾਂ ਜੋ ਨਾਮ ਟਕਰਾਅ ਨਾ ਹੋਵੇ।

ਇੱਕ ਮਿਲਦਾ-ਜੁਲਦਾ parameters ਫਾਇਲ ਪ੍ਰਦਾਨ ਕਰੋ ਜੋ ਉਹ ਮੁੱਲ ਪੜ੍ਹਦਾ ਹੈ ਜੋ azd ਮਾਹੌਲ ਤੋਂ ਇੰਜੈਕਟ ਕਰਦਾ ਹੈ:

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

azd ਮੌਜੂਦਾ ਮਾਹੌਲ ਤੋਂ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ `${AZURE_ENV_NAME}` ਅਤੇ `${AZURE_LOCATION}` ਨੂੰ ਬਦਲਦਾ ਹੈ।

---

## ਕਦਮ 4: ਆਪਣੇ ਟੈਮਪਲੇਟ ਨੂੰ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਆਜ਼ਮਾਓ

ਸ਼ੇਅਰ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਸਾਫ ਸਟੇਟ ਤੋਂ ਸਾਬਿਤ ਕਰੋ ਕਿ ਟੈਮਪਲੇਟ ਕੰਮ ਕਰਦਾ ਹੈ।

**ਸਥਾਨਕ ਫੋਲਡਰ ਤੋਂ ਟੈਸਟ ਕਰੋ** (ਕੋਈ Git push ਲੋੜੀਂਦਾ ਨਹੀਂ):

```bash
# ਇੱਕ ਖਾਲੀ ਡਾਇਰੈਕਟਰੀ ਤੋਂ, ਆਪਣੀ ਸਥਾਨਕ ਟੈਂਪਲੇਟ ਪਾਥ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਇਨਿਸ਼ੀਅਲਾਈਜ਼ ਕਰੋ
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# ਸ਼ੁਰੂ ਤੋਂ ਅੰਤ ਤੱਕ ਪ੍ਰੋਵਿਜ਼ਨ ਅਤੇ ਡਿਪਲੋਇ ਕਰੋ
azd auth login
azd up
```

**ਫਿਰ teardown ਦੀ ਜਾਂਚ ਕਰੋ**—ਇੱਕ ਚੰਗਾ ਟੈਮਪਲੇਟ ਪੂਰੀ ਤਰ੍ਹਾਂ ਸਾਫ ਕਰ ਦੇਂਦਾ ਹੈ:

```bash
azd down --force --purge
```

ਜੇ `azd down` ਰਿਸੋਰਸਾਂ ਨੂੰ ਛੱਡ ਦਿੰਦਾ ਹੈ, ਤਾਂ ਸੰਭਵ ਹੈ ਕਿ ਤੁਸੀਂ ਕਿਸੇ ਰਿਸੋਰਸ 'ਤੇ `azd-env-name` ਟੈਗ ਲਗਾਉਣਾ ਭੁੱਲ ਗਏ ਹੋ।

> **ਸੁਝਾਅ:** ਪਹਿਲਾਂ `azd provision --preview` ਚਲਾਓ। ਇਹ ਇੱਕ what-if ਚਲਾਉਂਦਾ ਹੈ ਅਤੇ ਕਿਸੇ ਵੀ ਰਿਸੋਰਸ ਬਣਨ ਤੋਂ ਪਹਿਲਾਂ ਟੈਮਪਲੇਟ ਦੀਆਂ ਗਲਤੀਆਂ ਸਾਹਮਣੇ ਲਿਆਉਂਦਾ ਹੈ।

---

## ਕਦਮ 5: ਟੈਮਪਲੇਟ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ

ਰਿਪੋ ਨੂੰ GitHub 'ਤੇ ਪੁਸ਼ ਕਰੋ (ਜਨਤਕ ਜੇ ਤੁਸੀਂ ਚਾਹੁੰਦੇ ਹੋ ਕਿ ਹੋਰ ਇਸਨੂੰ ਵਰਤਣ):

```bash
gh repo create my-azd-template --public --source=. --push
```

ਹੁਣ ਕੋਈ ਵੀ ਇਸਨੂੰ ਵਰਤ ਸਕਦਾ ਹੈ:

```bash
azd init --template your-github-username/my-azd-template
```

---

## ਕਦਮ 6 (ਵਿਕਲਪਿਕ): Awesome AZD ਨੂੰ ਸਬਮਿਟ ਕਰੋ

[Awesome AZD ਗੈਲਰੀ](https://azure.github.io/awesome-azd/) ਕਮਿਊਨਿਟੀ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਲਿਸਟ ਕਰਦੀ ਹੈ। ਲਿਸਟ ਹੋਣ ਲਈ ਤੁਹਾਡੇ ਰਿਪੋ ਵਿੱਚ ਇਹ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ:

- ✅ ਇੱਕ ਸਾਫ਼ `README.md` ਜਿਸ ਵਿੱਚ ਢਿਠੇ-ਲਾਜ਼ਮੀ ਸ਼ਰਤਾਂ, ਇੱਕ ਆਰਕੀਟੈਕਚਰ ਡਾਇਆਗ੍ਰਾਮ, ਅਤੇ ਲਾਗਤ ਨੋਟਸ ਹੋਣ
- ✅ ਇੱਕ ਕੰਮ ਕਰਦਾ `azure.yaml` ਜਿਸ ਵਿੱਚ `metadata.template` ਹੋਵੇ
- ✅ ਇੰਫਰਾਸਟਰੱਕਚਰ ਜੋ ਨਵੇਂ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵਿੱਚ ਸਾਫ਼ ਤਰੀਕੇ ਨਾਲ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੋਵੇ
- ✅ ਇੱਕ `LICENSE` ਫਾਇਲ
- ✅ (ਸਿਫਾਰਸ਼ੀ) ਇੱਕ `.devcontainer/` ਇੱਕ-ਕਲਿੱਕ Codespaces ਲਈ

ਗੈਲਰੀ ਦੇ ਡਾਟਾ ਫਾਇਲ ਵਿੱਚ ਆਪਣਾ ਟੈਮਪਲੇਟ ਜੋੜਨ ਵਾਲੀ pull request ਖੋਲ੍ਹ ਕੇ ਸਬਮਿਟ ਕਰੋ, [Awesome AZD ਰਿਪੋ](https://github.com/Azure/awesome-azd) 'ਤੇ ਦਿੱਤੇ ਯੋਗਦਾਨ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼ ਨੂੰ ਫਾਲੋ ਕਰਦਿਆਂ।

---

## ਆਮ ਗਲਤੀਆਂ

| ਮੁਸ਼ਕਲ | ਸੋਧ |
|---------|-----|
| ਹਾਰਡਕੋਡ ਕੀਤੇ ਰਿਸੋਰਸ ਨਾਮ | `uniqueString()` resource token ਦੀ ਵਰਤੋਂ ਕਰੋ |
| `azd down` ਰਿਸੋਰਸ ਛੱਡਦਾ ਹੈ | ਹਰ ਰਿਸੋਰਸ (ਜਾਂ ਰਿਸੋਰਸ ਗਰੁੱਪ) 'ਤੇ `azd-env-name` ਟੈਗ ਲਗਾਓ |
| ਟੈਮਪਲੇਟ ਤੁਹਾਨੂੰ ਸਹੀ ਚੱਲਦਾ ਹੈ, ਦੂਜਿਆਂ ਲਈ ਫੇਲ ਹੁੰਦਾ ਹੈ | ਸਬਸਕ੍ਰਿਪਸ਼ਨ ID, ਟੇਨੈਂਟ ID ਅਤੇ ਰੀਜਨ ਧਾਰਨਾਵਾਂ ਹਟਾਓ |
| ਆਉਟਪੁੱਟ ਐਪ ਵਿੱਚ ਨਹੀਂ ਜੁੜੇ | `SERVICE_<NAME>_ENDPOINT_URL` ਅਤੇ ਹੋਰ `AZURE_*` ਆਉਟਪੁੱਟ ਐਕਸਪੋਰਟ ਕਰੋ |
| ਗੈਲਰੀ ਸਬਮਿਸ਼ਨ ਰੱਦ ਹੋਇਆ | `README.md`, `LICENSE`, ਅਤੇ `metadata.template` ਸ਼ਾਮਲ ਕਰੋ |

---

## ਸਰੰਸ਼

- ਇੱਕ ਟੈਮਪਲੇਟ ਸਿਰਫ਼ ਇੱਕ Git ਰਿਪੋ ਹੈ ਜਿਸ ਵਿੱਚ `azure.yaml`, `infra/`, ਅਤੇ ਤੁਹਾਡਾ ਕੋਡ ਹੁੰਦਾ ਹੈ।
- ਸਭ ਕੁਝ ਪੈਰਾਮੀਟਰ ਕਰੋ—ਨਾਮ, ਰੀਜਨ, ਅਤੇ ID—ਤਾਂ ਜੋ ਇਹ ਕਿਸੇ ਵੀ ਥਾਂ ਚਲ ਸਕੇ।
- ਹਮੇਸ਼ਾ ਰਿਸੋਰਸਾਂ ਨੂੰ `azd-env-name` ਨਾਲ ਟੈਗ ਕਰੋ ਤਾਂ ਕਿ `azd down` ਕੰਮ ਕਰੇ।
- ਪ੍ਰਕਾਸ਼ਿਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ `azd init --template <local-path>` ਨਾਲ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਟੈਸਟ ਕਰੋ।
- ਮੈਟਾਡੇਟਾ ਅਤੇ README ਸ਼ਾਮਲ ਕਰੋ ਤਾਂ ਕਿ Awesome AZD 'ਚ ਸਬਮਿਟ ਕੀਤਾ ਜਾ ਸਕੇ।

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਸੰਸਾਧਨ |
|-----------|----------|
| **ਪਹਿਲਾਂ** | [Deployment Guide](deployment-guide.md) |
| **ਅਧਿਆਇ ਹੋਮ** | [Chapter 4: Infrastructure as Code](README.md) |
| **ਅਗਲਾ ਅਧਿਆਇ** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 ਸੰਬੰਧਤ ਸਰੋਤ

- [Provisioning Resources](provisioning.md)
- [Awesome AZD ਗੈਲਰੀ](https://azure.github.io/awesome-azd/)
- [ਅਧਿਕਾਰਿਕ azd ਟੈਮਪਲੇਟ ਦਸਤਾਵੇਜ਼](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->