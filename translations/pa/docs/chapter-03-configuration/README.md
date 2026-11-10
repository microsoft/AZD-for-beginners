# ਅਧਿਆਇ 3: ਸੰਰਚਨਾ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ

**📚 ਕੋਰਸ**: [ਨਵੋਵਿੱਚਾਰੀਆਂ ਲਈ AZD](../../README.md) | **⏱️ ਸਮਾਂ**: 90-150 ਮਿੰਟ ਸਮੇਤ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਅਭਿਆਸ | **⭐ ਪੇਚੀਦਗੀ**: ਦਰਮਿਆਨਾ

---

## ਝਲਕ

ਇਹ ਅਧਿਆਇ ਵਾਤਾਵਰਨ ਸੰਰਚਨਾ, ਪ੍ਰਮਾਣਿਕਤਾ ਪੈਟਰਨ ਅਤੇ Azure ਡਿਵੈਲਪਰ CLI ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਸੁਰੱਖਿਆ ਦੀਆਂ ਸਭ ਤੋਂ ਵਧੀਆ ਪ੍ਰਥਾਵਾਂ ਨੂੰ ਕਵਰ ਕਰਦਾ ਹੈ।

> ਕਮਾਂਡ ਅਤੇ ਸੰਰਚਨਾ ਸਮੀਖਿਆ ਟਾਰਗੇਟ: `azd 1.37.2` (ਨਵੰਬਰ 2026)। ਸਮੀਖਿਆ ਦੌਰਾਨ ਲਾਈਵ Azure ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨਹੀਂ ਚਲਾਇਆ ਗਿਆ।

## ਸਿਖਲਾਈ ਦੇ ਉਦੇਸ਼

ਇਸ ਅਧਿਆਇ ਨੂੰ ਪੂਰਾ ਕਰ ਕੇ, ਤੁਸੀਂ:
- AZD ਸੰਰਚਨਾ ਹਾਇਰਾਰਕੀ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋਗੇ
- ਕਈ ਵਾਤਾਵਰਣਾਂ (ਡੈਵ, ਸਟੇਜਿੰਗ, ਪ੍ਰੋਡ) ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ
- ਪ੍ਰਬੰਧਿਤ ਪਹਿਚਾਣ ਨਾਲ ਸੁਰੱਖਿਅਤ ਪ੍ਰਮਾਣਿਕਤਾ ਲਾਗੂ ਕਰੋ
- ਵਾਤਾਵਰਣ-ਨਿਰਧਾਰਿਤ ਸੈਟਿੰਗਾਂ ਨੂੰ ਸੰਰਚਿਤ ਕਰੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵਰਣਨ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [ਸੰਰਚਨਾ ਗਾਈਡ](configuration.md) | ਵਾਤਾਵਰਣ ਸੈਟਅੱਪ ਅਤੇ ਪ੍ਰਬੰਧਨ | 30 ਮਿੰਟ |
| 2 | [ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸੁਰੱਖਿਆ](authsecurity.md) | ਪ੍ਰਬੰਧਿਤ ਪਹਿਚਾਣ ਅਤੇ RBAC ਪੈਟਰਨ | 30 ਮਿੰਟ |

---

## 🚀 ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ

**ਪਹਿਲਾਂ ਹੀ ਸ਼ੁਰੂ ਕੀਤੇ ਗਏ azd ਐਪਲੀਕੇਸ਼ਨ ਦੇ ਰੂਟ ਤੋਂ ਚਲਾਓ**, ਨਾ ਕਿ ਕੋਰਸ ਰਿਪਾਜ਼ਟਰੀ ਤੋਂ। ਜੇ ਇਹ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹਨ ਤਾਂ ਅਣਵਰਤੀਆਂ ਵਾਤਾਵਰਣ ਦੇ ਨਾਮ ਵਰਤੋਂ।

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` ਉਦਾਹਰਨ ਵਜੋਂ ਹੈ: ਇਹ ਸਿਰਫ ਉਸ ਸਮੇਂ ਇੰਫਰਾਸਟਰੱਕਚਰ ਨੂੰ ਪ੍ਰਭਾਵਿਤ ਕਰਦਾ ਹੈ ਜੇ ਤੁਹਾਡਾ ਟੈਂਪਲੇਟ ਖ਼ਾਸ ਤੌਰ 'ਤੇ ਇਸ ਦਾ ਉਪਯੋਗ ਕਰਦਾ ਹੈ। ਆਮ ਤੌਰ 'ਤੇ `azd env set` ਦੇ ਮੁੱਲ ਸਾਫ਼ ਅਤੇ ਸਿੱਧੇ ਟੈਕਸਟ ਵਿਚ ਸਥਾਨਕ ਤੌਰ 'ਤੇ ਸੁਰੱਖਿਅਤ ਸਿਕ੍ਰੇਟ ਸਟੋਰੇਜ ਨਹੀਂ ਹੁੰਦੇ।

---

## 🔧 ਸੰਰਚਨਾ ਹਾਇਰਾਰਕੀ

ਤਿੰਨ ਵੱਖ-ਵੱਖ ਸੰਰਚਨਾ ਸਤਹਾਂ ਨੂੰ ਵੱਖਰਾ ਰੱਖੋ: ਗਲੋਬਲ ਪ੍ਰਾਫ਼ਰੈਂਸਿਜ਼ (`azd config`), ਪ੍ਰੋਜੈਕਟ ਢਾਂਚਾ (`azure.yaml`), ਅਤੇ ਪ੍ਰਤੀ ਵਾਤਾਵਰਣ ਮੁੱਲ (`azd env`)। ਫਲੈਗ ਕੇਵਲ ਉਹੀ ਸੈਟਿੰਗਸ ਓਵਰਰਾਈਡ ਕਰਦੇ ਹਨ ਜੋ ਉਹ ਵਾਸ਼ਤਵ ਵਿੱਚ ਸਮਰੱਥਿਤ ਕਰਦੇ ਹਨ; ਕਿਸੇ ਵੀ ਸਰਬਜਨੀਂ ਓਵਰਲੇ ਦੀ ਕੋਈ ਸਹੂਲਤ ਮੁਹੱਈਆ ਨਹੀਂ ਹੈ ਜੋ ਬਿਨਾਂ ਕਿਸੇ ਸਰਹੱਦ ਦੇ ਵਾਤਾਵਰਣ ਚਲ ਵਿਲੀਅਨਾਂ ਨੂੰ `azure.yaml` ਜਾਂ Bicep ਉੱਤੇ ਥਾਪੇ।

---

## 🔐 ਸੁਰੱਖਿਆ ਦੀਆਂ ਸਭ ਤੋਂ ਵਧੀਆ ਪ੍ਰਥਾਵਾਂ

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
az login
```

---

## 🔗 ਨੇਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 2: AI ਵਿਕਾਸ](../chapter-02-ai-development/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 4: ਇੰਫਰਾਸਟਰਕਚਰ](../chapter-04-infrastructure/README.md) |

---

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਪਹਿਲਾਂ-ਡਿਪਲੋਇਮੈਂਟ ਚੈਕਸ](../chapter-06-pre-deployment/README.md)
- [ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->