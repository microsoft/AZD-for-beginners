# AZD pro začátečníky: Strukturovaná učební cesta

![AZD pro začátečníky](../../translated_images/cs/azdbeginners.5527441dd9f74068.webp) 

[![Sledující na GitHubu](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forky na GitHubu](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Hvězdy na GitHubu](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatizované překlady (vždy aktuální)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabština](../ar/README.md) | [Bengálština](../bn/README.md) | [Bulharština](../bg/README.md) | [Barmština (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradiční, Hong Kong)](../zh-HK/README.md) | [Čínština (tradiční, Macau)](../zh-MO/README.md) | [Čínština (tradiční, Taiwan)](../zh-TW/README.md) | [Chorvatština](../hr/README.md) | [Čeština](./README.md) | [Dánština](../da/README.md) | [Nizozemština](../nl/README.md) | [Estonština](../et/README.md) | [Finština](../fi/README.md) | [Francouzština](../fr/README.md) | [Němčina](../de/README.md) | [Řečtina](../el/README.md) | [Hebrejština](../he/README.md) | [Hindština](../hi/README.md) | [Maďarština](../hu/README.md) | [Indonéština](../id/README.md) | [Italština](../it/README.md) | [Japonština](../ja/README.md) | [Kannadština](../kn/README.md) | [Korejština](../ko/README.md) | [Litevština](../lt/README.md) | [Malajština](../ms/README.md) | [Malajalámština](../ml/README.md) | [Maráthština](../mr/README.md) | [Nepálština](../ne/README.md) | [Nigerijský pidžin](../pcm/README.md) | [Norština](../no/README.md) | [Perština (Farsi)](../fa/README.md) | [Polština](../pl/README.md) | [Portugalština (Brazílie)](../pt-BR/README.md) | [Portugalština (Portugalsko)](../pt-PT/README.md) | [Paňdžábština (Gurmukhi)](../pa/README.md) | [Rumunština](../ro/README.md) | [Ruština](../ru/README.md) | [Srbština (cyrilice)](../sr/README.md) | [Slovenština](../sk/README.md) | [Slovinština](../sl/README.md) | [Španělština](../es/README.md) | [Svahilština](../sw/README.md) | [Švédština](../sv/README.md) | [Tagalog (filipínština)](../tl/README.md) | [Tamilština](../ta/README.md) | [Telugština](../te/README.md) | [Thajština](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinština](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamština](../vi/README.md)

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
> To vám dá vše, co potřebujete k dokončení kurzu, s mnohem rychlejším stažením.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Co je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je přátelský nástroj příkazového řádku pro vývojáře, který usnadňuje nasazování aplikací do Azure. Místo ručního vytváření a propojování desítek Azure prostředků můžete nasadit celé aplikace jediným příkazem.

### Kouzlo `azd up`

```bash
# Tento jediný příkaz dělá všechno:
# ✅ Vytváří všechny Azure zdroje
# ✅ Konfiguruje sítě a zabezpečení
# ✅ Sestavuje váš aplikační kód
# ✅ Nasazuje do Azure
# ✅ Poskytuje vám funkční URL
azd up
```

**To je vše!** Žádné klikání v Azure Portalu, žádné složité ARM šablony k nejprve naučení, žádná ruční konfigurace - jen fungující aplikace na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: V čem je rozdíl?

To je nejčastější otázka, kterou si začátečníci kladou. Zde je jednoduchá odpověď:

| Funkce | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Správa jednotlivých Azure prostředků | Nasazení kompletních aplikací |
| **Zaměření** | Zaměřeno na infrastrukturu | Zaměřeno na aplikace |
| **Příklad** | `az webapp create --name myapp...` | `azd up` |
| **Křivka učení** | Je třeba znát Azure služby | Stačí znát svou aplikaci |
| **Nejvhodnější pro** | DevOps, infrastrukturu | Vývojáře, prototypování |

### Jednoduchá analogie

- **Azure CLI** je jako mít všechny nástroje na stavbu domu - kladiva, pily, hřebíky. Můžete postavit cokoliv, ale musíte rozumět stavbě.
- **Azure Developer CLI** je jako najmout si dodavatele - popíšete, co chcete, a oni zajistí výstavbu.

### Kdy použít který

| Scénář | Použijte |
|----------|----------|
| "Chci rychle nasadit svou webovou aplikaci" | `azd up` |
| "Potřebuji vytvořit pouze účet úložiště" | `az storage account create` |
| "Vyvíjím kompletní AI aplikaci" | `azd init --template azure-search-openai-demo` |
| "Potřebuji ladit konkrétní Azure prostředek" | `az resource show` |
| "Chci nasazení připravené do produkce během několika minut" | `azd up --environment production` |

### Pracují spolu!

AZD používá Azure CLI v pozadí. Můžete používat oba:
```bash
# Nasazení vaší aplikace pomocí AZD
azd up

# Poté dolaďte specifické zdroje pomocí Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najděte šablony v Awesome AZD

Nemusíte začínat od nuly! **Awesome AZD** je komunitní sbírka šablon připravených k nasazení:

| Resource | Description |
|----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Prohlédněte si 200+ šablon s nasazením jedním kliknutím |
| 🔗 [**Odeslat šablonu**](https://github.com/Azure/awesome-azd/issues) | Přispějte vlastní šablonou komunitě |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Dejte hvězdu a prozkoumejte zdrojový kód |

### Oblíbené AI šablony z Awesome AZD

```bash
# RAG chat s Azure OpenAI + AI vyhledávání
azd init --template azure-search-openai-demo

# Rychlá AI chat aplikace
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

### Krok 2: Přihlášení do Azure

```bash
azd auth login
```

### Krok 3: Nasadit svou první aplikaci

```bash
# Inicializace z šablony
azd init --template todo-nodejs-mongo

# Nasazení do Azure (vytvoří vše!)
azd up
```

**🎉 To je vše!** Vaše aplikace je nyní nasazena na Azure.

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
| **Zcela nový v Azure** | [Kapitola 1: Základy](../..) |
| **Znáte Azure, noví v AZD** | [Kapitola 1: Základy](../..) |
| **Chcete nasazovat AI aplikace** | [Kapitola 2: Vývoj orientovaný na AI](../..) |
| **Chcete praktické cvičení** | [🎓 Interaktivní workshop](workshop/README.md) - 3-4 hour guided lab |
| **Potřebujete produkční vzory** | [Kapitola 8: Produkce & Enterprise](../..) |

### Rychlé nastavení

1. **Vytvořte fork tohoto repozitáře**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získejte pomoc**: [Komunita Azure na Discordu](https://discord.com/invite/ByRwuEEgH4)

> **Dáváte přednost lokálnímu klonování?**
>
> Tento repozitář obsahuje více než 50 překladů, což výrazně zvětšuje velikost stahování. Pro klonování bez překladů použijte sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To vám dá vše, co potřebujete k dokončení kurzu, s mnohem rychlejším stažením.


## Přehled kurzu

Osvojte si Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní zaměření na nasazování AI aplikací s integrací Microsoft Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Na základě zjištění z komunity Microsoft Foundry Discord, **45 % vývojářů chce používat AZD pro AI pracovní zátěže**, ale naráží na potíže s:
- Komplexní AI architektury s více službami
- Produkčními postupy pro nasazení AI  
- Integrací a konfigurací Azure AI služeb
- Optimalizací nákladů pro AI pracovní zátěže
- Řešením problémů při nasazení specifických pro AI

### Cíle učení

Po dokončení tohoto strukturovaného kurzu budete:
- **Ovládnete základy AZD**: Základní koncepty, instalace a konfigurace
- **Nasadíte AI aplikace**: Používejte AZD se službami Microsoft Foundry
- **Implementujete infrastrukturu jako kód**: Spravujte Azure prostředky pomocí Bicep šablon
- **Odstraňování potíží při nasazení**: Řešení běžných problémů a ladění
- **Optimalizace pro produkci**: Bezpečnost, škálování, monitoring a řízení nákladů
- **Vytvoříte řešení s více agenty**: Nasazení složitých AI architektur

## 🗺️ Mapka kurzu: Rychlá navigace podle kapitol

Každá kapitola má věnovaný README s cíli učení, rychlými starty a cvičeními:

| Kapitola | Téma | Lekce | Doba trvání | Složitost |
|---------|-------|---------|----------|------------|
| **[Kapitola 1: Základy](docs/chapter-01-foundation/README.md)** | Začínáme | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalace](docs/chapter-01-foundation/installation.md) &#124; [První projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kapitola 2: Vývoj orientovaný na AI](docs/chapter-02-ai-development/README.md)** | AI-first aplikace | [Integrace Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasazení modelů AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Kapitola 3: Konfigurace](docs/chapter-03-configuration/README.md)** | Auth & Security | [Konfigurace](docs/chapter-03-configuration/configuration.md) &#124; [Autentizace & bezpečnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap. 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & Nasazení | [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Zřizování](docs/chapter-04-infrastructure/provisioning.md) | 1–1,5 hod. | ⭐⭐⭐ |
| **[Kap. 5: Víceagentové](docs/chapter-05-multi-agent/README.md)** | AI Agentní Řešení | [Retail Scenario](examples/retail-scenario.md) &#124; [Vzory koordinace](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2–3 hod. | ⭐⭐⭐⭐ |
| **[Kap. 6: Před nasazením](docs/chapter-06-pre-deployment/README.md)** | Plánování & Validace | [Předběžné kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hod. | ⭐⭐ |
| **[Kap. 7: Odstraňování problémů](docs/chapter-07-troubleshooting/README.md)** | Ladění & Oprava | [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladění](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1–1,5 hod. | ⭐⭐ |
| **[Kap. 8: Produkce](docs/chapter-08-production/README.md)** | Podnikové vzory | [Produkční postupy](docs/chapter-08-production/production-ai-practices.md) | 2–3 hod. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktický kurz | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výběr](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validace](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruct](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Odstranění infrastruktury](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Závěr](workshop/docs/instructions/7-Wrap-up.md) | 3–4 hod. | ⭐⭐ |

**Celková délka kurzu:** ~10–14 hodin | **Progres dovedností:** Začátečník → Produkčně připravený

---

## 📚 Studijní kapitoly

*Vyberte si studijní cestu podle úrovně zkušeností a cílů*

### 🚀 Kapitola 1: Základy & Rychlý start
**Předpoklady**: předplatné Azure, základní znalost příkazové řádky  
**Doba trvání**: 30–45 minut  
**Složitost**: ⭐

#### Co se naučíte
- Porozumění základům Azure Developer CLI
- Instalace AZD na vaší platformě
- Vaše první úspěšné nasazení

#### Studijní zdroje
- **🎯 Začněte zde**: [Co je Azure Developer CLI?](../..)
- **📖 Teorie**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Jádrové koncepty a terminologie
- **⚙️ Nastavení**: [Instalace & Nastavení](docs/chapter-01-foundation/installation.md) - Návody pro konkrétní platformy
- **🛠️ Prakticky**: [Váš první projekt](docs/chapter-01-foundation/first-project.md) - Krok za krokem
- **📋 Rychlá reference**: [Přehled příkazů](resources/cheat-sheet.md)

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
azd show                # Zobrazuje URL spuštěné aplikace
# Aplikace se otevře v prohlížeči a funguje
azd down --force --purge  # Odstraňuje prostředky
```

**📊 Časová náročnost:** 30–45 minut  
**📈 Úroveň dovedností po:** Dokáže samostatně nasadit základní aplikace

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

**📊 Časová náročnost:** 30–45 minut  
**📈 Úroveň dovedností po:** Dokáže samostatně nasadit základní aplikace

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (Doporučeno pro AI vývojáře)
**Předpoklady**: Kapitola 1 dokončena  
**Doba trvání**: 1–2 hodiny  
**Složitost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazování aplikací poháněných AI
- Porozumění konfiguracím AI služeb

#### Studijní zdroje
- **🎯 Začněte zde**: [Integrace Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Příručka AI agentů](docs/chapter-02-ai-development/agents.md) - Nasazení inteligentních agentů s AZD
- **📖 Vzory**: [Nasazení AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasazení a správa AI modelů
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Připravte svá AI řešení pro AZD
- **🎥 Interaktivní průvodce**: [Materiály workshopu](workshop/README.md) - Učení v prohlížeči s MkDocs * DevContainer prostředím
- **📋 Šablony**: [Šablony Microsoft Foundry](../..)
- **📝 Příklady**: [Příklady nasazení AZD](examples/README.md)

#### Praktická cvičení
```bash
# Nasadit svou první AI aplikaci
azd init --template azure-search-openai-demo
azd up

# Vyzkoušejte další AI šablony
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledek kapitoly**: Nasadit a nakonfigurovat chatovací aplikaci poháněnou AI s RAG funkcionalitou

**✅ Ověření úspěchu:**
```bash
# Po kapitole 2 byste měli být schopni:
azd init --template azure-search-openai-demo
azd up
# Otestovat rozhraní chatu s umělou inteligencí
# Pokládat otázky a získávat odpovědi poháněné AI s uvedenými zdroji
# Ověřit, že integrace vyhledávání funguje
azd monitor  # Zkontrolovat, že Application Insights zobrazuje telemetrii
azd down --force --purge
```

**📊 Časová náročnost:** 1–2 hodiny  
**📈 Úroveň dovedností po:** Dokáže nasadit a nakonfigurovat produkčně připravené AI aplikace  
**💰 Povědomí o nákladech:** Pochopit náklady $80–150/měsíc pro vývoj, $300–3500/měsíc pro produkci

#### 💰 Úvahy o nákladech pro nasazení AI

**Vývojové prostředí (odhadem $80–150/měsíc):**
- Azure OpenAI (Pay-as-you-go): $0–50/měsíc (podle použití tokenů)
- AI Search (Basic tier): $75/měsíc
- Container Apps (Consumption): $0–20/měsíc
- Storage (Standard): $1–5/měsíc

**Produkční prostředí (odhadem $300–3 500+/měsíc):**
- Azure OpenAI (PTU pro konzistentní výkon): $3 000+/měsíc NEBO Pay-as-you-go při vysokém objemu
- AI Search (Standard tier): $250/měsíc
- Container Apps (Dedicated): $50–100/měsíc
- Application Insights: $5–50/měsíc
- Storage (Premium): $10–50/měsíc

**💡 Tipy na optimalizaci nákladů:**
- Využijte **Free Tier** Azure OpenAI pro učení (50 000 tokenů/měsíc zahrnuto)
- Spusťte `azd down`, abyste uvolnili prostředky, když aktivně nevyvíjíte
- Začněte s fakturací podle spotřeby, přejděte na PTU jen pro produkci
- Použijte `azd provision --preview` k odhadu nákladů před nasazením
- Povolte auto-scaling: plaťte pouze za skutečné využití

**Monitorování nákladů:**
```bash
# Zkontrolujte odhadované měsíční náklady
azd provision --preview

# Sledujte skutečné náklady v portálu Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurace & Autentizace
**Předpoklady**: Kapitola 1 dokončena  
**Doba trvání**: 45–60 minut  
**Složitost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Autentizace a nejlepší postupy zabezpečení
- Pojmenovávání a organizace prostředků

#### Studijní zdroje
- **📖 Konfigurace**: [Příručka konfigurace](docs/chapter-03-configuration/configuration.md) - Nastavení prostředí
- **🔐 Bezpečnost**: [Autentizační vzory a managed identity](docs/chapter-03-configuration/authsecurity.md) - Auth vzory
- **📝 Příklady**: [Příklad databázové aplikace](examples/database-app/README.md) - AZD Database Examples

#### Praktická cvičení
- Nakonfigurujte více prostředí (dev, staging, prod)
- Nastavte autentizaci pomocí managed identity
- Implementujte konfigurace specifické pro prostředí

**💡 Výsledek kapitoly**: Spravovat více prostředí s řádnou autentizací a zabezpečením

---

### 🏗️ Kapitola 4: Infrastruktura jako kód & Nasazení
**Předpoklady**: Kapitoly 1–3 dokončeny  
**Doba trvání**: 1–1,5 hod.  
**Složitost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód s Bicep
- Strategie zřizování prostředků

#### Studijní zdroje
- **📖 Nasazení**: [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletní workflowy
- **🏗️ Zřizování**: [Zřizování prostředků](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure prostředků
- **📝 Příklady**: [Příklad Container App](../../examples/container-app) - Kontejnerová nasazení

#### Praktická cvičení
- Vytvořte vlastní Bicep šablony
- Nasadte víceservisní aplikace
- Implementujte blue-green deployment strategie

**💡 Výsledek kapitoly**: Nasadit složité víceservisní aplikace pomocí vlastních infrastrukturních šablon

---

### 🎯 Kapitola 5: Víceagentová AI řešení (Pokročilé)
**Předpoklady**: Kapitoly 1–2 dokončeny  
**Doba trvání**: 2–3 hodiny  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory architektury více agentů
- Orchestrace a koordinace agentů
- Nasazení AI připravené pro produkci

#### Studijní zdroje
- **🤖 Hlavní projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kompletní implementace
- **🛠️ ARM šablony**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Nasazení na jedno kliknutí
- **📖 Architektura**: [Vzory koordinace více agentů](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktická cvičení
```bash
# Nasadit kompletní maloobchodní řešení s více agenty
cd examples/retail-multiagent-arm-template
./deploy.sh

# Prozkoumat konfigurace agentů
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledek kapitoly**: Nasadit a spravovat produkčně připravené víceagentové AI řešení s agenty Customer a Inventory

---

### 🔍 Kapitola 6: Validace & Plánování před nasazením
**Předpoklady**: Kapitola 4 dokončena  
**Doba trvání**: 1 hod.  
**Složitost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a validace prostředků
- Strategie výběru SKU
- Předběžné kontroly a automatizace

#### Studijní zdroje
- **📊 Plánování**: [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Validace prostředků
- **💰 Výběr**: [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladově efektivní volby
- **✅ Validace**: [Předběžné kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktická cvičení
- Spusťte skripty pro validaci kapacity
- Optimalizujte výběr SKU z hlediska nákladů
- Implementujte automatizované kontroly před nasazením

**💡 Výsledek kapitoly**: Ověřit a optimalizovat nasazení před jeho provedením

---

### 🚨 Kapitola 7: Odstraňování problémů & Ladění
**Předpoklady**: Jakákoli kapitola o nasazení dokončena  
**Doba trvání**: 1–1,5 hod.  
**Složitost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a řešení
- Specifické řešení problémů pro AI

#### Studijní zdroje
- **🔧 Běžné problémy**: [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a řešení
- **🕵️ Ladění**: [Příručka ladění](docs/chapter-07-troubleshooting/debugging.md) - Krok za krokem
- **🤖 AI problémy**: [Řešení problémů specifických pro AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy AI služeb

#### Praktická cvičení
- Diagnostikujte selhání nasazení
- Vyřešte autentizační problémy
- Laděte konektivitu AI služeb

**💡 Výsledek kapitoly**: Samostatně diagnostikovat a vyřešit běžné problémy s nasazením

---

### 🏢 Kapitola 8: Produkce & Podnikové vzory
**Předpoklady**: Kapitoly 1–4 dokončeny  
**Doba trvání**: 2–3 hodiny  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie produkčního nasazení
- Podnikové bezpečnostní vzory
- Monitorování a optimalizace nákladů

#### Studijní zdroje
- **🏭 Produkce**: [Nejlepší postupy pro AI v produkci](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Příklady**: [Příklad mikroservis](../../examples/microservices) - Složité architektury
- **📊 Monitorování**: [Integrace Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorování

#### Praktická cvičení
- Implementujte podnikové bezpečnostní vzory
- Nastavte komplexní monitorování
- Nasadte do produkce s řádným řízením

**💡 Výsledek kapitoly**: Nasadit aplikace připravené pro podnikové provozování s plnou produkční funkcionalitou

---

## 🎓 Přehled workshopu: Praktická výuka

> **⚠️ STAV WORKSHOPU: Aktivní vývoj**
> Materiály workshopu jsou momentálně ve vývoji a dolaďování. Jádrové moduly fungují, ale některé pokročilé sekce jsou nekompletní. Aktivně pracujeme na dokončení veškerého obsahu. [Sledujte pokrok →](workshop/README.md)

### Interaktivní materiály workshopu
**Komplexní praktické učení s nástroji v prohlížeči a řízenými cvičeními**

Naše materiály workshopu poskytují strukturovaný, interaktivní zážitek z učení, který doplňuje výše uvedený kapitolu-vázaný učební plán. Workshop je navržen jak pro samostudium, tak pro vedené lekce instruktorem.

#### 🛠️ Funkce workshopu
- **Rozhraní v prohlížeči**: Kompletní workshop poháněný MkDocs s vyhledáváním, kopírováním a funkcemi témat
- **Integrace s GitHub Codespaces**: Nastavení vývojového prostředí jedním kliknutím
- **Strukturovaná učební cesta**: 8-modulová řízená cvičení (celkem 3–4 hodiny)
- **Postupná metodologie**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interaktivní DevContainer prostředí**: Předkonfigurované nástroje a závislosti

#### 📚 Struktura modulů workshopu
Workshop následuje **8-modulovou postupnou metodologii**, která vás provede od objevování k mistrovství nasazení:

| Modul | Téma | Co budete dělat | Doba trvání |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Porozumět cílům učení, předpokladům a struktuře workshopu | 15 min |
| **1. Selection** | Template Discovery | Prozkoumejte AZD šablony a vyberte správnou AI šablonu pro váš scénář | 20 min |
| **2. Validation** | Deploy & Verify | Nasadíte šablonu pomocí `azd up` a ověříte, že infrastruktura funguje | 30 min |
| **3. Deconstruction** | Understand Structure | Použijte GitHub Copilot k prozkoumání architektury šablony, Bicep souborů a uspořádání kódu | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Ovládněte konfiguraci `azure.yaml`, lifecycle hooky a proměnné prostředí | 30 min |
| **5. Customization** | Make It Yours | Povolit AI Search, sledování (tracing), evaluaci a přizpůsobit pro váš scénář | 45 min |
| **6. Teardown** | Clean Up | Bezpečně uvolněte prostředky pomocí `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Přehled dosaženého, klíčových konceptů a pokračování ve vašem vzdělávacím postupu | 15 min |

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
# V repozitáři klikněte na "Code" → "Create codespace on main"

# Možnost 2: Lokální vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podle pokynů pro nastavení v workshop/README.md
```

#### 🎯 Výstupy učení workshopu
Po dokončení workshopu účastníci:
- **Nasadit produkční AI aplikace**: Použít AZD s Microsoft Foundry službami
- **Ovládnout víceagentní architektury**: Implementovat koordinovaná řešení AI agentů
- **Implementovat bezpečnostní nejlepší postupy**: Nakonfigurovat autentizaci a řízení přístupu
- **Optimalizovat pro škálování**: Navrhovat nákladově efektivní a výkonná nasazení
- **Řešit problémy s nasazením**: Nezávisle vyřešit běžné problémy

#### 📖 Zdroje workshopu
- **🎥 Interaktivní průvodce**: [Workshop Materials](workshop/README.md) - Učení v prostředí prohlížeče
- **📋 Instrukce po modulech**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Přehled workshopu a cíle
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Najděte a vyberte AI šablony
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadit a ověřit šablony
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Prozkoumejte architekturu šablony
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládněte `azure.yaml`
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Přizpůsobte pro váš scénář
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Vyčistěte prostředky
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Shrnutí a další kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičení zaměřená na AI
- **💡 Rychlý start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfigurace prostředí

**Ideální pro**: firemní školení, univerzitní kurzy, samostudium a bootcampy pro vývojáře.

---

## 📖 Podrobný přehled: Schopnosti AZD

Nad rámec základů AZD nabízí silné funkce pro produkční nasazení:

- **Nasazení založené na šablonách** - Používejte předpřipravené šablony pro běžné vzory aplikací
- **Infrastruktura jako kód** - Spravujte zdroje Azure pomocí Bicep nebo Terraform  
- **Integrované pracovní postupy** - Bezproblémově zřizujte, nasazujte a monitorujte aplikace
- **Přátelské k vývojářům** - Optimalizované pro produktivitu a zkušenost vývojářů

### **AZD + Microsoft Foundry: Ideální pro AI nasazení**

**Proč AZD pro AI řešení?** AZD řeší hlavní výzvy, kterým čelí vývojáři AI:

- **Šablony připravené na AI** - Předkonfigurované šablony pro Azure OpenAI, Cognitive Services a ML pracovní zátěže
- **Bezpečná AI nasazení** - Vestavěné bezpečnostní vzory pro AI služby, API klíče a modelové koncové body  
- **Produkční AI vzory** - Osvědčené postupy pro škálovatelná, nákladově efektivní nasazení AI aplikací
- **End-to-End AI pracovní postupy** - Od vývoje modelu po produkční nasazení s náležitým monitorováním
- **Optimalizace nákladů** - Chytré přidělování zdrojů a strategie škálování pro AI zátěže
- **Integrace s Microsoft Foundry** - Plynulé propojení s katalogem modelů Microsoft Foundry a koncovými body

---

## 🎯 Knihovna šablon a příkladů

### Doporučené: Microsoft Foundry Templates
**Začněte zde, pokud nasazujete AI aplikace!**

> **Poznámka:** Tyto šablony demonstrují různé AI vzory. Některé jsou externí Azure Samples, jiné jsou lokální implementace.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Doporučené: Kompletní výukové scénáře
**Produkčně připravené šablony aplikací mapované na výukové kapitoly**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Základní vzory nasazení AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | Implementace RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Integrace Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agentní rámec a volání funkcí |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestrace |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Víceagentní architektura s agenty pro zákazníky a sklad |

### Učení podle typu příkladu

> **📌 Lokální vs. externí příklady:**  
> **Lokální příklady** (v tomto repozitáři) = Ihned připravené k použití  
> **Externí příklady** (Azure Samples) = Naklonujte z propojených repozitářů

#### Lokální příklady (připravené k použití)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletní produkčně připravená implementace s ARM šablonami
  - Víceagentní architektura (Customer + Inventory agenty)
  - Komplexní monitorování a evaluace
  - Nasazení jedním kliknutím přes ARM šablonu

#### Lokální příklady - Kontejnerové aplikace (Kapitoly 2-5)
**Komplexní příklady nasazení kontejnerů v tomto repozitáři:**
- [**Container App Examples**](examples/container-app/README.md) - Kompletní průvodce kontejnerizovaným nasazením
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Základní REST API se scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produkčně připravené nasazení více služeb
  - Rychlý start, produkční a pokročilé vzory nasazení
  - Monitorování, zabezpečení a doporučení pro optimalizaci nákladů

#### Externí příklady - Jednoduché aplikace (Kapitoly 1-2)
**Naklonujte tyto Azure Samples repozitáře pro začátek:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základní vzory nasazení
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasazení statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasazení REST API

#### Externí příklady - Integrace databází (Kapitoly 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory připojení k databázi
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless datové pracovní postupy

#### Externí příklady - Pokročilé vzory (Kapitoly 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury více služeb
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Zpracování na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčně připravené ML vzory

### Externí sbírky šablon
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurátorská kolekce oficiálních a komunitních šablon
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentace šablon Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokální výukové příklady s podrobnými vysvětleními

---

## 📚 Výukové zdroje a odkazy

### Rychlé odkazy
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Základní azd příkazy uspořádané podle kapitol
- [**Glossary**](resources/glossary.md) - Terminologie Azure a azd  
- [**FAQ**](resources/faq.md) - Často kladené otázky uspořádané podle výukových kapitol
- [**Study Guide**](resources/study-guide.md) - Komplexní cvičení pro praxi

### Praktické workshopy
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Udělejte svá AI řešení nasaditelnými pomocí AZD (2–3 hodiny)
- [**Interactive Workshop**](workshop/README.md) - 8-modulová řízená cvičení s MkDocs a GitHub Codespaces
  - Následuje: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up

### Externí vzdělávací zdroje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Rychlý průvodce řešením problémů

**Běžné problémy, kterým nováčci čelí, a okamžitá řešení:**

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
# Zobrazit dostupná předplatná
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
<summary><strong>❌ "InsufficientQuota" nebo "Quota exceeded"</strong></summary>

```bash
# Vyzkoušejte jinou oblast Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Nebo použijte menší SKU při vývoji
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" selže v polovině procesu</strong></summary>

```bash
# Možnost 1: Vyčistit a zkusit znovu
azd down --force --purge
azd up

# Možnost 2: Opravit pouze infrastrukturu
azd provision

# Možnost 3: Zkontrolovat podrobný stav
azd show

# Možnost 4: Zkontrolovat protokoly v Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" nebo "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" nebo konflikty názvů</strong></summary>

```bash
# AZD generuje jedinečná jména, ale pokud dojde ke konfliktu:
azd down --force --purge

# Pak to zopakujte s novým prostředím
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

# Pokud uvíznete déle než 30 minut, zkontrolujte Azure Portal:
azd monitor
# Hledejte neúspěšná nasazení
```
</details>

<details>
<summary><strong>❌ "Permission denied" nebo "Forbidden"</strong></summary>

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

# Nebo otevřít Azure Portal
azd monitor

# Zkontrolovat konkrétní službu
azd env get-values
# Hledat proměnné *_URL
```
</details>

### 📚 Kompletní zdroje řešení problémů

- **Průvodce běžnými problémy:** [Podrobná řešení](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy specifické pro AI:** [Řešení problémů s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Průvodce laděním:** [Ladění krok za krokem](docs/chapter-07-troubleshooting/debugging.md)
- **Získejte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončení kurzu a certifikace

### Sledování pokroku
Sledujte svůj pokrok v každé kapitole:

- [ ] **Kapitola 1**: Základy a rychlý start ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurace a ověřování ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód a nasazení ✅
- [ ] **Kapitola 5**: Víceagentová AI řešení ✅
- [ ] **Kapitola 6**: Ověření a plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů a ladění ✅
- [ ] **Kapitola 8**: Produkční a podnikové vzory ✅

### Ověření učení
Po dokončení každé kapitoly ověřte své znalosti takto:
1. **Praktické cvičení**: Dokončete praktické nasazení z kapitoly
2. **Kontrola znalostí**: Projděte sekci FAQ pro svou kapitolu
3. **Diskuse v komunitě**: Sdílejte své zkušenosti na Azure Discord
4. **Další kapitola**: Přesuňte se na další úroveň složitosti

### Výhody dokončení kurzu
Po dokončení všech kapitol získáte:
- **Produkční zkušenosti**: Nasazení reálných AI aplikací do Azure
- **Profesionální dovednosti**: Schopnosti nasazení připravené pro podnikové prostředí  
- **Uznání v komunitě**: Aktivní člen komunity Azure vývojářů
- **Kariérní postup**: Žádané zkušenosti s AZD a nasazením AI

---

## 🤝 Komunita a podpora

### Získejte pomoc a podporu
- **Technické problémy**: [Nahlásit chyby a požádat o funkce](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky ohledně učení**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specifická pro AI**: Připojte se k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentace**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postřehy komunity z Microsoft Foundry Discord

**Nedávné výsledky ankety z kanálu #Azure:**
- **45%** vývojářů chce používat AZD pro AI pracovní zátěže
- **Hlavní výzvy**: Nasazení více služeb, správa přihlašovacích údajů, připravenost do produkce  
- **Nejčastěji vyžadované**: Šablony specifické pro AI, průvodci řešením problémů, osvědčené postupy

**Připojte se k naší komunitě a:**
- Sdílejte své zkušenosti s AZD + AI a získejte pomoc
- Získejte přístup k raným náhledům nových AI šablon
- Přispívejte k osvědčeným postupům nasazení AI
- Ovlivněte budoucí vývoj funkcí AI + AZD

### Přispívání do kurzu
Vítáme příspěvky! Přečtěte si prosím náš [Průvodce přispíváním](CONTRIBUTING.md) pro podrobnosti o:
- **Vylepšení obsahu**: Vylepšujte stávající kapitoly a příklady
- **Nové příklady**: Přidejte reálné scénáře a šablony  
- **Překlady**: Pomozte udržovat podporu více jazyků
- **Hlášení chyb**: Zlepšujte přesnost a srozumitelnost
- **Standardy komunity**: Dodržujte naše inkluzivní komunitní zásady

---

## 📄 Informace o kurzu

### Licence
Tento projekt je licencován podle licence MIT - podrobnosti naleznete v souboru [LICENSE](../../LICENSE).

### Související výukové zdroje Microsoftu

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20pro%20za%C4%8Detn%C3%ADky-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20pro%20za%C4%8Detn%C3%ADky-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20pro%20za%C4%8Detn%C3%ADky-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20pro%20za%C4%8Detn%C3%ADky-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20pro%20za%C4%8Detn%C3%ADky-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20pro%20za%C4%8Detn%C3%ADky-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20pro%20za%C4%8Detn%C3%ADky-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20pro%20za%C4%8Detn%C3%ADky-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20pro%20za%C4%8Detn%C3%ADky-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Datov%C3%A1%20v%C4%9Bda%20pro%20za%C4%8Detn%C3%ADky-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20pro%20za%C4%8Detn%C3%ADky-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Kyberbezpe%C4%8Dnost%20pro%20za%C4%8Detn%C3%ADky-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20pro%20za%C4%8Detn%C3%ADky-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20pro%20za%C4%8Detn%C3%ADky-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20v%C3%BDvoj%20pro%20za%C4%8Detn%C3%ADky-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20pro%20p%C3%A1rov%C3%A9%20programov%C3%A1n%C3%AD%20s%20AI-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20pro%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigace kurzu

**🚀 Jste připraveni začít se učit?**

**Začátečníci**: Začněte s [Kapitola 1: Základy a rychlý start](../..)  
**Vývojáři AI**: Přejít na [Kapitola 2: Vývoj orientovaný na AI](../..)  
**Zkušení vývojáři**: Začněte s [Kapitola 3: Konfigurace a autentizace](../..)

**Další kroky**: [Začněte kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Upozornění:
Tento dokument byl přeložen pomocí AI překladové služby Co-op Translator (https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro kritické informace doporučujeme využít profesionálního lidského překladu. Nepřebíráme odpovědnost za jakákoli nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->