# AZD For Beginners: En strukturert læringsreise

![AZD-for-beginners](../../translated_images/no/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiserte oversettelser (alltid oppdatert)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (tradisjonell, Hong Kong)](../zh-HK/README.md) | [Kinesisk (tradisjonell, Macau)](../zh-MO/README.md) | [Kinesisk (tradisjonell, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tsjekkisk](../cs/README.md) | [Dansk](../da/README.md) | [Nederlandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Gresk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malayisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalsk](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norsk](./README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasil)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumensk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (Filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrekker du å klone lokalt?**
>
> Dette depotet inkluderer 50+ språkoversettelser som øker nedlastingsstørrelsen betydelig. For å klone uten oversettelser, bruk sparse checkout:
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
> Dette gir deg alt du trenger for å fullføre kurset med mye raskere nedlasting.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Hva er nytt i azd i dag

Azure Developer CLI har vokst utover tradisjonelle nettapper og API-er. I dag er azd verktøyet for å distribuere **hvilken som helst** applikasjon til Azure—inkludert AI-drevne applikasjoner og intelligente agenter.

Dette betyr for deg:

- **AI-agenter er nå førsteprioriterte azd arbeidsbelastninger.** Du kan initialisere, distribuere og administrere AI-agentprosjekter med samme `azd init` → `azd up` arbeidsflyt du allerede kjenner.
- **Microsoft Foundry-integrasjon** bringer modellutplassering, agentvert og AI-tjenestekonfigurasjon direkte inn i azd-maløkosystemet.
- **Kjernearbeidsflyten har ikke endret seg.** Enten du distribuerer en todo-app, en mikrotjeneste eller en multi-agent AI-løsning, er kommandoene de samme.

Hvis du har brukt azd før, er AI-støtten en naturlig utvidelse—ikke et separat verktøy eller et avansert spor. Hvis du starter nytt, lærer du én arbeidsflyt som fungerer for alt.

---

## 🚀 Hva er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et utviklervennlig kommandolinjeverktøy som gjør det enkelt å distribuere applikasjoner til Azure. I stedet for å manuelt lage og koble dusinvis av Azure-ressurser, kan du distribuere hele applikasjoner med én enkelt kommando.

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

**Det er det!** Ingen klikk i Azure-portalen, ingen kompliserte ARM-maler å lære først, ingen manuell konfigurasjon - bare fungerende applikasjoner på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hva er forskjellen?

Dette er det vanligste spørsmålet nybegynnere stiller. Her er det enkle svaret:

| Funksjon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrere individuelle Azure-ressurser | Distribuere komplette applikasjoner |
| **Tankesett** | Infrastrukturfokusert | Applikasjonsfokusert |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Må kjenne Azure-tjenester | Bare kjenn appen din |
| **Best for** | DevOps, infrastruktur | Utviklere, prototyping |

### Enkel analogi

- **Azure CLI** er som å ha alle verktøy for å bygge et hus - hammere, sag, spiker. Du kan bygge hva som helst, men du må kunne bygging.
- **Azure Developer CLI** er som å ansette en entreprenør - du beskriver hva du vil ha, og de tar seg av byggingen.

### Når du skal bruke hva

| Scenario | Bruk dette |
|----------|------------|
| "Jeg vil raskt distribuere webappen min" | `azd up` |
| "Jeg må bare lage en lagringskonto" | `az storage account create` |
| "Jeg bygger en full AI-applikasjon" | `azd init --template azure-search-openai-demo` |
| "Jeg må feilsøke en spesifikk Azure-ressurs" | `az resource show` |
| "Jeg vil ha produksjonsklar distribusjon på minutter" | `azd up --environment production` |

### De fungerer sammen!

AZD bruker Azure CLI under panseret. Du kan bruke begge:
```bash
# Distribuer appen din med AZD
azd up

# Finjuster deretter spesifikke ressurser med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Finn Maler i Awesome AZD

Ikke start fra bunnen av! **Awesome AZD** er fellesskapets samling av maler klare for distribusjon:

| Ressurs | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Bla gjennom 200+ maler med ett-klikks distribusjon |
| 🔗 [**Send inn en mal**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mal til fellesskapet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star og utforsk koden |

### Populære AI-maler fra Awesome AZD

```bash
# RAG Chat med Microsoft Foundry-modeller + AI-søk
azd init --template azure-search-openai-demo

# Rask AI-chatapplikasjon
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry-agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom i gang i 3 trinn

### Trinn 1: Installer AZD (2 minutter)

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

### Trinn 2: Logg inn på Azure

```bash
azd auth login
```

### Trinn 3: Distribuer din første app

```bash
# Initialiser fra en mal
azd init --template todo-nodejs-mongo

# Distribuer til Azure (oppretter alt!)
azd up
```

**🎉 Det var det!** Appen din er nå live på Azure.

### Rydd opp (ikke glem!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hvordan bruke dette kurset

Dette kurset er designet for **progressiv læring** - start der du er komfortabel og jobb deg oppover:

| Din erfaring | Start her |
|-----------------|------------|
| **Helt ny på Azure** | [Kapittel 1: Grunnlag](#-chapter-1-foundation--quick-start) |
| **Kjenner Azure, ny til AZD** | [Kapittel 1: Grunnlag](#-chapter-1-foundation--quick-start) |
| **Vil distribuere AI-apper** | [Kapittel 2: AI-først utvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vil ha praktisk øvelse** | [🎓 Interaktivt verksted](workshop/README.md) - 3-4 timers guidet lab |
| **Trenger produksjonsmønstre** | [Kapittel 8: Produksjon & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Rask oppsett

1. **Fork dette depotet**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjelp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrekker du å klone lokalt?**

> Dette depotet inkluderer 50+ språkoversettelser som øker nedlastingsstørrelsen betydelig. For å klone uten oversettelser, bruk sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette gir deg alt du trenger for å fullføre kurset med mye raskere nedlasting.


## Kursoversikt

Mestre Azure Developer CLI (azd) gjennom strukturerte kapitler designet for progressiv læring. **Spesiell fokus på AI-applikasjonsdistribusjon med Microsoft Foundry-integrasjon.**

### Hvorfor dette kurset er essensielt for moderne utviklere

Basert på innsikter fra Microsoft Foundry Discord-fellesskapet vil **45 % av utviklere bruke AZD for AI-arbeidsbelastninger** men møter utfordringer med:
- Komplekse AI-arkitekturer med flere tjenester
- Beste praksis for produksjonsdistribusjon av AI  
- Integrasjon og konfigurering av Azure AI-tjenester
- Kostnadsoptimalisering for AI-arbeidsbelastninger
- Feilsøking av AI-spesifikke distribusjonsproblemer

### Læringsmål

Ved å fullføre dette strukturerte kurset vil du:
- **Mestre AZD-grunnleggende**: Kjernetemaer, installasjon og konfigurasjon
- **Distribuere AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester
- **Implementere Infrastruktur som kode**: Administrere Azure-ressurser med Bicep-maler
- **Feilsøke distribusjoner**: Løse vanlige problemer og debugge feil
- **Optimalisere for produksjon**: Sikkerhet, skalering, overvåking og kostnadsstyring
- **Bygge multi-agent løsninger**: Distribuere komplekse AI-arkitekturer

## 🗺️ Kurskart: Rask navigering etter kapittel

Hvert kapittel har en dedikert README med læringsmål, rask start og øvelser:

| Kapittel | Tema | Leksjoner | Varighet | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Grunnlag](docs/chapter-01-foundation/README.md)** | Kom i gang | [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) &#124; [Installasjon](docs/chapter-01-foundation/installation.md) &#124; [Første prosjekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utvikling](docs/chapter-02-ai-development/README.md)** | AI-Først Apper | [Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modellutrulling](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 timer | ⭐⭐ |
| **[Kap 3: Konfigurasjon](docs/chapter-03-configuration/README.md)** | Autentisering & Sikkerhet | [Konfigurasjon](docs/chapter-03-configuration/configuration.md) &#124; [Autentisering & Sikkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Utrulling | [Utrullingsveiledning](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 timer | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agentløsninger | [Detaljhandel Scenario](examples/retail-scenario.md) &#124; [Koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 timer | ⭐⭐⭐⭐ |
| **[Kap 6: Forutrulling](docs/chapter-06-pre-deployment/README.md)** | Planlegging & Validering | [Forhåndssjekker](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 time | ⭐⭐ |
| **[Kap 7: Feilsøking](docs/chapter-07-troubleshooting/README.md)** | Debugging & Løsning | [Vanlige Problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 timer | ⭐⭐ |
| **[Kap 8: Produksjon](docs/chapter-08-production/README.md)** | Enterprise Mønstre | [Produksjonspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 timer | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk Lab | [Introduksjon](workshop/docs/instructions/0-Introduction.md) &#124; [Utvalg](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbryting](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Oppsummering](workshop/docs/instructions/7-Wrap-up.md) | 3-4 timer | ⭐⭐ |

**Total Varighet:** ~10-14 timer | **Ferdighetsutvikling:** Nybegynner → Produksjonsklar

---

## 📚 Læringskapitler

*Velg din læringsvei basert på erfaring og mål*

### 🚀 Kapittel 1: Grunnlag & Rask Start  
**Forutsetninger**: Azure-abonnement, grunnleggende kommandolinjekunnskap  
**Varighet**: 30-45 minutter  
**Vanskelighetsgrad**: ⭐

#### Hva du vil lære  
- Forstå grunnleggende Azure Developer CLI  
- Installere AZD på din plattform  
- Din første vellykkede utrulling  

#### Læringsressurser  
- **🎯 Start her**: [Hva er Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 Teori**: [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) - Kjernebegreper og terminologi  
- **⚙️ Oppsett**: [Installasjon & Oppsett](docs/chapter-01-foundation/installation.md) - Plattformspesifikke guider  
- **🛠️ Praktisk**: [Ditt første prosjekt](docs/chapter-01-foundation/first-project.md) - Trinnvis veiledning  
- **📋 Raskoversikt**: [Kommando-hurtigguide](resources/cheat-sheet.md)

#### Praktiske øvelser  
```bash
# Rask installasjonssjekk
azd version

# Distribuer din første applikasjon
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Kapittelresultat**: Lykkes med å rulle ut en enkel webapplikasjon til Azure ved bruk av AZD  

**✅ Suksessvalidering:**  
```bash
# Etter å ha fullført kapittel 1, bør du kunne:
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjektet
azd up                  # Distribuerer til Azure
azd show                # Viser URL for kjørende app
# Applikasjonen åpnes i nettleser og fungerer
azd down --force --purge  # Rydder opp ressurser
```
  
**📊 Tidsbruk:** 30-45 minutter  
**📈 Ferdighetsnivå etter:** Kan rulle ut grunnleggende apper selvstendig  

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
- **🤖 AI Agenter**: [AI Agentveiledning](docs/chapter-02-ai-development/agents.md) - Rull ut intelligente agenter med AZD  
- **📖 Mønstre**: [AI Modellutrulling](docs/chapter-02-ai-development/ai-model-deployment.md) - Rull ut og administrer AI-modeller  
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsningene klart for AZD  
- **🎥 Interaktiv Veiledning**: [Workshop-materialer](workshop/README.md) - Nettleserbasert læring med MkDocs * DevContainer-miljø  
- **📋 Maler**: [Microsoft Foundry-maler](#workshop-ressurser)  
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
  
**💡 Kapittelresultat**: Rull ut og konfigurer en AI-drevet chatteapplikasjon med RAG-funksjoner  

**✅ Suksessvalidering:**  
```bash
# Etter kapittel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrensesnittet
# Stille spørsmål og få AI-drevne svar med kilder
# Verifisere at søkeintegrasjonen fungerer
azd monitor  # Sjekke at Application Insights viser telemetri
azd down --force --purge
```
  
**📊 Tidsbruk:** 1-2 timer  
**📈 Ferdighetsnivå etter:** Kan rulle ut og konfigurere produksjonsklare AI-applikasjoner  
**💰 Kostnadsbevissthet:** Forstå utviklingskostnader på $80-150/måned, produksjonskostnader $300-3500/måned

#### 💰 Kostnadsoverveielser for AI-utrulling

**Utviklingsmiljø (Estimert $80-150/måned):**  
- Microsoft Foundry-modeller (betal etter bruk): $0-50/måned (basert på tokenbruk)  
- AI Søketjeneste (Grunnleggende nivå): $75/måned  
- Container Apps (Forbruk): $0-20/måned  
- Lagring (Standard): $1-5/måned  

**Produksjonsmiljø (Estimert $300-3,500+/måned):**  
- Microsoft Foundry-modeller (PTU for jevn ytelse): $3,000+/måned ELLER betalingsmodell med høyt volum  
- AI Søketjeneste (Standard nivå): $250/måned  
- Container Apps (Dedikert): $50-100/måned  
- Application Insights: $5-50/måned  
- Lagring (Premium): $10-50/måned  

**💡 Kostnadsoptimalisering:**  
- Bruk **Gratisnivå** Microsoft Foundry-modeller for læring (Azure OpenAI 50 000 tokens/måned inkludert)  
- Kjør `azd down` for å frigi ressurser når du ikke utvikler aktivt  
- Start med forbruksbasert fakturering, oppgrader til PTU bare for produksjon  
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

### ⚙️ Kapittel 3: Konfigurasjon & Autentisering  
**Forutsetninger**: Kapittel 1 fullført  
**Varighet**: 45-60 minutter  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære  
- Miljøkonfigurasjon og -håndtering  
- Autentisering og sikkerhets beste praksis  
- Ressursnavngivning og organisering  

#### Læringsressurser  
- **📖 Konfigurasjon**: [Konfigurasjonsveiledning](docs/chapter-03-configuration/configuration.md) - Miljøoppsett  
- **🔐 Sikkerhet**: [Autentiseringsmønstre og administrert identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmønstre  
- **📝 Eksempler**: [Databaseapp-eksempel](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser  
- Konfigurer flere miljøer (dev, staging, prod)  
- Sett opp administrert identitetsautentisering  
- Implementer miljøspesifikke konfigurasjoner  

**💡 Kapittelresultat**: Håndter flere miljøer med korrekt autentisering og sikkerhet

---

### 🏗️ Kapittel 4: Infrastruktur som kode & Utrulling  
**Forutsetninger**: Kapitler 1-3 fullført  
**Varighet**: 1-1,5 timer  
**Vanskelighetsgrad**: ⭐⭐⭐

#### Hva du vil lære  
- Avanserte utrullingsmønstre  
- Infrastruktur som kode med Bicep  
- Ressursprovisjoneringsstrategier  

#### Læringsressurser  
- **📖 Utrulling**: [Utrullingsveiledning](docs/chapter-04-infrastructure/deployment-guide.md) - Fullstendige arbeidsflyter  
- **🏗️ Provisionering**: [Provisionering av ressurser](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursadministrasjon  
- **📝 Eksempler**: [Container App-eksempel](../../examples/container-app) - Containerbaserte utrullinger  

#### Praktiske øvelser  
- Lag egne Bicep-maler  
- Rull ut fler-tjeneste applikasjoner  
- Implementer blå/grønn utrullingsstrategier  

**💡 Kapittelresultat**: Rull ut komplekse fler-tjeneste apper med tilpassede infrastruktursmaler

---

### 🎯 Kapittel 5: Multi-Agent AI-løsninger (Avansert)  
**Forutsetninger**: Kapitler 1-2 fullført  
**Varighet**: 2-3 timer  
**Vanskelighetsgrad**: ⭐⭐⭐⭐

#### Hva du vil lære  
- Multi-agent arkitekturmønstre  
- Agentorkestrering og koordinering  
- Produksjonsklare AI-utrullinger  

#### Læringsressurser  
- **🤖 Utvalgt prosjekt**: [Detaljhandels Multi-Agent Løsning](examples/retail-scenario.md) - Fullstendig implementering  
- **🛠️ ARM-maler**: [ARM Malpakke](../../examples/retail-multiagent-arm-template) - Ett-klikk utrulling  
- **📖 Arkitektur**: [Multi-agent koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre  

#### Praktiske øvelser  
```bash
# Distribuer den komplette detaljhandelsløsningen med flere agenter
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforsk agentkonfigurasjoner
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Kapittelresultat**: Rull ut og administrer en produksjonsklar multi-agent AI-løsning med Kunde- og Lager-agenter

---

### 🔍 Kapittel 6: Forutrulling validering & planlegging  
**Forutsetninger**: Kapittel 4 fullført  
**Varighet**: 1 time  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære  
- Kapasitetsplanlegging og ressursvalidering  
- SKU-valgstrategier  
- Forhåndskontroller og automatisering  

#### Læringsressurser  
- **📊 Planlegging**: [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursvalidering  
- **💰 Valg**: [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektive valg  
- **✅ Validering**: [Forhåndssjekker](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserte skript  

#### Praktiske øvelser  
- Kjør kapasitetsvalideringsskript  
- Optimaliser SKU-valg for kostnad  
- Implementer automatiserte forhåndssjekker  

**💡 Kapittelresultat**: Valider og optimaliser utrullinger før utførelse

---

### 🚨 Kapittel 7: Feilsøking & Debugging  
**Forutsetninger**: Ethvert utrullingskapittel fullført  
**Varighet**: 1-1,5 timer  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære  
- Systematisk feilfinningsmetodikk  
- Vanlige problemer og løsninger  
- AI-spesifikk feilsøking  

#### Læringsressurser  
- **🔧 Vanlige problemer**: [Vanlige Problemer](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger  
- **🕵️ Debugging**: [Debuggingsveiledning](docs/chapter-07-troubleshooting/debugging.md) - Trinnvise strategier  
- **🤖 AI Problemer**: [AI-spesifikk feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI tjenesteproblemer  

#### Praktiske øvelser  
- Diagnostiser utrullingsfeil  
- Løs autentiseringsproblemer  
- Feilsøk AI tjenestetilkobling  

**💡 Kapittelresultat**: Selvstendig diagnostisere og løse vanlige utrullingsproblemer

---

### 🏢 Kapittel 8: Produksjon & Enterprise Mønstre  
**Forutsetninger**: Kapitler 1-4 fullført  
**Varighet**: 2-3 timer  
**Vanskelighetsgrad**: ⭐⭐⭐⭐

#### Hva du vil lære  
- Produksjonsutrullingsstrategier  
- Enterprise sikkerhetsmønstre  
- Overvåking og kostnadsoptimalisering  

#### Læringsressurser
- **🏭 Produksjon**: [Produksjon AI Beste Praksis](docs/chapter-08-production/production-ai-practices.md) - Enterprise-mønstre
- **📝 Eksempler**: [Mikrotjenester Eksempel](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvåking**: [Application Insights-integrasjon](docs/chapter-06-pre-deployment/application-insights.md) - Overvåking

#### Praktiske Øvelser
- Implementere enterprise sikkerhetsmønstre
- Sette opp omfattende overvåking
- Distribuere til produksjon med riktig styring

**💡 Kapittelresultat**: Distribuere virksomhetsklare applikasjoner med full produksjonskapasitet

---

## 🎓 Workshop Oversikt: Praktisk Læringsopplevelse

> **⚠️ WORKSHOP STATUS: Aktiv Utvikling**  
> Workshop-materialene utvikles og forbedres for øyeblikket. Kjernemoduler fungerer, men noen avanserte seksjoner er ufullstendige. Vi jobber aktivt med å fullføre alt innhold. [Følg fremdrift →](workshop/README.md)

### Interaktive Workshop-materialer
**Omfattende praktisk læring med nettleserbaserte verktøy og veiledede øvelser**

Våre workshop-materialer tilbyr en strukturert, interaktiv læringsopplevelse som utfyller kapitlene ovenfor. Workshoppen er designet for både selvstyrt læring og instruktørledede økter.

#### 🛠️ Workshop-funksjoner
- **Nettleserbasert grensesnitt**: Komplett MkDocs-drevet workshop med søk, kopiering og tema-funksjoner
- **GitHub Codespaces-integrasjon**: Ett-klikk oppsett av utviklingsmiljø
- **Strukturert læringsløp**: 8 modulers veiledede øvelser (3-4 timer totalt)
- **Progressiv metodikk**: Introduksjon → Valg → Validering → Dekonstruksjon → Konfigurasjon → Tilpasning → Opprydding → Oppsummering
- **Interaktiv DevContainer-miljø**: Forhåndskonfigurerte verktøy og avhengigheter

#### 📚 Workshop-modulstruktur
Workshoppen følger en **8-moduls progressiv metodikk** som tar deg fra oppdagelse til distribusjonsmestring:

| Modul | Tema | Hva du gjør | Varighet |
|--------|-------|----------------|----------|
| **0. Introduksjon** | Workshop Oversikt | Forstå læringsmål, forutsetninger og workshop-struktur | 15 min |
| **1. Valg** | Maloppdagelse | Utforsk AZD-maler og velg riktig AI-mal for ditt scenario | 20 min |
| **2. Validering** | Distribuer & Verifiser | Distribuer malen med `azd up` og valider at infrastrukturen fungerer | 30 min |
| **3. Dekonstruksjon** | Forstå Struktur | Bruk GitHub Copilot for å utforske malens arkitektur, Bicep-filer og kodeorganisering | 30 min |
| **4. Konfigurasjon** | azure.yaml Dypdykk | Mestre `azure.yaml`-konfigurasjonen, livssyklus-hooks og miljøvariabler | 30 min |
| **5. Tilpasning** | Gjør Den Din | Aktiver AI-søk, sporing, evaluering og tilpass for ditt scenario | 45 min |
| **6. Opprydding** | Rydd Opp | Sikker deprovisjonering av ressurser med `azd down --purge` | 15 min |
| **7. Oppsummering** | Neste Steg | Gå gjennom oppnådde resultater, nøkkelkonsepter og fortsett læringsreisen | 15 min |

**Workshop-flyt:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Komme i gang med Workshoppen  
```bash
# Alternativ 1: GitHub Codespaces (Anbefalt)
# Klikk "Code" → "Create codespace on main" i depotet

# Alternativ 2: Lokal utvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg installasjonsinstruksjonene i workshop/README.md
```
  
#### 🎯 Workshop Læringsresultater  
Ved fullføring av workshoppen vil deltakerne:  
- **Distribuere Produksjonsklare AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester  
- **Mestre Multi-Agent Arkitekturer**: Implementere koordinerte AI-agentløsninger  
- **Implementere Sikkerhetsbestepraksis**: Konfigurere autentisering og tilgangskontroll  
- **Optimalisere for Skala**: Designe kostnadseffektive, ytelsesoptimaliserte distribusjoner  
- **Feilsøke Distribusjoner**: Løse vanlige problemer på egen hånd  

#### 📖 Workshop-ressurser
- **🎥 Interaktiv Veiledning**: [Workshop-materialer](workshop/README.md) - Nettleserbasert læringsmiljø  
- **📋 Modul-for-Modul Instruksjoner**:  
  - [0. Introduksjon](workshop/docs/instructions/0-Introduction.md) - Workshop oversikt og mål  
  - [1. Valg](workshop/docs/instructions/1-Select-AI-Template.md) - Finn og velg AI-maler  
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuer og verifiser maler  
  - [3. Dekonstruksjon](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforsk malarkitektur  
  - [4. Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml  
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpass for ditt scenario  
  - [6. Opprydding](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rydd opp ressurser  
  - [7. Oppsummering](workshop/docs/instructions/7-Wrap-up.md) - Gjennomgang og neste steg  
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserte øvelser  
- **💡 Rask start**: [Workshop Setup-veiledning](workshop/README.md#quick-start) - Miljøkonfigurasjon  

**Perfekt for**: Bedriftstrening, universitetskurs, selvstyrt læring og utvikler-bootcamps.

---

## 📖 Dypdykk: AZD-funksjonalitet

Utover det grunnleggende gir AZD kraftige funksjoner for produksjonsdistribusjoner:

- **Malbaserte distribusjoner** - Bruk ferdige maler for vanlige applikasjonsmønstre  
- **Infrastructure as Code** - Administrer Azure-ressurser med Bicep eller Terraform  
- **Integrerte arbeidsflyter** - Sømløs provisjonering, distribusjon og overvåking av applikasjoner  
- **Utviklervennlig** - Optimalisert for utviklerproduktivitet og brukeropplevelse  

### **AZD + Microsoft Foundry: Perfekt for AI-distribusjoner**

**Hvorfor AZD for AI-løsninger?** AZD løser de største utfordringene AI-utviklere møter:

- **AI-klare maler** - Forhåndskonfigurerte maler for Microsoft Foundry-modeller, Cognitive Services og ML-arbeidsmengder  
- **Sikre AI-distribusjoner** - Innebygde sikkerhetsmønstre for AI-tjenester, API-nøkler og modellendepunkter  
- **Produksjons AI-mønstre** - Beste praksis for skalerbare, kostnadseffektive AI-applikasjonsdistribusjoner  
- **End-to-End AI-arbeidsflyter** - Fra modellutvikling til produksjonsdistribusjon med riktig overvåking  
- **Kostnadsoptimalisering** - Smarte ressursallokeringer og skaleringsstrategier for AI-arbeidsmengder  
- **Microsoft Foundry-integrasjon** - Sømløs tilkobling til Microsoft Foundry-modellkatalog og endepunkter  

---

## 🎯 Maler & Eksempelsbibliotek

### Anbefalt: Microsoft Foundry-maler  
**Start her hvis du distribuerer AI-applikasjoner!**

> **Merk:** Disse malene viser ulike AI-mønstre. Noen er eksterne Azure Samples, andre er lokale implementasjoner.

| Mal | Kapittel | Kompleksitet | Tjenester | Type |
|----------|---------|--------------|----------|-------|
| [**Kom i gang med AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom i gang med AI agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapittel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Raskstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Anbefalt: Fullstendige læringsscenarier  
**Produksjonsklare applikasjonsmaler koblet til læringskapitler**

| Mal | Læringskapittel | Kompleksitet | Hovedlæring |
|----------|-----------------|--------------|-------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | Grunnleggende AI-distribusjonsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapittel 4 | ⭐⭐ | Dokumentintelligens-integrasjon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | Agent-rammeverk og funksjonskalling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐ | Enterprise AI orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med Kunde- og Lager-agenter |

### Læring etter eksempelslag type

> **📌 Lokale vs. Eksterne eksempler:**  
> **Lokale eksempler** (i dette repoet) = Klar til bruk umiddelbart  
> **Eksterne eksempler** (Azure Samples) = Klon fra lenkede repoer

#### Lokale Eksempler (Klar til Bruk)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fullstendig produksjonsklar implementering med ARM-maler  
  - Multi-agent arkitektur (Kunde + Lager-agenter)  
  - Omfattende overvåking og evaluering  
  - Ett-klikk distribusjon via ARM-mal  

#### Lokale Eksempler - Container-applikasjoner (Kapittel 2-5)  
**Utførlige containerdistribusjonseksempler i dette repositoriet:**  
- [**Container App Eksempler**](examples/container-app/README.md) - Komplett guide til containerdistribusjoner  
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Grunnleggende REST API med scale-to-zero  
  - [Mikrotjeneste-arkitektur](../../examples/container-app/microservices) - Produksjonsklar multi-service distribusjon  
  - Rask start, Produksjon og Avanserte distribusjonsmønstre  
  - Overvåking, sikkerhet og kostnadsoptimalisering veiledning  

#### Eksterne Eksempler - Enkle Applikasjoner (Kapittel 1-2)  
**Klon disse Azure Samples repoene for å komme i gang:**  
- [Enkel Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grunnleggende distribusjonsmønstre  
- [Statisk Nettside - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statisk innholdsdistribusjon  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API distribusjon  

#### Eksterne Eksempler - Databaseintegrasjon (Kapittel 3-4)  
- [Databaseapp - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databasekoblingsmønstre  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløs dataarbeidsflyt  

#### Eksterne Eksempler - Avanserte Mønstre (Kapittel 4-8)  
- [Java Mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service arkitekturer  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrunnsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produksjonsklare ML-mønstre  

### Eksterne Mal-samlinger  
- [**Offisiell AZD-malgalleri**](https://azure.github.io/awesome-azd/) - Kuratert samling av offisielle og community-maler  
- [**Azure Developer CLI-maler**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn-mal-dokumentasjon  
- [**Eksempelkatalog**](examples/README.md) - Lokale læringseksempler med detaljert forklaring  

---

## 📚 Læringsressurser & Referanser

### Rask Referanse
- [**Kommandooversikt**](resources/cheat-sheet.md) - Viktige azd-kommandoer organisert etter kapittel  
- [**Ordliste**](resources/glossary.md) - Azure og azd-terminologi  
- [**FAQ**](resources/faq.md) - Vanlige spørsmål organisert etter læringskapittel  
- [**Studieveiledning**](resources/study-guide.md) - Omfattende praktiske øvelser  

### Praktiske Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsningene dine AZD-distribuerbare (2-3 timer)  
- [**Interaktiv Workshop**](workshop/README.md) - 8-moduls veiledede øvelser med MkDocs og GitHub Codespaces  
  - Følger: Introduksjon → Valg → Validering → Dekonstruksjon → Konfigurasjon → Tilpasning → Opprydding → Oppsummering  

### Eksterne Læringsressurser
- [Azure Developer CLI-dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pris Kalkulator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI-Agentferdigheter for Din Editor
- [**Microsoft Azure Skills på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åpne agentferdigheter for Azure AI, Foundry, distribusjon, diagnostikk, kostnadsoptimalisering og mer. Installer dem i GitHub Copilot, Cursor, Claude Code, eller hvilken som helst støttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rask Feilsøkingsveiledning

**Vanlige problemer nybegynnere møter og umiddelbare løsninger:**

<details>
<summary><strong>❌ "azd: kommando ikke funnet"</strong></summary>

```bash
# Installer AZD først
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifiser installasjonen
azd version
```
</details>

<details>
<summary><strong>❌ "Ingen abonnement funnet" eller "Abonnement ikke satt"</strong></summary>

```bash
# List tilgjengelige abonnementer
az account list --output table

# Angi standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Angi for AZD-miljø
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiser
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" eller "Kvota overskredet"</strong></summary>

```bash
# Prøv forskjellige Azure-regioner
azd env set AZURE_LOCATION "westus2"
azd up

# Eller bruk mindre SKUer i utvikling
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

# Alternativ 2: Bare reparer infrastrukturen
azd provision

# Alternativ 3: Sjekk detaljert status
azd show

# Alternativ 4: Sjekk logger i Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentisering feilet" eller "Token utløpt"</strong></summary>

```bash
# Autentiser på nytt
az logout
az login

azd auth logout
azd auth login

# Verifiser autentisering
az account show
```
</details>

<details>
<summary><strong>❌ "Ressurs finnes allerede" eller navnekonflikter</strong></summary>

```bash
# AZD genererer unike navn, men ved konflikt:
azd down --force --purge

# Prøv igjen med et nytt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mal-distribusjon tar for lang tid</strong></summary>

**Normale ventetider:**
- Enkel webapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikasjoner: 15-25 minutter (OpenAI-provisjonering er treg)

```bash
# Sjekk fremdrift
azd show

# Hvis fastlåst i >30 minutter, sjekk Azure Portal:
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
# Be Azure-administratoren din om å gi:
# - Bidragsyter (for ressurser)
# - Brukertilgangsadministrator (for rolleoppgaver)
```
</details>

<details>
<summary><strong>❌ Kan ikke finne distribuert applikasjons-URL</strong></summary>

```bash
# Vis alle tjenendepunkter
azd show

# Eller åpne Azure-portalen
azd monitor

# Sjekk spesifikk tjeneste
azd env get-values
# Se etter *_URL variabler
```
</details>

### 📚 Fullstendige Feilsøkingsressurser

- **Vanlige problemer guide:** [Detaljerte løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spesifikke problemer:** [AI feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging guide:** [Steg-for-steg debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjelp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursfullføring & Sertifisering

### Fremdriftssporing
Spor læringsfremgangen din gjennom hvert kapittel:

- [ ] **Kapittel 1**: Grunnlag & Rask Start ✅
- [ ] **Kapittel 2**: AI-Først Utvikling ✅  
- [ ] **Kapittel 3**: Konfigurasjon & Autentisering ✅
- [ ] **Kapittel 4**: Infrastruktur som kode & Distribusjon ✅
- [ ] **Kapittel 5**: Multi-Agent AI-løsninger ✅
- [ ] **Kapittel 6**: Forhåndsvalidering & Planlegging ✅
- [ ] **Kapittel 7**: Feilsøking & Debugging ✅
- [ ] **Kapittel 8**: Produksjon & Enterprise-mønstre ✅

### Læringsverifisering
Etter å ha fullført hvert kapittel, verifiser kunnskapen din ved å:
1. **Praktisk Øvelse**: Fullfør kapittelets praktiske distribusjon
2. **Kunnskapssjekk**: Gjennomgå FAQ-seksjonen for kapittelet
3. **Fellesskapsdiskusjon**: Del dine erfaringer i Azure Discord
4. **Neste Kapittel**: Gå videre til neste kompleksitetsnivå

### Fordeler ved Kursfullføring
Når du har fullført alle kapitlene, vil du ha:
- **Produksjonserfaring**: Distribuert ekte AI-applikasjoner til Azure
- **Profesjonelle ferdigheter**: Enterprise-klare distribusjonsevner  
- **Fellesskapsgjenkjennelse**: Aktiv medlem av Azure utviklerfellesskapet
- **Karrierefremgang**: Ettertraktet AZD og AI-distribusjonskompetanse

---

## 🤝 Fellesskap & Støtte

### Få hjelp & støtte
- **Tekniske problemer**: [Rapporter feil og foreslå funksjoner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørsmål**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifikk hjelp**: Bli med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasjon**: [Offisiell Azure Developer CLI dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fellesskapinnsikt fra Microsoft Foundry Discord

**Nylige avstemningsresultater fra #Azure-kanalen:**
- **45 %** av utviklere ønsker å bruke AZD for AI-arbeidsbelastninger
- **Topp utfordringer**: Multi-tjeneste distribusjoner, håndtering av legitimasjon, produksjonsklarhet  
- **Mest etterspurte**: AI-spesifikke maler, feilsøkingsguider, beste praksis

**Bli med i vårt fellesskap for å:**
- Dele dine AZD + AI-opplevelser og få hjelp
- Få tilgang til tidlige forhåndsvisninger av nye AI-maler
- Bidra til beste praksis for AI-distribusjon
- Påvirke fremtidig utvikling av AI + AZD-funksjoner

### Bidra til kurset
Vi tar imot bidrag! Vennligst les vår [Contributing Guide](CONTRIBUTING.md) for detaljer om:
- **Innholdsforbedringer**: Forbedre eksisterende kapitler og eksempler
- **Nye eksempler**: Legg til virkelige scenarioer og maler  
- **Oversettelse**: Hjelp med å opprettholde flerspråklig støtte
- **Feilrapporter**: Forbedre nøyaktighet og klarhet
- **Fellesskapsstandarder**: Følg våre inkluderende fellesskapsretningslinjer

---

## 📄 Kursinformasjon

### Lisens
Dette prosjektet er lisensiert under MIT-lisensen - se [LICENSE](../../LICENSE)-filen for detaljer.

### Relaterte Microsoft Learning-ressurser

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
 
### Generative AI Serie
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kjerne Læring
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serie
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigasjon

**🚀 Klar til å begynne å lære?**

**Nybegynnere**: Start med [Kapittel 1: Grunnlag & Rask start](#-chapter-1-foundation--quick-start)  
**AI-utviklere**: Gå til [Kapittel 2: AI-først utvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne utviklere**: Begynn med [Kapittel 3: Konfigurasjon & Autentisering](#️-chapter-3-configuration--authentication)

**Neste steg**: [Begynn Kapittel 1 - AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved bruk av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, bør du være oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->