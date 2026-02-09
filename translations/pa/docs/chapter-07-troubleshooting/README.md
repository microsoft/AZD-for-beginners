# Chapter 7: ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਡੀਬੱਗਿੰਗ

**📚 ਕੋਰਸ**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md) | **⏱️ ਅਵਧੀ**: 1-1.5 hours | **⭐ ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ

---

## ਝਲਕ

ਇਹ ਅਧਿਆਇ ਤੁਹਾਨੂੰ Azure Developer CLI ਨਾਲ ਕੰਮ ਕਰਦਿਆਂ ਆਮ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ ਕਰਨ ਅਤੇ ਉਹਨਾਂ ਦਾ ਹੱਲ ਲੱਭਣ ਵਿੱਚ ਮਦਦ ਕਰਦਾ ਹੈ। ਤੈਨਾਤੀ ਦੀਆਂ ਨਾਕਾਮੀਆਂ ਤੋਂ ਲੈ ਕੇ AI-ਖ਼ਾਸ ਸਮੱਸਿਆਵਾਂ ਤੱਕ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

By completing this chapter, you will:
- ਆਮ AZD ਡਿਪਲੋਇਮੈਂਟ ਨਾਕਾਮੀਆਂ ਦੀ ਪਛਾਣ ਕਰੋ
- ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਅਨੁਮਤੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਡੀਬੱਗ ਕਰੋ
- AI ਸੇਵਾ ਦੀ ਕਨੈਕਟਿਵਿਟੀ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ
- ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਲਈ Azure Portal ਅਤੇ CLI ਦੀ ਵਰਤੋਂ ਕਰੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [ਆਮ ਸਮੱਸਿਆਵਾਂ](common-issues.md) | ਅਕਸਰ ਹੋਣ ਵਾਲੀਆਂ ਸਮੱਸਿਆਵਾਂ | 30 min |
| 2 | [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](debugging.md) | ਕਦਮ ਦਰ ਕਦਮ ਡੀਬੱਗਿੰਗ ਰਣਨੀਤੀਆਂ | 45 min |
| 3 | [AI ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ](ai-troubleshooting.md) | AI-ਖ਼ਾਸ ਸਮੱਸਿਆਵਾਂ | 30 min |

---

## 🚨 ਤੁਰੰਤ ਹੱਲ

### ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ
```bash
azd auth login
az login
azd auth whoami
```

### ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਨਾਕਾਮੀਆਂ
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

### ਕੋਟਾ ਪਾਰ ਹੋ ਗਿਆ
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 ਐਰਰ ਕੋਡ ਰੈਫਰੈਂਸ

| ਐਰਰ | ਕਾਰਨ | ਹੱਲ |
|-------|-------|----------|
| `AuthenticationError` | ਲੌਗਇਨ ਨਹੀਂ ਕੀਤਾ ਗਿਆ | `azd auth login` |
| `ResourceNotFound` | ਸਰੋਤ ਮੌਜੂਦ ਨਹੀਂ | ਸਰੋਤਾਂ ਦੇ ਨਾਮ ਚੈੱਕ ਕਰੋ |
| `QuotaExceeded` | ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਦੀਆਂ ਸੀਮਾਵਾਂ | ਕੋਟਾ ਵਾਧੇ ਲਈ ਬੇਨਤੀ ਕਰੋ |
| `InvalidTemplate` | Bicep ਸਿੰਟੈਕਸ ਤਰੁਟੀ | `az bicep build` |
| `Conflict` | ਸਰੋਤ ਮੌਜੂਦ ਹੈ | ਨਵਾਂ ਨਾਮ ਵਰਤੋ ਜਾਂ ਮਿਟਾਓ |
| `Forbidden` | ਪਰਯਾਪਤ ਅਨੁਮਤੀਆਂ ਨਹੀਂ ਹਨ | RBAC ਰੋਲ ਜਾਂਚੋ |

---

## 🔄 ਰੀਸੈਟ ਅਤੇ ਰਿਕਵਰੀ

```bash
# ਸੌਫਟ ਰੀਸੈੱਟ (ਸੰਸਾਧਨਾਂ ਨੂੰ ਰੱਖੋ, ਕੋਡ ਨੂੰ ਮੁੜ ਤੈਨਾਤ ਕਰੋ)
azd deploy --force

# ਹਾਰਡ ਰੀਸੈੱਟ (ਸਭ ਕੁਝ ਮਿਟਾ ਦਿਓ, ਨਵੀਂ ਸ਼ੁਰੂਆਤ ਕਰੋ)
azd down --force --purge
azd up
```

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅධਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [Chapter 6: ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ](../chapter-06-pre-deployment/README.md) |
| **ਅਗਲਾ** | [Chapter 8: ਉਤਪਾਦਨ](../chapter-08-production/README.md) |

---

## 📖 ਸੰਬੰਧਤ ਸਰੋਤ

- [ਪੂਰਵ-ਡਿਪਲੋਇਮੈਂਟ ਜਾਂਚਾਂ](../chapter-06-pre-deployment/preflight-checks.md)
- [ਕੰਫਿਗਰੇਸ਼ਨ ਗਾਈਡ](../chapter-03-configuration/configuration.md)
- [AZD GitHub ਮੁੱਦੇ](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਡਿਸਕਲੇਮਰ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸਹੀਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸੱਚਾਈਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਹੀ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਸਮਝਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->