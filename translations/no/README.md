# AZD for nybegynnere: En strukturert læringsreise

![AZD-for-beginners](../../translated_images/no/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiserte oversettelser (Alltid oppdaterte)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmesisk (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (tradisjonell, Hong Kong)](../zh-HK/README.md) | [Kinesisk (tradisjonell, Macau)](../zh-MO/README.md) | [Kinesisk (tradisjonell, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tsjekkisk](../cs/README.md) | [Dansk](../da/README.md) | [Nederlandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Gresk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malayisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norsk](./README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasil)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumensk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrekker du å klone lokalt?**

> Dette depotet inkluderer 50+ språkoversettelser som betydelig øker nedlastingsstørrelsen. For å klone uten oversettelser, bruk sparsommelig utsjekking:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette gir deg alt du trenger for å fullføre kurset med en mye raskere nedlasting.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Hva er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et utviklervennlig kommandolinjeverktøy som gjør det enkelt å distribuere applikasjoner til Azure. I stedet for å manuelt opprette og koble sammen dusinvis av Azure-ressurser, kan du distribuere hele applikasjoner med en enkel kommando.

### Magien med `azd up`

```bash
# Denne ene kommandoen gjør alt:
# ✅ Oppretter alle Azure-ressurser
# ✅ Konfigurerer nettverk og sikkerhet
# ✅ Bygger applikasjonskoden din
# ✅ Distribuerer til Azure
# ✅ Gir deg en fungerende URL
azd up
```

**Det er det!** Ingen knapping i Azure-portalen, ingen komplekse ARM-maler du må lære først, ingen manuell konfigurering - bare fungerende applikasjoner i Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hva er forskjellen?

Dette er det vanligste spørsmålet nybegynnere stiller. Her er det enkle svaret:

| Funksjon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------|---------------------|---------------------------------|
| **Formål** | Administrere individuelle Azure-ressurser | Distribuere komplette applikasjoner |
| **Tankesett** | Infrastrukturfokusert | Applikasjonsfokusert |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Må kjenne Azure-tjenester | Bare kjenn appen din |
| **Passer best for** | DevOps, Infrastruktur | Utviklere, prototyping |

### Enkel analogi

- **Azure CLI** er som å ha alle verktøyene for å bygge et hus - hammere, sager, spiker. Du kan bygge hva som helst, men du må kunne konstruksjon.
- **Azure Developer CLI** er som å leie en entreprenør - du beskriver hva du vil ha, så tar de seg av byggingen.

### Når du skal bruke hva

| Scenario | Bruk dette |
|----------|------------|
| "Jeg vil distribuere webappen min raskt" | `azd up` |
| "Jeg må bare opprette en lagringskonto" | `az storage account create` |
| "Jeg bygger en full AI-applikasjon" | `azd init --template azure-search-openai-demo` |
| "Jeg må feilsøke en spesifikk Azure-ressurs" | `az resource show` |
| "Jeg vil ha produksjonsklar distribusjon på minutter" | `azd up --environment production` |

### De fungerer sammen!

AZD bruker Azure CLI under panseret. Du kan bruke begge:
```bash
# Distribuer appen din med AZD
azd up

# Deretter finjuster spesifikke ressurser med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Finn maler i Awesome AZD

Ikke start fra bunnen av! **Awesome AZD** er fellesskapets samling av ferdige distribusjonsmaler:

| Ressurs | Beskrivelse |
|---------|-------------|
| 🔗 [**Awesome AZD-galleri**](https://azure.github.io/awesome-azd/) | Bla gjennom 200+ maler med ettklikk-distribusjon |
| 🔗 [**Send inn en mal**](https://github.com/Azure/awesome-azd/issues) | Bidra med egne maler til fellesskapet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Gi stjerne og utforsk kilden |

### Populære AI-maler fra Awesome AZD

```bash
# RAG-chat med Azure OpenAI + AI-søk
azd init --template azure-search-openai-demo

# Rask AI-chatapplikasjon
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry-agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom i gang på 3 steg

### Steg 1: Installer AZD (2 minutter)

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

### Steg 2: Logg inn i Azure

```bash
azd auth login
```

### Steg 3: Distribuer din første applikasjon

```bash
# Initialiser fra en mal
azd init --template todo-nodejs-mongo

# Distribuer til Azure (oppretter alt!)
azd up
```

**🎉 Ferdig!** Applikasjonen din er nå live på Azure.

### Rydd opp (ikke glem!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hvordan bruke dette kurset

Dette kurset er designet for **progressiv læring** - start der du er komfortabel og arbeid deg oppover:

| Din erfaring | Start her |
|--------------|-----------|
| **Helt ny i Azure** | [Kapittel 1: Grunnlag](../..) |
| **Kjenner Azure, ny med AZD** | [Kapittel 1: Grunnlag](../..) |
| **Vil distribuere AI-apper** | [Kapittel 2: AI-først utvikling](../..) |
| **Vil ha praktisk øvelse** | [🎓 Interaktiv workshop](workshop/README.md) - 3-4 timers veiledet lab |
| **Trenger produksjonsmønstre** | [Kapittel 8: Produksjon & Enterprise](../..) |

### Rask oppsett

1. **Fork dette depotet**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klone det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjelp**: [Azure Discord-fellesskap](https://discord.com/invite/ByRwuEEgH4)

> **Foretrekker du å klone lokalt?**

> Dette depotet inkluderer 50+ språkoversettelser som betydelig øker nedlastingsstørrelsen. For å klone uten oversettelser, bruk sparsommelig utsjekking:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette gir deg alt du trenger for å fullføre kurset med en mye raskere nedlasting.


## Kursoversikt

Mestre Azure Developer CLI (azd) gjennom strukturerte kapitler designet for progressiv læring. **Spesiell fokus på AI-applikasjonsdistribusjon med Microsoft Foundry-integrasjon.**

### Hvorfor dette kurset er essensielt for moderne utviklere

Basert på innsikt fra Microsoft Foundry Discord-fellesskapet, ønsker **45 % av utviklere å bruke AZD for AI-arbeidsbelastninger** men møter utfordringer med:
- Komplekse AI-arkitekturer med flere tjenester
- Beste praksis for produksjonsdistribusjon av AI  
- Azure AI-tjenesteintegrasjon og konfigurasjon
- Kostnadsoptimalisering for AI-arbeidsbelastninger
- Feilsøking av AI-spesifikke distribusjonsproblemer

### Læringsmål

Ved å fullføre dette strukturerte kurset vil du:
- **Mestre AZD-grunnleggende**: Kjernebegreper, installasjon og konfigurasjon
- **Distribuere AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester
- **Implementere infrastruktur som kode**: Administrere Azure-ressurser med Bicep-maler
- **Feilsøke distribusjoner**: Løse vanlige problemer og feilsøke feil
- **Optimalisere for produksjon**: Sikkerhet, skalering, overvåking og kostnadsstyring
- **Bygge multi-agent-løsninger**: Distribuere komplekse AI-arkitekturer

## 🗺️ Kurskart: Rask navigasjon per kapittel

Hvert kapittel har en dedikert README med læringsmål, raske oppstarter og øvelser:

| Kapittel | Emne | Leksjoner | Varighet | Kompleksitet |
|----------|------|-----------|----------|-------------|
| **[Kap 1: Grunnlag](docs/chapter-01-foundation/README.md)** | Kom i gang | [AZD-grunnprinsipper](docs/chapter-01-foundation/azd-basics.md) &#124; [Installasjon](docs/chapter-01-foundation/installation.md) &#124; [Første prosjekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utvikling](docs/chapter-02-ai-development/README.md)** | AI-første apper | [Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modell-distribusjon](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 t | ⭐⭐ |
| **[Kap 3: Konfigurasjon](docs/chapter-03-configuration/README.md)** | Autentisering & sikkerhet | [Konfigurasjon](docs/chapter-03-configuration/configuration.md) &#124; [Autentisering & sikkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & distribusjon | [Distribusjonsveiledning](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Innlegging](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 t | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agentløsninger | [Retail Scenario](examples/retail-scenario.md) &#124; [Koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 timer | ⭐⭐⭐⭐ |
| **[Kap 6: Forhåndsutplassering](docs/chapter-06-pre-deployment/README.md)** | Planlegging og validering | [Forhåndssjekker](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 time | ⭐⭐ |
| **[Kap 7: Feilsøking](docs/chapter-07-troubleshooting/README.md)** | Feilsøk og fiks | [Vanlige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Feilsøking](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 timer | ⭐⭐ |
| **[Kap 8: Produksjon](docs/chapter-08-production/README.md)** | Enterprise-mønstre | [Produksjonspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 timer | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk lab | [Introduksjon](workshop/docs/instructions/0-Introduction.md) &#124; [Valg](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbrytning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Avslutning](workshop/docs/instructions/7-Wrap-up.md) | 3-4 timer | ⭐⭐ |

**Total varighet for kurset:** ~10-14 timer | **Ferdighetsutvikling:** Nybegynner → Klar for produksjon

---

## 📚 Læringskapitler

*Velg din læringsvei basert på erfaringsnivå og mål*

### 🚀 Kapittel 1: Grunnlag og Rask Start
**Forutsetninger**: Azure-abonnement, grunnleggende kommandolinjekunnskap  
**Varighet**: 30-45 minutter  
**Vanskelighetsgrad**: ⭐

#### Hva du vil lære
- Forstå Azure Developer CLI-grunnleggende
- Installere AZD på din plattform
- Din første vellykkede utrulling

#### Læringsressurser
- **🎯 Start her**: [Hva er Azure Developer CLI?](../..)
- **📖 Teori**: [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) - Kjernebegreper og terminologi
- **⚙️ Oppsett**: [Installasjon og oppsett](docs/chapter-01-foundation/installation.md) - Plattformspesifikke guider
- **🛠️ Praktisk**: [Ditt første prosjekt](docs/chapter-01-foundation/first-project.md) - Steg for steg veiledning
- **📋 Rask referanse**: [Kommandoer oversikt](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Rask installasjonssjekk
azd version

# Distribuer din første applikasjon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapittelresultat**: Suksessfull utrulling av en enkel nettapplikasjon til Azure med AZD

**✅ Suksessvalidering:**
```bash
# Etter å ha fullført kapittel 1, bør du kunne:
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                  # Distribuerer til Azure
azd show                # Viser URL til kjørende app
# Applikasjonen åpnes i nettleseren og fungerer
azd down --force --purge  # Rydder opp ressurser
```

**📊 Tidsinvestering:** 30-45 minutter  
**📈 Ferdighetsnivå etter:** Kan distribuere grunnleggende applikasjoner på egen hånd

**✅ Suksessvalidering:**
```bash
# Etter å ha fullført kapittel 1, bør du kunne:
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                  # Distribuerer til Azure
azd show                # Viser kjørende app-URL
# Applikasjonen åpnes i nettleseren og fungerer
azd down --force --purge  # Rydder opp ressurser
```

**📊 Tidsinvestering:** 30-45 minutter  
**📈 Ferdighetsnivå etter:** Kan distribuere grunnleggende applikasjoner på egen hånd

---

### 🤖 Kapittel 2: AI-Først Utvikling (Anbefalt for AI-utviklere)
**Forutsetninger**: Kapittel 1 fullført  
**Varighet**: 1-2 timer  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære
- Microsoft Foundry-integrasjon med AZD
- Utrulling av AI-drevne applikasjoner
- Forståelse av AI-tjenestekonfigurasjoner

#### Læringsressurser
- **🎯 Start her**: [Microsoft Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI-agenter guide](docs/chapter-02-ai-development/agents.md) - Utrulling av intelligente agenter med AZD
- **📖 Mønstre**: [AI-modellutrulling](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementering og styring av AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør dine AI-løsninger klare for AZD
- **🎥 Interaktiv guide**: [Workshopmateriale](workshop/README.md) - Nettleserbasert læring med MkDocs * DevContainer-miljø
- **📋 Maler**: [Microsoft Foundry-maler](../..)
- **📝 Eksempler**: [AZD Utrullingseksempler](examples/README.md)

#### Praktiske øvelser
```bash
# Distribuer din første AI-applikasjon
azd init --template azure-search-openai-demo
azd up

# Prøv flere AI-maler
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapittelresultat**: Distribuer og konfigurer en AI-drevet chatteapplikasjon med RAG-funksjonalitet

**✅ Suksessvalidering:**
```bash
# Etter kapittel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI chat-grensesnittet
# Stille spørsmål og få AI-drevne svar med kilder
# Verifisere at søkeintegrasjon fungerer
azd monitor  # Sjekke at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsinvestering:** 1-2 timer  
**📈 Ferdighetsnivå etter:** Kan distribuere og konfigurere produksjonsklare AI-applikasjoner  
**💰 Kostnadsbevissthet:** Forstå utviklingskostnader på $80-150/mnd og produksjonskostnader på $300-3500/mnd

#### 💰 Kostnadshensyn for AI-utplasseringer

**Utviklingsmiljø (Estimert $80-150/mnd):**
- Azure OpenAI (betal etter bruk): $0-50/mnd (basert på tokenbruk)
- AI Search (Basisnivå): $75/mnd
- Container Apps (Konsum-basert): $0-20/mnd
- Lagring (Standard): $1-5/mnd

**Produksjonsmiljø (Estimert $300-3,500+/mnd):**
- Azure OpenAI (PTU for stabil ytelse): $3,000+/mnd ELLER betal etter bruk med høy volum
- AI Search (Standardnivå): $250/mnd
- Container Apps (Dedikert): $50-100/mnd
- Application Insights: $5-50/mnd
- Lagring (Premium): $10-50/mnd

**💡 Kostnadsoptimaliseringstips:**
- Bruk **Gratisnivå** Azure OpenAI for læring (50 000 tokens/mnd inkludert)
- Kjør `azd down` for å deallokere ressurser når du ikke aktivt utvikler
- Start med konsum-basert fakturering, oppgrader til PTU kun for produksjon
- Bruk `azd provision --preview` for å estimere kostnader før utrulling
- Aktiver autoskalering: betal kun for faktisk bruk

**Kostnadsovervåkning:**
```bash
# Sjekk estimerte månedlige kostnader
azd provision --preview

# Overvåk faktiske kostnader i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapittel 3: Konfigurasjon og Autentisering
**Forutsetninger**: Kapittel 1 fullført  
**Varighet**: 45-60 minutter  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære
- Miljøkonfigurasjon og administrasjon
- Autentisering og sikkerhetspraksis
- Ressursnavngivning og organisering

#### Læringsressurser
- **📖 Konfigurasjon**: [Konfigurasjonsguide](docs/chapter-03-configuration/configuration.md) - Miljøoppsett
- **🔐 Sikkerhet**: [Autentiseringsmønstre og administrert identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmønstre
- **📝 Eksempler**: [Databaseapp-eksempel](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Sett opp administrert identitetsautentisering
- Implementer miljøspesifikke konfigurasjoner

**💡 Kapittelresultat**: Administrer flere miljøer med korrekt autentisering og sikkerhet

---

### 🏗️ Kapittel 4: Infrastruktur som kode og utrulling
**Forutsetninger**: Kapitler 1-3 fullført  
**Varighet**: 1-1.5 timer  
**Vanskelighetsgrad**: ⭐⭐⭐

#### Hva du vil lære
- Avanserte utrullingsmønstre
- Infrastruktur som kode med Bicep
- Ressursprovisjoneringsstrategier

#### Læringsressurser
- **📖 Utrulling**: [Utrullingsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Fullstendige arbeidsflyter
- **🏗️ Provisjonering**: [Ressursprovisjonering](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursadministrasjon
- **📝 Eksempler**: [Container App-eksempel](../../examples/container-app) - Containeriserte utrullinger

#### Praktiske øvelser
- Lag tilpassede Bicep-maler
- Distribuer flertjenesteapplikasjoner
- Implementer blue-green utrullingsstrategier

**💡 Kapittelresultat**: Distribuer komplekse flertjenesteapplikasjoner ved hjelp av tilpassede infrastrukturmaler

---

### 🎯 Kapittel 5: Multi-Agent AI-løsninger (Avansert)
**Forutsetninger**: Kapitler 1-2 fullført  
**Varighet**: 2-3 timer  
**Vanskelighetsgrad**: ⭐⭐⭐⭐

#### Hva du vil lære
- Multi-agent arkitektur-mønstre
- Agentorchestrering og koordinering
- Produksjonsklare AI-utrullinger

#### Læringsressurser
- **🤖 Utvalgt prosjekt**: [Retail Multi-Agent-løsning](examples/retail-scenario.md) - Full implementering
- **🛠️ ARM-maler**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Ett-klikk utrulling
- **📖 Arkitektur**: [Multi-agent koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Distribuer den komplette fleragentløsningen for detaljhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforsk agentkonfigurasjoner
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapittelresultat**: Distribuer og administrer en produksjonsklar multi-agent AI-løsning med Kunde- og Lager-agenter

---

### 🔍 Kapittel 6: Forhåndsutplassering Validering og Planlegging
**Forutsetninger**: Kapittel 4 fullført  
**Varighet**: 1 time  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære
- Kapasitetsplanlegging og ressursvalidering
- SKU-valgstrategier
- Forhåndssjekker og automatisering

#### Læringsressurser
- **📊 Planlegging**: [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursvalidering
- **💰 Valg**: [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektive valg
- **✅ Validering**: [Forhåndssjekker](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserte skript

#### Praktiske øvelser
- Kjør valideringsskript for kapasitet
- Optimaliser SKU-valg for kostnad
- Implementer automatiserte forhåndssjekker før utrulling

**💡 Kapittelresultat**: Valider og optimaliser utrullinger før utførelse

---

### 🚨 Kapittel 7: Feilsøking og Debugging
**Forutsetninger**: Noen utrullingskapitler fullført  
**Varighet**: 1-1.5 timer  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære
- Systematiske feilsøkingsmetoder
- Vanlige problemer og løsninger
- AI-spesifikk feilsøking

#### Læringsressurser
- **🔧 Vanlige problemer**: [Vanlige problemer](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Feilsøking**: [Feilsøkingsguide](docs/chapter-07-troubleshooting/debugging.md) - Steg-for-steg strategier
- **🤖 AI-problemer**: [AI-spesifikk feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-tjenesteproblemer

#### Praktiske øvelser
- Diagnostiser utrullingsfeil
- Løs autentiseringsproblemer
- Feilsøk AI-tjenestekonnektivitet

**💡 Kapittelresultat**: Selvstendig diagnostisere og løse vanlige problemer ved utrulling

---

### 🏢 Kapittel 8: Produksjon og Enterprise-mønstre
**Forutsetninger**: Kapitler 1-4 fullført  
**Varighet**: 2-3 timer  
**Vanskelighetsgrad**: ⭐⭐⭐⭐

#### Hva du vil lære
- Produksjonsutrullingsstrategier
- Enterprise sikkerhetsmønstre
- Overvåking og kostnadsoptimalisering

#### Læringsressurser
- **🏭 Produksjon**: [Produksjons AI beste praksis](docs/chapter-08-production/production-ai-practices.md) - Enterprise mønstre
- **📝 Eksempler**: [Mikrotjenester-eksempel](../../examples/microservices) - Kompleks arkitektur
- **📊 Overvåking**: [Application Insights-integrasjon](docs/chapter-06-pre-deployment/application-insights.md) - Overvåking

#### Praktiske øvelser
- Implementer enterprise sikkerhetsmønstre
- Sett opp omfattende overvåking
- Distribuer til produksjon med riktig styring

**💡 Kapittelresultat**: Distribuer enterprise-klare applikasjoner med full produksjonskapasitet

---

## 🎓 Workshop Oversikt: Praktisk Læringserfaring

> **⚠️ WORKSHOP STATUS: Aktiv Utvikling**  
> Workshopmaterialene utvikles og forbedres for tiden. Kjernemoduler fungerer, men noen avanserte seksjoner er uferdige. Vi jobber aktivt med å fullføre alt innhold. [Følg fremdriften →](workshop/README.md)

### Interaktive Workshopmaterialer
**Omfattende praktisk læring med nettleserbaserte verktøy og veiledede øvelser**
Våre workshop-materiell gir en strukturert, interaktiv læringsopplevelse som kompletterer det kapittelbaserte pensumet ovenfor. Workshopen er designet for både selvstyrt læring og instruktørledede økter.

#### 🛠️ Workshop-funksjoner
- **Nettleserbasert grensesnitt**: Fullført MkDocs-drevet workshop med søk, kopi og tema-funksjoner
- **GitHub Codespaces-integrasjon**: Ett-klikk oppsett av utviklingsmiljø
- **Strukturert læringsløp**: 8-modulers veiledede øvelser (3-4 timer totalt)
- **Progressiv metodikk**: Introduksjon → Utvalg → Validering → Nedbrytning → Konfigurasjon → Tilpasning → Nedrigging → Oppsummering
- **Interaktivt DevContainer-miljø**: Forhåndskonfigurerte verktøy og avhengigheter

#### 📚 Workshop-modulstruktur
Workshopen følger en **8-modulers progressiv metodikk** som tar deg fra oppdagelse til mestring av distribusjon:

| Modul | Emne | Hva du vil gjøre | Varighet |
|--------|-------|----------------|----------|
| **0. Introduksjon** | Workshop-oversikt | Forstå læringsmål, forutsetninger og workshop-struktur | 15 min |
| **1. Utvalg** | Malutforskning | Utforsk AZD-maler og velg riktig AI-mal for ditt scenario | 20 min |
| **2. Validering** | Distribuer & verifiser | Distribuer malen med `azd up` og valider at infrastrukturen fungerer | 30 min |
| **3. Nedbrytning** | Forstå struktur | Bruk GitHub Copilot til å utforske malens arkitektur, Bicep-filer og kodeorganisering | 30 min |
| **4. Konfigurasjon** | azure.yaml dypdykk | Mestre `azure.yaml` konfigurasjon, livssyklus-hooks og miljøvariabler | 30 min |
| **5. Tilpasning** | Gjør den din | Aktiver AI Search, tracing, evaluering og tilpass for ditt scenario | 45 min |
| **6. Nedrigging** | Rydd opp | Slett trygt ressurser med `azd down --purge` | 15 min |
| **7. Oppsummering** | Neste steg | Gjennomgå oppnådde resultater, nøkkelkonsepter og fortsett din læringsreise | 15 min |

**Workshop-flyt:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Komme i gang med workshopen
```bash
# Alternativ 1: GitHub Codespaces (Anbefalt)
# Klikk "Code" → "Create codespace on main" i depotet

# Alternativ 2: Lokal utvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg oppsettinstruksjonene i workshop/README.md
```

#### 🎯 Læringsutbytte fra workshopen
Ved å fullføre workshopen vil deltakerne:
- **Distribuere produksjonsklare AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester
- **Mestre multi-agent arkitekturer**: Implementere koordinerte AI-agent løsninger
- **Implementere sikkerhetsbeste praksis**: Konfigurere autentisering og tilgangskontroll
- **Optimalisere for skala**: Designe kostnadseffektive, ytelsessterke distribusjoner
- **Feilsøke distribusjoner**: Løse vanlige problemer selvstendig

#### 📖 Workshop-ressurser
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Nettleserbasert læringsmiljø
- **📋 Modul-for-modul instruksjoner**:
  - [0. Introduksjon](workshop/docs/instructions/0-Introduction.md) - Workshop-oversikt og målsetting
  - [1. Utvalg](workshop/docs/instructions/1-Select-AI-Template.md) - Finn og velg AI-maler
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuer og verifiser maler
  - [3. Nedbrytning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforsk malarkitektur
  - [4. Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpass for ditt scenario
  - [6. Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rydd opp ressurser
  - [7. Oppsummering](workshop/docs/instructions/7-Wrap-up.md) - Gjennomgang og neste steg
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserte øvelser
- **💡 Rask start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljøkonfigurasjon

**Perfekt for**: Bedriftstrening, universitetskurs, selvstyrt læring og utviklerbootcamps.

---

## 📖 Dypdykk: AZD-funksjoner

Utover det grunnleggende tilbyr AZD kraftige funksjoner for produksjonsdistribusjoner:

- **Malbaserte distribusjoner** - Bruk forhåndsbygde maler for vanlige applikasjonsmønstre
- **Infrastruktur som kode** - Administrer Azure-ressurser med Bicep eller Terraform  
- **Integrerte arbeidsflyter** - Problemfri provisjonering, distribusjon og overvåking av applikasjoner
- **Utviklervennlig** - Optimalisert for utviklerproduktivitet og -opplevelse

### **AZD + Microsoft Foundry: Perfekt for AI-distribusjoner**

**Hvorfor AZD for AI-løsninger?** AZD møter de største utfordringene AI-utviklere står overfor:

- **AI-klare maler** - Forhåndskonfigurerte maler for Azure OpenAI, Cognitive Services og ML-arbeidsbelastninger
- **Sikre AI-distribusjoner** - Innebygde sikkerhetsmønstre for AI-tjenester, API-nøkler og modellendepunkter  
- **Produksjonsklare AI-mønstre** - Beste praksis for skalerbare, kostnadseffektive AI-applikasjonsdistribusjoner
- **Ende-til-ende AI-arbeidsflyter** - Fra modellutvikling til produksjonsdistribusjon med riktig overvåking
- **Kostnadsoptimalisering** - Smarte ressurstildelings- og skaleringstrategier for AI-arbeidsbelastninger
- **Microsoft Foundry-integrasjon** - Sømløs kobling til Microsoft Foundry modellkatalog og endepunkter

---

## 🎯 Maler og eksempelbibliotek

### Anbefalt: Microsoft Foundry-maler
**Start her hvis du distribuerer AI-applikasjoner!**

> **Merk:** Disse malene viser ulike AI-mønstre. Noen er eksterne Azure Samples, andre er lokale implementeringer.

| Mal | Kapittel | Kompleksitet | Tjenester | Type |
|----------|---------|------------|----------|------|
| [**Kom i gang med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom i gang med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapittel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Kjappstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Anbefalt: Fullstendige lærescenerier
**Produksjonsklare applikasjonsmaler knyttet til læringskapitler**

| Mal | Læringskapittel | Kompleksitet | Nøkkellæring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | Grunnleggende AI-distribusjonsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapittel 4 | ⭐⭐ | Integrasjon av dokumentintelligens |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | Agent-rammeverk og funksjonskalling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐ | Enterprise AI-orchestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med Kunde- og Lager-agenter |

### Læring etter eksempelslag

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repoet) = Klar til bruk umiddelbart  
> **Eksterne eksempler** (Azure Samples) = Klon fra lenkede repositorier

#### Lokale eksempler (klare til bruk)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fullstendig produksjonsklar implementering med ARM-maler
  - Multi-agent arkitektur (Kunde + Lager-agenter)
  - Omfattende overvåking og evaluering
  - Ett-klikk distribusjon via ARM-mal

#### Lokale eksempler - Containerapplikasjoner (kapitler 2-5)
**Omfattende containerdistribusjonseksempler i dette repoet:**
- [**Container App Eksempler**](examples/container-app/README.md) - Komplett guide til containeriserte distribusjoner
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Grunnleggende REST API med scale-to-zero
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produksjonsklar multi-tjeneste distribusjon
  - Kjapp start, produksjon og avanserte distribusjonsmønstre
  - Veiledning i overvåking, sikkerhet og kostnadsoptimalisering

#### Eksterne eksempler - Enkle applikasjoner (kapitler 1-2)
**Klon disse Azure Samples-repositoriene for å komme i gang:**
- [Enkel Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grunnleggende distribusjonsmønstre
- [Statisk nettside - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statisk innhold-distribusjon
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API distribusjon

#### Eksterne eksempler - Databaseintegrasjon (kapitler 3-4)  
- [Databaseapp - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database-tilkoblingsmønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data arbeidsflyt

#### Eksterne eksempler - Avanserte mønstre (kapitler 4-8)
- [Java Mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-tjenestearkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrunnsprosessering  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produksjonsklare ML-mønstre

### Eksterne mal-samlinger
- [**Offisiell AZD-malkatalog**](https://azure.github.io/awesome-azd/) - Kuratert samling av offisielle og fellesskapsmaler
- [**Azure Developer CLI-maler**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn dokumentasjon av maler
- [**Examples Directory**](examples/README.md) - Lokale læringseksempler med detaljerte forklaringer

---

## 📚 Læringsressurser & referanser

### Hurtigreferanser
- [**Kommando-lommeguide**](resources/cheat-sheet.md) - Viktige azd-kommandoer organisert etter kapittel
- [**Ordliste**](resources/glossary.md) - Azure- og azd-terminologi  
- [**FAQ**](resources/faq.md) - Vanlige spørsmål organisert etter læringskapittel
- [**Studieveiledning**](resources/study-guide.md) - Omfattende øvelser

### Praktiske workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsningene dine AZD-distribuerbare (2-3 timer)
- [**Interaktiv workshop**](workshop/README.md) - 8-modulers veiledede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduksjon → Utvalg → Validering → Nedbrytning → Konfigurasjon → Tilpasning → Nedrigging → Oppsummering

### Eksterne læringsressurser
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Rask feilsøkingsguide

**Vanlige problemer nybegynnere møter og umiddelbare løsninger:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Installer AZD først
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Bekreft installasjonen
azd version
```
</details>

<details>
<summary><strong>❌ "Ingen abonnement funnet" eller "Abonnement ikke satt"</strong></summary>

```bash
# List opp tilgjengelige abonnementer
az account list --output table

# Sett standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Sett for AZD-miljø
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifisere
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" eller "Kvota overskredet"</strong></summary>

```bash
# Prøv en annen Azure-region
azd env set AZURE_LOCATION "westus2"
azd up

# Eller bruk mindre SKU-er i utvikling
# Rediger infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" feiler midt i prosessen</strong></summary>
```bash
# Alternativ 1: Rens og prøv igjen
azd down --force --purge
azd up

# Alternativ 2: Bare fiks infrastrukturen
azd provision

# Alternativ 3: Sjekk detaljert status
azd show

# Alternativ 4: Sjekk logger i Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentisering mislyktes" eller "Token utløpt"</strong></summary>

```bash
# Re-autentiser
az logout
az login

azd auth logout
azd auth login

# Bekreft autentisering
az account show
```
</details>

<details>
<summary><strong>❌ "Ressurs finnes allerede" eller navnekonflikter</strong></summary>

```bash
# AZD genererer unike navn, men ved konflikt:
azd down --force --purge

# Prøv på nytt med nytt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Maldistribusjon tar for lang tid</strong></summary>

**Vanlige ventetider:**
- Enkel webapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikasjoner: 15-25 minutter (OpenAI-tilordning er treg)

```bash
# Sjekk fremdrift
azd show

# Hvis fast i >30 minutter, sjekk Azure-portalen:
azd monitor
# Se etter mislykkede distribusjoner
```
</details>

<details>
<summary><strong>❌ "Tillatelse nektet" eller "Forbudt"</strong></summary>

```bash
# Sjekk din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du trenger minst "Bidragsyter"-rolle
# Be din Azure-administrator om å gi:
# - Bidragsyter (for ressurser)
# - Brukerrolleadministrator (for rolleoppgaver)
```
</details>

<details>
<summary><strong>❌ Kan ikke finne distribuert applikasjons-URL</strong></summary>

```bash
# Vis alle tjenesteendepunkter
azd show

# Eller åpne Azure-portalen
azd monitor

# Sjekk spesifikk tjeneste
azd env get-values
# Se etter *_URL-variabler
```
</details>

### 📚 Full Feilsøkingsressurser

- **Vanlige problemer-veiledning:** [Detaljerte løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spesifikke problemer:** [AI Feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Feilsøkingsguide:** [Trinnvis feilsøking](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjelp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursfullføring & Sertifisering

### Framdriftssporing
Spor læreprosessen din gjennom hvert kapittel:

- [ ] **Kapittel 1**: Grunnlag & Rask start ✅
- [ ] **Kapittel 2**: AI-først utvikling ✅  
- [ ] **Kapittel 3**: Konfigurasjon & Autentisering ✅
- [ ] **Kapittel 4**: Infrastruktur som kode & Distribusjon ✅
- [ ] **Kapittel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapittel 6**: Forhåndsvalidering & Planlegging ✅
- [ ] **Kapittel 7**: Feilsøking & Debugging ✅
- [ ] **Kapittel 8**: Produksjon & Enterprise-mønstre ✅

### Læreverifisering
Etter å ha fullført hvert kapittel, verifiser kunnskapen din ved å:
1. **Praktisk øvelse**: Fullfør kapittelets praktiske distribusjon
2. **Kunnskapssjekk**: Gå gjennom FAQ-seksjonen for kapittelet ditt
3. **Fellesskapsdiskusjon**: Del erfaringen din i Azure Discord
4. **Neste kapittel**: Gå videre til neste kompleksitetsnivå

### Fordeler ved kursfullføring
Når du har fullført alle kapitlene, vil du ha:
- **Produksjonserfaring**: Distribuert ekte AI-applikasjoner til Azure
- **Profesjonelle ferdigheter**: Enterprise-klar distribusjonskompetanse  
- **Fellesskapsanerkjennelse**: Aktiv medlem av Azure utviklerfellesskap
- **Karriereutvikling**: Etterspurt AZD- og AI-distribusjonskompetanse

---

## 🤝 Fellesskap & Støtte

### Få hjelp & støtte
- **Tekniske problemer**: [Rapporter feil og be om funksjoner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørsmål**: [Microsoft Azure Discord-fellesskap](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifikk hjelp**: Bli med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasjon**: [Offisiell Azure Developer CLI dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fellesskapsinnsikt fra Microsoft Foundry Discord

**Nylige meningsmålinger fra #Azure-kanalen:**
- **45 %** av utviklere ønsker å bruke AZD for AI-arbeidsbelastninger
- **Topp utfordringer:** Distribusjon av flere tjenester, håndtering av legitimasjon, produksjonsberedskap  
- **Mest etterspurt:** AI-spesifikke maler, feilsøkingsguider, beste praksis

**Bli med i vårt fellesskap for å:**
- Dele dine AZD + AI erfaringer og få hjelp
- Få tilgang til tidlige forhåndsvisninger av nye AI-maler
- Bidra til beste praksis for AI-distribusjon
- Påvirke fremtidig AI + AZD funksjonsutvikling

### Bidra til kurset
Vi tar imot bidrag! Vennligst les vår [Bidragsveiledning](CONTRIBUTING.md) for detaljer om:
- **Innholdsforbedringer:** Forbedre eksisterende kapitler og eksempler
- **Nye eksempler:** Legg til virkelighetsnære scenarier og maler  
- **Oversettelse:** Hjelp til å opprettholde flerspråklig støtte
- **Feilrapporter:** Forbedre nøyaktighet og klarhet
- **Fellesskapsstandarder:** Følg våre inkluderende fellesskapsretningslinjer

---

## 📄 Kursinformasjon

### Lisens
Dette prosjektet er lisensiert under MIT-lisensen - se [LICENSE](../../LICENSE) for detaljer.

### Relaterte Microsoft læringsressurser

Vårt team produserer andre omfattende læringskurs:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
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
 
### Kjerne-læring
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serie
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigasjon

**🚀 Klar til å starte læring?**

**Nybegynnere**: Start med [Kapittel 1: Grunnlag & Rask start](../..)  

**AI-utviklere**: Hopp til [Kapittel 2: AI-første utvikling](../..)  
**Erfarne utviklere**: Start med [Kapittel 3: Konfigurasjon & autentisering](../..)

**Neste steg**: [Start Kapittel 1 - AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->