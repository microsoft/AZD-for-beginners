# Chapter 1: ਫਾਊਂਡੇਸ਼ਨ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ

**📚 Course**: [AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ](../../README.md) | **⏱️ Duration**: 30-45 ਮਿੰਟ | **⭐ Complexity**: ਸ਼ੁਰੂਆਤੀ

---

## ਓਵਰਵਿਊ

ਇਸ ਅਧਿਆਇ ਵਿੱਚ Azure Developer CLI (azd) ਦੇ ਮੁੱਢਲੇ ਸਿਧਾਂਤ ਪੇਸ਼ ਕੀਤੇ ਜਾਂਦੇ ਹਨ। ਤੁਸੀਂ ਮੁੱਖ ਧਾਰਣਾਵਾਂ ਸਿੱਖੋਗੇ, ਟੂਲ ਇੰਸਟਾਲ ਅਤੇ ਸੰਰਚਿਤ ਕਰਨਾ ਸਿੱਖੋਗੇ, ਅਤੇ ਆਪਣੀ ਪਹਿਲੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੋਇ ਕਰੋਗੇ।

> ਮਾਰਚ 2026 ਵਿੱਚ `azd 1.23.12` ਦੇ ਖਿਲਾਫ ਸੱਚਾਈ ਦੀ ਪੁਸ਼ਟੀ ਕੀਤੀ ਗਈ।

## Learning Objectives

By completing this chapter, you will:
- Azure Developer CLI ਕੀ ਹੈ ਅਤੇ ਇਹ Azure CLI ਤੋਂ ਕਿਵੇਂ ਵੱਖਰਾ ਹੈ, ਇਹ ਸਮਝੋ
- ਆਪਣੇ ਪਲੇਟਫਾਰਮ ਤੇ AZD ਨੂੰ ਇੰਸਟਾਲ ਅਤੇ ਸੰਰਚਿਤ ਕਰੋ
- ਆਪਣੀ ਪਹਿਲੀ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ `azd up` ਨਾਲ Azure 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ
- ਰਿਸੋਰਸਾਂ ਨੂੰ `azd down` ਨਾਲ ਸਾਫ ਕਰੋ

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [AZD ਬੁਨਿਆਦੀ](azd-basics.md) | ਮੁੱਖ ਧਾਰਣਾਵਾਂ, ਟਰਮੀਨੋਲੋਜੀ, ਅਤੇ ਪ੍ਰੋਜੈਕਟ ਸੰਰਚਨਾ | 15 ਮਿੰਟ |
| 2 | [ਇੰਸਟਾਲੇਸ਼ਨ & ਸੈਟਅਪ](installation.md) | ਪਲੇਟਫਾਰਮ-ਵਿਸ਼ੇਸ਼ ਇੰਸਟਾਲੇਸ਼ਨ ਗਾਈਡ | 10 ਮਿੰਟ |
| 3 | [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](first-project.md) | ਹੱਥੋਂ-ਹੱਥ: ਇੱਕ ਵੈੱਬ ਐਪ ਨੂੰ Azure 'ਤੇ ਡਿਪਲੋਇ ਕਰੋ | 20 ਮਿੰਟ |

---

## ✅ Start Here: Validate Your Setup

Before you begin, confirm that your local machine is ready for the Chapter 1 template:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ

```bash
# ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ ਕਰੋ
azd version

# AZD ਲਈ ਪ੍ਰਮਾਣੀਕਰਨ ਕਰੋ
# ਵਿਕਲਪਿਕ: ਜੇ ਤੁਸੀਂ ਸਿੱਧਾ Azure CLI ਕਮਾਂਡ ਚਲਾਉਣ ਦੀ ਯੋਜਨਾ ਬਣਾਉਂਦੇ ਹੋ ਤਾਂ az login
azd auth login

# ਆਪਣੀ ਪਹਿਲੀ ਐਪ ਤੈਨਾਤ ਕਰੋ
azd init --template todo-nodejs-mongo
azd up

# ਕੰਮ ਮੁਕੰਮਲ ਹੋਣ 'ਤੇ ਸਾਫ਼-ਸਫ਼ਾਈ ਕਰੋ
azd down --force --purge
```

---

## ✅ ਸਫਲਤਾ ਦੇ ਮਾਪਦੰਡ

After completing this chapter, you should be able to:

```bash
azd version              # ਇੰਸਟਾਲ ਕੀਤੀ ਗਈ ਵਰਜਨ ਦਿਖਾਉਂਦਾ ਹੈ
azd init --template todo-nodejs-mongo  # ਪ੍ਰੋਜੈਕਟ ਦੀ ਸ਼ੁਰੂਆਤ ਕਰਦਾ ਹੈ
azd up                   # Azure 'ਤੇ ਤੈਨਾਤ ਕਰਦਾ ਹੈ
azd show                 # ਚੱਲ ਰਹੇ ਐਪ ਦਾ URL ਦਿਖਾਉਂਦਾ ਹੈ
azd down --force --purge # ਸੰਸਾਧਨਾਂ ਨੂੰ ਸਾਫ ਕਰਦਾ ਹੈ
```

---

## 🔗 ਨੈਵੀਗੇਸ਼ਨ

| Direction | Chapter |
|-----------|---------|
| **Next** | [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../chapter-02-ai-development/README.md) |
| **Skip to** | [ਅਧਿਆਇ 3: ਕਨਫਿਗਰੇਸ਼ਨ](../chapter-03-configuration/README.md) |

---

## 📖 ਸਬੰਧਤ ਸਰੋਤ

- [ਕਮਾਂਡ ਚੀਟ-ਸ਼ੀਟ](../../resources/cheat-sheet.md)
- [ਅਕਸਰ ਪੁੱਛੇ ਜਾਣ ਵਾਲੇ ਸਵਾਲ (FAQ)](../../resources/faq.md)
- [ਸ਼ਬਦਕੋਸ਼](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ਇਹ ਦਸਤਾਵੇਜ਼ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਪ੍ਰਯਤਨ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਣਸਹੀਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਇਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਪ੍ਰਮਾਣਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਤੋਂ ਉਤਪੰਨ ਕਿਸੇ ਵੀ ਗਲਤਫਹਮੀ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->