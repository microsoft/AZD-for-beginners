# ਅਧਿਆਇ 7: ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਅਤੇ ਡੀਬੱਗਿੰਗ

**📚 ਕੋਰਸ**: [ਨਵੇਂ ਲੋਗਾਂ ਲਈ AZਡ](../../README.md) | **⏱️ ਸਮਾਂ**: 1-1.5 ਘੰਟੇ | **⭐ ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ

---

## ਜਾਇਜ਼ਾ

ਇਹ ਅਧਿਆਇ ਤੁਹਾਨੂੰ Azure Developer CLI ਨਾਲ ਕੰਮ ਕਰਦਿਆਂ ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ ਕਰਨ ਅਤੇ ਹੱਲ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ। ਤਾਇਨਾਤੀ ਵਿਫਲਤਾਵਾਂ ਤੋਂ ਲੈ ਕੇ AI-ਖਾਸ ਸਮੱਸਿਆਵਾਂ ਤੱਕ।

> ਜਾਰੀ ਕੀਤੇ ਗਏ `azd 1.37.2` ਸੰਦਰਭ ਦੇ ਮੁਤਾਬਕ ਕਮਾਂਡ ਮਾਰਗਦਰਸ਼ਨ ਦੀ ਸਮੀਖਿਆ ਕੀਤੀ ਗਈ। ਕਲਾਉਡ ਤਾਇਨਾਤੀਆਂ ਚਲਾਈਆਂ ਨਹੀਂ ਗਈਆਂ। ਕਮਾਂਡਾਂ ਨੂੰ ਵਰਤਣ ਤੋਂ ਪਹਿਲਾਂ ਉਦਾਹਰਨ ਸਰੋਤ ਨਾਂ ਅਤੇ IDs ਬਦਲੋ।

## ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਅਧਿਆਇ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ ਤੁਸੀਂ:
- ਆਮ AZD ਤਾਇਨਾਤੀ ਵਫ਼ਲਤਾਵਾਂ ਦੀ ਪਛਾਣ ਕਰੋ
- ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਧਿਕਾਰ ਸਮੱਸਿਆਵਾਂ ਦਾ ਡੀਬੱਗ ਕਰੋ
- AI ਸੇਵਾ ਕਨੈਕਟੀਵਿਟੀ ਸਮੱਸਿਆਵਾਂ ਦਾ ਹੱਲ ਕਰੋ
- ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਲਈ Azure Portal ਅਤੇ CLI ਵਰਤੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md) | ਜ਼ਿਆਦਾ ਮਿਲਦੀਆਂ ਸਮੱਸਿਆਵਾਂ | 30 ਮਿੰਟ |
| 2 | [ਡੀਬੱਗਿੰਗ ਮਾਰਗਦਰਸ਼ਨ](debugging.md) | ਕਦਮ-ਦਰ-ਕਦਮ ਡੀਬੱਗਿੰਗ ਤਕਨੀਕਾਂ | 45 ਮਿੰਟ |
| 3 | [AI ਸਮੱਸਿਆ ਨਿਵਾਰਣ](ai-troubleshooting.md) | AI-ਖਾਸ ਸਮੱਸਿਆਵਾਂ | 30 ਮਿੰਟ |

---

## 🚨 ਤੁਰੰਤ ਹੱਲ

### ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### ਤਾਇਨਾਤੀ ਦੀਆਂ ਵਫ਼ਲਤਾਵਾਂ
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### ਸਰੋਤ ਸੰਘਰਸ਼
ਪਹਿਲਾਂ ਮੌਜੂਦਾ ਸਰੋਤ ਅਤੇ ਤਾਇਨਾਤੀ ਦੀਆਂ ਗਲਤੀਆਂ ਦੀ ਜਾਂਚ ਕਰੋ। ਨਾਮਕਰਨ ਦੇ ਸੰਘਰਸ਼ ਨੂੰ ਹੱਲ ਕਰਨ ਲਈ ਸਾਂਝੇ ਜਾਂ ਪ੍ਰੋਡਕਸ਼ਨ ਵਾਤਾਵਰਣ ਨੂੰ ਮਿਟਾਉ ਨਾ। **ਨਵੇਂ ਨਸ਼ਟਸ਼ੀਲ ਵਾਤਾਵਰਣ** ਲਈ ਇਕ ਵਿਲੱਖਣ ਨਾਂ ਵਰਤੋ:

```bash
azd env new different-name
azd up
```

### ਕੋਟਾ ਪਾਰ ਹੋਣਾ
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

`AZURE_LOCATION` ਬਦਲਣਾ ਮੌਜੂਦਾ ਸਰੋਤਾਂ ਨੂੰ ਨਹੀਂ ਲੈਂਦਾ ਅਤੇ ਮੁੜ ਤਾਇਨਾਤੀ 'ਤੇ ਟਿਕਾਣੇ ਦੇ ਸੰਘਰਸ਼ ਪੈਦਾ ਕਰ ਸਕਦਾ ਹੈ।

---

## 📋 ਤਰੁੱਟੀ ਕੋਡ ਸੰਦਰਭ

| ਤਰੁੱਟੀ | ਕਾਰਨ | ਹੱਲ |
|-------|-------|----------|
| `AuthenticationError` | ਲੌਗ ਇਨ ਨਹੀਂ ਹੈ | `azd auth login` |
| `ResourceNotFound` | ਸਰੋਤ ਮਿਲਿਆ ਨਹੀਂ | ਸਰੋਤ ਦੇ ਨਾਂ ਚੈੱਕ ਕਰੋ |
| `QuotaExceeded` | ਸਭਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ | ਕੋਟਾ ਵਾਧਾ ਦੀ ਬੇਨਤੀ ਕਰੋ |
| `InvalidTemplate` | ਬਿਸਪsyntax ਦੀ ਗਲਤੀ | `az bicep build` |
| `Conflict` | ਸਰੋਤ ਮੌਜੂਦ ਹੈ | ਨਵਾਂ ਨਾਂ ਵਰਤੋ ਜਾਂ ਮਿਟਾਓ |
| `Forbidden` | ਅਪਰਯਾਪਤ ਅਧਿਕਾਰ | RBAC ਭੂਮਿਕਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ |

---

## 🔄 ਰੀਸੈਟ ਅਤੇ ਬਹਾਲੀ

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

ਹਾਰਡ ਰੀਸੈਟ ਡੇਟਾ ਮਿਟਾਉਂਦਾ ਹੈ ਅਤੇ ਅਦੀਪੰਨਾਂ ਬਦਲ ਸਕਦਾ ਹੈ। ਪਹਿਲਾਂ ਬੈਕਅਪ ਕਰੋ ਅਤੇ ਇੰਟਰਐਕਟਿਵ ਮਿਟਾਓ ਪ੍ਰੰਪਟ ਦੀ ਸਮੀਖਿਆ ਕਰੋ। `--force --purge` ਸਿਰਫ ਨਸ਼ਟਸ਼ੀਲ ਵਾਤਾਵਰਣ ਲਈ ਉਚਿਤ ਹੈ ਜਦੋਂ ਅਪਰਿਵਰਤਨੀ ਮਿਟਾਉਣਾ ਮਨਜ਼ੂਰ ਹੋਵੇ।

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 6: ਤਾਇਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ](../chapter-06-pre-deployment/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 8: ਉਤਪਾਦਨ](../chapter-08-production/README.md) |

---

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਤਾਇਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਚੈਕ](../chapter-06-pre-deployment/preflight-checks.md)
- [ਸੰਰਚਨਾ ਮਾਰਗਦਰਸ਼ਨ](../chapter-03-configuration/configuration.md)
- [AZD GitHub ਸਮੱਸਿਆਵਾਂ](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->