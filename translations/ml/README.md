# AZD ആരംഭിക്കാൻ: ഒരു ഘടനാപരമായ പഠന യാത്ര

![AZD-for-beginners](../../translated_images/ml/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### സ്വയം സജീവമായി അപ്‌ഡേറ്റ് ചെയ്യുന്ന ട്രാൻസ്ലേഷനുകൾ

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](./README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **സ്ഥാനീയമായി ക്ലോൺ ചെയ്യാൻ ആഗ്രഹമുണ്ടോ?**
>
> ഈ റിപ്പോസിറ്ററിയിൽ 50-ലധികം ഭാഷാനുഭവങ്ങൾ ഉൾപ്പെടുത്തിയതിനാൽ ഡൗൺലോഡിന്റെ വലുപ്പം വമ്പിയായി വർധിക്കുന്നു. ഭാഷാനുഭവങ്ങൾ ഇല്ലാതെ ക്ലോൺ ചെയ്യാൻ sparse checkout ഉപയോഗിക്കുക:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> ഇത് കോഴ്സ് പൂർത്തിയാക്കാൻ ആവശ്യമായ എല്ലാ ഘടകങ്ങളും വേഗത്തിൽ ഡൗൺലോഡ് ചെയ്യാനുള്ള മാർഗ്ഗം നൽകുന്നു.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Azure Developer CLI (azd) എന്താണ്?

**Azure Developer CLI (azd)** ആണ് ഡെവലപ്പർ സൗഹൃദമായ ഒരു കമാൻഡ്-ലൈൻ ടൂൾ, ഇത് Azure-ൽ അപ്ലിക്കേഷനുകൾ വിന്യസിക്കുന്നത് എളുപ്പമാക്കുന്നു. നൂറുകണക്കിന് Azure റിസോഴ്സുകൾ സൃഷ്ടിച്ച് കണക്ട് ചെയ്യുന്നത് പകരം, നിങ്ങൾക്ക് ഒരു കമാൻഡ് ഉപയോഗിച്ച് പൂർണ്ണമായ അപ്ലിക്കേഷനുകൾ വിന്യസിക്കാൻ കഴിയും.

### `azd up`-ന്റെ മായാജാലം

```bash
# ഈ ഒറ്റ കമാൻഡ് എല്ലാം ചെയ്യുന്നു:
# ✅ എല്ലാ Azure റിസോഴ്‌സുകളും സൃഷ്ടിക്കുന്നു
# ✅ നെറ്റ്വർക്കിംഗ് மற்றும் സുരക്ഷ ക്രമീകരിക്കുന്നു
# ✅ നിങ്ങളുടെ ആപ്ലിക്കേഷൻ കോഡ് ബിൽഡ് ചെയ്യുന്നു
# ✅ Azure-ലേക്ക് വിന്യസിക്കുന്നു
# ✅ നിങ്ങള്‍ക്ക് പ്രവർത്തനക്ഷമമായ ഒരു URL നൽകുന്നു
azd up
```

**അതുപോലെയേ!** Azure പോർട്ടൽ ക്ലിക്കുകൾ വേണ്ട, സങ്കീർണ്ണമായ ARM ടെംപ്ലേറ്റുകൾ പഠിക്കേണ്ട, കൈയൊപ്പമുള്ള ക്രമീകരണങ്ങൾ വേണ്ട - വെറും പ്രവർത്തനക്ഷമമായ അപ്ലിക്കേഷനുകൾ Azure-ലിൽ.

---

## ❓ Azure Developer CLI vs Azure CLI: വ്യത്യാസങ്ങൾ എന്തൊക്കെ?

ഇതാണ് തുടക്കക്കാർ കൂടുതൽ ചോദിക്കുന്ന സാധാരണ‌ترین ചോദ്യം. ഇതാ അതിന് എളുപ്പമായ ഉത്തരം:

| ഫീച്ചർ | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **ഉദ്ദേശ്യം** | വ്യക്തിഗത Azure റിസോഴ്സുകൾ നിയന്ത്രിക്കുക | പൂർണ്ണമായ അപ്ലിക്കേഷനുകൾ വിന്യസിക്കുക |
| **ചിന്താഗതിയോരു കോശം** | ഇൻഫ്രാസ്ട്രക്ചർ-കേന്ദ്രിതം | അപ്ലിക്കേഷൻ-കേന്ദ്രിതം |
| **ഉദാഹരണം** | `az webapp create --name myapp...` | `azd up` |
| **പഠന വഴിപാട്** | Azure സേവനങ്ങൾ അറിയണം | നിങ്ങളുടെ ആപ്പ് മാത്രം അറിയുക |
| **ആവശ്യം** | DevOps, ഇൻഫ്രാസ്ട്രക്ചർ | ഡെവലപ്പേഴ്‌സ്, പ്രോട്ടോടൈപ്പിംഗ് |

### ലളിതമായ ഉപമ

- **Azure CLI** എങ്ങനെ ഗൃഹനിർമ്മാണം ചെയ്യാൻ എല്ലാ ടൂളുകളും - ഹാമറുകൾ, സോ, നെയിലുകൾ - ഉള്ളതുപോലെ ആണ്. നിങ്ങൾക്ക് എന്തും നിർമ്മിക്കാൻ കഴിയും, പക്ഷേ നിർമ്മാണം അറിയണം.
- **Azure Developer CLI** ഒരു ഓർക്കണ്ടക്ടറെ നിയമിച്ചതുപോലെ ആണ് - നിങ്ങൾ എന്ത് ആവശ്യമാണ് എന്ന് പറയുമ്പോൾ അവർ്ത്തെടുക്കുകയും നിർമ്മാണം കൈകാര്യം ചെയ്യുകയും ചെയ്യും.

### ഏത് സമയം ഏത് ഉപകരണം ഉപയോഗിക്കണം

| സാഹചര്യം | ഉപയോഗിക്കുക |
|----------|----------|
| "എന്റെ വെബ് ആപ്പ് വേഗത്തിൽ വിന്യസിക്കാൻ ആഗ്രഹിക്കുന്നു" | `azd up` |
| "കേവലം ഒരു സ്റ്റോറേജ് അക്കൗണ്ട് സൃഷ്ടിക്കണം" | `az storage account create` |
| "പൂർണ്ണമായ AI അപ്ലിക്കേഷൻ നിർമ്മിക്കുന്നു" | `azd init --template azure-search-openai-demo` |
| "നിർദ്ദിഷ്ട Azure റിസോഴ്സ് ഡീബഗ് ചെയ്യണം" | `az resource show` |
| "നിമിഷങ്ങളിൽ പ്രോഡക്ഷൻ-സജ്ജമായ വിന്യാസം വേണം" | `azd up --environment production` |

### അവ തമ്മിൽ ചേർന്ന് പ്രവർത്തിക്കുന്നു!

AZD അടിസ്ഥിതം Azure CLIനെ ഉപയോഗിക്കുന്നു. നിങ്ങൾ ഇരട്ടത്തും ഉപയോഗിക്കാം:
```bash
# AZD ഉപയോഗിച്ച് നിങ്ങളുടെ ആപ്പ് വിന്യസിക്കുക
azd up

# പിന്നീട് Azure CLI ഉപയോഗിച്ച് പ്രത്യേക റിസോഴ്‌സുകൾ സൂക്ഷ്മമായി ക്രമീകരിക്കുക
az webapp config set --name myapp --always-on true
```

---

## 🌟 Awesome AZD-യിൽ ടെംപ്ലേറ്റുകൾ കണ്ടെത്തുക

ആദ്യമായി തൊടല്ലേ! **Awesome AZD** പൂർണ്ണമായ വിന്യാസത്തിനായി സഖ്യ സഭയുടെ തയ്യാറാക്കിയ ടെംപ്ലേറ്റുകളുടെ ശേഖരം:

| റിസോഴ്സ് | വിവരണം |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | ഒരു ക്ലിക്കിൽ 200+ ടെംപ്ലേറ്റുകൾ ബ്രൗസ് ചെയ്യുക |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | നിങ്ങളുടെ ടെംപ്ലേറ്റ് സമൂഹത്തിനു സമർപ്പിക്കുക |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | സ്ടാർ ചെയ്യുകയും സോഴ്സ് എക്സ്പ്ലോർ ചെയ്യുകയും ചെയ്യുക |

### Awesome AZD നിന്നുള്ള ജനപ്രിയ AI ടെംപ്ലേറ്റുകൾ

```bash
# Azure OpenAI + AI Search ഉപയോഗിച്ച് RAG ചാറ്റ്
azd init --template azure-search-openai-demo

# വേഗത്തിലുള്ള AI ചാറ്റ് അപ്ലിക്കേഷൻ
azd init --template openai-chat-app-quickstart

# Foundry ഏജന്റുകളുമായി AI ഏജന്റുകൾ
azd init --template get-started-with-ai-agents
```

---

## 🎯 3 ഘട്ടങ്ങളിൽ ആരംഭിക്കുക

### ഘട്ടം 1: AZD ഇൻസ്റ്റാൾ ചെയ്യുക (2 മിനിറ്റ്)

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

### ഘട്ടം 2: Azure-ൽ ലോഗിൻ ചെയ്യുക

```bash
azd auth login
```

### ഘട്ടം 3: നിങ്ങളുടെ പ്രഥമ ആപ്പ് വിന്യസിക്കുക

```bash
# ടെംപ്ലേറ്റിൽ നിന്ന് ആരംഭിക്കുക
azd init --template todo-nodejs-mongo

# Azure-ലേക്ക് വിന്യസിക്കുക (എല്ലാം സൃഷ്ടിക്കും!)
azd up
```

**🎉 ഇതാ ഇത്!** നിങ്ങളുടെ ആപ്പ് ഇപ്പോൾ Azure-യിൽ സജീവമാണ്.

### ക്ലീനപ് (മറക്കരുത്!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 ഈ കോഴ്സ് എങ്ങനെ ഉപയോഗിക്കുക

ഈ കോഴ്‌സ് **ക്രമീകരിച്ച പഠനത്തിനായി** രൂപകൽപ്പന ചെയ്തതാണ് - നിങ്ങൾക്ക് എളുപ്പമുള്ള സ്ഥലത്ത് നിന്നാരംഭിച്ച് മുന്നോട്ട് പോകുക:

| നിങ്ങളുടെ പരിചയം | ഇവിടെ ആരംഭിക്കുക |
|-----------------|------------|
| **പുതിയവൻ Azure-ൽ** | [അധ്യായം 1: ഫൗണ്ടേഷൻ](../..) |
| **Azure അറിയാം, AZD പുതിയതു** | [അധ്യായം 1: ഫൗണ്ടേഷൻ](../..) |
| **AI ആപ്പുകൾ വിന്യസിക്കണം** | [അധ്യായം 2: AI-ഫസ്റ്റ് ഡിവലപ്പ്മെന്റ്](../..) |
| **പ്രായോഗിക പരിശീലനം വേണം** | [🎓 ഇന്ററാക്ടീവ് വേർക്ക്ഷോപ്പ്](workshop/README.md) - 3-4 മണിക്കൂർ controlled ლാബ് |
| **പ്രോഡക്ഷൻ മാതൃകകൾ ആവശ്യം** | [അധ്യായം 8: പ്രോഡക്ഷൻ & എന്റർപ്രൈസ്](../..) |

### വേഗത്തിലുള്ള ക്രമീകരണം

1. **ഈ റിപ്പോസിറ്ററി ഫോർക്ക് ചെയ്യുക**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **ക്ലോൺ ചെയ്‌തെടുക്കുക**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **സഹായം നേടുക**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **സ്ഥാനീയമായി ക്ലോൺ ചെയ്യാൻ ആഗ്രഹമുണ്ടോ?**

> ഈ റിപ്പോസിറ്ററിയിൽ 50-ലധികം ഭാഷാനുഭവങ്ങൾ ഉൾപ്പെടുത്തിയതിനാൽ ഡൗൺലോഡിന്റെ വലുപ്പം വമ്പിയായി വർധിക്കുന്നു. ഭാഷാനുഭവങ്ങൾ ഇല്ലാതെ ക്ലോൺ ചെയ്യാൻ sparse checkout ഉപയോഗിക്കുക:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> ഇത് കോഴ്സ് പൂർത്തിയാക്കാൻ ആവശ്യമായ എല്ലാ ഘടകങ്ങളും വേഗത്തിൽ ഡൗൺലോഡ് ചെയ്യാനുള്ള മാർഗ്ഗം നൽകുന്നു.


## കോഴ്‌സ് അവലോകനം

ക്രമീകരിച്ച അധ്യായങ്ങളിലൂടെ Azure Developer CLI (azd)-യിൽ നയപ്രാപിച്ചത്. **Microsoft Foundry സംയോജനം ഉപയോഗിച്ച് AI അപ്ലിക്കേഷൻ വിന്യാസത്തിനും പ്രത്യേക ശ്രദ്ധ.**

### ഈ കോഴ്സ് ആധുനിക ഡെവലപ്പർമാർക്കായി അനിവാര്യമായത് എങ്ങനെ?

Microsoft Foundry Discord സമൂഹത്തിന്റെ നിരീക്ഷണപ്രകാരം, **45% ഡെവലപ്പർമാർ AI ഭാരമുള്ള ജോലികൾക്കായി AZD ഉപയോഗിക്കണമെന്ന് ആഗ്രഹിച്ചിരുന്ന കാര്യം** കണ്ടെത്തപ്പെടുന്നു എന്നാൽ അവർക്ക് സങ്കീർണ്ണമായ സമയങ്ങൾ ഉണ്ടാവുന്നു:
- സങ്കീർണ്ണമായ ബഹു-സേവന AI വാസ്തുവിദ്യകൾ
- പ്രോഡക്ഷൻ AI വിന്യാസത്തിനായുള്ള മികച്ച പ്രക്രിയകൾ  
- Azure AI സേവന സംയോജനവും ക്രമീകരണവും
- AI ഭാരമുള്ളവയ്ക്ക് ചെലവ് കുറയ്ക്കലും
- AI-നിർദ്ദിഷ്ട വിന്യാസ പ്രശ്നങ്ങൾ പരിഹരിക്കൽ

### പഠനലക്ഷ്യങ്ങൾ

ഈ ഘടനാപരമുള്ള കോഴ്സ് പൂർത്തിയാക്കിയാൽ നിങ്ങൾക്ക്:
- **AZD അടിസ്ഥാനങ്ങൾ നശിപ്പിക്കുക**: പ്രഥമ ആശയങ്ങൾ, ഇൻസ്റ്റലേഷൻ, ക്രമീകരണം
- **AI അപ്ലിക്കേഷനുകൾ വിന്യസിക്കുക**: AZD Microsoft Foundry സേവനങ്ങളുമായി ഉപയോഗിക്കുക
- **Infrastructure as Code നടപ്പിലാക്കുക**: Bicep ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് Azure റിസോഴ്സുകൾ കൈകാര്യം ചെയ്യുക
- **വിന്യാസ പ്രശ്നങ്ങൾ പരിഹരിക്കുക**: സാധാരണ തകരാറുകൾ പരിഹരിച്ച് ഡീബഗ് ചെയ്യുക
- **പ്രോഡക്ഷനായി പരിഷ്കരിക്കുക**: സുരക്ഷ, സ്കെയ്ലിംഗ്, നിരീക്ഷണം, ചെലവ് നിയന്ത്രണം
- **ബഹു-ഏജന്റ് സൊല്യൂഷനുകൾ നിർമ്മിക്കുക**: സങ്കീർണ്ണമായ AI വാസ്തുവിദ്യകളെ വിന്യസിക്കുക

## 🗺️ കോഴ്സ് മാപ്പ്: അധ്യായങ്ങൾ അനുസരിച്ച് വേഗത്തിലുള്ള നാവിഗേഷൻ

ഓരോ അധ്യായത്തിനും പഠനലക്ഷ്യങ്ങൾ, വേഗമായ ആരംഭം, ചവിട്ടുപകർച്ചകൾ ഉൾപ്പെട്ട README ഉണ്ട്:

| അധ്യായം | വിഷയം | പാഠങ്ങൾ | ദൈർഘ്യം | സങ്കീർണ്ണത |
|---------|-------|---------|----------|------------|
| **[ച 1: ഫൗണ്ടേഷൻ](docs/chapter-01-foundation/README.md)** | ആരംഭം | [AZD അടിസ്ഥാനങ്ങൾ](docs/chapter-01-foundation/azd-basics.md) &#124; [ഇൻസ്റ്റലേഷൻ](docs/chapter-01-foundation/installation.md) &#124; [ആദ്യ പ്രോജക്ട്](docs/chapter-01-foundation/first-project.md) | 30-45 മിനിറ്റ് | ⭐ |
| **[ച 2: AI ഡെവലപ്പ്മെന്റ്](docs/chapter-02-ai-development/README.md)** | AI-ഫസ്റ്റ് ആപ്പുകൾ | [Foundry സംയോജനം](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI ഏജന്റുകൾ](docs/chapter-02-ai-development/agents.md) &#124; [മോഡൽ വിന്യാസം](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [വേർക്ക്ഷോപ്പ്](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 മണിക്കൂർ | ⭐⭐ |
| **[ച 3: ക്രമീകരണം](docs/chapter-03-configuration/README.md)** | പ്രാമാണീകരണവും സുരക്ഷയും | [ക്രമീകരണം](docs/chapter-03-configuration/configuration.md) &#124; [പ്രാമാണീകരണം & സുരക്ഷ](docs/chapter-03-configuration/authsecurity.md) | 45-60 മിനിട്ട് | ⭐⭐ |
| **[അധ്യായം 4: ഇൻഫ്രാസ്റ്റ്രക്ചർ](docs/chapter-04-infrastructure/README.md)** | IaC & ഡെപ്ലോയ്മെന്റ് | [ഡെപ്ലോയ്മെന്റ് ഗൈഡ്](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [പ്രൊവിഷനിംഗ്](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 മണിക്കൂർ | ⭐⭐⭐ |
| **[അധ്യായം 5: മൾട്ടി-എജന്റ്](docs/chapter-05-multi-agent/README.md)** | AI എജന്റ് സൊല്യൂഷൻസ് | [റീറ്റെയിൽ സീനാരിയോ](examples/retail-scenario.md) &#124; [കോർഡിനേഷൻ പാറ്റേൺസ്](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 മണിക്കൂർ | ⭐⭐⭐⭐ |
| **[അധ്യായം 6: പ്രീ-ഡെപ്ലോയ്മെന്റ്](docs/chapter-06-pre-deployment/README.md)** | പദ്ധതിയിടൽ & വാലിഡേഷൻ | [പ്രീഫ്ലൈറ്റ് ചെക്കുകൾ](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [സമർത്ഥത പദ്ധതിയിടൽ](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU തിരഞ്ഞെടുപ്പ്](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [ആപ്പ് ഇൻസൈറ്റ്സ്](docs/chapter-06-pre-deployment/application-insights.md) | 1 മണിക്കൂർ | ⭐⭐ |
| **[അധ്യായം 7: പ്രശ്നപരിഹാരം](docs/chapter-07-troubleshooting/README.md)** | ഡിബഗ് & ഫിക്സ് | [പൊതു പ്രശ്നങ്ങൾ](docs/chapter-07-troubleshooting/common-issues.md) &#124; [ഡിബഗിംഗ്](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI പ്രശ്നങ്ങൾ](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 മണിക്കൂർ | ⭐⭐ |
| **[അധ്യായം 8: പ്രൊഡക്ഷൻ](docs/chapter-08-production/README.md)** | എൻ്ററപ്രൈസ് പാറ്റേൺസ് | [പ്രൊഡക്ഷൻ അഭ്യാസങ്ങൾ](docs/chapter-08-production/production-ai-practices.md) | 2-3 മണിക്കൂർ | ⭐⭐⭐⭐ |
| **[🎓 വർക്‌ഷോപ്പ്](workshop/README.md)** | ഹാൻഡ്‌സ്-ഓൺ ലാബ് | [പരിചയം](workshop/docs/instructions/0-Introduction.md) &#124; [തിരഞ്ഞെടുപ്പ്](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [വാലിഡേഷൻ](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [ഡികൺസ്ട്രക്ഷൻ](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [കൺഫിഗറേഷൻ](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [കസ്റ്റമൈസേഷൻ](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [ടിയർഡൗൺ](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 മണിക്കൂർ | ⭐⭐ |

**ആകെ കോഴ്‌സ് ദൈര്‍ഘ്യം:** ~10-14 മണിക്കൂർ | **സ്കിൽ പുരോഗതി:** തുടക്കക്കാരൻ → പ്രൊഡക്ഷൻ-റെഡി

---

## 📚 പഠനധാരകൾ

*അനുഭവത്തിലോ ലക്ഷ്യങ്ങളിലോ അടിസ്ഥാനപ്പെടുത്തി നിങ്ങളുടെ പഠന പാത തിരഞ്ഞെടുക്കുക*

### 🚀 അധ്യായം 1: ഫൗണ്ടേഷൻ & ക്വിക്ക് സ്റ്റാർട്ട്
**മുൻകണക്ക്:** അസ്യൂർ സബ്സ്ക്രിപ്ഷൻ, അടിസ്ഥാന കമാൻഡ് ലൈനിലെ പരിചയം  
**ദൈർഘ്യം:** 30-45 മിനിറ്റ്  
**സങ്കീർണ്ണത:** ⭐

#### നിങ്ങൾ പഠിക്കുന്നതെന്ത്
- അസ്യൂർ ഡെവലപ്പർ CLI അടിസ്ഥാനങ്ങൾ മനസിലാക്കൽ
- നിങ്ങളുടെ പ്ലാറ്റ്ഫോമിൽ AZD ഇൻസ്റ്റാൾ ചെയ്യുക
- നിങ്ങളുടെ ആദ്യ വിജയകരമായ ഡെപ്ലോയ്മെന്റ്

#### പഠന വിഭവങ്ങൾ
- **🎯 ഇവിടെ തുടങ്ങുക**: [അസ്യൂർ ഡെവലപ്പർ CLI എന്താണ്?](../..)
- **📖 സിദ്ധാന്തം**: [AZD അടിസ്ഥാനങ്ങൾ](docs/chapter-01-foundation/azd-basics.md) - പ്രധാന ആശയങ്ങളും പദസൂചനകളും
- **⚙️ സെറ്റപ്പ്**: [സ്ഥാപനവും സെറ്റപ്പും](docs/chapter-01-foundation/installation.md) - പ്ലാറ്റ്ഫോം-സ്പെസിഫിക് ഗൈഡ്
- **🛠️ ഹാൻഡ്‌സ്-ഓൺ**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്ട്](docs/chapter-01-foundation/first-project.md) - ഘട്ടം-ഘട്ടം ട്യൂട്ടോറിയൽ
- **📋 ക്വിക്ക് റഫറൻസ്**: [കമാൻഡ് ചീറ്റ് ഷീറ്റ്](resources/cheat-sheet.md)

#### പ്രായോഗിക വ്യായാമങ്ങൾ
```bash
# ദ്രുത ഇൻസ്റ്റാളേഷൻ പരിശോധന
azd version

# നിങ്ങളുടെ ആദ്യ ആപ്ലിക്കേഷൻ വിന്യാസപ്പെടുത്തുക
azd init --template todo-nodejs-mongo
azd up
```

**💡 അധ്യായ ഫലം**: AZD ഉപയോഗിച്ച് ഒരു ലളിതമായ വെബ് ആപ്ലിക്കേഷൻ അസ്യൂറിൽ വിജയകരമായി ഡെപ്ലോയ് ചെയ്യുക

**✅ വിജയ പരിശോധന:**
```bash
# ചാപ്റ്റർ 1 പൂർത്തിയാക്കിയ ശേഷം, നിങ്ങൾക്ക് കഴിയും:
azd version              # ഇൻസ്റ്റാൾ ചെയ്ത പതിപ്പ് കാണിക്കുന്നു
azd init --template todo-nodejs-mongo  # പ്രോജക്ട് ആരംഭിക്കുന്നു
azd up                  # Azure-ലേക്ക് വിന്യസിക്കുന്നു
azd show                # പ്രവർത്തിക്കുന്ന ആപ്പ് URL പ്രദർശിപ്പിക്കുന്നു
# ആപ്പ് ബ്രൗസറിൽ തുറന്ന് പ്രവർത്തിക്കുന്നു
azd down --force --purge  # വിഭവങ്ങൾ ശുചീകരിക്കുന്നു
```

**📊 സമയ നിക്ഷേപം:** 30-45 മിനിറ്റ്  
**📈 പഠനമാന്ദം ശേഷമുള്ള മുൾക്കൽ:** അടിസ്ഥാന അപ്ലിക്കേഷനുകൾ സ്വതന്ത്രമായി ഡെപ്ലോയ് ചെയ്യാൻ സാധിക്കും

**✅ വിജയ പരിശോധന:**
```bash
# അധ്യായം 1 പൂർത്തിയാക്കിയതിന് ശേഷം, നിങ്ങൾക്ക് കഴിയും:
azd version              # ഇൻസ്റ്റാൾ ചെയ്ത പതിപ്പ് കാണിക്കുക
azd init --template todo-nodejs-mongo  # പ്രോജക്റ്റ് ആരംഭിക്കുന്നു
azd up                  # Azure-ലേക്ക് ഡ്രോപ്പ് ചെയ്യുന്നു
azd show                # പ്രവർത്തിക്കുന്ന ആപ്പ് URL കാണിക്കുന്നു
# ആപ്പ് ബ്രൗസറിൽ തുറക്കുകയും പ്രവർത്തിക്കുകയും ചെയ്യുന്നു
azd down --force --purge  # റിസോഴ്‌സുകൾ ശുചിയാക്കുന്നു
```

**📊 സമയ നിക്ഷേപം:** 30-45 മിനിറ്റ്  
**📈 പഠനമാന്ദം ശേഷമുള്ള മുൾക്കൽ:** അടിസ്ഥാന അപ്ലിക്കേഷനുകൾ സ്വതന്ത്രമായി ഡെപ്ലോയ് ചെയ്യാൻ സാധിക്കും

---

### 🤖 അധ്യായം 2: AI-ഫസ്റ്റ് ഡവലപ്പ്മെന്റ് (AI ഡവലപ്പർമാര്‍ക്കായി ശിപാർശചെയ്തത്)
**മുൻകണക്ക്:** അധ്യായം 1 പൂർത്തിയായി  
**ദൈർഘ്യം:** 1-2 മണിക്കൂർ  
**സങ്കീർണ്ണത:** ⭐⭐

#### നിങ്ങൾ പഠിക്കുന്നതെന്ത്
- AZD-യുമായി Microsoft Foundry ഇന്റഗ്രേഷൻ
- AI-നെ ശക്തിപ്പെടുത്തിയ അപ്ലിക്കേഷനുകൾ ഡെപ്ലോയ്മെന്റ്
- AI സേവന ക്രമീകരണങ്ങൾ മനസിലാക്കൽ

#### പഠന വിഭവങ്ങൾ
- **🎯 ഇവിടെ തുടങ്ങുക**: [Microsoft Foundry ഇന്റഗ്രേഷൻ](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI എജന്റുകൾ**: [AI എജന്റുകൾ ഗൈഡ്](docs/chapter-02-ai-development/agents.md) - AZD ഉപയോഗിച്ച് ബുദ്ധിമുട്ടുള്ള എജന്റുകൾ ഡെപ്ലോയ് ചെയ്യുക
- **📖 പാറ്റേൺസ്**: [AI മോഡൽ ഡെപ്ലോയ്മെന്റ്](docs/chapter-02-ai-development/ai-model-deployment.md) - AI മോഡലുകൾ ഡെപ്ലോയ് ചെയ്യാനും കൈകാര്യം ചെയ്യാനും
- **🛠️ വർക്‌ഷോപ്പ്**: [AI വർക്‌ഷോപ്പ് ലാബ്](docs/chapter-02-ai-development/ai-workshop-lab.md) - നിങ്ങളുടെ AI പരിഹാരങ്ങൾ AZD-റെഡി ആക്കുക
- **🎥 ഇന്ററാക്ടീവ് ഗൈഡ്**: [വർക്‌ഷോപ്പ് സാമഗ്രികൾ](workshop/README.md) - MkDocs * DevContainer പരിസ്ഥിതിയിൽ ബ്രൗസർ അടിസ്ഥാനത്തിലുള്ള പഠനം
- **📋 ടെംപ്ലേറ്റുകൾ**: [Microsoft Foundry ടെംപ്ലേറ്റുകൾ](../..)
- **📝 ഉദാഹരണങ്ങൾ**: [AZD ഡെപ്ലോയ്മെന്റ് ഉദാഹരണങ്ങൾ](examples/README.md)

#### പ്രായോഗിക വ്യായാമങ്ങൾ
```bash
# നിങ്ങളുടെ ആദ്യ AI അപ്ലിക്കേഷൻ വിന്യസിക്കുക
azd init --template azure-search-openai-demo
azd up

# അധിക AI ടെംപ്ലേറ്റുകൾ പരീക്ഷിക്കുക
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 അധ്യായ ഫലം**: RAG കഴിവുകൾ ഉള്ള AI-പ്രേരിത ചാറ്റ് അപ്ലിക്കേഷൻ ഡെപ്ലോയ് ചെയ്ത് ക്രമീകരിക്കുക

**✅ വിജയ പരിശോധന:**
```bash
# അദ്ധ്യായം 2 കഴിഞ്ഞാൽ, നിങ്ങൾക്ക് സാധിക്കണം:
azd init --template azure-search-openai-demo
azd up
# AI ചാറ്റ് ഇന്റർഫേസ് പരിശോദിക്കുക
# ചോദ്യങ്ങൾ ചോദിക്കുകയും സ്രോതസ്സ് സഹിതം AI-നിർവ്വചിതമുള്ള പ്രതികരണങ്ങൾ നേടുകയും ചെയ്യുക
# തിരയൽ ഇന്റഗ്രേഷൻ പ്രവർത്തിക്കുന്നു എന്ന് സ്ഥിരീകരിക്കുക
azd monitor  # ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്‌സ് ടെലെമെട്രി കാണിക്കുന്നു എന്ന് പരിശോധിക്കുക
azd down --force --purge
```

**📊 സമയ നിക്ഷേപം:** 1-2 മണിക്കൂർ  
**📈 പഠനമാന്ദം ശേഷമുള്ള മുൾക്കൽ:** പ്രൊഡക്ഷൻ-റെഡി AI അപ്ലിക്കേഷനുകൾ ഡെപ്ലോയ് ചെയ്ത് ക്രമീകരിക്കാൻ കഴിയും  
**💰 ചിലവ് ബോധവൽക്കരണം:** $80-150/മാസം ഡവലപ്പ്മെന്റ് ചിലവുകൾ, $300-3500/മാസം പ്രൊഡക്ഷൻ ചിലവുകൾ മനസിലാക്കുക

#### 💰 AI ഡെപ്ലോയ്മെന്റുകൾക്കുള്ള ചിലവ് പരിഗണനകൾ

**ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി (ഏകദേശം $80-150/മാസം):**
- Azure OpenAI (പേ-അസ്-യു-ഗോ): $0-50/മാസം (ടോക്കൺ ഉപയോഗത്തിന് അടിസ്ഥാനമാക്കി)
- AI സെർച് (ബേസിക് ടിയർ): $75/മാസം
- കണ്ടെയ്‌നർ ആപ്പുകൾ (കോൺസക്ഷൻ): $0-20/മാസം
- സ്റ്റോറേജ് (സ്റ്റാൻഡേർഡ്): $1-5/മാസം

**പ്രൊഡക്ഷൻ പരിസ്ഥിതി (ഏകദേശം $300-3,500+/മാസം):**
- Azure OpenAI (സ്ഥിരമായ പ്രകടനത്തിനുള്ള PTU): $3,000+/മാസം അല്ലെങ്കിൽ ഉയർന്ന വോളിയം പേ-അസ്-യു-ഗോ
- AI സെർച് (സ്റ്റാൻഡേർഡ് ടിയർ): $250/മാസം
- കണ്ടെയ്‌നർ ആപ്പുകൾ (ഡെഡിക്കേറ്റഡ്): $50-100/മാസം
- ആപ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ്: $5-50/മാസം
- സ്റ്റോറേജ് (പ്രീമിയം): $10-50/മാസം

**💡 ചിലവ് ശമനത്തിന് ഉപദേശം:**
- പഠനത്തിനായി **ഫ്രീ ടിയർ** Azure OpenAI ഉപയോഗിക്കുക (50,000 ടോക്കൺ/മാസം ഉൾപ്പെടുന്നു)
- സജീവമായി വികസിപ്പിക്കാത്തപ്പോൾ റിസോഴ്‌സുകൾ ഡിയലക്കേറ്റ് ചെയ്യാൻ `azd down` റൺ ചെയ്യുക
- കോൺസക്ഷൻ ബില്ലിംഗ് പ്രകാരം തുടങ്ങിയ ശേഷം പ്രൊഡക്ഷനു വേണ്ടിയാണ് PTU അപ്ഗ്രേഡ് ചെയ്യുക
- ഡെപ്ലോയ്മെന്റിന് മുമ്പായി ചിലവ് കൃത്യമായി കണക്കാക്കാൻ `azd provision --preview` ഉപയോഗിക്കുക
- ഓട്ടോമാറ്റിക് സ്കെയിലിംഗ് സജീവമാക്കുക: യഥാർത്ഥ ഉപയോഗത്തിന് മാത്രം പണം നൽകുക

**ചിലവ് നിരീക്ഷണം:**
```bash
# اندازہ شدہ ماہانہ اخراجات چیک کریں
azd provision --preview

# Azure پورٹل میں اصل اخراجات کی نگرانی کریں
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ അധ്യായം 3: കൺഫിഗറേഷൻ & ഓതന്റിക്കേഷൻ
**മുൻകണക്ക്:** അധ്യായം 1 പൂർത്തിയായി  
**ദൈർഘ്യം:** 45-60 മിനിറ്റ്  
**സങ്കീർണ്ണത:** ⭐⭐

#### നിങ്ങൾ പഠിക്കുന്നതെന്ത്
- പരിസ്ഥിതി ക്രമീകരണവും മാനേജ്മെന്റും
- ഓതന്റിക്കേഷൻ & സെക്യൂരിറ്റി ബെസ്റ്റ് പ്രാക്ടിസസ്
- റിസോഴ്‌സ് നാമകരണം & സംഘടന

#### പഠന വിഭവങ്ങൾ
- **📖 കൺഫിഗറേഷൻ**: [കൺഫിഗറേഷൻ ഗൈഡ്](docs/chapter-03-configuration/configuration.md) - പരിസ്ഥിതി സജ്ജീകരണം
- **🔐 സുരക്ഷ**: [ഓതന്റിക്കേഷൻ പാറ്റേൺസ് & മാനേജ്‍ഡ് ഐഡന്റിറ്റി](docs/chapter-03-configuration/authsecurity.md) - ഓതന്റിക്കേഷൻ മാതൃകകൾ
- **📝 ഉദാഹരണങ്ങൾ**: [ഡാറ്റാബേസ് ആപ്പ് ഉദാഹരണം](examples/database-app/README.md) - AZD ഡാറ്റാബേസ് ഉദാഹരണങ്ങൾ

#### പ്രായോഗിക വ്യായാമങ്ങൾ
- പല പരിസ്ഥിതികളും ക്രമീകരിക്കുക (ഡെവ്, സ്റ്റേജിംഗ്, പ്രൊഡക്ഷൻ)
- മാനേജ്‍ഡ് ഐഡന്റിറ്റി ഓതന്റിക്കേഷൻ സജ്ജമാക്കുക
- പരിസ്ഥിതി-സവിശേഷ ക്രമീകരണങ്ങൾ നടപ്പിലാക്കുക

**💡 അധ്യായ ഫലം**: ശരിയായ ഓതന്റിക്കേഷൻ & സുരക്ഷയോടെ ബഹുഭൂരിപക്ഷ പരിസ്ഥിതികൾ കൈകാര്യം ചെയ്യുക

---

### 🏗️ അധ്യായം 4: ഇൻഫ്രാസ്ട്രക്ചർ എസ്സ് കോഡ് & ഡെപ്ലോയ്മെന്റ്
**മുൻകണക്ക്:** അധ്യായങ്ങൾ 1-3 പൂർത്തിയായി  
**ദൈർഘ്യം:** 1-1.5 മണിക്കൂർ  
**സങ്കീർണ്ണത:** ⭐⭐⭐

#### നിങ്ങൾ പഠിക്കുന്നതെന്ത്
- ഉയർന്ന നിലവാരത്തിലുള്ള ഡെപ്ലോയ്മെന്റ് മാതൃകകൾ
- Bicep ഉപയോഗിച്ച് ഇൻഫ്രാസ്ട്രക്ചർ എസ്സ് കോഡ്
- റിസോഴ്‌സ് പ്രൊവിഷനിംഗ് തന്ത്രങ്ങൾ

#### പഠന വിഭവങ്ങൾ
- **📖 ഡെപ്ലോയ്മെന്റ്**: [ഡെപ്ലോയ്മെന്റ് ഗൈഡ്](docs/chapter-04-infrastructure/deployment-guide.md) - സമ്പൂർണ്ണ വർക്ക്‌ഫ്ലോങ്ങൾ
- **🏗️ പ്രൊവിഷനിംഗ്**: [റിസോഴ്‌സുകൾ പ്രൊവിഷൻ ചെയ്യൽ](docs/chapter-04-infrastructure/provisioning.md) - അസ്യൂർ റിസോഴ്‌സ് മാനേജ്‌മെന്റ്
- **📝 ഉദാഹരണങ്ങൾ**: [കണ്ടെയ്‌നർ ആപ്പ് ഉദാഹരണം](../../examples/container-app) - കണ്ടെയ്‌നറൈസ്ഡ് ഡെപ്ലോയ്മെന്റുകൾ

#### പ്രായോഗിക വ്യായാമങ്ങൾ
- കസ്റ്റം Bicep ടെംപ്ലേറ്റുകൾ സൃഷ്ടിക്കുക
- മൾട്ടി-സർവീസ് അപ്ലിക്കേഷനുകൾ ഡെപ്ലോയ് ചെയ്യുക
- ബ്ലൂ-ഗ്രീൻ ഡെപ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ നടപ്പിലാക്കുക

**💡 അധ്യായ ഫലം**: കസ്റ്റം ഇൻഫ്രാസ്ട്രക്ചർ ടെംപ്ലേറ്റുകൾ ഉപയോഗിച്ച് സങ്കീർണ്ണ മൾട്ടി-സർവീസ് അപ്ലിക്കേഷനുകൾ ഡെപ്ലോയ് ചെയ്യുക

---

### 🎯 അധ്യായം 5: മൾട്ടി-എജന്റ് AI സൊല്യൂഷൻസ് (ഉന്നതതരം)
**മുൻകണക്ക്:** അധ്യായങ്ങൾ 1-2 പൂർത്തിയായി  
**ദൈർഘ്യം:** 2-3 മണിക്കൂർ  
**സങ്കീർണ്ണത:** ⭐⭐⭐⭐

#### നിങ്ങൾ പഠിക്കുന്നതെന്ത്
- മൾട്ടി-എജന്റ് ആർക്കിടെക്ചർ പാറ്റേൺസ്
- എജന്റ് ഓർക്കസ്ട്രേഷനും കോർഡിനേഷനും
- പ്രൊഡക്ഷൻ-റെഡി AI ഡെപ്ലോയ്മെന്റുകൾ

#### പഠന വിഭവങ്ങൾ
- **🤖 ഫീച്ചർഡ് പ്രോജക്ട്**: [റീറ്റെയിൽ മൾട്ടി-എജന്റ് സൊല്യൂഷൻ](examples/retail-scenario.md) - മുഴുവൻ നടപ്പാക്കൽ
- **🛠️ ARM ടെംപ്ലേറ്റുകൾ**: [ARM ടെംപ്ലേറ്റ് പാക്കേജ്](../../examples/retail-multiagent-arm-template) - ഒറ്റ ക്ലിക്ക് ഡെപ്ലോയ്മെന്റ്
- **📖 ആർക്കിടെക്ചർ**: [മൾട്ടി-എജന്റ് കോർഡിനേഷൻ പാറ്റേൺസ്](docs/chapter-06-pre-deployment/coordination-patterns.md) - പാറ്റേൺസ്

#### പ്രായോഗിക വ്യായാമങ്ങൾ
```bash
# പൂർണമായ റീട്ടെയിൽ മൾട്ടി-ഏജന്റ് സൊല്യൂഷൻ വിന്യസിക്കുക
cd examples/retail-multiagent-arm-template
./deploy.sh

# ഏജന്റ് കോൺഫിഗറേഷനുകൾ പരിശോധിക്കുക
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 അധ്യായ ഫലം**: കസ്റ്റമർ & ഇൻവെൻററി എജന്റുകളുമായി ഒരു പ്രൊഡക്ഷൻ-റെഡി മൾട്ടി-എജന്റ് AI സൊല്യൂഷൻ ഡെപ്ലോയ് ചെയ്ത് കൈകാര്യം ചെയ്യുക

---

### 🔍 അധ്യായം 6: പ്രീ-ഡെപ്ലോയ്മെന്റ് വാലിഡേഷൻ & പദ്ധതി
**മുൻകണക്ക്:** അധ്യായം 4 പൂർത്തിയായി  
**ദൈർഘ്യം:** 1 മണിക്കൂർ  
**സങ്കീർണ്ണത:** ⭐⭐

#### നിങ്ങൾ പഠിക്കുന്നതെന്ത്
- ശേഷി പദ്ധതിയിടലും റിസോഴ്‌സ് വാലിഡേഷനും
- SKU തിരഞ്ഞെടുപ്പ് തന്ത്രങ്ങൾ
- പ്രി-ഫ്ലൈറ്റ് ചെക്കുകളും ഓട്ടോമേഷൻ

#### പഠന വിഭവങ്ങൾ
- **📊 പദ്ധതി**: [സമർത്ഥത പദ്ധതി](docs/chapter-06-pre-deployment/capacity-planning.md) - റിസോഴ്‌സ് വാലിഡേഷൻ
- **💰 തിരഞ്ഞെടുപ്പ്**: [SKU തിരഞ്ഞെടുപ്പ്](docs/chapter-06-pre-deployment/sku-selection.md) - ചെലവ്-പ്രവർത്തക തിരഞ്ഞെടുപ്പുകൾ
- **✅ വാലിഡേഷൻ**: [പ്രീഫ്ലൈറ്റ് ചെക്കുകൾ](docs/chapter-06-pre-deployment/preflight-checks.md) - ഓട്ടോമേറ്റഡ് സ്ക്രിപ്റ്റുകൾ

#### പ്രായോഗിക വ്യായാമങ്ങൾ
- ശേഷി വാലിഡേഷൻ സ്ക്രിപ്റ്റുകൾ റൺ ചെയ്യുക
- ചിലവിനനുസരിച്ച് SKU തിരഞ്ഞെടുപ്പ് ഒപ്റ്റിമൈസ് ചെയ്യുക
- ഓട്ടോമേറ്റഡ് പ്രീ-ഡെപ്ലോയ്മെന്റ് ചെക്കുകൾ നടപ്പിലാക്കുക

**💡 അധ്യായ ഫലം**: നടപ്പിലാക്കുന്നതിന് മുമ്പ് ഡെപ്ലോയ്മെന്റുകൾ വാലിഡേറ്റ് ചെയ്ത് ഒപ്റ്റിമൈസ് ചെയ്യുക

---

### 🚨 അധ്യായം 7: പ്രശ്നപരിഹാരം & ഡിജഗിംഗ്
**മുൻകണക്ക്:** ഏതെങ്കിലും ഡെപ്ലോയ്മെന്റ് അധ്യായം പൂർത്തിയായി  
**ദൈർഘ്യം:** 1-1.5 മണിക്കൂർ  
**സങ്കീർണ്ണത:** ⭐⭐

#### നിങ്ങൾ പഠിക്കുന്നതെന്ത്
- സിസ്റ്റematic ഡിബഗിംഗ് സമീപനങ്ങൾ
- പൊതു പ്രശ്നങ്ങളും പരിഹാരങ്ങളും
- AI-നിർദിഷ്ട പ്രശ്നപരിഹാരം

#### പഠന വിഭവങ്ങൾ
- **🔧 പൊതു പ്രശ്നങ്ങൾ**: [പൊതു പ്രശ്നങ്ങൾ](docs/chapter-07-troubleshooting/common-issues.md) - FAQ & പരിഹാരങ്ങൾ
- **🕵️ ഡിബഗിംഗ്**: [ഡിബഗിംഗ് ഗൈഡ്](docs/chapter-07-troubleshooting/debugging.md) - ഘട്ടം-ഘട്ടം തന്ത്രങ്ങൾ
- **🤖 AI പ്രശ്നങ്ങൾ**: [AI-നിർദിഷ്ട troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI സെർവ്വീസ് പ്രശ്നങ്ങൾ

#### പ്രായോഗിക വ്യായാമങ്ങൾ
- ഡെപ്ലോയ്മെന്റ് പരാജയങ്ങൾ സംശോധിക്കുക
- ഓതന്റിക്കേഷൻ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- AI സേവന ബന്ധത്തിന് ഡിബഗ് ചെയ്യുക

**💡 അധ്യായ ഫലം**: പൊതു ഡെപ്ലോയ്മെന്റ് പ്രശ്നങ്ങൾ സ്വതന്ത്രമായി വിശകലനം ചെയ്ത് പരിഹരിക്കുക

---

### 🏢 അധ്യായം 8: പ്രൊഡക്ഷൻ & എൻ്റർപ്രൈസ് പാറ്റേൺസ്
**മുൻകണക്ക്:** അധ്യായങ്ങൾ 1-4 പൂർത്തിയായി  
**ദൈർഘ്യം:** 2-3 മണിക്കൂർ  
**സങ്കീർണ്ണത:** ⭐⭐⭐⭐

#### നിങ്ങൾ പഠിക്കുന്നതെന്ത്
- പ്രൊഡക്ഷൻ ഡെപ്ലോയ്മെന്റ് തന്ത്രങ്ങൾ
- എൻ്റർപ്രൈസ് സുരക്ഷ പാറ്റേൺസ്
- നിരീക്ഷണവും ചിലവ് ശമനവും

#### പഠന വിഭവങ്ങൾ
- **🏭 പ്രൊഡക്ഷൻ**: [പ്രൊഡക്ഷൻ AI ബെസ്റ്റ് പ്രാക്ടിസസ്](docs/chapter-08-production/production-ai-practices.md) - എൻ്റെർപ്രൈസ് പാറ്റേൺസ്
- **📝 ഉദാഹരണങ്ങൾ**: [മൈക്രോസർവിസസ് ഉദാഹരണം](../../examples/microservices) - സങ്കീർണ്ണ ആർക്കിടെക്ചറുകൾ
- **📊 നിരീക്ഷണം**: [ആപ്പ്ലിക്കേഷൻ ഇൻസൈറ്റ്സ് ഇന്റഗ്രേഷൻ](docs/chapter-06-pre-deployment/application-insights.md) - നിരീക്ഷണം

#### പ്രായോഗിക വ്യായാമങ്ങൾ
- എൻ്റെർപ്രൈസ് സുരക്ഷ പാറ്റേൺസ് നടപ്പിലാക്കുക
- സമഗ്രമായ നിരീക്ഷണം സജ്ജീകരിക്കുക
- ആവശ്യമായ ഗവർണൻസ് ഉപയോഗിച്ച് പ്രൊഡക്ഷനു ഡെപ്ലോയ് ചെയ്യുക

**💡 അധ്യായ ഫലം**: സമ്പൂർണ്ണ പ്രൊഡക്ഷൻ കാര്യക്ഷമതയുള്ള എൻ്റർപ്രൈസ് റെഡി അപ്ലിക്കേഷനുകൾ ഡെപ്ലോയ് ചെയ്യുക

---

## 🎓 വർക്‌ഷോപ്പ് അവലോകനം: ഹാൻഡ്‌സ്-ഓൺ പഠന അനുഭവം

> **⚠️ വർക്‌ഷോപ്പ് സ്ഥിതി: സജീവ വികസനം**  

> വർക്‌ഷോപ്പ് മെറ്റീരിയലുകൾ ഇപ്പോൾ വികസിപ്പിക്കുകയും ശ്രെദ്ധാപൂർവ്വം പുനർനിർമ്മിക്കുകയും ചെയ്യുന്നു. കോർ മോഡ്യൂളുകൾ പ്രവർത്തനക്ഷമമാണ്, എന്നാൽ ചില പുരോഗമന വിഭാഗങ്ങൾ അപൂർണ്ണമാണ്. എല്ലാ ഉള്ളടക്കവും പൂർത്തിയാക്കാൻ ഞങ്ങൾ സജീവമായി പ്രവർത്തിക്കുന്നു. [Track progress →](workshop/README.md)

### ഇന്ററാക്ടീവ് വർക്‌ഷോപ്പ് മെറ്റീരിയൽസ്
**ബ്രൗസർ അടിസ്ഥാനമാക്കിയുള്ള ഉപകരണങ്ങളും മാർഗനിർദ്ദേശപ്പെട്ട അഭ്യാസങ്ങളും ഉൾപ്പെടുന്ന സമഗ്രമായ പ്രായോഗിക പഠനം**

ഞങ്ങളുടെ വർക്‌ഷോപ്പ് മെറ്റീരിയലുകൾ മുകളിലുള്ള അധ്യായം അടിസ്ഥാനമാക്കിയുള്ള പാഠ്യപദ്ധതിയെ पूരകമാക്കുന്ന ഘടനയോടെ, ഇന്ററാക്ടീവ് പഠന അനുഭവം നൽകുന്നു. സ്വയംഗതിയായ പഠനത്തിനും, അധ്യാപകൻ നയിക്കുന്ന സെഷനുകൾക്കും ഈ വർക്‌ഷോപ്പ് രൂപകൽപ്പന ചെയ്തതാണ്.

#### 🛠️ വർക്‌ഷോപ്പ് സവിശേഷതകൾ
- **ബ്രൗസർ-അടിസ്ഥാനമാക്കിയ ഇന്റർഫെയ്‌സ്**: തിരയൽ, പകർത്തൽ, തീം സൗകര്യങ്ങളോട് സമ്പൂർണമായ MkDocs-പവർഡ് വർക്‌ഷോപ്പ്
- **GitHub Codespaces ഇന്റഗ്രേഷൻ**: ഒറ്റ ക്ലിക്കിൽ ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി ക്രമീകരണം
- **ഘടനയുള്ള പഠന പാത**: 8-മൊഡ്യൂളുള്ള മാർഗനിർദ്ദേശപ്പെട്ട അഭ്യാസങ്ങൾ (മൊത്തം 3-4 മണിക്കൂർ)
- **പ്രഗതിശീലമായ രീതി**: പരിചയം → തിരഞ്ഞെടുപ്പ് → പരിശോധന → വിഘടനം → ക്രമീകരണം → വ്യക്തിഗതമാക്കൽ → നീക്കം → സംക്ഷേപം
- **ഇന്ററാക്ടീവ് ഡെവ്‌കന്റെനർ പരിസ്ഥിതി**: മുൻ ക്രമീകരിച്ച ഉപകരണങ്ങളും ആശ്രിതങ്ങളും

#### 📚 വർക്‌ഷോപ്പ് മൊഡ്യൂൾ ഘടന
വർക്‌ഷോപ്പിനു പിന്തുടരുന്ന **8-മൊഡ്യൂളുള്ള പ്രഗതിശീലമായ രീതി** നിങ്ങളെ കണ്ടെത്തലിൽ നിന്നുള്ള വിന്യാസ വിദഗ്ധതയിലേക്ക് നയിക്കുന്നു:

| മൊഡ്യൂൾ | വിഷയം | നിങ്ങൾ ചെയ്യുന്നത് | കാലാവധി |
|---------|-------|-----------------|-----------|
| **0. പരിചയം** | വർക്‌ഷോപ്പ് അവലോകനം | പഠനലക്ഷ്യങ്ങൾ, മുൻപരിചയങ്ങൾ, വർക്‌ഷോപ്പ് ഘടന മനസിലാക്കുക | 15 മിനിറ്റ് |
| **1. തിരഞ്ഞെടുപ്പ്** | ടാമ്പ്ലേറ്റ് കണ്ടെത്തൽ | AZD ടാമ്പ്ലേറ്റുകൾ അന്വേഷിച്ച് നിങ്ങളുടെ പരിസ്ഥിതിക്ക് അനുയോജ്യമായ AI ടാമ്പ്ലേറ്റ് തിരഞ്ഞെടുക്കുക | 20 മിനിറ്റ് |
| **2. പരിശോധന** | വിന്യാസവും പരിശോദനയും | `azd up` ഉപയോഗിച്ച് ടാമ്പ്ലേറ്റ് വിന്യസിച്ച് ഇൻഫ്രാസ്ട്രക്ചർ പ്രവർത്തിക്കുന്നുണ്ടെന്ന് പരിശോധിക്കുക | 30 മിനിറ്റ് |
| **3. വിഘടനം** | ഘടന മനസിലാക്കൽ | GitHub Copilot ഉപയോഗിച്ച് ടാമ്പ്ലേറ്റ് ആർക്കിടെക്ചർ, Bicep ഫയലുകൾ, കോഡ് ഓർഗനൈസേഷൻ പരിശോധിക്കുക | 30 മിനിറ്റ് |
| **4. ക്രമീകരണം** | azure.yaml വിശദമായ പഠനം | `azure.yaml` ക്രമീകരണം, ലൈഫ്‌സൈക്കിൾ ഹുക്കുകളും പരിസ്ഥിതി വേരിയബിളുകളും ധാരാളം പഠിക്കുക | 30 മിനിറ്റ് |
| **5. വ്യക്തിഗതമാക്കൽ** | നിങ്ങളുടെ രീതിയിൽ മാറ്റം വരുത്തുക | AI സേർച്ച്, ട്രേസിംഗ്, മൂല്യനിർണ്ണയം സാധ്യമാക്കും, നിങ്ങളുടെ സാഹചര്യത്തിന് അനുയോജ്യമായി ക്രമീകരിക്കുക | 45 മിനിറ്റ് |
| **6. നീക്കം** | ശുചീകരണം | `azd down --purge` ഉപയോഗിച്ച് സൗകര്യപ്രദമായി വിഭവങ്ങൾ നീക്കംചെയ്യുക | 15 മിനിറ്റ് |
| **7. സംക്ഷേപം** | അടുത്ത പടികൾ | നേടിയ ശേഷികൾ, പ്രധാന ആശയങ്ങൾ അവലോകനം ചെയ്ത് പഠന യാത്ര തുടരുക | 15 മിനിറ്റ് |

**വർക്‌ഷോപ്പ് ഫെലോഹ്:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 വർക്‌ഷോപ്പ് ആരംഭിക്കൽ
```bash
# ഓപ്ഷൻ 1: GitHub Codespaces (ശിപാർശചെയ്തത്)
# റിപ്പോസിറ്ററിയിൽ "Code" → "Create codespace on main" ക്ലിക്കുചെയ്യുക

# ഓപ്ഷൻ 2: ലൊക്കൽ ഡെവലപ്പ്മെന്റ്
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# workshop/README.md ൽ സജ്ജീകരണ നിർദ്ദേശങ്ങൾ അനുസരിക്കുക
```

#### 🎯 വർക്‌ഷോപ്പ് പഠന ഫലം
വർക്‌ഷോപ്പ് പൂർത്തിയാക്കിയാൽ പങ്കെടുത്തവർ കഴിയും:
- **പ്രൊഡക്ഷൻ AI ആപ്ലിക്കേഷനുകൾ വിന്യമനം**: Microsoft Foundry സേവനങ്ങളോടെ AZD ഉപയോഗിക്കുക
- **മൾട്ടി-ഏജന്റ് ആർക്കിടെക്ചറുകൾ കൈകാര്യം ചെയ്യുക**: ഏകോപിത AI ഏജന്റ് പരിഹാരങ്ങൾ നടപ്പാക്കുക
- **സുരക്ഷാ മികച്ച രീതികൾ നടപ്പാക്കുക**: അംഗീകാരവും ആക്‌സസ് നിയന്ത്രണവും ക്രമീകരിക്കുക
- **സ്കെയിലിനായി ആപ്റ്റിമൈസ് ചെയ്യുക**: ചെലവുകുറഞ്ഞ, മികച്ച പ്രകടനമുള്ള വിന്യാസങ്ങൾ രൂപകൽപ്പന ചെയ്യുക
- **വിന്യാസ പ്രശ്‌നങ്ങൾ പരിഹരിക്കുക**: സാധാരണ പ്രശ്‌നങ്ങൾ സ്വതന്ത്രമായി പരിഹരിക്കുക

#### 📖 വർക്‌ഷോപ്പ് റിസോഴ്‌സസ്
- **🎥 ഇന്ററാക്ടീവ് ഗൈഡ്**: [Workshop Materials](workshop/README.md) - ബ്രൗസർ-അധിഷ്ഠിത പഠന പരിസ്ഥിതി
- **📋 മൊഡ്യൂളിന് പിന്തുടർന്നുള്ള നിർദ്ദേശങ്ങൾ**:
  - [0. പരിചയം](workshop/docs/instructions/0-Introduction.md) - വർക്‌ഷോപ്പ് അവലോകനം, ലക്ഷ്യങ്ങൾ
  - [1. തിരഞ്ഞെടുപ്പ്](workshop/docs/instructions/1-Select-AI-Template.md) - AI ടാമ്പ്ലേറ്റുകൾ കണ്ടെത്തുകയും തിരഞ്ഞെടുക്കുകയും ചെയ്യുക
  - [2. പരിശോധന](workshop/docs/instructions/2-Validate-AI-Template.md) - ടാമ്പ്ലേറ്റുകൾ വിന്യമനം ചെയ്‌തും പരിശോധനയും
  - [3. വിഘടനം](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - ടാമ്പ്ലേറ്റ് ആർക്കിടെക്ചർ അന്വേഷിക്കുക
  - [4. ക്രമീകരണം](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml നൈപുണ്യം നേടുക
  - [5. വ്യക്തിഗതമാക്കൽ](workshop/docs/instructions/5-Customize-AI-Template.md) - നിങ്ങളുടെ സാഹചര്യത്തിന് ക്രമീകരിക്കുക
  - [6. നീക്കം](workshop/docs/instructions/6-Teardown-Infrastructure.md) - വിഭവങ്ങൾ ശുചി ചെയ്‌യുക
  - [7. സംക്ഷേപം](workshop/docs/instructions/7-Wrap-up.md) - അവലോകനം, അടുത്ത ചുവട്
- **🛠️ AI വർക്‌ഷോപ്പ് ലാബ്**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-നിർമ്മിത അഭ്യാസങ്ങൾ
- **💡 ക്വിക്ക് സ്റ്റാർട്ട്**: [Workshop Setup Guide](workshop/README.md#quick-start) - പരിസ്ഥിതി ക്രമീകരണം

**പരിപാവനമായവർക്ക്**: കോർപ്പറേറ്റ് പരിശീലനം, സർവകലാശാലാ കോഴ്സുകൾ, സ്വയംഗതിയായ പഠനം, ഡെവലപ്പർ ബൂട്ട്‌കാമ്പുകൾ.

---

## 📖 വിശദമായ അവലോകനം: AZD ശേഷികൾ

അടിസ്ഥാനമറിഞ്ഞതിനു മുകളിൽ, AZD പ്രൊഡക്ഷൻ വിന്യാസങ്ങൾക്ക് ശക്തമായ സവിശേഷതകൾ നൽകുന്നു:

- **ടാമ്പ്ലേറ്റ് അടിസ്ഥാന വിന്യാസങ്ങൾ** - സാധാരണ ആപ് മാതൃകകൾക്കായി പൂർണ ടാമ്പ്ലേറ്റുകൾ ഉപയോഗിക്കുക
- **കോഡ് പോലെ ഇൻഫ്രാസ്ട്രക്ചർ** - Azure വിഭവങ്ങൾ Bicep അല്ലെങ്കിൽ Terraform ഉപയോഗിച്ച് നിയന്ത്രിക്കുക  
- **ഒന്നിച്ച് പ്രവർത്തിക്കുന്ന വേർക്ക്‌ഫ്ലോകൾ** - ആപ്ലിക്കേഷനുകൾ നിരവധി ഘട്ടങ്ങളിലൂടെ വ്യാപിപ്പിക്കുക, നിരീക്ഷിക്കുക
- **ഡെവലപ്പർ സൗഹൃദം** - ഡെവലപ്പർ ഫലപ്രാപ്തിക്കും അനുഭവത്തിനും അനുയോജ്യമായ രൂപകല്പന

### **AZD + Microsoft Foundry: AI വിന്യാസങ്ങൾക്കായി മികച്ചത്**

**എന്തിന് AZD AI പരിഹാരങ്ങൾക്ക്?** AZD AI ഡെവലപ്പർമാർ നേരിടുന്ന പ്രധാന വെല്ലുവിളികൾ പരിഹരിക്കുന്നു:

- **AI-സജ്ജമായ ടാമ്പ്ലേറ്റുകൾ** - Azure OpenAI, Cognitive Services, ML വർക്ക്‌ലോഡുകൾക്കായി മുൻകൂട്ടി ക്രമീകരിച്ച ടാമ്പ്ലേറ്റുകൾ
- **സുരക്ഷിത AI വിന്യാസങ്ങൾ** - AI സേവനങ്ങൾ, API കീകൾ, മോഡൽ എൻഡ്ബോയിന്റുകൾക്കുള്ള സുരക്ഷ മാതൃകകൾ  
- **പ്രൊഡക്ഷൻ AI മാതൃകകൾ** - സ്കെയിലുറപ്പുള്ള, ചെലവുകുറഞ്ഞ AI ആപ്പ് വിന്യാസങ്ങൾക്കുള്ള മികച്ച പ്രാക്ടിസുകൾ
- **അന്തിമ-സംവിധാനം AI വേർക്ക്‌ഫ്ലോകൾ** - മോഡൽ വികസനം മുതൽ പ്രൊഡക്ഷൻ വിന്യാസം വരെ ശരിയായ നിരീക്ഷണം ഉൾപ്പെടെ
- **ചെലവ് ആപ്റ്റിമൈസേഷൻ** - AI വർക്ക്‌ലോഡുകൾക്കായി ബുദ്ധിമുട്ടുള്ള വിഭവ വിതരണവും സ്കെയിലിംഗ് നയങ്ങളും
- **Microsoft Foundry ഇന്റഗ്രേഷൻ** - Microsoft Foundry മോഡൽ കാറ്റലോഗിനും എൻഡ്ബോയിന്റുകൾക്കും സ്മൂത്ത് കണക്ഷൻ

---

## 🎯 ടാമ്പ്ലേറ്റുകളും ഉദാഹരണ ലൈബ്രറിയും

### മുഖ്യമായത്: Microsoft Foundry ടാമ്പ്ലേറ്റുകൾ
**AI ആപ്ലിക്കേഷനുകൾ വിന്യമിക്കുന്നവർക്ക് ഇത് തുടക്കം!**

> **കുറിപ്പ്:** ഈ ടാമ്പ്ലേറ്റുകൾ വ്യത്യസ്ത AI മാതൃകകൾ കാണിക്കുന്നു. ചിലത് ബാഹ്യ Azure സ്യാമ്പിൾസ്, മറ്റു ഭാഗം പ്രാദേശിക നടപ്പാക്കലുകൾ.

| ടാമ്പ്ലേറ്റ് | അധ്യായം | ബുദ്ധിമുട്ട് | സേവനങ്ങൾ | തരം |
|------------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | ബാഹ്യ |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| ബാഹ്യ |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | ബാഹ്യ |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | ബാഹ്യ |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | ബാഹ്യ |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | ബാഹ്യ |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **പ്രാദേശിക** |

### മുഖ്യമായത്: സമ്പൂർണ പഠനതായി ഘടകങ്ങൾ
**പഠന അധ്യായങ്ങളോട് ചേർന്ന പ്രൊഡക്ഷൻ-സജ്ജ ആപ്പ് ടാമ്പ്ലേറ്റുകൾ**

| ടാമ്പ്ലേറ്റ് | പഠന അധ്യായം | ബുദ്ധിമുട്ട് | പ്രധാന പഠനം |
|------------|----------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | അടിസ്ഥാന AI വിന്യാസ മാതൃകകൾ |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Azure AI Search ഉപയോഗിച്ചുള്ള RAG നടപ്പാക്കൽ |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | ഡോക്യുമെന്റ് ഇന്റലിജൻസ് ഇന്ടഗ്രേഷൻ |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | ഏജന്റ് ഫ്രെയിംവർക്ക്, ഫംഗ്ഷൻ കോളിംഗ് |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | എന്റർപ്രൈസ് AI ഓർക്കസ്ട്രേഷൻ |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | കസ്റ്റമർ, ഇൻവെന്ററി ഏജന്റുകളോടുകൂടിയ മൾട്ടി-ഏജന്റ് ആർക്കിടെക്ചർ |

### ഉദാഹരണം തരം അടിസ്ഥാനമാക്കിയാണ് പഠനം

> **📌 പ്രാദേശിക vs ബാഹ്യ ഉദാഹരണങ്ങൾ:**  
> **പ്രാദേശിക ഉദാഹരണങ്ങൾ** (ഈ സംഭരണിയിൽ) = ഉടനെ ഉപയോഗിക്കാൻ റെഡി  
> **ബാഹ്യ ഉദാഹരണങ്ങൾ** (Azure സ്യാമ്പിൾസ്) = ലിങ്ക് ചെയ്ത റപ്പോസിറ്ററികളിൽ നിന്ന് ക്ലോൺ ചെയ്യുക

#### പ്രാദേശിക ഉദാഹരണങ്ങൾ (ഉടനെ ഉപയോഗിക്കാൻ)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - ARM ടാമ്പ്ലേറ്റുകളോടെയുള്ള സമ്പൂർണ പ്രൊഡക്ഷൻ-സജ്ജ നടപ്പാക്കൽ
  - മൾട്ടി-ഏജന്റ് ആർക്കിടെക്ചർ (കസ്റ്റമർ + ഇൻവെന്ററി ഏജന്റുകൾ)
  - സമഗ്രമായ നിരീക്ഷണവും മൂല്യനിർണ്ണയവും
  - ഒറ്റ ക്ലിക്കിൽ ARM ടാമ്പ്ലേറ്റ് ഉപയോഗിച്ചുള്ള വിന്യാസം

#### പ്രാദേശിക ഉദാഹരണങ്ങൾ - കണ്ടെയ്നർ ആപ്ലിക്കേഷനുകൾ (അധ്യായം 2-5)
**ഈ റപ്പോസിറ്ററിയിൽ സമഗ്രമായ കണ്ടെയ്നർ വിന്യാസ ഉദാഹരണങ്ങൾ:**
- [**കണ്ടെയ്നർ ആപ്പ് ഉദാഹരണങ്ങൾ**](examples/container-app/README.md) - കണ്ടെയ്നറൈസ്ഡ് വിന്യാസങ്ങൾക്ക് പൂർണ ഗൈഡ്
  - [സിമ്പിൾ Flask API](../../examples/container-app/simple-flask-api) - സ്കെയിൽ-ടു-സീറോ അടിസ്ഥാന REST API
  - [മൈക്രോസർവീസസ് ആർക്കിടെക്ചർ](../../examples/container-app/microservices) - പ്രൊഡക്ഷനിൽ റെഡി മൾട്ടി-സർവീസ് വിന്യാസം
  - ക്വിക്ക് സ്റ്റാർട്ട്, പ്രൊഡക്ഷൻ, അഡ്വാൻസ്ഡ് വിന്യാസ മാതൃകകൾ
  - നിരീക്ഷണം, സുരക്ഷ, ചെലവ് ആപ്റ്റിമൈസേഷൻ മാർഗനിർദ്ദേശങ്ങൾ

#### ബാഹ്യ ഉദാഹരണങ്ങൾ - ലളിത ആപ്ലിക്കേഷനുകൾ (അധ്യായം 1-2)
**ആരംഭിക്കാൻ ഈ Azure സ്യാമ്പിൾസ് റപ്പോസിറ്ററികൾ ക്ലോൺ ചെയ്യുക:**
- [സിമ്പിൾ വെബ് ആപ്പ് - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - അടിസ്ഥാന വിന്യാസ മാതൃകകൾ
- [സ്റ്റാറ്റിക്കു് വെബ്സൈറ്റ് - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - സ്റ്റാറ്റിക്കുള്ള ഉള്ളടക്കം വിന്യാസം
- [കണ്ടെയ്നർ ആപ്പ് - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API വിന്യാസം

#### ബാഹ്യ ഉദാഹരണങ്ങൾ - ഡാറ്റാബേസ് ഇന്റഗ്രേഷൻ (അധ്യായം 3-4)  
- [ഡാറ്റാബേസ് ആപ്പ് - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - ഡാറ്റാബേസ് കണക്ടിവിറ്റി മാതൃകകൾ
- [ഫംഗ്ഷൻസ് + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - സെർവർലെസ്സ് ഡാറ്റ വേർക്ക്‌ഫ്ലോ

#### ബാഹ്യ ഉദാഹരണങ്ങൾ - പ്രോഗ്രസീവ് മാതൃകകൾ (അധ്യായം 4-8)
- [ജാവ മൈക്രോസർവീസസ്](https://github.com/Azure-Samples/java-microservices-aca-lab) - മൾട്ടി-സർവീസ് ആർക്കിടെക്ചറുകൾ
- [കണ്ടെയ്നർ ആപ്ലിക്കേഷനുകളുടെ ജോബ്സ്](https://github.com/Azure-Samples/container-apps-jobs) - ബാക്ക്ഗ്രൗണ്ട് പ്രോസസ്സിംഗ്  
- [എന്റർപ്രൈസ് ML പൈപ്പ്‌ലൈൻ](https://github.com/Azure-Samples/mlops-v2) - പ്രൊഡക്ഷൻ-സജ്ജ ML മാതൃകകൾ

### ബാഹ്യ ടാമ്പ്ലേറ്റ് ശേഖരങ്ങൾ
- [**അധികാരিক AZD ടാമ്പ്ലേറ്റ് ഗ്യാലറി**](https://azure.github.io/awesome-azd/) - ഔദ്യോഗികവും സമൂഹ ടാമ്പ്ലേറ്റുകളും ഉൾക്കുന്ന ശേഖരം
- [**Azure Developer CLI ടാമ്പ്ലേറ്റുകൾ**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn ടാമ്പ്ലേറ്റ് ഡോക്യുമെന്റേഷൻ
- [**Examples Directory**](examples/README.md) - വിശദമായ വിശദീകരണങ്ങളോടുള്ള പ്രാദേശിക പഠന ഉദാഹരണങ്ങൾ

---

## 📚 പഠനസാധനങ്ങളും റഫറൻസുകളും

### ദ്രുത റഫറൻസുകൾ
- [**കമാൻഡ് ചീറ്റ്ഷീറ്റ്**](resources/cheat-sheet.md) - അധ്യായം അനുസരിച്ച് ക്രമീകരിച്ച നിർണായക azd കമാൻഡുകൾ
- [**ഗ്ലോസറി**](resources/glossary.md) - Azure, azd പദവിന്യാസങ്ങൾ  
- [**അറിഞ്ഞിരിക്കേണ്ട ചോദ്യങ്ങൾ**](resources/faq.md) - പഠന അധ്യായം അനുസരിച്ചുള്ള പൊതുചോദ്യങ്ങൾ
- [**അധ്യയന ഗൈഡ്**](resources/study-guide.md) - സമഗ്രമായ പ്രായോഗിക അഭ്യാസങ്ങൾ

### പ്രായോഗിക വർക്‌ഷോപ്പുകൾ
- [**AI വർക്‌ഷോപ്പ് ലാബ്**](docs/chapter-02-ai-development/ai-workshop-lab.md) - നിങ്ങളുടെ AI പരിഹാരങ്ങൾ AZD-വിന്യസിപ്പിക്കാൻ (2-3 മണിക്കൂർ)
- [**ഇന്ററാക്ടീവ് വർക്‌ഷോപ്പ്**](workshop/README.md) - 8-മൊഡ്യൂളുള്ള മാർഗനിർദ്ദേശ അഭ്യാസങ്ങൾ MkDocs, GitHub Codespaces ഉപയോഗിച്ച്
  - പിന്തുടരുന്നു: പരിചയം → തിരഞ്ഞെടുപ്പ് → പരിശോധന → വിഘടനം → ക്രമീകരണം → വ്യക്തിഗതമാക്കൽ → നീക്കം → സംക്ഷേപം

### ബാഹ്യ പഠന რესോഴ്‌സുകൾ
- [Azure Developer CLI ഡോക്യുമെന്റേഷൻ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure ആർക്കിടെക്ചർ സെന്റർ](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure വില കാൽക്കുലേറ്റർ](https://azure.microsoft.com/pricing/calculator/)
- [Azure സ്റ്റാറ്റസ്](https://status.azure.com/)

---

## 🔧 ദ്രുത പ്രശ്‌നപരിഹാര ഗൈഡ്

**ആദ്യപടികളിലെ സാധാരണ പ്രശ്‌നങ്ങളും വേഗത്തിലുള്ള പരിഹാരങ്ങളും:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# ആദ്യം AZD ഇൻസ്റ്റാൾ ചെയ്യുക
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# ഇൻസ്റ്റാളേഷൻ സ്ഥിരീകരിക്കുക
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# ലഭ്യമായ സബ്സ്ക്രിപ്ഷനുകൾ പട്ടികപ്പെടുത്തുക
az account list --output table

# ഡിഫാൾട്ട് സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
az account set --subscription "<subscription-id-or-name>"

# AZD പരിതസ്ഥിതിക്ക് സജ്ജമാക്കുക
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# സ്ഥിരീകരിക്കുക
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" അല്ലെങ്കിൽ "കോട്ട തികയാത്തത്"</strong></summary>

```bash
# വ്യത്യസ്തമായ Azure മേഖല ശ്രമിക്കുക
azd env set AZURE_LOCATION "westus2"
azd up

# അല്ലെങ്കിൽ വികസനത്തിൽ ചെറിയ SKUs ഉപയോഗിക്കുക
# infra/main.parameters.json തിരുത്തുക:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ഇടക്കിടെ വീഴ്ച വരുന്നത്</strong></summary>

```bash
# ഓപ്ഷൻ 1: തുടച്ചുതുറന്ന് വീണ്ടും ശ്രമിക്കുക
azd down --force --purge
azd up

# ഓപ്ഷൻ 2: അടിസ്ഥാന സൗകര്യം മാത്രം പരിഹരിക്കുക
azd provision

# ഓപ്ഷൻ 3: വിശദമായ നില പരിശോധന ചെയ്യുക
azd show

# ഓപ്ഷൻ 4: ആസ്യൂർ മോനിറ്ററിൽ ലോഗുകൾ പരിശോധിക്കുക
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" അല്ലെങ്കിൽ "ടോക്കൺ കാലഹരിയായിരിക്കുന്നു"</strong></summary>

```bash
# മടങ്ങി പ്രാമാണീകരിക്കുക
az logout
az login

azd auth logout
azd auth login

# പ്രാമാണീകരണം സ്ഥിരീകരിക്കുക
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" അല്ലെങ്കിൽ നാമകരണ സംഘർഷങ്ങൾ</strong></summary>

```bash
# AZD പ്രത്യേകമായ പേരുകൾ സൃഷ്ടിക്കുന്നു, പക്ഷേ പ്രശ്നം ഉണ്ടെങ്കിൽ:
azd down --force --purge

# പിന്നീട് പുതിയ പരിസ്ഥിതിയോടൊപ്പം വീണ്ടും ശ്രമിക്കുക
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ ടെംപ്ലേറ്റ് ഡിപ്പ്ലോയ്മെന്റ് വളരെ സമയമെടുക്കുന്നു</strong></summary>

**സാധാരണ കാത്തിരിപ്പ് സമയം:**
- ലളിതമായ വെബ് ആപ്പ്: 5-10 മിനിറ്റ്
- ഡാറ്റാബേസോടെ ഉള്ള ആപ്പ്: 10-15 മിനിറ്റ്
- എഐ അപ്ലിക്കേഷനുകൾ: 15-25 മിനിറ്റ് (OpenAI വാഗ്ദാനം മന്ദഗതിയുള്ളത്)

```bash
# പുരോഗതി പരിശോധിക്കുക
azd show

# 30 മിനിറ്റിൽ കൂടുതൽ കുടുങ്ങിയെങ്കിൽ, ആസ്യൂർ പോർട്ടൽ പരിശോധിക്കുക:
azd monitor
# പരാജയപ്പെട്ട ഡിപ്പ്ലോയ്മെന്റുകൾ നോക്കുക
```
</details>

<details>
<summary><strong>❌ "Permission denied" അല്ലെങ്കിൽ "Forbidden"</strong></summary>

```bash
# നിങ്ങളുടെ അസ്യൂർ റോളു പരിശോധിക്കുക
az role assignment list --assignee $(az account show --query user.name -o tsv)

# നിങ്ങൾക്ക് കുറഞ്ഞത് "കോൺട്രിബ്യൂട്ടർ" റോളുണ്ടാകണം
# നിങ്ങളുടെ അസ്യൂർ അഡ്മിനിന് അപേക്ഷിക്കുക അനുവദിക്കാൻ:
# - കോൺട്രിബ്യൂട്ടർ (സ്രോതസുകളുടെ വേണ്ടി)
# - യൂസർ ആക്‌സസ് അഡ്മിനിസ്ട്രേറ്റർ (റോൾ നിയോഗങ്ങൾക്ക്)
```
</details>

<details>
<summary><strong>❌ ഡിപ്പ്ലോയ്മെന്റ് ചെയ്ത ആപ്ലിക്കേഷൻ URL കണ്ടെത്താൻ കഴിയുന്നില്ല</strong></summary>

```bash
# എല്ലാ സർവീസ് എൻഡ്‌പോയിന്റുകളും കാണിക്കുക
azd show

# അല്ലെങ്കിൽ ആസ്യൂർ പോർട്ടൽ തുറക്കുക
azd monitor

# പ്രത്യേക സർവീസ് പരിശോധിക്കുക
azd env get-values
# *_URL വ്യത്യാസികൾ അന്വേഷിക്കുക
```
</details>

### 📚 സമ്പൂർണ തകരാറടയ്ക്കൽ വിഭവങ്ങൾ

- **സ്വന്തമായ പ്രശ്നങ്ങൾ ഗൈഡ്:** [വിശദമായ പരിഹാരങ്ങൾ](docs/chapter-07-troubleshooting/common-issues.md)
- **എ.ഐ.-സ്വഭാവമുള്ള പ്രശ്നങ്ങൾ:** [എ.ഐ. തകരാറടയ്ക്കൽ](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **ഡീബഗ്ഗിംഗ് ഗൈഡ്:** [പടിപടി ഡീബഗ്ഗിംഗ്](docs/chapter-07-troubleshooting/debugging.md)
- **സഹായം നേടുക:** [Azure ഡിസ്‌കോർഡ്](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 കോഴ്സ് പൂർത്തീകരണവും സർട്ടിഫിക്കേഷനും

### പുരോഗതി ട്രാക്കിംഗ്
ഓരോ അധ്യായവും വഴി നിങ്ങളുടെ പഠന പുരോഗതി ട്രാക്കുചെയ്യൂ:

- [ ] **അധ്യായം 1**: അടിസ്ഥാനവും ഖേദസൂത്രവുമുള്ള തുടക്കം ✅
- [ ] **അധ്യായം 2**: എ.ഐ.-പ്രഥമ ഡെവലപ്പ്മെന്റ് ✅  
- [ ] **അധ്യായം 3**: കോൺഫിഗറേഷൻ & ഓത്തന്റിക്കേഷൻ ✅
- [ ] **അധ്യായം 4**: ഇൻഫ്രാസ്റ്റ്രക്ചർ എസ്എസ് കോഡും ഡിപ്പ്ലോയ്മെന്റും ✅
- [ ] **അധ്യായം 5**: മൾട്ടി-ഏജന്റ് എ.ഐ. പരിഹാരങ്ങൾ ✅
- [ ] **അധ്യായം 6**: പ്രീ-ഡിപ്പ്ലോയ്മെന്റ് വാലിഡേഷൻ & പ്ലാനിംഗ് ✅
- [ ] **അധ്യായം 7**: തകരാറടയ്ക്കൽ & ഡീബഗ്ഗിംഗ് ✅
- [ ] **അധ്യായം 8**: പ്രൊഡക്ഷൻ & എന്റർപ്രൈസ് പാറ്റേണുകൾ ✅

### പഠന പരിശോധന
ഓരോ അധ്യായവും പൂർത്തിയാക്കിയ ശേഷം, നിങ്ങളുടെ അറിവ് പരിശോധിക്കൂ:
1. **പ്രായോഗിക അഭ്യാസം**: അധ്യായത്തിലെ ഹാൻഡ്‌സോൺ ഡിപ്പ്ലോയ്മെന്റ് പൂർത്തിയാക്കുക
2. **ജ്ഞാന പരിശോധന**: നിങ്ങളുടെ അധ്യായത്തിന്റെ FAQ വിഭാഗം പരിശോധിക്കുക
3. **സമൂഹ ചർച്ച**: Azure ഡിസ്‌കോർഡിൽ നിങ്ങളുടെ അനുഭവം പങ്കുവെക്കുക
4. **അടുത്ത അധ്യായം**: അടുത്ത കഠിനതാപര്യന്തത്തിലേക്ക് നീങ്ങുക

### കോഴ്സ് പൂർത്തീകരണ లാഭങ്ങൾ
എല്ലാ അധ്യായങ്ങളും പൂർത്തിയാക്കിയാൽ നിങ്ങൾക്ക്:
- **പ്രൊഡക്ഷൻ അനുഭവം**: യാഥാർത്ഥ്യ എ.ഐ. ആപ്ലിക്കേഷനുകൾ Azure-ലേക്ക് ഡിപ്പ്ലോയ്മെന്റ് ചെയ്തിട്ടുണ്ട്
- **പ്രൊഫഷണൽ കഴിവുകൾ**: എന്റർപ്രൈസ്-സജ്ജമായ ഡിപ്പ്ലോയ്മെന്റ് കഴിവുകൾ  
- **സമൂഹ അംഗീകാരം**: Azure ഡെവലപ്പർ സമൂഹത്തിലെ സജീവ അംഗം
- **കാനിയാക രംഗം**: ആവശ്യമായ AZD-അയും എ.ഐ ഡിപ്പ്ലോയ്മെന്റ് വിദഗ്ദ്ധതയും

---

## 🤝 സമൂഹവും പിന്തുണയും

### സഹായവും പിന്തുണയും നേടുക
- **സാങ്കേതിക പ്രശ്നങ്ങൾ**: [ബഗുകളും ഫീച്ചറുകളും റിപ്പോർട്ട് ചെയ്യുക](https://github.com/microsoft/azd-for-beginners/issues)
- **പഠന ചോദ്യങ്ങൾ**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) & [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **എ.ഐ.-സംബന്ധിയായ സഹായം**: [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) യിൽ ചേരുക
- **പ്രമാണങ്ങൾ**: [അധികൃത Azure Developer CLI പ്രമാണങ്ങൾ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Microsoft Foundry Discord-നിൽ നിന്നുള്ള സമൂഹ കാഴ്ചപ്പാടുകൾ

**ശേഷമുള്ള ജനപ്രിയ പോൾ ഫലങ്ങൾ #Azure ചാനലിൽ:**
- **45%** ഡെവലപ്പർമാർ എ.എസ്ഡി AI പ്രവർത്തനങ്ങൾക്ക് ഉപയോഗിക്കാനാണ് ആഗ്രഹിക്കുന്നത്
- **പ്രധാനം സവിശേഷ چലെഞ്ചുകൾ**: ബഹുനിർവഹണ ഡിപ്പ്ലോയ്മെന്റ്, ക്രെഡൻഷ്യൽ മാനേജ്‌മെന്റ്, പ്രൊഡക്ഷൻ റെഡിനസ്  
- **ഏറ്റവും ആവശ്യപ്പെട്ടിരിക്കുന്നത്**: എ.ഐ.-വിശിഷ്ട ടെംപ്ലേറ്റുകൾ, തകരാറടയ്ക്കൽ മാർഗ്ഗനിർദ്ദേശങ്ങൾ, മികച്ച പ്രവർത്തന രീതി

**ഞങ്ങളുടെ സമൂഹത്തിൽ ചേരൂ:**
- നിങ്ങളുടെ AZD + AI അനുഭവങ്ങൾ പങ്കുവെച്ച് സഹായം നേടൂ
- എ.ഐ. ടെംപ്ലേറ്റുകളുടെ പ്രാഥമിക അവലോകനങ്ങൾ പ്രാപിക്കുക
- എ.ഐ ഡിപ്പ്ലോയ്മെന്റിലെ മികച്ച പ്രവർത്തനരീതികൾക്ക് സംഭാവന നൽകൂ
- ഭാവിയിൽ AI + AZD ഫീച്ചർ വികസനത്തിൽ സാന്നിധ്യം ഉണ്ടാക്കൂ

### കോഴ്സിലേക്ക് സംഭാവന നൽകൽ
നിങ്ങളുടെ സംഭാവനകൾ സ്വാഗതം! വിശദീകരണങ്ങൾക്കായി ഞങ്ങളുടെ [Contributing Guide](CONTRIBUTING.md) വായിക്കൂ:
- **ഉള്ളടക്കം മെച്ചപ്പെടുത്തലുകൾ**: നിലവിലുള്ള അധ്യായങ്ങളും ഉദാഹരണങ്ങളും മെച്ചപ്പെടുത്തുക
- **പുതിയ ഉദാഹരണങ്ങൾ**: യഥാർത്ഥ ലോക സാഹചര്യങ്ങളും ടെംപ്ലേറ്റുകളും ചേർക്കുക  
- **ഭാഷയിലേക്കു വിവർത്തനം**: ബഹുഭാഷ സഹായം നിലനിര്‍ത്താന്‍ സഹായിക്കുക
- **ബഗ് റിപ്പോർട്ടുകൾ**: കൃത്യതയും വ്യക്തതയും മെച്ചപ്പെടുത്തുക
- **സമൂഹ മാനദണ്ഡങ്ങൾ**: നമ്മുടെ പൊതുസമൂഹ മാനദണ്ഡങ്ങൾ പാലിക്കുക

---

## 📄 കോഴ്സ് വിവരങ്ങൾ

### ലൈസൻസ്
ഈ പ്രോജക്റ്റ് MIT ലൈസൻസിനാണ് കീഴിലായുള്ളത് - വിശദീകരണങ്ങൾക്ക് [LICENSE](../../LICENSE) ഫയൽ കാണുക.

### ബന്ധപ്പെട്ട Microsoft പഠന വിഭവങ്ങൾ

ഇതുമായി ബന്ധപ്പെട്ട മറ്റ് സമഗ്ര പഠന കോഴ്സുകൾ ഞങ്ങളുടെ ടീമിന് ഉണ്ട്:

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
 
### കോർ പഠനം
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### കോപൈലറ്റ് സീരീസ്
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ കോഴ്സ് നാവിഗേഷൻ

**🚀 പഠനം ആരംഭിക്കാൻ തയ്യാറാണോ?**

**ആരുന്നവർക്കു**: [അധ്യായം 1: അടിസ്ഥാനവും വേഗതയുള്ള ആരംഭവും](../..)  
**എ.ഐ. ഡെവലപ്പർമാർക്കു**: [അധ്യായം 2: എ.ഐ.-ഫസ്റ്റ് ഡെവലപ്മെന്റ്](../..)  
**അനുഭവസമ്പന്നരായ ഡെവലപ്പർമാർക്കു**: [അധ്യായം 3: കോൺഫിഗറേഷൻ & ഓഥന്റിക്കേഷൻ](../..) തുടങ്ങി

**അടുത്ത ഘട്ടം**: [അധ്യായം 1 ആരംഭിക്കുക - AZD അടിസ്ഥാനങ്ങൾ](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:  
ഈ പ്രമാണം AI വിവർത്തനസേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവർത്തനം ചെയ്തതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്ക് ശ്രമിക്കുന്നുവെങ്കിലും, സ്വയമാറ്റ വിവർത്തനങ്ങളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാവുന്നതാണ്. മുള്‍ഭാഷയിലുള്ള പ്രമാണം ഔദ്യോഗിക ഉറവിടമായി കണക്കാക്കണം. നിർണായകമായ വിവരങ്ങൾക്ക് പ്രൊഫഷണൽ മാനവ വിവർത്തനം നിർദേശിക്കുന്നു. ഈ വിവർത്തനം ഉപയോഗിച്ചതിൽ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്ററിയാക്കലുകൾക്കോ തെറ്റിദ്ധാരണകൾക്കോ ഞങ്ങൾ ഉത്തരവാദിത്വം വഹിക്കുന്നത് ഇല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->