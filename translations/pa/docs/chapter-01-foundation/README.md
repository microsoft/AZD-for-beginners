# ਅਧਿਆਇ 1: ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ

**📚 کورس**: [AZD ਸ਼ੁਰੂਆਤ ਲਈ](../../README.md) | **⏱️ ਸਮਾਂ**: ਪਹਿਲੀ ਡਿਪਲੋਇਮੈਂਟ ਸਹਿਤ 75-120 ਮਿੰਟ; ਵਾਧੂ ਅਭਿਆਸ ਲਈ ਵੱਧ ਸਮਾਂ ਲੱਗਦਾ ਹੈ | **⭐ ਜਟਿਲਤਾ**: ਸ਼ੁਰੂਆਤੀ

---

## ਝਲਕ

ਇਸ ਅਧਿਆਇ ਵਿੱਚ ਅਪਣੇ Azure Developer CLI (azd) ਦੀਆਂ ਬੁਨਿਆਦੀ ਜਾਣਕਾਰੀਆਂ ਮਿਲਣਗੀਆਂ। ਤੁਸੀਂ ਮੁੱਖ ਧਾਰਨਾ ਸਮਝੋਗੇ, ਟੂਲ ਇੰਸਟਾਲ ਕਰੋਂਗੇ, ਅਤੇ ਆਪਣਾ ਪਹਿਲਾ ਐਪਲੀਕੇਸ਼ਨ Azure 'ਤੇ ਡਿਪਲੋਇ ਕਰੋਂਗੇ।

> ਕਮਾਂਡ ਅਤੇ ਸੰਰਚਨਾ ਸਮੀਖਿਆ ਦਾ ਟੀਚਾ: `azd 1.37.2` (ਨਵੰਬਰ 2026)। ਸਮੀਖਿਆ ਦੌਰਾਨ ਲਾਈਵ Azure ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਨਹੀਂ ਚਲਾਈ ਗਈ ਸੀ।

## ਸਿੱਖਣ ਦੇ ਲਕੜੀ

ਇਸ ਅਧਿਆਇ ਨੂੰ ਪੂਰਾ ਕਰਨ ਨਾਲ, ਤੁਸੀਂ:
- ਸਮਝੋਗੇ ਕਿ Azure Developer CLI ਕੀ ਹੈ ਅਤੇ ਇਹ Azure CLI ਤੋਂ ਕਿਵੇਂ ਵੱਖਰਾ ਹੈ
- ਆਪਣੇ ਪਲੇਟਫਾਰ्म 'ਤੇ AZD ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਕੰਫਿਗਰ ਕਰਨਾ ਸਿਖੋਗੇ
- ਆਪਣਾ ਪਹਿਲਾ ਐਪਲੀਕੇਸ਼ਨ Azure 'ਤੇ `azd up` ਨਾਲ ਡਿਪਲੋਇ ਕਰੋ
- ਰਿਸੋਰਸਾਂ ਨੂੰ `azd down` ਨਾਲ ਸਾਫ਼ ਕਰੋ

---

## 📚 ਪਾਠ

| # | ਪਾਠ | ਵੇਰਵਾ | ਸਮਾਂ |
|---|--------|-------------|------|
| 1 | [AZD ਮੂਲ](azd-basics.md) | ਮੁੱਖ ਧਾਰਨਾ, ਸ਼ਬਦਾਵਲੀ, ਅਤੇ ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ | 15 ਮਿੰਟ |
| 2 | [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅੱਪ](installation.md) | ਪਲੇਟਫਾਰਮ-ਖਾਸ ਇੰਸਟਾਲੇਸ਼ਨ ਗਾਈਡ | 10 ਮਿੰਟ |
| 3 | [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) | ਹੱਥੋਂ-ਹੱਥ: Azure 'ਤੇ ਵੈੱਬ ਐਪ ਡਿਪਲੋਇ ਕਰੋ | 20 ਮਿੰਟ |
| 4 | [ਆਪਣੇ ਐਪ ਲਿਆਓ](bring-your-own-app.md) | ਆਪਣੇ ਮੌਜੂਦਾ ਪ੍ਰੋਜੈਕਟ ਵਿੱਚ azd ਸ਼ਾਮਿਲ ਕਰੋ | 15 ਮਿੰਟ |
| 5 | [ਡੈਵ ਕੰਟੇਨਰ ਅਤੇ ਕੋਡਸਪੇਸ](dev-containers.md) | ਡੈਵ ਕੰਟੇਨਰ ਦੇ ਨਾਲ ਦੁਹਰਾਏ ਜਾ ਸਕਣ ਵਾਲੇ azd ਵਾਤਾਵਰਣ | 15 ਮਿੰਟ |

---

## ✅ ਇੱਥੋਂ ਸ਼ੁਰੂ ਕਰੋ: ਆਪਣੀ ਸੈਟਅੱਪ ਨੂੰ ਸਹੀ ਕਰੋ

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਪੱਕਾ ਕਰੋ ਕਿ ਤੁਹਾਡੀ ਲੋਕਲ ਮਸ਼ੀਨ ਅਧਿਆਇ 1 ਟੈਮਪਲੇਟ ਲਈ ਤਿਆਰ ਹੈ:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

ਜੇ ਸਕ੍ਰਿਪਟ ਟੂਲਾਂ ਦੀ ਗੈਰਹਾਜ਼ਰੀ ਦਿਖਾਉਂਦੀ ਹੈ, ਪਹਿਲਾਂ ਉਹਨਾਂ ਨੂੰ ਠੀਕ ਕਰੋ ਫਿਰ ਅਧਿਆਇ ਜਾਰੀ ਰੱਖੋ।

---

## 🚀 ਤੇਜ਼ ਸ਼ੁਰੂਆਤ

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ ਸਫਲਤਾ ਦੇ ਮਾਨਕ

ਇਸ ਅਧਿਆਇ ਨੂੰ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਵੋਗੇ:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 ਜਾਂਚ ਅਤੇ ਸਰਕਾਅ

| ਦਿਸ਼ਾ | ਅਧਿਆਇ |
|-----------|---------|
| **ਅਗਲਾ** | [ਅਧਿਆਇ 2: AI-ਪਹਿਲੇ ਵਿਕਾਸ](../chapter-02-ai-development/README.md) |
| **ਛੱਡੋ** | [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ](../chapter-03-configuration/README.md) |

---

## 📖 ਸੰਬੰਧਿਤ ਸਰੋਤ

- [ਕਮਾਂਡ ਚੀਟ ਸ਼ੀਟ](../../resources/cheat-sheet.md)
- [ਪ੍ਰਸ਼ਨਾਵਲੀ](../../resources/faq.md)
- [ਸ਼ਬਦਾਵਲੀ](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->