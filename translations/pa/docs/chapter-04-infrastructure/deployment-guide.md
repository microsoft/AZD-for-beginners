# ਤੈਨਾਤੀ ਗਾਈਡ - AZD ਤੈਨਾਤੀ ਵਿੱਚ ਮਹਾਰਤ

**ਅੱਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD ਸ਼ੁਰੂਆਤੀ ਲਈ](../../README.md)
- **📖 ਵਰਤਮਾਨ ਅੱਧਿਆਇ**: ਅੱਧਿਆਇ 4 - ਕੋਡ ਵਜੋਂ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਅਤੇ ਤੈਨਾਤੀ
- **⬅️ ਪਿਛਲਾ ਅੱਧਿਆਇ**: [ਅੱਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/configuration.md)
- **➡️ ਅਗਲਾ**: [ਸੰਸਾਧਨਾਂ ਦੀ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ](provisioning.md)
- **🧩 ਇਸ ਅੱਧਿਆਇ ਵਿੱਚ ਵੀ**: [ਆਪਣੇ ਹੀ ਟੈਮਪਲੇਟ ਲੇਖਨ](custom-templates.md)
- **🚀 ਅਗਲਾ ਅੱਧਿਆਇ**: [ਅੱਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ AI ਹੱਲ](../../examples/retail-scenario.md)

## ਜਾਣ ਪਹਿਚਾਣ

> ਨੂੰ `azd 1.37.2` (ਨਵੰਬਰ 2026) ਮੁਕਾਬਲੇ ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ। ਕਮਾਂਡਾਂ Bash ਵਰਤਦੀਆਂ ਹਨ; JSON ਉਦਾਹਰਣਾਂ ਲਈ `jq` ਦੀ ਲੋੜ ਹੈ। ਸਪੱਸ਼ਟ ਤੌਰ 'ਤੇ ਸ਼ੁਰੂ ਕੀਤੇ todo ਵਰਕਆਉਟ ਨੂੰ ਛੱਡ ਕੇ, ਉन्नਤ ਉਦਾਹਰਣ **ਇੰਟਿਗ੍ਰੇਸ਼ਨ ਫ੍ਰੈਗਮੈਂਟ** ਹਨ: ਆਪਣਾ ਸੋਰਸ, ਬੁਨਿਆਦੀ ਢਾਂਚਾ, ਟੈਸਟ ਅਤੇ ਸਕ੍ਰਿਪਟ ਪ੍ਰਦਾਨ ਕਰੋ। ਇਸ ਸਮੀਖਿਆ ਵਿੱਚ ਕੋਈ Azure ਡਿਪਲੋਇਮੈਂਟ ਨਹੀਂ ਕੀਤਾ ਗਿਆ।

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਦੇ ਹੋਏ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਬਾਰੇ ਤੁਹਾਨੂੰ ਹਰ ਗੱਲ ਦੱਸਦੀ ਹੈ, ਮੂਲ ਇਕ-ਕਮਾਂਡ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਲੈ ਕੇ ਕਸਟਮ ਹੂਕਸ, ਕਈ ਮਾਹੌਲਾਂ ਅਤੇ CI/CD ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ ਉੱਨਤ ਉਤਪਾਦਨ ਸਿਨੇਰੀਓਜ਼ ਤੱਕ। ਪ੍ਰਯੋਗਿਕ ਉਦਾਹਰਣਾਂ ਅਤੇ ਸਭ ਤੋਂ ਵਧੀਆ ਅਮਲੀ ਤਰੀਕਿਆਂ ਨਾਲ ਪੂਰੇ ਡਿਪਲੌਇਮੈਂਟ ਜੀਵਨ ਚੱਕਰ ਵਿੱਚ ਮਾਹਰ ਬਣੋ।

## ਸਿੱਖਣ ਦੇ ਲਕੜੀ

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- ਸਾਰੇ Azure Developer CLI ਡਿਪਲੋਇਮੈਂਟ ਕਮਾਂਡਾਂ ਅਤੇ ਵਰਕਫ్లోਜ਼ ਵਿੱਚ ਮਾਹਿਰ ਹੋ ਜਾਵੋਗੇ
- ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਤੋਂ ਮਾਨੀਟਰਿੰਗ ਤੱਕ ਪੂਰੇ ਡਿਪਲੋਇਮੈਂਟ ਲਾਈਫਸਾਈਕਲ ਨੂੰ ਸਮਝੋਗੇ
- ਪੂਰਵ ਅਤੇ ਪੋਸਟ-ਡਿਪਲੋਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਲਈ ਸਵੈ-ਨਿਰਧਾਰਿਤ ਡਿਪਲੋਇਮੈਂਟ ਹੂਕਸ ਲਾਗੂ ਕਰੋ
- ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਕਈ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
- ਬਲੂ-ਗ੍ਰੀਨ ਅਤੇ ਕੈਨਰੀ ਡਿਪਲੋਇਮੈਂਟ ਸਮੇਤ ਸੁਧਿਰਿਤ ਡਿਪਲੋਇਮੈਂਟ ਨੀਤੀਆਂ ਸੈੱਟ ਅਪ ਕਰੋ
- azd ਡਿਪਲੋਇਮੈਂਟਸ ਨੂੰ CI/CD ਪਾਈਪਲਾਈਨਜ਼ ਅਤੇ DevOps ਵਰਕਫਲੋਜ਼ ਨਾਲ ਏਕੀਕ੍ਰਿਤ ਕਰੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਦ, ਤੁਸੀਂ ਯੋਗ ਹੋਵੋਗੇ:
- ਸਾਰੇ azd ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਨੂੰ ਆਜ਼ਾਦੀ ਨਾਲ ਚਲਾਉਣ ਅਤੇ ਸਮੱਸਿਆਵਾਂ ਦੀ ਸੰਧਾਨ ਕਰਨਾ
- ਹੁਕਸ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਸਟਮ ਡਿਪਲੋਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਡਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰਨਾ
- ਢੁੱਕਵੰਨੀ ਸੁਰੱਖਿਆ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ ਸੰਰਚਿਤ ਕਰਨਾ
- ਜਟਿਲ ਬਹੁ-ਪ੍ਰਦਿਸ਼ ਡਿਪਲੋਇਮੈਂਟ ਸਥਿਤੀਆਂ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਨਾ
- ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਬਿਹਤਰ ਬਣਾਉਣਾ ਅਤੇ ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰਨਾ
- azd ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ ਏਂਟਰਪ੍ਰਾਈਜ਼ DevOps ਅਭਿਆਸਾਂ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰਨਾ

## ਡਿਪਲੋਇਮੈਂਟ ਓਵਰਵਿਊ

Azure Developer CLI ਕਈ ਡਿਪਲੋਇਮੈਂਟ ਕਮਾਂਡ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:
- `azd up` - ਪੂਰਾ ਵਰਕਫਲੋ (ਪ੍ਰੋਵਿਜ਼ਨ + ਡਿਪਲੋਇ)
- `azd provision` - ਸਿਰਫ Azure ਸਰੋਤ ਬਣਾਉਣਾ/ਅੱਪਡੇਟ ਕਰਨਾ
- `azd deploy` - ਸਿਰਫ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨਾ
- `azd package` - ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਬਣਾਣਾ ਅਤੇ ਪੈਕੇਜ਼ ਕਰਨਾ

## ਬੁਨਿਆਦੀ ਡਿਪਲੋਇਮੈਂਟ ਵਰਕਫਲੋਜ਼

### ਪੂਰੀ ਤਰ੍ਹਾਂ ਡਿਪਲੋਇਮੈਂਟ (azd up)
ਨਵੇਂ ਪ੍ਰੋਜੈਕਟਾਂ ਲਈ ਸਭ ਤੋਂ ਆਮ ਵਰਕਫਲੋ:
```bash
# Deploy everything from scratch
azd up

# Deploy with specific environment
azd up --environment production

# Configure a location for the selected environment before first provisioning
azd env set AZURE_LOCATION westus2
# SKU changes must be wired into your template's parameter file/Bicep.
azd up
```

### ਸਿਰਫ਼ ਢਾਂਚਾਗਤ ਡਿਪਲੋਇਮੈਂਟ
ਜਦੋਂ ਤੁਹਾਨੂੰ ਸਿਰਫ਼ Azure ਸਰੋਤਾਂ ਨੂੰ ਅੱਪਡੇਟ ਕਰਨ ਦੀ ਲੋੜ ਹੋਵੇ:
```bash
# Provision/update infrastructure
azd provision

# Provision with dry-run to preview changes
azd provision --preview

# Provisioning applies infrastructure, not an azure.yaml service selection.
# In a configured layered project, use: azd provision <layer-name>
```

### ਸਿਰਫ਼ ਕੋਡ ਡਿਪਲੋਇਮੈਂਟ
ਤੇਜ਼ ਅਰਜ਼ੀ ਅੱਪਡੇਟਸ ਲਈ:
```bash
# Deploy all services
azd deploy

# Expected output:
# Deploying services (azd deploy)
# - web: Deploying... Done
# - api: Deploying... Done
# SUCCESS: Your deployment completed in 2 minutes 15 seconds

# Deploy specific service
azd deploy web
azd deploy api

# Docker build arguments belong in azure.yaml: services.api.docker.buildArgs
# They are not an azd deploy --build-arg flag.

# Verify deployment
azd show --output json | jq '.services'
```

### ✅ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਪੁਸ਼ਟੀ

ਕਿਸੇ ਵੀ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਬਾਅਦ, ਸਫਲਤਾ ਦੀ ਜਾਂਚ ਕਰੋ:

```bash
# Inspect configured service targets and ingress URLs (not a health check)
azd show

# Test health endpoints
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

curl -f "$WEB_URL" || { echo "❌ Web request failed"; exit 1; }
# For the todo-nodejs-mongo template, /lists exists; /health does not.
curl -f "$API_URL/lists" || { echo "❌ API request failed"; exit 1; }

# Monitor for errors (opens in browser by default)
azd monitor --logs
```

**ਸਫਲਤਾ ਦੀਆਂ ਸ਼ਰਤਾਂ:**
- ✅ `azd show` ਉਮੀਦ ਕੀਤੇ ਸਰਵਿਸ ਟਾਰਗਟ/ਯੂਆਰਐਲ ਨੂੰ ਹੱਲ ਕਰਦਾ ਹੈ
- ✅ ਅਸਲੀ ਅਰਜ਼ੀ ਰਾਹਾਂ ਨੂੰ ਮੰਗਾਂ ਉਮੀਦ ਕੀਤਾ ਗਿਆ ਸਥਿਤੀ ਅਤੇ ਬਾਡੀ ਵਾਪਸ ਕਰਦੇ ਹਨ
- ✅ ਆਖਰੀ 5 ਮਿੰਟਾਂ ਵਿੱਚ ਕੋਈ ਐਰਰ ਲਾਗ ਨਹੀਂ
- ✅ ਅਰਜ਼ੀ ਟੈਸਟ ਬੇਨਤੀਆਂ ਦਾ ਜਵਾਬ ਦਿੰਦੀ ਹੈ

## 🏗️ ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਮਝਣਾ

### ਹੁੱਕਾਂ ਵਿੱਚ ਨਵੇਂ ਹੋ? ਇੱਥੋਂ ਸ਼ੁਰੂ ਕਰੋ

ਇੱਕ **ਹੁੱਕ** ਉਹ ਕਮਾਂਡ ਹੈ ਜੋ azd ਖੁਦਕੁਸ਼ੀ ਤੌਰ 'ਤੇ ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਦੇ ਕਿਸੇ ਖਾਸ ਸਮੇਂ 'ਤੇ ਚਲਾਉਂਦਾ ਹੈ—ਪ੍ਰੋਵੀਜਨਿੰਗ ਤੋਂ ਪਹਿਲਾਂ ਜਾਂ ਬਾਅਦ, ਅਤੇ ਤੁਹਾਡੇ ਕੋਡ ਨੂੰ ਡਿਪਲੋਇਮੈਂਟ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਜਾਂ ਬਾਅਦ। ਇਹ ਤੁਹਾਨੂੰ ਉਹ ਛੋਟੇ-ਛੋਟੇ ਕੰਮ ਆਟੋਮੇਟ ਕਰਨ ਦੀ ਆਗਿਆ ਦਿੰਦੇ ਹਨ ਜੋ ਹਮੇਸ਼ਾਂ ਡਿਪਲੋਇਮੈਂਟ ਦੇ ਆਲੇ-ਦੁਆਲੇ ਹੁੰਦੇ ਹਨ: ਇੱਕ ਡੈਟਾਬੇਸ ਬੀਜਣਾ, ਮਾਈਗ੍ਰੇਸ਼ਨ ਚਲਾਉਣਾ, ਐਸੈਟਸ ਬਨਾਉਣਾ ਜਾਂ ਲਾਈਵ ਅਰਜ਼ੀ ਨੂੰ ਸ੍ਮੋਕ-ਟੈਸਟ ਕਰਨਾ।

| ਹੁੱਕ | ਚਲਦਾ ਹੈ… | ਆਮ ਵਰਤੋਂ |
|------|-------|------------|
| `preprovision` | ਸਰੋਤ ਬਣਨ ਤੋਂ ਪਹਿਲਾਂ | ਸ਼ਰਤਾਂ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ, ਰਜਿਸਟਰੀ ਵਿੱਚ ਲਾਗਇਨ ਕਰੋ |
| `postprovision` | ਸਰੋਤ ਮੌਜੂਦ ਹੋਣ ਤੋਂ ਬਾਅਦ | ਸਰੋਤਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ, ਡੇਟਾਬੇਸ ਸੈੱਟਅੱਪ ਕਰੋ |
| `predeploy` | ਕੋਡ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ | ਫਰੰਟ-ਐਂਡ ਐਸੈਟ ਬਣਾਉ, ਯੂਨਿਟ ਟੈਸਟ ਚਲਾਉ |
| `postdeploy` | ਕੋਡ ਲਾਈਵ ਹੋਣ ਤੋਂ ਬਾਅਦ | ਡੀਬੀ ਮਾਈਗਰੇਸ਼ਨ ਚਲਾਓ, ਐਂਡਪੋਇੰਟ ਦਾ ਸ੍ਮੋਕ-ਟੈਸਟ ਕਰੋ |

ਹੁੱਕ ਤੁਹਾਡੇ `azure.yaml` ਵਿੱਚ ਰਹਿੰਦੇ ਹਨ। ਇੱਥੇਂ ਸਭ ਤੋਂ ਛੋਟਾ ਸੰਭਵ ਉਦਾਹਰਣ ਹੈ—ਇਹ ਸਿਰਫ़ ਡਿਪਲੋਇਮੈਂਟ ਤੋਂ ਬਾਅਦ ਇਕ ਸੁਨੇਹਾ ਛਾਪਦਾ ਹੈ:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

ਇਸੇ ਗੱਲ—ਅਗਲੀ ਵਾਰੀ ਜਦੋਂ ਤੁਸੀਂ `azd up` ਚਲਾਓਗੇ, ਸੁਨੇਹਾ ਆਟੋਮੈਟਿਕ ਪ੍ਰਿੰਟ ਹੋ ਜਾਵੇਗਾ। ਤੁਸੀਂ ਪੂਰੀ ਤਰ੍ਹਾਂ ਡਿਪਲੋਏ ਕਰਦੇ ਬਿਨਾਂ ਸਿਰਫ਼ ਇੱਕ ਹੁਕ ਨੂੰ ਵੀ ਚਲਾ ਸਕਦੇ ਹੋ, ਜੋ ਟੈਸਟਿੰਗ ਲਈ ਬਹੁਤ ਵਧੀਆ ਹੈ:

```bash
azd hooks run postdeploy
```

ਹੇਠਾਂ ਦਿੱਤੇ ਫੇਜ਼ ਅਸਲੀ ਦੁਨੀਆ ਦੇ ਹੁਕ (ਮਾਈਗ੍ਰੇਸ਼ਨ, ਟੈਸਟ, ਵੈਰੀਫਿਕੇਸ਼ਨ) ਹਰ ਐਸਟੇਜ਼ ਲਈ ਦਿਖਾਉਂਦੇ ਹਨ।

### ਫੇਜ਼ 1: ਪਹਿਲਾਂ-ਵੰਡੇ ਜਾਣ ਵਾਲੇ ਹੁਕ
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### ਫੇਜ਼ 2: ਪੇਂਡਾ ਬਣਾਉਣ ਵਾਲੀ ਇੰਫਰਾਸਟਰੱਕਚਰ
- ਇੰਫਰਾਸਟਰੱਕਚਰ ਟੈਂਪਲੇਟ (Bicep/Terraform) ਪੜ੍ਹਦਾ ਹੈ
- ਆਜ਼ੁਰ ਸਰੋਤ ਬਣਾਉਂਦਾ ਜਾਂ ਅੱਪਡੇਟ ਕਰਦਾ ਹੈ
- ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸੈੱਟ ਕਰਦਾ ਹੈ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸਥਾਪਿਤ ਕਰਦਾ ਹੈ

### ਫੇਜ਼ 3: ਵੰਡੇ ਜਾਣ ਤੋਂ ਬਾਅਦ ਦੇ ਹੁਕ
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### ਫੇਜ਼ 4: ਐਪਲੀਕੇਸ਼ਨ ਪੈਕੇਜਿੰਗ
- ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਬਣਾਉਂਦਾ ਹੈ
- ਡਿਪਲੋਏਮੈਂਟ ਲਈ ਆਰਟੀਫੈਕਟ ਬਣਾਉਂਦਾ ਹੈ
- ਟਾਰਗਟ ਪਲੇਟਫਾਰਮ ਲਈ ਪੈਕੇਜ ਕਰਦਾ ਹੈ (ਕੰਟੇਨਰ, ZIP ਫਾਈਲਾਂ ਆਦਿ)

### ਫੇਜ਼ 5: ਪੂਰਵ-ਡਿਪਲੋਏ ਹੁਕ
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### ਫੇਜ਼ 6: ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਏਮੈਂਟ
- ਪੈਕੇਜ ਕੀਤੇ ਐਪਲੀਕੇਸ਼ਨਜ਼ ਨੂੰ ਆਜ਼ੁਰ ਸੇਵਾਵਾਂ 'ਤੇ ਡਿਪਲੋਏ ਕਰਦਾ ਹੈ
- ਕਨਫਿਗਰੇਸ਼ਨ ਸੈਟਿੰਗਜ਼ ਨੂੰ ਅੱਪਡੇਟ ਕਰਦਾ ਹੈ
- ਸੇਵਾਵਾਂ ਚਾਲੂ/ਰੀਸਟਾਰਟ ਕਰਦਾ ਹੈ

### ਫੇਜ਼ 7: ਡਿਪਲੋਏਮੈਂਟ ਤੋਂ ਬਾਅਦ ਦੇ ਹੁਕ
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl --fail "$WEB_URL/health"
```

### ਹੁਕ ਤਰੁੱਟੀਆਂ ਨੂੰ ਸੰਭਾਲਣਾ

ਮੂਲ ਰੂਪ ਵਿੱਚ, **ਜੇ ਕੋਈ ਹੁਕ ਕਮਾਂਡ ਗੈਰ-ਜ਼ੀਰੋ ਕੋਡ ਨਾਲ ਨਿਕਲਦੀ ਹੈ, ਤਾਂ azd ਪੂਰੇ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਰੋਕ ਦਿੰਦਾ ਹੈ।** ਇਹ ਅਕਸਰ ਤੁਹਾਡੀ ਲੋੜ ਹੈ—ਅਸਫਲ ਮਾਈਗ੍ਰੇਸ਼ਨ ਨੇ ਡਿਪਲੋਏ ਰੋਕ ਦੈਣਾ ਚਾਹੀਦਾ ਹੈ, ਨਾ ਕਿ ਖਰਾਬ ਐਪ ਭੇਜਣਾ। ਪਰ ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਹੁਕ ਸਾਵਧਾਨੀ ਨਾਲ ਲਿਖੇ ਜਾਣੀ ਚਾਹੀਦੀ ਹੈ।

**1. ਫੇਲ੍ਹ ਨੂੰ ਜ਼ੋਰਦਾਰ ਅਤੇ ਇਰਾਦਾਪੂਰਵਕ ਬਣਾਓ।** ਇੱਕ ਹੁਕ ਫੇਲ੍ਹ ਹੁੰਦਾ ਹੈ ਜਦੋਂ ਇਸਦੀ ਆਖਰੀ ਕਮਾਂਡ ਇੱਕ ਗੈਰ-ਜ਼ੀਰੋ ਆਵ੍ਰਤੀ ਕੋਡ ਦਿੰਦੀ ਹੈ। ਸ਼ੈੱਲ ਸਕ੍ਰਿਪਟਾਂ ਵਿੱਚ, `set -e` ਨੂੰ ਸ਼ਾਮਲ ਕਰੋ ਤਾਂ ਜੋ ਹੁਕ ਪਹਿਲੀ ਅਸਫਲ ਕਮਾਂਡ ਤੇ ਹੀ ਰੁਕ ਜਾਵੇ ਬਜਾਏ ਚੁੱਪਚਾਪ ਜਾਰੀ ਰਹਿਣ ਦੇ:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. ਇੱਕ ਹੁਕ ਨੂੰ azd ਨੂੰ ਬਿਨਾਂ ਰੋਕੇ ਫੇਲ੍ਹ ਹੋਣ ਦੀ ਆਗਿਆ ਦਿਓ।** ਗੈਰ-ਆਵਸ਼ਕ ਕਦਮਾਂ ਲਈ (ਇੱਕ ਵਿਕਲਪਿਕ ਕੇਸ਼ ਵਾਰਮ-ਅੱਪ, ਇੱਕ ਬੈਸਟ-ਐਫੋਰਟ ਨੋਟੀਫਿਕੇਸ਼ਨ), `continueOnError: true` ਸੈੱਟ ਕਰੋ। azd ਫੇਲ੍ਹ ਨੂੰ ਲੌਗ ਕਰਦਾ ਹੈ ਪਰ ਅੱਗੇ ਚਲਦਾ ਰਹਿੰਦਾ ਹੈ:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f "$WEB_URL/warmup"
```

**3. ਪੂਰਾ ਚਲਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਹੁਕਾਂ ਨੂੰ ਅਲੱਗ-ਅਲੱਗ ਟੈਸਟ ਕਰੋ।** ਤੁਹਾਨੂੰ ਹੁਕ ਨੂੰ ਡੀਬੱਗ ਕਰਨ ਲਈ ਹਰ ਵਾਰੀ `azd up` ਚਲਾਉਣ ਦੀ ਲੋੜ ਨਹੀਂ—ਇਸਨੂੰ ਅਕੇਲਾ ਚਲਾਓ ਅਤੇ ਤੇਜ਼ੀ ਨਾਲ ਦੁਹਰਾਓ:

```bash
azd hooks run predeploy          # runs the matching project/service hooks
azd hooks run postdeploy --service api
```

**4. OS-ਵਿਸ਼ੇਸ਼ ਸ਼ੈੱਲ ਲਈ ਧਿਆਨ ਦਿਓ।** ਜੋ ਹੁਕ `shell: pwsh` ਵਰਤਦਾ ਹੈ, ਮਸ਼ੀਨ ਤੇ PowerShell ਇੰਸਟਾਲ ਹੋਣਾ ਜ਼ਰੂਰੀ ਹੈ ਜਿਸ 'ਤੇ ਇਹ ਚੱਲ ਰਿਹਾ ਹੈ (ਜਿਸ ਵਿੱਚ CI ਏਜੰਟ ਸ਼ਾਮਲ ਹਨ)। ਸਭ ਤੋਂ ਪਹੁੰਚਯੋਗਤਾ ਲਈ `shell: sh` ਵਰਤੋਂ, ਜਾਂ ਦੁਹਾਂ `windows` ਅਤੇ `posix` ਵਿਸ਼ਨ ਦੇਵੋ:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **ਡੀਬੱਗਿੰਗ ਟਿਪ:** ਕਿਸੇ ਵੀ azd ਕਮਾਂਡ ਨੂੰ `--debug` ਨਾਲ ਚਲਾਓ ਤਾਂ ਜੋ ਸਹੀ ਹੁਕ ਕਮਾਂਡ ਲਾਈਨ ਅਤੇ ਇਸ ਦਾ ਪੂਰਾ ਆਉਟਪੁਟ ਵੇਖੋ—ਜਦੋਂ ਕੋਈ ਹੁਕ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਕੰਮ ਕਰਦਾ ਹੈ ਪਰ CI ਵਿੱਚ ਫੇਲ੍ਹ ਹੁੰਦਾ ਹੈ ਤਾਂ ਬਹੁਮੁੱਲ ਹੈ।

## 🎛️ ਡਿਪਲੋਏਮੈਂਟ ਸੰਰਚਨਾ

### ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਡਿਪਲੋਏਮੈਂਟ ਸੈਟਿੰਗਾਂ
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    language: js
    dist: dist
    
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
    env:
      NODE_ENV: production
      API_VERSION: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    language: js
```

### ਵਾਤਾਵਰਣ-ਵਿਸ਼ੇਸ਼ ਸੰਰਚਨਾਵਾਂ

ਇਹ ਸਿਰਫ਼ ਸਥਾਨਕ azd ਮੁੱਲ ਹਨ। ਇਨ੍ਹਾਂ ਨੂੰ ਇੰਫਰਾਸਟਰੱਕਚਰ/ਰੰਟਾਈਮ ਸੰਰਚਨਾ ਨਾਲ ਵਿਆਖਿਆਤਮਕ ਤੌਰ 'ਤੇ ਜੋੜੋ। `NODE_ENV` ਆਮ ਤੌਰ 'ਤੇ ਇੱਕ ਤਨਕੀਨਕ Node ਐਪ ਲਈ `production` ਹੁੰਦਾ ਹੈ, ਜਿਸ ਵਿੱਚ ਸਟੇਜਿੰਗ ਡਿਪਲੋਏਮੈਂਟ ਵੀ ਸ਼ਾਮਲ ਹੈ; ਵੱਖਰੀ ਐਪ-ਵਿਸ਼ੇਸ਼ ਵੈਰੀਏਬਲ ਵਰਤੋਂ ਡਿਪਲੋਏਮੈਂਟ ਸਟੇਜ਼ ਨੂੰ ਵੱਖਰਾ ਕਰਨ ਲਈ।

```bash
# Development environment
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# Staging environment
azd env new staging
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL info

# Production environment
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 ਉੱਚ-ਪੱਧਰੀ ਡਿਪਲੋਏਮੈਂਟ ਪਟਰਨ

### ਬਹੁ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨਜ਼
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### ਨੀਲਾ-ਹਰਾ ਡਿਪਲੋਏਮੈਂਟ

**ਦਿੱਖੀ ਓਪਰੇਸ਼ਨਲ ਸਕੈਚ:** ਤੁਹਾਨੂੰ ਦੋਹਾਂ ਵਾਤਾਵਰਣਾਂ, ਇੱਕ ਸਾਂਝਾ ਟ੍ਰੈਫਿਕ-ਰੂਟਿੰਗ ਲੇਅਰ, ਅਤੇ ਹੇਠਾਂ ਦਿੱਤੇ ਦੋ ਸਕ੍ਰਿਪਟ ਮੁਹੱਈਆ ਕਰਨੇ ਹਨ। azd ਆਪਣੇ ਆਪ ਟ੍ਰੈਫਿਕ ਨੂੰ ਸਵਿੱਚ ਜਾਂ ਰੋਲਬੈਕ ਤਿਆਰੀ ਦੀ ਜਾਂਚ ਨਹੀਂ ਕਰਦਾ। ਹਰੇ ਰੱਖੋ ਜਦ ਤੱਕ ਨੀਲਾ ਟੈਸਟਿੰਗ ਪਾਰ ਨਹੀਂ ਕਰਦਾ ਅਤੇ ਰੋਲਬੈਕ ਦੀ ਲੋੜ ਨਹੀਂ ਰਹਿੰਦੀ।

```bash
# Create blue environment
azd env new production-blue
azd up --environment production-blue

# Test blue environment
./scripts/test-environment.sh production-blue

# Switch traffic to blue (manual DNS/load balancer update)
./scripts/switch-traffic.sh production-blue

# Clean up green environment
azd env select production-green
azd down --force
```

### ਕੇਨਾਰੀ ਡਿਪਲોયਮੈਂਟ
```bash
# Requires an existing Container App in multiple-revision mode and two
# ready revisions. Replace placeholders with actual revision names.
az containerapp ingress traffic set \
  --name "<app-name>" --resource-group "<rg-name>" \
  --revision-weight "<stable-revision>=90" "<canary-revision>=10"
```

ਟ੍ਰੈਫਿਕ ਸਪਲਿਟਿੰਗ ਕੰਟੇਨਰ ਐਪਸ ਕੰਫਿਗਰੇਸ਼ਨ (ਬਾਇਸਪ ਜਾਂ ਐਜ਼ੂਰੇ CLI) ਨਾਲ ਸਬੰਧਤ ਹੈ, ਨਾ ਕਿ ਇੱਕ `azure.yaml` `trafficSplit` ਪ੍ਰਾਪਰਟੀ ਨਾਲ। ਪ੍ਰੀਵਿਊ/ਪ੍ਰੋਵਿਜਨਿੰਗ ਅਤੇ ਬਾਅਦ ਦੇ ਡਿਪਲੋਯਮੈਂਟ ਤੁਹਾਡੇ ਚੁਣੇ ਹੋਏ ਰੀਵਿਜ਼ਨ ਮੋਡ ਅਤੇ ਰੂਟਿੰਗ ਨਿਯਮਾਂ ਨੂੰ ਬਰਕਰਾਰ ਰੱਖਣੇ ਚਾਹੀਦੇ ਹਨ।

### ਸਟੇਜਡ ਡਿਪਲੋਯਮੈਂਟ
```bash
#!/bin/bash
# deploy-staged.sh
set -e

echo "Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 ਕੰਟੇਨਰ ਡਿਪਲੋਯਮੈਂਟ

### ਕੰਟੇਨਰ ਐਪ ਡਿਪਲੋਯਮੈਂਟ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    language: js
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - BUILD_VERSION=${BUILD_VERSION}
        - NODE_ENV=production
    env:
      NODE_ENV: production
```

ਕੰਟੇਨਰ ਐਪ ਜਾਂਚ- ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਵਿੱਚ `configuration.secrets`/`secretRef` (ਜਾਂ ਕੀ ਵਾਲਟ ਸੰਬੰਧ) ਨਾਲ ਰਨਟਾਈਮ ਸੀਕਰਟਸ ਸੰਰਚਿਤ ਕਰੋ ਅਤੇ `template.scale` ਨਾਲ ਸਕੇਲਿੰਗ ਕਰੋ। ਸੇਵਾ-ਪੱਧਰੀ `secrets` ਜਾਂ `scale` ਪ੍ਰਾਪਰਟੀਆਂ ਨੂੰ `azure.yaml` ਵਿੱਚ ਨਾ ਬਣਾਓ।

### ਮਲਟੀ-ਸਟੇਜ ਡੋਕਰਫਾਈਲ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ
```dockerfile
# Dockerfile
FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --omit=dev

FROM node:22-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ ਪ੍ਰਦਰਸ਼ਨ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ

### ਸੇਵਾ-ਵਿਸ਼ੇਸ਼ ਡਿਪਲੋਯਮੈਂਟ
```bash
# Deploy a specific service for faster iteration
azd deploy web
azd deploy api

# Deploy all services
azd deploy
```

### ਬਿਲਡ ਕੈਸ਼ਿੰਗ
```yaml
# azure.yaml fragment - assumes package.json has a build script
services:
  web:
    project: ./src/web
    language: js
    host: appservice
    dist: dist
```

ਮਿਆਰੀ Node ਵਰਕਫਲੋ ਪੈਕੇਜ ਸਕ੍ਰਿਪਟਾਂ ਦਾ ਉਪਯੋਗ ਕਰਦਾ ਹੈ; ਸੇਵਾ `prepackage` ਹੂਕ ਸਮੀਲੀਆਂ ਜ਼ਰੂਰੀ ਕਦਮ ਜੋੜ ਸਕਦੀਆਂ ਹਨ। ਡੋਕਰ ਲੇਅਰ ਕੈਸ਼ਿੰਗ ਸੇਵਾ ਬਿਲਡ ਕਮਾਂਡ ਨੂੰ ਪਰਿਭਾਸ਼ਿਤ ਕਰਨ ਤੋਂ ਵੱਖ ਹੈ।

### ਕੁਸ਼ਲ ਕੋਡ ਡਿਪਲੋਯਮੈਂਟ
```bash
# Use azd deploy (not azd up) for code-only changes
# This skips infrastructure provisioning and is much faster
azd deploy

# Deploy specific service for fastest iteration
azd deploy api
```

## 🔍 ਡਿਪਲੋਯਮੈਂਟ ਮੋਨੀਟਰਿੰਗ

### ਰੀਅਲ-ਟਾਈਮ ਡਿਪਲੋਯਮੈਂਟ ਮੋਨੀਟਰਿੰਗ
```bash
# Monitor application in real-time
azd monitor --live

# View application logs
azd monitor --logs

# Check deployment status
azd show
```

### ਹੈਲਥ ਚੈਕ
```bicep
// Partial Container App container definition:
// merge into properties.template.containers[] in your Bicep resource.
probes: [
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 3000
      scheme: 'HTTP'
    }
    initialDelaySeconds: 10
    periodSeconds: 30
    timeoutSeconds: 10
    failureThreshold: 3
  }
]
```

ਤੁਹਾਡੇ ਐਪ ਨੂੰ `/health` ਨੂੰ ਲਾਗੂ ਕਰਨਾ ਜ਼ਰੂਰੀ ਹੈ; ਇਹ azd ਦੁਆਰਾ ਸਵੈਚਾਲਿਤ ਤੌਰ 'ਤੇ ਪ੍ਰਦਾਨ ਨਹੀਂ ਕੀਤਾ ਜਾਂਦਾ। ਕਿਸੇ ਜਨਰਿਕ `azure.yaml` `healthCheck` ਸੇਵਾ ਪ੍ਰਾਪਰਟੀ ਨਹੀਂ ਹੈ।

### ਡਿਪਲੋਯਮੈਂਟ ਬਾਅਦ ਵੈਰੀਫਿਕੇਸ਼ਨ
```bash
#!/bin/bash
# scripts/validate-deployment.sh
set -e

echo "Validating deployment..."

# Check application health
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')

echo "Testing web application..."
if curl -f "$WEB_URL"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/lists"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 ਸੁਰੱਖਿਆ ਦੇ ਵਿਚਾਰ

### ਰਾਜ਼ ਪਰਬੰਧਨ
```bash
# Interactive Key Vault reference setup; requires appropriate vault permissions
azd env set-secret DATABASE_PASSWORD
azd env set-secret JWT_SECRET
azd env set-secret API_KEY
```

`azd env set ... --secret` ਅਵੈਧ ਹੈ। ਆਮ ਵਾਤਾਵਰਨ ਮੁੱਲ ਸਥਾਨਕ ਪਲੇਨ ਟੈਕਸਟ ਹੁੰਦੇ ਹਨ; ਪੜ੍ਹਨ ਵਾਲੇ ਕਮਾਂਡ ਉਨ੍ਹਾਂ ਨੂੰ ਗੁਪਤ ਕਰਨਗੇ, ਇਹ ਜ਼ਰੂਰੀ ਨਹੀਂ ਸਮਝੋ। ਉਪਰ ਦਿੱਤੇ ਕਮਾਂਡ ਕੀ ਵਾਲਟ ਸੰਬੰਧ ਸੰਭਾਲਦੇ ਹਨ, ਪਰ ਤੁਹਾਡੀ ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ/ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਹੁਣ ਵੀ ਰਾਜ਼ਾਂ ਖਪਤ ਕਰਕੇ ਰਨਟਾਈਮ ਆਈਡੈਂਟੀਟੀ ਦਾ ਪਹੁੰਚ ਦੇਣੀ ਪੈਂਦੀ ਹੈ।

### ਨੈੱਟਵਰਕ ਸੁਰੱਖਿਆ
ਬਾਇਸਪ ਵਿੱਚ ਨੈੱਟਵਰਕ ਪੈਰਾਮੀਟਰਾਂ ਦਾ ਐਲਾਨ ਅਤੇ ਉਪਭੋਗ ਕਰੋ ਅਤੇ ਉਨ੍ਹਾਂ ਨੂੰ `infra/main.parameters.json` ਵਿੱਚ ਨਕਸ਼ਾ ਬਣਾਓ। `azure.yaml` ਵਿੱਚ ਕਿਸੇ ਜਨਰਿਕ `infra.parameters` ਓਵਰਲੇ ਨਹੀਂ ਹੈ। ਉਦਾਹਰਨ ਦਸਤਾਵੇਜ਼ ਵਿੱਚ ਦਿਹਾਏ ਗਏ `203.0.113.0/24` ਅਤੇ `198.51.100.0/24` ਵਾਸਤਵਿਕ ਦਫਤਰ/VPN ਨੈੱਟਵਰਕ ਨਹੀਂ ਹਨ; ਉਨ੍ਹਾਂ ਨੂੰ ਮਨਜ਼ੂਰਸ਼ੁਦਾ ਨੈੱਟਵਰਕ ਸੀਮਾਵਾਂ ਨਾਲ ਬਦਲੋ।

### ਆਈਡੈਂਟੀਟੀ ਅਤੇ ਪਹੁੰਚ ਪਰਬੰਧ
ਕੰਟੇਨਰ ਐਪ ਦੀ `identity` ਨੂੰ ਬਾਇਸਪ ਵਿੱਚ ਯੋਗ ਕਰੋ ਅਤੇ ਕੀ ਵਾਲਟ ਡਾਟਾ-ਪਲੇਨ ਭੂਮਿਕਾ ਨਿੱਸ਼ਚਿਤ ਕੀਤੀ ਜਾਏ ਸੰਸਾਧਨ ਪੱਧਰ 'ਤੇ। ਉਸ ਸੰਸਾਧਨ ਵਿੱਚ ਨਾਮਿਤ ਕੀ ਵਾਲਟ-ਅਧਾਰਿਤ ਰਾਜ਼ ਅਤੇ ਰਨਟਾਈਮ ਸੰਬੰਧ ਸੰਰਚਿਤ ਕਰੋ; `identity` ਅਤੇ `keyVault` ਜਨਰਿਕ azd ਸੇਵਾ ਪ੍ਰਾਪਰਟੀਆਂ ਨਹੀਂ ਹਨ। ਵੇਖੋ [ਪ੍ਰਮਾਣੀਕਰਨ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਆਈਡੈਂਟੀਟੀ](../chapter-03-configuration/authsecurity.md)।

## 🚨 ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ

### ਤੇਜ਼ ਰੋਲਬੈਕ
```bash
# AZD doesn't have built-in rollback. Recommended approaches:

# Option 1: Redeploy from Git (recommended)
git revert HEAD  # Revert the problematic commit
git push
azd deploy

# Option 2: Redeploy specific commit
git checkout "<previous-commit-hash>"
azd deploy
git checkout main
```

### ਇਨਫ੍ਰਾਸਟਰੱਖਚਰ ਰੋਲਬੈਕ
```bash
# Preview infrastructure changes before applying
azd provision --preview

# For infrastructure rollback, use version control:
git revert HEAD  # Revert infrastructure changes
azd provision    # Apply previous infrastructure state
```

### ਡੇਟਾਬੇਸ ਮਾਈਗ੍ਰੇਸ਼ਨ ਰੋਲਬੈਕ
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 ਡਿਪਲੋਯਮੈਂਟ ਮੈਟ੍ਰਿਕਸ

### ਡਿਪਲੋਯਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਦਾ ਟ੍ਰੈਕ ਰੱਖੋ
```bash
# View current deployment status
azd show

# Monitor application with Application Insights
azd monitor --overview

# View live metrics
azd monitor --live
```

### ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਇਕੱਠਾ ਕਰਨ
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 ਸਭ ਤੋਂ ਵਧੀਆ ਅਮਲ

### 1. ਪਰਿਵੇਸ਼ ਸਥਿਰਤਾ
```bash
# Use consistent naming
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# Maintain environment parity
./scripts/sync-environments.sh
```

### 2. ਢਾਂਚਾ ਪ੍ਰਮਾਣਿਕਤਾ
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Use ARM/Bicep linting
az bicep lint --file infra/main.bicep

# Validate Bicep syntax
az bicep build --file infra/main.bicep
```

### 3. ਟੈਸਟਿੰਗ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. ਦਸਤਾਵੇਜ਼ੀਕਰਨ ਅਤੇ ਲੌਗਿੰਗ
```bash
# Document deployment procedures
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ਅਗਲੇ ਕਦਮ

- [ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਸਰੋਤ](provisioning.md) - ਢਾਂਚਾ ਪ੍ਰਬੰਧਨ ਵਿੱਚ ਡੂੰਘੀ ਪਹੁੰਚ
- [ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਯੋਜਨਾ](../chapter-06-pre-deployment/capacity-planning.md) - ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀ ਦੀ ਯੋਜਨਾ ਬਣਾਓ
- [ਆਮ ਸਮੱਸਿਆਵਾਂ](../chapter-07-troubleshooting/common-issues.md) - ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਧਾਰੋ
- [ਬਿਹਤਰ ਅਮਲ](../chapter-07-troubleshooting/debugging.md) - ਉਤਪਾਦਨ-ਤਿਆਰ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ

## 🎯 ਹੱਥੋਂ-ਹੱਥ ਡਿਪਲੌਇਮੈਂਟ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਇੰਕ੍ਰੀਮੈਂਟਲ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ (20 ਮਿੰਟ)
**ਲੱਛਾ**: ਪੂਰੇ ਅਤੇ ਇੰਕ੍ਰੀਮੈਂਟਲ ਡਿਪਲੌਇਮੈਂਟ ਵਿਚਕਾਰ ਫਰਕ ਸਿੱਖੋ

**ਸ਼ੁਰੂਆਤੀ ਬਿੰਦੂ:** Bash, Node.js 22, Git, azd sign-in, ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ ਪਰਮਿਸ਼ਨ ਵਾਲੀ Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ। ਨਵੇਂ ਡਾਇਰੈਕਟਰੀ ਵਿੱਚ ਚਲਾਓ; ਬਿਲਯੋਗ App Service/Cosmos DB ਸਰੋਤਾਂ ਦੀ ਉਮੀਦ ਕਰੋ। ਸਮਾਂ ਖੇਤਰ ਅਤੇ ਟੈਂਪਲੇਟ 'ਤੇ ਨਿਰਭਰ ਕਰਦਾ ਹੈ।

```bash
# Initial deployment
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo .
time azd up

# Record initial deployment time
echo "Full deployment: $(date)" > deployment-log.txt

# Make a code change
echo "// Updated $(date)" >> src/api/src/index.ts

# Deploy only code (fast)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# Compare times
cat deployment-log.txt

# Clean up
azd down --force --purge
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਦੋਵੇਂ ਕਮਾਂਡਾਂ ਲਈ ਲੰਮਾ ਸਮਾਂ ਦਰਜ ਕਰੋ (ਕੋਈ ਗਾਰੰਟੀ ਕੀਤੀ ਮਿਆਦ ਨਹੀਂ ਹੈ)
- [ ] ਦੋਵੇਂ ਕਮਾਂਡਾਂ ਸਫਲਤਾਪੂਰਵਕ ਮੁਕੰਮਲ ਹੋਣ
- [ ] API ਕਾਰਗਰ ਰਹੇ; ਕੇਵਲ ਟਿੱਪਣੀ ਸੋਧ ਸੁਝਾਇਤੀ UI ਬਦਲਾਅ ਨਹੀਂ ਹੈ
- [ ] ਢਾਂਚਾ `azd deploy` ਦੇ ਬਾਅਦ ਬਦਲਾ ਨਹੀਂ

**ਸਿੱਖਣ ਦਾ ਨਤੀਜਾ**: `azd deploy` ਢਾਂਚਾ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਛੱਡਦਾ ਹੈ। ਕਿਸੇ ਨਿਸ਼ਚਿਤ ਫੀਸਦ تیزی فرض ਕਰਨ ਦੀ ਜਗ੍ਹਾ ਮਾਪੇ ਗਏ ਸਮਿਆਂ ਦੀ ਤੁਲਨਾ ਕਰੋ।

### ਅਭਿਆਸ 2: ਕਸਟਮ ਡਿਪਲੌਇਮੈਂਟ ਹੂਕਸ (30 ਮਿੰਟ)
**ਲੱਛਾ**: ਪ੍ਰੀ ਅਤੇ ਪੋਸਟ-ਡਿਪਲੌਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਲਾਗੂ ਕਰੋ

**ਸ਼ੁਰੂਆਤੀ ਬਿੰਦੂ:** ਉਪਰ ਦਿੱਤੇ `deployment-practice` ਪ੍ਰोजੈਕਟ ਦੀ ਸ਼ੁਰੂਆਤ ਕੀਤੀ ਗਈ। ਜੇ ਤੁਸੀਂ ਇਹ ਸਾਫ ਕੀਤਾ ਹੈ, ਤਾਂ ਕੋਡ-ਕੇਵਲ ਡਿਪਲੌਇਮੈਂਟ ਟੈਸਟ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ `azd up` ਦੁਬਾਰਾ ਚਲਾਓ। ਹੇਠਾਂ ਦਿੱਤੀ ਪ੍ਰਮਾਣਿਕਤਾ API ਦੇ ਅਸਲ ਬਿਲਡ ਸਕ੍ਰਿਪਟ ਨੂੰ ਵਰਤਦੀ ਹੈ, ਨਾ ਕਿ ਮੌਜੂਦ ਨਾ ਰਹਿਣ ਵਾਲੀ ਰੂਟ `test:unit` ਸਕ੍ਰਿਪਟ ਨੂੰ। ਟੈਂਪਲੇਟ ਦੇ API ਟੈਸਟਾਂ ਲਈ ਸੰਰਚਿਤ ਡੇਟਾਬੇਸ ਐਕਸਸ ਦੀ ਲੋੜ ਹੈ; ਇਹ ਅਲੱਗ ਯੂਨਿਟ ਟੈਸਟ ਨਹੀਂ ਹਨ।

```bash
# Create pre-deploy validation script
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
set -e
echo "⚠️ Running pre-deployment checks..."

# Install API dependencies and check its actual lint/TypeScript build
npm --prefix src/api ci
if ! npm --prefix src/api run build; then
    echo "❌ Build validation failed! Aborting deployment."
    exit 1
fi

# Check for uncommitted changes
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# Create post-deploy smoke test
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
set -e
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')

if curl -f "$WEB_URL"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# Merge the following into the EXISTING azure.yaml using your editor.
# If hooks already exists, merge its children; never append a duplicate YAML key.
```

```yaml

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
```

```bash
# Test deployment with hooks
azd deploy
```

**ਸਫਲਤਾ ਮਾਪਦੰਡ:**
- [ ] ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਚੱਲਦਾ ਹੈ
- [ ] ਜੇ ਬਿਲਡ ਪ੍ਰਮਾਣਿਕਤਾ ਅਸਫਲ ਰਹੀ ਤਾਂ ਡਿਪਲੌਇਮੈਂਟ ਰੱਦ ਹੋ ਜਾਂਦਾ ਹੈ
- [ ] ਪੋਸਟ-ਡਿਪਲੌਇਮੈਂਟ ਸਮੋਕ ਟੈਸਟ ਸਿਹਤ ਦੀ ਪੁਸ਼ਟੀ ਕਰਦਾ ਹੈ
- [ ] ਹੂਕਸ ਸਹੀ ਕ੍ਰਮ ਵਿੱਚ ਚੱਲਦੇ ਹਨ

### ਅਭਿਆਸ 3: ਬਹੁ-ਪਰੀਵੇਸ਼ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀ (45 ਮਿੰਟ)
**ਲੱਛਾ**: ਮੰਚਿਤ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ ਲਾਗੂ ਕਰੋ (ਡੈਵ → ਸਟੇਜਿੰਗ → ਉਤਪਾਦਨ)

**ਸ਼ੁਰੂਆਤੀ ਬਿੰਦੂ:** ਉਸੇ ਸ਼ੁਰੂਆਤੀ ਤਿਆਰ ਕੀਤਾ ਹੋਇਆ todo ਪ੍ਰੋਜੈਕਟ ਨਾਲ `jq`। ਹੇਠਾਂ ਦਿੱਤੇ ਵਾਤਾਵਰਣ ਬਣਾਓ ਵਾਸਤਵਿਕ ਸਬਸਕ੍ਰਿਪਸ਼ਨ/ਟਿਕਾਣਾ ਮੁੱਲਾਂ ਨਾਲ (ਜਾਂ ਹਰ ਇੱਕ ਵਿੱਚ `AZURE_SUBSCRIPTION_ID`/`AZURE_LOCATION` ਸੈੱਟ ਕਰੋ) **ਬਿਨਾ ਕਿਸੇ ਪ੍ਰਾਂਪਟ ਦੇ ਵਰਕਫਲੋ ਨੂੰ ਕਾਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ।** ਇਹ जानਬूझ ਕੇ ਨਾ ਮਿਲਣ ਵਾਲੇ ਮੁੱਲਾਂ ਨੂੰ ਬਣਾਉਣ ਨਾਲੋਂ ਅਸਫਲ ਹੋ ਜਾਂਦਾ ਹੈ। ਸਿਰਫ਼ ਅਸਥਾਈ ਟ੍ਰੇਨਿੰਗ ਵਾਤਾਵਰਣ ਹੀ ਵਰਤੋ, ਅਸਲੀ ਉਤਪਾਦਨ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਨਹੀਂ।

```bash
# Create deployment script
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# Step 1: Deploy to dev
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 2: Deploy to staging
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Step 3: Manual approval for production
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f "$(azd show --output json | jq -er '.services.web.ingressUrl')"
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# Create environments
# Reuse existing dev if you completed Exercise 1; create unused environments
azd env select dev
azd env new staging --subscription "<subscription-id>" --location eastus2
azd env new production --subscription "<subscription-id>" --location eastus2

# Run staged deployment
./deploy-staged.sh

# After verification, delete each disposable deployment (review prompts)
azd down --environment dev
azd down --environment staging
azd down --environment production
```

**ਸਫਲਤਾ ਮਿਆਰ:**
- [ ] ਡੈਵ ਵਾਤਾਵਰਣ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੋਏ ਹੁੰਦਾ ਹੈ
- [ ] ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੋਏ ਹੁੰਦਾ ਹੈ
- [ ] ਉਤਪਾਦਨ ਲਈ ਹੱਥੋਂ ਮਨਜ਼ੂਰੀ ਲਾਜ਼ਮੀ ਹੈ
- [ ] ਸਾਰੇ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਚੰਗੇ ਹੈਲਥ ਚੈੱਕਸ ਕਾਰਗਰ ਹਨ
- [ ] ਜੇ ਲੋੜ ਹੋਵੇ ਤਾਂ ਰੋਲਬੈਕ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

### ਅਭਿਆਸ 4: ਰੋਲਬੈਕ ਰਣਨੀਤੀ (25 ਮਿੰਟ)
**ਮਕਸਦ**: Git ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਿਪਲੋਏਮੈਂਟ ਰੋਲਬੈਕ ਨੂੰ ਲਾਗੂ ਅਤੇ ਟੈਸਟ ਕਰੋ

**ਸ਼ੁਰੂਆਤੀ ਬਿੰਦੂ:** todo ਟੈਮਪਲੇਟ ਦੀ ਇਕ ਅਲੱਗ ਟ੍ਰੇਨਿੰਗ ਚੈਕਆਉਟ ਜਿਸ ਵਿੱਚ ਸਾਰੇ ਬੇਸਲਾਈਨ ਸਰੋਤ ਕਮੇਟ ਕੀਤੇ ਹੋਏ ਹਨ, ਇੱਕ ਸਾਫ Git ਵਰਕਿੰਗ ਟਰੀ, ਅਤੇ ਇੱਕ ਅਸਥਾਈ ਤਿਆਰ ਕੀਤਾ ਵਾਤਾਵਰਣ। ਕਿਸੇ ਵੀ ਅਸਲੀ ਉਤਪਾਦਨ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਜਾਨਬੂਝ ਕੇ ਵਿਫ਼ਲਤਾਵਾਂ ਨਾ ਪੈਦਾ ਕਰੋ। ਹੇਠਾਂ `APP_VERSION` ਸਿਰਫ ਲੇਖਾ-ਜੋਖਾ ਹੈ ਜਦੋਂ ਤਕ ਤੁਸੀਂ ਇਸਨੂੰ ਖਾਸ ਤੌਰ 'ਤੇ ਐਪ ਵਿੱਚ ਨਹੀਂ ਜੋੜਦੇ।

```bash
# Deploy v1
azd env set APP_VERSION "1.0.0"
azd up

# Save v1 commit hash
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# Deploy v2 with breaking change
echo "throw new Error('Intentional break');" >> src/api/src/index.ts
git add src/api/src/index.ts
git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
DEPLOY_FAILED=false
azd deploy api || DEPLOY_FAILED=true

# Detect failure and rollback
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
if [ "$DEPLOY_FAILED" = true ] || ! curl -f "$API_URL/lists"; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # Rollback using git
    git revert HEAD --no-edit
    
    # Rollback environment
    azd env set APP_VERSION "1.0.0"
    
    # Redeploy v1
    azd deploy api
    curl --fail "$API_URL/lists"
    
    echo "✅ Rolled back to v1.0.0"
fi

# Clean up the disposable deployment when finished
azd down
```

**ਸਫਲਤਾ ਮਿਆਰ:**
- [ ] ਡਿਪਲੋਏਮੈਂਟ ਦੀਆਂ ਵਿਫ਼ਲਤਾਵਾਂ ਦੀ ਪਹਿਚਾਣ ਕਰ ਸਕਦਾ ਹੈ
- [ ] ਰੋਲਬੈਕ ਸਕ੍ਰਿਪਟ ਆਪੋ-ਆਪਣੇ ਚੱਲਦਾ ਹੈ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਮੁੜ ਕਾਰਗਰ ਹਾਲਤ ਵਿਚ ਆ ਜਾਂਦੀ ਹੈ
- [ ] ਰੋਲਬੈਕ ਤੋਂ ਬਾਅਦ ਹੈਲਥ ਚੈੱਕ ਪਾਸ ਹੁੰਦੇ ਹਨ

## 📊 ਡਿਪਲੋਏਮੈਂਟ ਮੀਟਰਿਕਸ ਟ੍ਰੈਕਿੰਗ

### ਆਪਣੇ ਡਿਪਲੋਏਮੈਂਟ ਦੇ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ

```bash
# Create deployment metrics script
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"
DEPLOY_STATUS=$?

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# Log to file
echo "$(date +%Y-%m-%dT%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
exit "$DEPLOY_STATUS"
EOF

chmod +x track-deployment.sh

# Use it
./track-deployment.sh
```

**ਆਪਣੇ ਮੀਟਰਿਕਸ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ:**
```bash
# View deployment history
cat deployment-metrics.csv

# Calculate average deployment time
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ਵਾਧੂ ਸਰੋਤ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md)
- **ਅਗਲਾ ਪਾਠ**: [ਸੰਸਾਧਨਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->