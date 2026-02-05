<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T14:21:18+00:00",
  "source_file": "README.md",
  "language_code": "cs"
}
-->
# AZD pro začátečníky: Strukturovaná vzdělávací cesta

![AZD-pro-zacatecniky](../../../../translated_images/cs/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledující](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hvězdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Začínáme s tímto kurzem

Postupujte podle těchto kroků, abyste zahájili svou AZD vzdělávací cestu:

1. **Vytvořte fork repozitáře**: Klikněte na [![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte repozitář**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Připojte se ke komunitě**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) pro odbornou podporu
4. **Vyberte si svou vzdělávací cestu**: Zvolte níže kapitolu odpovídající vaší úrovni zkušeností

### Podpora více jazyků

#### Automatické překlady (vždy aktuální)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabština](../ar/README.md) | [Bengálština](../bn/README.md) | [Bulharština](../bg/README.md) | [Barmština (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh/README.md) | [Čínština (tradiční, Hongkong)](../hk/README.md) | [Čínština (tradiční, Macao)](../mo/README.md) | [Čínština (tradiční, Tchaj-wan)](../tw/README.md) | [Chorvatština](../hr/README.md) | [Čeština](./README.md) | [Dánština](../da/README.md) | [Nizozemština](../nl/README.md) | [Estonština](../et/README.md) | [Finština](../fi/README.md) | [Francouzština](../fr/README.md) | [Němčina](../de/README.md) | [Řečtina](../el/README.md) | [Hebrejština](../he/README.md) | [ hindština](../hi/README.md) | [Maďarština](../hu/README.md) | [Indonéština](../id/README.md) | [Italština](../it/README.md) | [Japonština](../ja/README.md) | [Kannadština](../kn/README.md) | [Korejština](../ko/README.md) | [Litevština](../lt/README.md) | [Malajština](../ms/README.md) | [Malayalam](../ml/README.md) | [Maráthština](../mr/README.md) | [Nepálština](../ne/README.md) | [Nigerijský pidžin](../pcm/README.md) | [Norština](../no/README.md) | [Perština (Farsi)](../fa/README.md) | [Polština](../pl/README.md) | [Portugalština (Brazílie)](../br/README.md) | [Portugalština (Portugalsko)](../pt/README.md) | [Paňdžábština (Gurmukhi)](../pa/README.md) | [Rumunština](../ro/README.md) | [Ruština](../ru/README.md) | [Srbština (cyrilice)](../sr/README.md) | [Slovenština](../sk/README.md) | [Slovinština](../sl/README.md) | [Španělština](../es/README.md) | [Svahilština](../sw/README.md) | [Švédština](../sv/README.md) | [Tagalog (filipínština)](../tl/README.md) | [Tamilština](../ta/README.md) | [Telugština](../te/README.md) | [Thajština](../th/README.md) | [Turkština](../tr/README.md) | [Ukrajinština](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamština](../vi/README.md)

> **Preferujete klonování lokálně?**

> Tento repozitář obsahuje přes 50 jazykových překladů, což výrazně zvětšuje velikost stahování. Pro klonování bez překladu použijte sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Získáte vše potřebné ke splnění kurzu a rychlejší stažení.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Přehled kurzu

Ovládněte Azure Developer CLI (azd) prostřednictvím strukturovaných kapitol navržených pro postupné učení. **Zvláštní důraz na nasazení AI aplikací s integrací Microsoft Foundry.**

### Proč je tento kurz nezbytný pro moderní vývojáře

Na základě poznatků z komunity Microsoft Foundry Discord, **45 % vývojářů chce používat AZD pro AI pracovní zátěže** ale potýká se s:
- Složitými víceslužbovými AI architekturami
- Nejlepšími postupy nasazení AI do produkce  
- Integrací a konfigurací Azure AI služeb
- Optimalizací nákladů na AI pracovní zátěže
- Řešením specifických problémů s nasazením AI

### Cíle učení

Dokončením tohoto strukturovaného kurzu budete:
- **Ovládat základy AZD**: Klíčové koncepty, instalace a konfigurace
- **Nasazovat AI aplikace**: Používat AZD s Microsoft Foundry službami
- **Implementovat infrastrukturu jako kód**: Spravovat Azure zdroje pomocí Bicep šablon
- **Řešit problémy s nasazením**: Odstraňovat běžné chyby a debugovat potíže
- **Optimalizovat pro produkci**: Zabezpečení, škálování, monitorování a řízení nákladů
- **Budovat multi-agentní řešení**: Nasazovat složité AI architektury

## 📚 Vzdělávací kapitoly

*Vyberte si vzdělávací cestu podle úrovně zkušeností a cílů*

### 🚀 Kapitola 1: Základy & Rychlý start
**Předpoklady**: Azure předplatné, základní znalost příkazové řádky  
**Doba trvání**: 30-45 minut  
**Složitost**: ⭐

#### Co se naučíte
- Základy Azure Developer CLI
- Instalace AZD na vaší platformě
- Vaše první úspěšné nasazení

#### Vzdělávací zdroje
- **🎯 Začněte zde**: [Co je Azure Developer CLI?](../..)
- **📖 Teorie**: [Základy AZD](docs/getting-started/azd-basics.md) - Základní koncepty a terminologie
- **⚙️ Nastavení**: [Instalace a nastavení](docs/getting-started/installation.md) - Průvodci pro konkrétní platformy
- **🛠️ Prakticky**: [Váš první projekt](docs/getting-started/first-project.md) - Krok za krokem
- **📋 Rychlá reference**: [Přehled příkazů](resources/cheat-sheet.md)

#### Praktická cvičení
```bash
# Rychlá kontrola instalace
azd version

# Nasazení vaší první aplikace
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
azd down --force --purge  # Uklízí zdroje
```

**📊 Časová náročnost:** 30-45 minut  
**📈 Úroveň dovedností po dokončení:** Nezávislé nasazení základních aplikací

**✅ Ověření úspěchu:**
```bash
# Po dokončení kapitoly 1 byste měli být schopni:
azd version              # Zobrazuje nainstalovanou verzi
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasazuje do Azure
azd show                # Zobrazuje URL běžící aplikace
# Aplikace se otevře v prohlížeči a funguje
azd down --force --purge  # Ukončuje zdroje
```

**📊 Časová náročnost:** 30-45 minut  
**📈 Úroveň dovedností po dokončení:** Nezávislé nasazení základních aplikací

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (doporučeno pro AI vývojáře)
**Předpoklady**: Dokončená kapitola 1  
**Doba trvání**: 1-2 hodiny  
**Složitost**: ⭐⭐

#### Co se naučíte
- Integrace Microsoft Foundry s AZD
- Nasazení AI aplikací
- Porozumění konfiguracím AI služeb

#### Vzdělávací zdroje
- **🎯 Začněte zde**: [Integrace Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Vzory**: [Nasazení AI modelů](docs/microsoft-foundry/ai-model-deployment.md) - Nasazení a správa AI modelů
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Připravte svá AI řešení pro AZD
- **🎥 Interaktivní průvodce**: [Materiály workshopu](workshop/README.md) - Učení v prohlížeči s MkDocs * DevContainer prostředí
- **📋 Šablony**: [Microsoft Foundry šablony](../..)
- **📝 Příklady**: [Příklady nasazení AZD](examples/README.md)

#### Praktická cvičení
```bash
# Nasadit vaši první AI aplikaci
azd init --template azure-search-openai-demo
azd up

# Vyzkoušejte další AI šablony
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledek kapitoly**: Nasadit a nakonfigurovat AI chatovací aplikaci s funkcemi RAG

**✅ Ověření úspěchu:**
```bash
# Po kapitole 2 byste měli být schopni:
azd init --template azure-search-openai-demo
azd up
# Testovat rozhraní AI chatu
# Pokládat otázky a získávat odpovědi s podporou AI se zdroji
# Ověřit, že integrace vyhledávání funguje
azd monitor  # Zkontrolovat, že Application Insights zobrazuje telemetrii
azd down --force --purge
```

**📊 Časová náročnost:** 1-2 hodiny  
**📈 Úroveň dovedností po dokončení:** Schopnost nasadit a nakonfigurovat AI aplikace připravené pro produkci  
**💰 Povědomí o nákladech:** Pochopení nákladů $80-150/měsíc pro vývoj, $300-3500/měsíc pro produkci

#### 💰 Nákladové aspekty nasazení AI

**Vývojové prostředí (odhad $80-150/měsíc):**
- Azure OpenAI (pay-as-you-go): $0-50/měsíc (dle využití tokenů)
- AI Search (základní úroveň): $75/měsíc
- Container Apps (spotřeba): $0-20/měsíc
- Úložiště (standardní): $1-5/měsíc

**Produkční prostředí (odhad $300-3,500+/měsíc):**
- Azure OpenAI (PTU pro stabilní výkon): $3,000+/měsíc NEBO pay-as-you-go při vysokém objemu
- AI Search (standardní úroveň): $250/měsíc
- Container Apps (vyhrazené): $50-100/měsíc
- Application Insights: $5-50/měsíc
- Úložiště (prémiové): $10-50/měsíc

**💡 Tipy pro optimalizaci nákladů:**
- Používejte **Free Tier** Azure OpenAI pro učení (50 000 tokenů/měsíc zdarma)
- Spouštějte `azd down` pro uvolnění zdrojů, když nevyvíjíte aktivně
- Začněte s účtováním založeným na spotřebě, přejděte na PTU pouze pro produkci
- Použijte `azd provision --preview` k odhadu nákladů před nasazením
- Aktivujte automatické škálování: plaťte pouze za skutečné využití

**Sledování nákladů:**
```bash
# Zkontrolujte odhadované měsíční náklady
azd provision --preview

# Sledujte skutečné náklady v Azure portálu
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurace & Autentizace
**Předpoklady**: Dokončená kapitola 1  
**Doba trvání**: 45-60 minut  
**Složitost**: ⭐⭐

#### Co se naučíte
- Konfigurace a správa prostředí
- Nejlepší postupy autentizace a zabezpečení
- Pojmenování a organizace zdrojů

#### Vzdělávací zdroje
- **📖 Konfigurace**: [Průvodce konfigurací](docs/getting-started/configuration.md) - Nastavení prostředí
- **🔐 Zabezpečení**: [Vzorové autentizace a spravovaná identita](docs/getting-started/authsecurity.md) - Vzory autentizace
- **📝 Příklady**: [Příklad databázové aplikace](examples/database-app/README.md) - AZD příklady databází

#### Praktická cvičení
- Konfigurace více prostředí (dev, staging, prod)
- Nastavení autentizace spravované identity
- Implementace konfigurací specifických pro prostředí

**💡 Výsledek kapitoly**: Spravovat více prostředí s řádnou autentizací a zabezpečením

---

### 🏗️ Kapitola 4: Infrastruktura jako kód & nasazení
**Předpoklady**: Dokončené kapitoly 1-3  
**Doba trvání**: 1-1,5 hodiny  
**Složitost**: ⭐⭐⭐

#### Co se naučíte
- Pokročilé vzory nasazení
- Infrastruktura jako kód s Bicep
- Strategie poskytování zdrojů

#### Vzdělávací zdroje
- **📖 Nasazení**: [Průvodce nasazením](docs/deployment/deployment-guide.md) - Kompletní pracovní postupy
- **🏗️ Poskytování**: [Poskytování zdrojů](docs/deployment/provisioning.md) - Správa Azure zdrojů
- **📝 Příklady**: [Příklad kontejnerové aplikace](../../examples/container-app) - Nasazení kontejnerů

#### Praktická cvičení
- Vytvoření vlastních Bicep šablon
- Nasazení víceslužbových aplikací
- Implementace blue-green nasazovacích strategií

**💡 Výsledek kapitoly**: Nasadit složité víceslužbové aplikace s použitím vlastních infrastrukturních šablon

---

### 🎯 Kapitola 5: Multi-agentní AI řešení (pokročilé)
**Předpoklady**: Dokončené kapitoly 1-2  
**Doba trvání**: 2-3 hodiny  
**Složitost**: ⭐⭐⭐⭐

#### Co se naučíte
- Vzory multi-agentní architektury
- Orchestrace a koordinace agentů  
- Produkční nasazení AI

#### Výukové zdroje  
- **🤖 Doporučený projekt**: [Řešení pro maloobchod s více agenty](examples/retail-scenario.md) - Kompletní implementace  
- **🛠️ ARM šablony**: [Balíček ARM šablon](../../examples/retail-multiagent-arm-template) - Jedním kliknutím nasazení  
- **📖 Architektura**: [Vzory koordinace více agentů](/docs/pre-deployment/coordination-patterns.md) - Vzory

#### Praktická cvičení  
```bash
# Nasaďte kompletní maloobchodní řešení s více agenty
cd examples/retail-multiagent-arm-template
./deploy.sh

# Prozkoumejte konfigurace agentů
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Výsledek kapitoly**: Nasadit a spravovat produkční řešení s více AI agenty se zákaznickými a skladovými agenty

---

### 🔍 Kapitola 6: Validace a plánování před nasazením  
**Předpoklady**: Dokončená kapitola 4  
**Doba trvání**: 1 hodina  
**Náročnost**: ⭐⭐

#### Co se naučíte  
- Plánování kapacity a validace zdrojů  
- Strategie výběru SKU  
- Předběžné kontroly a automatizace

#### Výukové zdroje  
- **📊 Plánování**: [Plánování kapacity](docs/pre-deployment/capacity-planning.md) - Validace zdrojů  
- **💰 Výběr**: [Výběr SKU](docs/pre-deployment/sku-selection.md) - Nákladově efektivní volby  
- **✅ Validace**: [Předběžné kontroly](docs/pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktická cvičení  
- Spustit skripty validace kapacity  
- Optimalizovat výběr SKU pro snížení nákladů  
- Implementovat automatizované kontroly před nasazením

**💡 Výsledek kapitoly**: Validovat a optimalizovat nasazení před jejich spuštěním

---

### 🚨 Kapitola 7: Řešení problémů a ladění  
**Předpoklady**: Dokončená libovolná kapitola o nasazení  
**Doba trvání**: 1–1,5 hodiny  
**Náročnost**: ⭐⭐

#### Co se naučíte  
- Systematické přístupy k ladění  
- Běžné problémy a řešení  
- Specifické řešení problémů AI

#### Výukové zdroje  
- **🔧 Běžné problémy**: [Běžné problémy](docs/troubleshooting/common-issues.md) - FAQ a řešení  
- **🕵️ Ladění**: [Průvodce laděním](docs/troubleshooting/debugging.md) - Krok za krokem strategie  
- **🤖 Problémy AI**: [AI-specifické řešení problémů](docs/troubleshooting/ai-troubleshooting.md) - Problémy AI služeb

#### Praktická cvičení  
- Diagnostikovat chyby nasazení  
- Vyřešit problémy s autentizací  
- Ladit konektivitu AI služeb

**💡 Výsledek kapitoly**: Samostatně diagnostikovat a řešit běžné problémy při nasazení

---

### 🏢 Kapitola 8: Produkční a podnikové vzory  
**Předpoklady**: Dokončené kapitoly 1–4  
**Doba trvání**: 2–3 hodiny  
**Náročnost**: ⭐⭐⭐⭐

#### Co se naučíte  
- Strategie produkčního nasazení  
- Podnikové bezpečnostní vzory  
- Sledování a optimalizace nákladů

#### Výukové zdroje  
- **🏭 Produkce**: [Nejlepší postupy produkční AI](docs/microsoft-foundry/production-ai-practices.md) - Podnikové vzory  
- **📝 Příklady**: [Příklad mikroservisů](../../examples/microservices) - Komplexní architektury  
- **📊 Monitoring**: [Integrace Application Insights](docs/pre-deployment/application-insights.md) - Monitorování

#### Praktická cvičení  
- Implementovat podnikové bezpečnostní vzory  
- Nastavit komplexní monitoring  
- Nasadit do produkce s patřičnou správou

**💡 Výsledek kapitoly**: Nasadit podnikové aplikace připravené na produkci s plnou funkcionalitou

---

## 🎓 Přehled workshopu: Praktická výuková zkušenost

> **⚠️ STAV WORKSHOPU: Aktivní vývoj**  
> Materiály workshopu jsou právě vyvíjeny a laděny. Základní moduly fungují, ale některé pokročilé části nejsou dokončeny. Aktivně pracujeme na dokončení veškerého obsahu. [Sledovat pokrok →](workshop/README.md)

### Interaktivní materiály workshopu  
**Komplexní praktická výuka s nástroji přímo v prohlížeči a řízenými cvičeními**

Materiály workshopu poskytují strukturovanou a interaktivní výukovou zkušenost, která doplňuje výše uvedený kapitoly založený obsah. Workshop je určen jak pro samostudium, tak pro řízené sezení s instruktorem.

#### 🛠️ Funkce workshopu  
- **Rozhraní v prohlížeči**: Kompletní workshop postavený na MkDocs s vyhledáváním, kopírováním a možností témat  
- **Integrace GitHub Codespaces**: Jedním kliknutím nastavení vývojového prostředí  
- **Strukturovaná výuková cesta**: 7 kroků řízených cvičení (celkem 3,5 hodiny)  
- **Objevování → Nasazení → Přizpůsobení**: Progresivní metodologie  
- **Interaktivní prostředí DevContainer**: Přednastavené nástroje a závislosti

#### 📚 Struktura workshopu  
Workshop následuje metodiku **Objevování → Nasazení → Přizpůsobení**:

1. **Fáze objevování** (45 minut)  
   - Prozkoumat šablony a služby Microsoft Foundry  
   - Porozumět vzorům architektury více agentů  
   - Přehled požadavků a předpokladů nasazení

2. **Fáze nasazení** (2 hodiny)  
   - Praktické nasazení AI aplikací pomocí AZD  
   - Konfigurace Azure AI služeb a koncových bodů  
   - Implementace bezpečnostních a autentizačních vzorů

3. **Fáze přizpůsobení** (45 minut)  
   - Úprava aplikací pro specifické případy použití  
   - Optimalizace pro produkční nasazení  
   - Implementace monitoringu a správy nákladů

#### 🚀 Začínáme s workshopem  
```bash
# Možnost 1: GitHub Codespaces (Doporučeno)
# Klikněte na "Code" → "Create codespace on main" v repozitáři

# Možnost 2: Lokální vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podle pokynů k nastavení v workshop/README.md
```
  
#### 🎯 Výsledky učení workshopu  
Po dokončení workshopu budou účastníci schopni:  
- **Nasazovat produkční AI aplikace**: Použití AZD se službami Microsoft Foundry  
- **Mistrovsky ovládat architektury více agentů**: Implementovat koordinovaná AI řešení  
- **Aplikovat osvědčené bezpečnostní postupy**: Konfigurace autentizace a přístupových práv  
- **Optimalizovat pro škálování**: Navrhnout nákladově efektivní a výkonná nasazení  
- **Řešit problémy nasazení**: Samostatně odstraňovat běžné chyby

#### 📖 Zdroje workshopu  
- **🎥 Interaktivní průvodce**: [Materiály workshopu](workshop/README.md) - Výukové prostředí v prohlížeči  
- **📋 Podrobný návod**: [Řízená cvičení](../../workshop/docs/instructions) - Detailní postupy  
- **🛠️ AI workshop laboratoř**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI zaměřená cvičení  
- **💡 Rychlý start**: [Průvodce nastavením workshopu](workshop/README.md#quick-start) - Konfigurace prostředí

**Ideální pro**: Firemní školení, univerzitní kurzy, samostudium a bootcampy vývojářů.

---

## 📖 Co je Azure Developer CLI?

Azure Developer CLI (azd) je vývojářské příkazové rozhraní zaměřené na urychlení procesu vývoje a nasazení aplikací do Azure. Nabízí:

- **Nasazení založená na šablonách** – Použití předpřipravených šablon pro běžné vzory aplikací  
- **Infrastruktura jako kód** – Správa Azure zdrojů pomocí Bicep nebo Terraform  
- **Integrované pracovní postupy** – Plynulé zajištění, nasazení a monitoring aplikací  
- **Přátelské pro vývojáře** – Optimalizováno pro produktivitu a uživatelskou zkušenost vývojáře

### **AZD + Microsoft Foundry: ideální pro AI nasazení**

**Proč AZD pro AI řešení?** AZD řeší hlavní výzvy, kterým vývojáři AI čelí:

- **AI připravené šablony** – Předkonfigurované šablony pro Azure OpenAI, Cognitive Services a ML zátěže  
- **Bezpečné AI nasazení** – Vlastní bezpečnostní vzory pro AI služby, API klíče a koncové body modelů  
- **Produkční AI vzory** – Nejlepší postupy pro škálovatelné, nákladově efektivní AI aplikace  
- **End-to-End AI workflow** – Od vývoje modelu po produkční nasazení s řádným monitoringem  
- **Optimalizace nákladů** – Chytré přidělení zdrojů a škálování pro AI zátěže  
- **Integrace Microsoft Foundry** – Plynulé připojení ke katalogu modelů a koncovým bodům Microsoft Foundry

---

## 🎯 Knihovna šablon a příkladů

### Doporučeno: Šablony Microsoft Foundry  
**Začněte zde, pokud nasazujete AI aplikace!**

> **Poznámka:** Tyto šablony demonstrují různé AI vzory. Některé jsou externí Azure Samples, jiné lokální implementace.

| Šablona | Kapitola | Náročnost | Služby | Typ |
|---------|----------|-----------|--------|-----|
| [**Začínáme s AI chatem**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externí |
| [**Začínáme s AI agenty**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externí |
| [**Azure Search + OpenAI demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externí |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externí |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externí |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externí |
| [**Řešení maloobchodu s více agenty**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokální** |

### Doporučeno: Kompletní výukové scénáře  
**Produkční šablony aplikací mapované na kapitoly výuky**

| Šablona | Výuková kapitola | Náročnost | Klíčové učení |
|---------|------------------|-----------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základní vzory nasazení AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementace RAG se Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrace Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Rámec agentů a volání funkcí |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Podniková orchestrací AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektura více agentů se zákaznickými a skladovými agenty |

### Učení podle typu příkladu

> **📌 Lokální vs. Externí příklady:**  
> **Lokální příklady** (v této repozitáři) = Ihned připravené k použití  
> **Externí příklady** (Azure Samples) = Klonování z odkazovaných repozitářů

#### Lokální příklady (Připravené k použití)  
- [**Řešení maloobchodu s více agenty**](examples/retail-scenario.md) - Kompletní produkční implementace s ARM šablonami  
  - Architektura více agentů (Zákaznický + Skladový agent)  
  - Kompletní monitoring a evaluace  
  - Jedním kliknutím nasazení přes ARM šablonu

#### Lokální příklady – kontejnerové aplikace (Kapitoly 2–5)  
**Komplexní příklady nasazení kontejnerů v tomto repozitáři:**  
- [**Příklady kontejnerových aplikací**](examples/container-app/README.md) - Kompletní průvodce nasazováním kontejnerů  
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základní REST API s režimem scale-to-zero  
  - [Architektura mikroservisů](../../examples/container-app/microservices) - Produkční více službové nasazení  
  - Rychlý start, produkční a pokročilé vzory nasazení  
  - Pokyny pro monitoring, bezpečnost a optimalizaci nákladů

#### Externí příklady – jednoduché aplikace (Kapitoly 1–2)  
**Klonujte tyto repozitáře Azure Samples pro start:**  
- [Jednoduchá webová aplikace – Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) – Základní vzory nasazení  
- [Statická webová stránka – React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) – Nasazení statického obsahu  
- [Kontejnerová aplikace – Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) – Nasazení REST API

#### Externí příklady – integrace databází (Kapitoly 3–4)  
- [Databázová aplikace – C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) – Vzory připojení k databázi  
- [Funkce + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) – Serverless datové workflow

#### Externí příklady – pokročilé vzory (Kapitoly 4–8)  
- [Java mikroservisy](https://github.com/Azure-Samples/java-microservices-aca-lab) – Víceslužbové architektury  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) – Zpracování na pozadí  
- [Podnikový ML pipeline](https://github.com/Azure-Samples/mlops-v2) – Produkční ML vzory

### Externí sbírky šablon  
- [**Oficiální galerie AZD šablon**](https://azure.github.io/awesome-azd/) – Kurátorská kolekce oficiálních a komunitních šablon  
- [**Azure Developer CLI šablony**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) – Dokumentace šablon Microsoft Learn
- [**Adresář příkladů**](examples/README.md) - Místní příklady ke studiu s podrobnými vysvětleními

---

## 📚 Výukové zdroje a odkazy

### Rychlé odkazy
- [**Přehled příkazů**](resources/cheat-sheet.md) - Základní příkazy azd uspořádané podle kapitol
- [**Glosář**](resources/glossary.md) - Terminologie Azure a azd  
- [**FAQ**](resources/faq.md) - Časté otázky podle kapitol výuky
- [**Studijní průvodce**](resources/study-guide.md) - Komplexní cvičení na procvičování

### Praktické workshopy
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Učte se nasazovat AI řešení pomocí AZD (2-3 hodiny)
- [**Interaktivní průvodce workshopem**](workshop/README.md) - Workshop v prohlížeči s MkDocs a DevContainer prostředím
- [**Strukturovaná výuková cesta**](../../workshop/docs/instructions) - 7-kroková cvičení (Objevování → Nasazení → Přizpůsobení)
- [**Workshop AZD pro začátečníky**](workshop/README.md) - Kompletní materiály workshopu s integrací GitHub Codespaces

### Externí výukové zdroje
- [Dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kalkulačka cen](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

---

## 🔧 Rychlý průvodce řešením problémů

**Běžné problémy, se kterými se začátečníci setkávají, a okamžitá řešení:**

### ❌ "azd: command not found"

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

### ❌ "Nenalezena žádná předplatná" nebo "Předplatné není nastaveno"

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

### ❌ "Nedostatečný kvóta" nebo "Kvóta překročena"

```bash
# Vyzkoušejte jiný Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Nebo použijte menší SKU při vývoji
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" selže během provádění

```bash
# Možnost 1: Vyčistit a zkusit znovu
azd down --force --purge
azd up

# Možnost 2: Opravit pouze infrastrukturu
azd provision

# Možnost 3: Zkontrolovat podrobné protokoly
azd show
azd logs
```

### ❌ "Autentizace selhala" nebo "Token vypršel"

```bash
# Znovu ověřit
az logout
az login

azd auth logout
azd auth login

# Ověřit autentizaci
az account show
```

### ❌ "Zdroj již existuje" nebo konflikty názvů

```bash
# AZD generuje unikátní jména, ale pokud dojde ke konfliktu:
azd down --force --purge

# Pak zkusit znovu s novým prostředím
azd env new dev-v2
azd up
```

### ❌ Nasazení šablony trvá příliš dlouho

**Normální doby čekání:**
- Jednoduchá webová aplikace: 5-10 minut
- Aplikace s databází: 10-15 minut
- AI aplikace: 15-25 minut (provisioning OpenAI je pomalý)

```bash
# Zkontrolujte průběh
azd show

# Pokud jste uvízli více než 30 minut, zkontrolujte Azure Portal:
azd monitor
# Hledejte neúspěšná nasazení
```

### ❌ "Přístup odepřen" nebo "Zakázáno"

```bash
# Zkontrolujte svou roli v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potřebujete minimálně roli "Přispěvatel"
# Požádejte správce Azure o udělení:
# - Přispěvatel (pro zdroje)
# - Správce přístupu uživatelů (pro přiřazení rolí)
```

### ❌ Nelze najít URL nasazené aplikace

```bash
# Zobrazit všechny koncové body služby
azd show

# Nebo otevřete Azure Portal
azd monitor

# Zkontrolujte konkrétní službu
azd env get-values
# Hledejte proměnné *_URL
```

### 📚 Kompletní zdroje pro řešení problémů

- **Průvodce běžnými problémy:** [Podrobné řešení](docs/troubleshooting/common-issues.md)
- **Specifické problémy AI:** [Řešení problémů AI](docs/troubleshooting/ai-troubleshooting.md)
- **Průvodce laděním:** [Krok za krokem ladění](docs/troubleshooting/debugging.md)
- **Získejte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

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

# Ověřit instalaci
azd version
```
</details>

<details>
<summary><strong>❌ "Nenalezena žádná předplatná" nebo "Předplatné není nastaveno"</strong></summary>

```bash
# Vypsat dostupné předplatné
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
<summary><strong>❌ "Nedostatečný kvóta" nebo "Kvóta překročena"</strong></summary>

```bash
# Vyzkoušejte jiný region Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Nebo použijte menší SKU ve vývoji
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" selže během provádění</strong></summary>

```bash
# Možnost 1: Vyčistit a zkusit znovu
azd down --force --purge
azd up

# Možnost 2: Pouze opravit infrastrukturu
azd provision

# Možnost 3: Zkontrolovat podrobné záznamy
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Autentizace selhala" nebo "Token vypršel"</strong></summary>

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
<summary><strong>❌ "Zdroj již existuje" nebo konflikty názvů</strong></summary>

```bash
# AZD generuje unikátní názvy, ale pokud dojde ke konfliktu:
azd down --force --purge

# Pak zkusí znovu s novým prostředím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasazení šablony trvá příliš dlouho</strong></summary>

**Normální doby čekání:**
- Jednoduchá webová aplikace: 5-10 minut
- Aplikace s databází: 10-15 minut
- AI aplikace: 15-25 minut (provisioning OpenAI je pomalý)

```bash
# Zkontrolujte pokrok
azd show

# Pokud uvíznete déle než 30 minut, zkontrolujte Azure Portal:
azd monitor
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
# - Správce přístupu uživatelů (pro přiřazení rolí)
```
</details>

<details>
<summary><strong>❌ Nelze najít URL nasazené aplikace</strong></summary>

```bash
# Zobrazit všechny koncové body služby
azd show

# Nebo otevřít Azure portál
azd monitor

# Zkontrolovat specifickou službu
azd env get-values
# Hledat proměnné *_URL
```
</details>

### 📚 Kompletní zdroje pro řešení problémů

- **Průvodce běžnými problémy:** [Podrobné řešení](docs/troubleshooting/common-issues.md)
- **Specifické problémy AI:** [Řešení problémů AI](docs/troubleshooting/ai-troubleshooting.md)
- **Průvodce laděním:** [Krok za krokem ladění](docs/troubleshooting/debugging.md)
- **Získejte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončení kurzu a certifikace

### Sledování pokroku
Sledujte svůj pokrok ve výuce každé kapitoly:

- [ ] **Kapitola 1**: Základy a rychlý start ✅
- [ ] **Kapitola 2**: Vývoj orientovaný na AI ✅  
- [ ] **Kapitola 3**: Konfigurace a autentizace ✅
- [ ] **Kapitola 4**: Infrastruktura jako kód a nasazení ✅
- [ ] **Kapitola 5**: Řešení AI s vícenásobnými agenty ✅
- [ ] **Kapitola 6**: Validace a plánování před nasazením ✅
- [ ] **Kapitola 7**: Řešení problémů a ladění ✅
- [ ] **Kapitola 8**: Produkční a podnikoví vzory ✅

### Ověření znalostí
Po dokončení každé kapitoly ověřte své znalosti takto:
1. **Praktické cvičení**: Dokončete nasazení z kapitoly
2. **Kontrola znalostí**: Projděte sekci FAQ pro danou kapitolu
3. **Diskuse v komunitě**: Sdílejte své zkušenosti na Azure Discordu
4. **Další kapitola**: Pokračujte na další úroveň složitosti

### Výhody dokončení kurzu
Po dokončení všech kapitol získáte:
- **Produkční zkušenosti**: Nasazené skutečné AI aplikace do Azure
- **Profesionální dovednosti**: Schopnosti nasazení připravené na podnikové prostředí  
- **Uzání v komunitě**: Aktivní člen Azure developer komunity
- **Kariérní růst**: Žádané znalosti AZD a AI nasazení

---

## 🤝 Komunita a podpora

### Získejte pomoc a podporu
- **Technické problémy**: [Nahlásit chyby a požádat o funkce](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky ke studiu**: [Microsoft Azure Discord komunita](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Specifická AI pomoc**: Přidejte se k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentace**: [Oficiální dokumentace Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Postřehy komunity z Microsoft Foundry Discordu

**Nedávné výsledky ankety v kanálu #Azure:**
- **45 %** vývojářů chce používat AZD pro AI pracovní zatížení
- **Hlavní výzvy**: Nasazení více služeb, správa přihlašovacích údajů, připravenost na produkci  
- **Nejčastější požadavky**: AI-specifické šablony, průvodce řešením problémů, osvědčené postupy

**Přidejte se k naší komunitě a:**
- Sdílejte své zkušenosti s AZD + AI a získejte pomoc
- Získejte přístup k předběžným verzím nových AI šablon
- Přispívejte k osvědčeným postupům nasazení AI
- Ovlivňujte budoucí vývoj funkcí AI + AZD

### Přispívání do kurzu
Vítáme vaše příspěvky! Přečtěte si náš [Průvodce přispíváním](CONTRIBUTING.md) s podrobnostmi o:
- **Vylepšení obsahu**: Rozšiřte stávající kapitoly a příklady
- **Nové příklady**: Přidejte reálné scénáře a šablony  
- **Překlady**: Pomozte udržovat vícejazyčnou podporu
- **Nahlášení chyb**: Zlepšete přesnost a srozumitelnost
- **Komunitní standardy**: Dodržujte naše inkluzivní zásady komunity

---

## 📄 Informace o kurzu

### Licence
Tento projekt je licencován pod licencí MIT - podrobnosti najdete v souboru [LICENSE](../../LICENSE).

### Související výukové zdroje Microsoftu

Náš tým vytváří další komplexní výukové kurzy:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pro začátečníky](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pro začátečníky](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agenti
[![AZD pro začátečníky](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pro začátečníky](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pro začátečníky](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti pro začátečníky](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Generativní AI
[![Generativní AI pro začátečníky](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativní AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Základní výuka
[![Strojové učení pro začátečníky](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science pro začátečníky](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Sada Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigace kurzem

**🚀 Připraveni začít se učit?**

**Začátečníci**: Začněte s [Kapitola 1: Základ a rychlý start](../..)  
**Vývojáři AI**: Přejděte na [Kapitolu 2: Vývoj s AI jako prioritou](../..)  
**Zkušení vývojáři**: Začněte s [Kapitolou 3: Konfigurace a autentizace](../..)

**Další kroky**: [Začněte Kapitolu 1 – Základy AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoliv usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nebereme odpovědnost za jakékoli nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->