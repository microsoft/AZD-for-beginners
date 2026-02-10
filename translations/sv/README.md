# AZD för nybörjare: En strukturerad läranderesa

![AZD-för-nybörjare](../../translated_images/sv/azdbeginners.5527441dd9f74068.webp) 

[![GitHub bevakare](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forkar](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stjärnor](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiska översättningar (alltid uppdaterade)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabiska](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgariska](../bg/README.md) | [Burmesiska (Myanmar)](../my/README.md) | [Kinesiska (förenklad)](../zh-CN/README.md) | [Kinesiska (traditionell, Hongkong)](../zh-HK/README.md) | [Kinesiska (traditionell, Macau)](../zh-MO/README.md) | [Kinesiska (traditionell, Taiwan)](../zh-TW/README.md) | [Kroatiska](../hr/README.md) | [Tjeckiska](../cs/README.md) | [Danska](../da/README.md) | [Nederländska](../nl/README.md) | [Estniska](../et/README.md) | [Finska](../fi/README.md) | [Franska](../fr/README.md) | [Tyska](../de/README.md) | [Grekiska](../el/README.md) | [Hebreiska](../he/README.md) | [Hindi](../hi/README.md) | [Ungerska](../hu/README.md) | [Indonesiska](../id/README.md) | [Italienska](../it/README.md) | [Japanska](../ja/README.md) | [Kannada](../kn/README.md) | [Koreanska](../ko/README.md) | [Litauiska](../lt/README.md) | [Malajiska](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesiska](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norska](../no/README.md) | [Persiska (Farsi)](../fa/README.md) | [Polska](../pl/README.md) | [Portugisiska (Brasilien)](../pt-BR/README.md) | [Portugisiska (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänska](../ro/README.md) | [Ryska](../ru/README.md) | [Serbiska (kyrilliska)](../sr/README.md) | [Slovakiska](../sk/README.md) | [Slovenska](../sl/README.md) | [Spanska](../es/README.md) | [Swahili](../sw/README.md) | [Svenska](./README.md) | [Tagalog (filippinska)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändska](../th/README.md) | [Turkiska](../tr/README.md) | [Ukrainska](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesiska](../vi/README.md)

> **Föredrar du att klona lokalt?**

> Detta arkiv innehåller 50+ språköversättningar vilket avsevärt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Detta ger dig allt du behöver för att slutföra kursen med en mycket snabbare nedladdning.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Vad är Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** är ett utvecklarvänligt kommandoradsverktyg som gör det enkelt att distribuera applikationer till Azure. Istället för att manuellt skapa och koppla dussintals Azure-resurser kan du distribuera hela applikationer med ett enda kommando.

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

**Det är allt!** Inget klickande i Azure-portalen, inga komplexa ARM-mallar att lära sig först, ingen manuell konfiguration - bara fungerande applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Vad är skillnaden?

Detta är den vanligaste frågan nybörjare ställer. Här är det enkla svaret:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Syfte** | Hantera enskilda Azure-resurser | Distribuera kompletta applikationer |
| **Inriktning** | Infrastrukturfokuserad | Applikationsfokuserad |
| **Exempel** | `az webapp create --name myapp...` | `azd up` |
| **Inlärningskurva** | Måste känna till Azure-tjänster | Behöver bara känna din app |
| **Bäst för** | DevOps, infrastruktur | Utvecklare, prototyping |

### Enkel liknelse

- **Azure CLI** är som att ha alla verktyg för att bygga ett hus - hammare, sågar, spikar. Du kan bygga vad som helst, men du behöver kunskap om byggande.
- **Azure Developer CLI** är som att anlita en entreprenör - du beskriver vad du vill ha, och de sköter byggandet.

### När man ska använda respektive

| Scenario | Använd detta |
|----------|----------|
| "Jag vill distribuera min webbapp snabbt" | `azd up` |
| "Jag behöver bara skapa ett lagringskonto" | `az storage account create` |
| "Jag bygger en fullständig AI-applikation" | `azd init --template azure-search-openai-demo` |
| "Jag behöver felsöka en specifik Azure-resurs" | `az resource show` |
| "Jag vill ha produktionsredo distribution på några minuter" | `azd up --environment production` |

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

Börja inte från början! **Awesome AZD** är communityns samling av färdiga mallar redo att distribueras:

| Resurs | Beskrivning |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Bläddra bland 200+ mallar med en-klicks distribution |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mall till communityn |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Sätt en stjärna och utforska källkoden |

### Populära AI-mallar från Awesome AZD

```bash
# RAG-chatt med Azure OpenAI + AI-sökning
azd init --template azure-search-openai-demo

# Snabb AI-chattapplikation
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry Agents
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

**🎉 Det är klart!** Din app är nu live på Azure.

### Rensa upp (glöm inte!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hur du använder den här kursen

Den här kursen är utformad för **progressivt lärande** - börja där du känner dig bekväm och arbeta dig uppåt:

| Din erfarenhet | Börja här |
|-----------------|------------|
| **Helt ny till Azure** | [Chapter 1: Foundation](../..) |
| **Känner Azure, ny till AZD** | [Chapter 1: Foundation](../..) |
| **Vill distribuera AI-appar** | [Chapter 2: AI-First Development](../..) |
| **Vill ha praktisk övning** | [🎓 Interaktiv workshop](workshop/README.md) - 3-4 timmars guidad labb |
| **Behöver produktionsmönster** | [Chapter 8: Production & Enterprise](../..) |

### Snabb uppsättning

1. **Forka det här arkivet**: [![GitHub forkar](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klona det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjälp**: [Azure Discord-community](https://discord.com/invite/ByRwuEEgH4)

> **Föredrar du att klona lokalt?**

> Detta arkiv innehåller 50+ språköversättningar vilket avsevärt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Detta ger dig allt du behöver för att slutföra kursen med en mycket snabbare nedladdning.


## Kursöversikt

Bemästra Azure Developer CLI (azd) genom strukturerade kapitel utformade för progressivt lärande. **Särskilt fokus på distribution av AI-applikationer med Microsoft Foundry-integration.**

### Varför den här kursen är viktig för moderna utvecklare

Baserat på insikter från Microsoft Foundry Discord-communityn, **vill 45 % av utvecklarna använda AZD för AI-arbetsbelastningar** men stöter på utmaningar med:
- Komplexa AI-arkitekturer med flera tjänster
- Bästa praxis för distribution av AI i produktion  
- Integrering och konfiguration av Azure AI-tjänster
- Kostnadsoptimering för AI-arbetsbelastningar
- Felsökning av AI-specifika distributionsproblem

### Inlärningsmål

Genom att slutföra denna strukturerade kurs kommer du att:
- **Bemästra AZD-grunderna**: Kärnkoncept, installation och konfiguration
- **Distribuera AI-applikationer**: Använd AZD med Microsoft Foundry-tjänster
- **Implementera Infrastructure as Code**: Hantera Azure-resurser med Bicep-mallar
- **Felsöka distributioner**: Lös vanliga problem och debugga fel
- **Optimera för produktion**: Säkerhet, skalning, övervakning och kostnadshantering
- **Bygga multi-agentlösningar**: Distribuera komplexa AI-arkitekturer

## 🗺️ Kurskarta: Snabb navigering per kapitel

Varje kapitel har en dedikerad README med inlärningsmål, snabbinstarter och övningar:

| Kapitel | Ämne | Lektioner | Varaktighet | Komplexitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Grundläggande](docs/chapter-01-foundation/README.md)** | Komma igång | [AZD-grunderna](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Första projektet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utveckling](docs/chapter-02-ai-development/README.md)** | AI-först-appar | [Foundry-integrering](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modelldistribution](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tim | ⭐⭐ |
| **[Kap 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Autentisering och säkerhet | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Distribution | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tim | ⭐⭐⭐ |
| **[Kap 5: Flera agenter](docs/chapter-05-multi-agent/README.md)** | AI-agentlösningar | [Detaljhandelsscenario](examples/retail-scenario.md) &#124; [Koordinationsmönster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2–3 timmar | ⭐⭐⭐⭐ |
| **[Kap 6: Förberedelser före driftsättning](docs/chapter-06-pre-deployment/README.md)** | Planering och validering | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 timme | ⭐⭐ |
| **[Kap 7: Felsökning](docs/chapter-07-troubleshooting/README.md)** | Felsökning & åtgärder | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1–1,5 timmar | ⭐⭐ |
| **[Kap 8: Produktion](docs/chapter-08-production/README.md)** | Företagsmönster | [Produktionsrutiner](docs/chapter-08-production/production-ai-practices.md) | 2–3 timmar | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktiskt labb | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3–4 timmar | ⭐⭐ |

**Total Course Duration:** ~10–14 timmar | **Skill Progression:** Nybörjare → Redo för produktion

---

## 📚 Lärandekapitel

*Välj din inlärningsväg baserat på erfarenhetsnivå och mål*

### 🚀 Kapitel 1: Grundläggande & Snabbstart
**Förkunskaper**: Azure-prenumeration, grundläggande kunskaper i kommandoraden  
**Varaktighet**: 30–45 minuter  
**Komplexitet**: ⭐

#### Vad du lär dig
- Förstå grunderna i Azure Developer CLI
- Installera AZD på din plattform
- Din första lyckade driftsättning

#### Lärresurser
- **🎯 Börja här**: [Vad är Azure Developer CLI?](../..)
- **📖 Teori**: [AZD-grunderna](docs/chapter-01-foundation/azd-basics.md) - Kärnkoncept och terminologi
- **⚙️ Installation & konfiguration**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Plattformsspecifika guider
- **🛠️ Praktiskt**: [Ditt första projekt](docs/chapter-01-foundation/first-project.md) - Steg-för-steg-handledning
- **📋 Snabbreferens**: [Kommandosammanställning](resources/cheat-sheet.md)

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
# När du har slutfört kapitel 1 bör du kunna:
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initierar projektet
azd up                  # Distribuerar till Azure
azd show                # Visar URL för den körande appen
# Applikationen öppnas i webbläsaren och fungerar
azd down --force --purge  # Rensar upp resurser
```

**📊 Tidsåtgång:** 30–45 minuter  
**📈 Färdighetsnivå efteråt:** Kan självständigt driftsätta grundläggande applikationer

**✅ Framgångsvalidering:**
```bash
# Efter att ha slutfört kapitel 1 ska du kunna:
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initierar projektet
azd up                  # Distribuerar till Azure
azd show                # Visar URL för den körande appen
# Applikationen öppnas i webbläsaren och fungerar
azd down --force --purge  # Rensar upp resurser
```

**📊 Tidsåtgång:** 30–45 minuter  
**📈 Färdighetsnivå efteråt:** Kan självständigt driftsätta grundläggande applikationer

---

### 🤖 Kapitel 2: AI-först utveckling (Rekommenderas för AI-utvecklare)
**Förkunskaper**: Kapitel 1 slutfört  
**Varaktighet**: 1–2 timmar  
**Komplexitet**: ⭐⭐

#### Vad du lär dig
- Microsoft Foundry-integration med AZD
- Distribuera AI-drivna applikationer
- Förstå AI-tjänsters konfigurationer

#### Lärresurser
- **🎯 Börja här**: [Microsoft Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [Guide för AI-agenter](docs/chapter-02-ai-development/agents.md) - Distribuera intelligenta agenter med AZD
- **📖 Mönster**: [Distribution av AI-modeller](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuera och hantera AI-modeller
- **🛠️ Workshop**: [AI-workshop-labb](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-klara
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Webbläsarbaserad inlärning med MkDocs * DevContainer-miljö
- **📋 Mallar**: [Microsoft Foundry Templates](../..)
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

**💡 Kapitelresultat**: Distribuera och konfigurera en AI-driven chattapplikation med RAG-funktioner

**✅ Framgångsvalidering:**
```bash
# Efter kapitel 2 bör du kunna:
azd init --template azure-search-openai-demo
azd up
# Testa AI-chattgränssnittet
# Ställ frågor och få AI-drivna svar med källor
# Verifiera att sökintegrationen fungerar
azd monitor  # Kontrollera att Application Insights visar telemetri
azd down --force --purge
```

**📊 Tidsåtgång:** 1–2 timmar  
**📈 Färdighetsnivå efteråt:** Kan distribuera och konfigurera produktionsklara AI-applikationer  
**💰 Kostnadsmedvetenhet:** Förstå utvecklingskostnader på $80–150/månad, produktionskostnader $300–3500/månad

#### 💰 Kostnadsöverväganden för AI-distributioner

**Utvecklingsmiljö (Skattat $80–150/månad):**
- Azure OpenAI (Pay-as-you-go): $0–50/månad (baserat på tokenanvändning)
- AI Search (Basic-nivå): $75/månad
- Container Apps (Consumption): $0–20/månad
- Lagring (Standard): $1–5/månad

**Produktionsmiljö (Skattat $300–3,500+/månad):**
- Azure OpenAI (PTU för konsekvent prestanda): $3,000+/månad ELLER Pay-as-you-go vid stor volym
- AI Search (Standard-nivå): $250/månad
- Container Apps (Dedicated): $50–100/månad
- Application Insights: $5–50/månad
- Lagring (Premium): $10–50/månad

**💡 Tips för kostnadsoptimering:**
- Använd **Free Tier** Azure OpenAI för inlärning (50 000 tokens/månad ingår)
- Kör `azd down` för att avallokera resurser när du inte utvecklar aktivt
- Börja med konsumtionsbaserad fakturering, uppgradera till PTU endast för produktion
- Använd `azd provision --preview` för att uppskatta kostnader innan driftsättning
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
**Förkunskaper**: Kapitel 1 slutfört  
**Varaktighet**: 45–60 minuter  
**Komplexitet**: ⭐⭐

#### Vad du lär dig
- Konfiguration och hantering av miljöer
- Autentisering och säkerhetsbästa praxis
- Resursnamngivning och organisering

#### Lärresurser
- **📖 Konfiguration**: [Konfigurationsguide](docs/chapter-03-configuration/configuration.md) - Miljöinställning
- **🔐 Säkerhet**: [Autentiseringsmönster och hanterad identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmönster
- **📝 Exempel**: [Databasapplikationsexempel](examples/database-app/README.md) - AZD-databasexempel

#### Praktiska övningar
- Konfigurera flera miljöer (dev, staging, prod)
- Ställ in autentisering med hanterad identitet
- Implementera miljöspecifika konfigurationer

**💡 Kapitelresultat**: Hantera flera miljöer med korrekt autentisering och säkerhet

---

### 🏗️ Kapitel 4: Infrastruktur som kod & Driftsättning
**Förkunskaper**: Kapitel 1–3 slutförda  
**Varaktighet**: 1–1,5 timmar  
**Komplexitet**: ⭐⭐⭐

#### Vad du lär dig
- Avancerade distributionsmönster
- Infrastruktur som kod med Bicep
- Strategier för resursprovisionering

#### Lärresurser
- **📖 Distribution**: [Distributionsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletta arbetsflöden
- **🏗️ Provisionering**: [Provisionera resurser](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurshantering
- **📝 Exempel**: [Container App Example](../../examples/container-app) - Containeriserade distributioner

#### Praktiska övningar
- Skapa egna Bicep-mallar
- Driftsätt flertjänstapplikationer
- Implementera blue-green-driftsättningsstrategier

**💡 Kapitelresultat**: Driftsätt komplexa flertjänstapplikationer med anpassade infrastruktursmallar

---

### 🎯 Kapitel 5: Multi-agent AI-lösningar (Avancerat)
**Förkunskaper**: Kapitel 1–2 slutförda  
**Varaktighet**: 2–3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad du lär dig
- Arkitekturmönster för flera agenter
- Agentorkestrering och koordinering
- Produktionsklara AI-distributioner

#### Lärresurser
- **🤖 Utvalt projekt**: [Detaljhandelslösning med flera agenter](examples/retail-scenario.md) - Komplett implementation
- **🛠️ ARM-mallar**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Enklicksdriftsättning
- **📖 Arkitektur**: [Koordinationsmönster för flera agenter](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mönster

#### Praktiska övningar
```bash
# Distribuera den kompletta detaljhandelslösningen med flera agenter
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforska agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Driftsätt och hantera en produktionsklar multi-agent AI-lösning med Kund- och Lager-agenter

---

### 🔍 Kapitel 6: Validering och planering inför driftsättning
**Förkunskaper**: Kapitel 4 slutfört  
**Varaktighet**: 1 timme  
**Komplexitet**: ⭐⭐

#### Vad du lär dig
- Kapacitetsplanering och resursvalidering
- SKU-valstrategier
- Pre-flight-kontroller och automatisering

#### Lärresurser
- **📊 Planering**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resursvalidering
- **💰 Val**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektiva val
- **✅ Validering**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserade skript

#### Praktiska övningar
- Kör skript för kapacitetsvalidering
- Optimera SKU-val för kostnad
- Implementera automatiserade för-driftsättningskontroller

**💡 Kapitelresultat**: Validera och optimera distributioner innan genomförande

---

### 🚨 Kapitel 7: Felsökning & Debugging
**Förkunskaper**: Valfritt distributionskapitel slutfört  
**Varaktighet**: 1–1,5 timmar  
**Komplexitet**: ⭐⭐

#### Vad du lär dig
- Systematiska felsökningsmetoder
- Vanliga problem och lösningar
- AI-specifik felsökning

#### Lärresurser
- **🔧 Vanliga problem**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ och lösningar
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Steg-för-steg-strategier
- **🤖 AI-problem**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problem med AI-tjänster

#### Praktiska övningar
- Diagnostisera driftsättningsfel
- Lös autentiseringsproblem
- Felsök anslutning till AI-tjänster

**💡 Kapitelresultat**: Självständigt diagnostisera och åtgärda vanliga driftsättningsproblem

---

### 🏢 Kapitel 8: Produktion & Företagsmönster
**Förkunskaper**: Kapitel 1–4 slutförda  
**Varaktighet**: 2–3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad du lär dig
- Strategier för produktionsdriftsättning
- Företagsäkerhetsmönster
- Övervakning och kostnadsoptimering

#### Lärresurser
- **🏭 Produktion**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Företagsmönster
- **📝 Exempel**: [Microservices Example](../../examples/microservices) - Komplexa arkitekturer
- **📊 Övervakning**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Övervakning

#### Praktiska övningar
- Implementera företagsäkerhetsmönster
- Sätt upp omfattande övervakning
- Driftsätt i produktion med korrekt styrning

**💡 Kapitelresultat**: Driftsätt företagsklara applikationer med fulla produktionsfunktioner

---

## 🎓 Workshopöversikt: Praktisk inlärningsupplevelse

> **⚠️ WORKSHOPSTATUS: Aktiv utveckling**  
> Workshopmaterialet utvecklas och förfinas för närvarande. Kärnmodulerna är funktionella, men vissa avancerade sektioner är ofullständiga. Vi arbetar aktivt för att färdigställa allt innehåll. [Följ utvecklingen →](workshop/README.md)

### Interaktiva workshopmaterial
**Omfattande praktisk inlärning med webbläsarbaserade verktyg och guidade övningar**
Våra workshopmaterial erbjuder en strukturerad, interaktiv inlärningsupplevelse som kompletterar den kapitelbaserade läroplanen ovan. Workshopen är utformad för både självstyrd inlärning och instruktörsledda sessioner.

#### 🛠️ Workshopfunktioner
- **Webbläsarbaserat gränssnitt**: Komplett MkDocs-drivet workshop med sök, kopiering och temafunktioner
- **Integration med GitHub Codespaces**: Ettklicksuppsättning av utvecklingsmiljö
- **Strukturerad inlärningsväg**: 8-moduls guidade övningar (totalt 3–4 timmar)
- **Progressiv metodik**: Introduktion → Urval → Validering → Nedbrytning → Konfiguration → Anpassning → Avveckling → Sammanfattning
- **Interaktiv DevContainer-miljö**: Förkonfigurerade verktyg och beroenden

#### 📚 Workshopens modulstruktur
Workshopen följer en **8-moduls progressiv metodik** som tar dig från upptäckt till mästerskap i driftsättning:

| Modul | Ämne | Vad du kommer göra | Tidsåtgång |
|--------|-------|----------------|----------|
| **0. Introduktion** | Översikt över workshopen | Förstå lärandemål, förkunskaper och workshopstruktur | 15 min |
| **1. Selection** | Upptäckt av mallar | Utforska AZD-mallar och välj rätt AI-mall för ditt scenario | 20 min |
| **2. Validation** | Distribuera & verifiera | Distribuera mallen med `azd up` och verifiera att infrastrukturen fungerar | 30 min |
| **3. Deconstruction** | Förstå struktur | Använd GitHub Copilot för att utforska mallens arkitektur, Bicep-filer och kodorganisation | 30 min |
| **4. Configuration** | Fördjupning i azure.yaml | Behärska `azure.yaml`-konfigurationen, livscykelhakar och miljövariabler | 30 min |
| **5. Customization** | Gör den din | Aktivera AI-sökning, spårning, utvärdering och anpassa för ditt scenario | 45 min |
| **6. Teardown** | Städa upp | Ta säkert bort resurser med `azd down --purge` | 15 min |
| **7. Wrap-up** | Nästa steg | Gå igenom prestationer, nyckelkoncept och fortsätt din läranderesa | 15 min |

**Workshop Flow:**
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
# Klicka på "Code" → "Create codespace on main" i repositoryt

# Alternativ 2: Lokal utveckling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Följ installationsinstruktionerna i workshop/README.md
```

#### 🎯 Workshopens lärandemål
Genom att slutföra workshopen kommer deltagarna att:
- **Driftsätta produktions-AI-applikationer**: Använd AZD med Microsoft Foundry-tjänster
- **Bemästra multi-agentarkitekturer**: Implementera koordinerade AI-agentlösningar
- **Implementera säkerhetsbästa praxis**: Konfigurera autentisering och åtkomstkontroll
- **Optimera för skala**: Utforma kostnadseffektiva, högpresterande driftsättningar
- **Felsöka driftsättningar**: Åtgärda vanliga problem självständigt

#### 📖 Workshopresurser
- **🎥 Interaktiv guide**: [Workshopmaterial](workshop/README.md) - Webbläsarbaserad inlärningsmiljö
- **📋 Instruktioner per modul**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshop overview and objectives
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Find and select AI templates
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy and verify templates
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore template architecture
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Master azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Customize for your scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Clean up resources
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Review and next steps
- **🛠️ AI Workshop-labb**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserade övningar
- **💡 Kom igång**: [Workshopuppsättningsguide](workshop/README.md#quick-start) - Miljökonfiguration

**Perfekt för**: Företagsträning, universitetskurser, självstudier och utvecklarbootcamps.

---

## 📖 Fördjupning: AZD-funktioner

Utöver grunderna erbjuder AZD kraftfulla funktioner för produktionsdriftsättningar:

- **Mallbaserade driftsättningar** - Använd förbyggda mallar för vanliga applikationsmönster
- **Infrastruktur som kod** - Hantera Azure-resurser med Bicep eller Terraform  
- **Integrerade arbetsflöden** - Provisionera, driftsätt och övervaka applikationer sömlöst
- **Utvecklarvänligt** - Optimerat för utvecklareffektivitet och användarupplevelse

### **AZD + Microsoft Foundry: Perfekt för AI-driftsättningar**

**Varför AZD för AI-lösningar?** AZD löser de största utmaningarna som AI-utvecklare står inför:

- **AI-förberedda mallar** - Förkonfigurerade mallar för Azure OpenAI, Cognitive Services och ML-arbetsbelastningar
- **Säkra AI-driftsättningar** - Inbyggda säkerhetsmönster för AI-tjänster, API-nycklar och modellendpunkter  
- **Produktionsmönster för AI** - Bästa praxis för skalbara, kostnadseffektiva AI-applikationsdriftsättningar
- **End-to-End AI-arbetsflöden** - Från modellutveckling till produktionsdriftsättning med korrekt övervakning
- **Kostnadsoptimering** - Smart resursallokering och skalningsstrategier för AI-arbetsbelastningar
- **Integration med Microsoft Foundry** - Sömlös anslutning till Microsoft Foundry-modellkatalogen och endpoints

---

## 🎯 Mall- och exempelsbibliotek

### Utvalda: Microsoft Foundry-mallar
**Börja här om du driftsätter AI-applikationer!**

> **Obs:** Dessa mallar visar olika AI-mönster. Vissa är externa Azure Samples, andra är lokala implementationer.

| Mall | Kapitel | Komplexitet | Tjänster | Typ |
|----------|---------|------------|----------|------|
| [**Kom igång med AI-chatt**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Kom igång med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Snabbstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalda: Kompletta lärscenarier
**Produktionsklara applikationsmallar kopplade till lärkapitel**

| Mall | Lärkapitel | Komplexitet | Nyckellärdom |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundläggande AI-driftsättningsmönster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration med Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentramverk och function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agentarkitektur med Customer- och Inventory-agenter |

### Lärande efter exempeltyp

> **📌 Lokala vs. externa exempel:**  
> **Lokala exempel** (i detta repo) = Klara att använda omedelbart  
> **Externa exempel** (Azure Samples) = Klona från länkade arkiv

#### Lokala exempel (Klara att använda)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fullständig produktionsklar implementation med ARM-mallar
  - Multi-agentarkitektur (Customer + Inventory agents)
  - Omfattande övervakning och utvärdering
  - Ettp-licksdriftsättning via ARM-mall

#### Lokala exempel - Containerapplikationer (Kapitel 2-5)
**Omfattande exempel på containerdriftsättningar i detta repo:**
- [**Container App-exempel**](examples/container-app/README.md) - Fullständig guide till containeriserade driftsättningar
  - [Enkel Flask-API](../../examples/container-app/simple-flask-api) - Grundläggande REST-API med scale-to-zero
  - [Mikrotjänstarkitektur](../../examples/container-app/microservices) - Produktionsklar flertjänstdriftsättning
  - Snabbstart, produktion och avancerade driftsättningsmönster
  - Riktlinjer för övervakning, säkerhet och kostnadsoptimering

#### Externa exempel - Enkla applikationer (Kapitel 1-2)
**Klona dessa Azure Samples-arkiv för att komma igång:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundläggande driftsättningsmönster
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statisk webbplatsdistribution
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API-driftsättning

#### Externa exempel - Dataintegration (Kapitel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mönster för databasanslutning
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dataarbetsflöde

#### Externa exempel - Avancerade mönster (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Fler-tjänstarkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrundsprocesser  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklara ML-mönster

### Externa mall-samlingar
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuraterad samling av officiella och community-mallar
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn-mall-dokumentation
- [**Examples Directory**](examples/README.md) - Lokala exempel för inlärning med detaljerade förklaringar

---

## 📚 Lärresurser & referenser

### Snabbreferenser
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Viktiga azd-kommandon organiserade per kapitel
- [**Glossary**](resources/glossary.md) - Azure- och azd-terminologi  
- [**FAQ**](resources/faq.md) - Vanliga frågor organiserade per lärkapitel
- [**Study Guide**](resources/study-guide.md) - Omfattande övningar

### Praktiska workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-driftsättningsbara (2–3 timmar)
- [**Interactive Workshop**](workshop/README.md) - 8-moduls guidade övningar med MkDocs och GitHub Codespaces
  - Följer: Introduktion → Urval → Validering → Nedbrytning → Konfiguration → Anpassning → Avveckling → Sammanfattning

### Externa lärresurser
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

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

# Ställ in för AZD-miljö
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
<summary><strong>❌ "Autentisering misslyckades" eller "Token har gått ut"</strong></summary>

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
<summary><strong>❌ "Resursen finns redan" eller namnkonflikter</strong></summary>

```bash
# AZD genererar unika namn, men vid konflikt:
azd down --force --purge

# Försök igen med en ny miljö
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Distribution av mallen tar för lång tid</strong></summary>

**Normala väntetider:**
- Enkel webbapp: 5-10 minuter
- App med databas: 10-15 minuter
- AI-applikationer: 15-25 minuter (OpenAI provisionering är långsam)

```bash
# Kontrollera framsteg
azd show

# Om du sitter fast i mer än 30 minuter, kontrollera Azure-portalen:
azd monitor
# Sök efter misslyckade distributioner
```
</details>

<details>
<summary><strong>❌ "Åtkomst nekad" eller "Förbjudet"</strong></summary>

```bash
# Kontrollera din Azure-roll
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du behöver minst rollen "Contributor"
# Be din Azure-administratör att bevilja:
# - Contributor (för resurser)
# - User Access Administrator (för rolltilldelningar)
```
</details>

<details>
<summary><strong>❌ Hittar inte URL för distribuerad applikation</strong></summary>

```bash
# Visa alla tjänsteändpunkter
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
- **AI-specifika problem:** [Felsökning för AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Felsökningsguide:** [Steg-för-steg felsökning](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjälp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursavslutning & Certifiering

### Framstegsuppföljning
Följ dina framsteg i varje kapitel:

- [ ] **Kapitel 1**: Grund & Snabbstart ✅
- [ ] **Kapitel 2**: AI-först utveckling ✅  
- [ ] **Kapitel 3**: Konfiguration & Autentisering ✅
- [ ] **Kapitel 4**: Infrastruktur som kod & Distribution ✅
- [ ] **Kapitel 5**: Fleragentiga AI-lösningar ✅
- [ ] **Kapitel 6**: Validering & planering före distribution ✅
- [ ] **Kapitel 7**: Felsökning & Debuggning ✅
- [ ] **Kapitel 8**: Produktion & företagsmönster ✅

### Verifiering av kunskaper
Efter att ha slutfört varje kapitel, verifiera dina kunskaper genom:
1. **Praktisk övning**: Slutför kapitlets praktiska distribution
2. **Kunskapskontroll**: Gå igenom FAQ-avsnittet för ditt kapitel
3. **Communitydiskussion**: Dela din erfarenhet i Azure Discord
4. **Nästa kapitel**: Gå vidare till nästa nivå av komplexitet

### Fördelar vid kursavslutning
När du har slutfört alla kapitel kommer du att ha:
- **Produktionserfarenhet**: Distribuerat riktiga AI-applikationer till Azure
- **Professionella färdigheter**: Produktionsklara distributionsmöjligheter  
- **Gemenskapsigenkänning**: Aktiv medlem i Azure-utvecklargemenskapen
- **Karriärutveckling**: Eftertraktad AZD- och AI-distributionskompetens

---

## 🤝 Gemenskap & Support

### Få hjälp & support
- **Tekniska problem**: [Rapportera buggar och begär funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Frågor om lärande**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjälp**: Gå med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiell dokumentation för Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insikter från Microsoft Foundry Discord-gemenskapen

**Senaste omröstningsresultat från #Azure-kanalen:**
- **45%** av utvecklare vill använda AZD för AI-arbetsbelastningar
- **Största utmaningar**: Fler-tjänstdistributioner, hantering av autentiseringsuppgifter, produktionsberedskap  
- **Mest efterfrågat**: AI-specifika mallar, felsökningsguider, bästa praxis

**Gå med i vår gemenskap för att:**
- Dela dina AZD + AI-upplevelser och få hjälp
- Få tillgång till tidiga förhandsvisningar av nya AI-mallar
- Bidra till bästa praxis för AI-distribution
- Påverka framtida AI + AZD-funktionsutveckling

### Bidra till kursen
Vi välkomnar bidrag! Läs vår [Bidragsguide](CONTRIBUTING.md) för detaljer om:
- **Innehållsförbättringar**: Förbättra befintliga kapitel och exempel
- **Nya exempel**: Lägg till verkliga scenarier och mallar  
- **Översättning**: Hjälp till att upprätthålla flerspråkigt stöd
- **Felrapporter**: Förbättra noggrannhet och tydlighet
- **Gemenskapsstandarder**: Följ våra inkluderande riktlinjer för gemenskapen

---

## 📄 Kursinformation

### Licens
Detta projekt är licensierat under MIT-licensen - se filen [LICENSE](../../LICENSE) för detaljer.

### Relaterade Microsoft-lärresurser

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI-serie
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kärnkurser
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serien
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigering

**🚀 Redo att börja lära dig?**

**Nybörjare**: Börja med [Kapitel 1: Grund & Snabbstart](../..)  
**AI-utvecklare**: Hoppa till [Kapitel 2: AI-först utveckling](../..)  
**Erfarna utvecklare**: Börja med [Kapitel 3: Konfiguration och autentisering](../..)

**Nästa steg**: [Börja Kapitel 1 - AZD-grunderna](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell, mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår genom användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->