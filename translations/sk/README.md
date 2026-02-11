# AZD pre začiatočníkov: Štruktúrovaná učebná cesta

![AZD pre začiatočníkov](../../translated_images/sk/azdbeginners.5527441dd9f74068.webp) 

[![GitHub sledovatelia](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub hviezdy](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatické preklady (vždy aktuálne)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabčina](../ar/README.md) | [Bengálčina](../bn/README.md) | [Bulharčina](../bg/README.md) | [Burmčina (Myanmar)](../my/README.md) | [Čínština (zjednodušená)](../zh-CN/README.md) | [Čínština (tradičná, Hongkong)](../zh-HK/README.md) | [Čínština (tradičná, Macao)](../zh-MO/README.md) | [Čínština (tradičná, Taiwan)](../zh-TW/README.md) | [Chorvátčina](../hr/README.md) | [Čeština](../cs/README.md) | [Dánčina](../da/README.md) | [Holandčina](../nl/README.md) | [Estónčina](../et/README.md) | [Fínčina](../fi/README.md) | [Francúzština](../fr/README.md) | [Nemčina](../de/README.md) | [Gréčtina](../el/README.md) | [Hebrejčina](../he/README.md) | [Hindčina](../hi/README.md) | [Maďarčina](../hu/README.md) | [Indonézština](../id/README.md) | [Taliančina](../it/README.md) | [Japončina](../ja/README.md) | [Kannadčina](../kn/README.md) | [Kórejčina](../ko/README.md) | [Litovčina](../lt/README.md) | [Malajčina](../ms/README.md) | [Malayalamčina](../ml/README.md) | [Maráthčina](../mr/README.md) | [Nepálčina](../ne/README.md) | [Nigerijský pidžin](../pcm/README.md) | [Norština](../no/README.md) | [Perzština (fársí)](../fa/README.md) | [Poľština](../pl/README.md) | [Portugalčina (Brazília)](../pt-BR/README.md) | [Portugalčina (Portugalsko)](../pt-PT/README.md) | [Pandžábčina (Gurmukhi)](../pa/README.md) | [Rumunčina](../ro/README.md) | [Ruština](../ru/README.md) | [Srbčina (cyrilika)](../sr/README.md) | [Slovenčina](./README.md) | [Slovinčina](../sl/README.md) | [Španielčina](../es/README.md) | [Svahilčina](../sw/README.md) | [Švédčina](../sv/README.md) | [Tagalog (filipínčina)](../tl/README.md) | [Tamilčina](../ta/README.md) | [Telugčina](../te/README.md) | [Thajčina](../th/README.md) | [Turečtina](../tr/README.md) | [Ukrajinčina](../uk/README.md) | [Urdčina](../ur/README.md) | [Vietnamčina](../vi/README.md)

> **Preferujete klonovanie lokálne?**
>
> Tento repozitár obsahuje viac ako 50 prekladov, čo výrazne zväčšuje veľkosť sťahovania. Ak chcete klonovať bez prekladov, použite sparse checkout:
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
> Toto vám poskytne všetko potrebné na dokončenie kurzu s omnoho rýchlejším stiahnutím.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Čo je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je pre vývojárov priateľský nástroj príkazového riadku, ktorý uľahčuje nasadzovanie aplikácií v Azure. Namiesto manuálneho vytvárania a prepájania desiatok Azure zdrojov môžete nasadiť celé aplikácie jediným príkazom.

### Čaro `azd up`

```bash
# Tento jediný príkaz robí všetko:
# ✅ Vytvára všetky Azure zdroje
# ✅ Konfiguruje sieťovanie a bezpečnosť
# ✅ Stavia váš aplikačný kód
# ✅ Nasadzuje do Azure
# ✅ Poskytuje vám funkčnú URL adresu
azd up
```

**To je všetko!** Žiadne klikanie v Azure Portal, žiadne zložité ARM šablóny na naučenie, žiadna manuálna konfigurácia - len funkčné aplikácie na Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Aký je rozdiel?

To je najčastejšia otázka, ktorú začínajúci kladú. Tu je jednoduchá odpoveď:

| Funkcia | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Účel** | Spravovať jednotlivé Azure zdroje | Nasadzovať kompletné aplikácie |
| **Prístup** | Zamerané na infraštruktúru | Zamerané na aplikácie |
| **Príklad** | `az webapp create --name myapp...` | `azd up` |
| **Krivka učenia** | Musíte poznať Azure služby | Stačí poznať svoju aplikáciu |
| **Najvhodnejšie pre** | DevOps, infraštruktúra | Vývojárov, prototypovanie |

### Jednoduchá analógia

- **Azure CLI** je ako mať všetky nástroje na stavbu domu - kladivá, píly, klince. Môžete postaviť čokoľvek, ale musíte rozumieť stavebníctvu.
- **Azure Developer CLI** je ako najatie dodávateľa - opíšete, čo chcete, a on sa postará o stavbu.

### Kedy použiť ktorý

| Scenár | Použiť tento |
|----------|----------|
| "Chcem rýchlo nasadiť svoju webovú aplikáciu" | `azd up` |
| "Potrebujem vytvoriť len storage účet" | `az storage account create` |
| "Staviam kompletnú AI aplikáciu" | `azd init --template azure-search-openai-demo` |
| "Potrebujem debugovať konkrétny Azure zdroj" | `az resource show` |
| "Chcem produkčné nasadenie pripravené za pár minút" | `azd up --environment production` |

### Spolupracujú!

AZD používa Azure CLI pod kapotou. Môžete používať oba:
```bash
# Nasadte svoju aplikáciu pomocou AZD
azd up

# Potom dolaďte konkrétne zdroje pomocou Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Nájdite šablóny v Awesome AZD

Nepúšťajte sa do toho od nuly! **Awesome AZD** je komunitná zbierka šablón pripravených na nasadenie:

| Zdroj | Popis |
|----------|-------------|
| 🔗 [**Galéria Awesome AZD**](https://azure.github.io/awesome-azd/) | Prezrite si 200+ šablón s nasadením na jedno kliknutie |
| 🔗 [**Odošlite šablónu**](https://github.com/Azure/awesome-azd/issues) | Prispievajte vlastnou šablónou komunite |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Dajte hviezdu a preskúmajte zdrojový kód |

### Populárne AI šablóny z Awesome AZD

```bash
# RAG chat s Azure OpenAI + AI vyhľadávanie
azd init --template azure-search-openai-demo

# Rýchla aplikácia AI chatu
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agentmi
azd init --template get-started-with-ai-agents
```

---

## 🎯 Začíname v 3 krokoch

### Krok 1: Nainštalujte AZD (2 minúty)

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

### Krok 2: Prihláste sa do Azure

```bash
azd auth login
```

### Krok 3: Nasadiť svoju prvú aplikáciu

```bash
# Inicializovať z šablóny
azd init --template todo-nodejs-mongo

# Nasadiť do Azure (vytvorí všetko!)
azd up
```

**🎉 Hotovo!** Vaša aplikácia je teraz nasadená na Azure.

### Upratanie (nezabudnite!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Ako používať tento kurz

Tento kurz je navrhnutý pre **postupné učenie** - začnite tam, kde sa cítite pohodlne a postupujte ďalej:

| Vaše skúsenosti | Začnite tu |
|-----------------|------------|
| **Úplne nový v Azure** | [Kap. 1: Základy](../..) |
| **Poznáte Azure, nový v AZD** | [Kap. 1: Základy](../..) |
| **Chcete nasadiť AI aplikácie** | [Kap. 2: Vývoj orientovaný na AI](../..) |
| **Chcete praktickú skúsenosť** | [🎓 Interaktívny Workshop](workshop/README.md) - 3-4 hodinový vedený lab |
| **Potrebujete produkčné vzory** | [Kap. 8: Produkcia & podnikové vzory](../..) |

### Rýchle nastavenie

1. **Vytvorte fork tohto repozitára**: [![GitHub forky](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Naklonujte si ho**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Získajte pomoc**: [Azure Discord komunita](https://discord.com/invite/ByRwuEEgH4)

> **Preferujete klonovanie lokálne?**
>
> Tento repozitár obsahuje viac ako 50 prekladov, čo výrazne zväčšuje veľkosť sťahovania. Ak chcete klonovať bez prekladov, použite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Toto vám poskytne všetko potrebné na dokončenie kurzu s omnoho rýchlejším stiahnutím.


## Prehľad kurzu

Ovládnite Azure Developer CLI (azd) prostredníctvom štruktúrovaných kapitol navrhnutých pre postupné učenie. **Špeciálny dôraz na nasadzovanie AI aplikácií s integráciou Microsoft Foundry.**

### Prečo je tento kurz nevyhnutný pre moderných vývojárov

Na základe poznatkov z komunity Microsoft Foundry na Discordu, **45% vývojárov chce použiť AZD pre AI pracovné zaťaženia**, ale čelia výzvam pri:
- Zložité viac-službové AI architektúry
- Odporúčané praxe pre nasadenie AI do produkcie  
- Integrácia a konfigurácia Azure AI služieb
- Optimalizácia nákladov pre AI pracovné zaťaženia
- Riešenie problémov špecifických pre nasadenie AI

### Učebné ciele

Po absolvovaní tohto štruktúrovaného kurzu budete:
- **Ovládnete základy AZD**: Základné koncepty, inštalácia a konfigurácia
- **Nasadíte AI aplikácie**: Použitie AZD s Microsoft Foundry službami
- **Implementujete infraštruktúru ako kód**: Spravovanie Azure zdrojov pomocou Bicep šablón
- **Riešenie problémov pri nasadení**: Riešenie bežných problémov a ladenie chýb
- **Optimalizácia pre produkciu**: Bezpečnosť, škálovanie, monitorovanie a správa nákladov
- **Vytváranie multi-agentových riešení**: Nasadzovanie zložitých AI architektúr

## 🗺️ Mapa kurzu: Rýchla navigácia podľa kapitol

Každá kapitola má samostatný README s učebnými cieľmi, rýchlym štartom a cvičeniami:

| Kapitola | Téma | Lekcie | Trvanie | Zložitosť |
|---------|-------|---------|----------|------------|
| **[Kap. 1: Základy](docs/chapter-01-foundation/README.md)** | Začíname | [Základy AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Inštalácia](docs/chapter-01-foundation/installation.md) &#124; [Prvý projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap. 2: Vývoj orientovaný na AI](docs/chapter-02-ai-development/README.md)** | Aplikácie orientované na AI | [Integrácia Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Nasadenie modelu](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hod | ⭐⭐ |
| **[Kap. 3: Konfigurácia](docs/chapter-03-configuration/README.md)** | Overenie & bezpečnosť | [Konfigurácia](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikácia a bezpečnosť](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap. 4: Infrastruktúra](docs/chapter-04-infrastructure/README.md)** | IaC a Nasadenie | [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionovanie](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 hod. | ⭐⭐⭐ |
| **[Kap. 5: Multi-agent](docs/chapter-05-multi-agent/README.md)** | Riešenia s AI agentmi | [Scenár maloobchodu](examples/retail-scenario.md) &#124; [Vzory koordinácie](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hod. | ⭐⭐⭐⭐ |
| **[Kap. 6: Prednasadenie](docs/chapter-06-pre-deployment/README.md)** | Plánovanie a validácia | [Kontroly pred nasadením](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hod. | ⭐⭐ |
| **[Kap. 7: Riešenie problémov](docs/chapter-07-troubleshooting/README.md)** | Ladenie a oprava | [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Ladenie](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problémy](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 hod. | ⭐⭐ |
| **[Kap. 8: Produkcia](docs/chapter-08-production/README.md)** | Podnikové vzory | [Postupy pre produkciu](docs/chapter-08-production/production-ai-practices.md) | 2-3 hod. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktické laboratórium | [Úvod](workshop/docs/instructions/0-Introduction.md) &#124; [Výber](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validácia](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Rozbor](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Demontáž infraštruktúry](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hod. | ⭐⭐ |

**Celková dĺžka kurzu:** ~10-14 hodín | **Postup zručností:** Začiatočník → Pripravený na produkciu

---

## 📚 Učebné kapitoly

*Vyberte si učebnú cestu podľa úrovne skúseností a cieľov*

### 🚀 Kapitola 1: Základy a Rýchly štart
**Požiadavky**: Predplatné Azure, základné znalosti príkazového riadku  
**Trvanie**: 30-45 minút  
**Zložitosť**: ⭐

#### Čo sa naučíte
- Pochopenie základov Azure Developer CLI
- Inštalácia AZD na vašej platforme
- Vaše prvé úspešné nasadenie

#### Učebné zdroje
- **🎯 Začnite tu**: [Čo je Azure Developer CLI?](../..)
- **📖 Teória**: [Základy AZD](docs/chapter-01-foundation/azd-basics.md) - Základné koncepty a terminológia
- **⚙️ Nastavenie**: [Inštalácia a nastavenie](docs/chapter-01-foundation/installation.md) - Návody pre konkrétne platformy
- **🛠️ Prakticky**: [Váš prvý projekt](docs/chapter-01-foundation/first-project.md) - Podrobný tutoriál
- **📋 Rýchla referencia**: [Cheat Sheet príkazov](resources/cheat-sheet.md)

#### Praktické cvičenia
```bash
# Rýchla kontrola inštalácie
azd version

# Nasaďte svoju prvú aplikáciu
azd init --template todo-nodejs-mongo
azd up
```

**💡 Výsledok kapitoly**: Úspešne nasadiť jednoduchú webovú aplikáciu do Azure pomocou AZD

**✅ Overenie úspechu:**
```bash
# Po dokončení kapitoly 1 by ste mali byť schopní:
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasadzuje na Azure
azd show                # Zobrazuje URL bežiacej aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Vyčistí zdroje
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Dokáže nasadiť základné aplikácie samostatne

**✅ Overenie úspechu:**
```bash
# Po dokončení kapitoly 1 by ste mali byť schopní:
azd version              # Zobrazuje nainštalovanú verziu
azd init --template todo-nodejs-mongo  # Inicializuje projekt
azd up                  # Nasadzuje do Azure
azd show                # Zobrazuje URL spustenej aplikácie
# Aplikácia sa otvorí v prehliadači a funguje
azd down --force --purge  # Vyčistí zdroje
```

**📊 Časová investícia:** 30-45 minút  
**📈 Úroveň zručností po:** Dokáže nasadiť základné aplikácie samostatne

---

### 🤖 Kapitola 2: Vývoj orientovaný na AI (Odporúčané pre AI vývojárov)
**Požiadavky**: Kapitola 1 dokončená  
**Trvanie**: 1-2 hod.  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Integrácia Microsoft Foundry s AZD
- Nasadzovanie aplikácií s podporou AI
- Pochopenie konfigurácií AI služieb

#### Učebné zdroje
- **🎯 Začnite tu**: [Integrácia Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenti**: [Sprievodca AI agentmi](docs/chapter-02-ai-development/agents.md) - Nasadzujte inteligentných agentov s AZD
- **📖 Vzory**: [Nasadenie AI modelov](docs/chapter-02-ai-development/ai-model-deployment.md) - Nasadzujte a spravujte AI modely
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripravte svoje AI riešenia pre AZD
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Učenie v prehliadači s MkDocs * DevContainer prostredím
- **📋 Šablóny**: [Šablóny Microsoft Foundry](../..)
- **📝 Príklady**: [Príklady nasadenia AZD](examples/README.md)

#### Praktické cvičenia
```bash
# Nasadiť svoju prvú AI aplikáciu
azd init --template azure-search-openai-demo
azd up

# Vyskúšajte ďalšie AI šablóny
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Výsledok kapitoly**: Nasadiť a nakonfigurovať chatovaciu aplikáciu s podporou AI a schopnosťami RAG

**✅ Overenie úspechu:**
```bash
# Po kapitole 2 by ste mali byť schopní:
azd init --template azure-search-openai-demo
azd up
# Otestovať chatovacie rozhranie AI
# Pýtať otázky a získať odpovede generované AI so zdrojmi
# Overiť, či integrácia vyhľadávania funguje
azd monitor  # Skontrolovať, či Application Insights zobrazuje telemetriu
azd down --force --purge
```

**📊 Časová investícia:** 1-2 hod.  
**📈 Úroveň zručností po:** Dokáže nasadiť a nakonfigurovať produkčne pripravené AI aplikácie  
**💰 Uvedomenie si nákladov:** Pochopiť výdavky vývoja $80-150/mesiac, náklady na produkciu $300-3500/mesiac

#### 💰 Úvahy o nákladoch pri AI nasadeniach

**Vývojové prostredie (odhad $80-150/mesiac):**
- Azure OpenAI (Pay-as-you-go): $0-50/mesiac (na základe použitia tokenov)
- AI Search (Basic tier): $75/mesiac
- Container Apps (Consumption): $0-20/mesiac
- Storage (Standard): $1-5/mesiac

**Produkčné prostredie (odhad $300-3,500+/mesiac):**
- Azure OpenAI (PTU pre konzistentný výkon): $3,000+/mesiac ALEBO Pay-as-you-go pri veľkom objeme
- AI Search (Standard tier): $250/mesiac
- Container Apps (Dedicated): $50-100/mesiac
- Application Insights: $5-50/mesiac
- Storage (Premium): $10-50/mesiac

**💡 Tipy na optimalizáciu nákladov:**
- Použite **Free Tier** Azure OpenAI na učenie (v cene zahrnutých 50 000 tokenov/mesiac)
- Spúšťajte `azd down` na uvoľnenie prostriedkov, keď aktívne nevyvíjate
- Začnite s účtovaním podľa spotreby, na PTU prejdite len pre produkciu
- Použite `azd provision --preview` na odhad nákladov pred nasadením
- Zapnite automatické škálovanie: plaťte len za skutočné využitie

**Monitoring nákladov:**
```bash
# Skontrolujte odhadované mesačné náklady
azd provision --preview

# Sledujte skutočné náklady v portáli Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitola 3: Konfigurácia a overovanie
**Požiadavky**: Kapitola 1 dokončená  
**Trvanie**: 45-60 minút  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Konfigurácia a správa prostredí
- Overovanie a osvedčené postupy bezpečnosti
- Názvoslovie a organizácia zdrojov

#### Učebné zdroje
- **📖 Konfigurácia**: [Sprievodca konfiguráciou](docs/chapter-03-configuration/configuration.md) - Nastavenie prostredia
- **🔐 Bezpečnosť**: [Vzory overovania a spravovaná identita](docs/chapter-03-configuration/authsecurity.md) - Vzory overovania
- **📝 Príklady**: [Príklad databázovej aplikácie](examples/database-app/README.md) - Príklady databáz v AZD

#### Praktické cvičenia
- Nakonfigurovať viacero prostredí (dev, staging, prod)
- Nastaviť overovanie pomocou spravovanej identity
- Implementovať konfigurácie špecifické pre prostredie

**💡 Výsledok kapitoly**: Spravovať viacero prostredí s náležitým overovaním a bezpečnosťou

---

### 🏗️ Kapitola 4: Infrastruktúra ako kód a nasadenie
**Požiadavky**: Kapitoly 1-3 dokončené  
**Trvanie**: 1-1,5 hod.  
**Zložitosť**: ⭐⭐⭐

#### Čo sa naučíte
- Pokročilé vzory nasadenia
- Infrastruktúra ako kód s Bicep
- Stratégie poskytovania zdrojov

#### Učebné zdroje
- **📖 Nasadenie**: [Sprievodca nasadením](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletné pracovné postupy
- **🏗️ Provisionovanie**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Správa Azure prostriedkov
- **📝 Príklady**: [Príklad Container App](../../examples/container-app) - Nasadenia v kontajneroch

#### Praktické cvičenia
- Vytvoriť vlastné Bicep šablóny
- Nasadiť viacslužbové aplikácie
- Implementovať stratégie blue-green nasadenia

**💡 Výsledok kapitoly**: Nasadiť zložité viacslužbové aplikácie pomocou vlastných šablón infraštruktúry

---

### 🎯 Kapitola 5: Viac-agentové AI riešenia (Pokročilé)
**Požiadavky**: Kapitoly 1-2 dokončené  
**Trvanie**: 2-3 hod.  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Vzory architektúry viac agentov
- Orchestrace a koordinácia agentov
- Produkčne pripravené nasadenia AI

#### Učebné zdroje
- **🤖 Hlavný projekt**: [Riešenie pre maloobchod s viacerými agentmi](examples/retail-scenario.md) - Kompletná implementácia
- **🛠️ ARM šablóny**: [Balík ARM šablón](../../examples/retail-multiagent-arm-template) - Nasadenie jedným kliknutím
- **📖 Architektúra**: [Vzory koordinácie viacerých agentov](docs/chapter-06-pre-deployment/coordination-patterns.md) - Vzory

#### Praktické cvičenia
```bash
# Nasadiť kompletné maloobchodné viacagentové riešenie
cd examples/retail-multiagent-arm-template
./deploy.sh

# Preskúmať konfigurácie agentov
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Výsledok kapitoly**: Nasadiť a spravovať produkčne pripravené viac-agentové AI riešenie s agentmi pre zákazníka a inventár

---

### 🔍 Kapitola 6: Validácia a plánovanie pred nasadením
**Požiadavky**: Kapitola 4 dokončená  
**Trvanie**: 1 hod.  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Plánovanie kapacity a validácia zdrojov
- Stratégie výberu SKU
- Kontroly pred nasadením a automatizácia

#### Učebné zdroje
- **📊 Plánovanie**: [Plánovanie kapacity](docs/chapter-06-pre-deployment/capacity-planning.md) - Validácia zdrojov
- **💰 Výber**: [Výber SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Nákladovo efektívne voľby
- **✅ Overenie**: [Kontroly pred nasadením](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizované skripty

#### Praktické cvičenia
- Spustiť skripty na validáciu kapacity
- Optimalizovať výber SKU z hľadiska nákladov
- Implementovať automatizované kontroly pred nasadením

**💡 Výsledok kapitoly**: Overiť a optimalizovať nasadenia pred vykonaním

---

### 🚨 Kapitola 7: Riešenie problémov a ladenie
**Požiadavky**: Dokončená ľubovoľná kapitola o nasadení  
**Trvanie**: 1-1,5 hod.  
**Zložitosť**: ⭐⭐

#### Čo sa naučíte
- Systematické prístupy k ladiacemu procesu
- Bežné problémy a riešenia
- Riešenie problémov špecifických pre AI

#### Učebné zdroje
- **🔧 Bežné problémy**: [Bežné problémy](docs/chapter-07-troubleshooting/common-issues.md) - FAQ a riešenia
- **🕵️ Ladenie**: [Sprievodca ladením](docs/chapter-07-troubleshooting/debugging.md) - Krok za krokom stratégie
- **🤖 AI problémy**: [Riešenie problémov špecifických pre AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problémy s AI službami

#### Praktické cvičenia
- Diagnostikovať zlyhania nasadenia
- Vyriešiť problémy s overovaním
- Ladenie konektivity AI služieb

**💡 Výsledok kapitoly**: Samostatne diagnostikovať a vyriešiť bežné problémy s nasadením

---

### 🏢 Kapitola 8: Produkcia a podnikové vzory
**Požiadavky**: Kapitoly 1-4 dokončené  
**Trvanie**: 2-3 hod.  
**Zložitosť**: ⭐⭐⭐⭐

#### Čo sa naučíte
- Stratégie nasadenia do produkcie
- Podnikové bezpečnostné vzory
- Monitorovanie a optimalizácia nákladov

#### Učebné zdroje
- **🏭 Produkcia**: [Postupy pre produkciu AI](docs/chapter-08-production/production-ai-practices.md) - Podnikové vzory
- **📝 Príklady**: [Príklad microservices](../../examples/microservices) - Zložité architektúry
- **📊 Monitorovanie**: [Integrácia Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitorovanie

#### Praktické cvičenia
- Implementovať podnikové bezpečnostné vzory
- Nastaviť komplexné monitorovanie
- Nasadiť do produkcie s náležitou správou

**💡 Výsledok kapitoly**: Nasadiť aplikácie pripravené pre podnik s plnými produkčnými možnosťami

---

## 🎓 Prehľad workshopu: Praktické učenie

> **⚠️ STAV WORKSHOPU: Prebieha vývoj**
> Materiály workshopu sú momentálne vyvíjané a dolaďované. Základné moduly sú funkčné, ale niektoré pokročilé sekcie sú neúplné. Aktívne pracujeme na dokončení celého obsahu. [Sledovať pokrok →](workshop/README.md)

### Interaktívne materiály workshopu
**Komplexné praktické učenie s nástrojmi v prehliadači a vedenými cvičeniami**

Naše materiály poskytujú štruktúrovaný, interaktívny vzdelávací zážitok, ktorý dopĺňa vyššie uvedené kapitoly osnovy. Workshop je navrhnutý pre samostatné štúdium aj vedené inštruktorom.

#### 🛠️ Funkcie workshopu
- **Rozhranie v prehliadači**: Kompletný workshop poháňaný MkDocs s vyhľadávaním, kopírovaním a funkciami tém
- **Integrácia s GitHub Codespaces**: Nastavenie vývojového prostredia jedným kliknutím
- **Štruktúrovaná učebná cesta**: 8-modulové vedené cvičenia (spolu 3–4 hodiny)
- **Progresívna metodológia**: Úvod → Výber → Overenie → Dekonštrukcia → Konfigurácia → Prispôsobenie → Vyčistenie → Zhrnutie
- **Interaktívne prostredie DevContainer**: Predkonfigurované nástroje a závislosti

#### 📚 Štruktúra modulov workshopu
Workshop nasleduje an **8-modulovú progresívnu metodológiu**, ktorá vás prevedie od objavovania po majstrovstvo v nasadzovaní:

| Modul | Téma | Čo budete robiť | Trvanie |
|--------|-------|----------------|----------|
| **0. Úvod** | Prehľad workshopu | Pochopíte ciele učenia, predpoklady, a štruktúru workshopu | 15 min |
| **1. Výber** | Objavovanie šablón | Preskúmajte AZD šablóny a vyberte správnu AI šablónu pre váš scenár | 20 min |
| **2. Overenie** | Nasadiť & Overiť | Nasadíte šablónu pomocou `azd up` a overíte, že infraštruktúra funguje | 30 min |
| **3. Dekonštrukcia** | Pochopiť štruktúru | Použite GitHub Copilot na preskúmanie architektúry šablóny, Bicep súborov, a organizácie kódu | 30 min |
| **4. Konfigurácia** | Hlboký ponor do azure.yaml | Ovládnite konfiguráciu `azure.yaml`, lifecycle hooks a premenné prostredia | 30 min |
| **5. Prispôsobenie** | Urobte si to po svojom | Povoliť AI Search, trasovanie, vyhodnocovanie a prispôsobiť pre váš scenár | 45 min |
| **6. Vyčistenie** | Vyčistiť | Bezpečne odstránite prostriedky pomocou `azd down --purge` | 15 min |
| **7. Zhrnutie** | Ďalšie kroky | Prejdete dosiahnuté výsledky, kľúčové koncepty a pokračujete vo vašej učebnej ceste | 15 min |

**Priebeh workshopu:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Začíname s workshopom
```bash
# Možnosť 1: GitHub Codespaces (Odporúčané)
# Kliknite na "Code" → "Create codespace on main" v repozitári

# Možnosť 2: Lokálny vývoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Postupujte podľa inštrukcií na nastavenie v workshop/README.md
```

#### 🎯 Učebné výsledky workshopu
Po absolvovaní workshopu budú účastníci:
- **Nasadzovať produkčné AI aplikácie**: Použiť AZD so službami Microsoft Foundry
- **Ovládnuť architektúry s viacerými agentmi**: Implementovať koordinované riešenia AI agentov
- **Implementovať bezpečnostné osvedčené postupy**: Konfigurovať autentifikáciu a riadenie prístupu
- **Optimalizovať pre škálovanie**: Navrhnúť nákladovo efektívne, výkonné nasadenia
- **Riešiť problémy s nasadením**: Nezávisle odstrániť bežné problémy

#### 📖 Zdroje workshopu
- **🎥 Interaktívny sprievodca**: [Materiály workshopu](workshop/README.md) - Prostredie učenia v prehliadači
- **📋 Inštrukcie po moduloch**:
  - [0. Úvod](workshop/docs/instructions/0-Introduction.md) - Prehľad workshopu a ciele
  - [1. Výber](workshop/docs/instructions/1-Select-AI-Template.md) - Nájsť a vybrať AI šablóny
  - [2. Overenie](workshop/docs/instructions/2-Validate-AI-Template.md) - Nasadiť a overiť šablóny
  - [3. Dekonštrukcia](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Preskúmať architektúru šablóny
  - [4. Konfigurácia](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovládnuť azure.yaml
  - [5. Prispôsobenie](workshop/docs/instructions/5-Customize-AI-Template.md) - Prispôsobiť pre váš scenár
  - [6. Vyčistenie](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Vyčistiť prostriedky
  - [7. Zhrnutie](workshop/docs/instructions/7-Wrap-up.md) - Prehľad a ďalšie kroky
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Cvičenia zamerané na AI
- **💡 Rýchly štart**: [Sprievodca nastavením workshopu](workshop/README.md#quick-start) - Konfigurácia prostredia

**Vhodné pre**: firemné školenia, univerzitné kurzy, samostatné štúdium a bootcampy pre vývojárov.

---

## 📖 Hlboký ponor: Možnosti AZD

Nad rámec základov poskytuje AZD silné funkcie pre produkčné nasadenia:

- **Nasadenia založené na šablónach** - Použite predpripravené šablóny pre bežné vzory aplikácií
- **Infrastruktúra ako kód** - Spravujte Azure prostriedky pomocou Bicep alebo Terraform  
- **Integrované pracovné postupy** - Bezproblémovo poskytujte, nasadzujte a monitorujte aplikácie
- **Priateľské pre vývojárov** - Optimalizované pre produktivitu a skúsenosť vývojára

### **AZD + Microsoft Foundry: Ideálne pre AI nasadenia**

**Prečo AZD pre AI riešenia?** AZD rieši hlavné výzvy, ktorým čelia AI vývojári:

- **Šablóny pripravené na AI** - Predkonfigurované šablóny pre Azure OpenAI, Cognitive Services a ML pracovné zaťaženia
- **Bezpečné AI nasadenia** - Vnútorné bezpečnostné vzory pre AI služby, API kľúče a koncové body modelov  
- **Produkčné AI vzory** - Osvedčené postupy pre škálovateľné, nákladovo efektívne nasadenia AI aplikácií
- **End-to-End AI pracovné postupy** - Od vývoja modelu po produkčné nasadenie s primeraným monitorovaním
- **Optimalizácia nákladov** - Inteligentné prideľovanie zdrojov a stratégie škálovania pre AI pracovné zaťaženia
- **Integrácia s Microsoft Foundry** - Bezproblémové prepojenie s katalógom modelov Microsoft Foundry a koncovými bodmi

---

## 🎯 Knižnica šablón a príkladov

### Vybrané: Šablóny Microsoft Foundry
**Začnite tu, ak nasadzujete AI aplikácie!**

> **Poznámka:** Tieto šablóny demonštrujú rôzne AI vzory. Niektoré sú externé Azure Samples, iné sú lokálne implementácie.

| Šablóna | Kapitola | Zložitosť | Služby | Typ |
|----------|---------|------------|----------|------|
| [**Začíname s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externé |
| [**Začíname s AI agentmi**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitola 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externé |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externé |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externé |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externé |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externé |
| [**Riešenie pre maloobchod s viacerými agentmi**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokálne** |

### Vybrané: Kompletné učebné scenáre
**Produkčné šablóny aplikácií mapované na učebné kapitoly**

| Template | Učebná kapitola | Zložitosť | Kľúčové poznatky |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitola 2 | ⭐ | Základné vzory nasadzovania AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitola 2 | ⭐⭐ | Implementácia RAG s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitola 4 | ⭐⭐ | Integrácia Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitola 5 | ⭐⭐⭐ | Rámec agentov a volanie funkcií |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitola 8 | ⭐⭐⭐ | Orchestrace enterprise AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitola 5 | ⭐⭐⭐⭐ | Architektúra s viacerými agentmi s agentmi pre zákazníka a zásoby |

### Učenie sa podľa typu príkladu

> **📌 Lokálne vs. Externé príklady:**  
> **Lokálne príklady** (v tomto repozitári) = Ihneď pripravené na použitie  
> **Externé príklady** (Azure Samples) = Naklonovať z prepojených repozitárov

#### Lokálne príklady (Pripravené na použitie)
- [**Riešenie pre maloobchod s viacerými agentmi**](examples/retail-scenario.md) - Kompletná produkčná implementácia s ARM šablónami
  - Architektúra s viacerými agentmi (Agent zákazníka + Agent zásob)
  - Komplexné monitorovanie a hodnotenie
  - Nasadenie jedným kliknutím cez ARM šablónu

#### Lokálne príklady - Kontajnerové aplikácie (Kapitoly 2-5)
**Komplexné príklady nasadzovania kontajnerov v tomto repozitári:**
- [**Container App Examples**](examples/container-app/README.md) - Kompletný návod na nasadenie do kontajnerov
  - [Jednoduché Flask API](../../examples/container-app/simple-flask-api) - Základné REST API so škálovaním na nulu
  - [Architektúra mikroservisov](../../examples/container-app/microservices) - Produkčné nasadenie s viacerými službami
  - Rýchly štart, Produkcia a Pokročilé vzory nasadenia
  - Usmernenia k monitorovaniu, bezpečnosti a optimalizácii nákladov

#### Externé príklady - Jednoduché aplikácie (Kapitoly 1-2)
**Naklonujte tieto Azure Samples repozitáre, aby ste začali:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Základné vzory nasadenia
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Nasadenie statického obsahu
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Nasadenie REST API

#### Externé príklady - Integrácia databázy (Kapitoly 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Vzory pripojenia k databáze
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dátový pracovný tok

#### Externé príklady - Pokročilé vzory (Kapitoly 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architektúry s viacerými službami
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Spracovanie na pozadí  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkčné ML vzory

### Externé zbierky šablón
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurátorská kolekcia oficiálnych a komunitných šablón
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentácia šablón Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokálne učebné príklady s podrobnými vysvetleniami

---

## 📚 Vzdelávacie zdroje a referencie

### Rýchle referencie
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Základné azd príkazy usporiadané podľa kapitoly
- [**Glossary**](resources/glossary.md) - Azure a azd terminológia  
- [**FAQ**](resources/faq.md) - Bežné otázky usporiadané podľa učebnej kapitoly
- [**Study Guide**](resources/study-guide.md) - Komplexné cvičenia na precvičenie

### Praktické workshopy
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Urobte vaše AI riešenia nasaditeľné cez AZD (2-3 hodiny)
- [**Interactive Workshop**](workshop/README.md) - 8-modulové vedené cvičenia s MkDocs a GitHub Codespaces
  - Nasleduje: Úvod → Výber → Overenie → Dekonštrukcia → Konfigurácia → Prispôsobenie → Vyčistenie → Zhrnutie

### Externé vzdelávacie zdroje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Rýchly sprievodca riešením problémov

**Bežné problémy, s ktorými sa začiatočníci stretávajú, a okamžité riešenia:**

<details>
<summary><strong>❌ "azd: príkaz nenájdený"</strong></summary>

```bash
# Najprv nainštalujte AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Overte inštaláciu
azd version
```
</details>

<details>
<summary><strong>❌ "Nebolo nájdené predplatné" or "Predplatné nie je nastavené"</strong></summary>

```bash
# Zoznam dostupných predplatných
az account list --output table

# Nastaviť predvolené predplatné
az account set --subscription "<subscription-id-or-name>"

# Nastaviť pre prostredie AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Overiť
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" alebo "Quota exceeded"</strong></summary>

```bash
# Vyskúšajte inú oblasť Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Alebo použite menšie SKU pri vývoji
# Upravte infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" zlyhá v polovici procesu</strong></summary>

```bash
# Možnosť 1: Vyčistiť a skúsiť znova
azd down --force --purge
azd up

# Možnosť 2: Iba opraviť infraštruktúru
azd provision

# Možnosť 3: Skontrolovať podrobný stav
azd show

# Možnosť 4: Skontrolovať protokoly v Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" alebo "Token expired"</strong></summary>

```bash
# Znovu overiť autentifikáciu
az logout
az login

azd auth logout
azd auth login

# Overiť autentifikáciu
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" alebo konflikty názvov</strong></summary>

```bash
# AZD generuje jedinečné mená, ale ak dôjde ku konfliktu:
azd down --force --purge

# Potom skúste znova s novým prostredím
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Nasadzovanie šablóny trvá príliš dlho</strong></summary>

**Normálne časy čakania:**
- Jednoduchá webová aplikácia: 5-10 minút
- Aplikácia s databázou: 10-15 minút
- AI aplikácie: 15-25 minút (provízia OpenAI je pomalá)

```bash
# Skontrolujte priebeh
azd show

# Ak ste zaseknutí viac ako 30 minút, skontrolujte Azure Portal:
azd monitor
# Hľadajte neúspešné nasadenia
```
</details>

<details>
<summary><strong>❌ "Permission denied" alebo "Forbidden"</strong></summary>

```bash
# Skontrolujte svoju rolu v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebujete minimálne rolu "Contributor"
# Požiadajte svojho správcu Azure, aby udelil:
# - Contributor (pre prostriedky)
# - User Access Administrator (pre prideľovanie rolí)
```
</details>

<details>
<summary><strong>❌ Nedá sa nájsť URL nasadenej aplikácie</strong></summary>

```bash
# Zobraziť všetky koncové body služieb
azd show

# Alebo otvorte portál Azure
azd monitor

# Skontrolujte konkrétnu službu
azd env get-values
# Hľadajte premenné *_URL
```
</details>

### 📚 Úplné zdroje riešenia problémov

- **Sprievodca bežnými problémami:** [Podrobné riešenia](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-špecifické problémy:** [Riešenie problémov s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Sprievodca ladením:** [Ladenie krok za krokom](docs/chapter-07-troubleshooting/debugging.md)
- **Získajte pomoc:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Dokončenie kurzu a certifikácia

### Sledovanie pokroku
Sledujte svoj pokrok v učení v jednotlivých kapitolách:

- [ ] **Chapter 1**: Základy & Rýchly štart ✅
- [ ] **Chapter 2**: Vývoj orientovaný na AI ✅  
- [ ] **Chapter 3**: Konfigurácia & Overovanie ✅
- [ ] **Chapter 4**: Infrastruktúra ako kód & Nasadenie ✅
- [ ] **Chapter 5**: Riešenia AI s viacerými agentmi ✅
- [ ] **Chapter 6**: Overenie a plánovanie pred nasadením ✅
- [ ] **Chapter 7**: Riešenie problémov & Ladenie ✅
- [ ] **Chapter 8**: Produkčné & Podnikové vzory ✅

### Overenie vedomostí
Po dokončení každej kapitoly si overte svoje znalosti takto:
1. **Praktické cvičenie**: Dokončite praktické nasadenie z kapitoly
2. **Kontrola vedomostí**: Prezrite si sekciu Často kladené otázky pre vašu kapitolu
3. **Diskusia v komunite**: Zdieľajte svoje skúsenosti v Azure Discord
4. **Ďalšia kapitola**: Postúpte na ďalšiu úroveň zložitosti

### Výhody dokončenia kurzu
Po dokončení všetkých kapitol získate:
- **Skúsenosti z produkcie**: Nasadili ste reálne AI aplikácie do Azure
- **Profesionálne zručnosti**: Schopnosť nasadzovať riešenia pripravené pre podnikové prostredie  
- **Komunitné uznanie**: Aktívny člen Azure vývojárskej komunity
- **Kariérny postup**: Žiadané zručnosti v oblasti AZD a nasadzovania AI

---

## 🤝 Komunita a podpora

### Ako získať pomoc a podporu
- **Technické problémy:** [Nahlásiť chyby a požiadať o funkcie](https://github.com/microsoft/azd-for-beginners/issues)
- **Otázky týkajúce sa učenia:** [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) a [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoc špecifická pre AI:** Pridajte sa k [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentácia:** [Oficiálna dokumentácia Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Komunitné postrehy z Microsoft Foundry Discord

**Nedávne výsledky ankety z kanála #Azure:**
- **45%** vývojárov chce používať AZD pre AI pracovné zaťaženia
- **Hlavné výzvy**: Nasadenia s viacerými službami, správa poverení, pripravenosť na produkciu  
- **Najčastejšie požadované**: Šablóny špecifické pre AI, návody na riešenie problémov, osvedčené postupy

**Pridajte sa k našej komunite a:**
- Zdieľajte svoje skúsenosti s AZD + AI a získajte pomoc
- Získajte prístup k skorým ukážkam nových AI šablón
- Prispievajte k osvedčeným postupom nasadzovania AI
- Ovplyvnite budúci vývoj funkcií AI + AZD

### Prispievanie do kurzu
Vítame príspevky! Pre detaily si prečítajte náš [sprievodca prispievaním](CONTRIBUTING.md) pre informácie o:
- **Vylepšenie obsahu**: Vylepšite existujúce kapitoly a príklady
- **Nové príklady**: Pridajte reálne scenáre a šablóny  
- **Preklad**: Pomôžte udržiavať viacjazyčnú podporu
- **Hlásenia chýb**: Zlepšite presnosť a zrozumiteľnosť
- **Komunitné štandardy**: Dodržiavajte naše inkluzívne pravidlá komunity

---

## 📄 Informácie o kurze

### Licencia
Tento projekt je licencovaný pod MIT licenciou - detaily nájdete v súbore [LICENSE](../../LICENSE).

### Súvisiace vzdelávacie zdroje Microsoftu

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

## 🗺️ Navigácia kurzu

**🚀 Pripravení začať sa učiť?**

**Začiatočníci**: Začnite s [Kapitola 1: Základy a Rýchly štart](../..)  
**Vývojári AI**: Prejdite na [Kapitola 2: Vývoj orientovaný na AI](../..)  
**Skúsení vývojári**: Začnite s [Kapitola 3: Konfigurácia a autentifikácia](../..)

**Ďalšie kroky**: [Začnite kapitolu 1 - Základy AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vylúčenie zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa usilujeme o presnosť, vezmite prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by sa mal považovať za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->