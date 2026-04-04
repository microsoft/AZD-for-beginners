# ਅਧਿਆਇ 7: ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਡਿਬੱਗਿੰਗ

**📚 ਕੋਰਸ**: [AZD For Beginners](../../README.md) | **⏱️ ਅਵਧੀ**: 1-1.5 ਘੰਟੇ | **⭐ ਜਟਿਲਤਾ**: ਮੱਧਮ

---

## ਜਾਇਜ਼ਾ

ਇਹ ਅਧਿਆਇ ਤੁਹਾਨੂੰ Azure Developer CLI ਨਾਲ ਕੰਮ ਕਰਦੇ ਸਮੇਂ ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਹੱਲ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ — ਡਿਪਲੋਇਮੈਂਟ ਅਸਫਲਤਾਵਾਂ ਤੋਂ ਲੈ ਕੇ AI-ਖਾਸ ਸਮੱਸਿਆਵਾਂ ਤੱਕ।

> ਮਾਰਚ 2026 ਵਿੱਚ `azd 1.23.12` ਤੇ ਵੈਰੀਫਾਈ ਕੀਤਾ ਗਿਆ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

By completing this chapter, you will:
- AZD ਡਿਪਲੋਇਮੈਂਟ ਦੀਆਂ ਆਮ ਅਸਫਲਤਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
- ਪ੍ਰਮਾਣੀਕਰਨ ਅਤੇ ਅਨੁਮਤੀ ਸੰਬੰਧੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡਿਬੱਗ ਕਰੋ
- AI ਸਰਵਿਸ ਕਨੇਕਟਿਵਿਟੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ
- ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਲਈ Azure ਪੋਰਟਲ ਅਤੇ CLI ਦੀ ਵਰਤੋਂ ਕਰੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md) | ਆਮ ਤੌਰ 'ਤੇ ਸਾਹਮਣੇ ਆਉਂਦੀਆਂ ਸਮੱਸਿਆਵਾਂ | 30 ਮਿੰਟ |
| 2 | [ਡਿਬੱਗਿੰਗ ਗਾਈਡ](debugging.md) | ਕਦਮ-ਦਰ-ਕਦਮ ਡਿਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ | 45 ਮਿੰਟ |
| 3 | [AI ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ](ai-troubleshooting.md) | AI-ਖਾਸ ਸਮੱਸਿਆਵਾਂ | 30 ਮਿੰਟ |

---

## 🚨 ਤੁਰੰਤ ਹੱਲ

### ਪ੍ਰਮਾਣੀਕਰਨ ਸਮੱਸਿਆਵਾਂ
```bash
# AZD ਵਰਕਫਲੋਜ਼ ਲਈ ਲਾਜ਼ਮੀ
azd auth login

# ਜੇ ਤੁਸੀਂ ਸਿੱਧੇ ਤੌਰ 'ਤੇ Azure CLI ਦੀਆਂ ਕਮਾਂਡਾਂ ਵੀ ਵਰਤ ਰਹੇ ਹੋ ਤਾਂ ਇਹ ਵਿਕਲਪੀ ਹੈ
az login

azd auth status
```

### ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਅਸਫਲਤਾਵਾਂ
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### ਸਰੋਤ ਟਕਰਾਅ
```bash
azd down --force --purge
azd env new different-name
azd up
```

### ਕੋਟਾ ਪਾਰ
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 ਐਰਰ ਕੋਡ ਸੰਦਰਭ

| ਗਲਤੀ | ਕਾਰਨ | ਹੱਲ |
|-------|-------|----------|
| `AuthenticationError` | ਲੋਗਇਨ ਨਹੀਂ ਕੀਤਾ ਗਿਆ | `azd auth login` |
| `ResourceNotFound` | ਰਿਸੋਰਸ ਮੌਜੂਦ ਨਹੀਂ | ਰਿਸੋਰਸ ਨਾਂ ਜਾਂਚੋ |
| `QuotaExceeded` | ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ | ਕੋਟਾ ਵਾਧੇ ਦੀ ਬੇਨਤੀ ਕਰੋ |
| `InvalidTemplate` | Bicep ਸਿੰਟੈਕਸ ਗਲਤੀ | `az bicep build` |
| `Conflict` | ਰਿਸੋਰਸ ਮੌਜੂਦ ਹੈ | ਨਵਾਂ ਨਾਮ ਵਰਤੋ ਜਾਂ ਮਿਟਾ ਦਿਓ |
| `Forbidden` | ਕਾਫੀ ਅਨੁਮਤੀਆਂ ਨਹੀਂ | RBAC ਰੋਲਾਂ ਜਾਂਚੋ |

---

## 🔄 ਰੀਸੈਟ ਅਤੇ ਰਿਕਵਰੀ

```bash
# ਸਾਫਟ ਰੀਸੈੱਟ (ਸੰਸਾਧਨਾਂ ਨੂੰ ਰੱਖੋ, ਕੋਡ ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ)
azd deploy --force

# ਹਾਰਡ ਰੀਸੈੱਟ (ਸਭ ਕੁਝ ਮਿਟਾ ਦਿਓ, ਨਵੀਂ ਸ਼ੁਰੂਆਤ ਕਰੋ)
azd down --force --purge
azd up
```

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 6: ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ](../chapter-06-pre-deployment/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 8: ਉਤਪਾਦਨ](../chapter-08-production/README.md) |

---

## 📖 ਸੰਬੰਧਤ ਸਰੋਤ

- [ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਜਾਂਚਾਂ](../chapter-06-pre-deployment/preflight-checks.md)
- [ਕੰਫਿਗਰੇਸ਼ਨ ਗਾਈਡ](../chapter-03-configuration/configuration.md)
- [AZD GitHub ਮੁੱਦੇ](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰਨ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀ ਜਾਣਕਾਰੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਅਹਿਮ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਨਾਲ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->