# AZD pro začátečníky: Strukturovaná cesta učení

![AZD-pro-zacatecniky](../../translated_images/cs/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledující](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forků](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hvězd](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatické překlady (vždy aktuální)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabština](../ar/README.md) | [Bengálština](../bn/README.md) | [Bulharština](../bg/README.md) | [Barmština (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradiční, Hongkong)](../zh-HK/README.md) | [Čínština (tradiční, Macau)](../zh-MO/README.md) | [Čínština (tradiční, Tchaj-wan)](../zh-TW/README.md) | [Chorvatština](../hr/README.md) | [Čeština](./README.md) | [Dánština](../da/README.md) | [Nizozemština](../nl/README.md) | [Estonština](../et/README.md) | [Finština](../fi/README.md) | [Francouzština](../fr/README.md) | [Němčina](../de/README.md) | [Řečtina](../el/README.md) | [Hebrejština](../he/README.md) | [Hindština](../hi/README.md) | [Maďarština](../hu/README.md) | [Indonéština](../id/README.md) | [Italština](../it/README.md) | [Japonština](../ja/README.md) | [Kannadština](../kn/README.md) | [Khmerština](../km/README.md) | [Korejština](../ko/README.md) | [Litevština](../lt/README.md) | [Malajština](../ms/README.md) | [Malayalam](../ml/README.md) | [Maráthština](../mr/README.md) | [Nepálština](../ne/README.md) | [Nigerijský pidžin](../pcm/README.md) | [Norština](../no/README.md) | [Perština (Farsi)](../fa/README.md) | [Polština](../pl/README.md) | [Portugalština (Brazílie)](../pt-BR/README.md) | [Portugalština (Portugalsko)](../pt-PT/README.md) | [Paňdžábština (Gurmukhi)](../pa/README.md) | [Rumunština](../ro/README.md) | [Ruština](../ru/README.md) | [Srbština (cyrilice)](../sr/README.md) | [Slovenština](../sk/README.md) | [Slovinština](../sl/README.md) | [Španělština](../es/README.md) | [Svahilština](../sw/README.md) | [Švédština](../sv/README.md) | [Tagalog (Filipínština)](../tl/README.md) | [Tamilština](../ta/README.md) | [Telugština](../te/README.md) | [Thajština](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinština](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamština](../vi/README.md)

> **Raději klonovat lokálně?**
>
> Tento repozitář obsahuje překlady do více než 50 jazyků, což výrazně zvětšuje velikost stahování. Pro klonování bez překladů použijte sparse checkout:
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
> To vám poskytne vše potřebné pro dokončení kurzu s mnohem rychlejším stahováním.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co je dnes nového v azd

> 📌 **Revize vydání AI CLI (2026-11-04):** Pokyny byly ověřeny vůči publikované dokumentaci/zdrojům **`azd 1.37.2`**, **agents `1.0.0-beta.23`**, a **evaluations `1.0.0-beta.2`**. Použijte `azd >= 1.37.0` pro kombinovaný workflow. Spusťte `azd version` a [aktualizujte jádro CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) před rozšířeními. Viz [změny a opravy v releasu](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Nejedná se o ověření nasazení celého kurzu v živém provozu.

Azure Developer CLI podporuje mnoho typů aplikací, včetně webových aplikací, API a AI agentů, prostřednictvím podporovaných hostitelů, šablon a rozšíření.

Tady je, co to znamená pro vás:

- **AI agenti jsou nyní plnohodnotné pracovní zátěže azd.** Můžete inicializovat, nasazovat a spravovat projekty AI agentů pomocí stejného `azd init` → `azd up` workflow, které již znáte.
- **Životní cyklus agenta přes dvě rozšíření.** Použijte `azure.ai.agents` k inicializaci, vyvolání, optimalizaci a ukončení agentů. Nainstalujte **`azure.ai.evaluations`** samostatně pro `azd ai eval init`, `generate`, a `run start`. Beta agentů 22 nahradila starý evaluativní workflow a změnila konfiguraci optimalizace; řiďte se [migracím průvodcem](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Více AI stavebních bloků.** Nová náhledová rozšíření—`azure.ai.skills` a `azure.ai.connections`—umožňují spravovat znovupoužitelné dovednosti agentů a Foundry připojení přímo s azd.
- **Integrace Microsoft Foundry** přináší nasazení modelů, hostování agentů a konfiguraci AI služeb přímo do ekosystému azd šablon.
- **Plynulejší každodenní základy.** Nedávná vydání udělala `azd init` idempotentní (bezpečné opakování), `azd auth login` automaticky mazalo neplatné tokeny a přidalo přátelskou první výzvu k nastavení v `azd tool`.
- **Základní workflow se nezměnilo.** Ať už nasazujete todo aplikaci, mikroservis nebo multi-agentní AI řešení, příkazy jsou stejné.

> **Poznámka pro uživatele Aspire:** Microsoft nyní produkt jednoduše označuje jako **Aspire** (dříve ".NET Aspire"). Podpora Aspire v azd zůstává beze změny—změnil se pouze název.

Pokud jste azd už používali, podpora AI je přirozeným rozšířením—ne samostatným nástrojem nebo pokročilou cestou. Pokud začínáte, naučíte se jeden workflow, který funguje pro vše.

---

## 🚀 Co je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je přátelský nástroj příkazového řádku pro vývojáře, který usnadňuje nasazení aplikací do Azure. Místo ručního vytváření a propojení desítek Azure zdrojů můžete nasadit celé aplikace jediným příkazem.

### Kouzlo `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Šablona dodává konfiguraci aplikace a infrastruktury. Úspěšné nasazení stále vyžaduje podporované služby/modely, dostatečnou kvótu a oprávnění, správné vstupy a ověření nasazené aplikace. `azd up` automaticky nezajišťuje, že šablona je bezpečná, v souladu s předpisy nebo připravená na produkční provoz.

---

## ❓ Azure Developer CLI vs Azure CLI: Jaký je rozdíl?

To je nejčastější otázka začátečníků. Tady je jednoduchá odpověď:

| Funkce | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Správa jednotlivých Azure zdrojů | Nasazení kompletních aplikací |
| **Přístup** | Zaměřeno na infrastrukturu | Zaměřeno na aplikace |
| **Příklad** | `az webapp create --name myapp...` | `azd up` |
| **Náročnost učení** | Nutné znát Azure služby | Stačí znát svou aplikaci |
| **Nejlepší pro** | DevOps, infrastrukturu | Vývojáře, prototypování |

### Jednoduchá analogie

- **Azure CLI** je jako mít všechny nástroje na stavbu domu - kladiva, pily, hřeby. Můžete postavit cokoli, ale musíte znát stavebnictví.
- **Azure Developer CLI** je jako najmout si dodavatele - popíšete, co chcete, a on se postará o stavbu.

### Kdy který použít

| Scénář | Použijte tento |
|----------|----------|
| "Chci rychle nasadit svou webovou aplikaci" | `azd up` |
| "Potřebuji vytvořit pouze storage účet" | `az storage account create` |
| "Stavím kompletní AI aplikaci" | `azd init --template azure-search-openai-demo` |
| "Potřebuji ladit konkrétní Azure zdroj" | `az resource show` |
| "Chci nasadit do svého konfigurovaného produkčního prostředí" | Před `azd up --environment production` zkontrolujte konfiguraci, přístup, náklady a provozní pravidla |

### Fungují spolu!

AZD a Azure CLI mají samostatnou autentifikaci a konfiguraci. Použijte `azd auth login` pro AZD a `az login`, když je háček nebo diagnostický příkaz přímo pro Azure CLI. Můžete používat oba:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najděte šablony v Awesome AZD

Začněte už hotovým! **Awesome AZD** je komunitní kolekce šablon připravených k nasazení:

| Zdroj | Popis |
|----------|-------------|
| 🔗 [**Awesome AZD galerie**](https://azure.github.io/awesome-azd/) | Prohlédněte si 200+ šablon s nasazením na jedno kliknutí |
| 🔗 [**Přispějte šablonou**](https://github.com/Azure/awesome-azd/issues) | Přidejte svou vlastní šablonu komunitě |
| 🔗 [**GitHub repozitář**](https://github.com/Azure/awesome-azd) | Označte hvězdou a prozkoumejte zdrojový kód |

### Oblíbené AI šablony z Awesome AZD

Vyberte jednu šablonu v prázdném adresáři; níže uvedené příkazy jsou alternativy. Příkaz `.` inicializuje tento adresář.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Začínáme ve 3 krocích

Než začnete, ujistěte se, že váš počítač je připraven na šablonu, kterou chcete nasadit:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Pokud některá z kontrol selže, opravte ji nejdříve a pak pokračujte s rychlým startem.

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

### Krok 2: Ověřte se pro AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Pokud si nejste jisti, který typ potřebujete, projděte celý proces nastavení v [Instalace a Nastavení](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Nasazení první aplikace

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 To je vše!** Vaše aplikace je nyní živě na Azure.

### Úklid (nezapomeňte!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak používat tento kurz

Tento kurz je navržen pro **postupné učení** - začněte tam, kde se cítíte pohodlně, a pokračujte kupředu:

| Vaše zkušenost | Začněte zde |
|-----------------|------------|
| **Nováček v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Znát Azure, nový v AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chcete nasadit AI aplikace** | [Kapitola 2: AI-přístup v vývoji](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcete praktický nácvik** | [🎓 Interaktivní workshop](workshop/README.md) - 3-4 hodinový vedený lab |
| **Potřebujete produkční postupy** | [Kapitola 8: Produkce & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Rychlé nastavení

1. **Rozvětvěte tento repozitář**: [![GitHub forků](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získejte pomoc**: [Azure Discord komunita](https://discord.com/invite/ByRwuEEgH4)

> **Raději klonovat lokálně?**

> Tento repozitář obsahuje překlady do více než 50 jazyků, což výrazně zvětšuje velikost stahování. Pro klonování bez překladů použijte sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To vám poskytne vše potřebné pro dokončení kurzu s mnohem rychlejším stahováním.


## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Speciální zaměření na nasazení AI aplikací s integrací Microsoft Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Vývojáři nasazující AI pracovní zátěže často potřebují rady ohledně:
- Složitých více-službových AI architektur
- Nejlepších postupů pro produkční nasazení AI  
- Integrace a konfigurace Azure AI služeb
- Optimalizace nákladů pro AI pracovní zátěže
- Řešení problémů specifických pro nasazení AI

### Výukové cíle

Absolvováním tohoto strukturovaného kurzu:
- **Ovládnete základy AZD**: Základní koncepty, instalace a konfigurace
- **Nasadíte AI aplikace**: Použijete AZD s Microsoft Foundry službami
- **Implementujete infrastrukturu jako kód**: Správa Azure zdrojů pomocí Bicep šablon
- **Řešíte problémy s nasazením**: Odstraníte běžné chyby a ladíte problémy
- **Optimalizujete pro produkci**: Bezpečnost, škálování, monitoring a správa nákladů
- **Vytvoříte řešení s více agenty**: Nasadíte složité AI architektury

## Před začátkem: Účty, přístupy a předpoklady

Než začnete s kapitolou 1, ujistěte se, že máte připraveny následující věci. Kroky instalace v tomto průvodci předpokládají, že tyto základy již máte.

- **Předplatné Azure**: Můžete použít existující předplatné ze zaměstnání nebo svého účtu, nebo si vytvořit [bezplatnou zkušební verzi](https://aka.ms/azurefreetrial) pro začátek.
- **Oprávnění pro vytváření Azure zdrojů**: Pro většinu cvičení byste měli mít alespoň přístup **Přispěvatele** na cílovém předplatném nebo v resource group. Některé kapitoly také mohou vyžadovat možnost vytváření resource groups, spravovaných identit a RBAC přiřazení.
- [**GitHub účet**](https://github.com): Užitečný pro rozvětvení repozitáře, sledování vlastních změn a použití GitHub Codespaces pro workshop.
- **Požadavky na běhové prostředí šablon**: Některé šablony vyžadují lokální nástroje jako Node.js, Python, Java nebo Docker. Před začátkem spusťte validátor nastavení, abyste včas odhalili chybějící nástroje.
- **Základní znalost terminálu**: Nemusíte být expert, ale měli byste být pohodlní při spouštění příkazů jako `git clone`, `azd auth login` a `azd up`.

> **Pracujete v podnikové abonenci?**
> Pokud je vaše Azure prostředí spravováno administrátorem, potvrďte předem, že můžete nasazovat zdroje do předplatného či resource group, kterou chcete používat. Pokud ne, požádejte o sandboxové předplatné nebo přístup Přispěvatele ještě před začátkem.

> **Jste v Azure nováček?**
> Začněte u svého vlastního Azure trial nebo pay-as-you-go předplatného na https://aka.ms/azurefreetrial, abyste mohli cvičení absolvovat kompletně bez čekání na schválení na úrovni tenanta.

## 🗺️ Mapa kurzu: Rychlá navigace podle kapitol

Každá kapitola obsahuje samostatné README s výukovými cíli, rychlými začátky a cvičeními:

| Kapitola | Téma | Lekce | Doba trvání | Náročnost |
|---------|-------|---------|----------|------------|
| **[Kap 1: Základy](docs/chapter-01-foundation/README.md)** | Začátečník | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalace](docs/chapter-01-foundation/installation.md) &#124; [První projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI Vývoj](docs/chapter-02-ai-development/README.md)** | AI-First aplikace | [Integrace Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasazení modelů](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hod | ⭐⭐ |
| **[Kap 3: Konfigurace](docs/chapter-03-configuration/README.md)** | Autentizace & bezpečnost | [Konfigurace](docs/chapter-03-configuration/configuration.md) &#124; [Autentizace & bezpečnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & Nasazení | [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hod | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI agent řešení | [Retail scénář](examples/retail-scenario.md) &#124; [Koordinační vzory](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[Kap 6: Přednasazení](docs/chapter-06-pre-deployment/README.md)** | Plánování & Validace | [Preflight kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitní plánování](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hod | ⭐⭐ |
| **[Kap 7: Řešení problémů](docs/chapter-07-troubleshooting/README.md)** | Ladění & opravy | [Běžné chyby](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladění](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hod | ⭐⭐ |
| **[Kap 8: Produkce](docs/chapter-08-production/README.md)** | Vzory pro podniky | [Produkční postupy](docs/chapter-08-production/production-ai-practices.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktický lab | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výběr](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validace](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Rozebrání](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Ukončení](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Závěr](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hod | ⭐⭐ |

**Celková doba kurzu:** ~10-14 hodin | **Postup dovedností:** Začátečník → Připravený na produkci

---

## 📚 Výukové kapitoly

*Vyberte si svou učební cestu podle úrovně zkušeností a cílů*

### 🚀 Kapitola 1: Základy & Rychlý start
**Předpoklady**: Azure předplatné, základní znalost příkazové řádky  
**Doba trvání**: 30-45 minut  
**Náročnost**: ⭐

#### Co se naučíte
- Pochopení základů Azure Developer CLI
- Instalace AZD na vaší platformě
- První úspěšné nasazení

#### Výukové zdroje
- **🎯 Začněte zde**: [Co je Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Teorie**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Hlavní koncepty a terminologie
- **⚙️ Nastavení**: [Instalace & Nastavení](docs/chapter-01-foundation/installation.md) - Platformově specifické návody
- **🛠️ Prakticky**: [Váš první projekt](docs/chapter-01-foundation/first-project.md) - Podrobný tutoriál
- **📋 Rychlý přehled**: [Přehled příkazů](resources/cheat-sheet.md)

#### Praktická cvičení
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Výsledek kapitoly**: Úspěšně nasadit jednoduchou webovou aplikaci do Azure pomocí AZD

**✅ Ověření úspěchu:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Časová náročnost:** 30-45 minut  
**📈 Úroveň dovedností po dokončení:** Schopnost samostatně nasazovat základní aplikace

---

### 🤖 Kapitola 2: AI-First vývoj (doporučeno pro AI vývojáře)
**Předpoklady**: Dokončená kapitola 1  
**Doba trvání**: 1-2 hodiny  
**Náročnost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazení AI poháněných aplikací
- Pochopení konfigurace AI služeb

#### Výukové zdroje
- **🎯 Začněte zde**: [Integrace Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Průvodce AI agenti](docs/chapter-02-ai-development/agents.md) - Nasazení inteligentních agentů pomocí AZD
- **📖 Vzory**: [Nasazení AI modelů](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasazení a správa AI modelů
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Připravte svá AI řešení pro AZD
- **🎥 Interaktivní průvodce**: [Materiály Workshopu](workshop/README.md) - Výuka v prohlížeči s MkDocs * DevContainer prostředí
- **📋 Šablony**: [Microsoft Foundry šablony](#featured-microsoft-foundry-templates)
- **📝 Příklady**: [Příklady nasazení AZD](examples/README.md)

#### Praktická cvičení
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Výsledek kapitoly**: Nasadit a nakonfigurovat chatovou AI aplikaci s RAG možnostmi

**✅ Ověření úspěchu:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo .
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Časová náročnost:** 1-2 hodiny  
**📈 Úroveň dovedností po dokončení:** Schopnost nasadit AI učící aplikace a identifikovat další požadavky na produkční připravenost
**💰 Povědomí o nákladech:** Porozumění nákladům $80-150/měsíc na vývoj, $300-3500/měsíc na produkci

#### 💰 Úvahy o nákladech při AI nasazeních

**Vývojové prostředí (odhad $80-150/měsíc):**
- Microsoft Foundry Modely (Pay-as-you-go): $0-50/měsíc (dle spotřeby tokenů)
- AI Search (základní úroveň): $75/měsíc
- Container Apps (spotřeba): $0-20/měsíc
- Úložiště (standardní): $1-5/měsíc

**Produkční prostředí (odhad $300-3 500+/měsíc):**
- Microsoft Foundry Modely (PTU pro konzistentní výkon): $3 000+/měsíc NEBO Pay-as-you-go při vysokém objemu
- AI Search (standardní úroveň): $250/měsíc
- Container Apps (dedikované): $50-100/měsíc
- Application Insights: $5-50/měsíc
- Úložiště (prémiové): $10-50/měsíc

**💡 Tipy pro optimalizaci nákladů:**
- Zkontrolujte ceny za vyhodnocení modelu a kredity specifické pro účet; Azure OpenAI nezahrnuje univerzální měsíční bezplatnou kvótu 50 000 tokenů
- Spusťte `azd down` pro odstranění zdrojů, pokud již nejsou potřeba, po kontrole vybraného prostředí
- Začněte s účtováním podle spotřeby, přejděte na PTU pouze pro produkci
- Použijte `azd provision --preview` k prohlédnutí plánované infrastruktury, poté ocenění zdrojů v Azure Pricing Calculatoru
- Zapněte automatické škálování: plaťte pouze za skutečné využití

**Monitorování nákladů:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurace & Autentizace
**Předpoklady**: Dokončená kapitola 1  
**Doba trvání**: 45-60 minut  
**Náročnost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Nejlepší postupy autentizace a zabezpečení
- Pojmenování a organizace zdrojů

#### Výukové zdroje
- **📖 Konfigurace**: [Návod na konfiguraci](docs/chapter-03-configuration/configuration.md) - Nastavení prostředí
- **🔐 Bezpečnost**: [Vzor autentizace a spravované identity](docs/chapter-03-configuration/authsecurity.md) - Vzory autentizace
- **📝 Příklady**: [Příklad databázové aplikace](examples/database-app/README.md) - AZD databázové příklady

#### Praktická cvičení
- Konfigurace více prostředí (dev, staging, prod)
- Nastavení autentizace pomocí spravované identity
- Implementace konfigurací specifických pro prostředí

**💡 Výsledek kapitoly**: Spravovat více prostředí s patřičnou autentizací a bezpečností

---

### 🏗️ Kapitola 4: Infrastruktura jako kód & Nasazení
**Předpoklady**: Dokončené kapitoly 1-3  
**Doba trvání**: 1-1.5 hodiny  
**Náročnost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód s Bicep
- Strategie provisioningu zdrojů

#### Výukové zdroje
- **📖 Nasazení**: [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletní workflow
- **🏗️ Provisioning**: [Provisioning zdrojů](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure zdrojů
- **📝 Příklady**: [Příklad Container App](../../examples/container-app) - Nasazení kontejnerizovaných aplikací

#### Praktická cvičení
- Vytvoření vlastních Bicep šablon
- Nasazení více-službových aplikací
- Implementace blue-green strategií nasazení

**💡 Výsledek kapitoly**: Nasadit složité více-službové aplikace pomocí vlastních infrastrukturních šablon

---

### 🎯 Kapitola 5: Multi-Agent AI řešení (pokročilé)
**Předpoklady**: Dokončené kapitoly 1-2  
**Doba trvání**: 2-3 hodiny  
**Náročnost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory architektury s více agenty
- Orchestrace a koordinace agentů
- Produkčně připravená AI nasazení

#### Výukové zdroje
- **🤖 Doporučený design**: [Retail multi-agent řešení](examples/retail-scenario.md) - Architektonický plán, nikoli kompletní aplikace
- **🛠️ ARM šablony**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Kostra infrastruktury; zkontrolujte předpoklady a chybějící komponenty aplikace
- **📖 Architektura**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktická cvičení
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledek kapitoly**: Porozumět návrhu multi-agentů a identifikovat práci na implementaci, ověření a provozu potřebnou nad rámec infrastruktury

---

### 🔍 Kapitola 6: Před nasazením - validace a plánování
**Předpoklady**: Kapitola 4 dokončena  
**Doba trvání**: 1 hodina  
**Složitost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a validace zdrojů
- Strategie výběru SKU
- Předběžné kontroly a automatizace

#### Výukové zdroje
- **📊 Plánování**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validace zdrojů
- **💰 Výběr**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladově efektivní volby
- **✅ Validace**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktická cvičení
- Spustit skripty pro validaci kapacity
- Optimalizovat výběr SKU pro náklady
- Implementovat automatizované kontroly před nasazením

**💡 Výsledek kapitoly**: Validovat a optimalizovat deploymenty před spuštěním

---

### 🚨 Kapitola 7: Řešení problémů a ladění
**Předpoklady**: Dokončena libovolná kapitola o nasazení  
**Doba trvání**: 1-1,5 hodiny  
**Složitost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a řešení
- Řešení problémů specifických pro AI

#### Výukové zdroje
- **🔧 Běžné problémy**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a řešení
- **🕵️ Ladění**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Postupné strategie
- **🤖 AI problémy**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktická cvičení
- Diagnostikovat selhání nasazení
- Vyřešit problémy s autentizací
- Ladit konektivitu AI služeb

**💡 Výsledek kapitoly**: Samostatně diagnostikovat a vyřešit běžné problémy s nasazením

---

### 🏢 Kapitola 8: Produkční a firemní vzory
**Předpoklady**: Dokončeny kapitoly 1-4  
**Doba trvání**: 2-3 hodiny  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Produkční strategie nasazení
- Firemní bezpečnostní vzory
- Monitorování a optimalizace nákladů

#### Výukové zdroje
- **🏭 Produkce**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Firemní vzory
- **📝 Příklady**: [Microservices Example](../../examples/microservices) - Komplexní architektury
- **📊 Monitorování**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorování

#### Praktická cvičení
- Implementovat firemní bezpečnostní vzory
- Nastavit komplexní monitorování
- Nasadit do produkce s odpovídajícím řízením

**💡 Výsledek kapitoly**: Nasadit aplikace připravené pro produkční prostředí s plnou funkčností

---

## 🎓 Přehled workshopu: Praktická výuka

> **⚠️ STAV WORKSHOPU: Aktivní vývoj**  
> Materiály workshopu jsou momentálně vyvíjeny a dolaďovány. Základní moduly jsou funkční, ale některé pokročilé části jsou neúplné. Aktivně pracujeme na dokončení všeho obsahu. [Sledovat pokrok →](workshop/README.md)

### Interaktivní materiály workshopu
**Komplexní praktická výuka s nástroji přímo v prohlížeči a vedenými cvičeními**

Materiály workshopu poskytují strukturovanou a interaktivní výukovou zkušenost, která doplňuje kapitoly výše. Workshop je určen pro samostatné studium i vedené lekce.

#### 🛠️ Funkce workshopu
- **Prohlížečové rozhraní**: Kompletní workshop poháněný MkDocs s funkcemi vyhledávání, kopírování a motivů
- **Integrace GitHub Codespaces**: Nastavení vývojového prostředí na jedno kliknutí
- **Strukturovaná cesta učení**: 8 modulů vedených cvičeními (celkem 3-4 hodiny)
- **Postupná metodika**: Úvod → Výběr → Validace → Rozebrání → Konfigurace → Přizpůsobení → Ukončení → Závěr
- **Interaktivní prostředí DevContainer**: Přednastavené nástroje a závislosti

#### 📚 Struktura modulů workshopu
Workshop následuje **8-modulovou postupnou metodiku**, která vás provede zjišťováním až po mistrné nasazení:

| Modul | Téma | Co budete dělat | Doba trvání |
|--------|-------|----------------|----------|
| **0. Úvod** | Přehled workshopu | Pochopit cíle učení, předpoklady a strukturu workshopu | 15 min |
| **1. Výběr** | Objevování šablon | Prozkoumat AZD šablony a vybrat vhodnou AI šablonu pro váš scénář | 20 min |
| **2. Validace** | Nasazení a ověření | Nasadit šablonu s `azd up` a ověřit správnou infrastrukturu | 30 min |
| **3. Rozebrání** | Porozumět struktuře | Použít GitHub Copilot k průzkumu architektury šablony, Bicep souborů a uspořádání kódu | 30 min |
| **4. Konfigurace** | Hluboký ponor do azure.yaml | Zvládnout konfiguraci `azure.yaml`, životní cyklus a proměnné prostředí | 30 min |
| **5. Přizpůsobení** | Udělejte to svým | Povolit AI vyhledávání, trasování, vyhodnocování a přizpůsobit pro váš scénář | 45 min |
| **6. Ukončení** | Úklid | Bezpečně odprovisionovat zdroje pomocí `azd down --purge` | 15 min |
| **7. Závěr** | Další kroky | Projít dosažené výsledky, klíčové koncepty a pokračovat ve vzdělávání | 15 min |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Výstupy z workshopu
Po dokončení workshopu účastníci:
- **Nasadí produkční AI aplikace**: Použijí AZD s Microsoft Foundry službami
- **Ovládnou multi-agentní architektury**: Implementují koordinovaná AI agentní řešení
- **Implementují bezpečnostní best practices**: Nakonfigurují autentizaci a řízení přístupu
- **Optimalizují pro škálování**: Navrhnou nákladově efektivní a výkonné deploymenty
- **Řeší problémy s nasazením**: Samostatně vyřeší běžné problémy

#### 📖 Výukové zdroje workshopu
- **🎥 Interaktivní průvodce**: [Workshop Materials](workshop/README.md) - Výukové prostředí v prohlížeči
- **📋 Instrukce podle modulů**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Přehled workshopu a cíle
  - [1. Výběr](workshop/docs/instructions/1-Select-AI-Template.md) - Najít a vybrat AI šablony
  - [2. Validace](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadit a ověřit šablony
  - [3. Rozebrání](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Prozkoumat architekturu šablony
  - [4. Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) - Zvládnout azure.yaml
  - [5. Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) - Přizpůsobit pro váš scénář
  - [6. Ukončení](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ukončit a uklidit zdroje
  - [7. Závěr](workshop/docs/instructions/7-Wrap-up.md) - Shrnutí a další kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičení zaměřená na AI
- **💡 Rychlý start**: [Workshop Setup Guide](workshop/README.md#browser-based-guide) - Nastavení prostředí

**Ideální pro**: Firemní školení, univerzitní kurzy, samostudium a developerské bootcampy.

---

## 📖 Hluboký ponor: Možnosti AZD

Kromě základů AZD nabízí silné funkce pro produkční nasazení:

- **Nasazení založené na šablonách** - Použijte předpřipravené šablony pro běžné aplikační vzory
- **Infrastruktura jako kód** - Spravujte Azure zdroje pomocí Bicepu nebo Terraformu  
- **Integrované workflow** - Bezproblémové provisionování, nasazení a monitorování aplikací
- **Vývojářsky přívětivé** - Optimalizované pro produktivitu a zážitek vývojářů

### **AZD + Microsoft Foundry: Perfektní pro AI nasazení**

**Proč AZD pro AI řešení?** AZD řeší hlavní výzvy, kterým čelí AI vývojáři:

- **AI připravené šablony** - Předkonfigurované šablony pro Microsoft Foundry modely, Azure AI služby a ML zátěže
- **Bezpečné AI nasazení** - Vestavěné bezpečnostní vzory pro AI služby, API klíče a modelové endpointy  
- **Produkční AI vzory** - Best practices pro škálovatelné a nákladově efektivní AI aplikace
- **End-to-end AI workflow** - Od vývoje modelu po produkční nasazení s odpovídajícím monitorováním
- **Optimalizace nákladů** - Chytré přidělování zdrojů a škálovací strategie pro AI zátěže
- **Integrace s Microsoft Foundry** - Bezproblémové propojení s katalogem modelů a endpointy Microsoft Foundry

---

## 🎯 Knihovna šablon a příkladů

### Doporučené: Microsoft Foundry šablony
**Začněte zde, pokud nasazujete AI aplikace!**

> **Poznámka:** Tyto šablony demonstrují různé AI vzory. Některé jsou externí Azure Samples, jiné lokální implementace.

| Šablona | Kapitola | Složitost | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začínáme s AI chatem**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externí |
| [**Začínáme s AI agenty**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externí |
| [**Demo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (výchozí) + Storage | Externí |
| [**Rychlý start OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externí |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externí |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externí |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Navržená architektura a infrastruktura; vyžaduje implementaci aplikace | **Lokální plán** |

### Doporučené: Kompletní studijní scénáře
**Šablony aplikací připravených pro produkci spárované s učebními kapitolami**

| Šablona | Učební kapitola | Složitost | Klíčové učení |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základní AI vzory nasazení |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementace RAG s Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Chat založený na agentech a testy vyhodnocování specifické pro scénáře |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Framework agentů a volání funkcí |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Firemní orchestrací AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Multi-agentní architektura se zákaznickými a inventárními agenty |

### Typ učení podle příkladu

> **📌 Lokální vs. externí příklady:**  
> **Lokální příklady** (v tomto repozitáři) = Podívejte se do README příkladu o stavu implementace a předpokladech
> **Externí příklady** (Azure Samples) = Klonujte z odkazovaných repozitářů

#### Lokální příklady (připravené k použití)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Architektonický plán s ARM infrastrukturou
  - Navržené role zákaznického a inventárního agenta
  - Musí být implementováno a ověřeno monitorování, vyhodnocování a aplikační kód
  - Pouhé provisionování zdrojů nevytvoří funkční retail aplikaci

#### Lokální příklady - kontejnerové aplikace (kapitoly 2-5)
**Komplexní příklady nasazení kontejnerů v tomto repozitáři:**
- [**Příklady Container App**](examples/container-app/README.md) - Kompletní průvodce containerizovaným nasazením
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základní REST API s scale-to-zero
  - [Architektura mikroservis](../../examples/container-app/microservices) - Ukázkový příklad dvou služeb; produkční tvrdnutí je další práce
  - Vzory rychlého startu, produkční a pokročilá nasazení
  - Doporučení pro monitorování, bezpečnost a optimalizaci nákladů

#### Externí příklady - jednoduché aplikace (kapitoly 1-2)
**Klonujte tyto repozitáře Azure Samples pro začátek:**
- [Jednoduchá webová aplikace - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základní vzory nasazení
- [Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasazení statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasazení REST API

#### Externí příklady - integrace databází (kapitoly 3-4)  
- [Databázová aplikace - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory připojení k databázi
- [Funkce + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless datové workflow

#### Externí příklady - Pokročilé vzory (kapitoly 4-8)
- [Java mikroservisy](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury s více službami
- [Úlohy Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Zpracování na pozadí  
- [Podniková ML pipeline](https://github.com/Azure/mlops-v2) - Referenční vzory MLOps; není to vzor pro AZD

### Externí kolekce šablon
- [**Oficiální galerie šablon AZD**](https://azure.github.io/awesome-azd/) - Pečlivě vybraná kolekce oficiálních a komunitních šablon
- [**Šablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentace šablon Microsoft Learn
- [**Adresář příkladů**](examples/README.md) - Místní výukové příklady s podrobnými vysvětleními

---

## 📚 Výukové zdroje a odkazy

### Rychlé odkazy
- [**Přehled příkazů**](resources/cheat-sheet.md) - Základní příkazy azd uspořádané podle kapitol
- [**Glosář**](resources/glossary.md) - Terminologie Azure a azd  
- [**Často kladené dotazy**](resources/faq.md) - Časté otázky uspořádané podle kapitol
- [**Studijní průvodce**](resources/study-guide.md) - Komplexní praktická cvičení

### Praktické workshopy
- [**Workshop AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Upravte své AI řešení k nasazení pomocí AZD (2-3 hodiny)
- [**Interaktivní workshop**](workshop/README.md) - 8 modullů vedených cvičení s MkDocs a GitHub Codespaces
  - Sleduje: Úvod → Výběr → Validace → Deconstruction → Konfigurace → Přizpůsobení → Ukončení → Shrnutí

### Externí výukové zdroje
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulačka cen Azure](https://azure.microsoft.com/pricing/calculator/)
- [Stav Azure](https://status.azure.com/)

### Dovednosti AI agentů pro váš editor
- [**Microsoft Azure Skills na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otevřených dovedností agentů pro Azure AI, Foundry, nasazení, diagnostiku, optimalizaci nákladů a další. Instalujte je v GitHub Copilot, Cursor, Claude Code nebo jakémkoli podporovaném agentovi:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rychlý průvodce řešením problémů

**Běžné problémy, se kterými se začátečníci setkávají, a okamžitá řešení:**

<details>
<summary><strong>❌ "azd: příkaz nebyl nalezen"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Předplatné nenalezeno" nebo "Předplatné není nastaveno"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "Nedostatečný kvóta" nebo "Kvóta překročena"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" selhalo v polovině</strong></summary>

```bash
# Option 1: Inspect the error and retry after correcting its cause
azd show
azd up --debug

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentizace selhala" nebo "Token vypršel"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Zdroj již existuje" nebo konflikty pojmenování</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasazování šablony trvá příliš dlouho</strong></summary>

**Normální čekací doby:**
- Jednoduchá webová aplikace: 5-10 minut
- Aplikace s databází: 10-15 minut
- AI aplikace: 15-25 minut (Provízory OpenAI jsou pomalé)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Přístup odepřen" nebo "Zakázáno"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Nelze najít URL nasazené aplikace</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Kompletní zdroje pro řešení problémů

- **Průvodce běžnými problémy:** [Podrobné řešení](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy specifické pro AI:** [Řešení problémů AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Průvodce laděním:** [Krok za krokem ladění](docs/chapter-07-troubleshooting/debugging.md)
- **Získejte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončení kurzu a certifikace

### Sledování pokroku
Sledujte svůj učební pokrok v každé kapitole:

- [ ] **Kapitola 1**: Základy & Rychlý start ✅
- [ ] **Kapitola 2**: Vývoj zaměřený na AI ✅  
- [ ] **Kapitola 3**: Konfigurace & autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód & nasazení ✅
- [ ] **Kapitola 5**: AI řešení s více agenty ✅
- [ ] **Kapitola 6**: Validace a plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů & ladění ✅
- [ ] **Kapitola 8**: Produkční a podnikové vzory ✅

### Ověření znalostí
Po dokončení každé kapitoly ověřte své znalosti takto:
1. **Praktické cvičení**: Dokončete praktické nasazení z kapitoly
2. **Kontrola znalostí**: Projděte sekci FAQ vaší kapitoly
3. **Komunitní diskuse**: Sdílejte své zkušenosti na Azure Discord
4. **Další kapitola**: Pokračujte na další úroveň složitosti

### Výhody dokončení kurzu
Po dokončení všech kapitol získáte:
- **Produkční zkušenosti**: Nasazení reálných AI aplikací do Azure
- **Profesní dovednosti**: Schopnost nasazovat v enterprise prostředí  
- **Ocenění v komunitě**: Aktivní člen komunity Azure vývojářů
- **Kariérní růst**: Vysoko žádané znalosti AZD a AI nasazení

---

## 🤝 Komunita a podpora

### Získání pomoci a podpory
- **Technické problémy**: [Hlásit chyby a žádat o funkce](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky ke studiu**: [Microsoft Azure Discord komunita](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI specifická pomoc**: Připojte se k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentace**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Komunitní postřehy z Microsoft Foundry Discord

**Témata diskutovaná komunitou:**
- Nasazení více služeb, správa přístupů, připravenost do produkce
- AI specifické šablony, průvodce řešením problémů a osvědčené postupy

**Připojte se ke komunitě, abyste:**
- Sdíleli své zkušenosti s AZD + AI a získali pomoc
- Měli přístup k předběžným verzím nových AI šablon
- Přispívali k osvědčeným postupům nasazení AI
- Ovlivňovali budoucí vývoj funkcí AI + AZD

### Přispívání do kurzu
Vítáme přispění! Přečtěte si náš [Průvodce přispíváním](CONTRIBUTING.md) pro podrobnosti o:
- **Vylepšení obsahu**: Zlepšování existujících kapitol a příkladů
- **Nové příklady**: Přidávání reálných scénářů a šablon  
- **Překlady**: Pomoc s údržbou vícejazyčné podpory
- **Hlášení chyb**: Zvyšování přesnosti a srozumitelnosti
- **Standardy komunity**: Dodržujte naše inkluzivní komunitní zásady

---

## 📄 Informace o kurzu

### Licence
Tento projekt je licencován pod licencí MIT - viz soubor [LICENSE](../../LICENSE) pro podrobnosti.

### Související výukové zdroje Microsoftu

Náš tým vytváří další komplexní výukové kurzy:

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
 
### Série generativního AI
[![Generativní AI pro začátečníky](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základní učení
[![ML pro začátečníky](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science pro začátečníky](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI pro začátečníky](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kybernetická bezpečnost pro začátečníky](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webový vývoj pro začátečníky](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pro začátečníky](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Vývoj XR pro začátečníky](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot pro párové programování AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pro C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot dobrodružství](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigace kurzem

**🚀 Připraven začít se učit?**

**Začátečníci**: Začněte s [Kapitola 1: Základy & rychlý start](#-chapter-1-foundation--quick-start)  
**AI vývojáři**: Přejděte na [Kapitola 2: Vývoj zaměřený na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Zkušení vývojáři**: Začněte s [Kapitola 3: Konfigurace & autentizace](#️-chapter-3-configuration--authentication)

**Další kroky**: [Začněte kapitolu 1 - AZD základy](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->