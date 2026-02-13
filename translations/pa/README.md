# AZD ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ: ਇੱਕ ਸੁਚਾਰੂ ਸਿੱਖਣ ਯਾਤਰਾ

![ਸ਼ੁਰੂਆਤੀਆਂ ਲਈ AZD](../../translated_images/pa/azdbeginners.5527441dd9f74068.webp) 

[![GitHub ਵਾਚਰ](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub ਫੋਰਕ](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub ਸਟਾਰ](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure ਡਿਸਕਾਰਡ](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry ਡਿਸਕਾਰਡ](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ਆਟੋਮੈਟਿਕ ਅਨੁਵਾਦ (ਸਦਾ ਅੱਪ-ਟੂ-ਡੇਟ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](./README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ਕੀ ਤੁਸੀਂ ਲੋਕਲੀ ਕਲੋਨ ਕਰਨਾ ਪਸੰਦ ਕਰੋਗੇ?**

> ਇਹ ਰਿਪੋਜ਼ਿਟਰੀ 50+ ਭਾਸ਼ਾ ਅਨੁਵਾਦ ਸ਼ਾਮਲ ਕਰਦੀ ਹੈ ਜੋ ਡਾਊਨਲੋਡ ਸਾਈਜ਼ ਨੂੰ ਕਾਫੀ ਵਧਾ ਦਿੰਦੇ ਹਨ। ਅਨੁਵਾਦਾਂ ਦੇ ਬਿਨਾਂ ਕਲੋਨ ਕਰਨ ਲਈ, sparse checkout ਵਰਤੋਂ:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ਇਹ ਤੁਹਾਨੂੰ ਕੋਰਸ ਪੂਰਾ ਕਰਨ ਲਈ ਲੋੜੀ ਦੀ ਸਾਰੀਆਂ ਚੀਜ਼ਾਂ ਦਿੰਦਾ ਹੈ ਅਤੇ ਡਾਊਨਲੋਡ ਬਹੁਤ ਤੇਜ਼ ਹੁੰਦਾ ਹੈ।
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) ਕੀ ਹੈ?

**Azure Developer CLI (azd)** ਇੱਕ ਡਿਵੈਲਪਰ-ਮਿੱਤਰ ਕਮਾਂਡ-ਲਾਈਨ ਟੂਲ ਹੈ ਜੋ Azure 'ਤੇ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੀਪਲੋਇ ਕਰਨਾ ਸੌਖਾ ਬਣਾਉਂਦਾ ਹੈ। ਬਹੁਤ ਸਾਰੇ Azure ਸਰੋਤਾਂ ਨੂੰ ਹੱਥੋਂ-ਹੱਥ ਬਣਾਉਣ ਅਤੇ ਜੋੜਨ ਦੀ ਬਜਾਏ, ਤੁਸੀਂ ਇੱਕ ਹੀ ਕਮਾਂਡ ਨਾਲ ਪੂਰੇ ਐਪਲਿਕੇਸ਼ਨ ਡੀਪਲੋਇ ਕਰ ਸਕਦੇ ਹੋ।

### `azd up` ਦੀ ਜਾਦੂਈ ਖਾਸੀਅਤ

```bash
# ਇਹ ਇਕੱਲਾ ਕਮਾਂਡ ਸਭ ਕੁਝ ਕਰਦਾ ਹੈ:
# ✅ ਸਾਰੇ ਅਜ਼ੁਰ ਸਾਧਨ ਬਣਾਉਂਦਾ ਹੈ
# ✅ ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਨੂੰ ਸੰਰਚਿਤ ਕਰਦਾ ਹੈ
# ✅ ਤੁਹਾਡੇ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਨੂੰ ਬਿਲਡ ਕਰਦਾ ਹੈ
# ✅ ਅਜ਼ੁਰ 'ਤੇ ਡਿਪਲੌਇ ਕਰਦਾ ਹੈ
# ✅ ਤੁਹਾਨੂੰ ਇੱਕ ਕੰਮ ਕਰਨ ਵਾਲੀ URL ਦਿੰਦਾ ਹੈ
azd up
```

**ਬੱਸ ਇਹੀ!** Azure ਪੋਰਟਲ 'ਤੇ ਕਲਿੱਕ ਕਰਨ ਦੀ ਲੋੜ ਨਹੀਂ, ਪਹਿਲਾਂ ਕੋਈ ਜਟਿਲ ARM ਟੈਮਪਲੇਟ ਸਿੱਖਣ ਦੀ ਲੋੜ ਨਹੀਂ, ਕੋਈ ਹੱਥੋਂ-ਹੱਥ ਸੰਰਚਨਾ ਨਹੀਂ - ਸਿਰਫ਼ Azure 'ਤੇ ਕੰਮ ਕਰ ਰਹੀਆਂ ਐਪਲੀਕੇਸ਼ਨਾਂ।

---

## ❓ Azure Developer CLI ਅਤੇ Azure CLI: ਫਰਕ ਕੀ ਹੈ?

ਇਹ ਨਵੀਆਂ ਸ਼ੁਰੂਆਤੀਆਂ ਵੱਲੋਂ ਸਭ ਤੋਂ ਆਮ ਪ੍ਰਸ਼ਨ ਹੈ। ਇੱਥੇ ਸਰਲ ਜਵਾਬ ਹੈ:

| ਫੀਚਰ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **ਮਕਸਦ** | ਇਕੱਲੇ Azure ਸਰੋਤਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ | ਪੂਰੇ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੀਪਲੋਇ ਕਰੋ |
| **ਮਨੋਭਾਵ** | ਇੰਫਰਾਸਟਰੱਕਚਰ-ਕੇਂਦਰਿਤ | ਐਪਲੀਕੇਸ਼ਨ-ਕੇਂਦਰਿਤ |
| **ਉਦਾਹਰਣ** | `az webapp create --name myapp...` | `azd up` |
| **ਸਿੱਖਣ ਦਾ ਢਲਾਨ** | Azure ਸੇਵਾਵਾਂ ਜਾਣਣੀਆਂ ਲਾਜ਼ਮੀ ਹਨ | ਸਿਰਫ਼ ਆਪਣੀ ਐਪ ਜਾਣੋ |
| **ਕਿਸ ਲਈ ਵਧੀਆ** | DevOps, ਇੰਫਰਾਸਟਰੱਕਚਰ | ਡਿਵੈਲਪਰ, ਪ੍ਰੋਟੋਟਾਇਪਿੰਗ |

### ਸਧਾਰਨ ਤੁਲਨਾ

- **Azure CLI** ਉਸ ਸਾਰੇ ਸੰਦਾਂ ਵਰਗਾ ਹੈ ਜੋ ਘਰ ਬਣਾਉਣ ਲਈ ਚਾਹੀਦੇ ਹੁੰਦੇ ਹਨ - ਹਥੌੜੇ, ਆਰੀਆਂ, ਕੀਲਾਂ। ਤੁਸੀਂ ਕੁਝ ਵੀ ਬਣਾ ਸਕਦੇ ਹੋ, ਪਰ ਤੁਹਾਨੂੰ ਨਿਰਮਾਣ ਦੀ ਸਮਝ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ।
- **Azure Developer CLI** ਇੱਕ ਠੇਕੇਦਾਰ ਰਿਹੈ - ਤੁਸੀਂ ਦੱਸ ਦਿੰਦੇ ਹੋ ਕਿ ਤੁਸੀਂ ਕੀ ਚਾਹੁੰਦੇ ਹੋ, ਅਤੇ ਉਹ ਨਿਰਮਾਣ ਸੰਭਾਲ ਲੈਂਦਾ ਹੈ।

### ਕਦੋਂ ਕਿਸ ਨੂੰ ਵਰਤਣਾ ਹੈ

| ਸਿਨੇਰੀਓ | ਇਹ ਵਰਤੋ |
|----------|----------|
| "ਮੈਂ ਆਪਣੀ ਵੈਬ ਐਪ ਨੂੰ ਤੇਜ਼ੀ ਨਾਲ ਡੀਪਲੋਇ ਕਰਨਾ ਚਾਹੁੰਦਾ/ਚਾਹੁੰਦੀ ਹਾਂ" | `azd up` |
| "ਮੈਨੂੰ ਸਿਰਫ਼ ਇੱਕ ਸਟੋਰੇਜ ਅਕਾਊਂਟ ਬਣਾਉਣੀ ਹੈ" | `az storage account create` |
| "ਮੈਂ ਇੱਕ ਪੂਰਾ AI ਐਪਲਿਕੇਸ਼ਨ ਬਣਾ ਰਿਹਾ/ਰਹੀ ਹਾਂ" | `azd init --template azure-search-openai-demo` |
| "ਮੈਨੂੰ ਕਿਸੇ ਵਿਸ਼ੇਸ਼ Azure ਸਰੋਤ ਦਾ ਡੀਬੱਗ ਕਰਨ ਦੀ ਲੋੜ ਹੈ" | `az resource show` |
| "ਮੈਂ ਕੁਝ ਮਿੰਟਾਂ ਵਿੱਚ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਡੀਪਲੋਇ ਚਾਹੁੰਦਾ/ਚਾਹੁੰਦੀ ਹਾਂ" | `azd up --environment production` |

### ਇਹ ਇਕੱਠੇ ਵੀ ਕੰਮ ਕਰਦੇ ਹਨ!

AZD ਥੱਲੇ Azure CLI ਦੀ ਵਰਤੋਂ ਕਰਦਾ ਹੈ। ਤੁਸੀਂ ਦੋਹਾਂ ਇਕੱਠੇ ਵਰਤ ਸਕਦੇ ਹੋ:
```bash
# ਆਪਣੀ ਐਪ ਨੂੰ AZD ਨਾਲ ਤੈਅ ਕਰੋ
azd up

# ਫਿਰ ਖਾਸ ਸਰੋਤਾਂ ਨੂੰ Azure CLI ਨਾਲ ਸੁਧਾਰੋ
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD ਵਿੱਚ ਟੈਮਪਲੇਟ ਲੱਭੋ

ਸਿਰੇ ਤੋਂ ਸ਼ੁਰੂ ਨਾ ਕਰੋ! **Awesome AZD** ਤਿਆਰ-ਕੀਤੇ-ਗਏ ਡੀਪਲੋਅ ਟੈਮਪਲੇਟਾਂ ਦਾ ਕਮੀਉਨਿਟੀ ਸੰਗ੍ਰਹਿ ਹੈ:

| ਸਰੋਤ | ਵਰਣਨ |
|----------|-------------|
| 🔗 [**Awesome AZD ਗੈਲੇਰੀ**](https://azure.github.io/awesome-azd/) | ਇੱਕ-ਕਲਿੱਕ ਡੀਪਲੋਇ ਨਾਲ 200+ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਬ੍ਰਾਊਜ਼ ਕਰੋ |
| 🔗 [**ਟੈਮਪਲੇਟ ਜਮ੍ਹਾਂ ਕਰੋ**](https://github.com/Azure/awesome-azd/issues) | ਆਪਣਾ ਟੈਮਪਲੇਟ ਕਮਿਊਨਿਟੀ ਨੂੰ ਦਾਨ ਕਰੋ |
| 🔗 [**GitHub ਰਿਪੋਜ਼ਿਟਰੀ**](https://github.com/Azure/awesome-azd) | ਸਟਾਰ ਕਰੋ ਅਤੇ ਸਰੋਤ ਨੂੰ ਖੰਗਾਲੋ |

### Awesome AZD ਤੋਂ ਲੋਕਪ੍ਰਿਯ AI ਟੈਮਪਲੇਟ

```bash
# ਐਜ਼ਯੂਰ ਓਪਨਏਆਈ + ਏਆਈ ਖੋਜ ਨਾਲ RAG ਗੱਲਬਾਤ
azd init --template azure-search-openai-demo

# ਤੇਜ਼ ਏਆਈ ਗੱਲਬਾਤ ਐਪਲੀਕੇਸ਼ਨ
azd init --template openai-chat-app-quickstart

# ਫਾਊਂਡਰੀ ਏਜੰਟਸ ਨਾਲ ਏਆਈ ਏਜੰਟਸ
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 ਕਦਮਾਂ ਵਿੱਚ ਸ਼ੁਰੂਆਤ

### ਕਦਮ 1: AZD ਇੰਸਟਾਲ ਕਰੋ (2 ਮਿੰਟ)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### ਕਦਮ 2: Azure ਵਿੱਚ ਲੌਗਿਨ ਕਰੋ

```bash
azd auth login
```

### ਕਦਮ 3: ਆਪਣੀ ਪਹਿਲੀ ਐਪ ਡੀਪਲੋਇ ਕਰੋ

```bash
# ਇੱਕ ਟੈਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo

# ਅਜ਼ੂਰੇ ‘ਤੇ ਡਿਪਲਾਈ ਕਰੋ (ਸڀ ਕੁਝ ਬਣਾਉਂਦਾ ਹੈ!)
azd up
```

**🎉 ਹੋ ਗਿਆ!** ਤੁਹਾਡੀ ਐਪ ਹੁਣ Azure 'ਤੇ ਲਾਈਵ ਹੈ।

### ਸਫਾਈ (ਭੁੱਲੋ ਨਹੀਂ!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 ਇਸ ਕੋਰਸ ਨੂੰ ਕਿਵੇਂ ਵਰਤਣਾ ਹੈ

ਇਹ ਕੋਰਸ **ਤਰੱਕੀਵਾਰ ਸਿੱਖਣ** ਲਈ ਡਿਜ਼ਾਈਨ ਕੀਤਾ ਗਿਆ ਹੈ - ਉਸ ਸਥਾਨ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ ਜਿੱਥੇ ਤੁਸੀਂ ਆਰਾਮਦਾਇਕ ਹੋ ਅਤੇ ਅੱਗੇ ਵਧੋ:

| ਤੁਹਾਡੇ ਦਾ ਅਨੁਭਵ | ਇੱਥੇ ਸ਼ੁਰੂ ਕਰੋ |
|-----------------|------------|
| **Azure ਵਿੱਚ ਬਿਲਕੁਲ ਨਵਾਂ** | [Chapter 1: Foundation](../..) |
| **Azure ਜਾਣਦੇ ਹੋ, AZD ਵਿੱਚ ਨਵੇਂ** | [Chapter 1: Foundation](../..) |
| **AI ਐਪ ਡੀਪਲੋਇ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ** | [Chapter 2: AI-First Development](../..) |
| **ਹੱਥ-ਅਨ ਪ੍ਰੈਕਟਿਸ ਚਾਹੀਦੀ ਹੈ** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 ਘੰਟੇ ਦਾ ਗਾਈਡ ਕੀਤਾ ਲੈਬ |
| **ਪ੍ਰੋਡਕਸ਼ਨ ਪੈਟਰਨ ਚਾਹੀਦੇ ਹਨ** | [Chapter 8: Production & Enterprise](../..) |

### ਤੁਰੰਤ ਸੈਟਅੱਪ

1. **ਇਸ ਰਿਪੋਜ਼ਿਟਰੀ ਨੂੰ Fork ਕਰੋ**: [![GitHub ਫੋਰਕ](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ਕਲੋਨ ਕਰੋ**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ਮਦਦ ਲਓ**: [Azure Discord ਕਮਿਊਨਿਟੀ](https://discord.com/invite/ByRwuEEgH4)

> **ਕੀ ਤੁਸੀਂ ਲੋਕਲੀ ਕਲੋਨ ਕਰਨਾ ਪਸੰਦ ਕਰੋਗੇ?**

> ਇਹ ਰਿਪੋਜ਼ਿਟਰੀ 50+ ਭਾਸ਼ਾ ਅਨੁਵਾਦ ਸ਼ਾਮਲ ਕਰਦੀ ਹੈ ਜੋ ਡਾਊਨਲੋਡ ਸਾਈਜ਼ ਨੂੰ ਕਾਫੀ ਵਧਾ ਦਿੰਦੇ ਹਨ। ਅਨੁਵਾਦਾਂ ਦੇ ਬਿਨਾਂ ਕਲੋਨ ਕਰਨ ਲਈ, sparse checkout ਵਰਤੋਂ:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ਇਹ ਤੁਹਾਨੂੰ ਕੋਰਸ ਪੂਰਾ ਕਰਨ ਲਈ ਲੋੜੀ ਦੀ ਸਾਰੀਆਂ ਚੀਜ਼ਾਂ ਦਿੰਦਾ ਹੈ ਅਤੇ ਡਾਊਨਲੋਡ ਬਹੁਤ ਤੇਜ਼ ਹੁੰਦਾ ਹੈ।


## ਕੋਰਸ ਓਵਰਵਿਊ

Azure Developer CLI (azd) ਨੂੰ ਰਚਨਾਤਮਕ ਅਧਿਆਇਆਂ ਰਾਹੀਂ ਮਾਸਟਰ ਕਰੋ ਜੋ ਤਰੱਕੀਵਾਰ ਸਿੱਖਣ ਲਈ ਬਣਾਏ ਗਏ ਹਨ। **Microsoft Foundry ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਨਾਲ AI ਐਪਲਿਕੇਸ਼ਨ ਡੀਪਲੋਇਮੈਂਟ 'ਤੇ ਖ਼ਾਸ ਧਿਆਨ।**

### ਆਧੁਨਿਕ ਡਿਵੈਲਪਰਾਂ ਲਈ ਇਹ ਕੋਰਸ ਕਿਉਂ ਜਰੂਰੀ ਹੈ

Microsoft Foundry Discord ਕਮਿਊਨਿਟੀ ਦੇ ਇਨਸਾਈਟਸ ਦੇ ਅਧਾਰ 'ਤੇ, **45% ਡਿਵੈਲਪਰ AZD ਨੂੰ AI ਵਰਕਲੋਡ ਲਈ ਵਰਤਣਾ ਚਾਹੁੰਦੇ ਹਨ** ਪਰ ਉਹਨਾਂ ਨੂੰ ਕੁਝ ਚੁਣੌਤੀਆਂ ਦਾ ਸਾਹਮਣਾ ਕਰਨਾ ਪੈਂਦਾ ਹੈ:
- ਕਈ-ਸੇਵਾ ਵਾਲੀਆਂ ਜਟਿੱਲ AI ਆਰਕੀਟੈਕਚਰਾਂ
- ਪ੍ਰੋਡਕਸ਼ਨ AI ਡੀਪਲੋਇਮੈਂਟ ਦੀਆਂ ਸ੍ਰੇਸ਼ਠ ਪ੍ਰਥਾਵਾਂ  
- Azure AI ਸੇਵਾਵਾਂ ਦਾ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਅਤੇ ਸੰਰਚਨਾ
- AI ਵਰਕਲੋਡ ਲਈ ਲਾਗਤ ਦੀ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ
- AI-ਖਾਸ ਡੀਪਲੋਇਮੈਂਟ ਮੁੱਦਿਆਂ ਦਾ ਟਰਬਲਸ਼ੂਟਿੰਗ

### ਸਿੱਖਣ ਦੇ ਲਕਸ਼

ਇਸ ਸੁਚਾਰੂ ਕੋਰਸ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- **AZD ਦੇ ਮੂਲ ਤਤਵਾਂ ਵਿੱਚ ਪਾਰੰਗਤ ਹੋਵੋਗੇ**: ਮੁੱਖ ਧਾਰਨਾਵਾਂ, ਇੰਸਟਾਲੇਸ਼ਨ, ਅਤੇ ਸੰਰਚਨਾ
- **AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੀਪਲੋਇ ਕਰੋ**: AZD ਨੂੰ Microsoft Foundry ਸੇਵਾਵਾਂ ਨਾਲ ਵਰਤ ਕੇ
- **Infrastructure as Code ਲਾਗੂ ਕਰੋ**: Azure ਸਰੋਤਾਂ ਨੂੰ Bicep templates ਨਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰੋ
- **ਡੀਪਲੋਇਮੈਂਟਸ ਦੀ ਟਰਬਲਸ਼ੂਟਿੰਗ ਕਰੋ**: ਆਮ ਸਮੱਸਿਆਵਾਂ ਹੱਲ ਕਰੋ ਅਤੇ ਡੀਬੱਗ ਕਰੋ
- **ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ**: ਸੁਰੱਖਿਆ, ਸਕੇਲਿੰਗ, ਮਾਨੀਟਰਿੰਗ, ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ
- **ਮਲਟੀ-ਏਜੰਟ ਸੌਲੂਸ਼ਨਾਂ ਬਣਾਓ**: ਜਟਿਲ AI ਆਰਕੀਟੈਕਚਰ ਡੀਪਲੋਇ ਕਰੋ

## 🗺️ ਕੋਰਸ ਮੈਪ: ਅਧਿਆਇ ਅਨੁਸਾਰ ਤੇਜ਼ ਨੇਵੀਗੇਸ਼ਨ

ਹਰੇਕ ਅਧਿਆਇ ਦਾ ਆਪਣਾ README ਹੈ ਜਿਸ ਵਿੱਚ ਸਿੱਖਣ ਦੇ ਉਦੇਸ਼, ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ ਅਤੇ ਅਭਿਆਸ ਹਨ:

| ਅਧਿਆਇ | ਵਿਸ਼ਾ | ਪਾਠ | ਸਮਾਂ | ਜਟਿਲਤਾ |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | ਸ਼ੁਰੂਆਤ | [AZD ਬੁਨਿਆਦੀ](docs/chapter-01-foundation/azd-basics.md) &#124; [ਇੰਸਟਾਲੇਸ਼ਨ](docs/chapter-01-foundation/installation.md) &#124; [ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-ਪਹਿਲੇ ਐਪ | [Foundry ਇੰਟੀਗ੍ਰੇਸ਼ਨ](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ਏਜੰਟ](docs/chapter-02-ai-development/agents.md) &#124; [ਮਾਡਲ ਡੀਪਲੋਇਮੈਂਟ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ਵਰਕਸ਼ਾਪ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | ਅਥਾਰਟੀ & ਸੁਰੱਖਿਆ | [ਕੰਫਿਗਰੇਸ਼ਨ](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & ਡੀਪਲੋਇਮੈਂਟ | [ਡੀਪਲੋਇਮੈਂਟ ਗਾਈਡ](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ਘੰਟੇ | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 ਘੰਟਾ | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ਘੰਟੇ | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 ਘੰਟੇ | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ਘੰਟੇ | ⭐⭐ |

**ਕੁੱਲ ਕੋਰਸ ਦੀ ਮਿਆਦ:** ~10-14 ਘੰਟੇ | **ਕੌਸ਼ਲ ਵਿਕਾਸ:** ਸ਼ੁਰੂਆਤੀ → ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ

---

## 📚 ਸਿੱਖਣ ਵਾਲੇ ਅਧਿਆਇ

*ਆਪਣੇ ਅਨੁਭਵ ਲੈਵਲ ਅਤੇ ਲਕਸ਼ਾਂ ਅਨੁਸਾਰ ਸਿੱਖਣ ਦਾ ਰਾਸ্তা ਚੁਣੋ*

### 🚀 Chapter 1: ਬੁਨਿਆਦ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ**: Azure ਸਬਸਕ੍ਰਿਪਸ਼ਨ, ਬੁਨਿਆਦੀ ਕਮਾਂਡ ਲਾਈਨ ਜਾਣਕਾਰੀ  
**ਮਿਆਦ**: 30-45 ਮਿੰਟ  
**ਕਠਿਨਾਈ**: ⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- Azure Developer CLI ਦੇ ਮੁੱਖ सिद्धांतਾਂ ਨੂੰ ਸਮਝਣਾ
- ਆਪਣੇ ਪਲੇਟਫਾਰਮ 'ਤੇ AZD ਇੰਸਟਾਲ ਕਰਨਾ
- ਆਪਣੀ ਪਹਿਲੀ ਸਫਲ ਡੀਪਲੌਇਮੈਂਟ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **🎯 ਇੱਥੇ ਸ਼ੁਰੂ ਕਰੋ**: [What is Azure Developer CLI?](../..)
- **📖 ਥਿਊਰੀ**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - ਮੁੱਖ ਧਾਰਣਾਵਾਂ ਅਤੇ ਸ਼ਬਦਾਵਲੀ
- **⚙️ ਸੈਟਅਪ**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - ਪਲੇਟਫਾਰਮ-ਨਿਰਧਾਰਤ ਗਾਈਡ
- **🛠️ ਹੱਥ-ਅਨੁਭਵ**: [Your First Project](docs/chapter-01-foundation/first-project.md) - ਕਦਮ-ਦਰ-ਕਦਮ ਟਿਊਟੋਰਿਅਲ
- **📋 ਤੁਰੰਤ ਸੰਦਰਭ**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### ਵਿਆਵਹਾਰਿਕ ਅਭਿਆਸ
```bash
# ਤੇਜ਼ ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਜਾਂਚ
azd version

# ਆਪਣਾ ਪਹਿਲਾ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
azd init --template todo-nodejs-mongo
azd up
```

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: AZD ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure 'ਤੇ ਇੱਕ ਸਧਾਰਨ ਵੈੱਬ ਐਪਲੀਕੇਸ਼ਨ ਸਫਲਤਾਪੂਰਵਕ ਡੀਪਲੋਇ ਕਰੋ

**✅ ਸਫਲਤਾ ਪ੍ਰਮਾਣੀਕਰਨ:**
```bash
# ਅਧਿਆਇ 1 ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਇਹ ਕਰਨ ਯੋਗ ਹੋਵੋਗੇ:
azd version              # ਸਥਾਪਤ ਵਰਜਨ ਦਿਖਾਉਂਦਾ ਹੈ
azd init --template todo-nodejs-mongo  # ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਸ਼ੁਰੂ ਕਰਦਾ ਹੈ
azd up                  # Azure 'ਤੇ ਤੈਨਾਤ ਕਰਦਾ ਹੈ
azd show                # ਚੱਲ ਰਹੀ ਐਪ ਦਾ URL ਦਿਖਾਉਂਦਾ ਹੈ
# ਐਪ ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਖੁਲਦੀ ਹੈ ਅਤੇ ਸਹੀ ਤਰ੍ਹਾਂ ਕੰਮ ਕਰਦੀ ਹੈ
azd down --force --purge  # ਸੰਸਾਧਨਾਂ ਨੂੰ ਸਾਫ਼ ਕਰਦਾ ਹੈ
```

**📊 ਸਮਾਂ ਨਿਵੇਸ਼:** 30-45 ਮਿੰਟ  
**📈 ਬਾਅਦ ਦੀ ਕੌਸ਼ਲ ਸਤਰ:** ਬੁਨਿਆਦੀ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਡੀਪਲੋ ਕਰਨ ਯੋਗ

**✅ ਸਫਲਤਾ ਪ੍ਰਮਾਣੀਕਰਨ:**
```bash
# ਅਧਿਆਇ 1 ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਇਹ ਕਰਨ ਯੋਗ ਹੋਵੋਗੇ:
azd version              # ਸਥਾਪਤ ਵਰਜਨ ਦਿਖਾਉਂਦਾ ਹੈ
azd init --template todo-nodejs-mongo  # ਪ੍ਰੋਜੈਕਟ ਨੂੰ ਆਰੰਭ ਕਰਦਾ ਹੈ
azd up                  # Azure ਉੱਤੇ ਤੈਨਾਤ ਕਰਦਾ ਹੈ
azd show                # ਚੱਲ ਰਹੀ ਐਪ ਦਾ URL ਦਿਖਾਉਂਦਾ ਹੈ
# ਐਪਲੀਕੇਸ਼ਨ ਬਰਾਊਜ਼ਰ ਵਿੱਚ ਖੁਲਦੀ ਹੈ ਅਤੇ ਸਹੀ ਤਰ੍ਹਾਂ ਕੰਮ ਕਰਦੀ ਹੈ
azd down --force --purge  # ਸੰਸਾਧਨਾਂ ਨੂੰ ਸਾਫ਼ ਕਰਦਾ ਹੈ
```

**📊 ਸਮਾਂ ਨਿਵੇਸ਼:** 30-45 ਮਿੰਟ  
**📈 ਬਾਅਦ ਦੀ ਕੌਸ਼ਲ ਸਤਰ:** ਬੁਨਿਆਦੀ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਡੀਪਲੋ ਕਰਨ ਯੋਗ

---

### 🤖 Chapter 2: AI-ਪਹਿਲ ਵਿਕਾਸ (AI ਡਿਵੈਲਪਰਾਂ ਲਈ ਸਿਫਾਰਸ਼)
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ**: Chapter 1 ਪੂਰਾ ਹੋਇਆ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ  
**ਮਿਆਦ**: 1-2 ਘੰਟੇ  
**ਕਠਿਨਾਈ**: ⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- Microsoft Foundry ਦਾ AZD ਨਾਲ ਇੰਟੇਗਰੇਸ਼ਨ
- AI ਸਮਰਥਿਤ ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਡੀਪਲੌਇਮੈਂਟ
- AI ਸਰਵਿਸ ਵਿੰਯਾਸ (configurations) ਦੀ ਸਮਝ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **🎯 ਇੱਥੇ ਸ਼ੁਰੂ ਕਰੋ**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ਏਜੰਟ**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - AZD ਨਾਲ ਇੰਟੈਲੀਜੈਂਟ ਏਜੰਟ ਡੀਪਲੋ ਕਰੋ
- **📖 ਪੈਟਰਨ**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - AI ਮਾਡਲ ਡੀਪਲੋ ਅਤੇ ਪ੍ਰਬੰਧ ਕਰੋ
- **🛠️ ਵਰਕਸ਼ਾਪ**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - ਆਪਣੀਆਂ AI ਹੱਲਾਂ ਨੂੰ AZD-ਤਿਆਰ ਬਣਾਓ
- **🎥 ਇੰਟਰਐਕਟਿਵ ਗਾਈਡ**: [Workshop Materials](workshop/README.md) - MkDocs * DevContainer ਵਾਤਾਵਰਨ ਦੇ ਨਾਲ ਬਰਾਊਜ਼ਰ-ਅਧਾਰਤ ਸਿੱਖਿਆ
- **📋 ਟੈਮਪਲੇਟ**: [Microsoft Foundry Templates](../..)
- **📝 ਉਦਾਹਰਣ**: [AZD Deployment Examples](examples/README.md)

#### ਵਿਆਵਹਾਰਿਕ ਅਭਿਆਸ
```bash
# ਆਪਣਾ ਪਹਿਲਾ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ তੈਨਾਤ ਕਰੋ
azd init --template azure-search-openai-demo
azd up

# ਹੋਰ ਏਆਈ ਟੈਮਪਲੇਟਾਂ ਅਜ਼ਮਾਓ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: RAG ਸਮਰੱਥਾਵਾਂ ਵਾਲੀ ਇੱਕ AI-ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਡੀਪਲੋ ਅਤੇ ਕਾਂਫਿਗਰ ਕਰੋ

**✅ ਸਫਲਤਾ ਪ੍ਰਮਾਣੀਕਰਨ:**
```bash
# ਅਧਿਆਇ 2 ਦੇ ਬਾਅਦ, ਤੁਸੀਂ ਇਹ ਕਰਨ ਯੋਗ ਹੋਵੋਗੇ:
azd init --template azure-search-openai-demo
azd up
# ਏਆਈ ਚੈਟ ਇੰਟਰਫੇਸ ਦੀ ਜਾਂਚ ਕਰੋ
# ਸਵਾਲ ਪੁੱਛੋ ਅਤੇ ਸਰੋਤਾਂ ਸਮੇਤ ਏਆਈ-ਸਮਰਥਿਤ ਜਵਾਬ ਪ੍ਰਾਪਤ ਕਰੋ
# ਖੋਜ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਕੰਮ ਕਰਦੀ ਹੈ ਜਾਂ ਨਹੀਂ, ਇਸ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd monitor  # ਜਾਂਚੋ ਕਿ ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਟੈਲੀਮੇਟਰੀ ਦਿਖਾ ਰਿਹਾ ਹੈ
azd down --force --purge
```

**📊 ਸਮਾਂ ਨਿਵੇਸ਼:** 1-2 ਘੰਟੇ  
**📈 ਬਾਅਦ ਦੀ ਕੌਸ਼ਲ ਸਤਰ:** ਉਤਪਾਦ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੀਪਲੋ ਅਤੇ ਕਾਂਫਿਗਰ ਕਰਨ ਯੋਗ  
**💰 ਖਰਚ ਜਾਣਕਾਰੀ:** ਵਿਕਾਸ ਲਈ $80-150/ਮਹੀਨਾ, ਉਤਪਾਦ ਲਈ $300-3500/ਮਹੀਨਾ ਦੀ ਸਮਝ

#### 💰 AI ਡੀਪਲੌਇਮੈਂਟ ਲਈ ਖਰਚ ਵਿਚਾਰ

**ਵਿਕਾਸ ਵਾਤਾਵਰਨ (ਅੰਦਾਜ਼ਾ $80-150/ਮਹੀਨਾ):**
- Azure OpenAI (Pay-as-you-go): $0-50/ਮਹੀਨਾ (ਟੋਕਨ ਵਰਤੋਂ ਦੇ ਅਧਾਰ 'ਤੇ)
- AI Search (Basic tier): $75/ਮਹੀਨਾ
- Container Apps (Consumption): $0-20/ਮਹੀਨਾ
- Storage (Standard): $1-5/ਮਹੀਨਾ

**ਉਤਪਾਦ ਵਾਤਾਵਰਨ (ਅੰਦਾਜ਼ਾ $300-3,500+/ਮਹੀਨਾ):**
- Azure OpenAI (PTU for consistent performance): $3,000+/ਮਹੀਨਾ ਜਾਂ ਊੱਚੀ ਵਰਤੋਂ ਨਾਲ Pay-as-go
- AI Search (Standard tier): $250/ਮਹੀਨਾ
- Container Apps (Dedicated): $50-100/ਮਹੀਨਾ
- Application Insights: $5-50/ਮਹੀਨਾ
- Storage (Premium): $10-50/ਮਹੀਨਾ

**💡 ਖਰਚ ਠੀਕ ਕਰਨ ਦੇ ਸੁਝਾਅ:**
- ਸਿੱਖਣ ਲਈ **Free Tier** Azure OpenAI ਵਰਤੋ (50,000 ਟੋਕਨ/ਮਹੀਨਾ ਸ਼ਾਮਲ)
- ਸਰੋਤਾਂ ਨੂੰ ਅਣ-ਸਰਗਰਮ ਦੇਣ ਲਈ `azd down` ਚਲਾਓ
- consumption-ਅਧਾਰਤ ਬਿਲਿੰਗ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ, ਸਿਰਫ ਉਤਪਾਦ ਲਈ PTU ਤੇ ਅਪਗਰੇਡ ਕਰੋ
- ਡੀਪਲੌਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਖਰਚਾਂ ਦਾ ਅੰਦਾਜ਼ਾ ਲਗਾਉਣ ਲਈ `azd provision --preview` ਵਰਤੋ
- ਆਟੋ-ਸਕੇਲਿੰਗ ਯੋਗ ਕਰੋ: ਸਿਰਫ ਅਸਲ ਵਰਤੋਂ ਲਈ ਭੁਗਤਾਨ ਕਰੋ

**ਖਰਚ ਨਿਗਰਾਨੀ:**
```bash
# ਅੰਦਾਜ਼ੀ ਮਹੀਨਾਵਾਰ ਖਰਚੇ ਚੈੱਕ ਕਰੋ
azd provision --preview

# Azure Portal ਵਿੱਚ ਵਾਸਤਵਿਕ ਖਰਚਿਆਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: ਕਾਂਫਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ**: Chapter 1 ਪੂਰਾ ਹੋਇਆ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ  
**ਮਿਆਦ**: 45-60 ਮਿੰਟ  
**ਕਠਿਨਾਈ**: ⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਵਾਤਾਵਰਨ ਕਾਂਫਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਬੰਧਨ
- ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸੁੱਖਿਆ ਦੀਆਂ ਸਰਵੋਤਮ ਪ੍ਰਥਾਵਾਂ
- ਸਰੋਤ ਨਾਂਕਰਨ ਅਤੇ ਸੰਗਠਨ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **📖 ਕਾਂਫਿਗਰੇਸ਼ਨ**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - ਵਾਤਾਵਰਨ ਸੈਟਅਪ
- **🔐 ਸੁਰੱਖਿਆ**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - ਪ੍ਰਮਾਣਿਕਤਾ ਪੈਟਰਨ
- **📝 ਉਦਾਹਰਣ**: [Database App Example](examples/database-app/README.md) - AZD ਡੇਟਾਬੇਸ ਉਦਾਹਰਣ

#### ਵਿਆਵਹਾਰਿਕ ਅਭਿਆਸ
- ਕਈ ਵਾਤਾਵਰਣ ਬਣਾਓ (dev, staging, prod)
- managed identity ਪ੍ਰਮਾਣਿਕਤਾ ਸੈਟਅਪ ਕਰੋ
- ਵਾਤਾਵਰਨ-ਨਿਰਧਾਰਤ ਕਾਂਫਿਗਰੇਸ਼ਨ ਲਾਗੂ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਉੱਚਤ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸੁਰੱਖਿਆ ਨਾਲ ਕਈ ਵਾਤਾਵਰਣਾਂ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ**: Chapters 1-3 ਪੂਰੇ ਹੋਣੇ ਚਾਹੀਦੇ ਹਨ  
**ਮਿਆਦ**: 1-1.5 ਘੰਟੇ  
**ਕਠਿਨਾਈ**: ⭐⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਉन्नਤ ਡੀਪਲੌਇਮੈਂਟ ਪੈਟਰਨ
- Bicep ਨਾਲ Infrastructure as Code
- ਸਰੋਤ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਰਣਨੀਤੀਆਂ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **📖 ਡੀਪਲੌਇਮੈਂਟ**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - ਪੂਰੇ ਵਰਕਫਲੋ
- **🏗️ ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure ਸਰੋਤ ਪ੍ਰਬੰਧਨ
- **📝 ਉਦਾਹਰਣ**: [Container App Example](../../examples/container-app) - ਕੰਟੇਨਰাইজਡ ਡੀਪਲੌਇਮੈਂਟ

#### ਵਿਆਵਹਾਰਿਕ ਅਭਿਆਸ
- ਕਸਟਮ Bicep ਟੈਮਪਲੇਟ ਬਣਾਓ
- ਬਹੁ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੀਪਲੋ ਕਰੋ
- ਬਲੂ-ਗ੍ਰੀਨ ਡੀਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਲਾਗੂ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਕਸਟਮ ਇੰਫਰਾਸਟਰਕਚਰ ਟੈਮਪਲੇਟ ਦੀ ਵਰਤੋਂ ਨਾਲ ਜਟਿਲ ਬਹੁ-ਸੇਵਾ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੀਪਲੋ ਕਰੋ

---

### 🎯 Chapter 5: ਬਹੁ-ਏਜੰਟ AI ਹੱਲ (ਐਡਵਾਂਸਡ)
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ**: Chapters 1-2 ਪੂਰੇ ਹੋਣੇ ਚਾਹੀਦੇ ਹਨ  
**ਮਿਆਦ**: 2-3 ਘੰਟੇ  
**ਕਠਿਨਾਈ**: ⭐⭐⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਬਹੁ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ ਪੈਟਰਨ
- ਏਜੰਟ ਅੋਰਕੇਸਟੀਰੇਸ਼ਨ ਅਤੇ ਸਮਨੁਵਯ
- ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਡੀਪਲੌਇਮੈਂਟ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **🤖 ਫੀਚਰ ਕੀਤੇ ਪ੍ਰੋਜੈਕਟ**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - ਪੂਰੀ ਇੰਪਲੀਮੈਂਟੇਸ਼ਨ
- **🛠️ ARM ਟੈਮਪਲੇਟ**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - ਇਕ-ਕਲਿੱਕ ਡੀਪਲੌਇਮੈਂਟ
- **📖 ਆਰਕੀਟੈਕਚਰ**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - ਪੈਟਰਨ

#### ਵਿਆਵਹਾਰਿਕ ਅਭਿਆਸ
```bash
# ਸੰਪੂਰਨ ਖੁਦਰਾ ਬਹੁ-ਏਜੰਟ ਸਮਾਧਾਨ ਨੂੰ ਤੈਨਾਤ ਕਰੋ
cd examples/retail-multiagent-arm-template
./deploy.sh

# ਏਜੰਟ ਸੰਰਚਨਾਵਾਂ ਦੀ ਖੋਜ ਕਰੋ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: Customer ਅਤੇ Inventory ਏਜੰਟਾਂ ਨਾਲ ਇੱਕ ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਬਹੁ-ਏਜੰਟ AI ਹੱਲ ਨੂੰ ਡੀਪਲੋ ਅਤੇ ਪ੍ਰਬੰਧ ਕਰੋ

---

### 🔍 Chapter 6: ਪ੍ਰੀ-ਡੀਪਲੌਇਮੈਂਟ ਵੈਧਤਾ ਅਤੇ ਯੋਜਨਾ
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ**: Chapter 4 ਪੂਰਾ ਹੋਇਆ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ  
**ਮਿਆਦ**: 1 ਘੰਟਾ  
**ਕਠਿਨਾਈ**: ⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਸਮਰੱਥਾ ਯੋਜਨਾ ਅਤੇ ਸਰੋਤ ਵੈਧਤਾ
- SKU ਚੋਣ ਰਣਨੀਤੀਆਂ
- ਪ੍ਰੀ-ਫਲਾਈਟ ਚੈੱਕਸ ਅਤੇ ਆਟੋਮੇਸ਼ਨ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **📊 ਯੋਜਨਾ**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - ਸਰੋਤ ਵੈਧਤਾ
- **💰 ਚੋਣ**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - ਲਾਗਤ-ਕੁਸ਼ਲ ਚੋਣਾਂ
- **✅ ਵੈਧਤਾ**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - ਆਟੋਮੇਟਿਡ ਸਕ੍ਰਿਪਟ

#### ਵਿਆਵਹਾਰਿਕ ਅਭਿਆਸ
- ਸਮਰੱਥਾ ਵੈਧਤਾ ਸਕ੍ਰਿਪਟ ਚਲਾਓ
- ਲਾਗਤ ਲਈ SKU ਚੋਣਾਂ ਨੂੰ ਅਨੁਕੂਲ ਬਣਾਓ
- ਆਟੋਮੈਟਿਕ ਪ੍ਰੀ-ਡੀਪਲੌਇਮੈਂਟ ਚੈਕ ਲਾਗੂ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਨਿਯਤੀ ਤੋਂ ਪਹਿਲਾਂ ਡੀਪਲੌਇਮੈਂਟਾਂ ਨੂੰ ਵੈਧ ਅਤੇ ਅਨੁਕੂਲ ਕਰੋ

---

### 🚨 Chapter 7: ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ ਅਤੇ ਡੀਬੱਗਿੰਗ
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ**: ਕੋਈ ਵੀ ਡੀਪਲੌਇਮੈਂਟ ਅਧਿਆਇ ਪੂਰਾ ਹੋਇਆ ਹੋ ਸਕਦਾ ਹੈ  
**ਮਿਆਦ**: 1-1.5 ਘੰਟੇ  
**ਕਠਿਨਾਈ**: ⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਵਿਧਿਅਨੁਕ ਅਨੁਸਾਰ ਡੀਬੱਗਿੰਗ 접근
- ਆਮ ਮੁਸ਼ਕਲਾਂ ਅਤੇ ਉਨ੍ਹਾਂ ਦੇ ਹੱਲ
- AI-ਨਿਰਧਾਰਤ ਟ੍ਰਬਲਸ਼ੂਟਿੰਗ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **🔧 ਆਮ ਮੁਸ਼ਕਲਾਂ**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ ਅਤੇ ਹੱਲ
- **🕵️ ਡੀਬੱਗਿੰਗ**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - ਕਦਮ-ਦਰ-ਕਦਮ ਰਣਨੀਤੀਆਂ
- **🤖 AI ਮੁਸ਼ਕਲਾਂ**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI ਸਰਵਿਸ ਸਮੱਸਿਆਵਾਂ

#### ਵਿਆਵਹਾਰਿਕ ਅਭਿਆਸ
- ਡੀਪਲੌਇਮੈਂਟ ਨਾਕਾਮੀਆਂ ਦੀ ਪਛਾਣ ਕਰੋ
- ਪ੍ਰਮਾਣਿਕਤਾ ਮੁੱਦਿਆਂ ਦੇ ਹੱਲ ਕਰੋ
- AI ਸਰਵਿਸ ਕਨੈਕਟਿਵਿਟੀ ਡੀਬੱਗ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਆਮ ਡੀਪਲੌਇਮੈਂਟ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਤੰਤਰ ਤੌਰ 'ਤੇ ਪਛਾਣ ਅਤੇ ਹੱਲ ਕਰੋ

---

### 🏢 Chapter 8: ਪ੍ਰੋਡਕਸ਼ਨ ਅਤੇ ਐਂਟਰਪਰਾਈਜ਼ ਪੈਟਰਨ
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ**: Chapters 1-4 ਪੂਰੇ ਹੋਣੇ ਚਾਹੀਦੇ ਹਨ  
**ਮਿਆਦ**: 2-3 ਘੰਟੇ  
**ਕਠਿਨਾਈ**: ⭐⭐⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਪ੍ਰੋਡਕਸ਼ਨ ਡੀਪਲੌਇਮੈਂਟ ਰਣਨੀਤੀਆਂ
- ਐਂਟਰਪਰਾਈਜ਼ ਸੁਰੱਖਿਆ ਪੈਟਰਨ
- ਮਾਨੀਟਰਿੰਗ ਅਤੇ ਖਰਚ ਠੀਕ ਕਰਨਾ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **🏭 ਪ੍ਰੋਡਕਸ਼ਨ**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - ਐਂਟਰਪਰਾਈਜ਼ ਪੈਟਰਨ
- **📝 ਉਦਾਹਰਣ**: [Microservices Example](../../examples/microservices) - ਜਟਿਲ ਆਰਕੀਟੈਕਚਰ
- **📊 ਮਾਨੀਟਰਿੰਗ**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - ਮਾਨੀਟਰਿੰਗ

#### ਵਿਆਵਹਾਰਿਕ ਅਭਿਆਸ
- ਐਂਟਰਪਰਾਈਜ਼ ਸੁਰੱਖਿਆ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
- ਵਿਸਤ੍ਰਿਤ ਮਾਨੀਟਰਿੰਗ ਸੈਟਅਪ ਕਰੋ
- ਪ੍ਰੋਡਕਸ਼ਨ ਵਿੱਚ ਠੀਕ ਗਵਰਨੈਂਸ ਨਾਲ ਡੀਪਲੋ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਪੂਰੀ ਪ੍ਰੋਡਕਸ਼ਨ ਯੋਗਤਾਵਾਂ ਨਾਲ ਐਂਟਰਪਰਾਈਜ਼-ਤਿਆਰ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡੀਪਲੋ ਕਰੋ

---

## 🎓 ਵਰਕਸ਼ਾਪ ਓਵਰਵਿਊ: ਹੱਥ-ਅਨੁਭਵਕ ਸਿੱਖਣ ਅਨੁਭਵ

> **⚠️ ਵਰਕਸ਼ਾਪ ਸਥਿਤੀ: ਵਿਕਾਸ ਰਾਹ 'ਤੇ**  
> ਵਰਕਸ਼ਾਪ ਸਮਗਰੀ ਇਸ ਸਮੇਂ ਵਿਕਸਤ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ ਅਤੇ ਨਿਰਧਾਰਤ ਕੀਤੀ ਜਾ ਰਹੀ ਹੈ। ਮੁੱਖ ਮਾਡਿਊਲ ਕਾਰਗਰ ਹਨ, ਪਰ ਕੁਝ ਉन्नਤ ਭਾਗ ਅਧੂਰੇ ਹਨ। ਅਸੀਂ ਸਾਰੇ ਸਮੱਗਰੀ ਨੂੰ ਪੂਰਾ ਕਰਨ ਲਈ ਸਰਗਰਮ ਤੌਰ 'ਤੇ ਕੰਮ ਕਰ ਰਹੇ ਹਾਂ। [ਪ੍ਰਗਤੀ ਵੇਖੋ →](workshop/README.md)

### ਇੰਟਰਐਕਟਿਵ ਵਰਕਸ਼ਾਪ ਸਮਗਰੀ
**ਬਰਾਊਜ਼ਰ-ਅਧਾਰਤ ਟੂਲਾਂ ਅਤੇ ਮਾਰਗਨਿਰਦੇਸ਼ਤ ਅਭਿਆਸਾਂ ਨਾਲ ਵਿਸਤ੍ਰਿਤ ਹੱਥ-ਅਨੁਭਵਕ ਸਿੱਖਿਆ**
ਸਾਡੇ ਵਰਕਸ਼ਾਪ ਸਮੱਗਰੀ ਇੱਕ ਰਚਨਾਤਮਕ, ਇੰਟਰੇਕਟਿਵ ਲਰਨਿੰਗ ਅਨੁਭਵ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ ਜੋ ਉਪਰ ਦਿੱਤੇ ਅਧਿਆਏ-ਆਧਾਰਿਤ ਪਾਠਕ੍ਰਮ ਨੂੰ ਪੂਰਕ ਕਰਦੀ ਹੈ। ਵਰਕਸ਼ਾਪ ਸਵੈ-ਗਤੀ ਸਿੱਖਣ ਅਤੇ ਇੰਸਟ੍ਰਕਟਰ-ਨੇਤ੍ਰਿਤ ਸੈਸ਼ਨ ਦੋਹਾਂ ਲਈ ਡਿੱਜ਼ਾਇਨ ਕੀਤਾ ਗਿਆ ਹੈ।

#### 🛠️ ਵਰਕਸ਼ਾਪ ਫੀਚਰ
- **Browser-Based Interface**: MkDocs-ਚਲਿਤ ਪੂਰਾ ਵਰਕਸ਼ਾਪ ਜਿਸ ਵਿੱਚ search, copy, ਅਤੇ theme ਫੀਚਰ ਹਨ
- **GitHub Codespaces Integration**: ਇੱਕ ਕਲਿੱਕ ਨਾਲ ਵਿਕਾਸ ਵਾਤਾਵਰਣ ਸੈਟਅਪ
- **Structured Learning Path**: 8-ਮੋਡੀਊਲ ਗਾਈਡ ਕੀਤੇ ਕਸਰਤੀ ਅਭਿਆਸ (ਕੁੱਲ 3-4 ਘੰਟੇ)
- **Progressive Methodology**: ਪਰਿਚਯ → ਚੋਣ → ਵੈਰੀਫਿਕੇਸ਼ਨ → ਡੀਕਨਸਟਰਕਸ਼ਨ → ਕਨਫਿਗਰੈਸ਼ਨ → ਕਸਟਮਾਈਜੇਸ਼ਨ → ਟੀਅਰਡਾਊਨ → ਸੰਖੇਪ
- **Interactive DevContainer Environment**: ਪਹਿਲਾਂ ਤੋਂ ਕੰਫਿਗਰ ਕੀਤੇ ਟੂਲ ਅਤੇ ਡਿਪੈਂਡੈਂਸੀਜ਼

#### 📚 ਵਰਕਸ਼ਾਪ ਮੋਡੀਊਲ ਦੀ ਰਚਨਾ
ਵਰਕਸ਼ਾਪ ਇੱਕ **8-ਮੋਡੀਊਲ ਪ੍ਰਗਤੀਸ਼ੀਲ ਮੈਥਡੋਲੋਜੀ** ਦੀ ਪਾਲਣਾ ਕਰਦਾ ਹੈ ਜੋ ਤੁਹਾਨੂੰ ਖੋਜ ਤੋਂ ਤਾਇਨਾਤੀ ਮਹਾਰਤ ਤੱਕ ਲੈ ਜਾਂਦਾ ਹੈ:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | ਵਰਕਸ਼ਾਪ ਦਾ ਜਾਇਜ਼ਾ | ਸਿੱਖਣ ਦੇ ਲਕੜੇ, ਪੂਰਵ-ਆਵਸ਼ਕਤਾਵਾਂ, ਅਤੇ ਵਰਕਸ਼ਾਪ ਸਾਂਚੇ ਨੂੰ ਸਮਝੋ | 15 ਮਿੰਟ |
| **1. Selection** | ਟੈਮਪਲੇਟ ਖੋਜ | AZD ਟੈਮਪਲੇਟ ਖੋਜੋ ਅਤੇ ਆਪਣੇ ਦ੍ਰਿਸ਼ਯ ਲਈ ਸਹੀ AI ਟੈਮਪਲੇਟ ਚੁਣੋ | 20 ਮਿੰਟ |
| **2. Validation** | ਤਾਇਨਾਤ ਕੀਤੀਆਂ ਅਤੇ ਜਾਂਚ | `azd up` ਨਾਲ ਟੈਮਪਲੇਟ ਤਾਇਨਾਤ ਕਰੋ ਅਤੇ ਇੰਫ੍ਰਾਸਟਰਕਚਰ ਕੰਮ ਕਰਦਾ ਹੈ ਇਹ ਵੈਰੀਫਾਈ ਕਰੋ | 30 ਮਿੰਟ |
| **3. Deconstruction** | ਬਣਤਰ ਸਮਝੋ | GitHub Copilot ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਟੈਮਪਲੇਟ ਆਰਕੀਟੈਕਚਰ, Bicep ਫਾਇਲਾਂ, ਅਤੇ ਕੋਡ ਸੰਗਠਨ ਖੋਜੋ | 30 ਮਿੰਟ |
| **4. Configuration** | azure.yaml ਗਹਿਰਾਈ ਨਾਲ | `azure.yaml` ਕਨਫਿਗਰੇਸ਼ਨ, ਲਾਈਫਸਾਇਕਲ ਹੁਕਸ, ਅਤੇ ਇਨਵਾਇਰਨਮੈਂਟ ਵੈਰੀਏਬਲ ਸਮਝੋ | 30 ਮਿੰਟ |
| **5. Customization** | ਆਪਣਾ ਬਣਾਓ | AI Search, tracing, ਮੁਲਾਂਕਣ ਯੋਗ ਬਣਾਓ, ਅਤੇ ਆਪਣੇ ਦ੍ਰਿਸ਼ਯ ਲਈ ਕੁਸਟਮਾਈਜ਼ ਕਰੋ | 45 ਮਿੰਟ |
| **6. Teardown** | ਸਾਫ਼ਾਈ | `azd down --purge` ਨਾਲ ਸਾਫ਼-ਸੁਥਰਾ ਤਰੀਕੇ ਨਾਲ ਰਿਸੋਰਸਜ਼ ਦੂਰ ਕਰੋ | 15 ਮਿੰਟ |
| **7. Wrap-up** | ਅਗਲੇ ਕਦਮ | ਪ੍ਰਾਪਤੀਆਂ, ਮੁੱਖ ਸੰਕਲਪਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ ਅਤੇ ਆਪਣੀ ਸਿੱਖਣ ਯਾਤਰਾ جاري ਰੱਖੋ | 15 ਮਿੰਟ |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ਵਰਕਸ਼ਾਪ ਸ਼ੁਰੂ ਕਰਨਾ
```bash
# ਵਿਕਲਪ 1: GitHub Codespaces (ਸੁਝਾਇਆ ਗਿਆ)
# ਕਲਿਕ ਕਰੋ "ਕੋਡ" → "ਮੇਨ 'ਤੇ ਕੋਡਸਪੇਸ ਬਣਾਓ" ਰੇਪੋਜ਼ਿਟਰੀ ਵਿੱਚ

# ਵਿਕਲਪ 2: ਸਥਾਨਕ ਵਿਕਾਸ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md ਵਿੱਚ ਦਿੱਤੇ ਸੈਟਅਪ ਨਿਰਦੇਸ਼ਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ
```

#### 🎯 ਵਰਕਸ਼ਾਪ ਸਿੱਖਣ ਨਤੀਜੇ
ਵਰਕਸ਼ਾਪ ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਭਾਗੀਦਾਰ ਇਹ ਕਰਨ ਦੇ ਯੋਗ ਹੋਣਗੇ:
- **Production AI Applications ਤਾਇਨਾਤ ਕਰੋ**: Microsoft Foundry ਸੇਵਾਵਾਂ ਦੇ ਨਾਲ AZD ਦੀ ਵਰਤੋਂ ਕਰੋ
- **Multi-Agent ਆਰਕੀਟੈਕਚਰ ਵਿੱਚ ਨਿਪੁੰਨਤਾ ਹਾਸਲ ਕਰੋ**: ਸਹਿਕਾਰੀ AI ਏਜੰਟ ਹੱਲ ਲਾਗੂ ਕਰੋ
- **ਸੁਰੱਖਿਆ ਦੀਆਂ ਸਰਵੋਤਮ ਪ੍ਰਥਾਵਾਂ ਲਾਗੂ ਕਰੋ**: ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਪਹੁੰਚ ਨਿਯੰਤਰਣ ਕਨਫਿਗਰ ਕਰੋ
- **ਸਕੇਲ ਲਈ ਅਪਟੀਮਾਈਜ਼ ਕਰੋ**: ਲਾਗਤ-ਕੁਸ਼ਲ, ਪ੍ਰਦਰਸ਼ਨਸ਼ੀਲ ਤਾਇਨਾਤੀ ਡਿਜ਼ਾਇਨ ਕਰੋ
- **ਤਾਇਨਾਤੀ ਦੌਰਾਨ ਸਮੱਸਿਆਵਾਂ ਸਹੀ ਕਰੋ**: ਆਮ ਮੁੱਦਿਆਂ ਨੂੰ ਸੁਤੰਤਰਤ ਤੌਰ 'ਤੇ ਹੱਲ ਕਰੋ

#### 📖 ਵਰਕਸ਼ਾਪ ਸੰਸਾਧਨ
- **🎥 ਇੰਟਰਐਕਟਿਵ ਗਾਈਡ**: [Workshop Materials](workshop/README.md) - ਬ੍ਰਾਊਜ਼ਰ-ਆਧਾਰਤ ਲਰਨਿੰਗ ਵਾਤਾਵਰਣ
- **📋 ਮੋਡੀਊਲ-ਬਾਈ-ਮੋਡੀਊਲ ਨਿਰਦੇਸ਼**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - ਵਰਕਸ਼ਾਪ ਦਾ ਜਾਇਜ਼ਾ ਅਤੇ ਉਦੇਸ਼
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI ਟੈਮਪਲੇਟ ਲੱਭੋ ਅਤੇ ਚੁਣੋ
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - ਟੈਮਪਲੇਟ ਤਾਇਨਾਤ ਕਰੋ ਅਤੇ ਜਾਂਚੋ
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ਟੈਮਪਲੇਟ ਆਰਕੀਟੈਕਚਰ ਖੋਜੋ
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` ਵਿੱਚ ਮਾਹਿਰ ਬਣੋ
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - ਆਪਣੇ ਦ੍ਰਿਸ਼ਯ ਲਈ ਕੁਸਟਮਾਈਜ਼ ਕਰੋ
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ਰਿਸੋਰਸز ਸਾਫ਼ ਕਰੋ
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - ਸਮੀਖਿਆ ਅਤੇ ਅਗਲੇ ਕਦਮ
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-ਕੇਂਦਰਿਤ ਅਭਿਆਸ
- **💡 ਕ્વਿਕ ਸਟਾਰਟ**: [Workshop Setup Guide](workshop/README.md#quick-start) - ਵਾਤਾਵਰਣ কਨਫਿਗਰੇਸ਼ਨ

**ਉਤਕ੍ਰਿਸ਼ਟ ਲਈ**: ਕਾਰਪੋਰੇਟ ਟ੍ਰੇਨਿੰਗ, ਯੂਨੀਵਰਸਿਟੀ ਕੋਰਸ, ਸਵੈ-ਗਤੀ ਸਿੱਖਣ, ਅਤੇ ਡਿਵੈਲਪਰ ਬੂਟਕੈਂਪ।

---

## 📖 ਗਹਿਰਾਈ ਨਾਲ: AZD ਦੀਆਂ ਸਮਰੱਥਾਵਾਂ

ਮੁੱਢੀਆਂ ਗੱਲਾਂ ਤੋਂ ਪਰੇ, AZD ਉਤਪਾਦਨ ਤਾਇਨਾਤੀਆਂ ਲਈ ਸ਼ਕਤੀਸ਼ਾਲੀ ਫੀਚਰ ਮੁਹੱਈਆ ਕਰਦਾ ਹੈ:

- **ਟੈਮਪਲੇਟ-ਆਧਾਰਿਤ ਤਾਇਨਾਤੀਆਂ** - ਆਮ ਐਪਲੀਕੇਸ਼ਨ ਪੈਟਰਨ ਲਈ ਪਹਿਲਾਂ ਬਣੇ ਟੈਮਪਲੇਟ ਦੀ ਵਰਤੋਂ ਕਰੋ
- **Infrastructure as Code** - Bicep ਜਾਂ Terraform ਦੀ ਵਰਤੋਂ ਕਰਕੇ Azure ਰਿਸੋਰਸਜ਼ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ  
- **Integrated workflows** - ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਬਿਨਾਂ ਰੁਕਾਵਟ ਪ੍ਰੋਵੀਜ਼ਨ, ਤਾਇਨਾਤ ਅਤੇ ਮਾਨਿਟਰ ਕਰੋ
- **Developer-friendly** - ਡਿਵੈਲਪਰ ਉਤਪਾਦਕਤਾ ਅਤੇ ਅਨੁਭਵ ਲਈ ਅਪਟੀਮਾਈਜ਼ ਕੀਤਾ ਗਿਆ

### **AZD + Microsoft Foundry: AI ਤਾਇਨਾਤੀਆਂ ਲਈ ਬਹੁਤ ਵਧੀਆ**

**AZD AI ਹੱਲਾਂ ਲਈ ਕਿਉਂ?** AZD ਉਹ ਸਿਖਰਲੇ ਚੁਣੌਤੀਆਂ ਦਾ ਹੱਲ ਦਿੰਦਾ ਜੋ AI ਡਿਵੈਲਪਰ ਸਾਹਮਣਾ ਕਰਦੇ ਹਨ:

- **AI-Ready Templates** - Azure OpenAI, Cognitive Services, ਅਤੇ ML ਵਰਕਲੋਡ ਲਈ ਪਹਿਲਾਂ-ਸੈਟ ਟੈਮਪਲੇਟ
- **ਸੁਰੱਖਿਅਤ AI ਤਾਇਨਾਤੀਆਂ** - AI ਸੇਵਾਵਾਂ, API ਕੁੰਜੀਆਂ, ਅਤੇ ਮਾਡਲ ਐਂਡਪੋਇੰਟ ਲਈ ਇੰਬਿਲਟ ਸੁਰੱਖਿਆ ਪੈਟਰਨ  
- **ਉਤਪਾਦਨ AI ਪੈਟਰਨ** - ਸਕੇਲেবল, ਲਾਗਤ-ਕੁਸ਼ਲ AI ਐਪਲੀਕੇਸ਼ਨ ਤਾਇਨਾਤੀ ਲਈ ਸ਼੍ਰੇਸ਼ਠ ਪ੍ਰਥਾਵਾਂ
- **ਐਂਡ-ਟੂ-ਐਂਡ AI ਵਰਕਫਲੋਜ਼** - ਮਾਡਲ ਵਿਕਾਸ ਤੋਂ ਲੈ ਕੇ ਉਤਪਾਦਨ ਤਾਇਨਾਤੀ ਤੱਕ, ਸਹੀ ਮਾਨਿਟਰਿੰਗ ਦੇ ਨਾਲ
- **ਲਾਗਤ ਅਪਟੀਮਾਈਜੇਸ਼ਨ** - AI ਵਰਕਲੋਡ ਲਈ ਸਮਾਰਟ ਰਿਸੋਰਸ ਵੰਡ ਅਤੇ ਸਕੇਲਿੰਗ ਰਣਨੀਤੀਆਂ
- **Microsoft Foundry Integration** - Microsoft Foundry ਮਾਡਲ ਕੈਟਾਲੌਗ ਅਤੇ ਐਂਡਪੋਇੰਟਾਂ ਨਾਲ ਨਿਰੰਤਰ ਕੁਨੈਕਸ਼ਨ

---

## 🎯 ਟੈਮਪਲੇਟਾਂ ਅਤੇ ਉਦਾਹਰਣ ਲਾਇਬਰੇਰੀ

### ਫੀਚਰਡ: Microsoft Foundry ਟੈਮਪਲੇਟ
**ਜੇਕਰ ਤੁਸੀਂ AI ਐਪਲੀਕੇਸ਼ਨ ਤਾਇਨਾਤ ਕਰ ਰਹੇ ਹੋ ਤਾਂ ਇੱਥੋਂ ਸ਼ੁਰੂ ਕਰੋ!**

> **ਨੋਟ:** ਇਹ ਟੈਮਪਲੇਟ ਵੱਖ-ਵੱਖ AI ਪੈਟਰਨ ਦਰਸਾਉਂਦੇ ਹਨ। ਕੁਝ ਬਾਹਰੀ Azure Samples ਹਨ, ਹੋਰ ਲੋਕਲ ਇੰਪਲੀਮੇਂਟੇਸ਼ਨਾਂ ਹਨ।

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ਅਧਿਆਏ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ਬਾਹਰੀ |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | ਅਧਿਆਏ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ਬਾਹਰੀ |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | ਅਧਿਆਏ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ਬਾਹਰੀ |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ਅਧਿਆਏ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ਬਾਹਰੀ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | ਅਧਿਆਏ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ਬਾਹਰੀ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | ਅਧਿਆਏ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ਬਾਹਰੀ |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | ਅਧਿਆਏ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ਲੋਕਲ** |

### ਫੀਚਰਡ: ਸੰਪੂਰਨ ਸਿੱਖਣ ਸੈਨਾਰਿਓز
**ਉਤਪਾਦਨ-ਤਿਆਰ ਐਪਲੀਕੇਸ਼ਨ ਟੈਮਪਲੇਟ ਜੋ ਸਿੱਖਣ ਅਧਿਆਏਆਂ ਨਾਲ ਨਕਸ਼ੇਬੰਦੀ ਕੀਤੇ ਗਏ ਹਨ**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ਅਧਿਆਏ 2 | ⭐ | ਆਧਾਰਭੂਤ AI ਤਾਇਨਾਤੀ ਪੈਟਰਨ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | ਅਧਿਆਏ 2 | ⭐⭐ | Azure AI Search ਨਾਲ RAG ਇੰਪਲੀਮੇੰਟੇਸ਼ਨ |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | ਅਧਿਆਏ 4 | ⭐⭐ | ਦਸਤਾਵੇਜ਼ ਇੰਟੈਲੀਜੈਂਸ ਇੰਟਿਗ੍ਰੇਸ਼ਨ |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | ਅਧਿਆਏ 5 | ⭐⭐⭐ | ਏਜੰਟ ਫਰੇਮਵਰਕ ਅਤੇ ਫੰਕਸ਼ਨ ਕਾਲਿੰਗ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | ਅਧਿਆਏ 8 | ⭐⭐⭐ | ਏਨਟਰਪ੍ਰਾਈਜ਼ AI ਆਰਕੀਟੈਕਚਰ |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | ਅਧਿਆਏ 5 | ⭐⭐⭐⭐ | Customer ਅਤੇ Inventory ਏਜੰਟਾਂ ਨਾਲ ਮਲਟੀ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ |

### ਉਦਾਹਰਣ ਦੇ ਕਿਸਮ ਅਨੁਸਾਰ ਸਿੱਖਣਾ

> **📌 ਲੋਕਲ vs. ਬਾਹਰੀ ਉਦਾਹਰਣ:**  
> **ਲੋਕਲ ਉਦਾਹਰਣ** (ਇਸ ਰೆਪੋ ਵਿੱਚ) = ਤੁਰੰਤ ਵਰਤਣ ਲਈ ਤਿਆਰ  
> **ਬਾਹਰੀ ਉਦਾਹਰਣ** (Azure Samples) = ਲਿੰਕ ਕੀਤੀਆਂ ਰਿਪੋਜ਼ਟਰੀਜ਼ ਤੋਂ ਕਲੋਨ ਕਰੋ

#### ਲੋਕਲ ਉਦਾਹਰਣ (ਤੁਰੰਤ ਵਰਤਣ ਲਈ ਤਿਆਰ)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM ਟੈਮਪਲੇਟਾਂ ਨਾਲ ਸੰਪੂਰਨ ਉਤਪਾਦਨ-ਤਿਆਰ ਇੰਪਲੀਮੇਂਟੇਸ਼ਨ
  - ਮਲਟੀ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ (Customer + Inventory ਏਜੰਟ)
  - ਵਿਸ਼ਤ੍ਰਿਤ ਮਾਨਿਟਰਿੰਗ ਅਤੇ ਮੁਲਾਂਕਣ
  - ARM ਟੈਮਪਲੇਟ ਰਾਹੀਂ ਇੱਕ-ਕਲਿੱਕ ਤਾਇਨਾਤੀ

#### ਲੋਕਲ ਉਦਾਹਰਣ - ਕਨਟੇਨਰ ਐਪਲੀਕੇਸ਼ਨ (ਅਧਿਆਏ 2-5)
**ਇਸ ਰੈਪੋ ਵਿੱਚ ਸੰਪੂਰਨ ਕਨਟੇਨਰ ਤਾਇਨਾਤੀ ਉਦਾਹਰਣ:**
- [**Container App Examples**](examples/container-app/README.md) - ਕਨਟੇਨਰਾਈਜ਼ਡ ਤਾਇਨਾਤੀਆਂ ਲਈ ਪੂਰਾ ਗਾਈਡ
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - scale-to-zero ਨਾਲ ਬੁਨਿਆਦੀ REST API
  - [Microservices Architecture](../../examples/container-app/microservices) - ਉਤਪਾਦਨ-ਤਿਆਰ ਮਲਟੀ-ਸਰਵਿਸ ਤਾਇਨਾਤੀ
  - Quick Start, Production, ਅਤੇ Advanced ਤਾਇਨਾਤੀ ਪੈਟਰਨ
  - ਮਾਨਿਟਰਿੰਗ, ਸੁਰੱਖਿਆ, ਅਤੇ ਲਾਗਤ ਅਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਨਿਰਦੇਸ਼

#### ਬਾਹਰੀ ਉਦਾਹਰਣ - ਸਧਾਰਨ ਐਪਲੀਕੇਸ਼ਨ (ਅਧਿਆਏ 1-2)
**ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਇਹ Azure Samples ਰਿਪੋਜ਼ਟਰੀਜ਼ ਕਲੋਨ ਕਰੋ:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - ਮੂਲ ਤਾਇਨਾਤੀ ਪੈਟਰਨ
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - ਸਟੈਟਿਕ ਸਮੱਗਰੀ ਤਾਇਨਾਤੀ
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API ਤਾਇਨਾਤੀ

#### ਬਾਹਰੀ ਉਦਾਹਰਣ - ਡੇਟਾਬੇਜ਼ ਇੰਟਿਗ੍ਰੇਸ਼ਨ (ਅਧਿਆਏ 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ਡੇਟਾਬੇਜ਼ ਕਨੈਕਟਿਵਿਟੀ ਪੈਟਰਨ
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - ਸਰਵਰਲੈੱਸ ਡੇਟਾ ਵਰਕਫਲੋ

#### ਬਾਹਰੀ ਉਦਾਹਰਣ - ਉੱਨਤ ਪੈਟਰਨ (ਅਧਿਆਏ 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - ਮਲਟੀ-ਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - ਬੈਕਗਰਾਉਂਡ ਪ੍ਰੋਸੈਸਿੰਗ  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - ਉਤਪਾਦਨ-ਤਿਆਰ ML ਪੈਟਰਨ

### ਬਾਹਰੀ ਟੈਮਪਲੇਟ ਸੰਗ੍ਰਹਿ
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - ਅਧਿਕਾਰਕ ਅਤੇ ਕਮਿਊਨਿਟੀ ਟੈਮਪਲੇਟਾਂ ਦੀ ਚੁਣੀ ਹੋਈ ਸੰਗ੍ਰਹਿ
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn ਟੈਮਪਲੇਟ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ
- [**Examples Directory**](examples/README.md) - ਵਿਸਤ੍ਰਿਤ ਵਿਆਖਿਆਵਾਂ ਨਾਲ ਲੋਕਲ ਸਿੱਖਣ ਉਦਾਹਰਣ

---

## 📚 ਸਿੱਖਣ ਸੰਸਾਧਨ ਅਤੇ ਸੰਦਰਭ

### ਕ਼ੁਇੱਕ ਸੰਦਰਭ
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - ਮੁੱਹਤਵਪੂਰਨ azd ਕਮਾਂਡਾਂ ਅਧਿਆਏ ਅਨੁਸਾਰ
- [**Glossary**](resources/glossary.md) - Azure ਅਤੇ azd ਟਰਮੀਨੋਲੋਜੀ  
- [**FAQ**](resources/faq.md) - ਆਮ ਸਵਾਲਾਂ ਅਧਿਆਏ ਅਨੁਸਾਰ
- [**Study Guide**](resources/study-guide.md) - ਵਿਸਤ੍ਰਿਤ ਅਭਿਆਸ

### ਹੈਂਡਸ-ਆਨ ਵਰਕਸ਼ਾਪ
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ਆਪਣੇ AI ਹੱਲਾਂ ਨੂੰ AZD-ਤਾਇਨਾਤਯੋਗ ਬਣਾਓ (2-3 ਘੰਟੇ)
- [**Interactive Workshop**](workshop/README.md) - 8-ਮੋਡੀਊਲ ਗਾਈਡ ਕੀਤੇ ਅਭਿਆਸ MkDocs ਅਤੇ GitHub Codespaces ਦੇ ਨਾਲ
  - ਪਾਲਣਾ: ਪਰਿਚਯ → ਚੋਣ → ਵੈਰੀਫਿਕੇਸ਼ਨ → ਡੀਕਨਸਟਰਕਸ਼ਨ → ਕਨਫਿਗਰੈਸ਼ਨ → ਕੁਸਟਮਾਈਜ਼ੇਸ਼ਨ → ਟੀਅਰਡਾਊਨ → ਸੰਖੇਪ

### ਬਾਹਰੀ ਸਿੱਖਣ ਸੰਸਾਧਨ
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 ਕ਼ੁਇੱਕ ਟ੍ਰਾਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ

**ਮੁੱਢਲਾ ਸਮੱਸਿਆਵਾਂ ਜੋ ਸ਼ੁਰੂਆਤੀ ਲੋਕਾਂ ਨੂੰ ਆਮ ਤੌਰ 'ਤੇ ਆਉਂਦੀਆਂ ਹਨ ਅਤੇ ਤੁਰੰਤ ਹੱਲ:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ਸਭ ਤੋਂ ਪਹਿਲਾਂ AZD ਇੰਸਟਾਲ ਕਰੋ
# ਵਿੰਡੋਜ਼ (ਪਾਵਰਸ਼ੈੱਲ):
winget install microsoft.azd

# ਮੈਕਓਐਸ:
brew tap azure/azd && brew install azd

# ਲਿਨਕਸ:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ਇੰਸਟਾਲੇਸ਼ਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# ਉਪਲਬਧ ਸਬਸਕ੍ਰਿਪਸ਼ਨਾਂ ਦੀ ਸੂਚੀ
az account list --output table

# ਮੂਲ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription "<subscription-id-or-name>"

# AZD ਮਾਹੌਲ ਲਈ ਸੈੱਟ ਕਰੋ
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# ਤਸਦੀਕ ਕਰੋ
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# ਕਿਸੇ ਹੋਰ Azure ਰੀਜਨ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION "westus2"
azd up

# ਜਾਂ ਵਿਕਾਸ ਵਿੱਚ ਛੋਟੇ SKUs ਵਰਤੋ
# infra/main.parameters.json ਨੂੰ ਸੋਧੋ:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# ਵਿਕਲਪ 1: ਸਾਫ਼ ਕਰੋ ਅਤੇ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd down --force --purge
azd up

# ਵਿਕਲਪ 2: ਸਿਰਫ਼ ਬੁਨਿਆਦੀ ਢਾਂਚਾ ਠੀਕ ਕਰੋ
azd provision

# ਵਿਕਲਪ 3: ਵਿਸਤਾਰਿਤ ਹਾਲਤ ਦੀ ਜਾਂਚ ਕਰੋ
azd show

# ਵਿਕਲਪ 4: Azure Monitor ਵਿੱਚ ਲੌਗਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "ਪ੍ਰਮਾਣਿਕਤਾ ਫੇਲ" ਜਾਂ "ਟੋਕਨ ਦੀ ਮਿਆਦ ਖਤਮ"</strong></summary>

```bash
# ਮੁੜ ਪ੍ਰਮਾਣੀਕਰਨ ਕਰੋ
az logout
az login

azd auth logout
azd auth login

# ਪ੍ਰਮਾਣੀਕਰਨ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ
az account show
```
</details>

<details>
<summary><strong>❌ "ਸਰੋਤ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ" ਜਾਂ ਨਾਮਕਰਨ ਟਕਰਾਅ</strong></summary>

```bash
# AZD ਵਿਲੱਖਣ ਨਾਮ ਬਣਾਉਂਦਾ ਹੈ, ਪਰ ਜੇ ਟਕਰਾਅ ਹੋਵੇ:
azd down --force --purge

# ਤਾਂ ਤਾਜ਼ਾ ਮਾਹੌਲ ਨਾਲ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ਟੈਂਪਲੇਟ ਡਿਪਲੋਇਮੈਂਟ ਜ਼ਿਆਦਾ ਦੇਰ ਲੈ ਰਿਹਾ ਹੈ</strong></summary>

**ਆਮ ਇੰਤਜ਼ਾਰ ਸਮਾਂ:**
- ਸਧਾਰਨ ਵੈੱਬ ਐਪ: 5-10 ਮਿੰਟ
- ਡੇਟਾਬੇਸ ਵਾਲੀ ਐਪ: 10-15 ਮਿੰਟ
- AI ਐਪਲੀਕੇਸ਼ਨ: 15-25 ਮਿੰਟ (OpenAI ਪ੍ਰੋਵਿਜ਼ਨਿੰਗ ਧੀਮੀ ਹੁੰਦੀ ਹੈ)

```bash
# ਪ੍ਰਗਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
azd show

# ਜੇ 30 ਮਿੰਟ ਤੋਂ ਵੱਧ ਫਸਿਆ ਹੋਵੇ, ਤਾਂ Azure ਪੋਰਟਲ ਦੀ ਜਾਂਚ ਕਰੋ:
azd monitor
# ਅਸਫਲ ਡਿਪਲੋਇਮੈਂਟਾਂ ਨੂੰ ਲੱਭੋ
```
</details>

<details>
<summary><strong>❌ "ਅਨੁਮਤੀ ਇਨਕਾਰ" ਜਾਂ "ਨਿਰੋਧਿਤ"</strong></summary>

```bash
# ਆਪਣਾ Azure ਰੋਲ ਚੈੱਕ ਕਰੋ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# ਤੁਹਾਨੂੰ ਘੱਟੋ-ਘੱਟ "Contributor" ਰੋਲ ਦੀ ਲੋੜ ਹੈ
# ਆਪਣੇ Azure ਐਡਮਿਨ ਨੂੰ ਇਹ ਦੇਣ ਲਈ ਕਹੋ:
# - Contributor (ਸੰਸਾਧਨਾਂ ਲਈ)
# - User Access Administrator (ਭੂਮਿਕਾ ਨਿਯੁਕਤੀਆਂ ਲਈ)
```
</details>

<details>
<summary><strong>❌ ਤੈਨਾਤ ਕੀਤੇ ਐਪਲੀਕੇਸ਼ਨ ਦਾ URL ਨਹੀਂ ਮਿਲ ਰਿਹਾ</strong></summary>

```bash
# ਸਾਰੇ ਸੇਵਾ ਐਂਡਪੌਇੰਟ ਦਿਖਾਓ
azd show

# ਜਾਂ ਅਜ਼ਿਊਰ ਪੋਰਟਲ ਖੋਲ੍ਹੋ
azd monitor

# ਕਿਸੇ ਖਾਸ ਸੇਵਾ ਦੀ ਜਾਂਚ ਕਰੋ
azd env get-values
# *_URL ਵੈਰੀਏਬਲ ਖੋਜੋ
```
</details>

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Course Completion & Certification

### Progress Tracking
Track your learning progress through each chapter:

- [ ] **Chapter 1**: ਫਾਉਂਡੇਸ਼ਨ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: ਕੰਫਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਮਾਣੀਕਰਨ ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
After completing each chapter, verify your knowledge by:
1. **Practical Exercise**: Complete the chapter's hands-on deployment
2. **Knowledge Check**: Review the FAQ section for your chapter
3. **Community Discussion**: Share your experience in Azure Discord
4. **Next Chapter**: Move to the next complexity level

### Course Completion Benefits
Upon completing all chapters, you will have:
- **Production Experience**: Deployed real AI applications to Azure
- **Professional Skills**: Enterprise-ready deployment capabilities  
- **Community Recognition**: Active member of Azure developer community
- **Career Advancement**: In-demand AZD and AI deployment expertise

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Microsoft Foundry Discord

**Recent Poll Results from #Azure Channel:**
- **45%** ਡਿਵੈਲਪਰ AZD ਨੂੰ AI ਵਰਕਲੋਡ ਲਈ ਵਰਤਣਾ ਚਾਹੁੰਦੇ ਹਨ
- **Top challenges**: ਮਲਟੀ-ਸਰਵਿਸ ਡਿਪਲੋਇਮੈਂਟ, ਸਨਦ ਪ੍ਰਬੰਧਨ, ਪ੍ਰੋਡਕਸ਼ਨ ਤਿਆਰੀ  
- **Most requested**: AI-ਵਿਸ਼ੇਸ਼ ਟੈਂਪਲੇਟ, ਟਰਬਲਸ਼ੂਟਿੰਗ ਗਾਈਡ, ਸਰਵੋਤਮ ਅਭਿਆਸ

**Join our community to:**
- Share your AZD + AI experiences and get help
- Access early previews of new AI templates
- Contribute to AI deployment best practices
- Influence future AI + AZD feature development

### Contributing to the Course
We welcome contributions! Please read our [Contributing Guide](CONTRIBUTING.md) for details on:
- **Content Improvements**: ਮੌਜੂਦਾ ਅਧਿਆਇ ਅਤੇ ਉਦਾਹਰਣਾਂ ਨੂੰ ਬਹਿਤਰ ਬਣਾਓ
- **New Examples**: ਅਸਲ-ਦੁਨੀਆ ਦੀਆਂ ਪਰੀਸਥਿਤੀਆਂ ਅਤੇ ਟੈਂਪਲੇਟ ਸ਼ਾਮਲ ਕਰੋ  
- **Translation**: ਬਹੁ-ਭਾਸ਼ਾਈ ਸਹਾਇਤਾ ਨੂੰ ਬਣਾਈ ਰਖਣ ਵਿੱਚ ਮਦਦ ਕਰੋ
- **Bug Reports**: ਸਹੀਤਾ ਅਤੇ ਸਪਸ਼ਟਤਾ ਬਹਿਤਰ ਬਣਾਓ
- **Community Standards**: ਸਾਡੇ ਸਮੇਟ ਵਾਲੇ ਕਮਿਊਨਿਟੀ ਨਿਰਦੇਸ਼ਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ

---

## 📄 Course Information

### License
This project is licensed under the MIT License - see the [LICENSE](../../LICENSE) file for details.

### Related Microsoft Learning Resources

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Course Navigation

**🚀 ਸਿੱਖਣਾ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਤਿਆਰ?**

**ਸ਼ੁਰੂਆਤੀ**: ਇਸ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ [Chapter 1: Foundation & Quick Start](../..)
**AI ਡਿਵੈਲਪਰ**: ਤੇ ਜਾਓ [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](../..)  

**ਅਨੁਭਵੀ ਡਿਵੈਲਪਰ**: ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ [ਅਧਿਆਇ 3: ਸੰਰਚਨਾ & ਪ੍ਰਮਾਣਿਕਤਾ](../..)

**ਅਗਲੇ ਕਦਮ**: [ਅਧਿਆਇ 1 - AZD ਬੁਨਿਆਦੀ ਸ਼ੁਰੂ ਕਰੋ](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ਅਸਵੀਕਾਰ:
ਇਹ ਦਸਤਾਵੇਜ਼ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਨੁਵਾਦ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸ਼ੁੱਧਤਾ ਲਈ ਕੋਸ਼ਿਸ਼ ਕਰਦੇ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਤਰੁਟੀਆਂ ਜਾਂ ਗਲਤੀਆਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਨੂੰ ਉਸ ਦੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਿਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਮਹੱਤਵਪੂਰਨ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫਾਰਿਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੀ ਵਰਤੋਂ ਕਾਰਨ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜ਼ਿੰਮੇਵਾਰ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->