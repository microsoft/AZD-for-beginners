# ਅਧਿਆਇ 4: ਇਨਫ੍ਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ ਅਤੇ ਤੈਨਾਤੀ

**📚 ਕੋਰਸ**: [ਆਰੰਭਿਕਾਂ ਲਈ AZD](../../README.md) | **⏱️ ਮਿਆਦ**: 1-1.5 ਘੰਟੇ | **⭐ ਜਟਿਲਤਾ**: ਮਧਮ

---

## ਜਾਇਜ਼ਾ

ਇਹ ਅਧਿਆਇ Bicep ਟੈਮਪਲੇਟਾਂ ਨਾਲ Infrastructure as Code (IaC) ਪੈਟਰਨ, ਸੰਸਾਧਨਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ, ਅਤੇ Azure Developer CLI ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਤੈਨਾਤੀ ਰਣਨੀਤੀਆਂ ਨੂੰ ਕਵਰ ਕਰਦਾ ਹੈ।

> ਜੂਨ 2026 ਵਿੱਚ `azd 1.25.6` ਨਾਲ ਪ੍ਰਮਾਣਿਤ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਅਧਿਆਇ ਨੂੰ ਪੂਰਾ ਕਰਨ 'ਤੇ, ਤੁਸੀਂ:
- Bicep ਟੈਮਪਲੇਟ ਦੀ ਬਣਤਰ ਅਤੇ ਸਿੰਟੈਕਸ ਨੂੰ ਸਮਝੋਗੇ
- `azd provision` ਨਾਲ Azure ਸੰਸਾਧਨ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰੋਗੇ
- `azd deploy` ਨਾਲ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰੋਗੇ
- blue-green ਅਤੇ rolling ਤੈਨਾਤੀ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋਗੇ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [ਸੰਸਾਧਨਾਂ ਦੀ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](provisioning.md) | AZD ਨਾਲ Azure ਸੰਸਾਧਨ ਪ੍ਰਬੰਧਨ | 45 ਮਿੰਟ |
| 2 | [ਡਿਪਲੌਏਮੈਂਟ ਗਾਈਡ](deployment-guide.md) | ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤੀ ਰਣਨੀਤੀਆਂ | 45 ਮਿੰਟ |
| 3 | [ਆਪਣੀ ਖੁਦ ਦੀ ਟੈਮਪਲੇਟ ਲਿਖਣਾ](custom-templates.md) | ਪੁਨਰਉਪਯੋਗ azd ਟੈਮਪਲੇਟ ਬਣਾਓ ਅਤੇ ਪ੍ਰਕਾਸ਼ਿਤ ਕਰੋ | 30 ਮਿੰਟ |

---

## 🚀 ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ

```bash
# ਟੈਮਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template azure-functions-python-v2-http

# ਜੋ ਬਣਾਇਆ ਜਾਵੇਗਾ ਉਸਦਾ ਪ੍ਰੀਵਿਊ
azd provision --preview

# ਕੇਵਲ ਢਾਂਚਾ ਮੁਹੱਈਆ ਕਰੋ
azd provision

# ਕੇਵਲ ਕੋਡ ਤੈਨਾਤ ਕਰੋ
azd deploy

# ਜਾਂ ਦੋਹਾਂ ਇਕੱਠੇ
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

## 🔧 ਜਰੂਰੀ ਕਮਾਂਡਾਂ

| Command | ਵੇਰਵਾ |
|---------|-------------|
| `azd init` | ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ |
| `azd provision` | Azure ਸੰਸਾਧਨ ਬਣਾਓ |
| `azd deploy` | ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਤੈਨਾਤ ਕਰੋ |
| `azd up` | ਪ੍ਰੋवਿਜ਼ਨ + ਤੈਨਾਤ |
| `azd down` | ਸਾਰੇ ਸੰਸਾਧਨ ਮਿਟਾਓ |

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ ਹੱਲ](../chapter-05-multi-agent/README.md) |

---

## 📖 ਸੰਬੰਧਤ ਸਰੋਤ

- [ਤੈਨਾਤ ਤੋਂ ਪਹਿਲਾਂ ਚੈੱਕ](../chapter-06-pre-deployment/README.md)
- [ਕੰਟੇਨਰ ਐਪ ਉਦਾਹਰਣਾਂ](../../examples/container-app/README.md)
- [ਡੇਟਾਬੇਸ ਐਪ ਉਦਾਹਰਣ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->