# ਅਧਿਆਇ 4: ਕੋਡ ਰੂਪ ਵਿੱਚ ਇੰਫ੍ਰਾਸਟ੍ਰਕਚਰ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ

**📚 Course**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md) | **⏱️ Duration**: 1-1.5 hours | **⭐ Complexity**: Intermediate

---

## ਜਾਇਜ਼ਾ

ਇਸ ਅਧਿਆਇ ਵਿੱਚ Bicep ਟੈਮਪਲੇਟਾਂ ਨਾਲ Infrastructure as Code (IaC) ਪੈਟਰਨ, ਰਿਸੋਰਸ ਪ੍ਰੋਵਾਈਜ਼ਨਿੰਗ, ਅਤੇ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਨਾਲ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਕਵਰ ਕੀਤੀਆਂ ਗਈਆਂ ਹਨ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਅਧਿਆਇ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀ:
- Bicep ਟੈਮਪਲੇਟ ਦੀ ਬਣਤਰ ਅਤੇ ਸਿੰਟੈਕਸ ਸਮਝੋਗੇ
- `azd provision` ਨਾਲ Azure ਰਿਸੋਰਸ ਪ੍ਰੋਵਾਈਜ਼ਨ ਕਰੋਗੇ
- `azd deploy` ਨਾਲ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋਗੇ
- ਬਲੂ-ਗ੍ਰੀਨ ਅਤੇ ਰੋਲਿੰਗ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋਗੇ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [ਰਿਸੋਰਸਾਂ ਦੀ ਪ੍ਰੋਵਾਈਜ਼ਨ](provisioning.md) | AZD ਨਾਲ Azure ਰਿਸੋਰਸ ਪ੍ਰਬੰਧਨ | 45 ਮਿੰਟ |
| 2 | [ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md) | ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ | 45 ਮਿੰਟ |

---

## 🚀 ਤੇਜ਼ ਸ਼ੁਰੂਆਤ

```bash
# ਟੈਂਪਲੇਟ ਤੋਂ ਆਰੰਭ ਕਰੋ
azd init --template azure-functions-python-v2-http

# ਵੇਖੋ ਕਿ ਕੀ ਬਣਾਇਆ ਜਾਵੇਗਾ
azd provision --preview

# ਕੇਵਲ ਸੰਰਚਨਾ ਸਥਾਪਿਤ ਕਰੋ
azd provision

# ਕੇਵਲ ਕੋਡ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਜਾਂ ਦੋਵਾਂ ਇਕੱਠੇ
azd up
```

---

## 📁 AZD ਪ੍ਰੋਜੈਕਟ ਢਾਂਚਾ

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 ਅਹਮ ਕਮਾਂਡਾਂ

| Command | ਵੇਰਵਾ |
|---------|-------------|
| `azd init` | ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ |
| `azd provision` | Azure ਰਿਸੋਰਸ ਬਣਾਓ |
| `azd deploy` | ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੌਇ ਕਰੋ |
| `azd up` | provision + deploy |
| `azd down` | ਸਾਰੇ ਰਿਸੋਰਸ ਮਿਟਾਓ |

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| Direction | ਅਧਿਆਇ |
|-----------|---------|
| **Previous** | [ਅਧਿਆਇ 3: ਕੰਫਿਗਰੇਸ਼ਨ](../chapter-03-configuration/README.md) |
| **Next** | [ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ ਸਮਾਧਾਨ](../chapter-05-multi-agent/README.md) |

---

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਪ੍ਰੀ-ਡਿਪਲੌਇਮੈਂਟ ਜਾਂਚਾਂ](../chapter-06-pre-deployment/README.md)
- [ਕੰਟੇਨਰ ਐਪ ਉਦਾਹਰਣ](../../examples/container-app/README.md)
- [ਡੇਟਾਬੇਸ ਐਪ ਉਦਾਹਰਣ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਡਿਸਕਲੇਮਰ:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ AI ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਪਰ ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਪਸ਼ਟਤਾਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਮੌਜੂਦ ਅਸਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਵਜੋਂ ਮਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਨਾਜ਼ੁਕ ਜਾਂ ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਇਸਤੇਮਾਲ ਨਾਲ ਪੈਦਾਂ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤ-ਫ਼ਹਿਮੀਆਂ ਜਾਂ ਗਲਤ-ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->