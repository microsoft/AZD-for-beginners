# ਅਧਿਆਇ 4: ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ ਅਤੇ ਡਿਪਲੌਇਮੈਂਟ

**📚 ਕੋਰਸ**: [AZD ਫਾਰ ਬਿਗਿਨਰਜ਼](../../README.md) | **⏱️ ਮਿਆਦ**: 2-3 ਘੰਟੇ ਪੜ੍ਹਾਈ; ਡਿਪਲੌਇਮੈਂਟ ਪ੍ਰੈਕਟਿਸ ਲਈ ਵਾਧੂ ਸਮਾਂ ਲਵੋ | **⭐ ਜਟਿਲਤਾ**: ਦਰਮਿਆਨਾ

---

## ਝਲਕ

ਇਹ ਅਧਿਆਇ ਬਾਈਸਪ ਟੈਂਪਲੇਟਾਂ ਨਾਲ ਇੰਫ੍ਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ (IaC) ਨਮੂਨੇ, ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ, ਅਤੇ ਅਜੂਰ ਡਿਵੈਲਪਰ CLI ਨਾਲ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਨੂੰ ਕਵਰ ਕਰਦਾ ਹੈ।

> ਕਮਾਂਡ ਅਤੇ ਸੰਰਚਨਾ ਸਮੀਖਿਆ ਟਾਰਗੇਟ: `azd 1.37.2` (ਨਵੰਬਰ 2026)। ਸਮੀਖਿਆ ਦੌਰਾਨ ਲਾਈਵ ਅਜੂਰ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨਹੀਂ ਚਲਾਈ ਗਈ।

## ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼

ਇਸ ਅਧਿਆਇ ਨੂੰ ਪੂਰਾ ਕਰਨ ਨਾਲ, ਤੁਸੀਂ:
- ਬਾਈਸਪ ਟੈਂਪਲੇਟ ਦੀ ਬਣਤਰ ਅਤੇ ਵਿਆਕਰਨ ਸਮਝੋਗੇ
- `azd provision` ਨਾਲ ਅਜੂਰ ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨ ਕਰਨਾ ਸਿੱਖੋਗੇ
- `azd deploy` ਨਾਲ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੌਇ ਕਰਨਾ ਸਿੱਖੋਗੇ
- ਬਲੂ-ਗਰੀਨ ਅਤੇ ਰੋਲਿੰਗ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੀਆਂ ਜਾਵਣਗੀਆਂ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](provisioning.md) | AZD ਨਾਲ ਅਜੂਰ ਸਰੋਤ ਪ੍ਰਬੰਧਨ | 45 ਮਿੰਟ |
| 2 | [ਡਿਪਲੌਇਮੈਂਟ ਗਾਈਡ](deployment-guide.md) | ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ | 45 ਮਿੰਟ |
| 3 | [ਆਪਣਾ ਖੁਦ ਦਾ ਟੈਂਪਲੇਟ ਬਣਾਉਣਾ](custom-templates.md) | ਦੁਬਾਰਾ ਵਰਤਣ ਯੋਗ azd ਟੈਂਪਲੇਟ ਬਣਾਉਣਾ ਅਤੇ ਪ੍ਰਕਾਸ਼ਤ ਕਰਨਾ | 30 ਮਿੰਟ |

---

## 🚀 ਤੇਜ਼ ਸ਼ੁਰੂਆਤ

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 AZD ਪ੍ਰੋਜੈਕਟ ਬਣਤਰ

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

| ਕਮਾਂਡ | ਵੇਰਵਾ |
|---------|-------------|
| `azd init` | ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰੋ |
| `azd provision` | ਅਜੂਰ ਸਰੋਤ ਬਣਾਓ |
| `azd deploy` | ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਡਿਪਲੌਇ ਕਰੋ |
| `azd up` | ਪ੍ਰੋਵਿਜ਼ਨ + ਡਿਪਲੌਇ |
| `azd down` | ਸਾਰੇ ਸਰੋਤ ਹਟਾਓ |

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਪਿਛਲਾ** | [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/README.md) |
| **ਅਗਲਾ** | [ਅਧਿਆਇ 5: ਬਹੁ-ਏਜੰਟ ਹੱਲ](../chapter-05-multi-agent/README.md) |

---

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਪੂર્વ ਡਿਪਲੌਇਮੈਂਟ ਜਾਂਚਾਂ](../chapter-06-pre-deployment/README.md)
- [ਕੰਟੇਨਰ ਐਪ ਉਦਾਹਰਨਾਂ](../../examples/container-app/README.md)
- [ਡੇਟਾਬੇਸ ਐਪ ਉਦਾਹਰਨ](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->