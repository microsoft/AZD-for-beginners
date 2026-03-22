# AZD För Nybörjare: En Strukturerad Läranderesa

![AZD-för-nybörjare](../../translated_images/sv/azdbeginners.5527441dd9f74068.webp) 

[![GitHub bevakare](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkar](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stjärnor](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiska översättningar (Alltid uppdaterade)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabiska](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgariska](../bg/README.md) | [Burmesiska (Myanmar)](../my/README.md) | [Kinesiska (förenklad)](../zh-CN/README.md) | [Kinesiska (traditionell, Hongkong)](../zh-HK/README.md) | [Kinesiska (traditionell, Macao)](../zh-MO/README.md) | [Kinesiska (traditionell, Taiwan)](../zh-TW/README.md) | [Kroatiska](../hr/README.md) | [Tjeckiska](../cs/README.md) | [Danska](../da/README.md) | [Nederländska](../nl/README.md) | [Estniska](../et/README.md) | [Finska](../fi/README.md) | [Franska](../fr/README.md) | [Tyska](../de/README.md) | [Grekiska](../el/README.md) | [Hebreiska](../he/README.md) | [Hindi](../hi/README.md) | [Ungerska](../hu/README.md) | [Indonesiska](../id/README.md) | [Italienska](../it/README.md) | [Japanska](../ja/README.md) | [Kannada](../kn/README.md) | [Koreanska](../ko/README.md) | [Litauiska](../lt/README.md) | [Malajiska](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigeriansk Pidgin](../pcm/README.md) | [Norska](../no/README.md) | [Persiska (Farsi)](../fa/README.md) | [Polska](../pl/README.md) | [Portugisiska (Brasilien)](../pt-BR/README.md) | [Portugisiska (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänska](../ro/README.md) | [Ryska](../ru/README.md) | [Serbiska (kyrilliska)](../sr/README.md) | [Slovakiska](../sk/README.md) | [Slovenska](../sl/README.md) | [Spanska](../es/README.md) | [Swahili](../sw/README.md) | [Svenska](./README.md) | [Tagalog (Filippinerna)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändska](../th/README.md) | [Turkiska](../tr/README.md) | [Ukrainska](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesiska](../vi/README.md)

> **Föredrar du att klona lokalt?**
>
> Detta arkiv innehåller över 50 språköversättningar som avsevärt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparse checkout:
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
> Detta ger dig allt du behöver för att slutföra kursen med en mycket snabbare nedladdning.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Nytt i azd idag

Azure Developer CLI har vuxit bortom traditionella webbappar och API:er. Idag är azd det enda verktyget för att distribuera **vilken som helst** applikation till Azure—inklusive AI-drivna applikationer och intelligenta agenter.

Detta innebär för dig:

- **AI-agenter är nu förstklassiga azd-arbetsbelastningar.** Du kan initiera, distribuera och hantera AI-agentprojekt med samma `azd init` → `azd up`-arbetsflöde som du redan kan.
- **Microsoft Foundry-integration** för in modellimplementering, agenthosting och konfiguration av AI-tjänster direkt i azd-mallens ekosystem.
- **Kärnarbetsflödet har inte förändrats.** Oavsett om du distribuerar en todo-app, en mikrotjänst eller en multi-agent AI-lösning är kommandona desamma.

Om du har använt azd tidigare är AI-stödet en naturlig förlängning—inte ett separat verktyg eller ett avancerat spår. Om du börjar från början lär du dig ett arbetsflöde som fungerar för allt.

---

## 🚀 Vad är Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** är ett utvecklarvänligt kommandoradsverktyg som gör det enkelt att distribuera applikationer till Azure. Istället för att manuellt skapa och koppla samman dussintals Azure-resurser kan du distribuera hela applikationer med ett enda kommando.

### Magin med `azd up`

```bash
# Detta enda kommando gör allt:
# ✅ Skapar alla Azure-resurser
# ✅ Konfigurerar nätverk och säkerhet
# ✅ Bygger din applikationskod
# ✅ Distribuerar till Azure
# ✅ Ger dig en fungerande URL
azd up
```

**Det är allt!** Ingen klickning i Azure-portalen, inga komplexa ARM-mallar att lära sig först, ingen manuell konfiguration - bara fungerande applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Vad är skillnaden?

Detta är den vanligaste frågan som nybörjare ställer. Här är det enkla svaret:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Syfte** | Hantera enskilda Azure-resurser | Distribuera kompletta applikationer |
| **Inriktning** | Infrastrukturfokuserad | Applikationsfokuserad |
| **Exempel** | `az webapp create --name myapp...` | `azd up` |
| **Inlärningskurva** | Måste kunna Azure-tjänster | Behöver bara känna din app |
| **Bäst för** | DevOps, Infrastruktur | Utvecklare, prototypframställning |

### Enkel analogi

- **Azure CLI** är som att ha alla verktyg för att bygga ett hus - hammare, sågar, spikar. Du kan bygga vad som helst, men du måste kunna byggande.
- **Azure Developer CLI** är som att anlita en entreprenör - du beskriver vad du vill ha, och de sköter byggandet.

### När ska man använda respektive

| Scenario | Använd detta |
|----------|--------------|
| "Jag vill snabbt distribuera min webbapp" | `azd up` |
| "Jag behöver bara skapa ett lagringskonto" | `az storage account create` |
| "Jag bygger en komplett AI-applikation" | `azd init --template azure-search-openai-demo` |
| "Jag behöver felsöka en specifik Azure-resurs" | `az resource show` |
| "Jag vill ha produktionsklar driftsättning på några minuter" | `azd up --environment production` |

### De fungerar tillsammans!

AZD använder Azure CLI under huven. Du kan använda båda:
```bash
# Distribuera din app med AZD
azd up

# Finjustera sedan specifika resurser med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Hitta mallar i Awesome AZD

Börja inte från början! **Awesome AZD** är communityns samling av redo-för-distribution-mallar:

| Resurs | Beskrivning |
|--------|-------------|
| 🔗 [**Awesome AZD-galleri**](https://azure.github.io/awesome-azd/) | Bläddra bland 200+ mallar med distribution i ett klick |
| 🔗 [**Skicka in en mall**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mall till communityn |
| 🔗 [**GitHub-förråd**](https://github.com/Azure/awesome-azd) | Ge en stjärna och utforska källkoden |

### Populära AI-mallar från Awesome AZD

```bash
# RAG-chatt med Microsoft Foundry-modeller + AI-sökning
azd init --template azure-search-openai-demo

# Snabb AI-chattapplikation
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry-agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom igång i 3 steg

### Steg 1: Installera AZD (2 minuter)

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

### Steg 2: Logga in på Azure

```bash
azd auth login
```

### Steg 3: Distribuera din första app

```bash
# Initiera från en mall
azd init --template todo-nodejs-mongo

# Distribuera till Azure (skapar allt!)
azd up
```

**🎉 Det är allt!** Din app är nu live på Azure.

### Rensa upp (Glöm inte!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hur du använder den här kursen

Denna kurs är designad för **progressivt lärande** - börja där du känner dig bekväm och arbeta dig uppåt:

| Din erfarenhet | Börja här |
|----------------|-----------|
| **Helt ny med Azure** | [Kapitel 1: Grund](../..) |
| **Kan Azure, ny med AZD** | [Kapitel 1: Grund](../..) |
| **Vill distribuera AI-appar** | [Kapitel 2: AI-först-utveckling](../..) |
| **Vill ha praktisk övning** | [🎓 Interaktiv workshop](workshop/README.md) - 3–4 timmars guidad labb |
| **Behöver produktionsmönster** | [Kapitel 8: Produktion & Företag](../..) |

### Snabb uppsättning

1. **Forka det här förrådet**: [![GitHub forkar](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klona det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjälp**: [Azure Discord-community](https://discord.com/invite/ByRwuEEgH4)

> **Föredrar du att klona lokalt?**

> Detta arkiv innehåller över 50 språköversättningar som avsevärt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Detta ger dig allt du behöver för att slutföra kursen med en mycket snabbare nedladdning.


## Kursöversikt

Bemästra Azure Developer CLI (azd) genom strukturerade kapitel utformade för progressivt lärande. **Särskilt fokus på distribution av AI-applikationer med Microsoft Foundry-integration.**

### Varför den här kursen är viktig för moderna utvecklare

Baserat på insikter från Microsoft Foundry Discord-gemenskapen vill **45 % av utvecklarna använda AZD för AI-arbetsbelastningar** men stöter på utmaningar med:
- Komplexa AI-arkitekturer med flera tjänster
- Bästa praxis för att driftsätta AI i produktion  
- Integrering och konfiguration av Azure AI-tjänster
- Kostnadsoptimering för AI-arbetsbelastningar
- Felsökning av AI-specifika driftsättningsproblem

### Lärandemål

Genom att slutföra denna strukturerade kurs kommer du att:
- **Bemästra AZD-grunderna**: kärnkoncept, installation och konfiguration
- **Distribuera AI-applikationer**: använd AZD med Microsoft Foundry-tjänster
- **Implementera Infrastruktur som kod**: hantera Azure-resurser med Bicep-mallar
- **Felsöka driftsättningar**: lös vanliga problem och debugga fel
- **Optimera för produktion**: säkerhet, skalning, övervakning och kostnadshantering
- **Bygga lösningar med flera agenter**: distribuera komplexa AI-arkitekturer

## 🗺️ Kurskarta: Snabb navigering per kapitel

Varje kapitel har en dedikerad README med lärandemål, snabba starter och övningar:

| Kapitel | Ämne | Lektioner | Varaktighet | Komplexitet |
|---------|-------|----------|------------|------------|
| **[Kap 1: Grund](docs/chapter-01-foundation/README.md)** | Kom igång | [AZD-grunderna](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Första projektet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utveckling](docs/chapter-02-ai-development/README.md)** | AI-fokuserade appar | [Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modellutplacering](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 timmar | ⭐⭐ |
| **[Kap 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Autentisering & Säkerhet | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Autentisering & Säkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Driftsättning | [Driftsättningsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 timmar | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI-agentlösningar | [Detaljhandels-scenario](examples/retail-scenario.md) &#124; [Koordinationsmönster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 timmar | ⭐⭐⭐⭐ |
| **[Kap 6: Inför driftsättning](docs/chapter-06-pre-deployment/README.md)** | Planering & Validering | [Preflight-kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitetsplanering](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-val](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 timme | ⭐⭐ |
| **[Kap 7: Felsökning](docs/chapter-07-troubleshooting/README.md)** | Felsökning & Åtgärd | [Vanliga problem](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Felsökning](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problem](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 timmar | ⭐⭐ |
| **[Kap 8: Produktion](docs/chapter-08-production/README.md)** | Företagsmönster | [Produktionspraxis](docs/chapter-08-production/production-ai-practices.md) | 2-3 timmar | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk labb | [Introduktion](workshop/docs/instructions/0-Introduction.md) &#124; [Val](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbrytning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Anpassning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedmontering](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Avslutning](workshop/docs/instructions/7-Wrap-up.md) | 3-4 timmar | ⭐⭐ |

**Total kurslängd:** ~10-14 timmar | **Färdighetsutveckling:** Nybörjare → Produktionsklar

---

## 📚 Lärandekapitel

*Välj din lärväg baserat på erfarenhetsnivå och mål*

### 🚀 Kapitel 1: Grund & Snabbstart
**Förutsättningar**: Azure-prenumeration, grundläggande kunskap om kommandoraden  
**Varaktighet**: 30-45 minuter  
**Komplexitet**: ⭐

#### Vad du kommer att lära dig
- Förstå grunderna i Azure Developer CLI
- Installera AZD på din plattform
- Din första lyckade driftsättning

#### Lärresurser
- **🎯 Börja här**: [Vad är Azure Developer CLI?](../..)
- **📖 Teori**: [AZD-grunderna](docs/chapter-01-foundation/azd-basics.md) - Grundläggande koncept och terminologi
- **⚙️ Installation**: [Installation & konfiguration](docs/chapter-01-foundation/installation.md) - Plattformspecifika guider
- **🛠️ Praktiskt**: [Ditt första projekt](docs/chapter-01-foundation/first-project.md) - Steg-för-steg-handledning
- **📋 Snabbreferens**: [Kommandosammanfattning](resources/cheat-sheet.md)

#### Praktiska övningar
```bash
# Snabb installationskontroll
azd version

# Distribuera din första applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Distribuera framgångsrikt en enkel webbapplikation till Azure med AZD

**✅ Framgångsvalidering:**
```bash
# Efter att ha slutfört Kapitel 1 bör du kunna:
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initierar projekt
azd up                  # Distribuerar till Azure
azd show                # Visar URL för den körande appen
# Applikationen öppnas i webbläsaren och fungerar
azd down --force --purge  # Rensar upp resurser
```

**📊 Tidsinvestering:** 30-45 minuter  
**📈 Färdighetsnivå efter:** Kan självständigt driftsätta grundläggande applikationer
**📈 Färdighetsnivå efter:** Kan självständigt driftsätta grundläggande applikationer

---

### 🤖 Kapitel 2: AI-fokuserad utveckling (Rekommenderas för AI-utvecklare)
**Förutsättningar**: Kapitel 1 avklarat  
**Varaktighet**: 1-2 timmar  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Microsoft Foundry-integration med AZD
- Driftsätta AI-drivna applikationer
- Förstå AI-tjänsternas konfigurationer

#### Lärresurser
- **🎯 Börja här**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI-agentguide](docs/chapter-02-ai-development/agents.md) - Driftsätt intelligenta agenter med AZD
- **📖 Mönster**: [AI-modellutplacering](docs/chapter-02-ai-development/ai-model-deployment.md) - Driftsätt och hantera AI-modeller
- **🛠️ Workshop**: [AI-workshop-labb](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-klara
- **🎥 Interaktiv guide**: [Workshopmaterial](workshop/README.md) - Webbläsarbaserat lärande med MkDocs * DevContainer-miljö
- **📋 Mallar**: [Microsoft Foundry-mallar](../..)
- **📝 Exempel**: [AZD-distributionsexempel](examples/README.md)

#### Praktiska övningar
```bash
# Distribuera din första AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prova ytterligare AI-mallar
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Driftsätt och konfigurera en AI-driven chattapplikation med RAG-funktionalitet

**✅ Framgångsvalidering:**
```bash
# Efter kapitel 2 ska du kunna:
azd init --template azure-search-openai-demo
azd up
# Testa AI-chattgränssnittet
# Ställa frågor och få AI-genererade svar med källor
# Verifiera att sökintegrationen fungerar
azd monitor  # Kontrollera att Application Insights visar telemetri
azd down --force --purge
```

**📊 Tidsinvestering:** 1-2 timmar  
**📈 Färdighetsnivå efter:** Kan driftsätta och konfigurera produktionsklara AI-applikationer  
**💰 Kostnadsmedvetenhet:** Förstå utvecklingskostnader på $80-150/månad, produktionskostnader $300-3,500/månad

#### 💰 Kostnadsöverväganden för AI-driftsättningar

**Utvecklingsmiljö (Beräknat $80-150/månad):**
- Microsoft Foundry-modeller (Pay-as-you-go): $0-50/månad (baserat på tokenanvändning)
- AI Search (Basic-nivå): $75/månad
- Container Apps (Consumption): $0-20/månad
- Lagring (Standard): $1-5/månad

**Produktionsmiljö (Beräknat $300-3,500+/månad):**
- Microsoft Foundry-modeller (PTU för konsekvent prestanda): $3,000+/månad ELLER Pay-as-you-go vid hög volym
- AI Search (Standard-nivå): $250/månad
- Container Apps (Dedicated): $50-100/månad
- Application Insights: $5-50/månad
- Lagring (Premium): $10-50/månad

**💡 Tips för kostnadsoptimering:**
- Använd **Free Tier** Microsoft Foundry-modeller för lärande (Azure OpenAI 50 000 tokens/månad inkluderat)
- Kör `azd down` för att avallokera resurser när du inte utvecklar aktivt
- Börja med förbrukningsbaserad fakturering, uppgradera till PTU endast för produktion
- Använd `azd provision --preview` för att uppskatta kostnader före distribution
- Aktivera autoskalning: betala endast för faktisk användning

**Kostnadsövervakning:**
```bash
# Kontrollera uppskattade månadskostnader
azd provision --preview

# Övervaka faktiska kostnader i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentisering
**Förutsättningar**: Kapitel 1 avklarat  
**Varaktighet**: 45-60 minuter  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Miljökonfiguration och hantering
- Autentisering och säkerhetsbästa praxis
- Resursnamngivning och organisering

#### Lärresurser
- **📖 Konfiguration**: [Konfigurationsguide](docs/chapter-03-configuration/configuration.md) - Miljöinställning
- **🔐 Säkerhet**: [Autentiseringsmönster och hanterad identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmönster
- **📝 Exempel**: [Databasappsexempel](examples/database-app/README.md) - AZD-databasexempel

#### Praktiska övningar
- Konfigurera flera miljöer (dev, staging, prod)
- Ställ in autentisering med hanterad identitet
- Implementera miljöspecifika konfigurationer

**💡 Kapitelresultat**: Hantera flera miljöer med korrekt autentisering och säkerhet

---

### 🏗️ Kapitel 4: Infrastruktur som kod & Driftsättning
**Förutsättningar**: Kapitel 1-3 avklarade  
**Varaktighet**: 1-1.5 timmar  
**Komplexitet**: ⭐⭐⭐

#### Vad du kommer att lära dig
- Avancerade driftsättningsmönster
- Infrastruktur som kod med Bicep
- Strategier för resursprovisionering

#### Lärresurser
- **📖 Driftsättning**: [Driftsättningsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletta arbetsflöden
- **🏗️ Provisionering**: [Provisionering av resurser](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurshantering
- **📝 Exempel**: [Containerappsexempel](../../examples/container-app) - Containeriserade driftsättningar

#### Praktiska övningar
- Skapa anpassade Bicep-mallar
- Driftsätt fler-tjänstapplikationer
- Implementera blue-green driftsättningsstrategier

**💡 Kapitelresultat**: Driftsätt komplexa fler-tjänst-applikationer med hjälp av anpassade infrastrukturmallar

---

### 🎯 Kapitel 5: Multi-agent AI-lösningar (Avancerat)
**Förutsättningar**: Kapitel 1-2 avklarade  
**Varaktighet**: 2-3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad du kommer att lära dig
- Arkitekturmönster för multi-agent
- Agentorkestrering och koordinering
- Produktionsklara AI-driftsättningar

#### Lärresurser
- **🤖 Utvalt projekt**: [Detaljhandels multi-agentlösning](examples/retail-scenario.md) - Komplett implementation
- **🛠️ ARM-mallar**: [ARM-mallspaket](../../examples/retail-multiagent-arm-template) - Driftsättning med ett klick
- **📖 Arkitektur**: [Koordinationsmönster för multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mönster

#### Praktiska övningar
```bash
# Distribuera hela detaljhandelslösningen med flera agenter
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforska agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Driftsätt och hantera en produktionsklar multi-agent AI-lösning med kund- och lageragenter

---

### 🔍 Kapitel 6: Inför driftsättning - Validering & planering
**Förutsättningar**: Kapitel 4 avklarat  
**Varaktighet**: 1 timme  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Kapacitetsplanering och resursvalidering
- Strategier för SKU-val
- Preflight-kontroller och automation

#### Lärresurser
- **📊 Planering**: [Kapacitetsplanering](docs/chapter-06-pre-deployment/capacity-planning.md) - Resursvalidering
- **💰 Val**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektiva val
- **✅ Validering**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserade skript

#### Praktiska övningar
- Kör skript för kapacitetsvalidering
- Optimera SKU-val för kostnadseffektivitet
- Implementera automatiserade fördriftsättningskontroller

**💡 Kapitelresultat**: Validera och optimera driftsättningar innan genomförande

---

### 🚨 Kapitel 7: Felsökning & åtgärd
**Förutsättningar**: Något driftsättningskapitel avklarat  
**Varaktighet**: 1-1.5 timmar  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Systematiska felsökningsmetoder
- Vanliga problem och lösningar
- AI-specifik felsökning

#### Lärresurser
- **🔧 Vanliga problem**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ och lösningar
- **🕵️ Felsökning**: [Felsökningsguide](docs/chapter-07-troubleshooting/debugging.md) - Steg-för-steg-strategier
- **🤖 AI-problem**: [AI-specifik felsökning](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problem med AI-tjänster

#### Praktiska övningar
- Diagnostisera driftsättningsfel
- Åtgärda autentiseringsproblem
- Felsök anslutning till AI-tjänster

**💡 Kapitelresultat**: Diagnostisera och åtgärda vanliga driftsättningsproblem självständigt

---

### 🏢 Kapitel 8: Produktion & Företagsmönster
**Förutsättningar**: Kapitel 1-4 avklarade  
**Varaktighet**: 2-3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad du kommer att lära dig
- Strategier för produktionsdriftsättning
- Säkerhetsmönster för företag
- Övervakning och kostnadsoptimering

#### Lärresurser
- **🏭 Produktion**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Företagsmönster
- **📝 Exempel**: [Microservices Example](../../examples/microservices) - Komplexa arkitekturer
- **📊 Övervakning**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Övervakning

#### Praktiska Övningar
- Implementera säkerhetsmönster för företag
- Sätt upp omfattande övervakning
- Distribuera till produktion med korrekt styrning

**💡 Kapitlets resultat**: Distribuera företagsklara applikationer med fulla produktionsmöjligheter

---

## 🎓 Workshopöversikt: Praktisk lärandeupplevelse

> **⚠️ WORKSHOPSTATUS: Aktiv utveckling**  
> Workshopmaterialet utvecklas och förfinas för närvarande. Kärnmodulerna fungerar, men vissa avancerade sektioner är ofullständiga. Vi arbetar aktivt med att slutföra allt innehåll. [Följ framstegen →](workshop/README.md)

### Interaktiva workshopmaterial
**Omfattande praktiskt lärande med webbläsarbaserade verktyg och guidade övningar**

Våra workshopmaterial ger en strukturerad, interaktiv lärandeupplevelse som kompletterar kapitlen ovan. Workshopen är utformad för både självstudier och instruktörsledda sessioner.

#### 🛠️ Workshopfunktioner
- **Webbläsarbaserat gränssnitt**: Fullständig MkDocs-driven workshop med sök, kopiera och temafunktioner
- **GitHub Codespaces-integration**: Ettklicksinställning av utvecklingsmiljö
- **Strukturerad lärväg**: 8-modulers guidade övningar (3–4 timmar totalt)
- **Progressiv metodik**: Introduktion → Urval → Validering → Nedbrytning → Konfiguration → Anpassning → Nedmontering → Avslut
- **Interaktiv DevContainer-miljö**: Förkonfigurerade verktyg och beroenden

#### 📚 Workshopmodulstruktur
Workshopen följer en **8-modulers progressiv metodik** som tar dig från upptäckt till driftsättningsexpertis:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshopflöde:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Komma igång med workshopen
```bash
# Alternativ 1: GitHub Codespaces (Rekommenderat)
# Klicka på "Code" → "Create codespace on main" i repositoryn

# Alternativ 2: Lokal utveckling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Följ installationsinstruktionerna i workshop/README.md
```

#### 🎯 Workshopens lärandemål
Genom att genomföra workshopen kommer deltagarna att:
- **Distribuera produktions-AI-applikationer**: Använd AZD med Microsoft Foundry-tjänster
- **Bemästra multi-agentarkitekturer**: Implementera koordinerade AI-agentlösningar
- **Implementera bästa praxis för säkerhet**: Konfigurera autentisering och åtkomstkontroll
- **Optimera för skalning**: Designa kostnadseffektiva, högpresterande distributioner
- **Felsöka distributioner**: Åtgärda vanliga problem på egen hand

#### 📖 Workshopresurser
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Webbläsarbaserad lärandemiljö
- **📋 Modul-för-modul-instruktioner**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshopöversikt och mål
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Hitta och välj AI-mallar
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuera och verifiera mallar
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforska mallarkitektur
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Bemästra azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Anpassa för ditt scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rensa upp resurser
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Granskning och nästa steg
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserade övningar
- **💡 Snabbstart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljökonfiguration

**Perfekt för**: Företagsträning, universitetskurser, självstudier och utvecklarbootcamps.

---

## 📖 Djupdykning: AZD-funktioner

Bortom grunderna erbjuder AZD kraftfulla funktioner för produktionsdistributioner:

- **Mallbaserade distributioner** - Använd förbyggda mallar för vanliga applikationsmönster
- **Infrastructure as Code** - Hantera Azure-resurser med Bicep eller Terraform  
- **Integrerade arbetsflöden** - Provisionera, distribuera och övervaka applikationer sömlöst
- **Utvecklarvänligt** - Optimerat för utvecklarproduktivitet och upplevelse

### **AZD + Microsoft Foundry: Perfekt för AI-distributioner**

**Varför AZD för AI-lösningar?** AZD tar itu med de största utmaningarna som AI-utvecklare möter:

- **AI-klara mallar** - Förkonfigurerade mallar för Microsoft Foundry Models, Cognitive Services och ML-arbetslaster
- **Säkra AI-distributioner** - Inbyggda säkerhetsmönster för AI-tjänster, API-nycklar och modellendpoints  
- **Produktionsmönster för AI** - Bästa praxis för skalbara, kostnadseffektiva AI-applikationsdistributioner
- **End-to-end AI-arbetsflöden** - Från modelldesign till produktionsdrift med korrekt övervakning
- **Kostnadsoptimering** - Smart resursallokering och skalningsstrategier för AI-arbetslaster
- **Microsoft Foundry-integration** - Sömlig anslutning till Microsoft Foundrys modellkatalog och endpoints

---

## 🎯 Mallar & Exempelbibliotek

### Utvalda: Microsoft Foundry-mallar
**Börja här om du distribuerar AI-applikationer!**

> **Notera:** Dessa mallar demonstrerar olika AI-mönster. Vissa är externa Azure Samples, andra är lokala implementationer.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalda: Kompletta lärandescenarier
**Produktionsklara applikationsmallar kopplade till lärandeavsnitt**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundläggande AI-distributionsmönster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integrering av Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentramverk och funktionsanrop |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise-orkestrering för AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agentarkitektur med Customer- och Inventory-agenter |

### Lärande efter exempeltyp

> **📌 Lokala vs externa exempel:**  
> **Lokala exempel** (i detta repo) = Klara att använda omedelbart  
> **Externa exempel** (Azure Samples) = Klona från länkade repositories

#### Lokala exempel (Klara att använda)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Komplett produktionsklar implementation med ARM-mallar
  - Multi-agentarkitektur (Customer + Inventory-agenter)
  - Omfattande övervakning och utvärdering
  - Ettklicksdistribution via ARM-mall

#### Lokala exempel - Container-applikationer (Kapitel 2–5)
**Omfattande exempel på containerdistribueringar i detta repository:**
- [**Container App Examples**](examples/container-app/README.md) - Komplett guide till containeriserade distributioner
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Enkel REST-API med scale-to-zero
  - [Mikrotjänstarkitektur](../../examples/container-app/microservices) - Produktionsklar multi-service-distribution
  - Snabbstart, produktion och avancerade distributionsmönster
  - Vägledning för övervakning, säkerhet och kostnadsoptimering

#### Externa exempel - Enkla applikationer (Kapitel 1–2)
**Klona dessa Azure Samples-repositories för att komma igång:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundläggande distributionsmönster
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribution av statiskt innehåll
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Distribution av REST-API

#### Externa exempel - Dataintegration (Kapitel 3–4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mönster för databasanslutning
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverlösa dataarbetsflöden

#### Externa exempel - Avancerade mönster (Kapitel 4–8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service-arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklara ML-mönster

### Externa mallkollektioner
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuraterad samling av officiella och community-mallar
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn-malladokumentation
- [**Examples Directory**](examples/README.md) - Lokala lärandeexempel med detaljerade förklaringar

---

## 📚 Lärresurser & Referenser

### Snabbreferenser
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Viktiga azd-kommandon organiserade per kapitel
- [**Glossary**](resources/glossary.md) - Azure- och azd-terminologi  
- [**FAQ**](resources/faq.md) - Vanliga frågor organiserade per lärandeavsnitt
- [**Study Guide**](resources/study-guide.md) - Omfattande övningsuppgifter

### Praktiska workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gör dina AI-lösningar redo för AZD-distribution (2–3 timmar)
- [**Interaktiv workshop**](workshop/README.md) - 8-modulers guidade övningar med MkDocs och GitHub Codespaces
  - Följer: Introduktion → Urval → Validering → Nedbrytning → Konfiguration → Anpassning → Nedmontering → Avslut

### Externa lärresurser
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure prisräknare](https://azure.microsoft.com/pricing/calculator/)
- [Azure-status](https://status.azure.com/)

### AI-agentfärdigheter för din redigerare
- [**Microsoft Azure Skills på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 öppna agentfärdigheter för Azure AI, Foundry, distribution, diagnostik, kostnadsoptimering och mer. Installera dem i GitHub Copilot, Cursor, Claude Code eller någon stödd agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Snabb felsökningsguide

**Vanliga problem som nybörjare stöter på och omedelbara lösningar:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Installera AZD först
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifiera installationen
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Lista tillgängliga prenumerationer
az account list --output table

# Ange standardprenumeration
az account set --subscription "<subscription-id-or-name>"

# Ange för AZD-miljö
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiera
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Prova en annan Azure-region
azd env set AZURE_LOCATION "westus2"
azd up

# Eller använd mindre SKU:er i utveckling
# Redigera infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Alternativ 1: Rensa och försök igen
azd down --force --purge
azd up

# Alternativ 2: Åtgärda bara infrastrukturen
azd provision

# Alternativ 3: Kontrollera detaljerad status
azd show

# Alternativ 4: Kontrollera loggar i Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Autentisera igen
az logout
az login

azd auth logout
azd auth login

# Verifiera autentisering
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD genererar unika namn, men om det uppstår en konflikt:
azd down --force --purge

# Försök sedan igen med en ny miljö
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normala väntetider:**
- Enkel webbapp: 5-10 minuter
- App med databas: 10-15 minuter
- AI-applikationer: 15-25 minuter (OpenAI-provisionering går långsamt)

```bash
# Kontrollera framsteg
azd show

# Om du sitter fast i mer än 30 minuter, kontrollera Azure-portalen:
azd monitor
# Sök efter misslyckade distributioner
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Kontrollera din Azure-roll
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du behöver minst rollen "Contributor"
# Be din Azure-administratör att tilldela:
# - Contributor (för resurser)
# - User Access Administrator (för rolltilldelningar)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Visa alla serviceendpunkter
azd show

# Eller öppna Azure-portalen
azd monitor

# Kontrollera en specifik tjänst
azd env get-values
# Sök efter *_URL-variabler
```
</details>

### 📚 Fullständiga felsökningsresurser

- **Guide för vanliga problem:** [Detaljerade lösningar](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifika problem:** [AI-felsökning](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Felsökningsguide:** [Steg-för-steg felsökning](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjälp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursavslutning & certifiering

### Framstegsspårning
Spåra dina framsteg genom varje kapitel:

- [ ] **Kapitel 1**: Grundläggande & Snabbstart ✅
- [ ] **Kapitel 2**: AI-först utveckling ✅  
- [ ] **Kapitel 3**: Konfiguration & autentisering ✅
- [ ] **Kapitel 4**: Infrastruktur som kod & distribution ✅
- [ ] **Kapitel 5**: Flera agenters AI-lösningar ✅
- [ ] **Kapitel 6**: Validering och planering före distribution ✅
- [ ] **Kapitel 7**: Felsökning & debugging ✅
- [ ] **Kapitel 8**: Produktions- och företagsmönster ✅

### Verifiering av lärandet
Efter att du slutfört varje kapitel, verifiera din kunskap genom:
1. **Praktisk övning**: Slutför kapitlets praktiska driftsättning
2. **Kunskapskontroll**: Granska FAQ-avsnittet för ditt kapitel
3. **Communitydiskussion**: Dela din erfarenhet i Azure Discord
4. **Nästa kapitel**: Gå vidare till nästa komplexitetsnivå

### Fördelar vid kursavslutning
När du har slutfört alla kapitel kommer du att ha:
- **Produktionserfarenhet**: Distribuerat verkliga AI-applikationer i Azure
- **Professionella färdigheter**: Distributionskapacitet redo för företag  
- **Gemenskapserkännande**: Aktiv medlem i Azure-utvecklarsamhället
- **Karriärutveckling**: Efterfrågad AZD- och AI-distributionskompetens

---

## 🤝 Gemenskap & support

### Skaffa hjälp & support
- **Tekniska problem**: [Rapportera buggar och begära funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Lärandefrågor**: [Microsoft Azure Discord-community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjälp**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiell Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Communityinsikter från Microsoft Foundry Discord

**Senaste omröstningsresultat från #Azure-kanalen:**
- **45%** av utvecklare vill använda AZD för AI-arbetsbelastningar
- **Största utmaningarna**: distribution av flera tjänster, hantering av autentiseringsuppgifter, produktionsberedskap  
- **Mest efterfrågade**: AI-specifika mallar, felsökningsguider, bästa praxis

**Gå med i vår community för att:**
- Dela dina AZD + AI-upplevelser och få hjälp
- Få tillgång till tidiga förhandsversioner av nya AI-mallar
- Bidra till bästa praxis för AI-distribution
- Påverka framtida utveckling av AI + AZD-funktioner

### Bidra till kursen
Vi välkomnar bidrag! Läs vår [Bidragsguide](CONTRIBUTING.md) för detaljer om:
- **Innehållsförbättringar**: Förbättra befintliga kapitel och exempel
- **Nya exempel**: Lägg till verkliga scenarier och mallar  
- **Översättning**: Hjälp till att underhålla flerspråkigt stöd
- **Felrapporter**: Förbättra noggrannhet och tydlighet
- **Gemenskapsstandarder**: Följ våra inkluderande community-riktlinjer

---

## 📄 Kursinformation

### Licens
Detta projekt är licensierat under MIT-licensen - se filen [LICENSE](../../LICENSE) för detaljer.

### Relaterade Microsoft-lärresurser

Vårt team producerar andra omfattande utbildningskurser:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j för nybörjare](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js för nybörjare](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain för nybörjare](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD för nybörjare](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI för nybörjare](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP för nybörjare](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agenter för nybörjare](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI-serie
[![Generativ AI för nybörjare](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kärnkurser
[![ML för nybörjare](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science för nybörjare](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI för nybörjare](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersäkerhet för nybörjare](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webbutveckling för nybörjare](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT för nybörjare](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-utveckling för nybörjare](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot för AI-parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot för C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-äventyr](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigering

**🚀 Redo att börja lära dig?**

**Nybörjare**: Börja med [Kapitel 1: Grundläggande & Snabbstart](../..)  
**AI-utvecklare**: Hoppa till [Kapitel 2: AI-fokuserad utveckling](../..)  
**Erfarna utvecklare**: Börja med [Kapitel 3: Konfiguration & Autentisering](../..)

**Nästa steg**: [Påbörja Kapitel 1 - AZD-grunderna](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men observera att automatiska översättningar kan innehålla fel eller brister. Originaldokumentet på sitt ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->