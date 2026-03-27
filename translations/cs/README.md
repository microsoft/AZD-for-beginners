# AZD pro začátečníky: Strukturovaná výuková cesta

![AZD-pro-začátečníky](../../translated_images/cs/azdbeginners.5527441dd9f74068.webp) 

[![Sledovatelé GitHubu](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forky GitHubu](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Hvězdy na GitHubu](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatické překlady (vždy aktuální)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabština](../ar/README.md) | [Bengálština](../bn/README.md) | [Bulharština](../bg/README.md) | [Barmsky (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradiční, Hongkong)](../zh-HK/README.md) | [Čínština (tradiční, Macao)](../zh-MO/README.md) | [Čínština (tradiční, Tchaj-wan)](../zh-TW/README.md) | [Chorvatština](../hr/README.md) | [Čeština](./README.md) | [Dánština](../da/README.md) | [Nizozemština](../nl/README.md) | [Estonština](../et/README.md) | [Finština](../fi/README.md) | [Francouzština](../fr/README.md) | [Němčina](../de/README.md) | [Řečtina](../el/README.md) | [Hebrejština](../he/README.md) | [Hindština](../hi/README.md) | [Maďarština](../hu/README.md) | [Indonéština](../id/README.md) | [Italština](../it/README.md) | [Japonština](../ja/README.md) | [Kannadština](../kn/README.md) | [Korejština](../ko/README.md) | [Litevština](../lt/README.md) | [Malajština](../ms/README.md) | [Malajálamština](../ml/README.md) | [Maráthština](../mr/README.md) | [Nepálština](../ne/README.md) | [Nigerijský pidžin](../pcm/README.md) | [Norština](../no/README.md) | [Perština (Farsi)](../fa/README.md) | [Polština](../pl/README.md) | [Portugalština (Brazílie)](../pt-BR/README.md) | [Portugalština (Portugalsko)](../pt-PT/README.md) | [Pundžábština (Gurmukhi)](../pa/README.md) | [Rumunština](../ro/README.md) | [Ruština](../ru/README.md) | [Srbština (cyrilice)](../sr/README.md) | [Slovenština](../sk/README.md) | [Slovinština](../sl/README.md) | [Španělština](../es/README.md) | [Svahilština](../sw/README.md) | [Švédština](../sv/README.md) | [Tagalog (Filipínština)](../tl/README.md) | [Tamilština](../ta/README.md) | [Telugština](../te/README.md) | [Thajština](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinština](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamština](../vi/README.md)

> **Dáváte přednost lokálnímu klonování?**
>
> Tento repozitář obsahuje více než 50 překladů, což výrazně zvětšuje velikost stahování. Pro klonování bez překladů použijte sparse checkout:
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
> Toto vám poskytne vše, co potřebujete ke dokončení kurzu, s mnohem rychlejším stažením.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co je dnes nového v azd

Azure Developer CLI se rozrostl nad rámec tradičních webových aplikací a API. Dnes je azd jediným nástrojem pro nasazení jakékoli aplikace do Azure — včetně aplikací poháněných AI a inteligentních agentů.

Co to pro vás znamená:

- **AI agenti jsou nyní plnohodnotnými pracovními zatíženími azd.** Můžete inicializovat, nasazovat a spravovat projekty AI agentů pomocí stejného postupu `azd init` → `azd up`, který už znáte.
- **Integrace Microsoft Foundry** přináší nasazování modelů, hosting agentů a konfiguraci AI služeb přímo do ekosystému šablon azd.
- **Jádro pracovního postupu se nezměnilo.** Ať už nasazujete todo aplikaci, mikroslužbu nebo multi-agentní AI řešení, příkazy jsou stejné.

Pokud jste azd už dříve používali, podpora AI je přirozeným rozšířením — ne samostatným nástrojem nebo pokročilou cestou. Pokud začínáte od začátku, naučíte se jediný pracovní postup, který funguje pro vše.

---

## 🚀 Co je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je pro vývojáře přívětivý nástroj příkazového řádku, který usnadňuje nasazování aplikací do Azure. Místo ručního vytváření a propojování desítek prostředků Azure můžete nasadit celé aplikace jedním příkazem.

### Kouzlo `azd up`

```bash
# Tento jediný příkaz dělá vše:
# ✅ Vytváří všechny zdroje Azure
# ✅ Konfiguruje síťování a zabezpečení
# ✅ Překládá váš aplikační kód
# ✅ Nasazuje do Azure
# ✅ Poskytuje vám funkční URL
azd up
```

**To je vše!** Žádné klikání v Azure portálu, žádné složité ARM šablony na naučení, žádná ruční konfigurace — jen fungující aplikace v Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: V čem je rozdíl?

To je nejčastější otázka, kterou začátečníci pokládají. Tady je jednoduchá odpověď:

| Funkce | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Spravovat jednotlivé prostředky Azure | Nasazovat kompletní aplikace |
| **Přístup** | Zaměřeno na infrastrukturu | Zaměřeno na aplikace |
| **Příklad** | `az webapp create --name myapp...` | `azd up` |
| **Křivka učení** | Je třeba znát služby Azure | Stačí znát svoji aplikaci |
| **Nejvhodnější pro** | DevOps, infrastruktura | Vývojáři, prototypování |

### Jednoduchá analogie

- **Azure CLI** je jako mít všechny nástroje na stavbu domu — kladiva, pily, hřebíky. Můžete postavit cokoliv, ale musíte znát stavebnictví.
- **Azure Developer CLI** je jako najmout dodavatele — popíšete, co chcete, a on se postará o výstavbu.

### Kdy použít který

| Scénář | Použít |
|----------|----------|
| "Chci rychle nasadit svou webovou aplikaci" | `azd up` |
| "Potřebuji vytvořit jen účet úložiště" | `az storage account create` |
| "Vytvářím kompletní AI aplikaci" | `azd init --template azure-search-openai-demo` |
| "Potřebuji ladit konkrétní prostředek Azure" | `az resource show` |
| "Chci produkční nasazení během několika minut" | `azd up --environment production` |

### Pracují spolu!

AZD používá Azure CLI na pozadí. Můžete používat oba:
```bash
# Nasadit vaši aplikaci pomocí AZD
azd up

# Pak doladit konkrétní zdroje pomocí Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najděte šablony v Awesome AZD

Nepouštějte se od nuly! **Awesome AZD** je komunitní sbírka šablon připravených k nasazení:

| Zdroj | Popis |
|----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Prohlédněte si 200+ šablon s nasazením jedním kliknutím |
| 🔗 [**Odeslat šablonu**](https://github.com/Azure/awesome-azd/issues) | Přispějte vlastní šablonou do komunity |
| 🔗 [**Repozitář GitHub**](https://github.com/Azure/awesome-azd) | Dejte hvězdu a prozkoumejte zdroj |

### Oblíbené AI šablony z Awesome AZD

```bash
# RAG rozhovor s modely Microsoft Foundry + AI vyhledávání
azd init --template azure-search-openai-demo

# Rychlá AI chatovací aplikace
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agenty
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

### Krok 2: Přihlaste se do Azure

```bash
azd auth login
```

### Krok 3: Nasadit svou první aplikaci

```bash
# Inicializovat z šablony
azd init --template todo-nodejs-mongo

# Nasadit do Azure (vytvoří vše!)
azd up
```

**🎉 To je vše!** Vaše aplikace je nyní nasazená na Azure.

### Úklid (nezapomeňte!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak používat tento kurz

Tento kurz je navržen pro **postupné učení** - začněte tam, kde se cítíte pohodlně, a postupujte dál:

| Vaše zkušenosti | Začněte zde |
|-----------------|------------|
| **Úplný začátečník v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Znáte Azure, nováček v AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chcete nasazovat AI aplikace** | [Kapitola 2: AI-první vývoj (doporučeno pro AI vývojáře)](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcete praktické cvičení** | [🎓 Interaktivní workshop](workshop/README.md) - 3-4 hodinové řízené cvičení |
| **Potřebujete produkční vzory** | [Kapitola 8: Produkční a podnikové vzory](#-chapter-8-production--enterprise-patterns) |

### Rychlé nastavení

1. **Vytvořte fork tohoto repozitáře**: [![Forky GitHubu](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získejte pomoc**: [Komunita Azure na Discordu](https://discord.com/invite/ByRwuEEgH4)

> **Dáváte přednost lokálnímu klonování?**

> Tento repozitář obsahuje více než 50 překladů, což výrazně zvětšuje velikost stahování. Pro klonování bez překladů použijte sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Toto vám poskytne vše, co potřebujete ke dokončení kurzu, s mnohem rychlejším stažením.


## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní důraz na nasazování AI aplikací s integrací Microsoft Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Na základě poznatků z komunity Microsoft Foundry na Discordu, **45 % vývojářů chce používat AZD pro AI pracovní zátěže**, ale naráží na problémy s:
- Komplexní více-službové AI architektury
- Nejlepší postupy pro nasazení AI do produkce  
- Integrace a konfigurace AI služeb v Azure
- Optimalizace nákladů pro AI zátěže
- Řešení problémů se specifickými nasazeními AI

### Výukové cíle

Po dokončení tohoto strukturovaného kurzu budete:
- **Ovládnete základy AZD**: Základní koncepty, instalace a konfigurace
- **Nasazovat AI aplikace**: Používat AZD se službami Microsoft Foundry
- **Implementovat infrastrukturu jako kód**: Spravovat prostředky Azure pomocí Bicep šablon
- **Řešit problémy nasazení**: Odstraňovat běžné chyby a ladit problémy
- **Optimalizovat pro produkci**: Bezpečnost, škálování, monitorování a řízení nákladů
- **Vytvářet multi-agentní řešení**: Nasazovat komplexní AI architektury

## 🗺️ Mapa kurzu: Rychlá navigace podle kapitol

Každá kapitola má vlastní README s výukovými cíli, rychlými začátky a cvičeními:

| Kapitola | Téma | Lekce | Doba trvání | Složitost |
|---------|-------|---------|----------|------------|
| **[Kap. 1: Základy](docs/chapter-01-foundation/README.md)** | Začínáme | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalace](docs/chapter-01-foundation/installation.md) &#124; [První projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap. 2: Vývoj AI](docs/chapter-02-ai-development/README.md)** | Aplikace orientované na AI | [Integrace Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasazení modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Kap. 3: Konfigurace](docs/chapter-03-configuration/README.md)** | Autentizace & Bezpečnost | [Konfigurace](docs/chapter-03-configuration/configuration.md) &#124; [Autentizace & Bezpečnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap. 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & Nasazení | [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Kap. 5: Víceagentní](docs/chapter-05-multi-agent/README.md)** | Řešení AI agentů | [Scénář maloobchodu](examples/retail-scenario.md) &#124; [Vzory koordinace](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Kap. 6: Před nasazením](docs/chapter-06-pre-deployment/README.md)** | Plánování & Ověření | [Předběžné kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Kap. 7: Řešení problémů](docs/chapter-07-troubleshooting/README.md)** | Ladění & Opravy | [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladění](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problémy s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Kap. 8: Produkce](docs/chapter-08-production/README.md)** | Podnikové vzory | [Postupy pro produkci](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktická dílna | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výběr](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Ověření](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruct](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Uklidit infrastrukturu](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Závěr](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Celková doba kurzu:** ~10-14 hodin | **Postup dovedností:** Začátečník → Připraven k nasazení do produkce

---

## 📚 Studijní kapitoly

*Vyberte si studijní cestu na základě úrovně zkušeností a cílů*

### 🚀 Kapitola 1: Základy & Rychlý start
**Předpoklady**: Azure subscription, základní znalost příkazového řádku  
**Doba trvání**: 30-45 minut  
**Komplexnost**: ⭐

#### Co se naučíte
- Základy Azure Developer CLI
- Instalace AZD na vaší platformě
- Vaše první úspěšné nasazení

#### Studijní zdroje
- **🎯 Začněte zde**: [Co je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorie**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Hlavní koncepty a terminologie
- **⚙️ Nastavení**: [Instalace & Nastavení](docs/chapter-01-foundation/installation.md) - Platformě specifické návody
- **🛠️ Prakticky**: [Váš první projekt](docs/chapter-01-foundation/first-project.md) - Krok za krokem
- **📋 Rychlá reference**: [Rychlý přehled příkazů](resources/cheat-sheet.md)

#### Praktická cvičení
```bash
# Rychlá kontrola instalace
azd version

# Nasadit svou první aplikaci
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
azd show                # Zobrazuje URL běžící aplikace
# Aplikace se otevře v prohlížeči a funguje
azd down --force --purge  # Odstraňuje prostředky
```

**📊 Časová investice:** 30-45 minut  
**📈 Úroveň dovedností po:** Umí nasadit základní aplikace samostatně
**📈 Úroveň dovedností po:** Umí nasadit základní aplikace samostatně

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (Doporučeno pro AI vývojáře)
**Předpoklady**: Kapitola 1 dokončena  
**Doba trvání**: 1-2 hodiny  
**Komplexnost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazení aplikací poháněných AI
- Porozumění konfiguracím AI služeb

#### Studijní zdroje
- **🎯 Začněte zde**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenti**: [Průvodce AI agenty](docs/chapter-02-ai-development/agents.md) - Nasazujte inteligentní agenty s AZD
- **📖 Vzory**: [Nasazení AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasazení a správa AI modelů
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Připravte svá AI řešení pro AZD
- **🎥 Interaktivní průvodce**: [Workshop Materials](workshop/README.md) - Učení v prohlížeči s MkDocs * DevContainer Environment
- **📋 Šablony**: [Microsoft Foundry Templates](#zdroje-workshopu)
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

**💡 Výsledek kapitoly**: Nasadit a nakonfigurovat chatovací aplikaci poháněnou AI s RAG funkcionalitou

**✅ Ověření úspěchu:**
```bash
# Po 2. kapitole byste měli být schopni:
azd init --template azure-search-openai-demo
azd up
# Otestovat rozhraní chatu s AI
# Pokládat otázky a získávat odpovědi generované AI se zdroji
# Ověřit, že integrace vyhledávání funguje
azd monitor  # Zkontrolovat, že Application Insights zobrazuje telemetrii
azd down --force --purge
```

**📊 Časová investice:** 1-2 hodiny  
**📈 Úroveň dovedností po:** Umí nasadit a nakonfigurovat produkčně připravené AI aplikace  
**💰 Povědomí o nákladech:** Pochopit $80-150/měsíc náklady pro vývoj, $300-3500/měsíc náklady pro produkci

#### 💰 Úvahy o nákladech pro nasazení AI

**Vývojové prostředí (Odhad $80-150/měsíc):**
- Microsoft Foundry Models (Platba podle použití): $0-50/měsíc (na základě využití tokenů)
- AI Search (základní úroveň): $75/měsíc
- Container Apps (Spotřeba): $0-20/měsíc
- Úložiště (Standardní): $1-5/měsíc

**Produkční prostředí (Odhad $300-3,500+/měsíc):**
- Microsoft Foundry Models (PTU pro konzistentní výkon): $3,000+/měsíc NEBO Platba podle použití při vysokém objemu
- AI Search (standardní úroveň): $250/měsíc
- Container Apps (Vyhrazené): $50-100/měsíc
- Application Insights: $5-50/měsíc
- Úložiště (Prémiové): $10-50/měsíc

**💡 Tipy pro optimalizaci nákladů:**
- Použijte **Free Tier** Microsoft Foundry Models pro učení (Azure OpenAI 50,000 tokenů/měsíc zahrnuto)
- Spouštějte `azd down` pro deallokaci prostředků, když aktivně nevyvíjíte
- Začněte s billingem založeným na spotřebě, Upgradujte na PTU pouze pro produkci
- Použijte `azd provision --preview` pro odhad nákladů před nasazením
- Povolit auto-scaling: plaťte pouze za skutečné využití

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
**Komplexnost**: ⭐⭐

#### Co se naučíte
- Správa a konfigurace prostředí
- Nejlepší postupy pro autentizaci a bezpečnost
- Pojmenování a organizace prostředků

#### Studijní zdroje
- **📖 Konfigurace**: [Průvodce konfigurací](docs/chapter-03-configuration/configuration.md) - Nastavení prostředí
- **🔐 Bezpečnost**: [Vzor autentizace a spravovaná identita](docs/chapter-03-configuration/authsecurity.md) - Vzory autentizace
- **📝 Příklady**: [Příklad databázové aplikace](examples/database-app/README.md) - AZD databázové příklady

#### Praktická cvičení
- Nakonfigurujte více prostředí (dev, staging, prod)
- Nastavte autentizaci pomocí spravované identity
- Implementujte konfigurace specifické pro prostředí

**💡 Výsledek kapitoly**: Spravovat více prostředí s odpovídající autentizací a bezpečností

---

### 🏗️ Kapitola 4: Infrastruktura jako kód & Nasazení
**Předpoklady**: Kapitoly 1-3 dokončeny  
**Doba trvání**: 1-1.5 hodiny  
**Komplexnost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód s Bicep
- Strategie provizování prostředků

#### Studijní zdroje
- **📖 Nasazení**: [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletní workflowy
- **🏗️ Provisioning**: [Provisioning prostředků](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure prostředků
- **📝 Příklady**: [Příklad Container App](../../examples/container-app) - Nasazení v kontejnerech

#### Praktická cvičení
- Vytvořte vlastní Bicep šablony
- Nasadit více-službové aplikace
- Implementujte blue-green deployment strategie

**💡 Výsledek kapitoly**: Nasadit složité více-službové aplikace pomocí vlastních infrastrukturních šablon

---

### 🎯 Kapitola 5: Víceagentní AI řešení (Pokročilé)
**Předpoklady**: Kapitoly 1-2 dokončeny  
**Doba trvání**: 2-3 hodiny  
**Komplexnost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory architektury více agentů
- Orchestrace a koordinace agentů
- Produkčně připravená AI nasazení

#### Studijní zdroje
- **🤖 Doporučený projekt**: [Víceagentní řešení pro maloobchod](examples/retail-scenario.md) - Kompletní implementace
- **🛠️ ARM šablony**: [Balíček ARM šablon](../../examples/retail-multiagent-arm-template) - Nasazení na jedno kliknutí
- **📖 Architektura**: [Vzory koordinace více agentů](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktická cvičení
```bash
# Nasadit kompletní maloobchodní víceagentní řešení
cd examples/retail-multiagent-arm-template
./deploy.sh

# Prozkoumat konfigurace agentů
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledek kapitoly**: Nasadit a spravovat produkčně připravené víceagentní AI řešení s agenty pro zákazníka a inventář

---

### 🔍 Kapitola 6: Validace & Plánování před nasazením
**Předpoklady**: Kapitola 4 dokončena  
**Doba trvání**: 1 hodina  
**Komplexnost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a ověření prostředků
- Strategie výběru SKU
- Předběžné kontroly a automatizace

#### Studijní zdroje
- **📊 Plánování**: [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Ověření prostředků
- **💰 Výběr**: [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladově efektivní volby
- **✅ Ověření**: [Předběžné kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktická cvičení
- Spusťte skripty pro ověření kapacity
- Optimalizujte výběr SKU pro náklady
- Implementujte automatizované před-nasazovací kontroly

**💡 Výsledek kapitoly**: Ověřit a optimalizovat nasazení před spuštěním

---

### 🚨 Kapitola 7: Řešení problémů & Ladění
**Předpoklady**: Jakákoli kapitola o nasazení dokončena  
**Doba trvání**: 1-1.5 hodiny  
**Komplexnost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a řešení
- AI-specifické řešení problémů

#### Studijní zdroje
- **🔧 Běžné problémy**: [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a řešení
- **🕵️ Ladění**: [Průvodce laděním](docs/chapter-07-troubleshooting/debugging.md) - Postupy krok za krokem
- **🤖 Problémy s AI**: [AI-specifické řešení problémů](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy AI služeb

#### Praktická cvičení
- Diagnostikujte chyby nasazení
- Vyřešte problémy s autentizací
- Ladit konektivitu AI služeb

**💡 Výsledek kapitoly**: Samostatně diagnostikovat a vyřešit běžné problémy nasazení

---

### 🏢 Kapitola 8: Produkce & Podnikové vzory
**Předpoklady**: Kapitoly 1-4 dokončeny  
**Doba trvání**: 2-3 hodiny  
**Komplexnost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie produkčního nasazení
- Podnikové bezpečnostní vzory
- Monitoring a optimalizace nákladů

#### Studijní zdroje
- **🏭 Produkce**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Příklady**: [Microservices Example](../../examples/microservices) - Složité architektury
- **📊 Monitorování**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorování

#### Praktická cvičení
- Implementujte podnikové bezpečnostní vzory
- Nastavte komplexní monitorování
- Nasazení do produkce s odpovídající správou

**💡 Výsledek kapitoly**: Nasadit aplikace připravené pro podnikové použití s plnou produkční funkcionalitou

---

## 🎓 Přehled workshopu: Praktické cvičení

> **⚠️ STAV WORKSHOPU: Probíhá vývoj**  
> Materiály workshopu jsou momentálně ve vývoji a dolaďování. Základní moduly fungují, ale některé pokročilé sekce nejsou dokončené. Aktivně pracujeme na dokončení veškerého obsahu. [Sledujte pokrok →](workshop/README.md)

### Interaktivní materiály workshopu
**Komplexní praktické učení s nástroji v prohlížeči a vedenými cvičeními**

Naše materiály workshopu poskytují strukturovaný, interaktivní vzdělávací zážitek, který doplňuje výukový obsah podle kapitol výše. Workshop je navržen pro samostudium i vedené lekce instruktorem.

#### 🛠️ Vlastnosti workshopu
- **Rozhraní v prohlížeči**: Kompletní workshop poháněný MkDocs s vyhledáváním, kopií a funkcemi motivu
- **Integrace s GitHub Codespaces**: Nastavení vývojového prostředí jedním kliknutím
- **Strukturovaná výuková cesta**: 8 modulů s vedenými cvičeními (celkem 3-4 hodiny)
- **Progresivní metodologie**: Úvod → Výběr → Ověření → Rozebrání → Konfigurace → Přizpůsobení → Odstranění → Závěr
- **Interaktivní DevContainer prostředí**: Předkonfigurované nástroje a závislosti

#### 📚 Struktura modulů workshopu
Workshop sleduje an **8-modulovou progresivní metodologii**, která vás provede od objevování k mistrovství v nasazování:

| Modul | Téma | Co budete dělat | Doba trvání |
|--------|-------|----------------|----------|
| **0. Úvod** | Přehled workshopu | Pochopit cíle učení, předpoklady a strukturu workshopu | 15 min |
| **1. Výběr** | Objevování šablon | Prozkoumejte šablony AZD a vyberte tu správnou AI šablonu pro vaši situaci | 20 min |
| **2. Ověření** | Nasazení & Ověření | Nasadit šablonu pomocí `azd up` a ověřit, že infrastruktura funguje | 30 min |
| **3. Rozebrání** | Pochopit strukturu | Použijte GitHub Copilot k prozkoumání architektury šablony, Bicep souborů a organizace kódu | 30 min |
| **4. Konfigurace** | Hloubková analýza azure.yaml | Ovládněte konfiguraci `azure.yaml`, lifecycle hooky a proměnné prostředí | 30 min |
| **5. Přizpůsobení** | Upravte podle sebe | Povolit AI Search, tracing, vyhodnocování a přizpůsobit pro váš scénář | 45 min |
| **6. Odstranění** | Úklid | Bezpečně odprovisionujte prostředky pomocí `azd down --purge` | 15 min |
| **7. Závěr** | Další kroky | Zhodnoťte dosažené výsledky, klíčové koncepty a pokračujte ve své učební cestě | 15 min |

**Workshop Flow:**
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
# Postupujte podle pokynů k nastavení v workshop/README.md
```

#### 🎯 Cíle učení workshopu
Po dokončení workshopu účastníci:
- **Nasazovat produkční AI aplikace**: Použít AZD se službami Microsoft Foundry
- **Ovládnout architektury s více agenty**: Implementovat koordinovaná řešení AI agentů
- **Implementovat bezpečnostní osvědčené postupy**: Konfigurovat autentizaci a řízení přístupu
- **Optimalizovat pro škálování**: Navrhovat nákladově efektivní, výkonná nasazení
- **Řešit problémy s nasazením**: Nezávisle vyřešit běžné problémy

#### 📖 Zdroje workshopu
- **🎥 Interaktivní průvodce**: [Workshop Materials](workshop/README.md) - Prostředí pro učení v prohlížeči
- **📋 Instrukce po modulech**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Přehled workshopu a cíle
  - [1. Výběr](workshop/docs/instructions/1-Select-AI-Template.md) - Najděte a vyberte AI šablony
  - [2. Ověření](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasazení a ověření šablon
  - [3. Rozebrání](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Prozkoumejte architekturu šablony
  - [4. Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládněte azure.yaml
  - [5. Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) - Přizpůsobení pro váš scénář
  - [6. Odstranění](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Vyčištění prostředků
  - [7. Závěr](workshop/docs/instructions/7-Wrap-up.md) - Shrnutí a další kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičení zaměřená na AI
- **💡 Rychlý start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfigurace prostředí

**Ideální pro**: Firemní školení, univerzitní kurzy, samostatné studium a bootcampy pro vývojáře.

---

## 📖 Hluboký ponor: Možnosti AZD

Nad rámec základů poskytuje AZD silné funkce pro produkční nasazení:

- **Nasazení založená na šablonách** - Používejte předpřipravené šablony pro běžné aplikační vzory
- **Infrastruktura jako kód** - Spravujte Azure prostředky pomocí Bicep nebo Terraform  
- **Integrované workflowy** - Bezproblémově zřizovat, nasazovat a monitorovat aplikace
- **Přátelské pro vývojáře** - Optimalizováno pro produktivitu a zkušenost vývojářů

### **AZD + Microsoft Foundry: Ideální pro AI nasazení**

**Proč AZD pro AI řešení?** AZD řeší hlavní výzvy, kterým čelí vývojáři AI:

- **Šablony připravené pro AI** - Předkonfigurované šablony pro Microsoft Foundry modely, Cognitive Services a ML zátěže
- **Bezpečné AI nasazení** - Vestavěné bezpečnostní vzory pro AI služby, API klíče a koncové body modelů  
- **Produkční AI vzory** - Nejlepší postupy pro škálovatelná, nákladově efektivní nasazení AI aplikací
- **End-to-End AI workflowy** - Od vývoje modelu po produkční nasazení s řádným monitorováním
- **Optimalizace nákladů** - Chytré strategie přidělování zdrojů a škálování pro AI zátěže
- **Integrace Microsoft Foundry** - Bezproblémové napojení na katalog modelů Microsoft Foundry a koncové body

---

## 🎯 Knihovna šablon a příkladů

### Doporučeno: Šablony Microsoft Foundry
**Začněte zde, pokud nasazujete AI aplikace!**

> **Poznámka:** Tyto šablony demonstrují různé AI vzory. Některé jsou externí Azure Samples, jiné jsou lokální implementace.

| Šablona | Kapitola | Složitost | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začněte s AI chatem**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externí |
| [**Začněte s AI agenty**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externí |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externí |
| [**Rychlý start OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externí |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externí |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externí |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokální** |

### Doporučeno: Kompletní výukové scénáře
**Šablony aplikací připravené pro produkci mapované na výukové kapitoly**

| Šablona | Výuková kapitola | Složitost | Klíčové učení |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základní vzory nasazení AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementace RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrace Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Agent framework a volání funkcí |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Podniková orchestraci AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektura více agentů se zákaznickým a inventárním agentem |

### Učení podle typu příkladu

> **📌 Lokální vs. Externí příklady:**  
> **Lokální příklady** (v tomto repozitáři) = Připravené k okamžitému použití  
> **Externí příklady** (Azure Samples) = Naklonujte z propojených repozitářů

#### Lokální příklady (připravené k použití)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletní implementace připravená pro produkci s ARM šablonami
  - Architektura více agentů (Customer + Inventory agenti)
  - Komplexní monitorování a vyhodnocování
  - Nasazení jedním kliknutím pomocí ARM šablony

#### Lokální příklady - Kontejnerové aplikace (kapitoly 2-5)
**Komplexní příklady nasazení kontejnerů v tomto repozitáři:**
- [**Container App Examples**](examples/container-app/README.md) - Kompletní průvodce konteinerizovanými nasazeními
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Základní REST API s scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produkčně připravené více-službové nasazení
  - Rychlý start, produkce a pokročilé vzory nasazení
  - Pokyny pro monitorování, zabezpečení a optimalizaci nákladů

#### Externí příklady - Jednoduché aplikace (kapitoly 1-2)
**Naklonujte tato Azure Samples repozitáře pro začátek:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základní vzory nasazení
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasazení statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasazení REST API

#### Externí příklady - Integrace databází (kapitoly 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory připojení k databázi
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless datový workflow

#### Externí příklady - Pokročilé vzory (kapitoly 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Více-službová architektura
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Zpracování na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčně připravené ML vzory

### Externí kolekce šablon
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurátorská kolekce oficiálních a komunitních šablon
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentace šablon Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokální výukové příklady s podrobnými vysvětleními

---

## 📚 Učební zdroje a reference

### Rychlé odkazy
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Základní azd příkazy uspořádané podle kapitol
- [**Glossary**](resources/glossary.md) - Terminologie Azure a azd  
- [**FAQ**](resources/faq.md) - Běžné otázky uspořádané podle výukových kapitol
- [**Study Guide**](resources/study-guide.md) - Komplexní cvičení pro praxi

### Praktické workshopy
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Učiňte svá AI řešení nasaditelná pomocí AZD (2-3 hodiny)
- [**Interactive Workshop**](workshop/README.md) - 8 modulů vedených cvičení s MkDocs a GitHub Codespaces
  - Následuje: Úvod → Výběr → Ověření → Rozebrání → Konfigurace → Přizpůsobení → Odstranění → Závěr

### Externí učební zdroje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Dovednosti AI agenta pro váš editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otevřených dovedností agentů pro Azure AI, Foundry, nasazení, diagnostiku, optimalizaci nákladů a další. Nainstalujte je do GitHub Copilot, Cursor, Claude Code nebo jakéhokoli podporovaného agenta:
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
# Vyzkoušejte jiný region Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Nebo použijte menší SKU během vývoje
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Možnost 1: Vyčistit a zkusit znovu
azd down --force --purge
azd up

# Možnost 2: Jen opravit infrastrukturu
azd provision

# Možnost 3: Zkontrolovat podrobný stav
azd show

# Možnost 4: Zkontrolovat protokoly v Azure Monitoru
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Znovu ověřit
az logout
az login

azd auth logout
azd auth login

# Ověřit autentizaci
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generuje unikátní názvy, ale pokud dojde ke konfliktu:
azd down --force --purge

# Poté zopakujte s novým prostředím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Obvyklé doby čekání:**
- Jednoduchá webová aplikace: 5–10 minut
- Aplikace s databází: 10–15 minut
- AI aplikace: 15–25 minut (provisioning OpenAI je pomalý)

```bash
# Zkontrolujte průběh
azd show

# Pokud uvíznete déle než 30 minut, zkontrolujte portál Azure:
azd monitor
# Hledejte neúspěšná nasazení
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Zkontrolujte svou roli v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potřebujete alespoň roli „Contributor“
# Požádejte správce Azure o udělení:
# - Contributor (pro prostředky)
# - User Access Administrator (pro přiřazení rolí)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

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

### 📚 Plné zdroje pro řešení problémů

- **Průvodce běžnými problémy:** [Podrobná řešení](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy specifické pro AI:** [Řešení potíží s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Příručka ladění:** [Ladění krok za krokem](docs/chapter-07-troubleshooting/debugging.md)
- **Získejte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončení kurzu a certifikace

### Sledování postupu
Sledujte svůj postup v jednotlivých kapitolách:

- [ ] **Kapitola 1**: Základy & Rychlý start ✅
- [ ] **Kapitola 2**: AI-First vývoj ✅  
- [ ] **Kapitola 3**: Konfigurace & Ověřování ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód & Nasazení ✅
- [ ] **Kapitola 5**: AI řešení s více agenty ✅
- [ ] **Kapitola 6**: Přednasazovací validace & Plánování ✅
- [ ] **Kapitola 7**: Řešení problémů & Ladění ✅
- [ ] **Kapitola 8**: Produkční & Podnikové vzory ✅

### Ověření učení
Po dokončení každé kapitoly ověřte své znalosti takto:
1. **Praktické cvičení**: Dokončete praktické nasazení kapitoly
2. **Kontrola znalostí**: Projděte FAQ sekci pro vaši kapitolu
3. **Diskuze v komunitě**: Sdílejte své zkušenosti v Azure Discord
4. **Další kapitola**: Pokračujte na další úroveň složitosti

### Výhody absolvování kurzu
Po dokončení všech kapitol získáte:
- **Produkční zkušenost**: Nasadili jste reálné AI aplikace do Azure
- **Profesionální dovednosti**: Schopnosti nasazení připravené pro podnikové prostředí  
- **Uznání v komunitě**: Aktivní člen komunity vývojářů Azure
- **Kariérní postup**: Žádané znalosti AZD a nasazování AI

---

## 🤝 Komunita & Podpora

### Získejte pomoc a podporu
- **Technické problémy**: [Nahlásit chyby a požádat o funkce](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky k učení**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specifická pro AI**: Přidejte se k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentace**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postřehy komunity z Microsoft Foundry Discord

**Nedávné výsledky ankety z kanálu #Azure:**
- **45%** vývojářů chce používat AZD pro AI pracovní zátěže
- **Hlavní výzvy**: Nasazení více služeb, správa přihlašovacích údajů, připravenost pro produkci  
- **Nejčastěji požadované**: Šablony specifické pro AI, průvodce řešením problémů, osvědčené postupy

**Připojte se k naší komunitě a:**
- Sdílejte své zkušenosti s AZD + AI a získejte pomoc
- Získejte předběžné ukázky nových AI šablon
- Přispívejte k osvědčeným postupům pro nasazení AI
- Ovlivněte budoucí vývoj funkcí AI + AZD

### Přispívání do kurzu
Vítáme příspěvky! Přečtěte si náš [Průvodce přispíváním](CONTRIBUTING.md) pro podrobnosti o:
- **Vylepšení obsahu**: Vylepšete existující kapitoly a příklady
- **Nové příklady**: Přidejte reálné scénáře a šablony  
- **Překlady**: Pomozte udržovat vícejazyčnou podporu
- **Hlásení chyb**: Zlepšete přesnost a srozumitelnost
- **Standardy komunity**: Dodržujte naše zásady inkluzivní komunity

---

## 📄 Informace o kurzu

### Licence
Tento projekt je licencován pod licencí MIT - podrobnosti najdete v souboru [LICENSE](../../LICENSE).

### Související vzdělávací zdroje Microsoftu

Náš tým vytváří i další komplexní výukové kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pro začátečníky](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pro začátečníky](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pro začátečníky](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
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
 
### Základní kurzy
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot pro párované programování AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pro C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Dobrodružství](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigace kurzu

**🚀 Připraveno začít se učit?**

**Začátečníci**: Začněte s [Kapitola 1: Základy a Rychlý start](#-chapter-1-foundation--quick-start)  
**Vývojáři AI**: Přejděte na [Kapitola 2: Vývoj orientovaný na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Zkušení vývojáři**: Začněte s [Kapitola 3: Konfigurace a Autentizace](#️-chapter-3-configuration--authentication)

**Další kroky**: [Začněte kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědni za jakákoli nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->