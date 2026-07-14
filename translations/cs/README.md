# AZD pro začátečníky: Strukturovaná učební cesta

![AZD-pro-zacatecniky](../../translated_images/cs/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledující](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hvězdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatické překlady (vždy aktuální)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabština](../ar/README.md) | [Bengálština](../bn/README.md) | [Bulharština](../bg/README.md) | [Barmský (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradiční, Hongkong)](../zh-HK/README.md) | [Čínština (tradiční, Macao)](../zh-MO/README.md) | [Čínština (tradiční, Taiwan)](../zh-TW/README.md) | [Chorvatština](../hr/README.md) | [Čeština](./README.md) | [Dánština](../da/README.md) | [Němčina](../nl/README.md) | [Estonština](../et/README.md) | [Finština](../fi/README.md) | [Francouzština](../fr/README.md) | [Němčina](../de/README.md) | [Řečtina](../el/README.md) | [Hebrejština](../he/README.md) | [Hindština](../hi/README.md) | [Maďarština](../hu/README.md) | [Indonéština](../id/README.md) | [Italština](../it/README.md) | [Japonština](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korejština](../ko/README.md) | [Litevština](../lt/README.md) | [Malajština](../ms/README.md) | [Malajalámština](../ml/README.md) | [Maráthština](../mr/README.md) | [Nepálština](../ne/README.md) | [Nigerijská pidžin](../pcm/README.md) | [Norština](../no/README.md) | [Perština (Fársí)](../fa/README.md) | [Polština](../pl/README.md) | [Portugalština (Brazílie)](../pt-BR/README.md) | [Portugalština (Portugalsko)](../pt-PT/README.md) | [Punjabi (Gurmukhí)](../pa/README.md) | [Rumunština](../ro/README.md) | [Ruština](../ru/README.md) | [Srbština (Cyrilice)](../sr/README.md) | [Slovenština](../sk/README.md) | [Slovinština](../sl/README.md) | [Španělština](../es/README.md) | [Svahilština](../sw/README.md) | [Švédština](../sv/README.md) | [Tagalog (Filipíny)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thajština](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinština](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamština](../vi/README.md)

> **Raději chcete klonovat lokálně?**
>
> Toto úložiště obsahuje přes 50 překladů jazyků, což výrazně zvyšuje velikost stahování. Pro klonování bez překladů použijte sparse checkout:
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
> To vám poskytne vše, co potřebujete ke kompletnímu kurzu s mnohem rychlejším stahováním.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co je nového v azd dnes

> 📌 Tento kurz je ověřen pro **`azd 1.27.1`** (červenec 2026). Spusťte `azd version` pro kontrolu verze a `azd upgrade` pro získání nejnovější verze.

Azure Developer CLI se rozrostl za hranice tradičních webových aplikací a API. Dnes je azd jediným nástrojem pro nasazení **jakékoliv** aplikace do Azure — včetně aplikací poháněných AI a inteligentních agentů.

Co to pro vás znamená:

- **AI agenti jsou nyní plnohodnotné zátěže v azd.** Můžete inicializovat, nasadit a spravovat projekty AI agentů stejným workflow `azd init` → `azd up`, které už znáte.
- **Úplný životní cyklus agenta přes CLI.** Rozšíření `azure.ai.agents` nyní pokrývá celou cestu — `azd ai agent init` pro scaffold, `azd ai agent invoke` pro testování (s výstupem časování odpovědí), `azd ai agent eval generate` a `azd ai agent optimize` pro měření a zlepšení kvality, a `azd ai agent delete` pro úklid.
- **Více stavebních bloků AI.** Nová preview rozšíření — `azure.ai.skills` a `azure.ai.connections` — umožňují spravovat znovupoužitelné dovednosti agentů a Foundry připojení přímo přes azd.
- **Integrace Microsoft Foundry** přináší nasazení modelů, hostování agentů a konfiguraci AI služeb přímo do ekosystému šablon azd.
- **Hladší každodenní základy.** Nedávné verze udělaly `azd init` idempotentní (bezpečné opakování), automaticky čistily zastaralé tokeny v `azd auth login` a přidaly přátelský úvodní průvodce `azd tool`.
- **Základní workflow se nezměnilo.** Ať už nasazujete todo app, mikroslužbu nebo multi-agentní AI řešení, příkazy jsou stejné.

> **Poznámka pro uživatele Aspire:** Microsoft nyní produkt označuje jednoduše jako **Aspire** (dříve ".NET Aspire"). Podpora azd pro Aspire zůstává stejná – změnil se pouze název.

Jestli jste azd už používali, podpora AI je přirozeným rozšířením — ne samostatným nástrojem nebo pokročilou sekcí. Pokud začínáte, naučíte se jeden workflow, který funguje pro všechno.

---

## 🚀 Co je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je vývojářsky přívětivý nástroj příkazové řádky, který zjednodušuje nasazení aplikací do Azure. Místo ručního vytváření a spojování desítek Azure zdrojů můžete nasadit celé aplikace jedním příkazem.

### Kouzlo příkazu `azd up`

```bash
# Tento jediný příkaz udělá vše:
# ✅ Vytvoří všechny Azure zdroje
# ✅ Nakonfiguruje síť a zabezpečení
# ✅ Postaví váš aplikační kód
# ✅ Nasadí do Azure
# ✅ Poskytne vám funkční URL
azd up
```

**To je vše!** Žádné klikání v Azure Portalu, žádné složité ARM šablony na naučení, žádná ruční konfigurace - jen funkční aplikace v Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Jaký je rozdíl?

Toto je nejčastější otázka začátečníků. Tady je jednoduchá odpověď:

| Funkce | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Správa jednotlivých Azure zdrojů | Nasazení kompletních aplikací |
| **Přístup** | Zaměřeno na infrastrukturu | Zaměřeno na aplikace |
| **Příklad** | `az webapp create --name myapp...` | `azd up` |
| **Křivka učení** | Musíte znát Azure služby | Stačí znát vaši aplikaci |
| **Nejlepší pro** | DevOps, infrastrukturu | Vývojáře, prototypování |

### Jednoduchá analogie

- **Azure CLI** je jako mít všechny nástroje na stavbu domu - kladiva, pily, hřebíky. Můžete postavit cokoli, ale musíte znát stavebnictví.
- **Azure Developer CLI** je jako najmout dodavatele - popíšete, co chcete, a oni to postaví za vás.

### Kdy použít který

| Scénář | Použít tento |
|----------|----------|
| „Chci rychle nasadit svou webovou aplikaci“ | `azd up` |
| „Potřebuji pouze vytvořit úložiště“ | `az storage account create` |
| „Stavím plnou AI aplikaci“ | `azd init --template azure-search-openai-demo` |
| „Potřebuji ladit konkrétní Azure zdroj“ | `az resource show` |
| „Chci během minut produkční nasazení“ | `azd up --environment production` |

### Spolu pracují!

AZD pod kapotou používá Azure CLI. Můžete oba používat:
```bash
# Nasazení vaší aplikace pomocí AZD
azd up

# Poté dolaďte konkrétní zdroje pomocí Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najděte šablony v Awesome AZD

nezačínejte od nuly! **Awesome AZD** je komunitní sbírka připravených šablon k nasazení:

| Zdroj | Popis |
|----------|-------------|
| 🔗 [**Awesome AZD galerii**](https://azure.github.io/awesome-azd/) | Prohlédněte si 200+ šablon s nasazením jedním kliknutím |
| 🔗 [**Přidejte šablonu**](https://github.com/Azure/awesome-azd/issues) | Přispějte vlastní šablonou komunitě |
| 🔗 [**GitHub úložiště**](https://github.com/Azure/awesome-azd) | Ohodnoťte hvězdou a prozkoumejte zdrojové kódy |

### Oblíbené AI šablony z Awesome AZD

```bash
# RAG chat s modely Microsoft Foundry + AI vyhledávání
azd init --template azure-search-openai-demo

# Rychlá AI chatovací aplikace
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agenty
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začínáme ve 3 krocích

Než začnete, ujistěte se, že váš počítač je připravený na šablonu, kterou chcete nasadit:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Pokud některá z požadovaných kontrol selže, nejprve ji opravte a pak pokračujte s rychlým startem.

### Krok 1: Instalace AZD (2 minuty)

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

### Krok 2: Autentizace pro AZD

```bash
# Volitelné, pokud plánujete v tomto kurzu používat příkazy Azure CLI přímo
az login

# Vyžadováno pro pracovní postupy AZD
azd auth login
```

Pokud si nejste jisti, kterou potřebujete, postupujte podle kompletního nastavení v [Instalace a nastavení](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Nasazení první aplikace

```bash
# Inicializovat z šablony
azd init --template todo-nodejs-mongo

# Nasadit do Azure (vytvoří vše!)
azd up
```

**🎉 To je vše!** Vaše aplikace je nyní živě na Azure.

### Úklid (nezapomeňte!)

```bash
# Odstraňte všechny zdroje po dokončení experimentování
azd down --force --purge
```

---

## 📚 Jak používat tento kurz

Tento kurz je navržen pro **postupné učení** – začněte tam, kde se cítíte komfortně, a postupujte dál:

| Vaše zkušenosti | Začít zde |
|-----------------|------------|
| **Úplný začátečník v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Znát Azure, ale nové v AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chcete nasadit AI aplikace** | [Kapitola 2: Vývoj s AI na prvním místě](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chcete praktické cvičení** | [🎓 Interaktivní workshop](workshop/README.md) - 3-4 hodinová vedená laboratoř |
| **Potřebujete produkční vzory** | [Kapitola 8: Produkční a podnikové vzory](#-chapter-8-production--enterprise-patterns) |

### Rychlé nastavení

1. **Forkněte tento repozitář**: [![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získejte pomoc**: [Azure Discord komunita](https://discord.com/invite/ByRwuEEgH4)

> **Raději chcete klonovat lokálně?**

> Toto úložiště obsahuje přes 50 překladů jazyků, což výrazně zvyšuje velikost stahování. Pro klonování bez překladů použijte sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To vám poskytne vše, co potřebujete ke kompletnímu kurzu s mnohem rychlejším stahováním.


## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní zaměření na nasazení AI aplikací s integrací Microsoft Foundry.**


### Proč je tento kurz nezbytný pro moderní vývojáře

Na základě poznatků ze komunity Microsoft Foundry Discord chce **45 % vývojářů používat AZD pro AI pracovní zátěže**, ale setkávají se s problémy:
- Složitými více-službovými AI architekturami
- Nejlepšími postupy nasazení AI do produkce  
- Integrací a konfigurací služeb Azure AI
- Optimalizací nákladů na AI pracovní zátěže
- Řešením specifických problémů nasazení AI

### Výukové cíle

Absolvováním tohoto strukturovaného kurzu:
- **Ovládnete základy AZD**: Základní koncepty, instalace a konfigurace
- **Nasadíte AI aplikace**: Použijete AZD se službami Microsoft Foundry
- **Implementujete infrastrukturu jako kód**: Správa prostředků Azure pomocí šablon Bicep
- **Řešíte problémy s nasazením**: Odstraňování běžných chyb a ladění problémů
- **Optimalizujete pro produkci**: Bezpečnost, škálování, monitoring a řízení nákladů
- **Vytvoříte multi-agentní řešení**: Nasadíte složité AI architektury

## Než začnete: Účty, přístupy a předpoklady

Než začnete kapitolu 1, ujistěte se, že máte vše připraveno. Kroky instalace později v tomto průvodci vycházejí z předpokladu, že tyto základy jsou již zajištěny.

- **Předplatné Azure**: Můžete použít existující předplatné z práce nebo vlastního účtu, nebo vytvořit si [bezplatnou zkušební verzi](https://aka.ms/azurefreetrial) pro start.
- **Oprávnění pro vytváření prostředků Azure**: Pro většinu cvičení byste měli mít alespoň přístup **Spolupracovníka** k cílovému předplatnému nebo skupině prostředků. Některé kapitoly také předpokládají možnost vytvářet skupiny prostředků, spravované identity a RBAC přiřazení.
- [**Účet GitHub**](https://github.com): Užitečný pro forkování repozitáře, sledování vlastních změn a použití GitHub Codespaces během workshopu.
- **Požadavky na běhové prostředí šablon**: Některé šablony vyžadují lokální nástroje jako Node.js, Python, Java nebo Docker. Spusťte validátor nastavení dříve, abyste včas odhalili chybějící nástroje.
- **Základní znalost terminálu**: Nemusíte být expert, ale měli byste být pohodlní při používání příkazů jako `git clone`, `azd auth login` a `azd up`.

> **Pracujete v podnikových předplatných?**
> Pokud je vaše prostředí Azure spravováno administrátorem, dopředu si ověřte, že můžete nasazovat prostředky v předplatném nebo skupině prostředků, kterou plánujete použít. Pokud ne, požádejte o testovací předplatné nebo přístup Spolupracovníka před zahájením.

> **Jste v Azure noví?**
> Začněte s vlastním Azure trial nebo předplatným pay-as-you-go na https://aka.ms/azurefreetrial, abyste mohli dokončit cvičení kompletně bez čekání na schválení na úrovni tenanta.

## 🗺️ Mapa kurzu: Rychlá navigace podle kapitol

Každá kapitola má vlastní README s výukovými cíli, rychlými starty a cvičeními:

| Kapitola | Téma | Lekce | Doba | Náročnost |
|---------|-------|---------|----------|------------|
| **[Kap 1: Základy](docs/chapter-01-foundation/README.md)** | Začínáme | [AZD Základy](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalace](docs/chapter-01-foundation/installation.md) &#124; [První projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: Vývoj AI](docs/chapter-02-ai-development/README.md)** | AI-First aplikace | [Integrace Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasazení modelů](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hod | ⭐⭐ |
| **[Kap 3: Konfigurace](docs/chapter-03-configuration/README.md)** | Autentizace & Bezpečnost | [Konfigurace](docs/chapter-03-configuration/configuration.md) &#124; [Autentizace & Bezpečnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & Nasazení | [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hod | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agentní řešení | [Scénář Retail](examples/retail-scenario.md) &#124; [Koordinační vzory](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[Kap 6: Před nasazením](docs/chapter-06-pre-deployment/README.md)** | Plánování & Validace | [Kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánování kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Volba SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hod | ⭐⭐ |
| **[Kap 7: Řešení problémů](docs/chapter-07-troubleshooting/README.md)** | Ladění & opravy | [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladění](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hod | ⭐⭐ |
| **[Kap 8: Produkce](docs/chapter-08-production/README.md)** | Podnikové vzory | [Produkční postupy](docs/chapter-08-production/production-ai-practices.md) | 2-3 hod | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktický lab | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výběr](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validace](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Rozbor](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Zrušení](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Závěr](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hod | ⭐⭐ |

**Celková doba kurzu:** ~10-14 hodin | **Úroveň:** Začátečník → Produkčně připravený

---

## 📚 Výukové kapitoly

*Vyberte si svou cestu podle úrovně zkušeností a cílů*

### 🚀 Kapitola 1: Základy & Rychlý start
**Předpoklady**: předplatné Azure, základní znalost příkazové řádky  
**Doba trvání**: 30-45 minut  
**Náročnost**: ⭐

#### Co se naučíte
- Porozumění základům Azure Developer CLI
- Instalace AZD na vaší platformě
- Vaše první úspěšné nasazení

#### Výukové materiály
- **🎯 Začněte zde**: [Co je Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorie**: [AZD Základy](docs/chapter-01-foundation/azd-basics.md) - Základní koncepty a terminologie
- **⚙️ Nastavení**: [Instalace a nastavení](docs/chapter-01-foundation/installation.md) - Průvodce podle platformy
- **🛠️ Prakticky**: [Váš první projekt](docs/chapter-01-foundation/first-project.md) - Krok za krokem
- **📋 Rychlá reference**: [Cheat Sheet příkazů](resources/cheat-sheet.md)

#### Praktická cvičení
```bash
# Rychlá kontrola instalace
azd version

# Nasadit vaši první aplikaci
azd init --template todo-nodejs-mongo
azd up
```

**💡 Výsledek kapitoly**: Úspěšně nasadit jednoduchou webovou aplikaci do Azure pomocí AZD

**✅ Ověření úspěchu:**
```bash
# Po dokončení kapitoly 1 byste měli být schopni:
azd version              # Zobrazuje nainstalovanou verzi
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasazuje na Azure
azd show                # Zobrazuje URL běžící aplikace
# Aplikace se otevře v prohlížeči a funguje
azd down --force --purge  # Uklízí zdroje
```

**📊 Časová investice:** 30-45 minut  
**📈 Úroveň po dokončení:** Dokáže samostatně nasadit základní aplikace
**📈 Úroveň po dokončení:** Dokáže samostatně nasadit základní aplikace

---

### 🤖 Kapitola 2: Vývoj AI-First (Doporučeno pro AI vývojáře)
**Předpoklady**: Dokončena kapitola 1  
**Doba trvání**: 1-2 hodiny  
**Náročnost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazování AI aplikací
- Porozumění konfiguracím AI služeb

#### Výukové materiály
- **🎯 Začněte zde**: [Integrace Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenti**: [Průvodce AI agenty](docs/chapter-02-ai-development/agents.md) - Nasazení inteligentních agentů s AZD
- **📖 Vzory**: [Nasazení AI modelů](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasazení a správa AI modelů
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Připravte svá AI řešení na AZD
- **🎥 Interaktivní průvodce**: [Materiály workshopu](workshop/README.md) - Výuka v prohlížeči s MkDocs * DevContainer prostředí
- **📋 Šablony**: [Šablony Microsoft Foundry](#zdrojové-materiály-workshopu)
- **📝 Příklady**: [Příklady nasazení AZD](examples/README.md)

#### Praktická cvičení
```bash
# Nasazení vaší první AI aplikace
azd init --template azure-search-openai-demo
azd up

# Vyzkoušejte další AI šablony
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledek kapitoly**: Nasadit a nakonfigurovat AI-chatovou aplikaci s funkcí RAG

**✅ Ověření úspěchu:**
```bash
# Po kapitole 2 byste měli být schopni:
azd init --template azure-search-openai-demo
azd up
# Otestovat rozhraní AI chatu
# Klást otázky a získávat odpovědi poháněné AI s uvedením zdrojů
# Ověřit, že integrace vyhledávání funguje
azd monitor  # Zkontrolovat, zda Application Insights zobrazuje telemetrii
azd down --force --purge
```

**📊 Časová investice:** 1-2 hodiny  
**📈 Úroveň po dokončení:** Dokáže nasadit a konfigurovat produkčně připravené AI aplikace  
**💰 Povědomí o nákladech:** Chápe vývojové náklady $80-150/měsíc, náklady na produkci $300-3500/měsíc

#### 💰 Úvahy o nákladech pro nasazení AI

**Vývojové prostředí (odhad $80-150/měsíc):**
- Microsoft Foundry modely (Pay-as-you-go): $0-50/měsíc (dle využití tokenů)
- AI Search (základní úroveň): $75/měsíc
- Container Apps (spotřeba): $0-20/měsíc
- Úložiště (standardní): $1-5/měsíc

**Produkční prostředí (odhad $300-3,500+/měsíc):**
- Microsoft Foundry modely (PTU pro konzistentní výkon): $3,000+/měsíc NEBO Pay-as-you-go při vysokém objemu
- AI Search (standardní úroveň): $250/měsíc
- Container Apps (dedikované): $50-100/měsíc
- Application Insights: $5-50/měsíc
- Úložiště (prémiové): $10-50/měsíc

**💡 Tipy na optimalizaci nákladů:**
- Používejte **bezplatnou vrstvu** Microsoft Foundry modelů pro učení (Azure OpenAI 50 000 tokenů/měsíc zahrnuto)
- Spouštějte `azd down` k uvolnění prostředků, když nevyvíjíte
- Začněte s účtováním podle spotřeby, přejděte na PTU jen pro produkci
- Použijte `azd provision --preview` k odhadu nákladů před nasazením
- Zapněte automatické škálování: plaťte pouze za skutečné využití

**Sledování nákladů:**
```bash
# Zkontrolujte odhadované měsíční náklady
azd provision --preview

# Sledujte skutečné náklady v Azure Portálu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurace & Autentizace
**Předpoklady**: Dokončena kapitola 1  
**Doba trvání**: 45-60 minut  
**Náročnost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Nejlepší postupy autentizace a zabezpečení
- Pojmenování a organizace prostředků

#### Výukové materiály
- **📖 Konfigurace**: [Průvodce konfigurací](docs/chapter-03-configuration/configuration.md) - Nastavení prostředí
- **🔐 Bezpečnost**: [Vzorové autentizační vzory a spravované identity](docs/chapter-03-configuration/authsecurity.md) - Autentizační vzory
- **📝 Příklady**: [Příklad databázové aplikace](examples/database-app/README.md) - AZD příklady databáze

#### Praktická cvičení
- Konfigurace více prostředí (dev, staging, prod)
- Nastavení autentizace spravovanou identitou
- Implementace konfigurací specifických pro prostředí

**💡 Výsledek kapitoly**: Spravovat více prostředí se správnou autentizací a zabezpečením

---

### 🏗️ Kapitola 4: Infrastruktura jako kód & Nasazení
**Předpoklady**: Dokončeny kapitoly 1-3  
**Doba trvání**: 1-1.5 hodiny  
**Náročnost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód pomocí Bicep
- Strategie provisioningu prostředků

#### Výukové materiály
- **📖 Nasazení**: [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletní workflow
- **🏗️ Provisioning**: [Provisioning prostředků](docs/chapter-04-infrastructure/provisioning.md) - Správa prostředků Azure
- **📝 Příklady**: [Příklad Container App](../../examples/container-app) - Kontejnerová nasazení

#### Praktická cvičení
- Vytvoření vlastních Bicep šablon
- Nasazení více-službových aplikací
- Implementace blue-green nasazovacích strategií

**💡 Výsledek kapitoly**: Nasadit složité více-službové aplikace pomocí vlastních infrastrukturních šablon

---


### 🎯 Kapitola 5: Řešení Multi-Agent AI (Pokročilé)
**Požadavky**: Dokončeny kapitoly 1-2  
**Délka**: 2-3 hodiny  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory architektury více agentů
- Orchestrace a koordinace agentů
- Nasazení AI připravených pro produkci

#### Učební zdroje
- **🤖 Doporučený projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kompletní implementace
- **🛠️ ARM šablony**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Nasazení jedním kliknutím
- **📖 Architektura**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktická cvičení
```bash
# Nasadit kompletní maloobchodní řešení s více agenty
cd examples/retail-multiagent-arm-template
./deploy.sh

# Prozkoumat konfigurace agentů
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledek kapitoly**: Nasadit a spravovat produkční multi-agentní AI řešení s agenty pro zákazníka a inventář

---

### 🔍 Kapitola 6: Validace a plánování před nasazením
**Požadavky**: Dokončena kapitola 4  
**Délka**: 1 hodina  
**Složitost**: ⭐⭐

#### Co se naučíte
- Kapacitní plánování a validace zdrojů
- Strategie výběru SKU
- Kontroly před nasazením a automatizace

#### Učební zdroje
- **📊 Plánování**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validace zdrojů
- **💰 Výběr**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladově efektivní volby
- **✅ Validace**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktická cvičení
- Spustit skripty na validaci kapacity
- Optimalizovat výběr SKU pro náklady
- Implementovat automatizované kontroly před nasazením

**💡 Výsledek kapitoly**: Validovat a optimalizovat nasazení před realizací

---

### 🚨 Kapitola 7: Řešení problémů a ladění
**Požadavky**: Dokončena jakákoliv kapitola o nasazení  
**Délka**: 1-1.5 hodiny  
**Složitost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Časté problémy a řešení
- Řešení problémů specifických pro AI

#### Učební zdroje
- **🔧 Časté problémy**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a řešení
- **🕵️ Ladění**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Krok za krokem strategie
- **🤖 AI problémy**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy AI služeb

#### Praktická cvičení
- Diagnostikovat chyby nasazení
- Vyřešit problémy s autentizací
- Ladit konektivitu AI služeb

**💡 Výsledek kapitoly**: Samostatně diagnostikovat a vyřešit běžné problémy s nasazením

---

### 🏢 Kapitola 8: Produkční a podnikové vzory
**Požadavky**: Dokončeny kapitoly 1-4  
**Délka**: 2-3 hodiny  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie produkčního nasazení
- Podnikové bezpečnostní vzory
- Monitorování a optimalizace nákladů

#### Učební zdroje
- **🏭 Produkce**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Příklady**: [Microservices Example](../../examples/microservices) - Složité architektury
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorování

#### Praktická cvičení
- Implementovat podnikové bezpečnostní vzory
- Nastavit komplexní monitorování
- Nasadit do produkce s řádnou správou

**💡 Výsledek kapitoly**: Nasadit aplikace připravené pro podnik s plnou produkční funkcionalitou

---

## 🎓 Přehled workshopu: Praktická výuka

> **⚠️ STAV WORKSHOPU: Aktivní vývoj**  
> Materiály workshopu jsou aktuálně ve vývoji a doladění. Hlavní moduly jsou funkční, ale některé pokročilé části nejsou dokončeny. Aktivně pracujeme na kompletním obsahu. [Sledovat pokrok →](workshop/README.md)

### Interaktivní materiály workshopu
**Komplexní praktické učení s nástroji v prohlížeči a vedenými cvičeními**

Materiály workshopu poskytují strukturovaný, interaktivní vzdělávací zážitek, který doplňuje výše uvedený sylabus podle kapitol. Workshop je navržen jak pro samostatné studium, tak pro výuku s lektorem.

#### 🛠️ Funkce workshopu
- **Rozhraní v prohlížeči**: Kompletní workshop poháněný MkDocs s vyhledáváním, kopírováním a tématy
- **Integrace GitHub Codespaces**: Jedním kliknutím nastavení vývojového prostředí
- **Strukturovaná výuková cesta**: 8 modulů vedených cvičením (celkem 3-4 hodiny)
- **Progresivní metodologie**: Úvod → Výběr → Validace → Rozložení → Konfigurace → Přizpůsobení → Ukončení → Shrnutí
- **Interaktivní DevContainer prostředí**: Přednastavené nástroje a závislosti

#### 📚 Struktura modulů workshopu
Workshop sleduje **8-modulovou progresivní metodologii**, která vás provede od objevení k mistrovství nasazení:

| Modul | Téma | Co budete dělat | Délka |
|--------|-------|----------------|----------|
| **0. Úvod** | Přehled workshopu | Pochopit vzdělávací cíle, požadavky a strukturu workshopu | 15 min |
| **1. Výběr** | Objevování šablon | Prozkoumat AZD šablony a vybrat správnou AI šablonu pro váš scénář | 20 min |
| **2. Validace** | Nasazení & ověření | Nasadit šablonu pomocí `azd up` a ověřit funkčnost infrastruktury | 30 min |
| **3. Rozložení** | Pochopení struktury | Použít GitHub Copilot pro průzkum architektury, Bicep souborů a organizace kódu | 30 min |
| **4. Konfigurace** | Hloubkový pohled na azure.yaml | Ovládnout konfiguraci `azure.yaml`, životní cyklus a proměnné prostředí | 30 min |
| **5. Přizpůsobení** | Udělej si to své | Povolit AI vyhledávání, trasování, vyhodnocování a přizpůsobit scénáři | 45 min |
| **6. Ukončení** | Vyčištění | Bezpečně odstranit zdroje pomocí `azd down --purge` | 15 min |
| **7. Shrnutí** | Další kroky | Zhodnotit úspěchy, klíčové koncepty a pokračovat ve vzdělávání | 15 min |

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
# Možnost 1: GitHub Codespaces (doporučeno)
# Klikněte na "Code" → "Create codespace on main" v repozitáři

# Možnost 2: Lokální vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podle pokynů k nastavení v workshop/README.md
```

#### 🎯 Výsledky učení workshopu
Účastníci absolvováním workshopu:
- **Nasadí produkční AI aplikace**: Použijí AZD s Microsoft Foundry službami
- **Ovládnou multi-agentní architektury**: Implementují koordinovaná AI agentní řešení
- **Aplikují bezpečnostní nejlepší postupy**: Konfigurují autentizaci a kontrolu přístupu
- **Optimalizují pro škálování**: Navrhnou nákladově efektivní, výkonná nasazení
- **Řeší nasazení**: Samostatně vyřeší běžné problémy

#### 📖 Zdrojové materiály workshopu
- **🎥 Interaktivní průvodce**: [Workshop Materials](workshop/README.md) - prostředí pro učení v prohlížeči
- **📋 Instrukce po modulech**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Přehled a cíle workshopu
  - [1. Výběr](workshop/docs/instructions/1-Select-AI-Template.md) - Najít a vybrat AI šablony
  - [2. Validace](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadit a ověřit šablony
  - [3. Rozložení](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Prozkoumat architekturu šablony
  - [4. Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládnout azure.yaml
  - [5. Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) - Přizpůsobit scénáři
  - [6. Ukončení](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Vyčistit zdroje
  - [7. Shrnutí](workshop/docs/instructions/7-Wrap-up.md) - Zhodnotit a další kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI zaměřená cvičení
- **💡 Rychlý start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfigurace prostředí

**Ideální pro**: Firemní školení, univerzitní kurzy, samostudium a vývojářské bootcampy.

---

## 📖 Hloubkový pohled: Možnosti AZD

Kromě základů nabízí AZD silné funkce pro produkční nasazení:

- **Nasazení založené na šablonách** - Použijte předpřipravené šablony pro běžné vzory aplikací
- **Infrastruktura jako kód** - Spravujte Azure zdroje pomocí Bicep nebo Terraformu  
- **Integrované pracovní postupy** - Bezproblémově zprovozněte, nasadíte a monitorujte aplikace
- **Přátelské vůči vývojářům** - Optimalizováno pro produktivitu a komfort vývojáře

### **AZD + Microsoft Foundry: Ideální pro AI nasazení**

**Proč AZD pro AI řešení?** AZD řeší hlavní výzvy, kterým čelí vývojáři AI:

- **AI připravené šablony** - Předkonfigurované šablony pro Microsoft Foundry modely, Azure AI služby a ML pracovní zátěže
- **Bezpečné AI nasazení** - Vestavěné bezpečnostní vzory pro AI služby, API klíče a koncové body modelů  
- **Produkční AI vzory** - Nejlepší postupy pro škálovatelné, nákladově efektivní AI aplikace
- **End-to-End AI pracovní postupy** - Od vývoje modelu po produkční nasazení s odpovídajícím monitorováním
- **Optimalizace nákladů** - Inteligentní alokace zdrojů a škálování pro AI pracovní zátěže
- **Integrace Microsoft Foundry** - Bezproblémové připojení ke katalogu modelů a koncovým bodům Microsoft Foundry

---

## 🎯 Knihovna šablon a příkladů

### Doporučeno: Microsoft Foundry šablony
**Začněte zde, pokud nasazujete AI aplikace!**

> **Poznámka:** Tyto šablony demonstrují různé AI vzory. Některé jsou externí Azure ukázky, jiné jsou lokální implementace.

| Šablona | Kapitola | Složitost | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externí |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externí |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externí |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externí |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externí |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externí |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokální** |

### Doporučeno: Kompletní výukové scénáře
**Produkční šablony aplikací mapované na učební kapitoly**

| Šablona | Výuková kapitola | Složitost | Klíčové učení |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základní vzory AI nasazení |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementace RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrace Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Agentní framework a volání funkcí |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Orchestrace podnikové AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Multi-agentní architektura s agenty pro zákazníka a inventář |

### Učení podle typu příkladu

> **📌 Lokální vs. externí příklady:**  
> **Lokální příklady** (v tomto repozitáři) = ihned připravené k použití  
> **Externí příklady** (Azure Samples) = Klonovat z odkazovaných repozitářů

#### Lokální příklady (ihned použitelné)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletní produkční implementace s ARM šablonami
  - Multi-agentní architektura (Agent zákazníka + Agent inventáře)
  - Komplexní monitorování a vyhodnocení
  - Jedním kliknutím nasazení přes ARM šablonu

#### Lokální příklady - Kontejnerové aplikace (kapitoly 2-5)
**Komplexní příklady kontejnerového nasazení v tomto repozitáři:**

- [**Příklady Container App**](examples/container-app/README.md) - Kompletní průvodce nasazením kontejnerizovaných aplikací
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základní REST API s možností škálování na nulu
  - [Architektura mikroservis](../../examples/container-app/microservices) - Produkčně připravené nasazení více služeb
  - Rychlý start, produkční a pokročilé vzory nasazení
  - Pokyny pro monitorování, zabezpečení a optimalizaci nákladů

#### Vnější příklady - Jednoduché aplikace (kapitoly 1-2)
**Naklonujte si tyto repozitáře Azure Samples pro začátek:**
- [Jednoduchá webová aplikace - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základní vzory nasazení
- [Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasazení statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasazení REST API

#### Vnější příklady - Integrace databáze (kapitoly 3-4)  
- [Databázová aplikace - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory připojení k databázi
- [Funkce + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless datový tok

#### Vnější příklady - Pokročilé vzory (kapitoly 4-8)
- [Java mikroservisy](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury více služeb
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Zpracování na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčně připravené vzory ML

### Externí kolekce šablon
- [**Oficiální galerie šablon AZD**](https://azure.github.io/awesome-azd/) - Kurátorská kolekce oficiálních a komunitních šablon
- [**Šablony Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentace šablon Microsoft Learn
- [**Adresář příkladů**](examples/README.md) - Místní výukové příklady s podrobnými vysvětleními

---

## 📚 Výukové zdroje & reference

### Rychlé odkazy
- [**Přehled příkazů**](resources/cheat-sheet.md) - Základní příkazy azd uspořádané podle kapitol
- [**Glosář**](resources/glossary.md) - Terminologie Azure a azd  
- [**Často kladené dotazy (FAQ)**](resources/faq.md) - Běžné otázky podle kapitol
- [**Studijní příručka**](resources/study-guide.md) - Podrobné cvičební úlohy

### Praktické workshopy
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Udělejte své AI řešení nasaditelná pomocí AZD (2-3 hodiny)
- [**Interaktivní workshop**](workshop/README.md) - 8 modulů řízených cvičení s MkDocs a GitHub Codespaces
  - Postup: Úvod → Výběr → Ověření → Rozklad → Konfigurace → Přizpůsobení → Ukončení → Shrnutí

### Externí výukové zdroje
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI dovednosti pro váš editor
- [**Microsoft Azure dovednosti na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otevřených agentních dovedností pro Azure AI, Foundry, nasazení, diagnostiku, optimalizaci nákladů a další. Nainstalujte je v GitHub Copilot, Cursor, Claude Code nebo jakémkoli podporovaném agentu:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rychlý průvodce řešením problémů

**Časté problémy začátečníků a rychlá řešení:**

<details>
<summary><strong>❌ "azd: příkaz nebyl nalezen"</strong></summary>

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
<summary><strong>❌ "Nenalezeno předplatné" nebo "Předplatné není nastaveno"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" nebo "Překročen kvótový limit"</strong></summary>

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
<summary><strong>❌ "azd up" selhává uprostřed</strong></summary>

```bash
# Možnost 1: Vyčistit a zkusit znovu
azd down --force --purge
azd up

# Možnost 2: Pouze opravit infrastrukturu
azd provision

# Možnost 3: Zkontrolovat podrobný stav
azd show

# Možnost 4: Zkontrolovat protokoly v Azure Monitoru
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentizace selhala" nebo "Token vypršel"</strong></summary>

```bash
# Znovu ověřit pro AZD
azd auth logout
azd auth login

# Volitelné: také obnovit Azure CLI, pokud spouštíte příkazy az
az logout
az login

# Ověřit autentizaci
az account show
```
</details>

<details>
<summary><strong>❌ "Zdroj již existuje" nebo konflikty pojmenování</strong></summary>

```bash
# AZD generuje unikátní názvy, ale pokud dojde ke konfliktu:
azd down --force --purge

# Poté zkuste znovu s novým prostředím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasazení šablony trvá příliš dlouho</strong></summary>

**Normální doby čekání:**
- Jednoduchá webová aplikace: 5-10 minut
- Aplikace s databází: 10-15 minut
- AI aplikace: 15-25 minut (Provisioning OpenAI je pomalý)

```bash
# Zkontrolujte pokrok
azd show

# Pokud jste uvízli déle než 30 minut, zkontrolujte Azure Portal:
azd monitor --overview
# Hledejte neúspěšné nasazení
```
</details>

<details>
<summary><strong>❌ "Přístup odepřen" nebo "Zakázáno"</strong></summary>

```bash
# Zkontrolujte svou roli v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potřebujete alespoň roli "Přispěvatel"
# Požádejte správce Azure o udělení:
# - Přispěvatel (pro prostředky)
# - Správce přístupu uživatele (pro přiřazení rolí)
```
</details>

<details>
<summary><strong>❌ Nelze najít URL nasazené aplikace</strong></summary>

```bash
# Zobrazit všechny koncové body služby
azd show

# Nebo otevřít Azure Portal
azd monitor

# Zkontrolovat konkrétní službu
azd env get-values
# Hledat proměnné *_URL
```
</details>

### 📚 Kompletní zdroje pro řešení problémů

- **Průvodce běžnými problémy:** [Podrobné řešení](docs/chapter-07-troubleshooting/common-issues.md)
- **Problémy specifické pro AI:** [Řešení problémů s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Průvodce laděním:** [Ladění krok za krokem](docs/chapter-07-troubleshooting/debugging.md)
- **Získejte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončení kurzu a certifikace

### Sledování pokroku
Sledujte svůj postup učením v každé kapitole:

- [ ] **Kapitola 1**: Základy a rychlý start ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurace a autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód a nasazení ✅
- [ ] **Kapitola 5**: Multi-agentní AI řešení ✅
- [ ] **Kapitola 6**: Ověřování a plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů a ladění ✅
- [ ] **Kapitola 8**: Produkční a podnikové vzory ✅

### Ověření znalostí
Po dokončení každé kapitoly ověřte své znalosti:
1. **Praktické cvičení**: Dokončete praktické nasazení z kapitoly
2. **Kontrola znalostí**: Projděte sekci FAQ pro vaši kapitolu
3. **Diskuse v komunitě**: Podělte se o své zkušenosti v Azure Discordu
4. **Další kapitola**: Pokračujte na další úroveň složitosti

### Výhody dokončení kurzu
Po dokončení všech kapitol získáte:
- **Produkční zkušenosti**: Nasazené reálné AI aplikace do Azure
- **Profesní dovednosti**: Schopnosti nasazení připravené pro podnikové prostředí  
- **Uznání v komunitě**: Aktivní člen Azure vývojářské komunity
- **Kariérní postup**: Žádané dovednosti v nasazení AZD a AI

---

## 🤝 Komunita a podpora

### Získejte pomoc a podporu
- **Technické problémy**: [Nahlášení chyb a žádosti o funkce](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky týkající se učení**: [Microsoft Azure Discord komunita](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specifická pro AI**: Připojte se k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentace**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postřehy komunity z Microsoft Foundry Discordu

**Nedávné výsledky ankety z kanálu #Azure:**
- **45 %** vývojářů chce používat AZD pro AI pracovní zátěže
- **Největší výzvy**: Nasazení více služeb, správa přihlašovacích údajů, připravenost na produkci  
- **Nejčastější požadavky**: Šablony specifické pro AI, průvodce řešením problémů, osvědčené postupy

**Připojte se k naší komunitě, abyste:**
- Sdíleli své zkušenosti s AZD + AI a získali pomoc
- Měli přístup k předběžným verzím nových AI šablon
- Přispívali k nejlepším postupům nasazení AI
- Ovlivňovali budoucí vývoj funkcí AI + AZD

### Přispívání do kurzu
Vítáme příspěvky! Přečtěte si náš [Příručka pro přispívání](CONTRIBUTING.md) s podrobnostmi o:
- **Vylepšení obsahu**: Vylepšit stávající kapitoly a příklady
- **Nové příklady**: Přidat scénáře a šablony z reálného světa  
- **Překlady**: Pomoci udržovat vícejazyčnou podporu
- **Nahlášení chyb**: Zlepšit přesnost a srozumitelnost
- **Standardy komunity**: Dodržovat naše inkluzivní komunitní směrnice

---

## 📄 Informace o kurzu

### Licence
Tento projekt je licencován pod licencí MIT - podrobnosti najdete v souboru [LICENSE](../../LICENSE).

### Související vzdělávací zdroje Microsoftu

Náš tým vytváří další komplexní vzdělávací kurzy:

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
 
### Série Generative AI
[![Generative AI pro začátečníky](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základní nauka
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigace kurzem

**🚀 Připraven začít se učit?**

**Začátečníci**: Začněte s [Kapitola 1: Základy a rychlý start](#-chapter-1-foundation--quick-start)  
**Vývojáři AI**: Přejděte na [Kapitola 2: Vývoj zaměřený na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Zkušení vývojáři**: Začněte s [Kapitola 3: Konfigurace a autentizace](#️-chapter-3-configuration--authentication)

**Další kroky**: [Začněte kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->