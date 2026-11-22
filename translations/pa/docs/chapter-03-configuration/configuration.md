# ਸੈਟਿੰਗ ਗਾਈਡ

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਮੁੱਖ ਪੰਨਾ**: [AZD For Beginners](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 3 - ਸੈਟਿੰਗ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- **⬅️ ਪਹਿਲਾਂ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md)
- **➡️ ਅਗਲਾ**: [ਤੈਅਰੀ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 4: ਇੰਫ੍ਰਾਸਟ੍ਰੱਕਚਰ ਐਜ਼ ਕੋਡ](../chapter-04-infrastructure/deployment-guide.md)

## ਪਰਚਿਆ

> `azd 1.37.2` ਦੇ ਖਿਲਾਫ ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ (ਨਵੰਬਰ 2026)। ਬੈਸ਼ ਕਮਾਂਡਾਂ ਇੱਕ ਸ਼ੁਰੂ ਹੋਏ azd ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਮੰਨਦੀਆਂ ਹਨ। ਜੇ ਤੱਕ ਖੁੱਲ ਕੇ ਪੂਰੇ ਫਾਈਲ ਵਜੋਂ ਵਰਣਨ ਨਾ ਕੀਤਾ ਗਿਆ ਹੋਵੇ, YAML/Bicep ਸਨਿੱਪੇਟ ਇੱਕਲੌਤੇ ਚੱਲਦੇ ਪ੍ਰੋਜੈਕਟ ਨਹੀਂ, ਸਗੋਂ ਮਿਲਦੇ-ਜੁਲਦੇ ਪ੍ਰੋਜੈਕਟ ਫਾਈਲਾਂ ਵਿੱਚ ਜੋੜਨ ਲਈ ਟੁਕੜੇ ਹਨ।

ਇਹ ਵਿਸਤ੍ਰਿਤ ਗਾਈਡ ਆਜ਼ੂਰ ਡਿਵੈਲਪਰ CLI ਨੂੰ ਬਿਹਤਰ ਵਿਕਾਸ ਅਤੇ ਤਾਇਨਾਤੀ ਵਰਕਫਲੋਜ਼ ਲਈ ਸੰਰਚਿਤ ਕਰਨ ਦੇ ਸਾਰੇ ਪੱਖਾਂ ਨੂੰ ਕਵਰ ਕਰਦੀ ਹੈ। ਤੁਸੀਂ ਸੰਰਚਨਾ ਹਾਇਰਾਰਕੀ, ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ, ਪ੍ਰਮਾਣਕਰਨ ਦੇ ਤਰੀਕੇ, ਅਤੇ ਅਗੇਤਰ ਸੰਰਚਨਾ ਪੈਟਰਨਾਂ ਬਾਰੇ ਸਿੱਖੋਗੇ ਜੋ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਅਤੇ ਸੁਰੱਖਿਅਤ ਆਜ਼ੂਰ ਤਾਇਨਾਤੀਆਂ ਨੂੰ ਯਕੀਨੀ ਬਣਾਉਂਦੇ ਹਨ। 

## ਸਿੱਖਣ ਦੇ ਲਕੜੀ

ਇਸ ਪਾਠ ਦੇ ਅੰਤ ਤੱਕ, ਤੁਸੀਂ:
- azd ਸੰਰਚਨਾ ਹਾਇਰਾਰਕੀ ਵਿੱਚ ਮਾਹਿਰ ਹੋਵੋਗੇ ਅਤੇ ਸਮਝੋਗੇ ਕਿ ਸੈਟਿੰਗਜ਼ ਨੂੰ ਕਿਵੇਂ ਤਰਜੀਹ ਦਿੱਤੀ ਜਾਂਦੀ ਹੈ
- ਗਲੋਬਲ ਅਤੇ ਪ੍ਰੋਜੈਕਟ-ਖਾਸ ਸੈਟਿੰਗਜ਼ ਨੂੰ ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਢੰਗ ਨਾਲ ਸੰਰਚਿਤ ਕਰੋ
- ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾਵਾਂ ਦੇ ਨਾਲ ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ
- ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰਤ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
- ਜਟਿਲ ਸਥਿਤੀਆਂ ਲਈ ਉੱਚ ਕੋਟਿ ਦੀਆਂ ਸੰਰਚਨਾ ਪੈਟਰਨਾਂ ਨੂੰ ਸਮਝੋ

## ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ

ਇਸ ਪਾਠ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:
- ਸਭ ਤੋਂ ਵਧੀਆ ਵਿਕਾਸ ਵਰਕਫ਼ਲੋਜ਼ ਲਈ azd ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ
- ਕਈ ਤਾਇਨਾਤੀ ਵਾਤਾਵਰਣਾਂ ਨੂੰ ਸੈੱਟ ਅੱਪ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰੋ
- ਸੁਰੱਖਿਅਤ ਸੰਰਚਨਾ ਪ੍ਰਬੰਧਨ ਅਭਿਆਸਾਂ ਨੂੰ ਲਾਗੂ ਕਰੋ
- ਸੰਰਚਨਾ-ਸਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਦਾ ਨਿਵਾਰਣ ਕਰੋ
- ਵਿਸ਼ੇਸ਼ ਸੰਗਠਨਾਤਮਕ ਲੋੜਾਂ ਲਈ azd ਦੇ ਵਿਹਾਰ ਨੂੰ ਕਸਟਮਾਈਜ਼ ਕਰੋ

ਇਹ ਵਿਸਤ੍ਰਿਤ ਮਾਰਗਦਰਸ਼ਿਕਾ Azure Developer CLI ਨੂੰ ਸਭ ਤੋਂ ਵਧੀਆ ਵਿਕਾਸ ਅਤੇ ਤਾਇਨਾਤੀ ਵਰਕਫ਼ਲੋਜ਼ ਲਈ ਸੰਰਚਿਤ ਕਰਨ ਦੇ ਸਾਰੇ ਪੱਖ ਕਵਰ ਕਰਦੀ ਹੈ।

## azd ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ AI ਏਜੰਟਾਂ ਨੂੰ ਸਮਝਣਾ

ਜੇ ਤੁਸੀਂ AI ਏਜੰਟਾਂ ਨਾਲ ਨਵੇਂ ਹੋ, ਤਾਂ ਇੱਥੇ azd ਦੀ ਦੁਨੀਆ ਵਿੱਚ ਉਨ੍ਹਾਂ ਬਾਰੇ ਸੋਚਣ ਦਾ ਇੱਕ ਸਧਾਰਣ ਤਰੀਕਾ ਦਿੱਤਾ ਗਿਆ ਹੈ।

### ਏਜੰਟ ਕੀ ਹੈ?

ਇੱਕ ਏਜੰਟ ਇੱਕ ਸੌਫਟਵੇਅਰ ਦਾ ਟੁਕੜਾ ਹੈ ਜੋ ਕਦੇ ਬੇਨਤੀ ਪ੍ਰਾਪਤ ਕਰ ਸਕਦਾ ਹੈ, ਬਾਰੇ ਵਿਚਾਰ ਕਰਦਾ ਹੈ, ਅਤੇ ਕਾਰਵਾਈਆਂ ਕਰਦਾ ਹੈ—ਅਕਸਰ AI ਮਾਡਲ ਨੂੰ ਕਾਲ ਕਰਕੇ, ਡੇਟਾ ਦੀ ਖੋਜ ਕਰਕੇ, ਜਾਂ ਹੋਰ ਸੇਵਾਵਾਂ ਨੂੰ ਜਲਾਉਂਦਾ ਹੈ। ਇੱਕ azd ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ, ਏਜੰਟ ਤੁਹਾਡੇ ਵੈੱਬ ਫਰੰਟਐਂਡ ਜਾਂ API ਬੈਕਐਂਡ ਦੇ ਨਾਲ ਇੱਕ ਹੋਰ **ਸੇਵਾ** ਹੁੰਦਾ ਹੈ।

### azd ਪ੍ਰੋਜੈਕਟ ਸਟਰਕਚਰ ਵਿੱਚ ਏਜੰਟਾਂ ਦੀ ਭੂਮਿਕਾ

ਇਕ azd ਪ੍ਰੋਜੈਕਟ ਤਿੰਨ ਪਰਤਾਂ ਦਾ ਬਣਿਆ ਹੁੰਦਾ ਹੈ: **ਬੁਨਿਆਦੀ ਢਾਂਚਾ**, **ਕੋਡ**, ਅਤੇ **ਕਨਫਿਗਰੇਸ਼ਨ**। ਏਜੰਟ ਇਨ੍ਹਾਂ ਪਰਤਾਂ ਵਿੱਚ ਉਸੇ ਤਰ੍ਹਾਂ ਜੁੜਦੇ ਹਨ ਜਿਵੇਂ ਕੋਈ ਹੋਰ ਸੇਵਾ ਕਰਦੀ ਹੈ:

| ਪਰਤ | ਪਰੰਪਰਾਗਤ ਐਪ ਲਈ ਇਹ ਕੀ ਕਰਦੀ ਹੈ | ਏਜੰਟ ਲਈ ਇਹ ਕੀ ਕਰਦੀ ਹੈ |
|-------|-------------------------------------|---------------------------|
| **ਬੁਨਿਆਦੀ ਢਾਂਚਾ** (`infra/`) | ਇੱਕ ਵੈੱਬ ਐਪ ਅਤੇ ਡਾਟਾਬੇਸ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ | ਇੱਕ AI ਮਾਡਲ ਐਂਡਪੌਇੰਟ, ਖੋਜ ਸੂਚੀ ਜਾਂ ਏਜੰਟ ਹੋਸਟ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ |
| **ਕੋਡ** (`src/`) | ਤੁਹਾਡਾ ਫਰੰਟਏਂਡ ਅਤੇ API ਸੋਰਸ ਕੋਡ ਰੱਖਦਾ ਹੈ | ਤੁਹਾਡੀ ਏਜੰਟ ਲਾਜ਼ਿਕ ਅਤੇ ਪ੍ਰਾਮਪਟ ਪਰਿਭਾਸ਼ਾਵਾਂ ਰੱਖਦਾ ਹੈ |
| **ਕਨਫਿਗਰੇਸ਼ਨ** (`azure.yaml`) | ਤੁਹਾਡੀਆਂ ਸੇਵਾਵਾਂ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਹੋਸਟਿੰਗ ਟਾਰਗੇਟ ਦਰਸਾਂਦਾ ਹੈ | ਤੁਹਾਡੀ ਏਜੰਟ ਨੂੰ ਇੱਕ ਸੇਵਾ ਵਜੋਂ ਦਰਸਾਂਦਾ ਹੈ, ਜਿਸਦਾ ਕੋਡ ਅਤੇ ਹੋਸਟ ਕਿੱਥੇ ਹਨ ਦੱਸਦਾ ਹੈ |

### `azure.yaml` ਦਾ ਭੂਮਿਕਾ

ਤੁਹਾਨੂੰ ਹੁਣ ਸਿਨਟੈਕਸ ਯਾਦ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ ਹੈ। ਧਾਰਣਾਤਮਕ ਤੌਰ 'ਤੇ, `azure.yaml` ਉਹ ਫਾਈਲ ਹੈ ਜਿੱਥੇ ਤੁਸੀਂ azd ਨੂੰ ਦੱਸਦੇ ਹੋ: *"ਇਹ ਸੇਵਾਵਾਂ ਹਨ ਜੋ ਮੇਰੇ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਬਣਾਉਂਦੀਆਂ ਹਨ, ਅਤੇ ਇਨ੍ਹਾਂ ਦਾ ਕੋਡ ਕਿੱਥੇ ਲੱਭਣਾ ਹੈ।"*

ਜਦੋਂ ਤੁਹਾਡੇ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ ਇੱਕ AI ਏਜੰਟ ਸ਼ਾਮਲ ਹੁੰਦਾ ਹੈ, `azure.yaml` ਸਿਰਫ ਉਹ ਏਜੰਟ ਇੱਕ ਸੇਵਾ ਵਜੋਂ ਦਰਸਾਉਂਦਾ ਹੈ। ਫਿਰ azd ਸਹੀ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਦਾ ਹੈ (ਜਿਵੇਂ ਕਿ Microsoft Foundry Models ਦਾ ਐਂਡਪੌਇੰਟ ਜਾਂ ਏਜੰਟ ਨੂੰ ਹੋਸਟ ਕਰਨ ਲਈ Container App) ਅਤੇ ਤੁਹਾਡਾ ਏਜੰਟ ਕੋਡ ਤਾਇਨਾਤ ਕਰਦਾ ਹੈ—ਜਿਵੇਂ ਕਿ ਇਹ ਵੈੱਬ ਐਪ ਜਾਂ API ਲਈ ਕਰਦਾ ਹੈ।

ਇਸਦਾ ਮਤਲਬ ਹੈ ਕੋਈ ਨਵਾਂ ਆਧਾਰਭੂਤ ਸਿੱਖਣਾ ਨਹੀਂ ਹੈ। ਜੇਕਰ ਤੁਸੀਂ ਸਮਝਦੇ ਹੋ ਕਿ azd ਵੈੱਬ ਸੇਵਾ ਨੂੰ ਕਿਵੇਂ ਮੈਨੇਜ ਕਰਦਾ ਹੈ, ਤਾਂ ਤੁਸੀਂ ਪਹਿਲਾਂ ਹੀ ਸਮਝ ਚੁੱਕੇ ਹੋ ਕਿ ਇਹ ਏਜੰਟ ਨੂੰ ਕਿਵੇਂ ਮੈਨੇਜ ਕਰਦਾ ਹੈ।

## ਕਨਫਿਗਰੇਸ਼ਨ ਦੀ ਸਰਣੀ

azd ਕੋਲ ਵੱਖ-ਵੱਖ ਕਨਫਿਗਰੇਸ਼ਨ ਸਤਹ ਹੋਂਦ ਵਿੱਚ ਹਨ, ਨਾ ਕਿ ਕੋਈ ਇਕਸਾਰ ਓਵਰਲੇਅ:
- **ਗਲੋਬਲ ਯੂਜ਼ਰ ਪਸੰਦਾਂ**: `~/.azd/config.json`, ਜੋ ਕਿ `azd config` ਦੁਆਰਾ ਪ੍ਰਬੰਧਿਤ ਹਨ।
- **ਪ੍ਰੋਜੈਕਟ ਪਰਿਭਾਸ਼ਾ**: `azure.yaml` ਸੇਵਾਵਾਂ, ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਅਤੇ ਹੁਕਾਂ ਨੂੰ ਦਰਸਾਉਂਦਾ ਹੈ।
- **ਲੋਕਲ ਵਾਤਾਵਰਣ ਚੋਣ**: `.azure/config.json`।
- **ਪਰਿ-ਵਾਤਾਵਰਣ ਮੁੱਲ**: `.azure/<name>/.env`, ਜੋ `azd env` ਦੁਆਰਾ ਪ੍ਰਬੰਧਿਤ; ਵਾਧੂ ਸੈਟਿੰਗਜ਼ ਉਸ ਵਾਤਾਵਰਣ ਦੇ `config.json` ਵਿੱਚ ਰਹਿੰਦੀਆਂ ਹਨ।
- **ਫ਼ਲੈਗ ਅਤੇ ਪ੍ਰਕਿਰਿਆ ਵੈਰੀਏਬਲ**: ਸਿਰਫ਼ ਉਹ ਸੈਟਿੰਗਜ਼ ਬਦਲੋ ਜੋ ਕਿਸੇ ਖਾਸ ਕਮਾਂਡ/ਪ੍ਰਦਾਤਾ ਦੁਆਰਾ ਸਮਰਥਿਤ ਹਨ।

ਕੋਈ ਵੀ ਅਨਮਿਤ `azd env set` ਮੁੱਲ ਆਟੋਮੈਟਿਕ ਤੌਰ 'ਤੇ ਕਿਸੇ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪੈਰਾਮੀਟਰ ਜਾਂ ਡਿਪਲੋਇਡ ਐਪਲੀਕੇਸ਼ਨ ਸੈਟਿੰਗ ਨਹੀਂ ਬਣਦਾ। ਇਸ ਨੂੰ ਸਪਸ਼ਟ ਤੌਰ 'ਤੇ ਪੈਰਾਮੀਟਰ ਫਾਈਲ, ਸਮਰਥਿਤ ਸੇਵਾ ਕਨਫਿਗਰੇਸ਼ਨ, ਜਾਂ ਹੁੱਕ ਵਿੱਚ ਦਰਸਾਓ।

## ਗਲੋਬਲ ਕਨਫਿਗਰੇਸ਼ਨ

### ਗਲੋਬਲ ਡਿਫਾਲਟ ਸੈਟ ਕਰਨਾ
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### ਆਮ ਗਲੋਬਲ ਸੈਟਿੰਗਜ਼
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ ਪ੍ਰੋਜੈਕਟ ਕਨਫਿਗਰੇਸ਼ਨ

### azure.yaml ਸਟ੍ਰੱਕਚਰ
`azure.yaml` ਫਾਈਲ ਤੁਹਾਡੇ azd ਪ੍ਰੋਜੈਕਟ ਦਾ ਦਿਲ ਹੈ:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

ਇਹ ਇੱਕ **ਪ੍ਰੋਜੈਕਟ-ਪਰਿਭਾਸ਼ਾ ਉਦਾਹਰਨ** ਹੈ, ਸਪਲਾਈ ਕੀਤਾ ਸ਼ੁਰੂਆਤੀ ਨਹੀਂ। ਇਸ ਨੂੰ ਚਲਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਦਰਸਾਏ گئے ਸਰੋਤ ਡਾਇਰੈਕਟਰੀ, ਹੁੱਕ ਸਕ੍ਰਿਪਟ, ਪੈਕੇਜ ਸਕ੍ਰਿਪਟ, ਅਤੇ ਮਿਲਦੇ ਜੁਲਦੇ `infra/main.bicep`/`main.parameters.json` ਬਣਾਓ। ਡੇਟਾਬੇਸ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਵਿੱਚ ਰਹਿੰਦੇ ਹਨ; `postgres` ਇੰਝ ਹਨ ਜੋ ਸੇਵਾ ਹੋਸਟ ਨੈਹੀ ਹੈ। ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪੈਰਾਮੀਟਰ ਪ੍ਰਦਾਤਾ ਦੀ ਪੈਰਾਮੀਟਰ ਫਾਈਲ ਵਿੱਚ ਜਾਵਣਗੇ, ਨਾ ਕਿ `infra.parameters` ਵਿੱਚ।

### ਸੇਵਾ ਕਨਫਿਗਰੇਸ਼ਨ ਵਿਕਲਪ

#### ਹੋਸਟ ਕਿਸਮਾਂ
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### ਭਾਸ਼ਾ-ਵਿਸ਼ੇਸ਼ ਬਿਲਡ ਹੁੱਕਸ

ਹੇਠਾਂ ਦਿੱਤੇ ਸੇਵਾ ਟੁਕੜੇ ਹੁੱਕਸ ਦਿਖਾਂਦੇ ਹਨ; ਇਹਨਾਂ ਨੂੰ ਹਰ ਸੇਵਾ ਦੀ ਅਸਲੀ `project` ਅਤੇ `host` ਨਾਲ ਮਿਲਾਓ। `buildCommand` ਅਤੇ `startCommand` ਆਮ azd ਸੇਵਾ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਨਹੀਂ ਹਨ। ਸ਼ੁਰੂਆਤ ਐਪਲੀਕੇਸ਼ਨ, Dockerfile, ਜਾਂ ਹੋਸਟ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਵਿੱਚ ਸੀਟੱਪ ਕਰੋ।

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 ਵਾਤਾਵਰਣ ਪ੍ਰਬੰਧਨ

### ਵਾਤਾਵਰਣ ਬਣਾਉਣਾ
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ਵਾਤਾਵਰਣ ਕਨਫਿਗਰੇਸ਼ਨ
ਮੁੱਖ ਵਾਤਾਵਰਣ ਮੁੱਲ `.azure/<env-name>/.env` ਵਿੱਚ ਰਹਿੰਦੇ ਹਨ, ਜਿਸ ਵਿੱਚ `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, ਅਤੇ `AZURE_LOCATION` ਸ਼ਾਮਿਲ ਹਨ। ਵਾਧੂ ਵਾਤਾਵਰਣ JSON ਸੈਟਿੰਗਜ਼ ਲਈ `azd env config get/set` ਵਰਤੋ। ਹੇਠਾਂ ਦਿੱਤੀ JSON **ਧਾਰਨਾਤਮਿਕ ਐਪਲੀਕੇਸ਼ਨ ਸਥਿਤੀ** ਹੈ, azd ਕਨਫਿਗ ਸਕੀਮਾ ਨਹੀਂ; ਇਸਨੂੰ azd ਦੀਆਂ ਫਾਈਲਾਂ ਵਿੱਚ ਨਕਲ ਨਾ ਕਰੋ:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### ਵਾਤਾਵਰਣ ਵੈਰੀਏਬਲਜ਼

**ਸਰਲਤਾ ਲਈ ਪ੍ਰਦਰਸ਼ਨ।** ਆਮ `azd env set` ਮੁੱਲ `.azure/<name>/.env` ਵਿੱਚ ਲਿਖੇ ਜਾਂਦੇ ਹਨ ਅਤੇ ਰੀਡ ਕਮਾਂਡ ਦੁਆਰਾ ਪ੍ਰਿੰਟ ਕੀਤੇ ਜਾ ਸਕਦੇ ਹਨ। ਉਦਾਹਰਨ API ਕੁੰਜੀ ਨੂੰ ਅਸਲੀ ਪ੍ਰਮਾਣਿਕਤਾ ਵਜੋਂ ਨਾ ਵਰਤੋ। රਾਜ਼ ਲਈ `azd env set-secret` ਅਤੇ ਸਪਸ਼ਟ ਰਨਟਾਈਮ ਵਾਇਰਿੰਗ ਵਰਤੋ।

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### ਵਾਤਾਵਰਣ ਟੈਂਪਲੇਟਸ
ਪ੍ਰੋਜੈਕਟ ਰੂਟ ਵਿੱਚ ਇੱਕ **ਗੁਪਤ ਨਹੀਂ, ਹੱਥ ਨਾਲ ਸੰਭਾਲਿਆ ਜਾਂਦਾ** `.env.example` ਬਣਾਓ ਤਾਂ ਜੋ ਲਗਾਤਾਰ ਸੈਟਅਪ ਹੋਵੇ। azd ਅਪਮੈਟ ਇਕ ਫਾਈਲ ਜੋ ਨਾਮ ਦੇ ਨਾਲ ਹੈ `env.template` ਨੂੰ ਆਪਮੈਟ ਲੋਡ ਨਹੀਂ ਕਰਦਾ:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### ਟੀਮ ਵਿੱਚ ਵਾਤਾਵਰਣਾਂ ਸਾਂਝੇ ਕਰਨਾ

ਜਦੋਂ ਇੱਕ ਤੋਂ ਵੱਧ ਵਿਅਕਤੀ ਕਿਸੇ ਪ੍ਰੋਜੈਕਟ 'ਤੇ ਕੰਮ ਕਰਦੇ ਹਨ, ਤੁਹਾਨੂੰ ਇਹ ਫੈਸਲਾ ਕਰਨਾ ਚਾਹੀਦਾ ਹੈ ਕਿ **ਕੇੜਾ ਰੇਪੋ ਨਾਲ ਯਾਤਰਾ ਕਰਦਾ ਹੈ ਅਤੇ ਕੀ ਸਥਾਨਕ ਰਹਿੰਦਾ ਹੈ**। azd ਹਰ ਵਾਤਾਵਰਣ ਨੂੰ ਇੱਕ `.azure/` ਫੋਲਡਰ ਹੇਠਾਂ ਰੱਖਦਾ ਹੈ, ਅਤੇ ਸਾਰੀ ਚੀਜ਼ ਕਮੇਟ ਨਹੀਂ ਕੀਤੀ ਜਾਣੀ ਚਾਹੀਦੀ।

**`.azure/` ਵਿੱਚ ਕੀ ਹੈ:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**ਕੀ gitignore ਕਰਨਾ ਹੈ।** azd ਦਾ ਡਿਫ਼ਾਲਟ `.gitignore` ਪਹਿਲਾਂ ਹੀ `.azure/` ਨੂੰ ਬਾਹਰ ਰੱਖਦਾ ਹੈ। ਇਸ ਤਰ੍ਹਾਂ ਹੀ ਰੱਖੋ—`.env` ਫਾਇਲਾਂ ਵਿੱਚ ਰਾਜ਼ ਹੋ ਸਕਦੇ ਹਨ, ਅਤੇ ਸਰੋਤ IDs ਉਹਨਾਂ ਲਈ ਖਾਸ ਹੁੰਦੇ ਹਨ ਜਿਨ੍ਹਾਂ ਨੇ ਉਹਨਾਂ ਨੂੰ ਪ੍ਰੋਵੀਜਨ ਕੀਤਾ ਹੈ। ਹਰ ਟੀਮ ਮੈਂਬਰ ਆਪਣਾ **ਖ਼ੁਦ ਦਾ** ਵਾਤਾਵਰਨ ਸਥਾਨਕ ਤੌਰ ਤੇ ਬਣਾਉਂਦਾ ਹੈ:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**ਵਾਤਾਵਰਨਾਂ ਵਿਚਕਾਰ ਬਦਲਣਾ।** ਇੱਕ ਡਿਵੈਲਪਰ ਜੋ ਕਈ ਵਾਤਾਵਰਨਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰਦਾ ਹੈ, ਕਮਾਂਡਾਂ ਚਲਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਸਰਗਰਮ ਵਾਤਾਵਰਨ ਚੁਣਦਾ ਹੈ:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**ਟੀਮ ਨੂੰ ਗੈਰ-ਰਹੱਸਮਈ ਡਿਫਾਲਟਸ ਪ੍ਰਦਾਨ ਕਰਨਾ।** ਦਰਜਨ ਬਾਹਰ ਕਮੇਟ `.env.example` ਕਰੋ `.azure/` ਡਾਇਰੈਕਟਰੀ ਨੂੰ ਨਾ ਦਿੱਤਾ ਗਿਆ ਹੈ। ਨਵੇਂ ਟੀਮ ਮੈਂਬਰ ਇਸਨੂੰ ਇੱਕ ਸਥਾਨਕ ਨਾ ਦਿੱਤੇ ਫਾਈਲ ਵਿੱਚ ਕਾਪੀ ਕਰਦੇ ਹਨ, ਮੁੱਲ ਭਰਦੇ ਹਨ, ਅਤੇ ਇਸਨੂੰ ਖ਼ੁੱਲ੍ਹ ਕੇ `azd env set --file <local-file>` ਨਾਲ ਐਮਪੋਰਟ ਕਰਦੇ ਹਨ। ਕਦੇ ਵੀ ਖਾਲੀ ਪਲੇਸਹੋਲਡਰ ਵਰਕਿੰਗ ਵਾਤਾਵਰਣ 'ਤੇ ਆਯਾਤ ਨਾ ਕਰੋ।

**CI/CD ਵਿੱਚ ਵਾਤਾਵਰਣ।** ਪਾਈਪਲਾਈਨਾਂ ਤੁਹਾਡੇ ਸਥਾਨਕ `.azure/` ਫੋਲਡਰ ਨੂੰ ਨਹੀਂ ਪੜ੍ਹਦੀਆਂ। ਇਸ ਦੀ ਬਜਾਏ, ਵਾਤਾਵਰਣ ਮੁੱਲਾਂ ਨੂੰ ਪਾਈਪਲਾਈਨ ਵੈਰੀਏਬਲ/ਸਿੱਖਰੇਟਸ ਵਜੋਂ ਪ੍ਰਦਾਨ ਕਰੋ, ਅਤੇ azd ਉਹਨਾਂ ਨੂੰ ਪ੍ਰਕਿਰਿਆ ਵਾਤਾਵਰਣ ਤੋਂ ਪੜ੍ਹਦਾ ਹੈ:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **ਅੰਗੂਠੇ ਦੇ ਨਿਯਮ:** ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਕੋਡ (`infra/`, `azure.yaml`) ਗਿਟ ਵਿੱਚ ਸਾਂਝਾ ਕੀਤਾ ਜਾਂਦਾ ਹੈ; ਵਾਤਾਵਰਣ *ਰਾਜ਼ ਅਤੇ ਸਥਿਤੀ* (`.azure/`) ਪ੍ਰਤੀ ਵਿਕਾਸਕਾਰ ਅਤੇ ਪ੍ਰਤੀ ਪਾਈਪਲਾਈਨ ਹੁੰਦੇ ਹਨ। `azd pipeline config` ਤੁਹਾਡੇ ਲਈ ਪਾਈਪਲਾਈਨ ਵੈਰੀਏਬਲ ਸੈਟ ਕਰਦਾ ਹੈ ਆਪਣੇ ਆਪ।

## 🔐 ਪ੍ਰਮਾਣਿਕਤਾ ਸੰਰਚਨਾ

### Azure CLI ਇੰਟਿਗ੍ਰੇਸ਼ਨ
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### ਸਰਵਿਸ ਪ੍ਰਿੰਸੀਪਲ ਪ੍ਰਮਾਣਿਕਤਾ
CI/CD ਪਾਈਪਲਾਈਨਾਂ ਲਈ:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### ਪ੍ਰਬੰਧਿਤ ਪਛਾਣ
ਅਜ਼ੂਰ-ਹੋਸਟ ਕੀਤਾ ਵਾਤਾਵਰਣ ਲਈ:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਸੰਰਚਨਾ

### ਬਾਇਸਪ ਪੈਰਾਮੀਟਰ
ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਪੈਰਾਮੀਟਰਾਂ ਨੂੰ `infra/main.parameters.json` ਵਿੱਚ ਸੰਰਚਿਤ ਕਰੋ:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### ਟੈਰਾਫ਼ਾਰਮ ਸੰਰਚਨਾ
ਟੈਰਾਫ਼ਾਰਮ ਪ੍ਰਾਜੈਕਟਾਂ ਲਈ, azd `infra/main.tfvars.json` ਵਿੱਚ ਪਲੇਸਹੋਲਡਰ ਬਦਲਦਾ ਹੈ। ਇਹ ਨਾਮ ਐਲਾਨ ਕੀਤੇ ਟੈਰਾਫ਼ਾਰਮ ਇਨਪੁੱਟ ਵੈਰੀਏਬਲਾਂ ਨਾਲ ਮੇਲ ਖਾਣੇ ਚਾਹੀਦੇ ਹਨ:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 ਤੈਅਬਾਦ ਸੰਰਚਨਾ

### ਬਿਲਡ ਸੰਰਚਨਾ
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### ਡੋੱਕਰ ਸੰਰਚਨਾ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
ਪਾਥ ਸੇਵਾ ਪ੍ਰੋਜੈਕਟ ਦੇ ਸਪੇਸ਼ਣਿਕ ਹਨ। ਡੋੱਕਰਫਾਇਲ ਨੂੰ ਉਹਨਾਂ `ARG` ਮੁੱਲਾਂ ਨੂੰ ਐਲਾਨ ਕਰਨਾ ਜਰੂਰੀ ਹੈ ਜੋ ਇਹ ਖਪਾਉਂਦਾ ਹੈ। ਕਈ-ਮੰਚਾਂ ਵਾਲੀ ਬਿਲਡ ਲਈ, ਤੈਨਾਤੀਯੋਗ ਮੰਚ ਨੂੰ ਅਖੀਰ ਵਿੱਚ ਰੱਖੋ ਜਾਂ ਕਸਟਮ ਪੈਕੇਜਿੰਗ ਵਰਕਫਲੋ ਦੀ ਵਰਤੋਂ ਕਰੋ; `docker.target` ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ ਸਕੀਮਾ ਵਿੱਚ ਸਮਰਥਿਤ ਗੁਣ ਨਹੀਂ ਹੈ।

## 🔧 ਅੱਗੇ ਦੀ ਸੰਰਚਨਾ

### ਕਸਟਮ ਸਰੋਤ ਨਾਮੀਕਰਨ
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

ਅਸਲ ਸਰੋਤ ਨਾਮ ਬਾਇਸਪ/ਟੇਰਾਫਾਰਮ ਵਿੱਚ ਪਰਿਭਾਸ਼ਿਤ ਕਰੋ ਅਤੇ ਸਰੋਤ-ਗਰੁੱਪ ਬਣਾਉਣ ਨੂੰ ਇਸ ਸੈਟਿੰਗ ਨਾਲ ਸੰਗਤਿਤ ਰੱਖੋ। ਕੋਈ ਸਧਾਰਣ `naming.storageAccount` ਜਾਂ `naming.keyVault` ਸੰਰਚਨਾ ਕੁੰਜੀਆਂ ਨਹੀਂ ਹਨ।

### ਨੈੱਟਵਰਕ ਸੰਰਚਨਾ
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

ਇਨ੍ਹਾਂ **ਦਿੱਖਵਾਈ ਪੈਰਾਮੀਟਰ ਦਾਖਲਾਂ** ਨੂੰ `infra/main.parameters.json` ਵਿਚ `parameters` ਦੇ ਤਹਿਤ ਜੋੜੋ ਅਤੇ ਬਾਇਸਪ ਵਿੱਚ ਮੇਲ ਖਾਂਦੇ ਪੈਰਾਮੀਟਰਾਂ ਦਾ ਐਲਾਨ ਅਤੇ ਖਪਤ ਕਰੋ। ਇਹਨਾਂ ਦਾ ਆਪਣੇ ਆਪ ਵਿੱਚ ਕੋਈ ਪ੍ਰਭਾਵ ਨਹੀਂ ਹੁੰਦਾ।

### ਨਿਗਰਾਨੀ ਸੰਰਚਨਾ
ਬਾਇਸਪ/ਟੇਰਾਫਾਰਮ ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਅਤੇ ਲੌਗ ਐਨਾਲਿਟਿਕਸ ਪ੍ਰਦਾਨ ਕਰੋ ਅਤੇ ਆਪਣੇ SDK ਵਿੱਚ ਐਪਲੀਕੇਸ਼ਨ ਟੈਲੀਮੇਟਰੀ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ। ਕੋਈ ਸਧਾਰਣ ਸਿਖਰ-ਸਤਹ ਵਾਲਾ `monitoring` ਬਲਾਕ `azure.yaml` ਵਿੱਚ ਨਹੀਂ ਹੈ ਜੋ ਇਹ ਸਰੋਤ ਬਣਾਉਂਦਾ ਹੈ। ਵੇਖੋ [ਨਿਗਰਾਨੀ ਢਾਂਚਾ](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability)।

## 🎯 ਮਾਹੌਲ-ਵਿਸ਼ੇਸ਼ ਸੰਰਚਨਾਵਾਂ

### ਵਿਕਾਸ ਮਾਹੌਲ
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ਸਟੇਜਿੰਗ ਮਾਹੌਲ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ਉਤਪਾਦਨ ਮਾਹੌਲ
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਵੈਰੀਫਿਕੇਸ਼ਨ

### ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਸਹੀ ਹੈ ਜਾਂ ਨਹੀਂ, ਜਾਂਚ ਕਰੋ
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਸਕ੍ਰਿਪਟਾਂ
`scripts/` ਵਿੱਚ ਵੈਰੀਫਿਕੇਸ਼ਨ ਸਕ੍ਰਿਪਟ ਬਣਾਓ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ਬਿਹਤਰ ਅਮਲ

### 1. ਮਾਹੌਲੀਅਤ ਵਾਲੇ ਵੈਰੀਏਬਲ ਵਰਤੋ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

ਸੇਂਸਿਟਿਵ ਕੀਮਤਾਂ ਨੂੰ ਹਾਰਡਕੋਡ ਕਰਨ ਤੋਂ ਬਚੋ (ਦਰਸਾਉਣ ਵਾਲੀ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਅਲੱਗ ਕਰੋ, ਇੱਕੋ ਫਾਇਲ ਵਿੱਚ ਦੂਜੀ `database` ਕੁੰਜੀ ਨਹੀਂ):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਫਾਇਲਾਂ ਨੂੰ ਢੰਗ ਨਾਲ ਵਿਆਵਸਥਿਤ ਕਰੋ
```
.azure/
├── config.json              # Global project config
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. ਵਰਜ਼ਨ ਕੰਟਰੋਲ ਦੇ ਵਿਚਾਰ
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਦਸਤਾਵੇਜ਼ੀ
ਆਪਣੇ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਨੂੰ `CONFIG.md` ਵਿੱਚ ਦਸਤਾਵੇਜ਼ੀਕਰਨ ਕਰੋ:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 ਹੱਥ-ਵਰਕ ਪ੍ਰੈਕਟਿਸ ਅਭਿਆਸ

### ਅਭਿਆਸ 1: ਬਹੁ-ਮਾਹੌਲੀਅਤ ਕਨਫ਼ਿਗਰੇਸ਼ਨ (15 ਮਿੰਟ)

**ਮਕਸਦ**: ਵੱਖ-ਵੱਖ ਕੀਮਤਾਂ ਨਾਲ ਤਿੰਨ ਲੋਕਲ ਮਾਹੌਲ ਬਣਾਓ ਅਤੇ ਕਨਫ਼ਿਗਰ ਕਰੋ। ਇੱਕ ਸ਼ੁਰੂਆਤੀ ਪ੍ਰੋਜੈਕਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ; ਜੇ ਇਹਨਾਂ ਕੇ ਨਾਮ ਪਹਿਲਾਂ ਹੀ ਹਨ ਤਾਂ ਅਣਵਰਤੇ ਨਾਮ ਵਰਤੋਂ। ਇਹ ਐਪਲੀਕੇਸ਼ਨ-ਵਿਸ਼ੇਸ਼ ਕੀਮਤਾਂ ਟੈਲੀਮੀਟਰੀ/ਰuntime ਸੈਟਿੰਗਾਂ ਨਹੀਂ ਬਦਲਦੀਆਂ ਜਦ ਤੱਕ ਤੁਹਾਡਾ ਟੈਮਪਲੇਟ ਇਨ੍ਹਾਂ ਨੂੰ ਵਰਤਦਾ ਨਹੀਂ।

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਤਿੰਨ ਮਾਹੌਲ ਸਫਲਤਾਪੂਰਕ ਬਣਾਏ ਗਏ
- [ ] ਹਰ ਮਾਹੌਲ ਵਿਚ ਵੱਖਰੀ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਹੈ
- [ ] ਗਲਤੀਆਂ ਬਿਨਾਂ ਮਾਹੌਲਾਂ ਵਿੱਚ ਬਦਲਿਆ ਜਾ ਸਕਦਾ ਹੈ
- [ ] `azd env list` ਸਾਰੇ ਤਿੰਨ ਮਾਹੌਲ ਦਿਖਾਉਂਦਾ ਹੈ

### ਅਭਿਆਸ 2: ਕੁੰਜੀ ਵੌਲ੍ਟ ਸੀਕ੍ਰੇਟ ਹਵਾਲੇ (10-20 ਮਿੰਟ)

**ਮਕਸਦ**: ਸਿੱਧਾ ਪਲੇਨ ਟੈਕਸਟ ਦੀ ਬਜਾਏ ਇੱਕ ਕੁੰਜੀ ਵੌਲ੍ਟ ਹਵਾਲਾ ਸਟੋਰ ਕਰੋ। **ਸ਼ੁਰੂਆਤੀ ਸਥਿਤੀ:** ਇੱਕ ਸ਼ੁਰੂਆਤੀ ਮਾਹੌਲ, ਅਜ਼ੂਰ ਸਾਇਨ-ਇਨ, ਅਤੇ ਇੱਕ ਕੁੰਜੀ ਵੌਲ੍ਟ ਤੱਕ ਪਹੁੰਚ ਜਿਸਦੇ ਰੂਹੀਂ ਡੁੰਮੀ ਸੀਕ੍ਰੇਟ ਬਣਾਉਣ/ਪੜ੍ਹਨ ਦੇ ਅਧਿਕਾਰ ਹਨ। ਵੌਲ੍ਟ ਕਾਰਜ ਕਰਨ ਦੀਆਂ ਫੀਸਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ।

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ:**
- [ ] ਇੰਟਰੈਕਟਿਵ ਕਮਾਂਡ ਚੁਣੀ ਹੋਈ ਵੌਲ੍ਟ ਅਤੇ ਸੀਕ੍ਰੇਟ ਦਾ ਹਵਾਲਾ ਦਿਖਾਉਂਦੀ ਹੈ
- [ ] ਲੋਕਲ `.env` ਵਿੱਚ ਡੁੰਮੀ ਸੀਕ੍ਰੇਟ ਦੀ ਬਜਾਏ ਹਵਾਲਾ ਹੈ
- [ ] ਸਮਝਾ ਸਕਦਾ ਹੈ ਕਿ runtime identity/RBAC ਅਤੇ ਖਪਤ ਨੂੰ ਹੁਣ ਵੀ ਕਨਫ਼ਿਗਰ ਕਰਨਾ ਲਾਜ਼ਮੀ ਹੈ

**ਆਮ ਸਮੱਸਿਆਵਾਂ:** 403 ਲਈ ਸਹੀ ਵੌਲ੍ਟ ਡਾਟਾ-ਪਲੇਨ ਭੂਮਿਕਾ ਅਤੇ ਪ੍ਰਸਾਰਣ ਸਮਾਂ ਲਾਜ਼ਮੀ ਹੈ; `azd env set ... --secret` ਇੱਕ ਵੈਧ ਕਮਾਂਡ ਨਹੀਂ ਹੈ। ਆਮ `get-values`/`get-value` ਆਉਟਪੁੱਟ ਨੂੰ ਰੇਡੈਕਟਡ ਸਮਝਿਆ ਨਹੀਂ ਜਾ ਸਕਦਾ। `azd env unset TRAINING_API_KEY` ਨਾਲ ਟ੍ਰੇਨਿੰਗ ਹਵਾਲਾ ਹਟਾਓ; ਇਹ ਵੌਲ੍ਟ ਸੀਕ੍ਰੇਟ ਨੂੰ ਹਟਾਉਂਦਾ ਨਹੀਂ, ਜੇ ਤੁਸੀਂ ਇਹ ਬਣਾਇਆ ਸੀ ਤਾਂ আলੱਗੋ ਧੋਣ ਕਰਨਾ ਪਵੇਗਾ।

## ਅਗਲੇ ਕਦਮ

- [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md) - ਅਮਲ ਵਿੱਚ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਲਾਗੂ ਕਰੋ
- [ਡਿਪਲੋਇਮੈਂਟ ਗਾਈਡ](../chapter-04-infrastructure/deployment-guide.md) - ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਵਰਤੋ
- [ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਸਰੋਤ](../chapter-04-infrastructure/provisioning.md) - ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਤਿਆਰ ਕਨਫ਼ਿਗਰੇਸ਼ਨ

## ਸੰਦਰਭ

- [azd ਕਨਫ਼ਿਗਰੇਸ਼ਨ ਸੰਦਰਭ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml ਸਕੀਮਾ](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [ਮਾਹੌਲ ਵੈਰੀਏਬਲ](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**ਅਧਿਆਇ ਨੈਵੀਗੇਸ਼ਨ:**
- **📚 ਕੋਰਸ ਹਾੱਬ**: [ਆਰੰਭਿਕਾਂ ਲਈ AZD](../../README.md)
- **📖 ਮੌਜੂਦਾ ਅਧਿਆਇ**: ਅਧਿਆਇ 3 - ਸੰਰਚਨਾ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
- **⬅️ ਪਿਛਲਾ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](../chapter-01-foundation/first-project.md)
- **➡️ ਅਗਲਾ ਅਧਿਆਇ**: [ਅਧਿਆਇ 4: ਕੋਡ ਵਜੋਂ ਢਾਂਚਾ](../chapter-04-infrastructure/deployment-guide.md)
- **ਅਗਲਾ ਪਾਠ**: [ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸੁਰੱਖਿਆ](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->