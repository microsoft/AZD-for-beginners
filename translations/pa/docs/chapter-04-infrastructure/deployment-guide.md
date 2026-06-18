# ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ - AZD ਡਿਪਲੌਇਮੈਂਟ ਵਿੱਚ ਮਾਹਰ ਬਣੋ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹੋਮ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 4 - Infrastructure as Code & Deployment
- **⬅️ ਪਿਛਲਾ ਅਧਿਆਇ**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)
- **➡️ ਅਗਲਾ**: [Provisioning Resources](provisioning.md)
- **🧩 ਇਸ ਅਧਿਆਇ ਵਿੱਚ ਵੀ**: [Authoring Your Own Template](custom-templates.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [Chapter 5: Multi-Agent AI Solutions](../../examples/retail-scenario.md)

## ਪਰਿਚਯ

ਇਹ ਵਿਸਤ੍ਰਤ ਗਾਈਡ ਤੁਹਾਨੂੰ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਬਾਰੇ ਸਭ ਕੁਝ ਸਿਖਾਉਂਦੀ ਹੈ, ਸਾਧਾਰਣ ਇਕ-ਕਮਾਂਡ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਲੈ ਕੇ ਕਸਟਮ ਹੋਕਸ, ਵੱਖ-ਵੱਖ ਵਾਤਾਵਰਣ ਅਤੇ CI/CD ਏਕੀਕਰਨ ਵਾਲੇ ਉੱਚ-ਪੱਧਰੀ ਪ੍ਰੋਡਕਸ਼ਨ ਸਿਨਾਰਿਯੋ ਤੱਕ। ਪ੍ਰਯੋਗਿਕ ਉਦਾਹਰਨਾਂ ਅਤੇ ਸਰਵੋਤਮ ਅਭਿਆਸਾਂ ਨਾਲ ਪੂਰੇ ਡਿਪਲੌਇਮੈਂਟ ਲਾਈਫਸਾਈਕਲ ਵਿੱਚ ਨਿਪੁੰਨ ਬਣੋ।

## ਸਿੱਖਣ ਦੇ ਲਕੜੇ

ਇਸ ਗਾਈਡ ਨੂੰ ਪੂਰਾ ਕਰਕੇ ਤੁਸੀਂ:
- ਸਾਰੇ Azure Developer CLI ਡਿਪਲੌਇਮੈਂਟ ਕਮਾਂਡਾਂ ਅਤੇ ਵਰਕਫਲੋਜ਼ ਵਿੱਚ ਨਿਪੁੰਨ ਹੋ ਜਾਵੋਗੇ
- ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਤੋਂ ਮਾਨੀਟਰਿੰਗ ਤੱਕ ਪੂਰੇ ਡਿਪਲੌਇਮੈਂਟ ਲਾਈਫਸਾਈਕਲ ਨੂੰ ਸਮਝੋਗੇ
- ਪ੍ਰੀ ਅਤੇ ਪੋਸਟ-ਡਿਪਲੌਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਲਈ ਕਸਟਮ ਡਿਪਲੌਇਮੈਂਟ ਹੋਕਸ ਲਾਗੂ ਕਰੋਗੇ
- ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਤ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਕਈ ਵਾਤਾਵਰਣ ਸੈਟਅਪ ਕਰੋਗੇ
- ਬਲੂ-ਗ੍ਰੀਨ ਅਤੇ ਕੰਮੇਰੀ ਵਰਗੀਆਂ ਉੱਚ-ਪੱਧਰੀ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋਗੇ
- azd ਡਿਪਲੌਇਮੈਂਟਾਂ ਨੂੰ CI/CD ਪਾਈਪਲਾਈਨਾਂ ਅਤੇ DevOps ਵਰਕਫਲੋਜ਼ ਨਾਲ ਏਕੀਕ੍ਰਿਤ ਕਰੋਗੇ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਸਾਰੇ azd ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਚਲਾਉਣਾ ਅਤੇ ਸਮੱਸਿਆ-ਮੁਕਤੀ ਕਰਨਾ
- ਹੋਕਸ ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕਸਟਮ ਡਿਪਲੌਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਡਿਜ਼ਾਈਨ ਅਤੇ ਲਾਗੂ ਕਰਨਾ
- ਉਚਿਤ ਸੁਰੱਖਿਆ ਅਤੇ ਮਾਨੀਟਰਿੰਗ ਨਾਲ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਡਿਪਲੌਇਮੈਂਟਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰਨਾ
- ਜਟਿਲ ਬਹੁ-ਵਾਤਾਵਰਣ ਡਿਪਲੌਇਮੈਂਟ سینਾਰਿਯੋਜ਼ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਨਾ
- ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਅਪਟੀਮਾਈਜ਼ ਕਰਨਾ ਅਤੇ ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰਨਾ
- azd ਡਿਪਲੌਇਮੈਂਟਾਂ ਨੂੰ ਐੰਟਰਪ੍ਰਾਈਜ਼ DevOps ਅਭਿਆਸਾਂ ਵਿੱਚ ਏਕੀਕ੍ਰਿਤ ਕਰਨਾ

## ਡਿਪਲੌਇਮੈਂਟ ਓਵਰਵਿਊ

Azure Developer CLI ਕਈ ਡਿਪਲੌਇਮੈਂਟ ਕਮਾਂਡਾਂ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:
- `azd up` - ਪੂਰਾ ਵਰਕਫਲੋ (provision + deploy)
- `azd provision` - ਸਿਰਫ Azure ਸਰੋਤ ਬਣਾਉਣ/ਅਪਡੇਟ ਕਰਨ ਲਈ
- `azd deploy` - ਸਿਰਫ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੌਇ ਕਰਨ ਲਈ
- `azd package` - ਐਪਲੀਕੇਸ਼ਨਾਂ ਦਾ ਬਿਲਡ ਅਤੇ ਪੈਕੇਜ ਬਣਾਉਣ ਲਈ

## ਬੇਸਿਕ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋਜ਼

### ਪੂਰਾ ਡਿਪਲੌਇਮੈਂਟ (azd up)
ਨਵੀਂ ਪ੍ਰੋਜੈਕਟ ਲਈ ਸਭ ਤੋਂ ਆਮ ਵਰਕਫਲੋ:
```bash
# ਸਭ ਕੁਝ ਸ਼ੁਰੂ ਤੋਂ ਤੈਨਾਤ ਕਰੋ
azd up

# ਖਾਸ ਵਾਤਾਵਰਣ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --environment production

# ਕਸਟਮ ਪੈਰਾਮੀਟਰਾਂ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ਸਿਰਫ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਡਿਪਲੌਇਮੈਂਟ
ਜਦੋਂ ਤੁਹਾਨੂੰ ਸਿਰਫ Azure ਸਰੋਤਾਂ ਨੂੰ ਅਪਡੇਟ ਕਰਨ ਦੀ ਲੋੜ ਹੋਵੇ:
```bash
# ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਦੀ ਸਥਾਪਨਾ/ਅਪਡੇਟ
azd provision

# ਬਦਲਾਅ ਨੂੰ ਪਹਿਲਾਂ ਦੇਖਣ ਲਈ ਡ੍ਰਾਈ-ਰਨ ਨਾਲ ਸਥਾਪਨਾ
azd provision --preview

# ਖਾਸ ਸੇਵਾਵਾਂ ਦੀ ਸਥਾਪਨਾ
azd provision --service database
```

### ਸਿਰਫ ਕੋਡ ਡਿਪਲੌਇਮੈਂਟ
ਤੁਰੰਤ ਐਪਲੀਕੇਸ਼ਨ ਅਪਡੇਟਸ ਲਈ:
```bash
# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਉਮੀਦ ਕੀਤਾ ਨਤੀਜਾ:
# ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕੀਤੀਆਂ ਜਾ ਰਹੀਆਂ ਹਨ (azd deploy)
# - web: ਤੈਨਾਤ ਕੀਤਾ ਜਾ ਰਿਹਾ... ਹੋ ਗਿਆ
# - api: ਤੈਨਾਤ ਕੀਤਾ ਜਾ ਰਿਹਾ... ਹੋ ਗਿਆ
# SUCCESS: ਤੁਹਾਡੀ ਤੈਨਾਤ 2 ਮਿੰਟ 15 ਸਕਿੰਟ ਵਿੱਚ ਮੁਕੰਮਲ ਹੋ ਗਈ

# ਖਾਸ ਸੇਵਾ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਕਸਟਮ ਬਿਲਡ ਆਰਗੁਮੈਂਟਸ ਨਾਲ ਤੈਨਾਤ ਕਰੋ
azd deploy --service api --build-arg NODE_ENV=production

# ਤੈਨਾਤ ਦੀ ਜਾਂਚ ਕਰੋ
azd show --output json | jq '.services'
```

### ✅ ਡਿਪਲੌਇਮੈਂਟ ਵੇਰੀਫਿਕੇਸ਼ਨ

ਕਿਸੇ ਵੀ ਡਿਪਲੌਇਮੈਂਟ ਦੇ ਬਾਅਦ, ਸਫਲਤਾ ਦੀ ਜਾਂਚ ਕਰੋ:

```bash
# ਸਾਰੀਆਂ ਸੇਵਾਵਾਂ ਚਲ ਰਹੀਆਂ ਹਨ ਜਾਂ ਨਹੀਂ ਚੈੱਕ ਕਰੋ
azd show

# ਹੈਲਥ ਐਂਡਪੋਇੰਟਸ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# ਗਲਤੀਆਂ ਲਈ ਨਿਗਰਾਨੀ ਕਰੋ (ਡਿਫੌਲਟ ਤੌਰ 'ਤੇ ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਖੁਲਦਾ ਹੈ)
azd monitor --logs
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- ✅ ਸਾਰੇ ਸਰਵਿਸ "Running" ਸਥਿਤੀ ਦਿਖਾਉਂਦੇ ਹਨ
- ✅ ਹੈਲਥ ਐਂਡਪॉਇੰਟ HTTP 200 ਵਾਪਸ ਕਰਦੇ ਹਨ
- ✅ ਆਖਰੀ 5 ਮਿੰਟ ਵਿੱਚ ਕੋਈ ਐਰਰ ਲੌਗ ਨਹੀਂ
- ✅ ਐਪਲੀਕੇਸ਼ਨ ਟੈਸਟ ਰਿਕਵੇਸٹس ਦਾ ਜਵਾਬ ਦਿੰਦਾ ਹੈ

## 🏗️ ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਨੂੰ ਸਮਝਣਾ

### ਹੋਕਸ ਨਵੇਂ ਹਨ? ਇਥੇ ਸ਼ੁਰੂ ਕਰੋ

ਇੱਕ **hook** ਉਹ ਕਮਾਂਡ ਹੈ ਜੋ azd ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆ ਦੇ ਕਿਸੇ ਨਿਰਧਾਰਿਤ ਸਮੇਂ 'ਤੇ ਆਪਣੇ-ਆਪ ਹੀ ਚਲਾਉਂਦਾ ਹੈ—provisioning ਤੋਂ ਪਹਿਲਾਂ ਜਾਂ ਬਾਅਦ, ਅਤੇ ਤੁਹਾਡੇ ਕੋਡ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਜਾਂ ਬਾਅਦ। ਇਹ ਤੁਹਾਨੂੰ ਉਹ ਛੋਟੇ-ਮੋਟੇ ਕੰਮ ਆਟੋਮੇਟ ਕਰਨ ਦੀ ਆਜਾਦੀ ਦਿੰਦੇ ਹਨ ਜੋ ਹਮੇਸ਼ਾ ਡਿਪਲੌਇਮੈਂਟ ਦੇ ਨਾਲ ਹੋਂਦੇ ਹਨ: ਡੇਟਾਬੇਸ ਸਿੱਡਿੰਗ, ਮਾਇਗ੍ਰੇਸ਼ਨ ਚਲਾਉਣਾ, ਐਸੈਟ ਬਿਲਡ ਕਰਨਾ, ਜਾਂ ਲਾਈਵ ਐਪ ਨੂੰ ਸਮੋਕ-ਟੈਸਟ ਕਰਨਾ।

| Hook | Runs… | Common use |
|------|-------|------------|
| `preprovision` | Resources ਬਣਨ ਤੋਂ ਪਹਿਲਾਂ ਚਲਦਾ ਹੈ | ਪ੍ਰੀਰਿਕਵਾਇਜ਼ਟਾਂ ਦੀ ਜਾਂਚ ਕਰੋ, ਰਜਿਸਟਰੀ ਵਿੱਚ ਲਾਗਿਨ ਕਰੋ |
| `postprovision` | ਸਰੋਤ ਬਣਨ ਤੋਂ ਬਾਅਦ ਚਲਦਾ ਹੈ | ਸਰੋਤਾਂ ਨੂੰ ਕਨਫਿਗਰ ਕਰੋ, ਡੇਟਾਬੇਸ ਸੈਟਅਪ ਕਰੋ |
| `predeploy` | ਕੋਡ ਡਿਪਲੌਇ ਹੋਣ ਤੋਂ ਪਹਿਲਾਂ ਚਲਦਾ ਹੈ | ਫਰੰਟ-ਐਂਡ ਐਸੈਟ ਬਣਾਓ, ਯੂਨਿਟ ਟੈਸਟ ਚਲਾਓ |
| `postdeploy` | ਕੋਡ ਲਾਈਵ ਹੋਣ ਤੋਂ ਬਾਅਦ ਚਲਦਾ ਹੈ | DB ਮਾਇਗ੍ਰੇਸ਼ਨ ਚਲਾਓ, ਐਂਡਪੌਇੰਟ ਦਾ ਸਮੋਕ-ਟੈਸਟ ਕਰੋ |

Hooks ਤੁਹਾਡੇ `azure.yaml` ਵਿੱਚ ਰਹਿੰਦੇ ਹਨ। ਇੱਥੇ ਸਭ ਤੋਂ ਛੋਟਾ ਉਦਾਹਰਨ ਦਿੱਤਾ ਗਿਆ ਹੈ—ਇਹ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਬਾਅਦ ਸਿਰਫ ਇੱਕ ਸੁਨੇਹਾ ਪ੍ਰਿੰਟ ਕਰਦਾ ਹੈ:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

ਇਸੇ ਨਾਲ—ਅਗਲੀ ਵਾਰ ਜਦੋਂ ਤੁਸੀਂ `azd up` ਚਲਾਵੋਗੇ, ਸੁਨੇਹਾ ਆਪਣੇ-ਆਪ ਪ੍ਰਿੰਟ ਹੋ ਜਾਵੇਗਾ। ਤੁਸੀਂ ਇੱਕ ਹੋਕ ਨੂੰ ਅਕੇਲਾ ਵੀ ਚਲਾ ਸਕਦੇ ਹੋ, ਬਿਨਾਂ ਪੂਰੇ ਡਿਪਲੌਇ ਦੇ, ਜੋ ਕਿ ਟੈਸਟਿੰਗ ਲਈ ਵਧੀਆ ਹੈ:

```bash
azd hooks run postdeploy
```

ਹੇਠਾਂ ਦਿੱਤੇ ਫੇਜ਼ ਅਸਲ-ਦੁਨੀਆ ਦੇ ਹੋਕਸ (ਮਾਈਗ੍ਰੇਸ਼ਨ, ਟੈਸਟ, ਵੈਲਿਡੇਸ਼ਨ) ਹਰ ਸਟੇਜ ਲਈ ਦਿਖਾਉਂਦੇ ਹਨ।

### ਫੇਜ਼ 1: ਪ੍ਰੀ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੋਕਸ
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

### ਫੇਜ਼ 2: ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ
- ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਟੈਂਪਲੇਟ (Bicep/Terraform) ਪੜ੍ਹਦਾ ਹੈ
- Azure ਸਰੋਤ ਬਣਾਉਂਦਾ ਜਾਂ ਅਪਡੇਟ ਕਰਦਾ ਹੈ
- ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਕਨਫਿਗਰ ਕਰਦਾ ਹੈ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਲੌਗਿੰਗ ਸੈਟਅਪ ਕਰਦਾ ਹੈ

### ਫੇਜ਼ 3: ਪੋਸਟ-ਪ੍ਰੋਵਿਜ਼ਨ ਹੋਕਸ
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
- ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਬਿਲਡ ਕਰਦਾ ਹੈ
- ਡਿਪਲੌਇਮੈਂਟ ਆਰਟੀਫੈਕਟ ਬਣਾਉਂਦਾ ਹੈ
- ਲਕਸ਼ਿਤ ਪਲੇਟਫਾਰਮ ਲਈ ਪੈਕੇਜ ਕਰਦਾ ਹੈ (ਕੰਟੇਨਰ, ZIP ਫਾਇਲ ਆਦਿ)

### ਫੇਜ਼ 5: ਪ੍ਰੀ-ਡਿਪਲੌਇ ਹੋਕਸ
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

### ਫੇਜ਼ 6: ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ
- ਪੈਕੇਜ ਕੀਤੇ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ Azure ਸਰਵਿਸਜ਼ ਤੇ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ
- ਕਨਫਿਗਰੇਸ਼ਨ ਸੈਟਿੰਗਜ਼ ਅਪਡੇਟ ਕਰਦਾ ਹੈ
- ਸਰਵਿਸਜ਼ ਨੂੰ ਸਟਾਰਟ/ਰੀਸਟਾਰਟ ਕਰਦਾ ਹੈ

### ਫੇਜ਼ 7: ਪੋਸਟ-ਡਿਪਲੌਇ ਹੋਕਸ
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### ਹੋਕ ਐਰਰਸ ਨੂੰ ਹੈਂਡਲ ਕਰਨਾ

ਮੂਲ ਰੂਪ ਵਿੱਚ, **ਜੇਕਰ ਕੋਈ ਹੋਕ ਕਮਾਂਡ ਨਾਨ-ਜ਼ੀਰੋ ਕੋਡ ਨਾਲ ਐਕਜ਼ਿਟ ਕਰਦੀ ਹੈ ਤਾਂ azd ਪੂਰਾ ਆਪਰੇਸ਼ਨ ਰੋਕ ਦਿੰਦਾ ਹੈ।** ਇਹ ਆਮ ਤੌਰ 'ਤੇ ਚਾਹੀਦਾ ਹੀ ਹੁੰਦਾ ਹੈ—ਫੇਲ੍ਹ ਹੋਈ ਮਾਈਗ੍ਰੇਸ਼ਨ ਡਿਪਲੌਇ ਨੂੰ ਰੋਕ ਦੇਣੀ ਚਾਹੀਦੀ ਹੈ, ਇਕ ਖਰਾਬ ਐਪ ਸ਼ਿਪ ਨਹੀਂ ਹੋਣਾ ਚਾਹੀਦਾ। ਪਰ ਇਸਦਾ ਮਤਲਬ ਹੈ ਕਿ ਹੋਕਸ ਨੂੰ ਧਿਆਨ ਨਾਲ ਲਿਖਣਾ ਲਾਜ਼ਮੀ ਹੈ।

**1. ਫੇਲ੍ਹ ਹੋਣਾ ਤੇਜ ਅਤੇ ਜਾਨਬੂਝ ਕੇ ਬਣਾਓ।** ਇੱਕ ਹੋਕ ਫੇਲ੍ਹ ਹੁੰਦਾ ਹੈ ਜਦੋਂ ਉਸ ਦੀ آخਰੀ ਕਮਾਂਡ ਨਾਨ-ਜ਼ੀਰੋ ਐਕਜ਼ਿਟ ਕੋਡ ਵਾਪਸ ਕਰਦੀ ਹੈ। ਷ੈੱਲ ਸਕ੍ਰਿਪਟਾਂ ਵਿੱਚ, `set -e` ਜੋੜੋ ਤਾਂ ਜੋ ਹੋਕ ਪਹਿਲੀ ਫੇਲ੍ਹ ਹੋਈ ਕਮਾਂਡ 'ਤੇ ਹੀ ਰੁਕ ਜਾਵੇ ਬਿਨਾਂ ਚੁੱਪਚਾਪ ਜਾਰੀ ਰਹਿਣ ਦੇ:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. ਇੱਕ ਹੋਕ ਨੂੰ azd ਰੋਕਣ ਬਿਨਾਂ ਫੇਲ੍ਹ ਹੋਣ ਦੀ ਆਗਿਆ ਦਿਓ।** ਗੈਰ-ਜਰੂਰੀ ਕਦਮਾਂ (ਇੱਕ ਵਿਵਿਕਤ ਕੈਸ਼ ਵਾਰਮ-ਅਪ, ਇੱਕ ਬੈਸਟ-ਐਫੋਰਟ ਨੋਟੀਫਿਕੇਸ਼ਨ) ਲਈ, `continueOnError: true` ਸੈੱਟ ਕਰੋ। azd ਫੇਲ੍ਹ ਨੂੰ ਲੌਗ ਕਰਦਾ ਹੈ ਪਰ ਜਾਰੀ ਰੱਖਦਾ ਹੈ:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. ਪੂਰੇ ਰਨ ਤੋਂ ਪਹਿਲਾਂ ਹੋਕਸ ਨੂੰ ਅਲੱਗ-ਥੱਲਗ ਟੈਸਟ ਕਰੋ।** ਤੁਹਾਨੂੰ ਡੀਬੱਗ ਕਰਨ ਲਈ `azd up` ਚਲਾਉਣ ਦੀ ਲੋੜ ਨਹੀਂ—ਇਸਨੂੰ ਅਕੇਲਾ ਚਲਾਓ ਅਤੇ ਤੇਜ਼ੀ ਨਾਲ ਇਟਰਟ ਕਰੋ:

```bash
azd hooks run predeploy          # ਸਿਰਫ਼ ਪ੍ਰੀਡਿਪਲੋਏ ਹੂਕ ਚਲਾਉਂਦਾ ਹੈ
azd hooks run postdeploy --service api
```

**4. OS-ਨਿਰਧਾਰਤ ਸ਼ੈੱਲਾਂ ਲਈ ਧਿਆਨ ਦਿਓ।** `shell: pwsh` ਵਰਤਣ ਵਾਲਾ ਹੋਕ ਉਸ ਮਸ਼ੀਨ 'ਤੇ PowerShell ਮੌਜੂਦ ਹੋਣਾ ਲਾਜ਼ਮੀ ਹੈ ਜੋ ਇਸਨੂੰ ਚਲਾ ਰਹੀ ਹੈ (CI ਏਜੰਟ ਸਮੇਤ)। ਸਭ ਤੋਂ ਵਿਆਪਕ ਪੋਰਟੇਬਿਲਟੀ ਲਈ `shell: sh` ਵਰਤੋ, ਜਾਂ ਦੋਹਾਂ `windows` ਅਤੇ `posix` ਵਰਗੀਆਂ ਰੂਪਾਂ ਦਿਓ:

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

> **ਡੀਬੱਗਿੰਗ ਸੁਝਾਅ:** ਕਿਸੇ ਵੀ azd ਕਮਾਂਡ ਨੂੰ `--debug` ਨਾਲ ਚਲਾਓ ਤਾਂ ਜੋ ਹੋਕ ਕਮਾਂਡ ਲਾਈਨ ਅਤੇ ਉਸਦਾ ਪੂਰਾ ਆਉਟਪੁੱਟ ਵੇਖ ਸਕੋ—ਜਦੋਂ ਕੋਈ ਹੋਕ ਲੋਕਲ ਤੇ ਠੀਕ ਕੰਮ ਕਰਦਾ ਹੈ ਪਰ CI ਵਿੱਚ ਫੇਲ੍ਹ ਹੁੰਦਾ ਹੈ ਤਾਂ ਇਹ ਅਮੁੱਲ ਹੈ।

## 🎛️ ਡਿਪਲੌਇਮੈਂਟ ਕਨਫਿਗਰੇਸ਼ਨ

### ਸਰਵਿਸ-ਨਿਰਧਾਰਤ ਡਿਪਲੌਇਮੈਂਟ ਸੈਟਿੰਗਜ਼
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਤ ਕਨਫਿਗਰੇਸ਼ਨ
```bash
# ਡਿਵੈਲਪਮੈਂਟ ਵਾਤਾਵਰਣ
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# ਸਟੇਜਿੰਗ ਵਾਤਾਵਰਣ
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ਉਤਪਾਦਨ ਵਾਤਾਵਰਣ
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 ਉੱਚ-ਪੱਧਰੀ ਡਿਪਲੌਇਮੈਂਟ ਸਿਨਾਰਿਯੋ

### ਬਹੁ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨ
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

### ਬਲੂ-ਗ੍ਰੀਨ ਡਿਪਲੌਇਮੈਂਟ
```bash
# ਨੀਲਾ ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new production-blue
azd up --environment production-blue

# ਨੀਲੇ ਵਾਤਾਵਰਣ ਦੀ ਜਾਂਚ ਕਰੋ
./scripts/test-environment.sh production-blue

# ਟ੍ਰੈਫਿਕ ਨੂੰ ਨੀਲੇ ਵਾਤਾਵਰਣ ਵੱਲ ਬਦਲੋ (ਮੈਨੂਅਲ DNS/ਲੋਡ ਬੈਲੰਸਰ ਅਪਡੇਟ)
./scripts/switch-traffic.sh production-blue

# ਹਰੇ ਵਾਤਾਵਰਣ ਨੂੰ ਸਾਫ਼ ਕਰੋ
azd env select production-green
azd down --force
```

### ਕੈਨਰੀ ਡਿਪਲੌਇਮੈਂਟ
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### ਸਟੇਜਡ ਡਿਪਲੌਇਮੈਂਟ
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 ਕੰਟੇਨਰ ਡਿਪਲੌਇਮੈਂਟ

### ਕੰਟੇਨਰ ਐਪ ਡਿਪਲੌਇਮੈਂਟ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### ਮਲਟੀ-ਸਟੇਜ Dockerfile ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ ਪ੍ਰਦਰਸ਼ਨ ਅਪਟਿਮਾਈਜ਼ੇਸ਼ਨ

### ਸਰਵਿਸ-ਨਿਰਧਾਰਤ ਡਿਪਲੌਇਮੈਂਟ
```bash
# ਤੇਜ਼ ਇਟਰੇਸ਼ਨ ਲਈ ਇੱਕ ਵਿਸ਼ੇਸ਼ ਸੇਵਾ ਤੈਨਾਤ ਕਰੋ
azd deploy --service web
azd deploy --service api

# ਸਭ ਸੇਵਾਵਾਂ ਤੈਨਾਤ ਕਰੋ
azd deploy
```

### ਬਿਲਡ ਕੈਸ਼ਿੰਗ
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਕੋਡ ਡਿਪਲੌਇਮੈਂਟ
```bash
# ਸਿਰਫ਼ ਕੋਡ ਬਦਲਾਵਾਂ ਲਈ azd deploy (azd up ਨਹੀਂ) ਵਰਤੋਂ ਕਰੋ
# ਇਹ ਇਨਫਰਾਸਟਰੱਕਚਰ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨੂੰ ਛੱਡ ਦਿੰਦਾ ਹੈ ਅਤੇ ਬਹੁਤ ਤੇਜ਼ ਹੈ
azd deploy

# ਸਭ ਤੋਂ ਤੇਜ਼ ਦੁਹਰਾਈ ਲਈ ਕਿਸੇ ਖਾਸ ਸੇਵਾ ਨੂੰ ਡਿਪਲੋਇ ਕਰੋ
azd deploy --service api
```

## 🔍 ਡਿਪਲੌਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ

### ਰੀਅਲ-ਟਾਈਮ ਡਿਪਲੌਇਮੈਂਟ ਮਾਨੀਟਰਿੰਗ
```bash
# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਰੀਅਲ-ਟਾਈਮ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --live

# ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਲੌਗ ਵੇਖੋ
azd monitor --logs

# ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਜਾਂਚੋ
azd show
```

### ਹੈਲਥ ਚੈਕਸ
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### ਪੋਸਟ-ਡਿਪਲੌਇਮੈਂਟ ਵੈਲਿਡੇਸ਼ਨ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਸਿਹਤ ਦੀ ਜਾਂਚ ਕਰੋ
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 ਸੁਰੱਖਿਆ ਸੰਬੰਧੀ ਗੱਲਾਂ

### ਸੀਕ੍ਰੇਟਸ ਮੈਨੇਜ਼ਮੈਂਟ
```bash
# ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਸੁਰੱਖਿਅਤ ਤਰੀਕੇ ਨਾਲ ਸਟੋਰ ਕਰੋ
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml ਵਿੱਚ ਗੁਪਤ ਜਾਣਕਾਰੀਆਂ ਦਾ ਹਵਾਲਾ ਦਿਓ
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### ਨੈਟਵਰਕ ਸੁਰੱਖਿਆ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### ਆਈਡੈਂਟੀਟੀ ਅਤੇ ਐਕਸੈਸ ਮੈਨੇਜਮੈਂਟ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 ਰੋਲਬੈਕ ਰਣਨੀਤੀਆਂ

### ਤਤਕਾਲ ਰੋਲਬੈਕ
```bash
# AZD ਵਿੱਚ ਅੰਦਰੂਨੀ ਰੋਲਬੈਕ ਨਹੀਂ ਹੈ। ਸੁਝਾਏ ਗਏ ਤਰੀਕੇ:

# Option 1: Git ਤੋਂ ਮੁੜ ਡਿਪਲੋਇ ਕਰੋ (ਸਿਫਾਰਸ਼ ਕੀਤੀ)
git revert HEAD  # ਸਮੱਸਿਆਜਨਕ ਕਮਿੱਟ ਨੂੰ ਵਾਪਸ ਕਰੋ
git push
azd deploy

# Option 2: ਖਾਸ ਕਮਿੱਟ ਨੂੰ ਮੁੜ ਡਿਪਲੋਇ ਕਰੋ
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਰੋਲਬੈਕ
```bash
# ਲਾਗੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਢਾਂਚੇ ਦੇ ਬਦਲਾਵਾਂ ਦੀ ਪੂਰਵ-ਸਮੀਖਿਆ
azd provision --preview

# ਢਾਂਚਾ ਰੋਲਬੈਕ ਲਈ ਵਰਜ਼ਨ ਕੰਟਰੋਲ ਦੀ ਵਰਤੋਂ ਕਰੋ:
git revert HEAD  # ਢਾਂਚੇ ਵਿੱਚ ਕੀਤੇ ਬਦਲਾਵਾਂ ਨੂੰ ਵਾਪਸ ਕਰੋ
azd provision    # ਪਿਛਲੇ ਢਾਂਚੇ ਦੀ ਸਥਿਤੀ ਲਾਗੂ ਕਰੋ
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

## 📊 ਡਿਪਲੌਇਮੈਂਟ ਮੈਟ੍ਰਿਕਸ

### ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ
```bash
# ਮੌਜੂਦਾ ਡਿਪਲੋਇਮੈਂਟ ਦੀ ਸਥਿਤੀ ਵੇਖੋ
azd show

# Application Insights ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
azd monitor --overview

# ਲਾਈਵ ਮੈਟਰਿਕਸ ਵੇਖੋ
azd monitor --live
```

### ਕਸਟਮ ਮੈਟ੍ਰਿਕਸ ਕਲੇਕਸ਼ਨ
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

## 🎯 ਸਰਵੋਤਮ ਅਭਿਆਸ

### 1. ਵਾਤਾਵਰਣ ਸੰਗਤਤਾ
```bash
# ਇੱਕੋ ਜਿਹਾ ਨਾਂ ਵਰਤੋ
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# ਵਾਤਾਵਰਣਾਂ ਦੇ ਵਿਚਕਾਰ ਸਮਾਨਤਾ ਬਰਕਰਾਰ ਰੱਖੋ
./scripts/sync-environments.sh
```

### 2. ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਵੈਲਿਡੇਸ਼ਨ
```bash
# ਤੈਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਬੁਨਿਆਦੀ ਢਾਂਚੇ ਵਿੱਚ ਹੋਣ ਵਾਲੇ ਬਦਲਾਅ ਦੀ ਪੂਰਵ-ਸਮੀਖਿਆ ਕਰੋ
azd provision --preview

# ARM/Bicep ਲਈ ਲਿੰਟਿੰਗ ਵਰਤੋ
az bicep lint --file infra/main.bicep

# Bicep ਸਿੰਟੈਕਸ ਦੀ ਜਾਂਚ ਕਰੋ
az bicep build --file infra/main.bicep
```

### 3. ਟੈਸਟਿੰਗ ਏਕੀਕਰਨ
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

### 4. ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ ਅਤੇ ਲੌਗਿੰਗ
```bash
# ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਕਿਰਿਆਵਾਂ ਦਾ ਦਸਤਾਵੇਜ਼ ਬਣਾਓ
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## ਅਗਲੇ ਕਦਮ

- [Provisioning Resources](provisioning.md) - Infrastructure ਪ੍ਰਬੰਧਨ ਵਿੱਚ ਡੀਪ ਡਾਈਵ
- [Pre-Deployment Planning](../chapter-06-pre-deployment/capacity-planning.md) - ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀ ਦੀ ਯੋਜਨਾ ਬਣਾਓ
- [Common Issues](../chapter-07-troubleshooting/common-issues.md) - ਡਿਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ
- [Best Practices](../chapter-07-troubleshooting/debugging.md) - ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ

## 🎯 ਹੈਂਡ-ਆਨ ਡਿਪਲੌਇਮੈਂਟ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਇੰਕ੍ਰਿਮੈਂਟਲ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ (20 ਮਿੰਟ)
**ਲਕੜਾ**: ਪੂਰੇ ਅਤੇ ਇੰਕ੍ਰਿਮੈਂਟਲ ਡਿਪਲੌਇਮੈਂਟ ਵਿੱਚ ਅੰਤਰ 'ਤੇ ਨਿਪੁੰਨ ਬਣੋ

```bash
# ਪਹਿਲੀ ਤੈਨਾਤੀ
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ਸ਼ੁਰੂਆਤੀ ਤੈਨਾਤੀ ਦਾ ਸਮਾਂ ਦਰਜ ਕਰੋ
echo "Full deployment: $(date)" > deployment-log.txt

# ਕੋਡ ਵਿੱਚ ਬਦਲਾਅ ਕਰੋ
echo "// Updated $(date)" >> src/api/src/server.js

# ਸਿਰਫ਼ ਕੋਡ ਤੈਨਾਤ ਕਰੋ (ਤੇਜ਼)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# ਸਮਿਆਂ ਦੀ ਤੁਲਨਾ ਕਰੋ
cat deployment-log.txt

# ਸਫਾਈ ਕਰੋ
azd down --force --purge
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਪੂਰਾ ਡਿਪਲੌਇਮੈਂਟ 5-15 ਮਿੰਟ ਲੈਂਦਾ ਹੈ
- [ ] ਸਿਰਫ ਕੋਡ ਡਿਪਲੌਇਮੈਂਟ 2-5 ਮਿੰਟ ਲੈਂਦਾ ਹੈ
- [ ] ਕੋਡ ਬਦਲਾਅ ਡਿਪਲੌਇ ਕੀਤੇ ਐਪ ਵਿੱਚ ਪਰਬਿੰਬਤ ਹੁੰਦੇ ਹਨ
- [ ] `azd deploy` ਤੋਂ ਬਾਅਦ ਇੰਫਰਾਸਟ੍ਰਕਚਰ ਅਣਬਦਲ ਰਹਿੰਦੀ ਹੈ

**ਸਿੱਖਣ ਦਾ ਨਤੀਜਾ**: ਕੋਡ ਬਦਲਾਅਾਂ ਲਈ `azd deploy`, `azd up` ਨਾਲੋਂ 50-70% ਤੇਜ਼ ਹੈ

### ਅਭਿਆਸ 2: ਕਸਟਮ ਡਿਪਲੌਇਮੈਂਟ ਹੋਕਸ (30 ਮਿੰਟ)
**ਲਕੜਾ**: ਪ੍ਰੀ ਅਤੇ ਪੋਸਟ-ਡਿਪਲੌਇਮੈਂਟ ਆਟੋਮੇਸ਼ਨ ਲਾਗੂ ਕਰੋ

```bash
# ਡਿਪਲੋਇ ਤੋਂ ਪਹਿਲਾਂ ਦੀ ਤਸਦੀਕ ਕਰਨ ਵਾਲੀ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# ਜਾਂਚੋ ਕਿ ਟੈਸਟ ਪਾਸ ਹੋ ਰਹੇ ਹਨ
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# ਅਣ-ਕਮਿਟ ਤਬਦੀਲੀਆਂ ਲਈ ਜਾਂਚ ਕਰੋ
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# ਡਿਪਲੋਇ ਤੋਂ ਬਾਅਦ ਦਾ ਸਮੋਕ ਟੈਸਟ ਬਣਾਓ
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# azure.yaml ਵਿੱਚ hooks ਸ਼ਾਮਿਲ ਕਰੋ
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# hooks ਨਾਲ ਡਿਪਲੋਇਮੈਂਟ ਟੈਸਟ ਕਰੋ
azd deploy
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਪ੍ਰੀ-ਡਿਪਲੌਇ ਸਕ੍ਰਿਪਟ ਡਿਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਚਲਦਾ ਹੈ
- [ ] ਟੈਸਟ ਫੇਲ ਹੋਣ 'ਤੇ ਡਿਪਲੌਇ ਬੰਦ ਹੋ ਜਾਵੇ
- [ ] ਪੋਸਟ-ਡਿਪਲੌਇ ਸਮੋਕ ਟੈਸਟ ਹੈਲਥ ਨੂੰ ਵੈਰਿਫਾਈ ਕਰਦਾ ਹੈ
- [ ] ਹੋਕਸ ਸਹੀ ਕ੍ਰਮ ਵਿੱਚ ਚਲਦੇ ਹਨ

### ਅਭਿਆਸ 3: ਬਹੁ-ਵਾਤਾਵਰਣ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀ (45 ਮਿੰਟ)
**ਲਕੜਾ**: ਸਟੇਜਡ ਡਿਪਲੌਇਮੈਂਟ ਵਰਕਫਲੋ ਨੂੰ ਲਾਗੂ ਕਰੋ (dev → staging → production)

```bash
# ਡਿਪਲੌਇਮੈਂਟ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# ਕਦਮ 1: dev ਤੇ ਡਿਪਲੌਇ ਕਰੋ
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ਕਦਮ 2: staging ਤੇ ਡਿਪਲੌਇ ਕਰੋ
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# ਕਦਮ 3: ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਮੈਨੂਅਲ ਮਨਜ਼ੂਰੀ
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# ਵਾਤਾਵਰਣ ਬਣਾਓ
azd env new dev
azd env new staging
azd env new production

# ਸਟੇਜਡ ਡਿਪਲੌਇਮੈਂਟ ਚਲਾਓ
./deploy-staged.sh
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] Dev ਵਾਤਾਵਰਣ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੌਇ ਹੁੰਦੀ ਹੈ
- [ ] Staging ਵਾਤਾਵਰਣ ਸਫਲਤਾਪੂਰਵਕ ਡਿਪਲੌਇ ਹੁੰਦੀ ਹੈ
- [ ] ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਮੈਨੁਅਲ ਅਪਰੂਵਲ ਲਾਜ਼ਮੀ ਹੈ
- [ ] ਸਾਰੇ ਵਾਤਾਵਰਣਾਂ ਵਿੱਚ ਕੰਮ ਕਰਨ ਵਾਲੇ ਹੈਲਥ ਚੈਕ ਹਨ
- [ ] ਜਰੂਰਤ ਪੈਣ 'ਤੇ ਰੋਲਬੈਕ ਕੀਤਾ ਜਾ ਸਕਦਾ ਹੈ

### ਅਭਿਆਸ 4: ਰੋਲਬੈਕ ਰਣਨੀਤੀ (25 ਮਿੰਟ)
**ਲਕੜਾ**: Git ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਡਿਪਲੌਇਮੈਂਟ ਰੋਲਬੈਕ ਲਾਗੂ ਅਤੇ ਟੈਸਟ ਕਰੋ

```bash
# v1 ਨੂੰ ਤਾਇਨਾਤ ਕਰੋ
azd env set APP_VERSION "1.0.0"
azd up

# v1 ਦੇ ਕਮਿਟ ਹੈਸ਼ ਨੂੰ ਸੇਵ ਕਰੋ
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# v2 ਨੂੰ ਤੋੜ-ਮਾਰ ਬਦਲਾਅ ਦੇ ਨਾਲ ਤਾਇਨਾਤ ਕਰੋ
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# ਨਾਕਾਮੀ ਦੀ ਪਛਾਣ ਕਰੋ ਅਤੇ ਰੋਲਬੈਕ ਕਰੋ
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਰੋਲਬੈਕ ਕਰੋ
    git revert HEAD --no-edit
    
    # ਮਾਹੌਲ ਨੂੰ ਰੋਲਬੈਕ ਕਰੋ
    azd env set APP_VERSION "1.0.0"
    
    # v1 ਨੂੰ ਮੁੜ ਤਾਇਨਾਤ ਕਰੋ
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਡਿਪਲੌਇਮੈਂਟ ਫੇਲ੍ਹ ਹੋਣ ਦੀ ਪਛਾਣ ਕਰ ਸਕਦਾ ਹੈ
- [ ] ਰੋਲਬੈਕ ਸਕ੍ਰਿਪਟ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਚਲਦਾ ਹੈ
- [ ] ਐਪਲੀਕੇਸ਼ਨ ਮੁੜ ਕੰਮ ਕਰਨ ਵਾਲੀ ਸਥਿਤੀ ਵਿੱਚ ਆ ਜਾਂਦੀ ਹੈ
- [ ] ਰੋਲਬੈਕ ਤੋਂ ਬਾਅਦ ਹੈਲਥ ਚੈਕਸ ਪਾਸ ਹੁੰਦੇ ਹਨ

## 📊 ਡਿਪਲੌਇਮੈਂਟ ਮੈਟ੍ਰਿਕਸ ਟ੍ਰੈਕਿੰਗ

### ਆਪਣੀ ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰਦਰਸ਼ਨ ਨੂੰ ਟ੍ਰੈਕ ਕਰੋ

```bash
# ਡਿਪਲੋਇਮੈਂਟ ਮੈਟ੍ਰਿਕਸ ਸਕ੍ਰਿਪਟ ਬਣਾਓ
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# ਫਾਇਲ ਵਿੱਚ ਲੌਗ ਕਰੋ
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# ਇਸਦਾ ਉਪਯੋਗ ਕਰੋ
./track-deployment.sh
```

**ਆਪਣੇ ਮੈਟ੍ਰਿਕਸ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ:**
```bash
# ਡਿਪਲੋਇਮੈਂਟ ਇਤਿਹਾਸ ਵੇਖੋ
cat deployment-metrics.csv

# ਔਸਤ ਡਿਪਲੋਇਮੈਂਟ ਸਮਾਂ ਦੀ ਗਣਨਾ ਕਰੋ
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## ਵਾਧੂ ਸਰੋਤ

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**ਨੈਵੀਗੇਸ਼ਨ**
- **ਪਿਛਲਾ ਪਾਠ**: [Your First Project](../chapter-01-foundation/first-project.md)
- **ਅਗਲਾ ਪਾਠ**: [Provisioning Resources](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->