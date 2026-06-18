# ਅਧਿਆਇ 7: ਸਮੱਸਿਆ ਨਿਵਾਰਣ ਅਤੇ ਡੀਬੱਗਿੰਗ

**📚 Course**: [AZD ਸ਼ੁਰੂਆਤ ਲਈ](../../README.md) | **⏱️ Duration**: 1-1.5 ਘੰਟੇ | **⭐ Complexity**: ਮੱਧਮ

---

## ਸਾਰ

ਇਹ ਅਧਿਆਇ ਤੁਹਾਨੂੰ Azure Developer CLI ਨਾਲ ਕੰਮ ਕਰਦੇ ਸਮੇਂ ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਤਸ਼ਖ਼ੀਸ ਅਤੇ ਹੱਲ ਕਰਨ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ। ਡਿਪਲਾਇਮੈਂਟ ਦੀਆਂ ਅਸਫਲਤਾਵਾਂ ਤੋਂ ਲੈ ਕੇ AI-ਖਾਸ ਸਮੱਸਿਆਵਾਂ ਤੱਕ।

> June 2026 ਵਿੱਚ `azd 1.25.6` ਨਾਲ ਪੁਸ਼ਟੀ ਕੀਤੀ ਗਈ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

By completing this chapter, you will:
- ਆਮ AZD ਡਿਪਲਾਇਮੈਂਟ ਅਸਫਲਤਾਵਾਂ ਦੀ ਤਸ਼ਖ਼ੀਸ ਕਰਨਾ
- ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਨੁਮਤੀ ਸਮੱਸਿਆਵਾਂ ਦੀ ਡੀਬੱਗਿੰਗ
- AI ਸਰਵਿਸ ਕਨੈਕਟਿਵਿਟੀ ਦੀਆਂ ਸਮੱਸਿਆਵਾਂ ਹੱਲ ਕਰਨਾ
- ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਲਈ Azure ਪੋਰਟਲ ਅਤੇ CLI ਵਰਤੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md) | ਅਕਸਰ ਸਾਹਮਣੇ ਆਉਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ | 30 ਮਿੰਟ |
| 2 | [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md) | ਕਦਮ-ਦਰ-ਕਦਮ ਡੀਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ | 45 ਮਿੰਟ |
| 3 | [AI ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ](ai-troubleshooting.md) | AI-ਖਾਸ ਸਮੱਸਿਆਵਾਂ | 30 ਮਿੰਟ |

---

## 🚨 ਤੁਰੰਤ ਸੁਧਾਰ

### ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ
```bash
# AZD ਵਰਕਫਲੋਜ਼ ਲਈ ਲਾਜ਼ਮੀ
azd auth login

# ਇਹ ਵਿਕਲਪ ਹੈ ਜੇ ਤੁਸੀਂ ਸਿੱਧੇ ਤੌਰ 'ਤੇ Azure CLI ਕਮਾਂਡਾਂ ਵੀ ਵਰਤ ਰਹੇ ਹੋ
az login

azd auth status
```

### ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਅਸਫਲਤਾਵਾਂ
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### ਰਿਸੋਰਸ ਸੰਘਰਸ਼
```bash
azd down --force --purge
azd env new different-name
azd up
```

### ਕੋਟਾ ਪਾਰ ਹੋ ਗਿਆ
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 ਐਰਰ ਕੋਡ ਰੈਫਰੰਸ

| ਐਰਰ | ਕਾਰਨ | ਹੱਲ |
|-------|-------|----------|
| `AuthenticationError` | ਲੌਗਇਨ ਨਹੀਂ | `azd auth login` |
| `ResourceNotFound` | ਸੰਸਾਧਨ ਮੌਜੂਦ ਨਹੀਂ | ਸੰਸਾਧਨਾਂ ਦੇ ਨਾਮ ਚੈੱਕ ਕਰੋ |
| `QuotaExceeded` | ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੀਮਾਵਾਂ | ਕੋਟਾ ਵਧਾਉਣ ਦੀ ਬੇਨਤੀ ਕਰੋ |
| `InvalidTemplate` | Bicep ਸਿੰਟੈਕਸ ਤ੍ਰੁੱਟੀ | `az bicep build` |
| `Conflict` | ਸੰਸਾਧਨ ਮੌਜੂਦ ਹੈ | ਨਵਾਂ ਨਾਮ ਵਰਤੋ ਜਾਂ ਹਟਾਓ |
| `Forbidden` | ਪਰਿਆਪਤ ਅਨੁਮਤੀਆਂ ਨਹੀਂ | RBAC ਭੂਮਿਕਾਵਾਂ ਦੀ ਜਾਂਚ ਕਰੋ |

---

## 🔄 ਰੀਸੈੱਟ ਅਤੇ ਰਿਕਵਰੀ

```bash
# ਸੌਫਟ ਰੀਸੈਟ (ਸਾਧਨਾਂ ਨੂੰ ਰੱਖੋ, ਕੋਡ ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ)
azd deploy --force

# ਹਾਰਡ ਰੀਸੈਟ (ਸਭ ਕੁਝ ਮਿਟਾਓ, ਨਵੀਂ ਸ਼ੁਰੂਆਤ ਕਰੋ)
azd down --force --purge
azd up
```

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **Previous** | [ਅਧਿਆਇ 6: ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ](../chapter-06-pre-deployment/README.md) |
| **Next** | [ਅਧਿਆਇ 8: ਉਤਪਾਦਨ](../chapter-08-production/README.md) |

---

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਪੂਰਵ-ਤਿਆਰੀ ਜਾਂਚ](../chapter-06-pre-deployment/preflight-checks.md)
- [ਕੰਫਿਗਰੇਸ਼ਨ ਗਾਈਡ](../chapter-03-configuration/configuration.md)
- [AZD GitHub ਇਸ਼ੂਜ਼](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->