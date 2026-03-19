# AZD pro začátečníky: Strukturovaná vzdělávací cesta

![AZD-pro-začátečníky](../../translated_images/cs/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledující](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Hvězdy GitHubu](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatické překlady (vždy aktuální)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](./README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferujete klonování lokálně?**
>
> Tento repozitář obsahuje přes 50 překladů jazyků, což výrazně zvětšuje velikost ke stažení. Pokud chcete klonovat bez překladů, použijte sparse checkout:
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
> Toto vám poskytne vše, co potřebujete ke splnění kurzu s mnohem rychlejším stažením.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co je dnes nového v azd

Azure Developer CLI se rozrostl za hranice tradičních webových aplikací a API. Dnes je azd jedním nástrojem pro nasazení jakékoli aplikace do Azure — včetně aplikací poháněných AI a inteligentních agentů.

Co to pro vás znamená:

- **AI agenti jsou nyní plnohodnotné zátěže v azd.** Můžete inicializovat, nasazovat a spravovat projekty AI agentů pomocí stejného workflow `azd init` → `azd up`, které už znáte.
- **Integrace s Microsoft Foundry** přináší nasazení modelů, hostování agentů a konfiguraci AI služeb přímo do ekosystému azd šablon.
- **Základní workflow se nezměnilo.** Ať už nasazujete todo aplikaci, mikroservisu nebo multi-agentní AI řešení, příkazy jsou stejné.

Pokud jste azd už používali, podpora AI je přirozeným rozšířením — není to samostatný nástroj nebo pokročilá větev. Pokud začínáte od začátku, naučíte se jediný workflow, který funguje pro všechno.

---

## 🚀 Co je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je pro vývojáře přívětivý nástroj příkazového řádku, který usnadňuje nasazení aplikací do Azure. Místo ručního vytváření a propojování desítek Azure zdrojů můžete nasadit celé aplikace jediným příkazem.

### Kouzlo `azd up`

```bash
# Tento jediný příkaz udělá vše:
# ✅ Vytvoří všechny zdroje Azure
# ✅ Nastaví síť a zabezpečení
# ✅ Sestaví váš aplikační kód
# ✅ Nasadí do Azure
# ✅ Poskytne vám funkční URL adresu
azd up
```

**To je vše!** Žádné klikání v Azure Portal, žádné složité ARM šablony k učení nejdříve, žádná manuální konfigurace — jen fungující aplikace v Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Jaký je rozdíl?

To je nejčastější otázka, kterou začátečníci kladou. Tady je jednoduchá odpověď:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Spravovat jednotlivé Azure zdroje | Nasazovat kompletní aplikace |
| **Mindset** | Zaměřeno na infrastrukturu | Zaměřeno na aplikace |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Musíte znát Azure služby | Stačí znát svou aplikaci |
| **Best For** | DevOps, infrastruktura | Vývojáři, prototypování |

### Jednoduchá analogie

- **Azure CLI** je jako mít všechny nástroje na stavbu domu — kladiva, pily, hřebíky. Můžete postavit cokoliv, ale musíte znát stavebnictví.
- **Azure Developer CLI** je jako najmout stavaře — popíšete, co chcete, a on se postará o výstavbu.

### Kdy který použít

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Fungují společně!

AZD používá Azure CLI pod pokličkou. Můžete používat oba:
```bash
# Nasazení vaší aplikace pomocí AZD
azd up

# Poté doladění specifických zdrojů pomocí Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najděte šablony v Awesome AZD

Nezačínejte od nuly! **Awesome AZD** je komunitní sbírka šablon připravených k nasazení:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Prohlédněte si 200+ šablon s nasazením jedním kliknutím |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Přispějte vlastní šablonou komunitě |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Označte hvězdou a prozkoumejte zdrojový kód |

### Oblíbené AI šablony z Awesome AZD

```bash
# RAG chat s modely Microsoft Foundry + AI vyhledávání
azd init --template azure-search-openai-demo

# Rychlá AI chatovací aplikace
azd init --template openai-chat-app-quickstart

# AI agenti s agenty Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začínáme ve 3 krocích

### Krok 1: Nainstalujte AZD (2 minuty)

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

### Krok 2: Přihlášení do Azure

```bash
azd auth login
```

### Krok 3: Nasazení vaší první aplikace

```bash
# Inicializovat z šablony
azd init --template todo-nodejs-mongo

# Nasadit do Azure (vytvoří vše!)
azd up
```

**🎉 To je vše!** Vaše aplikace je nyní nasazená v Azure.

### Úklid (nezapomeňte!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak používat tento kurz

Tento kurz je navržen pro **postupné učení** - začněte tam, kde se cítíte pohodlně, a postupujte dál:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Know Azure, new to AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Want to deploy AI apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Want hands-on practice** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Need production patterns** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Rychlé nastavení

1. **Vytvořte fork tohoto repozitáře**: [![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získejte pomoc**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Preferujete klonování lokálně?**
>
> Tento repozitář obsahuje přes 50 překladů jazyků, což výrazně zvětšuje velikost ke stažení. Pokud chcete klonovat bez překladů, použijte sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Toto vám poskytne vše, co potřebujete ke splnění kurzu s mnohem rychlejším stažením.


## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní zaměření na nasazení AI aplikací s integrací Microsoft Foundry.**

### Proč je tento kurz zásadní pro moderní vývojáře

Na základě poznatků z komunity Microsoft Foundry Discord, **45 % vývojářů chce používat AZD pro AI zátěže**, ale naráží na potíže s:
- Složitými více-službovými AI architekturami
- Produčními postupy pro nasazení AI  
- Integrací a konfigurací Azure AI služeb
- Optimalizací nákladů pro AI zátěže
- Odstraňováním problémů specifických pro nasazení AI

### Cíle učení

Dokončením tohoto strukturovaného kurzu budete:
- **Ovládat základy AZD**: Klíčové koncepty, instalace a konfigurace
- **Nasazovat AI aplikace**: Používat AZD s Microsoft Foundry službami
- **Zavést infrastrukturu jako kód**: Spravovat Azure zdroje pomocí Bicep šablon
- **Řešit nasazení**: Odstraňovat běžné problémy a ladit chyby
- **Optimalizovat pro produkci**: Bezpečnost, škálování, monitoring a řízení nákladů
- **Vytvářet multi-agentní řešení**: Nasazovat složité AI architektury

## 🗺️ Mapa kurzu: Rychlá navigace podle kapitol

Každá kapitola má vlastní README s cíli učení, rychlými starty a cvičeními:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Začínáme | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalace](docs/chapter-01-foundation/installation.md) &#124; [První projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap. 2: Vývoj AI](docs/chapter-02-ai-development/README.md)** | Aplikace orientované na AI | [Integrace Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasazení modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hod | ⭐⭐ |
| **[Kap. 3: Konfigurace](docs/chapter-03-configuration/README.md)** | Autentizace & Zabezpečení | [Konfigurace](docs/chapter-03-configuration/configuration.md) &#124; [Autentizace & Zabezpečení](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap. 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & Nasazení | [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hod | ⭐⭐⭐ |
| **[Kap. 5: Multi-agent](docs/chapter-05-multi-agent/README.md)** | Řešení AI agentů | [Scénář maloobchodu](examples/retail-scenario.md) &#124; [Koordinační vzory](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[Kap. 6: Před nasazením](docs/chapter-06-pre-deployment/README.md)** | Plánování & Validace | [Kontroly před nasazením](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hod | ⭐⭐ |
| **[Kap. 7: Řešení problémů](docs/chapter-07-troubleshooting/README.md)** | Ladění & Oprava | [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladění](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hod | ⭐⭐ |
| **[Kap. 8: Produkce](docs/chapter-08-production/README.md)** | Podnikové vzory | [Postupy pro produkci](docs/chapter-08-production/production-ai-practices.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktická laboratoř | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výběr](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validace](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstrukce](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontáž infrastruktury](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Závěr](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hod | ⭐⭐ |

**Celková délka kurzu:** ~10-14 hodin | **Postup dovedností:** Začátečník → Připravený na produkci

---

## 📚 Výukové kapitoly

*Vyberte si učební cestu podle úrovně zkušeností a cílů*

### 🚀 Kapitola 1: Základy & Rychlý start
**Předpoklady**: Předplatné Azure, základní znalost příkazového řádku  
**Doba trvání**: 30-45 minut  
**Složitost**: ⭐

#### Co se naučíte
- Porozumění základům Azure Developer CLI
- Instalace AZD na vaší platformě
- Vaše první úspěšné nasazení

#### Studijní zdroje
- **🎯 Začněte zde**: [Co je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorie**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Hlavní koncepty a terminologie
- **⚙️ Nastavení**: [Instalace a nastavení](docs/chapter-01-foundation/installation.md) - Platformně specifické návody
- **🛠️ Prakticky**: [Váš první projekt](docs/chapter-01-foundation/first-project.md) - Krok za krokem
- **📋 Rychlá reference**: [Přehled příkazů](resources/cheat-sheet.md)

#### Praktická cvičení
```bash
# Rychlá kontrola instalace
azd version

# Nasaďte svou první aplikaci
azd init --template todo-nodejs-mongo
azd up
```

**💡 Výsledek kapitoly**: Úspěšně nasadit jednoduchou webovou aplikaci do Azure pomocí AZD

**✅ Ověření úspěchu:**
```bash
# Po dokončení kapitoly 1 byste měli být schopni:
azd version              # Zobrazuje nainstalovanou verzi
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasazuje do Azure
azd show                # Zobrazuje URL spuštěné aplikace
# Aplikace se otevře v prohlížeči a funguje
azd down --force --purge  # Odstraňuje prostředky
```

**📊 Časová náročnost:** 30-45 minut  
**📈 Úroveň dovedností po:** Dokáže nezávisle nasadit základní aplikace
**📈 Úroveň dovedností po:** Dokáže nezávisle nasadit základní aplikace

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (Doporučeno pro AI vývojáře)
**Předpoklady**: Kapitola 1 dokončena  
**Doba trvání**: 1-2 hod  
**Složitost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazování aplikací s AI funkcemi
- Porozumění konfiguracím AI služeb

#### Studijní zdroje
- **🎯 Začněte zde**: [Integrace Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenti**: [Průvodce AI agenty](docs/chapter-02-ai-development/agents.md) - Nasazení inteligentních agentů pomocí AZD
- **📖 Vzory**: [Nasazení AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasazení a správa AI modelů
- **🛠️ Workshop**: [Laboratoř AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Připravte své AI řešení pro AZD
- **🎥 Interaktivní průvodce**: [Materiály workshopu](workshop/README.md) - Učení v prohlížeči s MkDocs * DevContainer prostředím
- **📋 Šablony**: [Šablony Microsoft Foundry](#zdroje-workshopu)
- **📝 Příklady**: [Příklady nasazení AZD](examples/README.md)

#### Praktická cvičení
```bash
# Nasaďte svou první AI aplikaci
azd init --template azure-search-openai-demo
azd up

# Vyzkoušejte další AI šablony
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledek kapitoly**: Nasadit a nakonfigurovat chatovací aplikaci poháněnou AI s funkcemi RAG

**✅ Ověření úspěchu:**
```bash
# Po kapitole 2 byste měli být schopni:
azd init --template azure-search-openai-demo
azd up
# Otestovat rozhraní chatu s AI
# Pokládat otázky a získávat odpovědi generované AI se zdroji
# Ověřit, že integrace vyhledávání funguje
azd monitor  # Zkontrolovat, že Application Insights zobrazuje telemetrii
azd down --force --purge
```

**📊 Časová náročnost:** 1-2 hod  
**📈 Úroveň dovedností po:** Dokáže nasadit a nakonfigurovat produkčně připravené AI aplikace  
**💰 Povědomí o nákladech:** Uvědomte si náklady $80-150/měsíc (vývoj), $300-3500/měsíc (produkce)

#### 💰 Úvahy o nákladech pro AI nasazení

**Vývojové prostředí (odhad $80-150/měsíc):**
- Modely Microsoft Foundry (Pay-as-you-go): $0-50/měsíc (na základě využití tokenů)
- AI Search (základní úroveň): $75/měsíc
- Container Apps (spotřeba): $0-20/měsíc
- Úložiště (Standard): $1-5/měsíc

**Produkční prostředí (odhad $300-3,500+/měsíc):**
- Modely Microsoft Foundry (PTU pro konzistentní výkon): $3,000+/měsíc NEBO Pay-as-you-go při vysokém objemu
- AI Search (standardní úroveň): $250/měsíc
- Container Apps (dedikované): $50-100/měsíc
- Application Insights: $5-50/měsíc
- Úložiště (Premium): $10-50/měsíc

**💡 Tipy pro optimalizaci nákladů:**
- Používejte **bezplatnou vrstvu** Microsoft Foundry Models pro učení (Azure OpenAI 50 000 tokenů/měsíc zahrnuto)
- Spusťte `azd down` pro uvolnění zdrojů, když aktivně nevyvíjíte
- Začněte s fakturací podle spotřeby, PTU povýšte pouze pro produkci
- Použijte `azd provision --preview` pro odhad nákladů před nasazením
- Povolte automatické škálování: plaťte pouze za skutečné využití

**Sledování nákladů:**
```bash
# Zkontrolujte odhadované měsíční náklady
azd provision --preview

# Sledujte skutečné náklady v portálu Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurace & Autentizace
**Předpoklady**: Kapitola 1 dokončena  
**Doba trvání**: 45-60 minut  
**Složitost**: ⭐⭐

#### Co se naučíte
- Konfiguraci a správu prostředí
- Nejlepší postupy pro autentizaci a zabezpečení
- Pojmenování zdrojů a organizaci

#### Studijní zdroje
- **📖 Konfigurace**: [Průvodce konfigurací](docs/chapter-03-configuration/configuration.md) - Nastavení prostředí
- **🔐 Zabezpečení**: [Vzorové postupy autentizace a spravovaná identita](docs/chapter-03-configuration/authsecurity.md) - Vzorové postupy autentizace
- **📝 Příklady**: [Příklad aplikace s databází](examples/database-app/README.md) - Příklady AZD s databází

#### Praktická cvičení
- Nakonfigurujte více prostředí (dev, staging, prod)
- Nastavte autentizaci pomocí spravované identity
- Implementujte konfigurace specifické pro prostředí

**💡 Výsledek kapitoly**: Spravovat více prostředí s odpovídající autentizací a zabezpečením

---

### 🏗️ Kapitola 4: Infrastruktura jako kód & Nasazení
**Předpoklady**: Kapitoly 1-3 dokončeny  
**Doba trvání**: 1-1.5 hod  
**Složitost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód s Bicep
- Strategie poskytování zdrojů

#### Studijní zdroje
- **📖 Nasazení**: [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletní workflowy
- **🏗️ Provisioning**: [Provisioning zdrojů](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure zdrojů
- **📝 Příklady**: [Příklad Container App](../../examples/container-app) - Nasazení v kontejnerech

#### Praktická cvičení
- Vytvořte vlastní Bicep šablony
- Nasadťe více-službové aplikace
- Implementujte blue-green strategie nasazení

**💡 Výsledek kapitoly**: Nasadit složité více-službové aplikace pomocí vlastních infrastrukturních šablon

---

### 🎯 Kapitola 5: Víceagentní AI řešení (Pokročilé)
**Předpoklady**: Kapitoly 1-2 dokončeny  
**Doba trvání**: 2-3 hod  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory architektury více agentů
- Orchestrace a koordinace agentů
- Produkčně připravená AI nasazení

#### Studijní zdroje
- **🤖 Hlavní projekt**: [Maloobchodní víceagentní řešení](examples/retail-scenario.md) - Kompletní implementace
- **🛠️ ARM šablony**: [Balíček ARM šablon](../../examples/retail-multiagent-arm-template) - Nasazení na jedno kliknutí
- **📖 Architektura**: [Koordinační vzory pro více agentů](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktická cvičení
```bash
# Nasadit kompletní maloobchodní víceagentní řešení
cd examples/retail-multiagent-arm-template
./deploy.sh

# Prozkoumat konfigurace agentů
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledek kapitoly**: Nasadit a spravovat produkčně připravené víceagentní AI řešení se zákaznickými a inventárními agenty

---

### 🔍 Kapitola 6: Validace & Plánování před nasazením
**Předpoklady**: Kapitola 4 dokončena  
**Doba trvání**: 1 hod  
**Složitost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a ověření zdrojů
- Strategie výběru SKU
- Kontroly před nasazením a automatizace

#### Studijní zdroje
- **📊 Plánování**: [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Ověření zdrojů
- **💰 Výběr**: [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladově efektivní volby
- **✅ Ověření**: [Kontroly před nasazením](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktická cvičení
- Spusťte skripty ověření kapacity
- Optimalizujte výběr SKU pro náklady
- Implementujte automatizované kontroly před nasazením

**💡 Výsledek kapitoly**: Ověřit a optimalizovat nasazení před provedením

---

### 🚨 Kapitola 7: Řešení problémů & Ladění
**Předpoklady**: Dokončena libovolná kapitola o nasazení  
**Doba trvání**: 1-1.5 hod  
**Složitost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a řešení
- AI-specifické řešení problémů

#### Studijní zdroje
- **🔧 Běžné problémy**: [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a řešení
- **🕵️ Ladění**: [Průvodce laděním](docs/chapter-07-troubleshooting/debugging.md) - Krok za krokem strategie
- **🤖 AI problémy**: [AI-specifické řešení problémů](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy AI služeb

#### Praktická cvičení
- Diagnostikujte selhání nasazení
- Vyřešte problémy s autentizací
- Laděte konektivitu AI služeb

**💡 Výsledek kapitoly**: Nezávisle diagnostikovat a vyřešit běžné problémy při nasazení

---

### 🏢 Kapitola 8: Produkce & Podnikové vzory
**Předpoklady**: Kapitoly 1-4 dokončeny  
**Doba trvání**: 2-3 hod  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie produkčního nasazení
- Podnikové bezpečnostní vzory
- Monitorování a optimalizace nákladů

#### Studijní zdroje
- **🏭 Produkce**: [Nejlepší postupy pro produkční AI](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Příklady**: [Příklad mikroservis](../../examples/microservices) - Složité architektury
- **📊 Monitorování**: [Integrace Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorování

#### Praktická cvičení
- Implementujte podnikové bezpečnostní vzory
- Nastavte komplexní monitorování
- Nasazte do produkce s odpovídajícím řízením

**💡 Výsledek kapitoly**: Nasadit podnikové aplikace připravené pro produkci s plnou produkční funkcionalitou

---

## 🎓 Přehled workshopu: Praktická výuka

> **⚠️ STAV WORKSHOPU: Probíhá vývoj**  
> Materiály workshopu jsou v současnosti vyvíjeny a upravovány. Jádrové moduly fungují, ale některé pokročilé sekce nejsou dokončené. Aktivně pracujeme na dokončení veškerého obsahu. [Sledujte pokrok →](workshop/README.md)

### Interaktivní materiály workshopu
**Komplexní praktické učení s nástroji v prohlížeči a řízenými cvičeními**

Naše materiály workshopu poskytují strukturovaný, interaktivní zážitek, který doplňuje výukový plán založený na kapitolách výše. Workshop je navržen pro samostatné učení i pro lekce vedené instruktorem.

#### 🛠️ Funkce workshopu
- **Rozhraní v prohlížeči**: Kompletní workshop poháněný MkDocs s vyhledáváním, kopírováním a možnostmi motivu
- **Integrace s GitHub Codespaces**: Nastavení vývojového prostředí jedním kliknutím
- **Strukturovaná výuková cesta**: 8 modulů s řízenými cvičeními (3–4 hodiny celkem)
- **Progresivní metodologie**: Úvod → Výběr → Ověření → Dekonstrukce → Konfigurace → Přizpůsobení → Vyčištění → Závěr
- **Interaktivní prostředí DevContainer**: Předkonfigurované nástroje a závislosti

#### 📚 Struktura modulů workshopu
Workshop sleduje **8-modulovou progresivní metodologii**, která vás provede od objevování k mistrovství nasazení:

| Modul | Téma | Co budete dělat | Doba trvání |
|--------|-------|----------------|----------|
| **0. Úvod** | Přehled workshopu | Pochopit cíle učení, předpoklady a strukturu workshopu | 15 min |
| **1. Výběr** | Objevování šablon | Prozkoumejte šablony AZD a vyberte správnou AI šablonu pro váš scénář | 20 min |
| **2. Ověření** | Nasadit a ověřit | Nasadit šablonu pomocí `azd up` a ověřit, že infrastruktura funguje | 30 min |
| **3. Dekonstrukce** | Porozumět struktuře | Použijte GitHub Copilot k prozkoumání architektury šablony, souborů Bicep a organizace kódu | 30 min |
| **4. Konfigurace** | Hloubkové seznámení s azure.yaml | Osvojte si konfiguraci `azure.yaml`, lifecycle hooky a proměnné prostředí | 30 min |
| **5. Přizpůsobení** | Upravte si to | Povolte AI Search, sledování, vyhodnocení a přizpůsobte to pro váš scénář | 45 min |
| **6. Vyčištění** | Vyčištění | Bezpečně odstraňte prostředky pomocí `azd down --purge` | 15 min |
| **7. Závěr** | Další kroky | Zhodnoťte dosažené výsledky, klíčové koncepty a pokračujte ve své vzdělávací cestě | 15 min |

**Průběh workshopu:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Začínáme s workshopem
```bash
# Možnost 1: GitHub Codespaces (Doporučeno)
# Klikněte na "Code" → "Create codespace on main" v repozitáři

# Možnost 2: Lokální vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podle pokynů pro nastavení v workshop/README.md
```

#### 🎯 Výsledky učení workshopu
Po absolvování workshopu účastníci:
- **Nasadit produkční AI aplikace**: Použijte AZD se službami Microsoft Foundry
- **Ovládněte víceagentní architektury**: Implementujte koordinovaná řešení AI agentů
- **Aplikujte nejlepší bezpečnostní postupy**: Nakonfigurujte autentizaci a řízení přístupu
- **Optimalizujte pro škálovatelnost**: Navrhněte nákladově efektivní a výkonná nasazení
- **Řešení problémů s nasazením**: Vyřešte běžné problémy samostatně

#### 📖 Zdroje workshopu
- **🎥 Interaktivní průvodce**: [Materiály workshopu](workshop/README.md) - Učení v prohlížeči
- **📋 Pokyny po modulech**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Přehled workshopu a cíle
  - [1. Výběr](workshop/docs/instructions/1-Select-AI-Template.md) - Najděte a vyberte AI šablonu
  - [2. Ověření](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadit a ověřit šablony
  - [3. Dekonstrukce](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Prozkoumejte architekturu šablony
  - [4. Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) - Osvojte si azure.yaml
  - [5. Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) - Přizpůsobte pro váš scénář
  - [6. Vyčištění](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Vyčištění prostředků
  - [7. Závěr](workshop/docs/instructions/7-Wrap-up.md) - Zhodnocení a další kroky
- **🛠️ AI Workshop Lab**: [Laboratoř AI workshopu](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičení zaměřená na AI
- **💡 Rychlý začátek**: [Průvodce nastavením workshopu](workshop/README.md#quick-start) - Konfigurace prostředí

**Ideální pro**: Firemní školení, univerzitní kurzy, samostatné učení a bootcampy pro vývojáře.

---

## 📖 Hluboký ponor: Možnosti AZD

Nad rámec základů poskytuje AZD silné funkce pro produkční nasazení:

- **Nasazení založené na šablonách** - Použijte předpřipravené šablony pro běžné vzory aplikací
- **Infrastruktura jako kód** - Spravujte prostředky Azure pomocí Bicep nebo Terraform  
- **Integrované pracovní postupy** - Bezproblémově zřizujte, nasazujte a monitorujte aplikace
- **Přátelské pro vývojáře** - Optimalizované pro produktivitu a zkušenost vývojářů

### **AZD + Microsoft Foundry: Ideální pro AI nasazení**

**Proč AZD pro AI řešení?** AZD řeší hlavní výzvy, kterým čelí vývojáři AI:

- **Šablony připravené pro AI** - Předkonfigurované šablony pro Microsoft Foundry modely, Cognitive Services a ML zátěže
- **Bezpečná AI nasazení** - Vestavěné bezpečnostní vzory pro AI služby, API klíče a koncové body modelů  
- **Produkční AI vzory** - Nejlepší postupy pro škálovatelná, nákladově efektivní nasazení AI aplikací
- **End-to-End AI pracovní postupy** - Od vývoje modelu po produkční nasazení s řádným monitorováním
- **Optimalizace nákladů** - Inteligentní přidělování zdrojů a strategie škálování pro AI zátěže
- **Integrace Microsoft Foundry** - Bezproblémové připojení ke katalogu modelů Microsoft Foundry a koncovým bodům

---

## 🎯 Knihovna šablon a příkladů

### Doporučené: Šablony Microsoft Foundry
**Začněte zde, pokud nasazujete AI aplikace!**

> **Poznámka:** Tyto šablony ukazují různé AI vzory. Některé jsou externí Azure Samples, jiné jsou lokální implementace.

| Šablona | Kapitola | Složitost | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začněte s AI chatem**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externí |
| [**Začněte s AI agenty**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externí |
| [**Azure Search + OpenAI Ukázka**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externí |
| [**OpenAI Chat App - Rychlý start**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externí |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externí |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externí |
| [**Řešení víceagentního maloobchodu**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokální** |

### Doporučené: Kompletní výukové scénáře
**Šablony aplikací připravené pro produkci mapované na výukové kapitoly**

| Šablona | Výuková kapitola | Složitost | Klíčové poznatky |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základní vzory nasazení AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementace RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrace Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Rámec agentů a volání funkcí |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Orchestrace podnikového AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Víceagentní architektura se zákaznickými a skladovými agenty |

### Učení podle typu příkladu

> **📌 Lokální vs. externí příklady:**  
> **Lokální příklady** (v tomto repozitáři) = Připraveno k okamžitému použití  
> **Externí příklady** (Azure Samples) = Klonovat z propojených repozitářů

#### Lokální příklady (Připraveno k použití)
- [**Řešení víceagentního maloobchodu**](examples/retail-scenario.md) - Kompletní implementace připravená pro produkci s ARM šablonami
  - Víceagentní architektura (Customer + Inventory agents)
  - Komplexní monitorování a vyhodnocení
  - Jednoklikové nasazení přes ARM šablonu

#### Lokální příklady - Kontejnerové aplikace (Kapitoly 2-5)
**Komplexní příklady nasazení kontejnerů v tomto repozitáři:**
- [**Příklady Container App**](examples/container-app/README.md) - Kompletní průvodce nasazením kontejnerů
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základní REST API s automatickým škálováním na nulu
  - [Architektura mikroservis](../../examples/container-app/microservices) - Nasazení více služeb připravené pro produkci
  - Rychlý start, produkční a pokročilé vzory nasazení
  - Pokyny pro monitorování, zabezpečení a optimalizaci nákladů

#### Externí příklady - Jednoduché aplikace (Kapitoly 1-2)
**Klonujte tyto repozitáře Azure Samples pro začátek:**
- [Jednoduchá webová aplikace - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základní vzory nasazení
- [Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasazení statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasazení REST API

#### Externí příklady - Integrace databází (Kapitoly 3-4)  
- [Aplikace s databází - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory připojení k databázi
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless datový tok

#### Externí příklady - Pokročilé vzory (Kapitoly 4-8)
- [Java mikroservisy](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury s více službami
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Zpracování na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkční ML vzory

### Externí kolekce šablon
- [**Oficiální galerie šablon AZD**](https://azure.github.io/awesome-azd/) - Kurátorská sbírka oficiálních a komunitních šablon
- [**Šablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentace šablon Microsoft Learn
- [**Adresář příkladů**](examples/README.md) - Lokální výukové příklady s podrobnými vysvětleními

---

## 📚 Vzdělávací zdroje a reference

### Rychlé odkazy
- [**Přehled příkazů**](resources/cheat-sheet.md) - Základní příkazy azd uspořádané podle kapitol
- [**Glosář**](resources/glossary.md) - Terminologie Azure a azd  
- [**Často kladené otázky**](resources/faq.md) - Běžné otázky uspořádané podle výukových kapitol
- [**Studijní průvodce**](resources/study-guide.md) - Komplexní cvičení

### Praktické workshopy
- [**Laboratoř AI workshopu**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Udělejte svá AI řešení nasaditelná přes AZD (2–3 hodiny)
- [**Interaktivní workshop**](workshop/README.md) - 8 modulů řízených cvičení s MkDocs a GitHub Codespaces
  - Následuje: Úvod → Výběr → Ověření → Dekonstrukce → Konfigurace → Přizpůsobení → Vyčištění → Závěr

### Externí vzdělávací zdroje
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulačka cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stav Azure](https://status.azure.com/)

### Dovednosti AI agentů pro váš editor
- [**Microsoft Azure dovednosti na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otevřených agentních dovedností pro Azure AI, Foundry, nasazení, diagnostiku, optimalizaci nákladů a další. Nainstalujte je do GitHub Copilot, Cursor, Claude Code nebo do libovolného podporovaného agenta:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rychlý průvodce řešením problémů

**Běžné problémy, se kterými se začátečníci setkávají, a okamžitá řešení:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Nejprve nainstalujte AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Ověřte instalaci
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Vypsat dostupná předplatná
az account list --output table

# Nastavit výchozí předplatné
az account set --subscription "<subscription-id-or-name>"

# Nastavit pro prostředí AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Ověřit
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Zkuste jiný region Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Nebo při vývoji použijte menší SKU
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" selže v polovině</strong></summary>

```bash
# Možnost 1: Vyčistit a zkusit znovu
azd down --force --purge
azd up

# Možnost 2: Opravit pouze infrastrukturu
azd provision

# Možnost 3: Zkontrolovat podrobný stav
azd show

# Možnost 4: Prohlédnout protokoly v Azure Monitoru
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Znovu autentizovat
az logout
az login

azd auth logout
azd auth login

# Ověřit autentizaci
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" nebo konflikty v pojmenování</strong></summary>

```bash
# AZD generuje unikátní názvy, ale pokud dojde ke konfliktu:
azd down --force --purge

# Pak zkuste znovu s novým prostředím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasazení šablony trvá příliš dlouho</strong></summary>

**Normální doby čekání:**
- Jednoduchá webová aplikace: 5-10 minut
- Aplikace s databází: 10-15 minut
- AI aplikace: 15-25 minut (zřizování OpenAI je pomalé)

```bash
# Zkontrolujte průběh
azd show

# Pokud se zaseknete více než 30 minut, zkontrolujte Azure Portal:
azd monitor
# Hledejte neúspěšná nasazení
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Zkontrolujte svou roli v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potřebujete alespoň roli "Contributor"
# Požádejte správce Azure o udělení:
# - Contributor (pro prostředky)
# - User Access Administrator (pro přiřazování rolí)
```
</details>

<details>
<summary><strong>❌ Nelze najít URL nasazené aplikace</strong></summary>

```bash
# Zobrazit všechny koncové body služeb
azd show

# Nebo otevřete portál Azure
azd monitor

# Zkontrolovat konkrétní službu
azd env get-values
# Hledejte proměnné *_URL
```
</details>

### 📚 Kompletní zdroje pro řešení problémů

- **Průvodce běžnými problémy:** [Podrobná řešení](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy specifické pro AI:** [Řešení problémů s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Průvodce laděním:** [Ladění krok za krokem](docs/chapter-07-troubleshooting/debugging.md)
- **Získejte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončení kurzu a certifikace

### Sledování pokroku
Sledujte svůj postup učení v jednotlivých kapitolách:

- [ ] **Kapitola 1**: Základy a rychlý start ✅
- [ ] **Kapitola 2**: Vývoj s důrazem na AI ✅  
- [ ] **Kapitola 3**: Konfigurace a autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód a nasazení ✅
- [ ] **Kapitola 5**: Víceagentní AI řešení ✅
- [ ] **Kapitola 6**: Validace a plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů a ladění ✅
- [ ] **Kapitola 8**: Produkční a podnikové vzory ✅

### Ověření učení
Po dokončení každé kapitoly ověřte své znalosti takto:
1. **Praktické cvičení**: Dokončete praktické nasazení z kapitoly
2. **Kontrola znalostí**: Projděte si sekci FAQ pro vaši kapitolu
3. **Diskuse v komunitě**: Sdílejte své zkušenosti v Azure Discord
4. **Další kapitola**: Přesuňte se na další úroveň složitosti

### Přínosy po dokončení kurzu
Po dokončení všech kapitol získáte:
- **Produkční zkušenosti**: Nasadili jste skutečné AI aplikace do Azure
- **Profesionální dovednosti**: Schopnosti nasazení připravené pro podniky  
- **Uznání v komunitě**: Aktivní člen komunity vývojářů Azure
- **Kariérní růst**: Žádané znalosti v oblasti AZD a nasazování AI

---

## 🤝 Komunita a podpora

### Získejte pomoc a podporu
- **Technické problémy**: [Nahlásit chyby a požádat o funkce](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky ohledně učení**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specifická pro AI**: Připojte se k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentace**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postřehy komunity z Microsoft Foundry Discordu

**Nedávné výsledky ankety z kanálu #Azure:**
- **45 %** vývojářů chce používat AZD pro AI pracovní zátěže
- **Hlavní výzvy**: Nasazení více služeb, správa přihlašovacích údajů, připravenost pro produkci  
- **Nejčastěji požadované**: Šablony specifické pro AI, příručky řešení problémů, osvědčené postupy

**Připojte se k naší komunitě, abyste:**
- Sdílejte své zkušenosti s AZD + AI a získejte pomoc
- Získejte přístup k raným ukázkám nových AI šablon
- Přispívejte k osvědčeným postupům nasazování AI
- Ovlivněte budoucí vývoj funkcí AI + AZD

### Přispívání do kurzu
Vítáme příspěvky! Přečtěte si náš [Průvodce přispíváním](CONTRIBUTING.md) pro podrobnosti o:
- **Vylepšení obsahu**: Vylepšete stávající kapitoly a příklady
- **Nové příklady**: Přidejte scénáře z reálného světa a šablony  
- **Překlad**: Pomozte udržovat podporu více jazyků
- **Hlášení chyb**: Zlepšete přesnost a srozumitelnost
- **Standardy komunity**: Dodržujte naše zásady inkluzivní komunity

---

## 📄 Informace o kurzu

### Licence
Projekt je licencován pod licencí MIT - podrobnosti viz soubor [LICENSE](../../LICENSE).

### Související vzdělávací zdroje Microsoftu

Náš tým vytváří i další komplexní vzdělávací kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pro začátečníky](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pro začátečníky](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pro začátečníky](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD pro začátečníky](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pro začátečníky](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pro začátečníky](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti pro začátečníky](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série o generativním AI
[![Generativní AI pro začátečníky](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základní vzdělávání
[![ML pro začátečníky](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science pro začátečníky](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pro začátečníky](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberbezpečnost pro začátečníky](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webový vývoj pro začátečníky](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pro začátečníky](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Vývoj XR pro začátečníky](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot pro párované programování s AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pro C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Dobrodružství](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigace kurzu

**🚀 Připraveni začít se učit?**

**Začátečníci**: Začněte s [Kapitola 1: Základy & Rychlý start](#-chapter-1-foundation--quick-start)  
**Vývojáři AI**: Přejděte na [Kapitola 2: Vývoj zaměřený na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Zkušení vývojáři**: Začněte s [Kapitola 3: Konfigurace & Autentizace](#️-chapter-3-configuration--authentication)

**Další kroky**: [Začněte kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za rozhodující zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo mylné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->