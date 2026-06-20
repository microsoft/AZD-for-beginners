# AZD pro začátečníky: Strukturovaná učební cesta

![AZD pro začátečníky](../../translated_images/cs/azdbeginners.5527441dd9f74068.webp) 

[![Sledující na GitHubu](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forky na GitHubu](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Hvězdy na GitHubu](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatické překlady (vždy aktuální)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabština](../ar/README.md) | [Bengálština](../bn/README.md) | [Bulharština](../bg/README.md) | [Barmsky (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradiční, Hongkong)](../zh-HK/README.md) | [Čínština (tradiční, Macao)](../zh-MO/README.md) | [Čínština (tradiční, Tchaj-wan)](../zh-TW/README.md) | [Chorvatština](../hr/README.md) | [Čeština](./README.md) | [Dánština](../da/README.md) | [Nizozemština](../nl/README.md) | [Estonština](../et/README.md) | [Finština](../fi/README.md) | [Francouzština](../fr/README.md) | [Němčina](../de/README.md) | [Řečtina](../el/README.md) | [Hebrejština](../he/README.md) | [Hindština](../hi/README.md) | [Maďarština](../hu/README.md) | [Indonéština](../id/README.md) | [Italština](../it/README.md) | [Japonština](../ja/README.md) | [Kannadština](../kn/README.md) | [Khmerština](../km/README.md) | [Korejština](../ko/README.md) | [Litevština](../lt/README.md) | [Malajština](../ms/README.md) | [Malajálamština](../ml/README.md) | [Maráthština](../mr/README.md) | [Nepálština](../ne/README.md) | [Nigerijský pidžin](../pcm/README.md) | [Norština](../no/README.md) | [Perština (Farsi)](../fa/README.md) | [Polština](../pl/README.md) | [Portugalština (Brazílie)](../pt-BR/README.md) | [Portugalština (Portugalsko)](../pt-PT/README.md) | [Pandžábština (Gurmukhi)](../pa/README.md) | [Rumunština](../ro/README.md) | [Ruština](../ru/README.md) | [Srbština (cyrilice)](../sr/README.md) | [Slovenština](../sk/README.md) | [Slovinština](../sl/README.md) | [Španělština](../es/README.md) | [Svahilština](../sw/README.md) | [Švédština](../sv/README.md) | [Tagalog (filipínština)](../tl/README.md) | [Tamilština](../ta/README.md) | [Telugština](../te/README.md) | [Thajština](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinština](../uk/README.md) | [Urdština](../ur/README.md) | [Vietnamština](../vi/README.md)

> **Dáváte přednost klonování lokálně?**
>
> Tento repozitář obsahuje více než 50 překladů, což výrazně zvětšuje velikost stahování. Pokud chcete klonovat bez překladů, použijte sparse checkout:
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
> To vám poskytne vše, co potřebujete k dokončení kurzu s mnohem rychlejším stáhnutím.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Co je dnes nového v azd

> 📌 Tento kurz byl ověřen pro **`azd 1.25.6`** (červen 2026). Spusťte `azd version`, abyste zkontrolovali svou verzi, a `azd upgrade`, abyste získali nejnovější.

Azure Developer CLI se rozrostl nad rámec tradičních webových aplikací a rozhraní API. Dnes je azd jediným nástrojem pro nasazení **jakékoli** aplikace do Azure — včetně aplikací poháněných AI a inteligentních agentů.

Co to pro vás znamená:

- **AI agenti jsou nyní plnohodnotné pracovní zatížení v azd.** Můžete inicializovat, nasadit a spravovat projekty AI agentů pomocí stejného pracovního postupu `azd init` → `azd up`, který už znáte.
- **Kompletní životní cyklus agenta z příkazové řádky.** Rozšíření `azure.ai.agents` nyní pokrývá celou cestu—`azd ai agent init` pro scaffolding, `azd ai agent invoke` pro testování (s výstupem časování odpovědí), `azd ai agent eval generate` a `azd ai agent optimize` pro měření a zlepšování kvality a `azd ai agent delete` pro úklid.
- **Více stavebních bloků pro AI.** Nová preview rozšíření—`azure.ai.skills` a `azure.ai.connections`—umožňují spravovat znovupoužitelné dovednosti agentů a Foundry připojení přímo pomocí azd.
- **Integrace Microsoft Foundry** přináší nasazení modelů, hostování agentů a konfiguraci AI služeb přímo do ekosystému azd šablon.
- **Ladnější každodenní základy.** Nedávná vydání udělala `azd init` idempotentním (bezpečné opakované spuštění), nastavila `azd auth login`, aby automaticky mazal neplatné tokeny, a přidala přívětivý průvodní prompt `azd tool` při prvním spuštění.
- **Základní pracovní postup se nezměnil.** Ať už nasazujete todo aplikaci, mikroservisu nebo multi-agentní AI řešení, příkazy jsou stejné.

> **Poznámka pro uživatele Aspire:** Microsoft nyní produkt značí jednoduše jako **Aspire** (dříve ".NET Aspire"). Podpora Aspire v azd zůstává nezměněna — změnil se pouze název.

Pokud jste azd používali dříve, podpora AI je přirozeným rozšířením — ne samostatným nástrojem nebo pokročilým směrem. Pokud začínáte od nuly, naučíte se jeden pracovní postup, který funguje pro všechno.

---

## 🚀 Co je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je přívětivý nástroj příkazového řádku, který vývojářům usnadňuje nasazení aplikací do Azure. Místo ručního vytváření a propojení desítek Azure zdrojů můžete nasadit celé aplikace jedním příkazem.

### Kouzlo `azd up`

```bash
# Tento jediný příkaz dělá všechno:
# ✅ Vytváří všechny zdroje Azure
# ✅ Konfiguruje síťování a bezpečnost
# ✅ Sestavuje váš aplikační kód
# ✅ Nasazuje do Azure
# ✅ Poskytuje vám funkční URL
azd up
```

**To je vše!** Žádné klikání v Azure Portalu, žádné složité ARM šablony k učení, žádná ruční konfigurace — jen fungující aplikace na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Jaký je rozdíl?

To je nejčastější otázka, kterou začátečníci kladou. Tady je jednoduchá odpověď:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Správa jednotlivých Azure zdrojů | Nasazení kompletních aplikací |
| **Mindset** | Zaměření na infrastrukturu | Zaměření na aplikaci |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Musíte znát Azure služby | Stačí znát svou aplikaci |
| **Best For** | DevOps, infrastruktura | Vývojáři, prototypování |

### Jednoduchá analogie

- **Azure CLI** je jako mít všechny nástroje na stavbu domu - kladiva, pily, hřeby. Můžete postavit cokoliv, ale musíte znát stavebnictví.
- **Azure Developer CLI** je jako najmout dodavatele - popíšete, co chcete, a oni se postarají o výstavbu.

### Kdy použít který

| Scenario | Use This |
|----------|----------|
| "Chci rychle nasadit svou webovou aplikaci" | `azd up` |
| "Potřebuji vytvořit jen úložný účet" | `az storage account create` |
| "Stavím kompletní AI aplikaci" | `azd init --template azure-search-openai-demo` |
| "Potřebuji ladit konkrétní Azure zdroj" | `az resource show` |
| "Chci produkční nasazení během minut" | `azd up --environment production` |

### Fungují společně!

AZD používá Azure CLI na pozadí. Můžete používat oba:
```bash
# Nasazení vaší aplikace pomocí AZD
azd up

# Poté dolaďte konkrétní zdroje pomocí Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Najděte šablony v Awesome AZD

Nezačínejte od nuly! **Awesome AZD** je komunitní sbírka připravených k nasazení šablon:

| Resource | Description |
|----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Prohlédněte si 200+ šablon s možností nasazení jedním kliknutím |
| 🔗 [**Přidejte šablonu**](https://github.com/Azure/awesome-azd/issues) | Přispějte svou šablonou komunitě |
| 🔗 [**Repozitář na GitHubu**](https://github.com/Azure/awesome-azd) | Dejte hvězdu a prozkoumejte zdrojový kód |

### Oblíbené AI šablony z Awesome AZD

```bash
# RAG Chat s modely Microsoft Foundry + AI vyhledávání
azd init --template azure-search-openai-demo

# Rychlá AI chatovací aplikace
azd init --template openai-chat-app-quickstart

# AI agenti s agenty Foundry
azd init --template get-started-with-ai-agents
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

Pokud některá z požadovaných kontrol selže, opravte ji nejdříve a poté pokračujte s rychlým startem.

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

### Krok 2: Autentizace pro AZD

```bash
# Volitelné, pokud plánujete v tomto kurzu používat příkazy Azure CLI přímo
az login

# Vyžadováno pro pracovní postupy AZD
azd auth login
```

Pokud si nejste jisti, kterou možnost potřebujete, projděte celý instalační průvodce v [Instalace a nastavení](docs/chapter-01-foundation/installation.md#authentication-setup).

### Krok 3: Nasazení vaší první aplikace

```bash
# Inicializovat z šablony
azd init --template todo-nodejs-mongo

# Nasadit do Azure (vytvoří vše!)
azd up
```

**🎉 Hotovo!** Vaše aplikace je nyní živě na Azure.

### Úklid (nezapomeňte!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Jak používat tento kurz

Tento kurz je navržen pro **postupné učení** - začněte tam, kde se cítíte dobře, a postupujte dál:

| Your Experience | Start Here |
|-----------------|------------|
| **Úplný začátečník v Azure** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Znám Azure, jsem nový v AZD** | [Kapitola 1: Základy](#-chapter-1-foundation--quick-start) |
| **Chci nasazovat AI aplikace** | [Kapitola 2: Vývoj zaměřený na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Chci praktické cvičení** | [🎓 Interaktivní workshop](workshop/README.md) - 3-4 hodinové řízené laby |
| **Potřebuji produkční vzory** | [Kapitola 8: Produkce a podnikové vzory](#-chapter-8-production--enterprise-patterns) |

### Rychlé nastavení

1. **Vytvořte fork tohoto repozitáře**: [![Forky na GitHubu](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte repozitář:** `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získejte pomoc:** [Komunita Azure na Discordu](https://discord.com/invite/ByRwuEEgH4)

> **Dáváte přednost klonování lokálně?**
>
> Tento repozitář obsahuje více než 50 překladů, což výrazně zvětšuje velikost stahování. Pokud chcete klonovat bez překladů, použijte sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> To vám poskytne vše, co potřebujete k dokončení kurzu s mnohem rychlejším stažením.


## Přehled kurzu

Osvojte si Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní zaměření na nasazení AI aplikací s integrací Microsoft Foundry.**
### Proč je tento kurz nezbytný pro moderní vývojáře

Na základě poznatků z komunity Microsoft Foundry Discord chce **45 % vývojářů používat AZD pro AI pracovní zátěže**, ale naráží na potíže s:
- Složitými více-službovými AI architekturami
- Osvedčenými postupy nasazení AI do produkce  
- Integrací a konfigurací Azure AI služeb
- Optimalizací nákladů pro AI pracovní zátěže
- Řešením problémů specifických pro nasazení AI

### Cíle učení

Dokončením tohoto strukturovaného kurzu budete:
- **Osvojte si základy AZD**: Základní pojmy, instalace a konfigurace
- **Nasazujte AI aplikace**: Používejte AZD se službami Microsoft Foundry
- **Implementujte Infrastrukturu jako kód**: Spravujte Azure zdroje pomocí Bicep šablon
- **Řešte problémy s nasazením**: Odstraňujte běžné problémy a debugujte chyby
- **Optimalizujte pro produkci**: Zabezpečení, škálování, monitorování a řízení nákladů
- **Budujte multi-agentní řešení**: Nasazujte složité AI architektury

## Před začátkem: Účty, přístup a předpoklady

Než začnete Kapitolu 1, ujistěte se, že máte následující věci připravené. Kroky instalace později v této příručce předpokládají, že tyto základy jsou již vyřešeny.

- **Azure předplatné**: Můžete použít existující předplatné z práce nebo svůj vlastní účet, nebo si vytvořit [free trial](https://aka.ms/azurefreetrial) pro začátek.
- **Oprávnění k vytváření Azure zdrojů**: Pro většinu cvičení byste měli mít alespoň přístup **Contributor** na cílovém předplatném nebo skupině prostředků. Některé kapitoly mohou také předpokládat, že můžete vytvářet skupiny prostředků, spravované identity a RBAC přiřazení.
- [**Účet na GitHubu**](https://github.com): Je užitečný pro forkování repozitáře, sledování vlastních změn a používání GitHub Codespaces pro workshop.
- **Požadavky na běhové prostředí šablon**: Některé šablony vyžadují lokální nástroje jako Node.js, Python, Java nebo Docker. Spusťte validátor nastavení před začátkem, abyste včas odhalili chybějící nástroje.
- **Základní znalost terminálu**: Nemusíte být odborník, ale měli byste být pohodlní při spouštění příkazů jako `git clone`, `azd auth login` a `azd up`.

> **Pracujete v podnikovém předplatném?**
> Pokud je vaše Azure prostředí spravováno administrátorem, potvrďte dopředu, že můžete nasazovat zdroje v předplatném nebo skupině prostředků, kterou plánujete použít. Pokud ne, požádejte o sandbox předplatné nebo přístup Contributor před zahájením.

> **Nováček v Azure?**
> Začněte se zkušebním předplatným Azure nebo s pay-as-you-go předplatným na https://aka.ms/azurefreetrial, abyste mohli dokončit cvičení kompletně bez čekání na schválení na úrovni tenant.

## 🗺️ Mapa kurzu: Rychlá navigace podle kapitol

Každá kapitola má věnovaný README s cíli učení, rychlými starty a cvičeními:

| Kapitola | Téma | Lekce | Doba trvání | Složitost |
|---------|-------|---------|----------|------------|
| **[Kap. 1: Základy](docs/chapter-01-foundation/README.md)** | Začínáme | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalace](docs/chapter-01-foundation/installation.md) &#124; [První projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap. 2: AI vývoj](docs/chapter-02-ai-development/README.md)** | Aplikace orientované na AI | [Integrace Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasazení modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Kap. 3: Konfigurace](docs/chapter-03-configuration/README.md)** | Autentizace & zabezpečení | [Konfigurace](docs/chapter-03-configuration/configuration.md) &#124; [Autentizace & zabezpečení](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap. 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & nasazení | [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Kap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Řešení AI agentů | [Scénář pro maloobchod](examples/retail-scenario.md) &#124; [Koordinační vzory](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Kap. 6: Před nasazením](docs/chapter-06-pre-deployment/README.md)** | Plánování & ověření | [Preflight kontroly](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánování kapacit](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výběr SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Kap. 7: Řešení problémů](docs/chapter-07-troubleshooting/README.md)** | Debug & opravy | [Běžné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Kap. 8: Produkce](docs/chapter-08-production/README.md)** | Podnikové vzory | [Praktiky pro produkci](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktické cvičení | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výběr](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validace](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstrukce](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Ukončení infrastruktury](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Závěr](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Celková délka kurzu:** ~10-14 hodin | **Postup dovedností:** Začátečník → Připravený do produkce

---

## 📚 Učební kapitoly

*Vyberte si učební cestu podle úrovně zkušeností a cílů*

### 🚀 Kapitola 1: Základy & Rychlý start
**Požadavky**: Azure předplatné, základní znalosti příkazového řádku  
**Doba trvání**: 30-45 minut  
**Složitost**: ⭐

#### Co se naučíte
- Porozumění základům Azure Developer CLI
- Instalace AZD na vaší platformě
- Váš první úspěšné nasazení

#### Zdroje k učení
- **🎯 Začněte zde**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorie**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Základní pojmy a terminologie
- **⚙️ Nastavení**: [Instalace & nastavení](docs/chapter-01-foundation/installation.md) - Platformově specifické návody
- **🛠️ Prakticky**: [Váš první projekt](docs/chapter-01-foundation/first-project.md) - Krok za krokem tutoriál
- **📋 Rychlá reference**: [Cheat Sheet](resources/cheat-sheet.md)

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
azd show                # Zobrazuje URL běžící aplikace
# Aplikace se otevře v prohlížeči a funguje
azd down --force --purge  # Odstraňuje prostředky
```

**📊 Časová náročnost:** 30-45 minut  
**📈 Úroveň dovedností po:** Dokáže nezávisle nasadit základní aplikace
**📈 Úroveň dovedností po:** Dokáže nezávisle nasadit základní aplikace

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (Doporučeno pro AI vývojáře)
**Požadavky**: Kapitola 1 dokončena  
**Doba trvání**: 1-2 hodiny  
**Složitost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazování aplikací poháněných AI
- Porozumění konfiguracím AI služeb

#### Zdroje k učení
- **🎯 Začněte zde**: [Integrace Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenti**: [Průvodce AI agenty](docs/chapter-02-ai-development/agents.md) - Nasazení inteligentních agentů s AZD
- **📖 Vzory**: [Nasazení AI modelu](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasazení a správa AI modelů
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Připravte svá AI řešení pro AZD
- **🎥 Interaktivní průvodce**: [Workshop Materials](workshop/README.md) - Učení v prohlížeči s MkDocs * DevContainer Environment
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

**💡 Výsledek kapitoly**: Nasadit a nakonfigurovat chatovací aplikaci poháněnou AI se schopnostmi RAG

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

**📊 Časová náročnost:** 1-2 hodiny  
**📈 Úroveň dovedností po:** Dokáže nasadit a nakonfigurovat produkčně připravené AI aplikace  
**💰 Povědomí o nákladech:** Pochopit výdaje $80-150/měsíc pro vývoj, $300-3500/měsíc pro produkci

#### 💰 Úvahy o nákladech pro AI nasazení

**Vývojové prostředí (odhadem $80-150/měsíc):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/month (based on token usage)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Produkční prostředí (odhadem $300-3,500+/měsíc):**
- Microsoft Foundry Models (PTU for consistent performance): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Tipy pro optimalizaci nákladů:**
- Použijte **Free Tier** Microsoft Foundry Models pro učení (Azure OpenAI 50,000 tokens/month included)
- Spusťte `azd down` k uvolnění zdrojů, když aktivně nevyvíjíte
- Začněte s účtováním založeným na spotřebě, na PTU upgradujte pouze pro produkci
- Použijte `azd provision --preview` k odhadu nákladů před nasazením
- Povolit automatické škálování: plaťte pouze za skutečné využití

**Sledování nákladů:**
```bash
# Zkontrolujte odhadované měsíční náklady
azd provision --preview

# Sledujte skutečné náklady v Azure portálu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurace & Autentizace
**Požadavky**: Kapitola 1 dokončena  
**Doba trvání**: 45-60 minut  
**Složitost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Autentizace a osvědčené postupy zabezpečení
- Pojmenovávání a organizace zdrojů

#### Zdroje k učení
- **📖 Konfigurace**: [Průvodce konfigurací](docs/chapter-03-configuration/configuration.md) - Nastavení prostředí
- **🔐 Zabezpečení**: [Vzor autentizace a spravovaná identita](docs/chapter-03-configuration/authsecurity.md) - Vzory autentizace
- **📝 Příklady**: [Příklad databázové aplikace](examples/database-app/README.md) - AZD databázové příklady

#### Praktická cvičení
- Nakonfigurujte více prostředí (dev, staging, prod)
- Nastavte autentizaci pomocí spravované identity
- Implementujte konfigurace specifické pro prostředí

**💡 Výsledek kapitoly**: Spravovat více prostředí s řádnou autentizací a zabezpečením

---

### 🏗️ Kapitola 4: Infrastruktura jako kód & Nasazení
**Požadavky**: Kapitoly 1-3 dokončeny  
**Doba trvání**: 1-1.5 hodiny  
**Složitost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód s Bicep
- Strategie zřizování zdrojů

#### Zdroje k učení
- **📖 Nasazení**: [Průvodce nasazením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletní pracovní toky
- **🏗️ Provisioning**: [Zřizování prostředků](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure zdrojů
- **📝 Příklady**: [Příklad Container App](../../examples/container-app) - Containerizovaná nasazení

#### Praktická cvičení
- Vytvořte vlastní Bicep šablony
- Nasadte více-službové aplikace
- Implementujte strategie blue-green nasazení

**💡 Výsledek kapitoly**: Nasadit komplexní více-službové aplikace pomocí vlastních infrastrukturních šablon

---
### 🎯 Kapitola 5: Více-agentní AI řešení (Pokročilé)
**Požadavky**: Kapitoly 1-2 dokončeny  
**Doba trvání**: 2-3 hodiny  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory více-agentní architektury
- Orchestrace a koordinace agentů
- Nasazení AI připravené do produkce

#### Studijní zdroje
- **🤖 Doporučený projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kompletní implementace
- **🛠️ ARM šablony**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Jedno-klikové nasazení
- **📖 Architektura**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktická cvičení
```bash
# Nasadit kompletní maloobchodní multiagentní řešení
cd examples/retail-multiagent-arm-template
./deploy.sh

# Prozkoumat konfigurace agentů
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledek kapitoly**: Nasadit a spravovat produkčně připravené více-agentní AI řešení s agenty Customer a Inventory

---

### 🔍 Kapitola 6: Validace a plánování před nasazením
**Požadavky**: Kapitola 4 dokončena  
**Doba trvání**: 1 hodina  
**Složitost**: ⭐⭐

#### Co se naučíte
- Plánování kapacity a validace zdrojů
- Strategie výběru SKU
- Kontroly před startem a automatizace

#### Studijní zdroje
- **📊 Plánování**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validace zdrojů
- **💰 Výběr**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladově efektivní volby
- **✅ Validace**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktická cvičení
- Spusťte skripty pro validaci kapacity
- Optimalizujte výběr SKU z hlediska nákladů
- Implementujte automatizované kontroly před nasazením

**💡 Výsledek kapitoly**: Ověřit a optimalizovat nasazení před spuštěním

---

### 🚨 Kapitola 7: Řešení problémů a ladění
**Požadavky**: Dokončená jakákoli kapitola o nasazení  
**Doba trvání**: 1-1.5 hodiny  
**Složitost**: ⭐⭐

#### Co se naučíte
- Systematické přístupy k ladění
- Běžné problémy a řešení
- Řešení problémů specifických pro AI

#### Studijní zdroje
- **🔧 Běžné problémy**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a řešení
- **🕵️ Ladění**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Postupy krok za krokem
- **🤖 AI problémy**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy služeb AI

#### Praktická cvičení
- Diagnostikujte selhání nasazení
- Vyřešte problémy s autentizací
- Ladiť konektivitu služeb AI

**💡 Výsledek kapitoly**: Samostatně diagnostikovat a řešit běžné problémy s nasazením

---

### 🏢 Kapitola 8: Produkční a podnikové vzory
**Požadavky**: Kapitoly 1-4 dokončeny  
**Doba trvání**: 2-3 hodiny  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Strategie nasazení do produkce
- Podnikové bezpečnostní vzory
- Monitorování a optimalizace nákladů

#### Studijní zdroje
- **🏭 Produkce**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Příklady**: [Microservices Example](../../examples/microservices) - Složitá architektura
- **📊 Monitorování**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitorování

#### Praktická cvičení
- Implementujte podnikové bezpečnostní vzory
- Nastavte komplexní monitorování
- Nasadte do produkce s odpovídajícím řízením

**💡 Výsledek kapitoly**: Nasadit aplikace připravené pro podnikové prostředí s plnými produkčními schopnostmi

---

## 🎓 Přehled workshopu: Praktická zkušenost

> **⚠️ STAV WORKSHOPU: Probíhá vývoj**  
> Materiály workshopu jsou momentálně vyvíjeny a upravovány. Základní moduly fungují, ale některé pokročilé části nejsou dokončené. Aktivně pracujeme na dokončení veškerého obsahu. [Sledovat pokrok →](workshop/README.md)

### Interaktivní materiály workshopu
**Komplexní praktické učení s nástroji v prohlížeči a vedenými cvičeními**

Naše materiály poskytují strukturovaný, interaktivní zážitek z učení, který doplňuje výše uvedené kapitoly. Workshop je navržen jak pro samostudium, tak pro řízené lekce.

#### 🛠️ Vlastnosti workshopu
- **Rozhraní v prohlížeči**: Kompletní workshop poháněný MkDocs s vyhledáváním, kopírováním a funkcí témat
- **Integrace GitHub Codespaces**: Jedno-klikové nastavení vývojového prostředí
- **Strukturovaná učební cesta**: 8 modulů s průvodcem (3-4 hodiny celkem)
- **Postupná metodika**: Úvod → Výběr → Validace → Dekonstrukce → Konfigurace → Přizpůsobení → Ukončení → Závěr
- **Interaktivní prostředí DevContainer**: Přednastavené nástroje a závislosti

#### 📚 Struktura modulů workshopu
Workshop následuje **8-modulovou postupnou metodiku**, která vás provede od objevování k mistrovství v nasazení:

| Modul | Téma | Co uděláte | Doba trvání |
|--------|-------|----------------|----------|
| **0. Úvod** | Přehled workshopu | Pochopíte cíle učení, požadavky a strukturu workshopu | 15 min |
| **1. Výběr** | Objevování šablon | Prozkoumáte AZD šablony a vyberete správnou AI šablonu pro váš scénář | 20 min |
| **2. Validace** | Nasazení a ověření | Nasadíte šablonu pomocí `azd up` a ověříte funkčnost infrastruktury | 30 min |
| **3. Dekonstrukce** | Pochopení struktury | Použijete GitHub Copilot k prozkoumání architektury šablony, Bicep souborů a organizace kódu | 30 min |
| **4. Konfigurace** | Hloubkový rozbor azure.yaml | Ovládnete konfiguraci `azure.yaml`, lifecycle hooky a proměnné prostředí | 30 min |
| **5. Přizpůsobení** | Udělejte to svým | Zapnete AI Search, tracing, evaluaci a přizpůsobíte pro váš scénář | 45 min |
| **6. Ukončení** | Vyčištění | Bezpečně odinstalujete zdroje pomocí `azd down --purge` | 15 min |
| **7. Závěr** | Další kroky | Přehled dosaženého, klíčových konceptů a pokračování v učení | 15 min |

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
Po dokončení workshopu účastníci:
- **Nasadí produkční AI aplikace**: Použijí AZD se službami Microsoft Foundry
- **Ovládnou více-agentní architektury**: Implementují koordinovaná AI agentní řešení
- **Aplikují bezpečnostní postupy**: Nakonfigurují autentizaci a řízení přístupu
- **Optimalizují pro škálování**: Navrhnou nákladově efektivní a výkonná nasazení
- **Řeší problémy s nasazením**: Samostatně odstraní běžné potíže

#### 📖 Zdroje workshopu
- **🎥 Interaktivní průvodce**: [Workshop Materials](workshop/README.md) - Učení v prostředí prohlížeče
- **📋 Instrukce modul po modulu**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Přehled workshopu a cíle
  - [1. Výběr](workshop/docs/instructions/1-Select-AI-Template.md) - Najít a vybrat AI šablony
  - [2. Validace](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadit a ověřit šablony
  - [3. Dekonstrukce](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Prozkoumat architekturu šablony
  - [4. Konfigurace](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládnout azure.yaml
  - [5. Přizpůsobení](workshop/docs/instructions/5-Customize-AI-Template.md) - Přizpůsobit pro váš scénář
  - [6. Ukončení](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Vyčistit zdroje
  - [7. Závěr](workshop/docs/instructions/7-Wrap-up.md) - Shrnutí a další kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičení zaměřená na AI
- **💡 Rychlý start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfigurace prostředí

**Ideální pro**: Firemní školení, vysokoškolské kurzy, samostudium a bootcampy pro vývojáře.

---

## 📖 Hluboký ponor: Schopnosti AZD

Kromě základů poskytuje AZD silné funkce pro produkční nasazení:

- **Nasazení založené na šablonách** - Používejte předpřipravené šablony pro běžné vzory aplikací
- **Infrastruktura jako kód** - Spravujte Azure zdroje pomocí Bicep nebo Terraformu  
- **Integrované workflowy** - Bezproblémově provisionujte, nasazujte a monitorujte aplikace
- **Přátelské pro vývojáře** - Optimalizováno pro produktivitu a zážitek vývojáře

### **AZD + Microsoft Foundry: Ideální pro nasazení AI**

**Proč AZD pro AI řešení?** AZD řeší hlavní výzvy, kterým čelí AI vývojáři:

- **Šablony připravené pro AI** - Předkonfigurované šablony pro Microsoft Foundry Models, Azure AI Services a ML zátěže
- **Bezpečné AI nasazení** - Vestavěné bezpečnostní vzory pro služby AI, API klíče a koncové body modelů  
- **Produkční AI vzory** - Nejlepší postupy pro škálovatelné a nákladově efektivní nasazení AI aplikací
- **End-to-End AI workflowy** - Od vývoje modelu po produkční nasazení s odpovídajícím monitorováním
- **Optimalizace nákladů** - Chytrá alokace zdrojů a škálovací strategie pro AI zátěže
- **Integrace Microsoft Foundry** - Bezproblémové propojení s katalogem modelů a koncovými body Microsoft Foundry

---

## 🎯 Knihovna šablon a příkladů

### Doporučené: Microsoft Foundry šablony
**Začněte zde, pokud nasazujete AI aplikace!**

> **Poznámka:** Tyto šablony ukazují různé AI vzory. Některé jsou externí Azure Samples, jiné jsou lokální implementace.

| Šablona | Kapitola | Složitost | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externí |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externí |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externí |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externí |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externí |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externí |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokální** |

### Doporučené: Kompletní učební scénáře
**Šablony aplikací připravené pro produkci mapované na učební kapitoly**

| Šablona | Učební kapitola | Složitost | Klíčové učení |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základní vzory nasazení AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementace RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrace Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Agentní framework a function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Podniková orchestrácia AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Více-agentní architektura s agenty Customer a Inventory |

### Učení podle typu příkladu

> **📌 Lokální vs. Externí příklady:**  
> **Lokální příklady** (v tomto repozitáři) = Ihned připravené k použití  
> **Externí příklady** (Azure Samples) = Naklonujte ze spojených repozitářů

#### Lokální příklady (Připravené k použití)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletní implementace připravená pro produkci s ARM šablonami
  - Více-agentní architektura (Customer + Inventory agents)
  - Komplexní monitorování a evaluace
  - Jedno-klikové nasazení přes ARM šablonu

#### Lokální příklady - Kontejnerové aplikace (Kapitoly 2-5)
**Komplexní příklady nasazení kontejnerů v tomto repozitáři:**
- [**Container App Examples**](examples/container-app/README.md) - Kompletní průvodce nasazením kontejnerů
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Základní REST API s podporou scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produkční nasazení více služeb
  - Quick Start, Production, and Advanced deployment patterns
  - Pokyny pro monitorování, zabezpečení a optimalizaci nákladů

#### Externí příklady - Jednoduché aplikace (Kapitoly 1-2)
**Naklonujte si tyto repozitáře Azure Samples pro začátek:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základní vzory nasazení
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasazení statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasazení REST API

#### Externí příklady - Integrace databáze (Kapitoly 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory připojení k databázi
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless pracovní postupy s daty

#### Externí příklady - Pokročilé vzory (Kapitoly 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektury více služeb
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Zpracování na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkční vzory ML

### Externí sbírky šablon
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurátorovaná sbírka oficiálních a komunitních šablon
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentace šablon na Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokální výukové příklady s podrobnými vysvětleními

---

## 📚 Výukové zdroje a odkazy

### Rychlé odkazy
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Základní příkazy azd uspořádané podle kapitol
- [**Glossary**](resources/glossary.md) - Terminologie Azure a azd  
- [**FAQ**](resources/faq.md) - Běžné dotazy uspořádané podle učebních kapitol
- [**Study Guide**](resources/study-guide.md) - Komplexní cvičení

### Praktické workshopy
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Umožněte nasazení vašich AI řešení pomocí AZD (2-3 hodiny)
- [**Interactive Workshop**](workshop/README.md) - 8 modulů vedených cvičení s MkDocs a GitHub Codespaces
  - Následuje: Úvod → Výběr → Validace → Dekonstrukce → Konfigurace → Přizpůsobení → Ukončení → Shrnutí

### Externí vzdělávací zdroje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Dovednosti AI agentů pro váš editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otevřených dovedností agentů pro Azure AI, Foundry, nasazení, diagnostiku, optimalizaci nákladů a další. Nainstalujte je do GitHub Copilot, Cursor, Claude Code nebo jakéhokoli podporovaného agenta:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rychlý průvodce řešením problémů

**Běžné problémy, se kterými se začátečníci setkávají, a okamžitá řešení:**

<details>
<summary><strong>❌ "azd: příkaz nenalezen"</strong></summary>

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
<summary><strong>❌ "Nebylo nalezeno žádné předplatné" or "Předplatné není nastaveno"</strong></summary>

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
<summary><strong>❌ "Nedostatečná kvóta" or "Kvóta překročena"</strong></summary>

```bash
# Vyzkoušejte jiný region Azure
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
<summary><strong>❌ "azd up" selže uprostřed procesu</strong></summary>

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
<summary><strong>❌ "Autentizace selhala" or "Token vypršel"</strong></summary>

```bash
# Znovu se autentizujte pro AZD
azd auth logout
azd auth login

# Volitelně: obnovte také Azure CLI, pokud spouštíte příkazy az
az logout
az login

# Ověřte autentizaci
az account show
```
</details>

<details>
<summary><strong>❌ "Zdroj již existuje" or konflikty názvů</strong></summary>

```bash
# AZD generuje unikátní názvy, ale pokud dojde ke konfliktu:
azd down --force --purge

# Poté opakujte s novým prostředím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasazení šablony trvá příliš dlouho</strong></summary>

**Normální doby čekání:**
- Simple web app: 5-10 minutes
- App with database: 10-15 minutes
- AI applications: 15-25 minutes (provizování OpenAI je pomalé)

```bash
# Zkontrolujte průběh
azd show

# Pokud se zaseknete déle než 30 minut, zkontrolujte portál Azure:
azd monitor --overview
# Hledejte neúspěšná nasazení
```
</details>

<details>
<summary><strong>❌ "Přístup odepřen" or "Zakázáno"</strong></summary>

```bash
# Zkontrolujte svou roli v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potřebujete alespoň roli „Contributor“
# Požádejte svého správce Azure o udělení:
# - Contributor (pro zdroje)
# - User Access Administrator (pro přiřazení rolí)
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
- **Problémy specifické pro AI:** [Řešení pro AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Průvodce laděním:** [Krok za krokem ladění](docs/chapter-07-troubleshooting/debugging.md)
- **Získejte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončení kurzu a certifikace

### Sledování postupu
Sledujte svůj pokrok v učení v jednotlivých kapitolách:

- [ ] **Kapitola 1**: Základy a Rychlý start ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurace a autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód a nasazení ✅
- [ ] **Kapitola 5**: Multi-agentní AI řešení ✅
- [ ] **Kapitola 6**: Přednasazovací ověření a plánování ✅
- [ ] **Kapitola 7**: Řešení problémů a ladění ✅
- [ ] **Kapitola 8**: Produkční a podnikové vzory ✅

### Ověření učení
Po dokončení každé kapitoly ověřte své znalosti pomocí:
1. **Praktické cvičení**: Dokončit praktické nasazení uvedené v kapitole
2. **Kontrola znalostí**: Projděte sekci FAQ pro vaši kapitolu
3. **Diskuze v komunitě**: Sdílejte své zkušenosti na Azure Discord
4. **Další kapitola**: Pokračujte na další úroveň složitosti

### Výhody dokončení kurzu
Po dokončení všech kapitol budete mít:
- **Zkušenost z produkce**: Nasazené reálné AI aplikace v Azure
- **Profesní dovednosti**: Schopnosti nasazení připravené pro podniky  
- **Uznání v komunitě**: Aktivní člen komunity vývojářů Azure
- **Kariérní posun**: Žádané odborné znalosti v nasazování AZD a AI

---

## 🤝 Komunita a podpora

### Získat pomoc a podporu
- **Technické problémy**: [Nahlásit chyby a požádat o funkce](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky k učení**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc specifická pro AI**: Připojte se k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentace**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postřehy komunity z Microsoft Foundry Discord

**Výsledky nedávného průzkumu z kanálu #Azure:**
- **45 %** vývojářů chce používat AZD pro AI pracovní zatížení
- **Hlavní výzvy**: Nasazení více služeb, správa přihlašovacích údajů, připravenost do produkce  
- **Nejčastěji požadované**: Šablony specifické pro AI, průvodce řešením problémů, osvědčené postupy

**Přidejte se k naší komunitě a:**
- Sdílejte své zkušenosti s AZD + AI a získejte pomoc
- Získejte přístup k předběžným verzím nových AI šablon
- Přispějte k osvědčeným postupům nasazování AI
- Ovlivněte budoucí vývoj funkcí AI + AZD

### Přispívání do kurzu
Vítáme příspěvky! Přečtěte si prosím náš [Průvodce přispíváním](CONTRIBUTING.md) pro podrobnosti o:
- **Vylepšení obsahu**: Vylepšete stávající kapitoly a příklady
- **Nové příklady**: Přidejte reálné scénáře a šablony  
- **Překlad**: Pomozte udržovat vícejazyčnou podporu
- **Hlášení chyb**: Zlepšete přesnost a jasnost
- **Standardy komunity**: Dodržujte naše zásady inkluzivní komunity

---

## 📄 Informace o kurzu

### Licence
Tento projekt je licencován podle licence MIT - podrobnosti naleznete v souboru [LICENSE](../../LICENSE).

### Související vzdělávací zdroje Microsoftu

Náš tým vytváří další komplexní výukové kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série generativní AI
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základní kurzy
[![Strojové učení pro začátečníky](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Datová věda pro začátečníky](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![Umělá inteligence pro začátečníky](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kybernetická bezpečnost pro začátečníky](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webový vývoj pro začátečníky](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pro začátečníky](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Vývoj XR pro začátečníky](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot pro párové programování s AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pro C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot dobrodružství](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigace kurzu

**🚀 Připraveno začít se učit?**

**Začátečníci**: Začněte s [Kapitola 1: Základy a rychlý start](#-chapter-1-foundation--quick-start)  
**Vývojáři AI**: Přejděte na [Kapitola 2: Vývoj orientovaný na AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Zkušení vývojáři**: Začněte s [Kapitola 3: Konfigurace a ověřování](#️-chapter-3-configuration--authentication)

**Další kroky**: [Začněte kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->