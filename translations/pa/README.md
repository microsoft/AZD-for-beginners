# AZD ਨਵੇਂ ਸ਼ੁਰੂਆਤੀ ਲਈ: ਇੱਕ ਸੰਰਚਿਤ ਸਿੱਖਣ ਯਾਤਰਾ

![AZD-for-beginners](../../translated_images/pa/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### ਸੁਚਾਲਿਤ ਅਨੁਵਾਦ (ਹਮੇਸ਼ਾਂ ਅਪਡੇਟ ਰਹਿੰਦੇ ਹਨ)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](./README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **ਥਾਂਈ ਕਲੋਨ ਕਰਨਾ ਪਸੰਦ ਹੈ?**
>
> ਇਸ ਰਿਪੋਜਟਰੀ ਵਿੱਚ 50+ ਭਾਸ਼ਾ ਅਨੁਵਾਦ ਸ਼ਾਮਲ ਹਨ ਜੋ ਡਾਊਨਲੋਡ ਸਾਈਜ਼ ਨੂ ਵੱਡਾ ਕਰਦੇ ਹਨ। ਅਨੁਵਾਦਾਂ ਦੇ ਬਿਨਾਂ ਕਲੋਨ ਕਰਨ ਲਈ, sparse checkout ਵਰਤੋ:
>
> **ਬੈਸ਼ / macOS / ਲਿਨਕਸ:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (ਵਿੰਡੋਜ਼):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> ਇਹ ਤੁਹਾਨੂੰ ਤੇਜ਼ ਡਾਊਨਲੋਡ ਨਾਲ ਕੋਰਸ ਪੂਰਾ ਕਰਨ ਲਈ ਸਾਰਾ ਕੁਝ ਦਿੰਦਾ ਹੈ.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 ਅੱਜ ਦੇ azd ਵਿੱਚ ਕੀ ਨਵਾਂ ਹੈ

> 📌 ਇਹ ਕੋਰਸ **`azd 1.27.1`** (ਜੁਲਾਈ 2026) ਦੇ ਖਿਲਾਫ਼ ਪ੍ਰਮਾਣਿਤ ਹੈ। ਆਪਣਾ ਬਿਲਡ ਦੇਖਣ ਲਈ `azd version` ਚਲਾਓ, ਤੇ ਨਵਾਂ ਪ੍ਰਾਪਤ ਕਰਨ ਲਈ `azd upgrade` ਕਰੋ।

ਐਜ਼ੂਰੇ ਡਿਵੈਲਪਰ CLI ਹੁਣ ਸਿਰਫ਼ ਰਵਾਇਤੀ ਵੈੱਬ ਐਪਸ ਅਤੇ API ਤੋਂ ਅੱਗੇ ਵਧ ਚੁੱਕਾ ਹੈ। ਅੱਜ, azd ਏਕ ਪਹਿਲਾ ਸੰਦ ਹੈ ਜੋ **ਕਿਸੇ ਵੀ** ਐਪਲੀਕੇਸ਼ਨ ਨੂੰ ਐਜ਼ੂਰ 'ਤੇ ਡਿਪਲੋਇ ਕਰਨ ਲਈ—ਜਿਵੇਂ ਕਿ AI-ਚਲਿਤ ਐਪਲੀਕੇਸ਼ਨਾਂ ਅਤੇ ਬੁੱਧਿਮਾਨ ਏਜੰਟਾਂ।

ਇਹ ਤੁਹਾਡੇ ਲਈ ਕੀ ਮਤਲਬ ਹੈ:

- **AI ਏਜੰਟ ਹੁਣ ਪਹਿਲੀ-ਸ਼੍ਰੇਣੀ azd ਕੰਮਾਂ ਦੀ ਸ਼੍ਰੇਣੀ ਹਨ।** ਤੁਸੀਂ ਪਹਿਲਾਂ ਹੀ ਜਾਣਦੇ ਹੋਏ `azd init` → `azd up` ਵਰਕਫਲੋ ਨਾਲ AI ਏਜੰਟ ਪ੍ਰਾਜੈਕਟ ਸ਼ੁਰੂ ਕਰ ਸਕਦੇ, ਡਿਪਲੋਇ ਕਰ ਸਕਦੇ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰ ਸਕਦੇ ਹੋ।
- **CLI ਤੋਂ ਪੂਰਾ ਏਜੰਟ ਜੀਵਨਚੱਕਰ।** `azure.ai.agents` ਵਿਸ਼ਟਾਰ ਹੁਣ ਪੂਰੇ ਯਾਤਰਾ ਨੂੰ ਕਵਰ ਕਰਦਾ ਹੈ—`azd ai agent init` ਨਾਲ ਸਕੈਫੋਲਡ ਤਿਆਰ ਕਰੋ, `azd ai agent invoke` ਨਾਲ ਟੈਸਟ ਕਰੋ (ਜਵਾਬ ਦੀ ਸਮਾਂਬੱਧੀ ਨਿਕਾਸੀ ਸਹਿਤ), `azd ai agent eval generate` ਅਤੇ `azd ai agent optimize` ਨਾਲ ਗੁਣਵੱਤਾ ਮਾਪੋ ਅਤੇ ਸੁਧਾਰੋ, ਅਤੇ `azd ai agent delete` ਨਾਲ ਸਾਫ਼-ਸੁਥਰਾ ਕਰੋ।
- **ਹੋਰ AI ਬਿਲਡਿੰਗ ਬਲਾਕ।** ਨਵੇਂ ਪ੍ਰੀਵਿਊ ਵਧੀਆਂ—`azure.ai.skills` ਅਤੇ `azure.ai.connections` ਤੁਹਾਨੂੰ azd ਨਾਲ ਸਿੱਧਾ ਦੁਬਾਰਾ ਵਰਤੋਂ ਵਾਲੇ ਏਜੰਟ ਕੁਸ਼ਲਤਾਵਾਂ ਅਤੇ Foundry ਕਨੈਕਸ਼ਨਾਂ ਦਾ ਪ੍ਰਬੰਧ ਕਰਨ ਦੇਂਦੇ ਹਨ।
- **ਮਾਈਕਰੋਸਾਫਟ ਫਾਉਂਡਰੀ ਇੰਟਿਗਰੇਸ਼ਨ** ਮਾਡਲ ਡਿਪਲੋਇਮੈਂਟ, ਏਜੰਟ ਹੋਸਟਿੰਗ ਅਤੇ AI ਸੇਵਾ ਸੰਰਚਨਾ ਸਿੱਧਾ azd ਟੈਮਪਲੇਟ ਪਰਮਾਣਾਲੀ ਵਿੱਚ ਲਿਆਉਂਦਾ ਹੈ।
- **ਰੋਜ਼ਾਨਾ ਬੁਨਿਆਦੀ ਕੰਮ ਸੁਚਾਰੂ ਹੋਏ ਹਨ।** ਹਾਲੀਆ ਰਿਲੀਜਾਂ ne `azd init` ਨੂੰ idempotent (ਪੁਨਰ ਚਲਾਉਣ ਲਈ ਸੁਰੱਖਿਅਤ) ਬਣਾ ਦਿੱਤਾ, `azd auth login` ਪੁਰਾਣੇ ਟੋਕਨਾਂ ਨੂੰ ਸਵੈਚਲਿਤ ਤੌਰ 'ਤੇ ਸਾਫ ਕਰਦਾ ਹੈ, ਅਤੇ ਇੱਕ ਮਿੱਤਰਭਾਵਪੂਰਕ `azd tool` ਪਹਿਲੀ ਵਾਰੀ ਸੈਟਅਪ ਪ੍ਰੰਪਟ ਸ਼ਾਮਲ ਕੀਤਾ।
- **ਮੁੱਖ ਵਰਕਫਲੋ ਫਿਰ ਵੀ ਏਕੋ ਜਿਹਾ ਹੈ।** ਚਾਹੇ ਤੁਸੀਂ(todo) ਐਪ, ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਜਾਂ ਬਹੁ-ਏਜੰਟ AI ਹੱਲ ਡਿਪਲੋਇ ਕਰ ਰਹੇ ਹੋ, ਹੁਕਮ ਇੱਕੋ ਜਿਹੇ ਹਨ।

> **Aspire ਉਪਭੋਗਤਾਵਾਂ ਲਈ ਨੋਟ:** ਮਾਈਕਰੋਸਾਫਟ ਹੁਣ ਉਤਪਾਦ ਨੂੰ ਸਿਰਫ਼ **Aspire** (ਪਹਿਲਾਂ ".NET Aspire") ਕਹਿੰਦਾ ਹੈ। azd ਦੀ Aspire ਸਹਾਇਤਾ ਬਦਲੀ ਨਹੀਂ ਗਈ—ਸਿਰਫ਼ ਨਾਮ ਨੂੰ ਅਪਡੇਟ ਕੀਤਾ ਗਿਆ।

ਜੇ ਤੁਸੀਂ ਪਹਿਲਾਂ ਹੀ azd ਵਰਤ ਚੁੱਕੇ ਹੋ, ਤਾਂ AI ਸਹਾਇਤਾ ਇੱਕ ਕੁਦਰਤੀ ਵਾਧਾ ਹੈ—ਕੋਈ ਵੱਖਰਾ ਸੰਦ ਜਾਂ ਉੱਚ ਦਰਜੇ ਦਾ ਕੋਰਸ ਨਹੀਂ। ਜੇ ਤੁਸੀਂ ਨਵਾਂ ਸ਼ੁਰੂ ਕਰ ਰਹੇ ਹੋ, ਤਾਂ ਤੁਸੀਂ ਇੱਕ ਵਰਕਫਲੋ ਸਿੱਖੋਗੇ ਜੋ ਸਭ ਲਈ ਕੰਮ ਕਰਦਾ ਹੈ।

---

## 🚀 Azure Developer CLI (azd) ਕੀ ਹੈ?

**Azure Developer CLI (azd)** ਇੱਕ ਡਿਵੈਲਪਰ-ਮਿਤਰ ਕਮਾਂਡ-ਲਾਈਨ ਸੰਦ ਹੈ ਜੋ ਐਜ਼ੂਰ 'ਤੇ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕਰਨਾ ਆਸਾਨ ਬਣਾਉਂਦਾ ਹੈ। ਸੈਂਕੜੇ Azure ਸਰੋਤਾਂ ਨੂੰ ਹਥਿਆਰ ਬਣਾ ਕੇ ਕਨੈਕਟ ਕਰਨ ਦੀ ਬਜਾਏ, ਤੁਸੀਂ ਇੱਕ ਹੁਕਮ ਨਾਲ ਪੂਰੀਆਂ ਐਪਾਂ ਡਿਪਲੋਇ ਕਰ ਸਕਦੇ ਹੋ।

### `azd up` ਦਾ ਜਾਦੂ

```bash
# ਇਹ ਇੱਕੋ ਕਮਾਂਡ ਸਭ ਕੁਝ ਕਰਦੀ ਹੈ:
# ✅ ਸਾਰੇ Azure ਸਰੋਤ ਬਣਾਉਂਦੀ ਹੈ
# ✅ ਨੈੱਟਵਰਕਿੰਗ ਅਤੇ ਸੁਰੱਖਿਆ ਸੈਟ ਕਰਦੀ ਹੈ
# ✅ ਤੁਹਾਡੀ ਐਪਲੀਕੇਸ਼ਨ ਕੋਡ ਬਣਾਉਂਦੀ ਹੈ
# ✅ Azure 'ਤੇ ਡਿਪਲੋਇ ਕਰਦੀ ਹੈ
# ✅ ਤੁਹਾਨੂੰ ਇੱਕ ਕੰਮ ਕਰਨ ਵਾਲੀ URL ਦਿੰਦੀ ਹੈ
azd up
```

**ਉਹੀ ਕਾਮ ਹੈ!** ਕੋਈ Azure ਪੋਰਟਲ 'ਤੇ ਕਲਿੱਕਿੰਗ ਨਹੀਂ, ਕੋਈ ਔਖੇ ARM ਟੈਂਪਲੇਟ ਸਿੱਖਣ ਦੀ ਲੋੜ ਨਹੀਂ, ਕੋਈ ਹੱਥੋਂ ਕੰਫਿਗਰੇਸ਼ਨ ਨਹੀਂ - ਸਿਰਫ ਕਾਰਗਰ ਐਪਲੀਕੇਸ਼ਨਾਂ ਦਾ ਐਜ਼ੂਰ 'ਤੇ ਹੋਣਾ।

---

## ❓ Azure Developer CLI ਅਤੇ Azure CLI ਵਿੱਚ ਕੀ ਫਰਕ ਹੈ?

ਇਹ ਸਭ ਤੋਂ ਆਮ ਸਵਾਲ ਹੈ ਜੋ ਨਵੇਂ ਸ਼ੁਰੂਆਤੀ ਪੁੱਛਦੇ ਹਨ। ਇਹ ਸਾਦਾ ਜਵਾਬ ਹੈ:

| ਫੀਚਰ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **ਮਕਸਦ** | ਵਿਅਕਤੀਗਤ Azure ਸਰੋਤਾਂ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਨਾ | ਪੂਰੀਆਂ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲੋਇ ਕਰਨਾ |
| **ਦ੍ਰਿਸ਼ਟੀਕੋਣ** | ਸੰਰਚਨਾ-ਕੇਂਦਰਿਤ | ਐਪਲੀਕੇਸ਼ਨ-ਕੇਂਦਰਿਤ |
| **ਉਦਾਹਰਨ** | `az webapp create --name myapp...` | `azd up` |
| **ਸਿੱਖਣ ਦੀ ਘੱਟਤਮ ਲਕੀਰ** | Azure ਸੇਵਾਵਾਂ ਨੂੰ ਜਾਣਨਾ ਲਾਜ਼ਮੀ ਹੈ | ਸਿਰਫ਼ ਆਪਣੀ ਐਪ ਨੂੰ ਜਾਣੋ |
| **ਸਭ ਤੋਂ ਵਧੀਆ** | DevOps, ਸੰਰਚਨਾ | ਡਿਵੈਲਪਰ, ਪ੍ਰੋਟੋਟਾਈਪਿੰਗ |

### ਆਸਾਨ ਤੁਲਨਾ

- **Azure CLI** ਉਹ ਸਾਰੇ ਸੰਦਾਂ ਵਰਗਾ ਹੈ ਜੋ ਘਰ ਬਣਾਉਣ ਲਈ ਚਾਹੀਦੇ ਹਨ - ਹੈਮਰ, ਆਰੀ, ਕੀਲਾਂ। ਤੁਸੀਂ ਕੁਝ ਵੀ ਬਣਾ ਸਕਦੇ ਹੋ, ਪਰ ਤੁਹਾਨੂੰ ਨਿਰਮਾਣ ਦਾ ਗਿਆਨ ਸਿੱਖਣਾ ਪੈਂਦਾ ਹੈ।
- **Azure Developer CLI** ਇੱਕ ठੇਕੇਦਾਰ ਨੂੰ ਨੌਕਰੀ 'ਤੇ ਰੱਖਣ ਵਰਗਾ ਹੈ - ਤੁਸੀਂ ਦੱਸਦੇ ਹੋ ਕਿ ਤੁਸੀਂ ਕੀ ਚਾਹੁੰਦੇ ਹੋ, ਅਤੇ ਉਹ ਨਿਰਮਾਣ ਦਾ ਕੰਮ ਸੰਭਾਲਦੇ ਹਨ।

### ਕਦੋਂ ਕਿਹੜਾ ਵਰਤਣਾ ਹੈ

| ਪਰਿਸਥਿਤੀ | ਇਹ ਵਰਤੋ |
|----------|----------|
| "ਮੈਂ ਆਪਣੀ ਵੈੱਬ ਐਪ ਜਲਦੀ ਡਿਪਲੋਇ ਕਰਨੀ ਹੈ" | `azd up` |
| "ਮੈਨੂੰ ਸਿਰਫ਼ ਇੱਕ ਸਟੋਰੇਜ਼ ਖਾਤਾ ਬਣਾਉਣਾ ਹੈ" | `az storage account create` |
| "ਮੈਂ ਇੱਕ ਪੂਰੀ AI ਐਪਲੀਕੇਸ਼ਨ ਬਣਾ ਰਿਹਾ ਹਾਂ" | `azd init --template azure-search-openai-demo` |
| "ਮੈਨੂੰ ਇੱਕ ਵਿਸ਼ੇਸ਼ Azure ਸਰੋਤ ਡੀਬੱਗ ਕਰਨਾ ਹੈ" | `az resource show` |
| "ਮੈਂ ਲੱਭੀ ਤਿਆਰ ਉਤਪਾਦਨ ਡਿਪਲੋਇਚਾਹੁੰਦਾ ਹਾਂ" | `azd up --environment production` |

### ਦੋਹਾਂ ਮਿਲ ਕੇ ਕੰਮ ਕਰਦੇ ਹਨ!

AZD ਹੇਠਾਂ Azure CLI ਨੂੰ ਵਰਤਦਾ ਹੈ। ਤੁਸੀਂ ਦੋਹਾਂ ਵਰਤ ਸਕਦੇ ਹੋ:
```bash
# ਆਪਣੇ ਐਪ ਨੂੰ AZD ਨਾਲ ਤਹਿ ਕਰੋ
azd up

# ਫਿਰ Azure CLI ਨਾਲ ਖਾਸ ਸਰੋਤਾਂ ਨੂੰ ਸੁਧਾਰੋ
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD ਵਿੱਚ ਟੈਮਪਲੇਟ ਲੱਭੋ

ਖਾਲੀ ਸਥਾਨ ਤੋਂ ਸ਼ੁਰੂ ਨਾ ਕਰੋ! **Awesome AZD** ਇੱਕ ਸਮੁਦਾਇਕ ਸੰਗ੍ਰਹਿ ਹੈ ਜੋ ਤਿਆਰ-ਡਿਪਲੋਇ ਟੈਮਪਲੇਟਾਂ ਨੂੰ ਇਕੱਠਾ ਕਰਦਾ ਹੈ:

| ਸਰੋਤ | ਵੇਰਵਾ |
|----------|-------------|
| 🔗 [**Awesome AZD ਗੈਲਰੀ**](https://azure.github.io/awesome-azd/) | ਇੱਕ-ਕਲਿੱਕ ਡਿਪਲੋਇ ਨਾਲ 200+ ਟੈਮਪਲੇਟ ਬ੍ਰਾਊਜ਼ ਕਰੋ |
| 🔗 [**ਟੈਮਪਲੇਟ ਦੀ ਸਬਮਿਟ ਕਰੋ**](https://github.com/Azure/awesome-azd/issues) | ਆਪਣਾ ਟੈਮਪਲੇਟ ਸਮੁਦਾਇ ਵਿੱਚ ਯੋਗਦਾਨ ਦਿਓ |
| 🔗 [**GitHub ਰਿਪੋਜਟਰੀ**](https://github.com/Azure/awesome-azd) | ਸਤਰ ਅਤੇ ਸੋਰਸ ਖੋਜੋ |

### Awesome AZD ਤੋਂ ਪ੍ਰਸਿੱਧ AI ਟੈਮਪਲੇਟ

```bash
# Microsoft Foundry ਮਾਡਲਾਂ ਨਾਲ RAG ਚੈਟ + AI ਖੋਜ
azd init --template azure-search-openai-demo

# ਤੇਜ਼ AI ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ
azd init --template openai-chat-app-quickstart

# Foundry ਏਜੰਟਾਂ ਨਾਲ AI ਏਜੰਟਸ
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 ਕਦਮਾਂ ਵਿੱਚ ਸ਼ੁਰੂਆਤ

ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਯਕੀਨ ਕਰੋ ਕਿ ਤੁਹਾਡੀ ਮਸ਼ੀਨ ਉਸ ਟੈਮਪਲੇਟ ਲਈ ਤਿਆਰ ਹੈ ਜੋ ਤੁਸੀਂ ਡਿਪਲੋਇ ਕਰਨਾ ਚਾਹੁੰਦੇ ਹੋ:

**ਵਿੰਡੋਜ਼:**
```powershell
.\validate-setup.ps1
```

**macOS / ਲਿਨਕਸ:**
```bash
bash ./validate-setup.sh
```

ਜੇ ਕੋਈ ਜ਼ਰੂਰੀ ਚੈਕ ਫੇਲ ਹੋਵੇ, ਪਹਿਲਾਂ ਉਸਨੂੰ ਠੀਕ ਕਰੋ ਅਤੇ ਫਿਰ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ ਨਾਲ ਜਾਰੀ ਰੱਖੋ।

### ਕਦਮ 1: AZD ਇੰਸਟਾਲ ਕਰੋ (2 ਮਿੰਟ)

**ਵਿੰਡੋਜ਼:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**ਲਿਨਕਸ:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### ਕਦਮ 2: AZD ਲਈ ਪ੍ਰਮਾਣਿਕਤਾ

```bash
# ਜੇ ਤੁਸੀਂ ਇਸ ਕੋਰਸ ਵਿੱਚ ਸਿੱਧਾ Azure CLI ਕਮਾਂਡਾਂ ਵਰਤਣ ਦਾ ਯੋਜਨਾ ਬਣਾ ਰਹੇ ਹੋ ਤਾਂ ਵਿਕਲਪਿਕ
az login

# AZD ਵਰਕਫਲੋਜ਼ ਲਈ ਲੋੜੀਂਦਾ
azd auth login
```

ਜੇ ਤੁਸੀਂ ਨਹੀਂ ਜਾਣਦੇ ਕਿ ਤੁਹਾਨੂੰ ਕਿਹੜੀ ਲੋੜ ਹੈ, ਤਾਂ [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ](docs/chapter-01-foundation/installation.md#authentication-setup) ਵਿੱਚ ਪੂਰਾ ਸੈਟਅਪ ਫਲੋ ਫਾਲੋ ਕਰੋ।

### ਕਦਮ 3: ਆਪਣੀ ਪਹਿਲੀ ਐਪ ਡਿਪਲੋਇ ਕਰੋ

```bash
# ਟੈਮਪਲੇਟ ਤੋਂ ਸ਼ੁਰੂ ਕਰੋ
azd init --template todo-nodejs-mongo

# ਅਜ਼ੂਰੇ 'ਤੇ ਬਹਾਲ ਕਰੋ (ਸਭ ਕੁਝ ਬਣਾਉਂਦਾ ਹੈ!)
azd up
```

**🎉 ਕਾਮ ਮੁਕੰਮਲ!** ਤੁਹਾਡੀ ਐਪ ਹੁਣ ਐਜ਼ੂਰ 'ਤੇ ਸੁਰੱਖਿਅਤ ਤੌਰ 'ਤੇ ਚੱਲ ਰਹੀ ਹੈ।

### ਸਾਫ-ਸੁਥਰਾ (ਭੁੱਲਣਾ ਨਾ)

```bash
# ਪ੍ਰਯੋਗ ਕਰਨ ਮਗਰੋਂ ਸਾਰੇ ਸਰੋਤ ਹਟਾਓ
azd down --force --purge
```

---

## 📚 ਇਸ ਕੋਰਸ ਨੂੰ ਵਰਤਣ ਦਾ ਤਰੀਕਾ

ਇਹ ਕੋਰਸ **ਕ੍ਰਮਬੱਧ ਸਿੱਖਣ** ਲਈ ਡਿਜ਼ਾਇਨ ਕੀਤਾ ਗਿਆ ਹੈ - ਜਿੱਥੇ ਤੁਹਾਨੂੰ ਆਸਾਨ ਲੱਗੇ ਤੇ ਉਥੇੋਂ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਅੱਗੇ ਵਧੋ:

| ਤੁਹਾਡੇ ਦਾ ਤਜਰਬਾ | ਇੱਥੇ ਸ਼ੁਰੂ ਕਰੋ |
|-----------------|------------|
| **ਐਜ਼ੂਰ ਵਿੱਚ ਬਿਲਕੁਲ ਨਵਾਂ** | [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ](#-chapter-1-foundation--quick-start) |
| **ਐਜ਼ੂਰ ਜਾਣਦੇ ਹੋ, ਪਰ AZD ਵਿੱਚ ਨਵਾਂ** | [ਅਧਿਆਇ 1: ਬੁਨਿਆਦ](#-chapter-1-foundation--quick-start) |
| **AI ਐਪਸ ਡਿਪਲੋਇ ਕਰਨੀ ਹੈ** | [ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **ਹੱਥੋਂ-ਕੰਮ ਕਰਨ ਦਾ ਅਭਿਆਸ ਚਾਹੁੰਦੇ ਹੋ** | [🎓 ਇੰਟਰਐਕਟਿਵ ਵਰਕਸ਼ਾਪ](workshop/README.md) - 3-4 ਘੰਟੇ ਦੀ ਮਾਰਗਦਰਸ਼ਕ ਲੈਬ |
| **ਉਤਪਾਦਨ ਪੈਟਰਨ ਚਾਹੀਦੇ ਹਨ** | [ਅਧਿਆਇ 8: ਉਤਪਾਦਨ ਅਤੇ ਉਦਯੋਗ](#-chapter-8-production--enterprise-patterns) |

### ਤੇਜ਼ ਸੈਟਅਪ

1. **ਇਸ ਰਿਪੋਜਟਰੀ ਨੂੰ ਫੋਰਕ ਕਰੋ**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ਕਲੋਨ ਕਰੋ**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **ਮਦਦ ਪ੍ਰਾਪਤ ਕਰੋ**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **ਥਾਂਈ ਕਲੋਨ ਕਰਨਾ ਪਸੰਦ ਹੈ?**

> ਇਸ ਰਿਪੋਜਟਰੀ ਵਿੱਚ 50+ ਭਾਸ਼ਾ ਅਨੁਵਾਦ ਸ਼ਾਮਲ ਹਨ ਜੋ ਡਾਊਨਲੋਡ ਸਾਈਜ਼ ਨੂ ਵੱਡਾ ਕਰਦੇ ਹਨ। ਅਨੁਵਾਦਾਂ ਦੇ ਬਿਨਾਂ ਕਲੋਨ ਕਰਨ ਲਈ, sparse checkout ਵਰਤੋ:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ਇਹ ਤੁਹਾਨੂੰ ਤੇਜ਼ ਡਾਊਨਲੋਡ ਨਾਲ ਕੋਰਸ ਪੂਰਾ ਕਰਨ ਲਈ ਸਾਰਾ ਕੁਝ ਦਿੰਦਾ ਹੈ।


## ਕੋਰਸ ਦਾ ਜਾਇਜ਼ਾ

ਸੀਖੋ Azure Developer CLI (azd) ਨੂੰ ਸੰਰਚਿਤ ਅਧਿਆਆਇਆਂ ਰਾਹੀਂ ਜੋ ਕਦਮ-ਦਰ-ਕਦਮ ਸਿੱਖਣ ਲਈ ਬਣਾਏ ਗਏ ਹਨ। **ਮਾਈਕਰੋਸਾਫਟ ਫਾਉਂਡਰੀ ਇੱਕਤਾ ਨਾਲ AI ਐਪ ਵਿਕਾਸ ਤੇ ਵਿਸ਼ੇਸ਼ ਧਿਆਨ।**


### ਇਹ ਕੋਰਸ ਆਧੁਨਿਕ ਡਿਵੈਲਪਰਾਂ ਲਈ ਕਿਉਂ ਜਰੂਰੀ ਹੈ

ਮਾਈਕ੍ਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਡਿਸਕੋਰਡ ਕਮਿਊਨਿਟੀ ਦੀਆਂ ਜਾਣਕਾਰੀਆਂ ਦੇ ਅਧਾਰ 'ਤੇ, **45% ਡਿਵੈਲਪਰ AZD ਨੂੰ AI ਵਰਕਲੋਡ ਲਈ ਵਰਤਣਾ ਚਾਹੁੰਦੇ ਹਨ** ਪਰ ਹੇਠ ਲਿਖੀਆਂ ਚੁਣੌਤੀਆਂ ਦਾ ਸਾਹਮਣਾ ਕਰਦੇ ਹਨ:
- ਜਟਿਲ ਮਲਟੀ-ਸਰਵਿਸ AI ਆਰਕੀਟੈਕਚਰ
- ਪ੍ਰੋਡਕਸ਼ਨ AI ਡਿਪਲਾਇਮੈਂਟ ਦੀਆਂ ਸਭ ਤੋਂ ਵਧੀਆ ਪ੍ਰਥਾਵਾਂ  
- ਅਜੁਰ AI ਸਰਵਿਸ ਦੇ ਇੰਟੀਗ੍ਰੇਸ਼ਨ ਅਤੇ ਕੋਨਫਿਗਰੇਸ਼ਨ
- AI ਵਰਕਲੋਡ ਲਈ ਖਰਚਾ ਵਿਕਸਿਤ ਕਰਨਾ
- ਖਾਸ ਤੌਰ 'ਤੇ AI ਡਿਪਲਾਇਮੈਂਟ ਮਸਲਿਆਂ ਦਾ ਟਰਬਲਸ਼ੂਟਿੰਗ

### ਸਿੱਖਣ ਦੇ ਲਕੜ

ਇਸ ਸੰਰਚਿਤ ਕੋਰਸ ਨੂੰ ਪੂਰਾ ਕਰਕੇ, ਤੁਸੀਂ:
- **AZD ਮੂਲਭੂਤ ਜਾਣਕਾਰੀਆਂ ਵਿੱਚ ਮਾਹਰ ਹੋਵੋਗੇ**: ਮੁੱਲ ਭਾਸ਼ਾ, ਇੰਸਟਾਲੇਸ਼ਨ, ਅਤੇ ਕੋਨਫਿਗਰੇਸ਼ਨ
- **AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲਾਇ ਕਰਨਾ ਸਿੱਖੋਗੇ**: AZD ਨੂੰ ਮਾਈਕ੍ਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਸਰਵਿਸਾਂ ਨਾਲ ਵਰਤਣਾ
- **Infrastructure as Code ਲਾਗੂ ਕਰੋ**: ਬਾਇਸਪ ਟੈਂਪਲੇਟਸ ਨਾਲ ਅਜੁਰ ਸਰੋਤਾਂ ਦਾ ਪ੍ਰਬੰਧਨ
- **ਡਿਪਲਾਇਮੈਂਟ ਟਰਬਲਸ਼ੂਟ ਕਰੋ**: ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਹੱਲ ਕਰੋ ਅਤੇ ਡਿਬੱਗ ਕਰੋ
- **ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਵਿਕਸਿਤ ਕਰੋ**: ਸੁਰੱਖਿਆ, ਸਕੇਲਿੰਗ, ਮਾਨਿਟਰਿੰਗ ਅਤੇ ਲਾਗਤ ਪ੍ਰਬੰਧਨ
- **ਮਲਟੀ-ਏਜੰਟ ਹੱਲ ਬਣਾਓ**: ਜਟਿਲ AI ਆਰਕੀਟੈਕਚਰ ਡਿਪਲਾਇ ਕਰੋ

## ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ: ਖਾਤੇ, ਐਕਸੈਸ ਅਤੇ ਧਾਰਣਾਵਾਂ

ਚੈਪਟਰ 1 ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ, ਯਕੀਨੀ ਬਣਾਓ ਕਿ ਹੇਠ ਲਿਖੀਆਂ ਚੀਜ਼ਾਂ ਹਨ। ਇਸ ਮਾਰਗਦਰਸ਼ਿਕਾ ਵਿੱਚ ਇੰਸਟਾਲੇਸ਼ਨ ਕਦਮ ਇਹਨਾਂ ਬੁਨਿਆਦੀਆਂ ਨੂੰ ਮੰਨਦੇ ਹਨ ਜੋ ਪਹਿਲਾਂ ਹੀ ਸੰਭਾਲੇ ਗਏ ਹਨ।

- **ਇੱਕ ਅਜੁਰ ਸਬਸਕ੍ਰਿਪਸ਼ਨ**: ਤੁਸੀਂ ਤੁਹਾਡੇ ਕੰਮ ਜਾਂ ਖੁਦ ਦੇ ਖਾਤੇ ਦਾ ਮੌਜੂਦਾ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵਰਤ ਸਕਦੇ ਹੋ, ਜਾਂ ਸ਼ੁਰੂ ਕਰਨ ਲਈ [ਫ੍ਰੀ ਟ੍ਰਾਇਲ](https://aka.ms/azurefreetrial) ਬਣਾਉ.
- **ਅਜੁਰ ਸਰੋਤ ਬਣਾਉਣ ਦੀ ਅਨੁਮਤੀ**: ਅਧਿਕਤਮ ਅਭਿਆਸਾਂ ਲਈ, ਤੁਹਾਡੇ ਕੋਲ ਲੱਭਣ ਵਾਲੇ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਾਂ ਸਰੋਤ ਸਮੂਹ 'ਤੇ ਘੱਟੋ ਘੱਟ **ਕਨ੍ਟ੍ਰਿਬਿਊਟਰ** ਐਕਸੈਸ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ। ਕੁਝ ਅਧਿਆਇ ਇਹ ਵੀ ਮੰਨਦੇ ਹਨ ਕਿ ਤੁਸੀਂ ਸਰੋਤ ਸਮੂਹ, ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਅਤੇ RBAC ਅਸਾਈਨਮੈਂਟਸ ਬਣਾਉਣ ਦੇ ਯੋਗ ਹੋ।
- [**ਇੱਕ GitHub ਖਾਤਾ**](https://github.com): ਇਹ ਰਿਪੋਜ਼ਟੋਰੀ ਨੂੰ ਫੋਰਕ ਕਰਨ, ਤੁਹਾਡੇ ਆਪਣੇ ਬਦਲਾਅ ਟਰੈਕ ਕਰਨ ਅਤੇ ਗਿੱਟਹੱਬ ਕੋਡਸਪੇਸ ਵਰਕਸ਼ਾਪ ਲਈ ਵਰਤਣ ਲਈ ਲਾਭਦਾਇਕ ਹੈ।
- **ਟੈਂਪਲੇਟ ਰਨਟਾਈਮ ਲੋੜੀਂਦੇ**: ਕੁਝ ਟੈਂਪਲੇਟਸ ਲਈ ਸਥਾਨਕ ਟੂਲਜ਼ ਜਿਵੇਂ Node.js, Python, Java, ਜਾਂ Docker ਦੀ ਲੋੜ ਹੈ। ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਸੈਟਅਪ ਵੈਲੀਡੇਟਰ ਚਲਾਓ ਤਾਂ ਜੋ ਤੁਸੀਂ ਤੁਰੰਤ ਕਮੀ ਵਾਲੇ ਟੂਲਜ਼ ਦੀ ਪਛਾਣ ਕਰ ਸਕੋ।
- **ਮੂਲ ਟਰਮੀਨਲ ਜਾਣਕਾਰੀ**: ਤੁਹਾਨੂੰ ਮਾਹਿਰ ਹੋਣ ਦੀ ਲੋੜ ਨਹੀਂ ਹੈ, ਪਰ ਤੁਹਾਨੂੰ ਕਮਾਂਡਾਂ ਜਿਵੇਂ `git clone`, `azd auth login`, ਅਤੇ `azd up` ਚਲਾਉਣ ਵਿੱਚ ਆਸਾਨੀ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ।

> **ਕੀ ਤੁਸੀਂ ਕਈ ਕਾਰਪੋਰੇਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਵਿੱਚ ਕੰਮ ਕਰ ਰਹੇ ਹੋ?**
> ਜੇ ਤੁਹਾਡਾ ਅਜੁਰ ਮਾਹੌਲ ਇੱਕ ਐਡਮਿਨਿਸਟਰੇਟਰ ਦੁਆਰਾ ਪ੍ਰਬੰਧਿਤ ਹੈ, ਤਾਂ ਪਹਿਲਾਂ ਹੀ ਪੁੱਛ ਲਓ ਕਿ ਤੁਸੀਂ ਜਿਸ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਾਂ ਸਰੋਤ ਸਮੂਹ ਵਿੱਚ ਸਰੋਤ ਡਿਪਲਾਇ ਕਰਨ ਜਾ ਰਹੇ ਹੋ, ਉਸ ਵਿੱਚ ਤੁਹਾਡਾ ਅਧਿਕਾਰ ਹੈ ਜਾਂ ਨਹੀਂ। ਜੇ ਨਹੀਂ, ਤਾਂ ਸ਼ੁਰੂ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਸੈਂਡਬਾਕਸ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਜਾਂ Contributor ਐਕਸੈਸ ਲਈ ਪੁੱਛੋ।

> **ਅਜੁਰ ਵਿੱਚ ਨਵੇਂ ਹੋ?**
> ਆਪਣੇ ਆਪ ਦੀ ਅਜੁਰ ਟ੍ਰਾਇਲ ਜਾਂ ਪ੍ਰਦਾਨ ਕਰਦੀਆਂ ਮੁਦਤਾਂ ਵਾਲੀ ਸਬਸਕ੍ਰਿਪਸ਼ਨ https://aka.ms/azurefreetrial 'ਤੇ ਸ਼ੁਰੂ ਕਰੋ ਤਾਂ ਜੋ ਤੁਸੀਂ ਕਿਰਿਆਵਾਂ ਨੂੰ ਬਿਨਾਂ ਕਿਰਾਏ ਦੇ ਸਹਾਰਿਆਂ ਦੇ ਪੂਰਾ ਕਰ ਸਕੋ।

## 🗺️ ਕੋਰਸ ਮੈਪ: ਅਨੁਭਾਗ ਦੇ ਅਨੁਸਾਰ ਤੁਰੰਤ ਨੈਵੀਗੇਸ਼ਨ

ਹਰ ਅਧਿਆਇ ਦਾ ਇੱਕ ਸਮਰਪਿਤ README ਹੈ ਜਿਸ ਵਿੱਚ ਸਿੱਖਣ ਦੇ ਲਕੜ, ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ ਅਤੇ ਕਸਰਤਾਂ ਹਨ:

| ਅਧਿਆਇ | ਵਿਸ਼ਾ | ਪਾਠ | ਅਵਧੀ | ਜਟਿਲਤਾ |
|---------|-------|---------|----------|------------|
| **[ਅਧਿਆਇ 1: ਬੁਨਿਆਦ](docs/chapter-01-foundation/README.md)** | ਸ਼ੁਰੂਆਤ | [AZD ਅਧਾਰ](docs/chapter-01-foundation/azd-basics.md) &#124; [ਇੰਸਟਾਲੇਸ਼ਨ](docs/chapter-01-foundation/installation.md) &#124; [ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](docs/chapter-01-foundation/first-project.md) | 30-45 ਮਿੰਟ | ⭐ |
| **[ਅਧਿਆਇ 2: AI ਵਿਕਾਸ](docs/chapter-02-ai-development/README.md)** | AI-ਪਹਿਲਾ ਐਪ | [ਫਾਊਂਡਰੀ ਇੰਟੀਗ੍ਰੇਸ਼ਨ](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ਏਜੰਟ](docs/chapter-02-ai-development/agents.md) &#124; [ਮਾਡਲ ਡਿਪਲਾਇਮੈਂਟ](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [ਵਰਕਸ਼ਾਪ](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 ਘੰਟੇ | ⭐⭐ |
| **[ਅਧਿਆਇ 3: ਕੋਨਫ਼ਿਗਰੇਸ਼ਨ](docs/chapter-03-configuration/README.md)** | ਗੁਆਚ ਅਤੇ ਸੁਰੱਖਿਆ | [ਕੋਨਫਿਗਰੇਸ਼ਨ](docs/chapter-03-configuration/configuration.md) &#124; [ਗੁਆਚ ਅਤੇ ਸੁਰੱਖਿਆ](docs/chapter-03-configuration/authsecurity.md) | 45-60 ਮਿੰਟ | ⭐⭐ |
| **[ਅਧਿਆਇ 4: ਇੰਫਰਾਸਟਰੱਕਚਰ](docs/chapter-04-infrastructure/README.md)** | IaC ਅਤੇ ਡਿਪਲਾਇਮੈਂਟ | [ਡਿਪਲਾਇਮੈਂਟ ਗਾਈਡ](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 ਘੰਟੇ | ⭐⭐⭐ |
| **[ਅਧਿਆਇ 5: ਮਲਟੀ-ਏਜੰਟ](docs/chapter-05-multi-agent/README.md)** | AI ਏਜੰਟ ਹੱਲ | [ਰੀਟੇਲ ਦ੍ਰਿਸ਼ਯ](examples/retail-scenario.md) &#124; [ਸੰਯੋਗ ਪੈਟਰਨ](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 ਘੰਟੇ | ⭐⭐⭐⭐ |
| **[ਅਧਿਆਇ 6: ਪਹਿਲਾਂ ਡਿਪਲਾਇਮੈਂਟ](docs/chapter-06-pre-deployment/README.md)** | ਯੋਜਨਾ ਅਤੇ ਵੈਰੀਫਿਕੇਸ਼ਨ | [ਪ੍ਰੀਫਲਾਈਟ ਚੈਕ](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [ਛਮਤਾ ਯੋਜਨਾ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU ਚੋਣ](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ਐਪ ਇਨਸਾਇਟਸ](docs/chapter-06-pre-deployment/application-insights.md) | 1 ਘੰਟਾ | ⭐⭐ |
| **[ਅਧਿਆਇ 7: ਟਰਬਲਸ਼ੂਟਿੰਗ](docs/chapter-07-troubleshooting/README.md)** | ਡਿਬੱਗ ਅਤੇ ਫਿਕਸ | [ਆਮ ਸਮੱਸਿਆਵਾਂ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ਡਿਬੱਗਿੰਗ](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI ਸਮੱਸਿਆਵਾਂ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 ਘੰਟੇ | ⭐⭐ |
| **[ਅਧਿਆਇ 8: ਪ੍ਰੋਡਕਸ਼ਨ](docs/chapter-08-production/README.md)** | ਕਾਰਪੋਰੇਟ ਪੈਟਰਨ | [ਪ੍ਰੋਡਕਸ਼ਨ ਅਭਿਆਸ](docs/chapter-08-production/production-ai-practices.md) | 2-3 ਘੰਟੇ | ⭐⭐⭐⭐ |
| **[🎓 ਵਰਕਸ਼ਾਪ](workshop/README.md)** | ਹੱਥ-ਵਲੈਬ | [ ਜਾਣਪਛਾਣ](workshop/docs/instructions/0-Introduction.md) &#124; [ਚੋਣ](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [ਵੈਰੀਫਿਕੇਸ਼ਨ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [ਵਿਚਾਰ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [ਕੋਨਫਿਗਰੇਸ਼ਨ](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [ਟੀਅਰਡਾਊਨ](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [ਸਮਾਪਤੀ](workshop/docs/instructions/7-Wrap-up.md) | 3-4 ਘੰਟੇ | ⭐⭐ |

**ਕੁੱਲ ਕੋਰਸ ਅਵਧੀ:** ~10-14 ਘੰਟੇ | **ਕੌਸ਼ਲ ਪ੍ਰਗਤੀ:** ਸ਼ੁਰੂਆਤੀ → ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ

---

## 📚 ਸਿੱਖਣ ਵਾਲੇ ਅਧਿਆਇ

*ਆਪਣੇ ਤਜਰਬੇ ਦੀ ਦਰਜ਼ਾ ਅਤੇ ਲਕੜੀ ਦੇ ਅਧਾਰ 'ਤੇ ਆਪਣਾ ਸਿੱਖਣ ਦਾ ਰਸਤਾ ਚੁਣੋ*

### 🚀 ਅਧਿਆਇ 1: ਬੁਨਿਆਦ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾ**: ਅਜੁਰ ਸਬਸਕ੍ਰਿਪਸ਼ਨ, ਮੂਲ ਕਮਾਂਡ ਲਾਈਨ ਜਾਣਕਾਰੀ  
**ਅਵਧੀ**: 30-45 ਮਿੰਟ  
**ਜਟਿਲਤਾ**: ⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਅਜੁਰ ਡਿਵੈਲਪਰ CLI ਦੇ ਮੂਲ ਅਸੂਲਾਂ ਦੀ ਸਮਝ
- ਆਪਣੇ ਪਲੇਟਫਾਰਮ 'ਤੇ AZD ਨੂੰ ਇੰਸਟਾਲ ਕਰਨਾ
- ਤੁਹਾਡਾ ਪਹਿਲਾ ਸਫਲ ਡਿਪਲਾਇਮੈਂਟ

#### ਸਿੱਖਣ ਦੇ ਸਾਧਨ
- **🎯 ਇੱਥੇ ਸ਼ੁਰੂ ਕਰੋ**: [ਅਜੁਰ ਡਿਵੈਲਪਰ CLI ਕੀ ਹੈ?](#what-is-azure-developer-cli)
- **📖 ਸਿਧਾਂਤ**: [AZD ਮੁਢਲੀ ਗੱਲਾਂ](docs/chapter-01-foundation/azd-basics.md) - ਮੂਲ ਧਾਰਣਾ ਅਤੇ ਸ਼ਬਦਾਵਲੀ
- **⚙️ ਸੈਟਅਪ**: [ਇੰਸਟਾਲੇਸ਼ਨ ਅਤੇ ਸੈਟਅਪ](docs/chapter-01-foundation/installation.md) - ਪਲੇਟਫਾਰਮ-ਵਿਸ਼ੇਸ਼ ਮਾਰਗਦਰਸ਼ਨ
- **🛠️ ਹੱਥ-ਵਲੈਬ**: [ਤੁਹਾਡਾ ਪਹਿਲਾ ਪ੍ਰੋਜੈਕਟ](docs/chapter-01-foundation/first-project.md) - ਵੱਖ-ਵੱਖ ਕਦਮਾਂ ਦਾ ਟਿਊਟੋਰੀਅਲ
- **📋 ਤੁਰੰਤ ਸੰਦਰਭ**: [ਕਮਾਂਡ ਚੀਟ ਸ਼ੀਟ](resources/cheat-sheet.md)

#### ਕਾਰਗੁਜ਼ਾਰੀ ਕਸਰਤਾਂ
```bash
# ਤੇਜ਼ ਇੰਸਟਾਲੇਸ਼ਨ ਚੈੱਕ
azd version

# ਆਪਣੀ ਪਹਿਲੀ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੌਇ ਕਰੋ
azd init --template todo-nodejs-mongo
azd up
```

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: AZD ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਅਸਾਨ ਵੈੱਬ ਅਪਲੀਕੇਸ਼ਨ ਨੂੰ ਸਫਲਤਾਪੂਰਵਕ ਅਜੁਰ 'ਤੇ ਡਿਪਲਾਇ ਕਰੋ

**✅ ਸਫਲਤਾ ਦੀ ਪੁਸ਼ਟੀ:**
```bash
# ਧੜਾ 1 ਪੂਰਾ ਕਰਨ ਤੋਂ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ:
azd version              # ਸਥਾਪਤ ਵਰਜਨ ਦਿਖਾਉਂਦਾ ਹੈ
azd init --template todo-nodejs-mongo  # ਪ੍ਰੋਜੈਕਟ ਸ਼ੁਰੂ ਕਰਦਾ ਹੈ
azd up                  # ਐਜ਼ਿਊਰ 'ਤੇ ਡਿਪਲੌਏ ਕਰਦਾ ਹੈ
azd show                # ਚੱਲ ਰਹੇ ਐਪ URL ਦਿਖਾਉਂਦਾ ਹੈ
# ਐਪਲੀਕੇਸ਼ਨ ਬ੍ਰਾੁਜ਼ਰ ਵਿੱਚ ਖੁਲਦਾ ਹੈ ਅਤੇ ਕੰਮ ਕਰਦਾ ਹੈ
azd down --force --purge  # ਸਰੋਤ ਸਾਫ ਕਰਦਾ ਹੈ
```

**📊 ਸਮਾਂ ਲਗਤ:** 30-45 ਮਿੰਟ  
**📈 ਕੌਸ਼ਲ ਪੱਧਰ ਬਾਅਦ:** ਮੁੱਲ ਭਾਸ਼ਕ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਖੁਦ-ਮੁਖਤਿਆਰ ਤੌਰ 'ਤੇ ਡਿਪਲਾਇ ਕਰ ਸਕਦਾ ਹੈ
**📈 ਕੌਸ਼ਲ ਪੱਧਰ ਬਾਅਦ:** ਮੁੱਲ ਭਾਸ਼ਕ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਖੁਦ-ਮੁਖਤਿਆਰ ਤੌਰ 'ਤੇ ਡਿਪਲਾਇ ਕਰ ਸਕਦਾ ਹੈ

---

### 🤖 ਅਧਿਆਇ 2: AI-ਪਹਿਲਾ ਵਿਕਾਸ (AI ਡਿਵੈਲਪਰਾਂ ਲਈ ਸਿਫ਼ਾਰਸ਼ੀ)
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾ**: ਚੈਪਟਰ 1 ਪੂਰਾ ਹੋਇਆ  
**ਅਵਧੀ**: 1-2 ਘੰਟੇ  
**ਜਟਿਲਤਾ**: ⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- Microsoft Foundry ਦਾ AZD ਨਾਲ ਇੰਟੀਗ੍ਰੇਸ਼ਨ
- AI-ਸਮਰੱਥ ਐਪਲੀਕੇਸ਼ਨਾਂ ਦੀ ਡਿਪਲਾਇਮੈਂਟ
- AI ਸਰਵਿਸ ਕੋਨਫਿਗਰੇਸ਼ਨਾਂ ਦੀ ਸਮਝ

#### ਸਿੱਖਣ ਦੇ ਸਾਧਨ
- **🎯 ਇੱਥੇ ਸ਼ੁਰੂ ਕਰੋ**: [ਮਾਈਕ੍ਰੋਸੌਫਟ ਫਾਊਂਡਰੀ ਇੰਟੀਗ੍ਰੇਸ਼ਨ](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI ਏਜੰਟਸ**: [AI ਏਜੰਟਸ ਗਾਈਡ](docs/chapter-02-ai-development/agents.md) - AZD ਨਾਲ ਬੁੱਧੀਮਾਨ ਏਜੰਟ ਡਿਪਲਾਇ ਕਰੋ
- **📖 ਪੈਟਰਨਜ਼**: [AI ਮਾਡਲ ਡਿਪਲਾਇਮੈਂਟ](docs/chapter-02-ai-development/ai-model-deployment.md) - AI ਮਾਡਲ ਡਿਪਲਾਇ ਅਤੇ ਪ੍ਰਬੰਧਨ
- **🛠️ ਵਰਕਸ਼ਾਪ**: [AI ਵਰਕਸ਼ਾਪ ਲੈਬ](docs/chapter-02-ai-development/ai-workshop-lab.md) - ਤੁਹਾਡੀਆਂ AI ਹੱਲਾਂ ਨੂੰ AZD-ਤਿਆਰ ਬਣਾਓ
- **🎥 ਇੰਟਰਐਕਟਿਵ ਗਾਈਡ**: [ਵਰਕਸ਼ਾਪ ਸਮਗਰੀ](workshop/README.md) - MkDocs * DevContainer Environment ਨਾਲ ਬ੍ਰਾਊਜ਼ਰ ਅਧਾਰਿਤ ਸਿੱਖਿਆ
- **📋 ਟੈਂਪਲੇਟਸ**: [Microsoft Foundry Templates](#ਵਰਕਸ਼ਾਪ-ਸਰੋਤ)
- **📝 ਉਦਾਹਰਣਾਂ**: [AZD ਡਿਪਲਾਇਮੈਂਟ ਉਦਾਹਰਨਾਂ](examples/README.md)

#### ਕਾਰਗੁਜ਼ਾਰੀ ਕਸਰਤਾਂ
```bash
# ਆਪਣਾ ਪਹਿਲਾ AI ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ
azd init --template azure-search-openai-demo
azd up

# ਹੋਰ AI ਟੈਮਪਲੇਟਾਂ ਦੀ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: RAG ਸਮਰੱਥਾਵਾਂ ਨਾਲ AI-ਸਮਰੱਥ ਚੈਟ ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲਾਇ ਅਤੇ ਕੋਨਫਿਗਰ ਕਰੋ

**✅ ਸਫਲਤਾ ਦੀ ਪੁਸ਼ਟੀ:**
```bash
# ਚੈਪਟਰ 2 ਦੇ ਬਾਅਦ, ਤੁਸੀਂ ਸਮਰੱਥ ਹੋਣਾ ਚਾਹੀਦਾ ਹੈ ਕਿ:
azd init --template azure-search-openai-demo
azd up
# ਏਆਈ ਚੈਟ ਇੰਟਰਫੇਸ ਦੀ ਜਾਂਚ ਕਰੋ
# ਸਵਾਲ ਪੁੱਛੋ ਅਤੇ ਸਰੋਤਾਂ ਨਾਲ ਏਆਈ-ਚਾਲਿਤ ਜਵਾਬ ਪ੍ਰਾਪਤ ਕਰੋ
# ਖੋਜ ਸੰਗ੍ਰਹਿ ਕਰਨ ਦੀ ਜਾਂਚ ਕਰੋ ਕਿ ਕੰਮ ਕਰਦਾ ਹੈ
azd monitor  # ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਟੈਲੀਮੇਟਰੀ ਦਿਖਾਉਂਦਾ ਹੈ ਕਿ ਜਾਂਚ ਕਰੋ
azd down --force --purge
```

**📊 ਸਮਾਂ ਲਗਤ:** 1-2 ਘੰਟੇ  
**📈 ਕੌਸ਼ਲ ਪੱਧਰ ਬਾਅਦ:** ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲਾਇ ਅਤੇ ਕੋਨਫਿਗਰ ਕਰ ਸਕਦਾ ਹੈ  
**💰 ਲਾਗਤ ਸੂਝ-ਬੂਝ:** $80-150/ਮਹੀਨਾ ਡੈਵ ਲਾਗਤ, $300-3500/ਮਹੀਨਾ ਪ੍ਰੋਡਕਸ਼ਨ ਲਾਗਤ ਸਮਝੋ

#### 💰 AI ਡਿਪਲਾਇਮੈਂਟ ਲਈ ਖ਼ਰਚੇ ਦੇ ਵਿਚਾਰ

**ਡੈਵਲਪਮੈਂਟ ਮਾਹੌਲ (ਅੰਦਾਜ਼ਾ $80-150/ਮਹੀਨਾ):**
- Microsoft Foundry ਮਾਡਲਜ਼ (ਪੇਅ-ਏਜ਼-ਯੂ-ਗੋ): $0-50/ਮਹੀਨਾ (ਟੋਕਨ ਦੀ ਵਰਤੋਂ ਅਨੁਸਾਰ)
- AI ਖੋਜ (ਬੇਸਿਕ ਟੀਅਰ): $75/ਮਹੀਨਾ
- ਕੰਟੇਨਰ ਐਪਸ (ਖਪਤ): $0-20/ਮਹੀਨਾ
- ਸਟੋਰੇਜ (ਸਟੈਂਡਰਡ): $1-5/ਮਹੀਨਾ

**ਪ੍ਰੋਡਕਸ਼ਨ ਮਾਹੌਲ (ਅੰਦਾਜ਼ਾ $300-3,500+/ਮਹੀਨਾ):**
- Microsoft Foundry ਮਾਡਲਜ਼ (ਪੂਰੇ ਟਾਈਮ ਯੂਟੇਜ ਲਈ): $3,000+/ਮਹੀਨਾ ਜਾਂ ਉੱਚ ਖਪਤ ਵਾਲੇ ਪੇਅ-ਏਜ਼-ਯੂ-ਗੋ
- AI ਖੋਜ (ਸਟੈਂਡਰਡ ਟੀਅਰ): $250/ਮਹੀਨਾ
- ਕੰਟੇਨਰ ਐਪਸ (ਮਨੋਨિ പ്രകਤ): $50-100/ਮਹੀਨਾ
- ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਇਟਸ: $5-50/ਮਹੀਨਾ
- ਸਟੋਰੇਜ (ਪ੍ਰੀਮੀਅਮ): $10-50/ਮਹੀਨਾ

**💡 ਖ਼ਰਚਾ ਬਚਾਉਣ ਵਾਲੀਆਂ ਸਿਫ਼ਾਰਸ਼ਾਂ:**
- ਸਿੱਖਣ ਲਈ **ਫ੍ਰੀ ਟੀਅਰ** Microsoft Foundry ਮਾਡਲਜ਼ ਵਰਤੋਂ (Azure OpenAI 50,000 ਟੋਕਨ/ਮਹੀਨਾ ਸ਼ਾਮਿਲ)
- ਜਦੋਂ ਐਕਟਿਵ ਆਮਲ ਨਹੀਂ ਹੋ ਰਹੀ, ਤਦ `azd down` ਚਲਾਕੇ ਸਰੋਤ ਬੰਦ ਕਰੋ
- ਖਪਤ ਅਧਾਰਤ ਬਿੱਲਿੰਗ ਨਾਲ ਸ਼ੁਰੂ ਕਰੋ, ਪ੍ਰੋਡਕਸ਼ਨ ਲਈ ਸੀਮਤ PTU ਬਣਾਓ
- ਡਿਪਲਾਇਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਲਾਗਤ ਦਾ ਅੰਦਾਜ਼ਾ ਲਗਾਉਣ ਲਈ `azd provision --preview` ਵਰਤੋਂ
- ਆਟੋ ਸਕੇਲਿੰਗ ਯੋਗ ਕਰੋ: ਸਿਰਫ਼ ਵਾਸਤਵਿਕ ਵਰਤੋਂ ਦਾ ਭੁਗਤਾਨ ਕਰੋ

**ਖ਼ਰਚਾ ਨਿਗਰਾਨੀ:**
```bash
# ਅੰਦਾਜ਼ਿਤ ਮਾਸਿਕ ਲਾਗਤਾਂ ਦੀ ਜਾਂਚ ਕਰੋ
azd provision --preview

# ਅਜ਼ੂਰ ਪੋਰਟਲ ਵਿੱਚ ਅਸਲ ਲਾਗਤਾਂ ਦੀ ਨਿਗਰਾਨੀ ਕਰੋ
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ ਅਧਿਆਇ 3: ਕੋਨਫਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾ**: ਚੈਪਟਰ 1 ਪੂਰਾ ਹੋਇਆ  
**ਅਵਧੀ**: 45-60 ਮਿੰਟ  
**ਜਟਿਲਤਾ**: ⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਮਾਹੌਲ ਕੋਨਫਿਗਰੇਸ਼ਨ ਅਤੇ ਪ੍ਰਬੰਧਨ
- ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸੁਰੱਖਿਆ ਦੀਆਂ ਸਭ ਤੋਂ ਵਧੀਆ ਪ੍ਰਥਾਵਾਂ
- ਸਰੋਤ ਨਾਮਕਰਨ ਅਤੇ ਸੰਗਠਨ

#### ਸਿੱਖਣ ਦੇ ਸਾਧਨ
- **📖 ਕੋਨਫਿਗਰੇਸ਼ਨ**: [ਕੋਨਫਿਗਰੇਸ਼ਨ ਮਾਰਗਦਰਸ਼ਨ](docs/chapter-03-configuration/configuration.md) - ਮਾਹੌਲ ਸੈਟਅਪ
- **🔐 ਸੁਰੱਖਿਆ**: [ਪ੍ਰਮਾਣਿਕਤਾ ਪੈਟਰਨ ਅਤੇ ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ](docs/chapter-03-configuration/authsecurity.md) - ਪ੍ਰਮਾਣਿਕਤਾ ਪੈਟਰਨ
- **📝 ਉਦਾਹਰਣਾਂ**: [ਡਾਟਾਬੇਸ ਐਪ ਉਦਾਹਰਣ](examples/database-app/README.md) - AZD ਡਾਟਾਬੇਸ ਉਦਾਹਰਣਾਂ

#### ਕਾਰਗੁਜ਼ਾਰੀ ਕਸਰਤਾਂ
- ਵੱਖ-ਵੱਖ ਮਾਹੌਲਾਂ (ਡੈਵ, ਸਟੇਜਿੰਗ, ਪ੍ਰੋਡ) ਲਈ ਕੋਨਫਿਗਰੇਸ਼ਨ
- ਮੈਨੇਜਡ ਆਈਡੈਂਟਿਟੀ ਪ੍ਰਮਾਣਿਕਤਾ ਸੈੱਟਅਪ ਕਰੋ
- ਮਾਹੌਲ ਵਿਸ਼ੇਸ਼ ਕੋਨਫਿਗਰੇਸ਼ਨਾਂ ਨੂੰ ਲਾਗੂ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਢੰਗ ਨਾਲ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਸੁਰੱਖਿਆ ਨਾਲ ਕਈ ਮਾਹੌਲਾਂ ਦਾ ਪ੍ਰਬੰਧਨ ਕਰੋ

---

### 🏗️ ਅਧਿਆਇ 4: Infrastructure as Code ਅਤੇ ਡਿਪਲਾਇਮੈਂਟ
**ਪੂਰਵ-ਆਵਸ਼ਕਤਾ**: ਅਧਿਆਇ 1-3 ਪੂਰੇ  
**ਅਵਧੀ**: 1-1.5 ਘੰਟੇ  
**ਜਟਿਲਤਾ**: ⭐⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਉੱਨਤ ਡਿਪਲਾਇਮੈਂਟ ਪੈਟਰਨਜ਼
- ਬਾਇਸਪ ਨਾਲ Infrastructure as Code
- ਸਰੋਤ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ ਰਣਨੀਤੀਆਂ

#### ਸਿੱਖਣ ਦੇ ਸਾਧਨ
- **📖 ਡਿਪਲਾਇਮੈਂਟ**: [ਡਿਪਲਾਇਮੈਂਟ ਮਾਰਗਦਰਸ਼ਨ](docs/chapter-04-infrastructure/deployment-guide.md) - ਸਮਾਪੂਰਨ ਵਰਕਫਲੋਜ਼
- **🏗️ ਪ੍ਰੋਵੀਜ਼ਨਿੰਗ**: [ਸਰੋਤ ਪ੍ਰਬੰਧਨ](docs/chapter-04-infrastructure/provisioning.md) - ਅਜੁਰ ਸਰੋਤ ਪ੍ਰਬੰਧਨ
- **📝 ਉਦਾਹਰਣਾਂ**: [ਕੰਟੇਨਰ ਐਪ ਉਦਾਹਰਣ](../../examples/container-app) - ਕੰਟੇਨਰਾਈਜ਼ਡ ਡਿਪਲਾਇਮੈਂਟਸ

#### ਕਾਰਗੁਜ਼ਾਰੀ ਕਸਰਤਾਂ
- ਕਸਟਮ ਬਾਇਸਪ ਟੈਂਪਲੇਟ ਬਣਾਓ
- ਮਲਟੀ-ਸਰਵਿਸ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲਾਇ ਕਰੋ
- ਨੀਲਾ-ਹਰਾ ਡਿਪਲਾਇਮੈਂਟ ਰਣਨੀਤੀਆਂ ਨੂੰ ਲਾਗੂ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਕਸਟਮ Infrastructure ਟੈਂਪਲੇਟਾਂ ਨਾਲ ਜਟਿਲ ਮਲਟੀ-ਸਰਵਿਸ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਡਿਪਲਾਇ ਕਰੋ

---


### 🎯 ਅਧਿਆਇ 5: ਬਹੁ-ਏਜੰਟ ਏਆਈ ਹੱਲ (ਉਨੱਤਰ)
**ਪੂਰਵ-ਸ਼ਰਤਾਂ**: ਅਧਿਆਇ 1-2 ਪੂਰੇ ਹੋਏ  
**ਅਵਧੀ**: 2-3 ਘੰਟੇ  
**ਜਟਿਲਤਾ**: ⭐⭐⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਬਹੁ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ ਪੈਟਰਨ
- ਏਜੰਟ ਸੰਚਾਲਨ ਅਤੇ ਸਹਿਯੋਗ
- ਉਤਪਾਦਨ-ਤਿਆਰ ਏਆਈ ਤੈਨਾਤੀਆਂ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **🤖 ਵਿਸ਼ੇਸ਼ ਪ੍ਰਾਜੈਕਟ**: [ਰਿਟੇਲ ਬਹੁ-ਏਜੰਟ ਹੱਲ](examples/retail-scenario.md) - ਪੂਰੀ ਲਾਗੂਆਇ
- **🛠️ ARM ਟੈਮਪਲੇਟਸ**: [ARM ਟੈਮਪਲੇਟ ਪੈਕੇਜ](../../examples/retail-multiagent-arm-template) - ਇਕ-ਕਲਿੱਕ ਤੈਨਾਤੀ
- **📖 ਆਰਕੀਟੈਕਚਰ**: [ਬਹੁ-ਏਜੰਟ ਸਹਿਯੋਗ ਪੈਟਰਨ](docs/chapter-06-pre-deployment/coordination-patterns.md) - ਪੈਟਰਨ

#### ਪ੍ਰਯੋਗਾਤਮਕ ਅਭਿਆਸ
```bash
# ਮੁਕੰਮਲ ਰਿਟੇਲ ਮਲਟੀ-ਏਜੰਟ ਹੱਲ ਨੂੰ ਤੈਅਾਰ ਕਰੋ
cd examples/retail-multiagent-arm-template
./deploy.sh

# ਏਜੰਟ ਵਿਵਸਥਾਵਾਂ ਦੀ ਖੋਜ ਕਰੋ
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਗਾਹਕ ਅਤੇ ਸਟੌਕ ਏਜੰਟਾਂ ਨਾਲ ਇੱਕ ਉਤਪਾਦਨ-ਤਿਆਰ ਬਹੁ-ਏਜੰਟ ਏਆਈ ਹੱਲ ਲਾਗੂ ਅਤੇ ਪ੍ਰਬੰਧਿਤ ਕਰੋ

---

### 🔍 ਅਧਿਆਇ 6: ਪਹਿਲਾ-ਤੈਨਾਤੀ ਤਸਦੀਕ ਅਤੇ ਯੋਜਨਾ
**ਪੂਰਵ-ਸ਼ਰਤਾਂ**: ਅਧਿਆਇ 4 ਪੂਰਾ  
**ਅਵਧੀ**: 1 ਘੰਟਾ  
**ਜਟਿਲਤਾ**: ⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਸਮਰੱਥਾ ਯੋਜਨਾ ਅਤੇ ਸੰਸਾਧਨ ਤਸਦੀਕ
- SKU ਚੋਣ ਨੀਤੀਆਂ
- ਪਹਿਲਾ-ਚਾਲੂ ਜਾਂਚ ਅਤੇ ਸੁਚਾਲਨ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **📊 ਯੋਜਨਾ**: [ਸਮਰੱਥਾ ਯੋਜਨਾ](docs/chapter-06-pre-deployment/capacity-planning.md) - ਸੰਸਾਧਨ ਤਸਦੀਕ
- **💰 ਚੋਣ**: [SKU ਚੋਣ](docs/chapter-06-pre-deployment/sku-selection.md) - ਖਰਚ-ਪ੍ਰਭਾਵਸ਼ালী ਚੋਣਾਂ
- **✅ ਤਸਦੀਕ**: [ਪਹਿਲਾ-ਚਾਲੂ ਜਾਂਚ](docs/chapter-06-pre-deployment/preflight-checks.md) - ਸਵੈਚਾਲਿਤ ਸਕ੍ਰਿਪਟਾਂ

#### ਪ੍ਰਯੋਗਾਤਮਕ ਅਭਿਆਸ
- ਸਮਰੱਥਾ ਤਸਦੀਕ ਸਕ੍ਰਿਪਟ ਚਲਾਓ
- ਖਰਚ ਲਈ SKU ਚੋਣਾਂ ਨੂੰ ਬਿਹਤਰ ਬਣਾਓ
- ਸਵੈਚਾਲਿਤ ਪਹਿਲਾ-ਤੈਨਾਤੀ ਜਾਂਚਾਂ ਲਾਗੂ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਤੈਨਾਤੀ ਤੋਂ ਪਹਿਲਾਂ ਤਸਦੀਕ ਅਤੇ ਸੰਪੂਰਨ ਕਰੋ

---

### 🚨 ਅਧਿਆਇ 7: ਸਮੱਸਿਆ-ਸੁਧਾਰ ਅਤੇ ਡੀਬੱਗਿੰਗ
**ਪੂਰਵ-ਸ਼ਰਤਾਂ**: ਕੋਈ ਵੀ ਤੈਨਾਤੀ ਅਧਿਆਇ ਪੂਰਾ  
**ਅਵਧੀ**: 1-1.5 ਘੰਟੇ  
**ਜਟਿਲਤਾ**: ⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਪ੍ਰਣਾਲੀਗਤ ਡੀਬੱਗਿੰਗ ਤਰੀਕੇ
- ਆਮ ਸਮੱਸਿਆਵਾਂ ਅਤੇ ਹੱਲ
- ਏਆਈ-ਖਾਸ ਸਮੱਸਿਆ-ਸੁਧਾਰ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **🔧 ਆਮ ਸਮੱਸਿਆਵਾਂ**: [ਆਮ ਸਮੱਸਿਆਵਾਂ](docs/chapter-07-troubleshooting/common-issues.md) - ਬਹੁਤ ਪੁੱਛੇ ਜਾਂਦੇ ਸਵਾਲ ਅਤੇ ਹੱਲ
- **🕵️ ਡੀਬੱਗਿੰਗ**: [ਡੀਬੱਗਿੰਗ ਗਾਈਡ](docs/chapter-07-troubleshooting/debugging.md) - ਕਦਮ-ਬਾਅਦ-ਕਦਮ ਰਣਨੀਤੀਆਂ
- **🤖 ਏਆਈ ਸਮੱਸਿਆਵਾਂ**: [ਏਆਈ-ਖਾਸ ਸਮੱਸਿਆ-ਸੁਧਾਰ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - ਏਆਈ ਸੇਵਾ ਸਮੱਸਿਆਵਾਂ

#### ਪ੍ਰਯੋਗਾਤਮਕ ਅਭਿਆਸ
- ਤੈਨਾਤੀ ਫੇਲ੍ਹ ਹੋਣ ਦੀ ਜਾਂਚ ਕਰੋ
- ਪ੍ਰਮਾਣਿਕਤਾ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸੁਲਝਾਓ
- ਏਆਈ ਸੇਵਾ ਸਬੰਧਤਾ ਡੀਬੱਗ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਸਵਤੰਤਰਤਾ ਨਾਲ ਆਮ ਤੈਨਾਤੀ ਸਮੱਸਿਆਵਾਂ ਦੀ ਪਛਾਣ ਅਤੇ ਹੱਲ ਕਰੋ

---

### 🏢 ਅਧਿਆਇ 8: ਉਤਪਾਦਨ ਅਤੇ ਉਦਯੋਗਿਕ ਪੈਟਰਨ
**ਪੂਰਵ-ਸ਼ਰਤਾਂ**: ਅਧਿਆਇ 1-4 ਪੂਰੇ ਹੋਏ  
**ਅਵਧੀ**: 2-3 ਘੰਟੇ  
**ਜਟਿਲਤਾ**: ⭐⭐⭐⭐

#### ਤੁਸੀਂ ਕੀ ਸਿੱਖੋਗੇ
- ਉਤਪਾਦਨ ਤੈਨਾਤੀ ਰਣਨੀਤੀਆਂ
- ਉਦਯੋਗਿਕ ਸੁਰੱਖਿਆ ਪੈਟਰਨ
- ਨਿਗਰਾਨੀ ਅਤੇ ਖਰਚ ਬਚਤ

#### ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- **🏭 ਉਤਪਾਦਨ**: [ਉਤਪਾਦਨ ਏਆਈ ਵਧੀਆ ਅਭਿਆਸ](docs/chapter-08-production/production-ai-practices.md) - ਉਦਯੋਗ ਪੈਟਰਨ
- **📝 ਉਦਾਹਰਨਾਂ**: [ਮਾਈਕਰੋਸਰਵਿਸਿਜ਼ ਉਦਾਹਰਣ](../../examples/microservices) - ਜਟਿਲ ਆਰਕੀਟੈਕਚਰ
- **📊 ਨਿਗਰਾਨੀ**: [ਐਪਲੀਕੇਸ਼ਨ ਇਨਸਾਈਟਸ ਇੰਟੀਗ੍ਰੇਸ਼ਨ](docs/chapter-06-pre-deployment/application-insights.md) - ਨਿਗਰਾਨੀ

#### ਪ੍ਰਯੋਗਾਤਮਕ ਅਭਿਆਸ
- ਉਦਯੋਗਿਕ ਸੁਰੱਖਿਆ ਪੈਟਰਨ ਲਾਗੂ ਕਰੋ
- ਵਿਆਪਕ ਨਿਗਰਾਨੀ ਸੈਟ ਕਰੋ
- ਢੁਕਵੀਂ ਸਰਕਾਰ ਨਾਲ ਉਤਪਾਦਨ ਵਿੱਚ ਤੈਨਾਤ ਕਰੋ

**💡 ਅਧਿਆਇ ਨਤੀਜਾ**: ਪੂਰੀ ਉਤਪਾਦਨ ਯੋਗਤਾਵਾਂ ਨਾਲ ਉਦਯੋਗਿਕ ਤਿਆਰ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰੋ

---

## 🎓 ਵਰਕਸ਼ਾਪ ਝਲਕ: ਹੱਥ-ਵਰਤੋਂ ਸਿੱਖਣ ਅਨੁਭਵ

> **⚠️ ਵਰਕਸ਼ਾਪ ਦਰਜਾ: ਸਰਗਰਮ ਵਿਕਾਸ**  
> ਵਰਕਸ਼ਾਪ ਸਮੱਗਰੀ ਵਰਤਮਾਨ ਵਿੱਚ ਵਿਕਾਸ ਅਤੇ ਸੁਧਾਰ ਕੀਤਾ ਜਾ ਰਿਹਾ ਹੈ। ਮੁੱਖ ਮੋਡਿਊਲ ਕਾਰਗਰ ਹਨ, ਪਰ ਕੁਝ ਉਨੱਤਰ ਹਿੱਸੇ ਅਧੂਰੇ ਹਨ। ਅਸੀਂ ਸਾਰਾ ਸਮੱਗਰੀ ਪੂਰਾ ਕਰਨ ਲਈ ਸਰਗਰਮ ਕੰਮ ਕਰ ਰਹੇ ਹਾਂ। [ਤਰੱਕੀ ਦੇਖੋ →](workshop/README.md)

### ਇੰਟਰਐਕਟਿਵ ਵਰਕਸ਼ਾਪ ਸਮੱਗਰੀ
**ਬਰਾਊਜ਼ਰ-ਅਧਾਰਤ ਟੂਲਾਂ ਅਤੇ ਮਰਗਦਰਸ਼ਿਤ ਅਭਿਆਸਾਂ ਨਾਲ ਵਿਸਤ੍ਰਿਤ ਹੱਥ-ਵਰਤੋਂ ਸਿੱਖਣ**

ਸਾਡੀ ਵਰਕਸ਼ਾਪ ਸਮੱਗਰੀ ਇੱਕ ਸੰਰਚਿਤ, ਇੰਟਰਐਕਟਿਵ ਸਿੱਖਣ ਅਨੁਭਵ ਪ੍ਰਦਾਨ ਕਰਦੀ ਹੈ ਜੋ ਉਪਰ ਦਿੱਤੇ ਅਧਿਆਇ-ਅਧਾਰਤ ਕਰਿਕੁੱਲਮ ਦੀ ਪੂਰਕ ਹੈ। ਵਰਕਸ਼ਾਪ ਦੋਹਾਂ ਲਈ ਤਿਆਰ ਕੀਤੀ ਗਈ ਹੈ: ਸਵੈ-ਗਤੀ ਸਿੱਖਣ ਅਤੇ ਪ੍ਰਸ਼ਿਕਸ਼ਕ-ਨੀਤ੍ਰਿਤ ਸੈਸ਼ਨ।

#### 🛠️ ਵਰਕਸ਼ਾਪ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ
- **ਬਰਾਊਜ਼ਰ-ਅਧਾਰਤ ਇੰਟਰਫੇਸ**: MkDocs-ਸਮਰਥਿਤ ਪੂਰਨ ਵਰਕਸ਼ਾਪ ਸੇਰਚ, ਕਾਪੀ ਅਤੇ ਥੀਮ ਖਾਸੀਅਤਾਂ ਨਾਲ
- **GitHub ਕੋਡਸਪੇਸ ਇਕੀਕਰਨ**: ਇਕ-ਕਲਿੱਕ ਵਿਕਾਸ ਵਾਤਾਵਰਨ ਸੈਟਅਪ
- **ਸੰਰਚਿਤ ਸਿੱਖਣ ਰਸਤਾ**: 8-ਮੋਡੀਊਲ ਮਰਗਦਰਸ਼ਿਤ ਅਭਿਆਸ (ਕੁੱਲ 3-4 ਘੰਟੇ)
- **ਗਤੀਸ਼ੀਲ ਪੱਧਰ ਵਾਲੀ ਵਿਧੀ**: ਪ੍ਰਸਤਾਵਨਾ → ਚੋਣ → ਤਸਦੀਕ → ਵਿਖੰਡਨ → ਵਿਵਸਥਾ → ਵਿਅਕਤੀਗਤਕਰਨ → ਸਫਾਈ → ਸੰਪੂਰਣ
- **ਇੰਟਰਐਕਟਿਵ DevContainer ਵਾਤਾਵਰਨ**: ਪਹਿਲਾਂ ਤੋਂ ਸੰਰਚਿਤ ਸੋਫਟਵੇਅਰ ਅਤੇ ਆਵਸ਼ਯਕਤਾਵਾਂ

#### 📚 ਵਰਕਸ਼ਾਪ ਮੋਡੀਊਲ ਸੰਰਚਨਾ
ਵਰਕਸ਼ਾਪ ਇੱਕ **8-ਮੋਡੀਊਲ ਗਤੀਸ਼ੀਲ ਵਿਧੀ** ਦੀ ਪਾਲਣਾ ਕਰਦਾ ਹੈ ਜੋ ਤੁਹਾਨੂੰ ਖੋਜ ਤੋਂ ਤੈਨਾਤੀ ਤੱਕ ਲੈ ਜਾਂਦਾ ਹੈ:

| ਮੋਡੀਊਲ | ਵਿਸ਼ਾ | ਤੁਸੀਂ ਕੀ ਕਰੋਗੇ | ਅਵਧੀ |
|--------|-------|----------------|----------|
| **0. ਪ੍ਰਸਤਾਵਨਾ** | ਵਰਕਸ਼ਾਪ ਝਲਕ | ਸਿੱਖਣ ਦੇ ਲਕੜੇ, ਪੂਰਵ-ਸ਼ਰਤਾਂ, ਅਤੇ ਵਰਕਸ਼ਾਪ ਸੰਰਚਨਾ ਸਮਝੋ | 15 ਮਿੰਟ |
| **1. ਚੋਣ** | ਟੈਮਪਲੇਟ ਖੋਜ | AZD ਟੈਮਪਲੇਟ ਨੂੰ ਖੋਜੋ ਅਤੇ ਆਪਣੇ ਦ੍ਰਿਸ਼ ਲਈ ਠੀਕ ਏਆਈ ਟੈਮਪਲੇਟ ਚੁਣੋ | 20 ਮਿੰਟ |
| **2. ਤਸਦੀਕ** | ਤੈਨਾਤੀ ਅਤੇ ਤਸਦੀਕ | `azd up` ਨਾਲ ਟੈਮਪਲੇਟ ਤੈਨਾਤ ਕਰੋ ਅਤੇ ਢਾਂਚਾ ਕੰਮ ਕਰਦਾ ਹੈ ਜਾਂ ਨਹੀਂ ਦੇਖੋ | 30 ਮਿੰਟ |
| **3. ਵਿਖੰਡਨ** | ਸੰਰਚਨਾ ਸਮਝੋ | GitHub Copilot ਨਾਲ ਟੈਮਪਲੇਟ ਆਰਕੀਟੈਕਚਰ, Bicep ਫਾਇਲਾਂ ਅਤੇ ਕੋਡ ਵਿਵਸਥਾ ਖੋਜੋ | 30 ਮਿੰਟ |
| **4. ਵਿਵਸਥਾ** | azure.yaml ਡੂੰਘਾਈ ਨਾਲ | `azure.yaml` ਵਿਵਸਥਾ, ਲਾਈਫਸਾਈਕਲ ਹੁੱਕ ਅਤੇ ਵਾਤਾਵਰਨ ਚਰ ਸਮਝੋ | 30 ਮਿੰਟ |
| **5. ਵਿਅਕਤੀਗਤਕਰਨ** | ਆਪਣੇ ਅਨੁਸਾਰ ਬਨਾਓ | ਏਆਈ ਖੋਜ, ਟਰੇਸਿੰਗ, ਮੁਲਾਂਕਣ ਯੋਗ ਬਣਾਓ ਅਤੇ ਆਪਣੇ ਦ੍ਰਿਸ਼ ਲਈ ਵਿਅਕਤੀਗਤ ਕਰੋ | 45 ਮਿੰਟ |
| **6. ਸਫਾਈ** | ਸਾਫ ਕਰੋ | `azd down --purge` ਨਾਲ ਸੰਸਾਧਨਾਂ ਨੂੰ ਸੁਰੱਖਿਅਤ ਤੌਰ ਤੇ ਹਟਾਓ | 15 ਮਿੰਟ |
| **7. ਸੰਪੂਰਣ** | ਅਗਲੇ ਕਦਮ | ਪ੍ਰਾਪਤੀਆਂ, ਮੁੱਖ ਧਾਰਨਾਵਾਂ ਦੀ ਸਮੀਖਿਆ ਕਰੋ ਅਤੇ ਆਪਣੀ ਸਿੱਖਣ ਯਾਤਰਾ ਜਾਰੀ ਰੱਖੋ | 15 ਮਿੰਟ |

**ਵਰਕਸ਼ਾਪ ਪ੍ਰਵਾਹ:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 ਵਰਕਸ਼ਾਪ ਦੀ ਸ਼ੁਰੂਆਤ
```bash
# ਵਿਕਲਪ 1: ਗਿਟਹੱਬ ਕੋਡਸਪੇਸ (ਸਿਫਾਰਸ਼ ਕੀਤੀ ਗਈ)
# ਰਿਪੋਜਟਰੀ ਵਿੱਚ "ਕੋਡ" → "ਮੁੱਖ 'ਤੇ ਕੋਡਸਪੇਸ ਬਣਾਓ" 'ਤੇ ਕਲਿੱਕ ਕਰੋ

# ਵਿਕਲਪ 2: ਸਥਾਨਕ ਵਿਕਾਸ
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# ਵਰਕਸ਼ਾਪ/README.md ਵਿੱਚ ਸੈਟਅਪ ਨਿਰਦੇਸ਼ਾਂ ਦੀ ਪਾਲਣਾ ਕਰੋ
```

#### 🎯 ਵਰਕਸ਼ਾਪ ਸਿੱਖਣ ਦੇ ਨਤੀਜੇ
ਵਰਕਸ਼ਾਪ ਪੂਰਾ ਕਰਨ ਨਾਲ ਭਾਗੀਦਾਰ:
- **ਉਤਪਾਦਨ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨਾਂ ਨੂੰ ਤੈਨਾਤ ਕਰਨਾ**: ਮਾਈਕਰੋਸੋਫ਼ਟ ਫਾਉਂਡਰੀ ਸੇਵਾਵਾਂ ਨਾਲ AZD ਵਰਤੋ
- **ਬਹੁ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰਾਂ ਵਿੱਚ ਮਾਹਿਰ ਹੋਵੋ**: ਏਆਈ ਏਜੰਟ ਹੱਲ ਲਾਗੂ ਕਰੋ
- **ਸੁਰੱਖਿਆ ਵਧੀਆ ਅਭਿਆਸ ਲਾਗੂ ਕਰੋ**: ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਐਕਸੈਸ ਨਿਯੰਤਰਣ ਸੰਰਚਿਤ ਕਰੋ
- **ਪੈਮਾਨੇ ਲਈ ਭਲਾਈ ਕਰੋ**: ਖਰਚ-ਪ੍ਰਭਾਵਸ਼ਾਲੀ, ਪ੍ਰਦਰਸ਼ਨਸ਼ੀਲ ਤੈਨਾਤੀਆਂ ਤਿਆਰ ਕਰੋ
- **ਤੈਨਾਤੀਆਂ ਦਾ ਸਮੱਸਿਆ-ਸੁਧਾਰ ਕਰੋ**: ਆਮ ਸਮੱਸਿਆਵਾਂ ਨੂੰ ਸਵਤੰਤਰ ਤੌਰ ਤੇ ਸੁਲਝਾਓ

#### 📖 ਵਰਕਸ਼ਾਪ ਸਰੋਤ
- **🎥 ਇੰਟਰਐਕਟਿਵ ਗਾਈਡ**: [ਵਰਕਸ਼ਾਪ ਸਮੱਗਰੀ](workshop/README.md) - ਬਰਾਊਜ਼ਰ ਅਧਾਰਤ ਸਿੱਖਣ ਵਾਤਾਵਰਨ
- **📋 ਮੋਡੀਊਲ-ਦਰ-ਮੋਡੀਊਲ ਦਿਸ਼ਾ-ਨਿਰਦੇਸ਼**:
  - [0. ਪ੍ਰਸਤਾਵਨਾ](workshop/docs/instructions/0-Introduction.md) - ਵਰਕਸ਼ਾਪ ਦਾ ਜਾਇਜ਼ਾ ਅਤੇ ਉਦੇਸ਼
  - [1. ਚੋਣ](workshop/docs/instructions/1-Select-AI-Template.md) - ਏਆਈ ਟੈਮਪਲੇਟ ਖੋਜੋ ਅਤੇ ਚੁਣੋ
  - [2. ਤਸਦੀਕ](workshop/docs/instructions/2-Validate-AI-Template.md) - ਟੈਮਪਲੇਟ ਤੈਨਾਤ ਕਰੋ ਅਤੇ ਤਸਦੀਕ ਕਰੋ
  - [3. ਵਿਖੰਡਨ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ਟੈਮਪਲੇਟ ਆਰਕੀਟੈਕਚਰ ਖੋਜੋ
  - [4. ਵਿਵਸਥਾ](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml ਵਿੱਚ ਪੂਰਤੀ ਪ੍ਰਾਪਤ ਕਰੋ
  - [5. ਵਿਅਕਤੀਗਤਕਰਨ](workshop/docs/instructions/5-Customize-AI-Template.md) - ਆਪਣੇ ਦ੍ਰਿਸ਼ ਲਈ ਵਿਅਕਤੀਗਤ ਕਰੋ
  - [6. ਸਫਾਈ](workshop/docs/instructions/6-Teardown-Infrastructure.md) - ਸੰਸਾਧਨਾਂ ਨੂੰ ਸਾਫ਼ ਕਰੋ
  - [7. ਸੰਪੂਰਣ](workshop/docs/instructions/7-Wrap-up.md) - ਸਮੀਖਿਆ ਅਤੇ ਅਗਲੇ ਕਦਮ
- **🛠️ ਏਆਈ ਵਰਕਸ਼ਾਪ ਲੈਬ**: [ਏਆਈ ਵਰਕਸ਼ਾਪ ਲੈਬ](docs/chapter-02-ai-development/ai-workshop-lab.md) - ਏਆਈ ਕੇਂਦਰਿਤ ਅਭਿਆਸ
- **💡 ਤੇਜ਼ ਸ਼ੁਰੂਆਤ**: [ਵਰਕਸ਼ਾਪ ਸੈਟਅਪ ਗਾਈਡ](workshop/README.md#quick-start) - ਵਾਤਾਵਰਨ ਸੰਰਚਨਾ

**ਸਭ ਲਈ ਵਧੀਆ**: ਕਾਰਪੋਰੇਟ ਟ੍ਰੇਨਿੰਗ, ਯੂਨੀਵਰਸਿਟੀ ਕੋਰਸ, ਸਵੈ-ਗਤੀ ਸਿੱਖਣ, ਅਤੇ ਵਿਕਾਸਕਾਰ ਬੂਟਕੈਂਪ।

---

## 📖 ਡੂੰਘਾਈ ਨਾਲ ਜਾਣਕਾਰੀ: AZD ਸਮਰੱਥਾਵਾਂ

ਬੁਨਿਆਦੀ ਗੱਲਾਂ ਤੋਂ ਅੱਗੇ, AZD ਉਤਪਾਦਨ ਤੈਨਾਤੀਆਂ ਲਈ ਸ਼ਕਤੀਸ਼ਾਲੀ ਖਾਸੀਅਤਾਂ ਪ੍ਰਦਾਨ ਕਰਦਾ ਹੈ:

- **ਟੈਮਪਲੇਟ-ਅਧਾਰਤ ਤੈਨਾਤੀਆਂ** - ਆਮ ਐਪਲੀਕੇਸ਼ਨ ਪੈਟਰਨ ਲਈ ਤਿਆਰ ਟੈਮਪਲੇਟ ਵਰਤੋ
- **ਇੰਫ੍ਰਾਸਟ੍ਰੱਕਚਰ ਕੋਡ ਵਜੋਂ** - Bicep ਜਾਂ Terraform ਦੇ ਨਾਲ Azure ਸੰਸਾਧਨਾਂ ਦਾ ਪ੍ਰਬੰਧਨ  
- **ਇਕੱਤਰ ਕੰਮ ਪ੍ਰਵਾਹ** - ਬਿਨਾਂ ਰੁਕਾਵਟ ਪ੍ਰਵਿੰਦਨ, ਤੈਨਾਤੀ, ਅਤੇ ਨਿਗਰਾਨੀ ਕਰੋ
- **ਵਿਕਾਸਕਾਰ-ਮਿੱਤਰ** - ਵਿਕਾਸਕਾਰ ਦੀ ਉਤਪਾਦਕਤਾ ਅਤੇ ਅਨੁਭਵ ਲਈ ਸੁਧਾਰ ਕਰਕੇ

### **AZD + Microsoft Foundry: ਏਆਈ ਤੈਨਾਤੀਆਂ ਲਈ ਬਿਹਤਰ ਜੋੜ**

**ਕਿਉਂ AZD ਏਆਈ ਹੱਲਾਂ ਲਈ?** AZD ਉਹ ਮੁੱਖ ਚੁਣੌਤੀਆਂ ਦਾ ਹੱਲ ਕਰਦਾ ਹੈ ਜਿਨ੍ਹਾਂ ਦਾ ਸਾਹਮਣਾ ਏਆਈ ਵਿਕਾਸਕਾਰ ਕਰਦੇ ਹਨ:

- **ਏਆਈ-ਤਿਆਰ ਟੈਮਪਲੇਟ** - Microsoft Foundry ਮਾਡਲ, Azure ਏਆਈ ਸੇਵਾਵਾਂ, ਅਤੇ ML ਲੋਡਆਂ ਲਈ ਪਹਿਲਾਂ ਤੋਂ ਸੰਰਚਿਤ ਟੈਮਪਲੇਟ
- **ਸੁਰੱਖਿਅਤ ਏਆਈ ਤੈਨਾਤੀ** - ਏਆਈ ਸੇਵਾਵਾਂ, API ਕੀਜ਼, ਅਤੇ ਮਾਡਲ ਐਂਡਪੌਇੰਟ ਲਈ ਨਿਰਮਿਤ ਸੁਰੱਖਿਆ ਪੈਟਰਨ  
- **ਉਤਪਾਦਨ ਏਆਈ ਪੈਟਰਨ** - ਵਿਆਪਕ, ਖਰਚ-ਪ੍ਰਭਾਵਸ਼ਾਲੀ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤੀਆਂ ਲਈ ਬਿਹਤਰ ਅਭਿਆਸ
- **ਪੂਰਾ ਏਆਈ ਵਰਕਫਲੋ우** - ਮਾਡਲ ਵਿਕਾਸ ਤੋਂ ਲੈ ਕੇ ਉਤਪਾਦਨ ਤੱਕ ਸਹੀ ਨਿਗਰਾਨੀ ਦੇ ਨਾਲ
- **ਖਰਚ ਬਚਤ** - ਏਆਈ ਲੋਡਾਂ ਲਈ ਸਮਰਥ ਸੰਸਾਧਨ ਵੰਡ ਅਤੇ ਵਧਾਉਣ ਦੀ ਰਣਨੀਤੀ
- **Microsoft Foundry ਇਕੀਕਰਨ** - Microsoft Foundry ਮਾਡਲ ਕੈਟਲਾਗ ਅਤੇ ਐਂਡਪੌਇੰਟ ਨਾਲ ਨਿਰਵਿਘਨ ਜੁੜਾਵ

---

## 🎯 ਟੈਮਪਲੇਟ ਅਤੇ ਉਦਾਹਰਨ ਲਾਇਬ੍ਰੇਰੀ

### ਵਿਸ਼ੇਸ਼: Microsoft Foundry ਟੈਮਪਲੇਟਸ
**ਜੇ ਤੁਸੀਂ ਏਆਈ ਐਪਲੀਕੇਸ਼ਨ ਤੈਨਾਤ ਕਰ ਰਹੇ ਹੋ ਤਾਂ ਇਥੇ ਸ਼ੁਰੂ ਕਰੋ!**

> **ਨੋਟ:** ਇਹ ਟੈਮਪਲੇਟ ਵੱਖ-ਵੱਖ ਏਆਈ ਪੈਟਰਨ ਦਿਖਾਉਂਦے ਹਨ। ਕੁਝ ਬਾਹਰੀ Azure ਨਮੂਨੇ ਹਨ, ਹੋਰ ਲੋਕਲ ਲਾਗੂਆਂ ਹਨ।

| ਟੈਮਪਲੇਟ | ਅਧਿਆਇ | ਜਟਿਲਤਾ | ਸੇਵਾਵਾਂ | ਕਿਸਮ |
|----------|---------|------------|----------|------|
| [**ਏਆਈ ਚੈਟ ਨਾਲ ਸ਼ੁਰੂਆਤ**](https://github.com/Azure-Samples/get-started-with-ai-chat) | ਅਧਿਆਇ 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ਬਾਹਰੀ |
| [**ਏਆਈ ਏਜੰਟਸ ਨਾਲ ਸ਼ੁਰੂਆਤ**](https://github.com/Azure-Samples/get-started-with-ai-agents) | ਅਧਿਆਇ 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ਬਾਹਰੀ |
| [**Azure Search + OpenAI ਡੈਮੋ**](https://github.com/Azure-Samples/azure-search-openai-demo) | ਅਧਿਆਇ 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ਬਾਹਰੀ |
| [**OpenAI ਚੈਟ ਐਪ ਕੁਇਕਸਟਾਰਟ**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ਅਧਿਆਇ 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ਬਾਹਰੀ |
| [**ਏਜੰਟ OpenAI ਪਾਇਥਨ ਪ੍ਰੌਮਪਟੀ**](https://github.com/Azure-Samples/agent-openai-python-prompty) | ਅਧਿਆਇ 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ਬਾਹਰੀ |
| [**ਕਾਂਟੋਸੋ ਚੈਟ RAG**](https://github.com/Azure-Samples/contoso-chat) | ਅਧਿਆਇ 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ਬਾਹਰੀ |
| [**ਰਿਟੇਲ ਬਹੁ-ਏਜੰਟ ਹੱਲ**](examples/retail-scenario.md) | ਅਧਿਆਇ 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **ਲੋਕਲ** |

### ਵਿਸ਼ੇਸ਼: ਪੂਰੇ ਸਿੱਖਣ ਦੇ ਦ੍ਰਿਸ਼
**ਉਤਪਾਦਨ-ਤਿਆਰ ਐਪਲੀਕੇਸ਼ਨ ਟੈਮਪਲੇਟ ਜੋ ਸਿੱਖਣ ਵਾਲੇ ਅਧਿਆਇ ਨਾਲ ਜੋੜੇ ਗਏ ਹਨ**

| ਟੈਮਪਲੇਟ | ਸਿੱਖਣ ਅਧਿਆਇ | ਜਟਿਲਤਾ | ਮੁੱਖ ਸਿੱਖਣ |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | ਅਧਿਆਇ 2 | ⭐ | ਮੂਲ ਏਆਈ ਤੈਨਾਤੀ ਪੈਟਰਨ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | ਅਧਿਆਇ 2 | ⭐⭐ | Azure AI Search ਨਾਲ RAG ਲਾਗੂਆਇ |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | ਅਧਿਆਇ 4 | ⭐⭐ | ਦਸਤਾਵੇਜ਼ ਇੰਟੈਲੀਜੈਂਸ ਏਕੀਕਰਨ |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | ਅਧਿਆਇ 5 | ⭐⭐⭐ | ਏਜੰਟ ਫਰੇਮਵਰਕ ਅਤੇ ਫਂਕਸ਼ਨ ਕਾਲਿੰਗ |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | ਅਧਿਆਇ 8 | ⭐⭐⭐ | ਉਦਯੋਗਿਕ ਏਆਈ ਸੰਚਾਲਨ |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | ਅਧਿਆਇ 5 | ⭐⭐⭐⭐ | ਗਾਹਕ ਅਤੇ ਸਟੌਕ ਏਜੰਟਾਂ ਨਾਲ ਬਹੁ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ |

### ਉਦਾਹਰਨ ਕਿਸਮ ਲਈ ਸਿੱਖਣਾ

> **📌 ਲੋਕਲ ਵਿਰੁੱਧ ਬਾਹਰੀ ਉਦਾਹਰਨਾਂ:**  
> **ਲੋਕਲ ਉਦਾਹਰਨਾਂ** (ਇਸ ਰਿਪੋ ਵਿੱਚ) = ਤੁਰੰਤ ਵਰਤੋਂ ਲਈ ਤਿਆਰ  
> **ਬਾਹਰੀ ਉਦਾਹਰਨਾਂ** (Azure ਨਮੂਨੇ) = ਲਿੰਕ ਕੀਤੀਆਂ ਰਿਪੋਜ਼ੀਟਰੀਆਂ ਤੋਂ ਕਲੋਨ ਕਰੋ

#### ਲੋਕਲ ਉਦਾਹਰਨਾਂ (ਤੁਰੰਤ ਵਰਤੋਂ ਲਈ ਤਿਆਰ)
- [**ਰਿਟੇਲ ਬਹੁ-ਏਜੰਟ ਹੱਲ**](examples/retail-scenario.md) - ARM ਟੈਮਪਲੇਟਸ ਨਾਲ ਪੂਰੀ ਉਤਪਾਦਨ-ਤਿਆਰ ਲਾਗੂਆਇ
  - ਬਹੁ-ਏਜੰਟ ਆਰਕੀਟੈਕਚਰ (ਗਾਹਕ + ਸਟੌਕ ਏਜੰਟ)
  - ਵਿਸਤ੍ਰਿਤ ਨਿਗਰਾਨੀ ਅਤੇ ਮੁਲਾਂਕਣ
  - ARM ਟੈਮਪਲੇਟ ਰਾਹੀਂ ਇਕ-ਕਲਿੱਕ ਤੈਨਾਤੀ

#### ਲੋਕਲ ਉਦਾਹਰਨਾਂ - ਕੰਟੇਨਰ ਐਪਲੀਕੇਸ਼ਨ (ਅਧਿਆਇ 2-5)
**ਇਸ ਰਿਪੋ ਵਿੱਚ ਵਿਸਤ੍ਰਿਤ ਕੰਟੇਨਰ ਤੈਨਾਤੀ ਉਦਾਹਰਨਾਂ:**

- [**ਕੰਟੇਨਰ ਐਪ ਉਦਾਹਰਣਾਂ**](examples/container-app/README.md) - ਕੁੰਟੇਨਰਬੱਧ ਡਿਪਲੋਇਮੈਂਟ ਲਈ ਪੂਰਾ ਗਾਈਡ
  - [ਸਧਾਰਣ Flask API](../../examples/container-app/simple-flask-api) - ਸਕੇਲ-ਟੂ-ਜ਼ੀਰੋ ਨਾਲ ਬੁਨਿਆਦੀ REST API
  - [ਮਾਈਕ੍ਰੋਸਰਵਿਸ ਆਰਕੀਟੈਕਚਰ](../../examples/container-app/microservices) - ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ਬਹੁ-ਸੇਵਾ ਡਿਪਲੋਇਮੈਂਟ
  - ਤੇਜ਼ ਸ਼ੁਰੂਆਤ, ਉਤਪਾਦਨ, ਅਤੇ ਉन्नਤ ਡਿਪਲੋਇਮੈਂਟ ਪੈਟਰਨ
  - ਮਾਨੀਟਰਿੰਗ, ਸੁਰੱਖਿਆ, ਅਤੇ ਖਰਚਾ ਆਪਟੀਮਾਈਜ਼ੇਸ਼ਨ ਮਾਰਗਦਰਸ਼ਨ

#### ਬਾਹਰੀ ਉਦਾਹਰਣ - ਸਧਾਰਣ ਐਪਲੀਕੇਸ਼ਨ (ਅਧਿਆਇ 1-2)
**ਸ਼ੁਰੂਆਤ ਕਰਨ ਲਈ ਇਹਨਾਂ ਐਜ਼ੁਰ ਸੈਂਪਲ ਰਿਪੋਜਟਰੀਜ਼ ਨੂੰ ਕਲੋਨ ਕਰੋ:**
- [ਸਧਾਰਣ ਵੈੱਬ ਐਪ - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - ਬੁਨਿਆਦੀ ਡਿਪਲੋਇਮੈਂਟ ਪੈਟਰਨ
- [ਸਥਿਰ ਵੈੱਬਸਾਈਟ - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - ਸਥਿਰ ਸਮੱਗਰੀ ਡਿਪਲੋਇਮੈਂਟ
- [ਕੰਟੇਨਰ ਐਪ - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API ਡਿਪਲੋਇਮੈਂਟ

#### ਬਾਹਰੀ ਉਦਾਹਰਣ - ਡਾਟਾਬੇਸ ਇੰਟੈਗ੍ਰੇਸ਼ਨ (ਅਧਿਆਇ 3-4)  
- [ਡਾਟਾਬੇਸ ਐਪ - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ਡਾਟਾਬੇਸ ਕਨੈਕਟਿਵਿਟੀ ਪੈਟਰਨ
- [ਫੰਕਸ਼ਨ + ਕੋਸਮੋਜ਼ ਡੀਬੀ](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - ਸਰਵਰਰਹਿਤ ਡਾਟਾ ਵਰਕਫਲੋ

#### ਬਾਹਰੀ ਉਦਾਹਰਣ - ਉन्नਤ ਪੈਟਰਨ (ਅਧਿਆਇ 4-8)
- [ਜਾਵਾ ਮਾਈਕ੍ਰੋਸਰਵਿਸ](https://github.com/Azure-Samples/java-microservices-aca-lab) - ਬਹੁ-ਸੇਵਾ ਆਰਕੀਟੈਕਚਰ
- [ਕੰਟੇਨਰ ਐਪ ਜੌਬਜ਼](https://github.com/Azure-Samples/container-apps-jobs) - ਪਿਛੋਕੜ ਪ੍ਰਕਿਰਿਆ  
- [ਐਂਟਰਪ੍ਰਾਈਜ਼ ML ਪਾਈਪਲਾਈਨ](https://github.com/Azure-Samples/mlops-v2) - ਪ੍ਰੋਡਕਸ਼ਨ-ਤਿਆਰ ML ਪੈਟਰਨ

### ਬਾਹਰੀ ਟੈਮਪਲੇਟ ਸਭਾ
- [**ਆਧਿਕਾਰਿਕ AZD ਟੈਮਪਲੇਟ ਗੈਲਰੀ**](https://azure.github.io/awesome-azd/) - ਆਧਿਕਾਰਿਕ ਅਤੇ ਕਮਿਊਨਿਟੀ ਟੈਮਪਲੇਟਾਂ ਦਾ ਚੁਣਿਆ ਹੋਇਆ ਸਮੂਹ
- [**ਆਜ਼ੁਰ ਡਿਵੈਲਪਰ CLI ਟੈਮਪਲੇਟ**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - ਮਾਈਕ੍ਰੋਸੋਫਟ ਲਰਨ ਟੈਮਪਲੇਟ ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ
- [**ਉਦਾਹਰਣ ਫੋਲਡਰ**](examples/README.md) - ਵਿਸਥਾਰ ਨਾਲ ਸਥਾਨਕ ਸਿੱਖਣ ਉਦਾਹਰਣ

---

## 📚 ਸਿੱਖਣ ਦੇ ਸਰੋਤ ਅਤੇ ਸੰਦਰਭ

### ਤੇਜ਼ ਸੰਦਰਭ
- [**ਕਮਾਂਡ ਚੀਟ ਸ਼ੀਟ**](resources/cheat-sheet.md) - ਅਹਮ azd ਕਮਾਂਡਾਂ ਵੱਖ-ਵੱਖ ਅਧਿਆਇ ਅਨੁਸਾਰ
- [**ਸ਼ਬਦਾਵਲੀ**](resources/glossary.md) - ਐਜ਼ੁਰ ਅਤੇ azd ਸ਼ਬਦਾਵਲੀ  
- [**ਅਕਸਰ ਪੁੱਛੇ ਜਾਂਦੇ ਸਵਾਲ**](resources/faq.md) - ਆਮ ਪ੍ਰਸ਼ਨ ਸਿੱਖਣ ਵਾਲੇ ਅਧਿਆਇ ਅਨੁਸਾਰ
- [**ਅਧਿਆਨ ਮਾਰਗਦਰਸ਼ਿਕਾ**](resources/study-guide.md) - ਵਿਸ਼ਤ੍ਰਿਤ ਅਭਿਆਸ ਕਸਰਤਾਂ

### ਪ੍ਰਯੋਗਾਤਮਕ ਵਰਕਸ਼ਾਪ
- [**AI ਵਰਕਸ਼ਾਪ ਲੈਬ**](docs/chapter-02-ai-development/ai-workshop-lab.md) - ਆਪਣੇ AI ਹੱਲਾਂ ਨੂੰ AZD ਡਿਪਲੋਇ ਕਰਨ ਯੋਗ ਬਣਾਓ (2-3 ਘੰਟੇ)
- [**ਇੰਟਰਐਕਟਿਵ ਵਰਕਸ਼ਾਪ**](workshop/README.md) - MkDocs ਅਤੇ GitHub Codespaces ਨਾਲ 8 ਮਾਡਿਊਲ ਰਾਹ-ਦਰਸਾਵਾਂ
  - ਅਨੁਕਰਣ ਕਰਦਾ ਹੈ: ਪਰਿਚਯ → ਚੋਣ → ਪ੍ਰਮਾਣਿਕਤਾ → ਵਿਗਾੜ → ਸੰਰਚਨਾ → ਕਸਟਮਾਈਜ਼ੇਸ਼ਨ → ਸਮਾਪਤੀ → ਸਮਾਪਤੀ

### ਬਾਹਰੀ ਸਿੱਖਣ ਦੇ ਸਰੋਤ
- [ਆਜ਼ੁਰ ਡਿਵੈਲਪਰ CLI ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [ਆਜ਼ੁਰ ਆਰਕੀਟੈਕਚਰ ਕੇਂਦਰ](https://learn.microsoft.com/en-us/azure/architecture/)
- [ਆਜ਼ੁਰ ਮੁੱਲ-ਕੈਲਕੂਲੇਟਰ](https://azure.microsoft.com/pricing/calculator/)
- [ਆਜ਼ੁਰ ਸਥਿਤੀ](https://status.azure.com/)

### ਤੁਹਾਡੇ ਐਡੀਟਰ ਲਈ AI ਏਜੰਟ ਸਖਲਤਾਂ
- [**skills.sh ‘ਤੇ ਮਾਈਕ੍ਰੋਸੋਫਟ ਆਜ਼ੁਰ ਸਖਲਤਾਂ**](https://skills.sh/microsoft/github-copilot-for-azure) - ਆਜ਼ੁਰ AI, Foundry, ਡਿਪਲੋਇਮੈਂਟ, ਨਿਰੋਧ, ਲਾਗਤ ਸਧਾਰਨ ਅਤੇ ਹੋਰ ਲਈ 37 ਖੁੱਲ੍ਹੇ ਏਜੰਟ ਸਖਲਤਾਂ। ਇਹ GitHub Copilot, Cursor, Claude Code ਜਾਂ ਕਿਸੇ ਵੀ ਸਮਰਥਿਤ ਏਜੰਟ ਵਿੱਚ ਇੰਸਟਾਲ ਕਰੋ:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 ਤੇਜ਼ ਤਰਤੀਬ ਸਹਾਇਤਾ ਗਾਈਡ

**ਉਮ੍ਰਾਬੋਧੀਆਂ ਨੂੰ ਆਮ ਮੁਸ਼ਕਲਾਂ ਅਤੇ ਤੁਰੰਤ ਸਮਾਧਾਨ:**

<details>
<summary><strong>❌ "azd: ਕਮਾਂਡ ਨਹੀਂ ਮਿਲੀ"</strong></summary>

```bash
# ਪਹਿਲਾਂ AZD ਇੰਸਟਾਲ ਕਰੋ
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
<summary><strong>❌ "ਕੋਈ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਨਹੀਂ ਮਿਲੀ" ਜਾਂ "ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਨਹੀਂ"</strong></summary>

```bash
# ਉਪਲਬਧ ਸਬਸਕ੍ਰਿਪਸ਼ਨਾਂ ਦੀ ਸੂਚੀ ਬਣਾਓ
az account list --output table

# ਡਿਫਾਲਟ ਸਬਸਕ੍ਰਿਪਸ਼ਨ ਸੈੱਟ ਕਰੋ
az account set --subscription "<subscription-id-or-name>"

# AZD ਮਾਹੌਲ ਲਈ ਸੈੱਟ ਕਰੋ
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# ਪਰਖੋ
az account show
```
</details>

<details>
<summary><strong>❌ "ਅਪੂਰਨ ਕੋਟਾ" ਜਾਂ "ਕੋਟਾ ਲੰਘ ਗਿਆ"</strong></summary>

```bash
# ਵੱਖ-ਵੱਖ Azure ਖੇਤਰ ਨੂੰ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env set AZURE_LOCATION "westus2"
azd up

# ਜਾਂ ਵਿਕਾਸ ਵਿੱਚ ਛੋਟੇ SKUs ਦੀ ਵਰਤੋਂ ਕਰੋ
# infra/main.parameters.json ਨੂੰ ਸੰਪਾਦਿਤ ਕਰੋ:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ਅੱਧੇ ਰਸਤੇ ਅਸਫਲ</strong></summary>

```bash
# ਵਿਕਲਪ 1: ਸਾਫ਼ ਕਰੋ ਅਤੇ ਦੁਬਾਰਾ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd down --force --purge
azd up

# ਵਿਕਲਪ 2: ਸਿਰਫ਼ ਢਾਂਚਾਗਤ ਸਹੂਲਤ ਸਹੀ ਕਰੋ
azd provision

# ਵਿਕਲਪ 3: ਵਿਸਤਾਰਪੂਰਣ ਸਥਿਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
azd show

# ਵਿਕਲਪ 4: ਏਜ਼ੂਅਰ ਮਾਨੀਟਰ ਵਿੱਚ ਲੌਗ ਚੈੱਕ ਕਰੋ
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "ਪ੍ਰਮਾਣਿਕਤਾ ਫੇਲ ਹੋਈ" ਜਾਂ "ਟੋਕਨ ਸਮਾਪਤ"</strong></summary>

```bash
# AZD ਲਈ ਮੁੜ ਪ੍ਰਮਾਣਿਕਤਾ ਕਰੋ
azd auth logout
azd auth login

# ਵਿਕਲਪਿਕ: ਜੇ ਤੁਸੀਂ az ਕਮਾਂਡਾਂ ਚਲਾ ਰਹੇ ਹੋ ਤਾਂ Azure CLI ਨੂੰ ਵੀ ਰਿਫਰੇਸ਼ ਕਰੋ
az logout
az login

# ਪ੍ਰਮਾਣਿਕਤਾ ਦੀ ਜਾਂਚ ਕਰੋ
az account show
```
</details>

<details>
<summary><strong>❌ "ਸੰਸਾਧਨ ਪਹਿਲਾਂ ਹੀ ਮੌਜੂਦ ਹੈ" ਜਾਂ ਨਾਮਕਰਨ ਸੰਘਰਸ਼</strong></summary>

```bash
# AZD ਵੱਖ-ਵੱਖ ਨਾਮ ਬਣਾਉਂਦਾ ਹੈ, ਪਰ ਜੇ ਟਕਰਾਅ ਹੋਵੇ:
azd down --force --purge

# ਫਿਰ ਨਵੀਂ ਵਾਤਾਵਰਣ ਨਾਲ ਮੁੜ ਕੋਸ਼ਿਸ਼ ਕਰੋ
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ਟੈਮਪਲੇਟ ਡਿਪਲੋਇਮੈਂਟ ਬਹੁਤ ਦੇਰ ਲੱਗ ਰਹੀ ਹੈ</strong></summary>

**ਆਮ ਇੰਤਜ਼ਾਰ ਸਮੇਂ:**
- ਸਧਾਰਣ ਵੈੱਬ ਐਪ: 5-10 ਮਿੰਟ
- ਡਾਟਾਬੇਸ ਵਾਲੀ ਐਪ: 10-15 ਮਿੰਟ
- AI ਐਪਲੀਕੇਸ਼ਨ: 15-25 ਮਿੰਟ (OpenAI ਪ੍ਰਦਾਨਗੀ ਸੌਲੀ ਹੈ)

```bash
# ਪ੍ਰਗਤੀ ਦੀ ਜਾਂਚ ਕਰੋ
azd show

# ਜੇ 30 ਮਿੰਟ ਤੋਂ ਵੱਧ ਫਸਿਆ ਹੋਵੇ, ਤਾਂ ਐਜ਼ੂਰ ਪੋਰਟਲ ਚੈੱਕ ਕਰੋ:
azd monitor --overview
# ਅਸਫਲ ਡਿਪਲੋਇਮੈਂਟਾਂ ਲਈ ਵੇਖੋ
```
</details>

<details>
<summary><strong>❌ "ਅਧਿਕਾਰ ਮਨਾਹੀ" ਜਾਂ "ਪਾਬੰਦੀ"</strong></summary>

```bash
# ਆਪਣੇ Azure ਰੋਲ ਦੀ ਜਾਂਚ ਕਰੋ
az role assignment list --assignee $(az account show --query user.name -o tsv)

# ਤੁਹਾਨੂੰ ਘੱਟੋ-ਘੱਟ "ਕੰਟ੍ਰੀਬਿਊਟਰ" ਰੋਲ ਦੀ ਲੋੜ ਹੈ
# ਆਪਣੇ Azure ਐਡਮਿਨ ਤੋਂ ਇਹ ਮੰਗੋ:
# - ਕੰਟ੍ਰੀਬਿਊਟਰ (ਸਰੋਤਾਂ ਲਈ)
# - ਯੂਜ਼ਰ ਐਕਸੈਸ ਐਡਮਿਨਿਸਟ੍ਰੇਟਰ (ਰੋਲ ਨਿਯੁਕਤੀਆਂ ਲਈ)
```
</details>

<details>
<summary><strong>❌ ਡਿਪਲੋਇ ਹੋਈ ਐਪਲੀਕੇਸ਼ਨ URL ਨਹੀਂ ਲੱਭੀ</strong></summary>

```bash
# ਸਾਰੇ ਸਰਵਿਸ ਐਂਡਪੋਇੰਟ ਦਿਖਾਓ
azd show

# ਜਾਂ ਐਜ਼ੁਰ ਪੋਰਟਲ ਖੋਲ੍ਹੋ
azd monitor

# ਖਾਸ ਸਰਵਿਸ ਚੈਕ ਕਰੋ
azd env get-values
# *_URL ਵੈਰੀਏਬਲ ਨੂੰ ਲੱਭੋ
```
</details>

### 📚 ਪੂਰੀ ਤਰਤੀਬ ਸਹਾਇਤਾ ਸਰੋਤ

- **ਆਮ ਮੁਸ਼ਕਲਾਂ ਲਈ ਗਾਈਡ:** [ਵੇਰਵੇ ਨਾਲ ਹੱਲ](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-ਵਿਸ਼ੇਸ਼ ਮੁਸ਼ਕਲਾਂ:** [AI ਤਰਤੀਬ ਸਹਾਇਤਾ](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ਡਿਬੱਗਿੰਗ ਗਾਈਡ:** [ਕਦਮ-ਦਰ-ਕਦਮ ਡਿਬੱਗਿੰਗ](docs/chapter-07-troubleshooting/debugging.md)
- **ਮਦਦ ਲਵੋ:** [ਆਜ਼ੁਰ ਡਿਸਕੋਰਡ](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 ਕੋਰਸ ਮੁਕੰਮਲਤਾ ਅਤੇ ਪ੍ਰਮਾਣੀਕਾਰਨ

### ਉੱਨਤੀ ਟਰੈਕਿੰਗ
ਹਰ ਅਧਿਆਇ ਦੇ ਦੌਰਾਨ ਆਪਣੇ ਸਿੱਖਣ ਦੀ ਮਾਨਟਰਿੰਗ ਕਰੋ:

- [ ] **ਅਧਿਆਇ 1**: ਨੀਂਹ ਅਤੇ ਤੇਜ਼ ਸ਼ੁਰੂਆਤ ✅
- [ ] **ਅਧਿਆਇ 2**: AI-ਪਹਿਲਾ ਵਿਕਾਸ ✅  
- [ ] **ਅਧਿਆਇ 3**: ਸੰਰਚਨਾ ਅਤੇ ਪ੍ਰਮਾਣਿਕਤਾ ✅
- [ ] **ਅਧਿਆਇ 4**: ਇੰਫਰਾਸਟਰੱਕਚਰ ਐਜ਼ ਕੋਡ ਅਤੇ ਡਿਪਲੋਇਮੈਂਟ ✅
- [ ] **ਅਧਿਆਇ 5**: ਬਹੁ-ਏਜੰਟ AI ਹੱਲ ✅
- [ ] **ਅਧਿਆਇ 6**: ਪ੍ਰੀ-ਡਿਪਲੋਇਮੈਂਟ ਪ੍ਰਮਾਣਿਕਤਾ ਅਤੇ ਯੋਜਨਾ ✅
- [ ] **ਅਧਿਆਇ 7**: ਤਰਤੀਬ ਸਹਾਇਤਾ ਅਤੇ ਡਿਬੱਗਿੰਗ ✅
- [ ] **ਅਧਿਆਇ 8**: ਪ੍ਰੋਡਕਸ਼ਨ ਅਤੇ ਐਂਟਰਪ੍ਰਾਈਜ਼ ਪੈਟਰਨ ✅

### ਸਿੱਖਣ ਦੀ ਪੁਸ਼ਟੀ
ਹਰ ਅਧਿਆਇ ਮੁਕੰਮਲ ਕਰਕੇ ਆਪਣੀ ਜਾਣਕਾਰੀ ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ:
1. **ਉਪਯੋਗੀ ਅਭਿਆਸ**: ਅਧਿਆਇ ਦੇ ਪ੍ਰਯੋਗਾਤਮਕ ਡਿਪਲੋਇਮੈਂਟ ਨੂੰ ਪੂਰਾ ਕਰੋ
2. **ਜਾਣਕਾਰੀ ਜਾਂਚ**: ਆਪਣੇ ਅਧਿਆਇ ਲਈ ਅਕਸਰ ਪੁੱਛੇ ਜਾਣ ਵਾਲੇ ਸਵਾਲਾਂ ਨੂੰ ਵੇਖੋ
3. **ਸਮੁਦਾਇ ਚਰਚਾ**: ਆਪਣੇ ਤਜ਼ਰਬੇ ਨੂੰ ਆਜ਼ੁਰ ਡਿਸਕੋਰਡ ਵਿੱਚ ਸਾਂਝਾ ਕਰੋ
4. **ਅਗਲਾ ਅਧਿਆਇ**: ਅਗਲੇ ਪੱਧਰ ਤੇ ਜਾਓ

### ਕੋਰਸ ਮੁਕੰਮਲਤਾ ਦੇ ਲਾਭ
ਸਾਰੇ ਅਧਿਆਇ ਮੁਕੰਮਲ ਕਰਨ ਉਪਰੰਤ, ਤੁਹਾਡੇ ਕੋਲ ਹੋਵੇਗਾ:
- **ਪ੍ਰੋਡਕਸ਼ਨ ਅਨੁਭਵ**: ਆਜ਼ੁਰ ਤੇ ਹਕੀਕਤੀ AI ਐਪਲੀਕੇਸ਼ਨ ਡਿਪਲੋਇ ਕੀਤੀ
- **ਪ੍ਰੋਫੈਸ਼ਨਲ ਸਕਿਲਜ਼**: ਐਂਟਰਪ੍ਰਾਈਜ਼-ਤਿਆਰ ਡਿਪਲੋਇਮੈਂਟ ਯੋਗਤਾਵਾਂ  
- **ਸਮੁਦਾਇ ਸਵੀਕਾਰਤਾ**: ਆਜ਼ੁਰ ਡਿਵੈਲਪਰ ਕਮਿਊਨਿਟੀ ਦਾ ਸਹਿਭਾਗੀ
- **ਕੈਰੀਅਰ ਤਰੱਕੀ**: ਮੰਗ ਵਾਲੀ AZD ਅਤੇ AI ਡਿਪਲੋਇਮੈਂਟ ਤਜਰਬਾ

---

## 🤝 ਕਮਿਊਨਿਟੀ ਅਤੇ ਸਹਾਇਤਾ

### ਮਦਦ ਅਤੇ ਸਮਰਥਨ ਪ੍ਰਾਪਤ ਕਰੋ
- **ਤਕਨੀਕੀ ਮੁਸ਼ਕਲਾਂ**: [ਬੱਗ ਰਿਪੋਰਟ ਕਰੋ ਅਤੇ ਵਿਸ਼ੇਸ਼ਤਾਵਾਂ ਦੀ ਬੇਨਤੀ ਕਰੋ](https://github.com/microsoft/azd-for-beginners/issues)
- **ਸਿੱਖਣ ਸਵਾਲ**: [ਮਾਈਕ੍ਰੋਸੋਫਟ ਆਜ਼ੁਰ ਡਿਸਕੋਰਡ ਕਮਿਊਨਿਟੀ](https://discord.gg/microsoft-azure) ਅਤੇ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-ਵਿਸ਼ੇਸ਼ ਮਦਦ**: ਜੁੜੋ [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ**: [ਆਧਿਕਾਰਿਕ ਐਜ਼ੁਰ ਡਿਵੈਲਪਰ CLI ਡੌਕਯੂਮੈਂਟੇਸ਼ਨ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord ਤੋਂ ਕਮਿਊਨਿਟੀ ਦੀਆਂ ਸੂਝ-ਬੂਝ

**#Azure ਚੈਨਲ ਤੋਂ ਹਾਲੀਆ ਪੋਲ ਨਤੀਜੇ:**
- **45%** ਵਿਕਾਸਕਾਰ AZD ਨੂੰ AI ਵਰਕਲੋਡ ਲਈ ਵਰਤਣਾ ਚਾਹੁੰਦੇ ਹਨ
- **ਸਭ ਤੋਂ ਵੱਡੀਆਂ ਚੁਣੌਤੀਆਂ**: ਬਹੁ-ਸੇਵਾ ਡਿਪਲੋਇਮੈਂਟ, ਪ੍ਰਮਾਣਿਕਤਾ ਪ੍ਰਬੰਧ, ਪ੍ਰੋਡਕਸ਼ਨ ਤਿਆਰੀ  
- **ਸਭ ਤੋਂ ਜ਼ਿਆਦਾ ਮੰਗ ਕੀਤੀ ਗਈ**: AI-ਵਿਸ਼ੇਸ਼ ਟੈਮਪਲੇਟ, ਤਰਤੀਬ ਸਹਾਇਤਾ ਗਾਈਡ, ਸਭ ਤੋਂ ਵਧੀਆ ਅਭਿਆਸ

**ਸਾਡੇ ਕਮਿਊਨਿਟੀ ਵਿੱਚ ਸ਼ਾਮਿਲ ਹੋਵੋ:**
- ਆਪਣਾ AZD + AI ਤਜ਼ਰਬਾ ਸਾਂਝਾ ਕਰੋ ਅਤੇ ਮਦਦ ਪ੍ਰਾਪਤ ਕਰੋ
- ਨਵੇਂ AI ਟੈਮਪਲੇਟਾਂ ਦੇ ਸਟੇਜ ਪ੍ਰੀਵਿਊਜ਼ ਤੱਕ ਪਹੁੰਚ ਪ੍ਰਾਪਤ ਕਰੋ
- AI ਡਿਪਲੋਇਮੈਂਟ ਦੇ ਸਰਵੋਤਮ ਅਭਿਆਸਾਂ ਵਿੱਚ ਯੋਗਦਾਨ ਪਾਓ
- ਭਵਿੱਖ ਦੇ AI + AZD ਫੀਚਰ ਵਿਕਾਸ ’ਤੇ ਅਸਰ ਪਾਓ

### ਕੋਰਸ ਵਿੱਚ ਯੋਗਦਾਨ
ਅਸੀਂ ਯੋਗਦਾਨਾਂ ਦਾ ਸਵਾਗਤ ਕਰਦੇ ਹਾਂ! ਕਿਰਪਾ ਕਰਕੇ ਵਿਸਥਾਰ ਲਈ ਸਾਡੀ [ਯੋਗਦਾਨ ਮਾਰਗਦਰਸ਼ਿਕਾ](CONTRIBUTING.md) ਪੜ੍ਹੋ:
- **ਸਮੱਗਰੀ ਸੁਧਾਰ**: ਮੌਜੂਦਾ ਅਧਿਆਇ ਅਤੇ ਉਦਾਹਰਣ ਨੂੰ ਬਿਹਤਰ ਕਰੋ
- **ਨਵੇਂ ਉਦਾਹਰਣ**: ਹਕੀਕਤੀ ਦ੍ਰਿਸ਼ਾਂ ਅਤੇ ਟੈਮਪਲੇਟ ਸ਼ਾਮਿਲ ਕਰੋ  
- **ਅਨੁਵਾਦ**: ਬਹੁ-ਭਾਸ਼ਾ ਸਮਰਥਨ ਨੂੰ ਬਰਕਰਾਰ ਰੱਖੋ
- **ਬੱਗ ਰਿਪੋਰਟ**: ਸ਼ੁੱਧਤਾ ਅਤੇ ਸਪੱਸ਼ਟਤਾ ਵਿੱਚ ਸੁਧਾਰ ਕਰੋ
- **ਕਮਿਊਨਿਟੀ ਮਿਆਰ**: ਸਾਡੀਆਂ ਸ਼ਾਮਿਲ ਸਮੁਦਾਇ ਨੀਤੀਆਂ ਦੀ ਪਾਲਣਾ ਕਰੋ

---

## 📄 ਕੋਰਸ ਜਾਣਕਾਰੀ

### ਲਾਇਸੈਂਸ
ਇਹ ਪ੍ਰੋਜੈਕਟ MIT ਲਾਇਸੈਂਸ ਹੇਠ ਲਾਇਸੈਂਸਯੁਕਤ ਹੈ - ਵੇਰਵਿਆਂ ਲਈ [LICENSE](../../LICENSE) ਫਾਈਲ ਵੇਖੋ।

### ਸੰਬੰਧਿਤ Microsoft ਸਿੱਖਣ ਸਰੋਤ

ਸਾਡੀ ਟੀਮ ਹੋਰ ਵਿਸਥਾਰਕ ਸਿੱਖਣ ਕੋਰਸ ਬਣਾਉਂਦੀ ਹੈ:

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
 
### ਜੈਨਰੇਟਿਵ AI ਸੀਰੀਜ਼
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![ਜਨਰੇਟਿਵ ਏਆਈ (ਜਾਵਾਸਕ੍ਰਿਪਟ)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### ਮੂਲ ਸਿੱਖਿਆ
[![ਸ਼ੁਰੂਆਤੀ ਲਈ ਐਮਐਲ](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![ਡਾਟਾ ਸਾਇੰਸ ਸ਼ੁਰੂਆਤੀ ਲਈ](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![ਏਆਈ ਸ਼ੁਰੂਆਤੀ ਲਈ](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![ਸਾਇਬਰਸੁਰੱਖਿਆ ਸ਼ੁਰੂਆਤੀ ਲਈ](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![ਵੈੱਬ ਵਿਕਾਸ ਸ਼ੁਰੂਆਤੀ ਲਈ](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![ਆਈਓਟੀ ਸ਼ੁਰੂਆਤੀ ਲਈ](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![ਐਕਸਆਰ ਵਿਕਾਸ ਸ਼ੁਰੂਆਤੀ ਲਈ](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### ਕੋਪਾਈਲਟ ਸਿਰੀਜ਼
[![ਏਆਈ ਯੂਗਲ ਪੋਗ੍ਰਾਮਿੰਗ ਲਈ ਕੋਪਾਈਲਟ](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![C#/.NET ਲਈ ਕੋਪਾਈਲਟ](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![ਕੋਪਾਈਲਟ ਐਡਵੇਂਚਰ](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ ਕੋਰਸ ਨੈਵੀਗੇਸ਼ਨ

**🚀 ਸਿੱਖਣਾ ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਤਿਆਰ?**

**ਸ਼ੁਰੂਆਤੀ**: ਸ਼ੁਰੂ ਕਰੋ [ਅਧਿਆਯ 1: ਮੂਲ ਅਤੇ ਤੁਰੰਤ ਸ਼ੁਰੂਆਤ](#-chapter-1-foundation--quick-start)  
**ਏਆਈ ਵਿਕਾਸਕਰਤਾ**: ਜਾਓ [ਅਧਿਆਯ 2: ਏਆਈ-ਪਹਿਲਾ ਵਿਕਾਸ](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**ਅਨੁਭਵੀ ਵਿਕਾਸਕਰਤਾ**: ਸ਼ੁਰੂ ਕਰੋ [ਅਧਿਆਯ 3: ਸੰਰਚਨਾ ਅਤੇ ਪ੍ਰਮਾਣੀਕਰਨ](#️-chapter-3-configuration--authentication)

**ਅਗਲੇ ਕਦਮ**: [ਅਧਿਆਯ 1 - AZD ਬੁਨਿਆਦੀ ਗੱਲਾਂ](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ਅਸਵੀਕਾਰੋਪਣ**:
ਇਸ ਦਸਤਾਵੇਜ਼ ਦਾ ਅਨੁਵਾਦ ਏਆਈ ਅਨੁਵਾਦ ਸੇਵਾ [Co-op Translator](https://github.com/Azure/co-op-translator) ਦੀ ਵਰਤੋਂ ਕਰਕੇ ਕੀਤਾ ਗਿਆ ਹੈ। ਜਦੋਂ ਕਿ ਅਸੀਂ ਸਹੀਤਾਵਾਂ ਲਈ ਯਤਨਸ਼ੀਲ ਹਾਂ, ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਰੱਖੋ ਕਿ ਸਵੈਚਾਲਿਤ ਅਨੁਵਾਦਾਂ ਵਿੱਚ ਗਲਤੀਆਂ ਜਾਂ ਅਸਮੱਤਿਆਵਾਂ ਹੋ ਸਕਦੀਆਂ ਹਨ। ਮੂਲ ਦਸਤਾਵੇਜ਼ ਆਪਣੀ ਮੂਲ ਭਾਸ਼ਾ ਵਿੱਚ ਅਧਿਕਾਰਕ ਸਰੋਤ ਮੰਨਿਆ ਜਾਣਾ ਚਾਹੀਦਾ ਹੈ। ਜਰੂਰੀ ਜਾਣਕਾਰੀ ਲਈ, ਪੇਸ਼ੇਵਰ ਮਨੁੱਖੀ ਅਨੁਵਾਦ ਦੀ ਸਿਫ਼ਾਰਸ਼ ਕੀਤੀ ਜਾਂਦੀ ਹੈ। ਅਸੀਂ ਇਸ ਅਨੁਵਾਦ ਦੇ ਉਪਯੋਗ ਤੋਂ ਪੈਦਾ ਹੋਣ ਵਾਲੀਆਂ ਕਿਸੇ ਵੀ ਗਲਤਫਹਿਮੀਆਂ ਜਾਂ ਗਲਤ ਵਿਆਖਿਆਵਾਂ ਲਈ ਜਵਾਬਦੇਹ ਨਹੀਂ ਹਾਂ।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->