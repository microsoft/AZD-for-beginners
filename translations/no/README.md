# AZD for nybegynnere: En strukturert læringsreise

![AZD-for-beginners](../../translated_images/no/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiserte oversettelser (alltid oppdatert)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (tradisjonell, Hong Kong)](../zh-HK/README.md) | [Kinesisk (tradisjonell, Macau)](../zh-MO/README.md) | [Kinesisk (tradisjonell, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tsjekkisk](../cs/README.md) | [Dansk](../da/README.md) | [Nederlandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Gresk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malaysisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisk](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norsk](./README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasil)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumensk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrekker du å klone lokalt?**
>
> Dette depotet inkluderer 50+ språköversettelser som øker nedlastningsstørrelsen betydelig. For å klone uten oversettelser, bruk spars checkout:
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

Azure Developer CLI har vokst utover tradisjonelle webapper og API-er. I dag er azd det eneste verktøyet for å distribuere **hvilken som helst** applikasjon til Azure—inkludert AI-drevne applikasjoner og intelligente agenter.

Dette betyr følgende for deg:

- **AI-agenter er nå førsteklasses azd-arbeidsmengder.** Du kan initialisere, distribuere og administrere AI-agentprosjekter ved å bruke den samme `azd init` → `azd up` arbeidsflyten du allerede kjenner.
- **Microsoft Foundry-integrasjon** bringer modell-distribusjon, agent-vert, og AI-tjenestekonfigurasjon direkte inn i azd-malle-økosystemet.
- **Kjernearbeidsflyten har ikke endret seg.** Enten du distribuerer en todo-app, en mikrotjeneste, eller en multi-agent AI-løsning, er kommandoene de samme.

Hvis du har brukt azd før, er AI-støtten en naturlig utvidelse—ikke et eget verktøy eller et avansert spor. Starter du ferskt, lærer du én arbeidsflyt som fungerer for alt.

---

## 🚀 Hva er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et utviklervennlig kommandolinjeverktøy som gjør det enkelt å distribuere applikasjoner til Azure. I stedet for å manuelt opprette og koble sammen dusinvis av Azure-ressurser, kan du distribuere hele applikasjoner med én enkelt kommando.

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

**Det er alt!** Ingen klikk i Azure-portalen, ingen komplekse ARM-maler du må lære først, ingen manuell konfigurasjon - bare fungerende applikasjoner på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hva er forskjellen?

Dette er det vanligste spørsmålet nybegynnere stiller. Her er det enkle svaret:

| Funksjon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrere individuelle Azure-ressurser | Distribuere komplette applikasjoner |
| **Tankesett** | Infrastruktur-fokusert | Applikasjons-fokusert |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Må kjenne Azure-tjenester | Bare kjenn appen din |
| **Best for** | DevOps, Infrastruktur | Utviklere, prototyping |

### Enkel analogi

- **Azure CLI** er som å ha alle verktøyene for å bygge et hus - hammer, sag, spiker. Du kan bygge hva som helst, men du må kunne konstruksjon.
- **Azure Developer CLI** er som å leie en entreprenør - du beskriver hva du vil ha, og de tar seg av byggingen.

### Når bruke hva

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

Ikke start fra bunnen av! **Awesome AZD** er fellesskapets samling av ferdigdeployerte maler:

| Ressurs | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Bla gjennom 200+ maler med ett-klikk distribuering |
| 🔗 [**Send inn en mal**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mal til fellesskapet |
| 🔗 [**GitHub-depot**](https://github.com/Azure/awesome-azd) | Star og utforsk koden |

### Populære AI-maler fra Awesome AZD

```bash
# RAG-chat med Microsoft Foundry-modeller + AI-søk
azd init --template azure-search-openai-demo

# Rask AI-chat-applikasjon
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

### Steg 2: Logg inn på Azure

```bash
azd auth login
```

### Steg 3: Distribuer din første app

```bash
# Initialiser fra en mal
azd init --template todo-nodejs-mongo

# Distribuer til Azure (oppretter alt!)
azd up
```

**🎉 Ferdig!** Appen din er nå live på Azure.

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
| **Kjenner Azure, ny på AZD** | [Kapittel 1: Grunnlag](#-chapter-1-foundation--quick-start) |
| **Vil distribuere AI-apper** | [Kapittel 2: AI-først utvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vil ha praktisk øving** | [🎓 Interaktivt verksted](workshop/README.md) - 3-4 timers veiledet lab |
| **Trenger produksjonsmønstre** | [Kapittel 8: Produksjon og Enterprise](#-chapter-8-production--enterprise-patterns) |

### Rask oppsett

1. **Fork dette depotet**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjelp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrekker du å klone lokalt?**

> Dette depotet inkluderer 50+ språköversettelser som øker nedlastningsstørrelsen betydelig. For å klone uten oversettelser, bruk spars checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette gir deg alt du trenger for å fullføre kurset med mye raskere nedlasting.


## Kursoversikt

Master Azure Developer CLI (azd) gjennom strukturerte kapitler designet for progressiv læring. **Spesiell fokus på AI-applikasjonsdistribusjon med Microsoft Foundry-integrasjon.**

### Hvorfor dette kurset er essensielt for moderne utviklere

Basert på innsikter fra Microsoft Foundry Discord-fellesskapet, ønsker **45 % av utviklerne å bruke AZD for AI-arbeidsmengder**, men møter utfordringer med:
- Komplekse AI-arkitekturer med flere tjenester
- Beste praksis for produksjonsdistribusjon av AI  
- Integrasjon og konfigurasjon av Azure AI-tjenester
- Kostnadsoptimalisering for AI-arbeidsmengder
- Feilsøking av AI-spesifikke distribusjonsproblemer

### Læringsmål

Ved å fullføre dette strukturerte kurset vil du:
- **Mestre AZD-grunnleggende**: Kjernebegreper, installasjon og konfigurasjon
- **Distribuere AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester
- **Implementere infrastruktur som kode**: Administrere Azure-ressurser med Bicep-maler
- **Feilsøke distribusjoner**: Løse vanlige problemer og feilsøke feil
- **Optimalisere for produksjon**: Sikkerhet, skalering, overvåking og kostnadsstyring
- **Bygge multi-agent-løsninger**: Distribuere komplekse AI-arkitekturer

## 🗺️ Kurskart: Rask navigering per kapittel

Hvert kapittel har en dedikert README med læringsmål, raske starter og øvelser:

| Kapittel | Emne | Leksjoner | Varighet | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Grunnlag](docs/chapter-01-foundation/README.md)** | Kom i gang | [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) &#124; [Installasjon](docs/chapter-01-foundation/installation.md) &#124; [Første prosjekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI-utvikling](docs/chapter-02-ai-development/README.md)** | AI-Første Apper | [Foundry Integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modelldeployering](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 t | ⭐⭐ |
| **[Ch 3: Konfigurasjon](docs/chapter-03-configuration/README.md)** | Auth & Sikkerhet | [Konfigurasjon](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Sikkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Deployering | [Deployeringsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 t | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Løsninger | [Detaljhandelsscenario](examples/retail-scenario.md) &#124; [Koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployering](docs/chapter-06-pre-deployment/README.md)** | Planlegging & Validering | [Preflight Sjekker](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Valg](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 t | ⭐⭐ |
| **[Ch 7: Feilsøking](docs/chapter-07-troubleshooting/README.md)** | Debug & Fiks | [Vanlige Problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 t | ⭐⭐ |
| **[Ch 8: Produksjon](docs/chapter-08-production/README.md)** | Enterprise Mønstre | [Produksjonspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk Lab | [Introduksjon](workshop/docs/instructions/0-Introduction.md) &#124; [Valg](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbryting](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Oppsummering](workshop/docs/instructions/7-Wrap-up.md) | 3-4 t | ⭐⭐ |

**Total kursvarighet:** ~10-14 timer | **Ferdighetsutvikling:** Nybegynner → Produksjonsklar

---

## 📚 Læringskapitler

*Velg din læringsvei basert på erfaringsnivå og mål*

### 🚀 Kapittel 1: Grunnlag & Rask Start
**Forutsetninger**: Azure-abonnement, grunnleggende kommandolinjekunnskap  
**Varighet**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hva du vil lære
- Forstå Azure Developer CLI grunnprinsipper
- Installere AZD på din plattform
- Din første vellykkede deployering

#### Læringsressurser
- **🎯 Start her**: [Hva er Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) - Kjernebegreper og terminologi
- **⚙️ Oppsett**: [Installasjon & Oppsett](docs/chapter-01-foundation/installation.md) - Plattformspesifikke guider
- **🛠️ Praktisk**: [Ditt Første Prosjekt](docs/chapter-01-foundation/first-project.md) - Trinn-for-trinn veiledning
- **📋 Rask Referanse**: [Kommandooversikt](resources/cheat-sheet.md)

#### Praktiske Øvelser
```bash
# Rask installasjonssjekk
azd version

# Distribuer din første applikasjon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapittelresultat**: Vellykket deployering av enkel webapplikasjon til Azure ved bruk av AZD

**✅ Suksessvalidering:**
```bash
# Etter å ha fullført kapittel 1, bør du kunne:
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                  # Distribuerer til Azure
azd show                # Viser URL til kjørende app
# Applikasjonen åpnes i nettleser og fungerer
azd down --force --purge  # Rydder opp ressurser
```

**📊 Tidsbruk:** 30-45 minutter  
**📈 Ferdighetsnivå etter:** Kan deployere grunnleggende apper selvstendig

---

### 🤖 Kapittel 2: AI-Først Utvikling (Anbefalt for AI-utviklere)
**Forutsetninger**: Fullført Kapittel 1  
**Varighet**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hva du vil lære
- Microsoft Foundry integrasjon med AZD
- Deployering av AI-drevne applikasjoner
- Forstå AI tjenestekonfigurasjoner

#### Læringsressurser
- **🎯 Start her**: [Microsoft Foundry Integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agenter**: [AI Agentguide](docs/chapter-02-ai-development/agents.md) - Deploy intelligente agenter med AZD
- **📖 Mønstre**: [AI Modelldployering](docs/chapter-02-ai-development/ai-model-deployment.md) - Deploy og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsninger AZD-klare
- **🎥 Interaktiv Guide**: [Workshopmaterialer](workshop/README.md) - Nettleserbasert læring med MkDocs * DevContainer miljø
- **📋 Maler**: [Microsoft Foundry Maler](#workshop-ressurser)
- **📝 Eksempler**: [AZD Deployeringseksempler](examples/README.md)

#### Praktiske Øvelser
```bash
# Distribuer din første AI-applikasjon
azd init --template azure-search-openai-demo
azd up

# Prøv flere AI-maler
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapittelresultat**: Deploy og konfigurer en AI-drevet chatteapplikasjon med RAG-funksjoner

**✅ Suksessvalidering:**
```bash
# Etter kapittel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrensesnittet
# Stille spørsmål og få AI-drevne svar med kilder
# Verifisere at søkeintegrasjon fungerer
azd monitor  # Sjekke at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsbruk:** 1-2 timer  
**📈 Ferdighetsnivå etter:** Kan deployere og konfigurere produksjonsklare AI-applikasjoner  
**💰 Kostnadsbevissthet:** Forstå utviklingskostnader på $80-150/måned, produksjonskostnader på $300-3500/måned

#### 💰 Kostnadshensyn for AI-Deployeringer

**Utviklingsmiljø (Estimert $80-150/måned):**
- Microsoft Foundry-modeller (Betal per bruk): $0-50/måned (basert på token-bruk)
- AI Search (Basisnivå): $75/måned
- Container Apps (Konsum): $0-20/måned
- Lagring (Standard): $1-5/måned

**Produksjonsmiljø (Estimert $300-3,500+/måned):**
- Microsoft Foundry-modeller (PTU for jevn ytelse): $3,000+/måned ELLER Betal per bruk med høyt volum
- AI Search (Standardnivå): $250/måned
- Container Apps (Dedikert): $50-100/måned
- Application Insights: $5-50/måned
- Lagring (Premium): $10-50/måned

**💡 Kostnadsoptimaliseringstips:**
- Bruk **Gratisnivå** Microsoft Foundry-modeller for læring (Azure OpenAI 50 000 tokens/måned inkludert)
- Kjør `azd down` for å frigi ressurser når du ikke aktivt utvikler
- Start med forbruksbasert fakturering, oppgrader til PTU kun for produksjon
- Bruk `azd provision --preview` for å estimere kostnader før deployering
- Aktiver autoskalering: betal kun for faktisk bruk

**Kostnadsovervåking:**
```bash
# Sjekk estimerte månedlige kostnader
azd provision --preview

# Overvåk faktiske kostnader i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapittel 3: Konfigurasjon & Autentisering
**Forutsetninger**: Fullført Kapittel 1  
**Varighet**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hva du vil lære
- Miljøkonfigurasjon og -håndtering
- Autentisering og sikkerhets beste praksis
- Ressursnavngivning og organisering

#### Læringsressurser
- **📖 Konfigurasjon**: [Konfigurasjonsguide](docs/chapter-03-configuration/configuration.md) - Miljøoppsett
- **🔐 Sikkerhet**: [Autentiseringsmønstre og administrert identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmønstre
- **📝 Eksempler**: [Databaseapp-eksempel](examples/database-app/README.md) - AZD Databaseeksempler

#### Praktiske Øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Sett opp autentisering med administrert identitet
- Implementer miljøspesifikk konfigurasjon

**💡 Kapittelresultat**: Håndter flere miljøer med riktig autentisering og sikkerhet

---

### 🏗️ Kapittel 4: Infrastruktur som kode & Deployering
**Forutsetninger**: Fullført Kapitler 1-3  
**Varighet**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Hva du vil lære
- Avanserte deployeringsmønstre
- Infrastruktur som kode med Bicep
- Ressursprovisjoneringsstrategier

#### Læringsressurser
- **📖 Deployering**: [Deployeringsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Fullstendige arbeidsflyter
- **🏗️ Provisjonering**: [Ressursprovisjonering](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursadministrasjon
- **📝 Eksempler**: [Container App-eksempel](../../examples/container-app) - Containerbaserte deployeringer

#### Praktiske Øvelser
- Lag egne Bicep-maler
- Deployere multi-tjeneste applikasjoner
- Implementere blå-grønn deployeringsstrategi

**💡 Kapittelresultat**: Deployere komplekse multi-tjeneste applikasjoner med egendefinerte infrastrukturløsninger

---

### 🎯 Kapittel 5: Multi-Agent AI Løsninger (Avansert)
**Forutsetninger**: Fullført Kapitler 1-2  
**Varighet**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hva du vil lære
- Multi-agent arkitekturmønstre
- Agentorkestrering og koordinering
- Produksjonsklare AI-deployeringer

#### Læringsressurser
- **🤖 Fremhevet prosjekt**: [Detaljhandel Multi-Agent Løsning](examples/retail-scenario.md) - Fullstendig implementering
- **🛠️ ARM-maler**: [ARM-malpakke](../../examples/retail-multiagent-arm-template) - En-klikks deployering
- **📖 Arkitektur**: [Multi-agent koordinasjonsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske Øvelser
```bash
# Distribuer den komplette detaljhandels multi-agent løsningen
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforsk agentkonfigurasjoner
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapittelresultat**: Deployere og administrere produksjonsklar multi-agent AI-løsning med kunde- og lageragenter

---

### 🔍 Kapittel 6: Pre-Deployering Validering & Planlegging
**Forutsetninger**: Fullført Kapittel 4  
**Varighet**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hva du vil lære
- Kapasitetsplanlegging og ressursvalidering
- SKU-valgstrategier
- Preflight-sjekker og automatisering

#### Læringsressurser
- **📊 Planlegging**: [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursvalidering
- **💰 Valg**: [SKU Valg](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektive valg
- **✅ Validering**: [Preflight Sjekker](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserte skript

#### Praktiske Øvelser
- Kjør kapasitetsvalideringsskript
- Optimaliser SKU-valg for kostnad
- Implementer automatiserte predeployering-sjekker

**💡 Kapittelresultat**: Validere og optimalisere deployeringer før utførelse

---

### 🚨 Kapittel 7: Feilsøking & Debugging
**Forutsetninger**: Fullført et deployeringkapittel  
**Varighet**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐

#### Hva du vil lære
- Systematisk feilsøkingsmetodikk
- Vanlige problemer og løsninger
- AI-spesifikk feilsøking

#### Læringsressurser
- **🔧 Vanlige Problemer**: [Vanlige Problemer](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging-veiledning](docs/chapter-07-troubleshooting/debugging.md) - Trinn-for-trinn strategier
- **🤖 AI Problemer**: [AI-Spesifikk Feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemer med AI-tjenester

#### Praktiske Øvelser
- Diagnostiser deployeringsfeil
- Løs autentiseringsproblemer
- Feilsøk AI-tjenestetilkobling

**💡 Kapittelresultat**: Selvstendig diagnostisere og løse vanlige deployeringsproblemer

---

### 🏢 Kapittel 8: Produksjon & Enterprise Mønstre
**Forutsetninger**: Fullført Kapitler 1-4  
**Varighet**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hva du vil lære
- Strategier for produksjonsdeployering
- Enterprise sikkerhetsmønstre
- Overvåking og kostnadsoptimalisering

#### Læringsressurser
- **🏭 Produksjon**: [Produksjon AI Beste Praksis](docs/chapter-08-production/production-ai-practices.md) - Enterprise-mønstre
- **📝 Eksempler**: [Mikrotjenester Eksempel](../../examples/microservices) - Kompleks arkitektur
- **📊 Overvåking**: [Application Insights integrasjon](docs/chapter-06-pre-deployment/application-insights.md) - Overvåking

#### Praktiske Øvelser
- Implementer enterprise sikkerhetsmønstre
- Sett opp omfattende overvåking
- Distribuer til produksjon med riktig styring

**💡 Kapittelresultat**: Distribuer enterprise-klare applikasjoner med full produksjonskapabilitet

---

## 🎓 Workshop Oversikt: Praktisk Læringsopplevelse

> **⚠️ WORKSHOP STATUS: Aktiv Utvikling**  
> Workshop-materialene er i ferd med å bli utviklet og forbedret. Kjerne-moduler er funksjonelle, men noen avanserte seksjoner er ufullstendige. Vi jobber aktivt for å fullføre alt innhold. [Følg fremdrift →](workshop/README.md)

### Interaktive Workshop-Materialer
**Omfattende praktisk læring med nettleserbaserte verktøy og veiledede øvelser**

Våre workshop-materialer gir en strukturert, interaktiv læringsopplevelse som utfyller kapittelbasert pensum over. Workshopen er designet for både selvstyrt læring og instruktør-ledede økter.

#### 🛠️ Workshop-funksjoner
- **Nettleserbasert grensesnitt**: Fullverdig MkDocs-basert workshop med søk, kopiering og tema-funksjoner
- **GitHub Codespaces-integrasjon**: Ett-klikk oppsett av utviklingsmiljø
- **Strukturert læringssti**: 8 modulbaserte veiledede øvelser (3-4 timer totalt)
- **Progressiv metodikk**: Introduksjon → Utvalg → Validering → De- konstruksjon → Konfigurasjon → Tilpassing → Nedrigging → Oppsummering
- **Interaktiv DevContainer-miljø**: Forhåndskonfigurerte verktøy og avhengigheter

#### 📚 Workshop Modulstruktur
Workshopen følger en **8-modulers progressiv metodikk** som tar deg fra utforskning til distribusjonsmestring:

| Modul | Tema | Hva Du Vil Gjøre | Varighet |
|--------|-------|------------------|----------|
| **0. Introduksjon** | Workshop Oversikt | Forstå læringsmål, forutsetninger og workshopstruktur | 15 min |
| **1. Utvalg** | Malutforskning | Utforsk AZD-maler og velg riktig AI-mal for ditt scenario | 20 min |
| **2. Validering** | Distribuer & Verifiser | Distribuer malen med `azd up` og bekreft at infrastrukturen fungerer | 30 min |
| **3. De-konstruksjon** | Forstå Struktur | Bruk GitHub Copilot for å utforske malens arkitektur, Bicep-filer og kodeorganisering | 30 min |
| **4. Konfigurasjon** | azure.yaml Dypdykk | Mestre `azure.yaml` konfigurasjon, livssyklus-hooks og miljøvariabler | 30 min |
| **5. Tilpassing** | Gjør Det Ditt | Aktiver AI Search, sporing, evaluering, og tilpass for ditt scenario | 45 min |
| **6. Nedrigging** | Rydd Opp | Trygt fjern ressurser med `azd down --purge` | 15 min |
| **7. Oppsummering** | Neste Steg | Gå gjennom prestasjoner, nøkkelkonsepter og fortsett læringsreisen | 15 min |

**Workshop Flyt:**  
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```
  
#### 🚀 Komme i Gang med Workshopen  
```bash
# Valg 1: GitHub Codespaces (Anbefalt)
# Klikk "Code" → "Create codespace on main" i depotet

# Valg 2: Lokal utvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg oppsettsinstruksjonene i workshop/README.md
```
  
#### 🎯 Workshop Læringsutbytte  
Ved å fullføre workshopen, vil deltakerne:  
- **Distribuere AI-applikasjoner i produksjon**: Bruk AZD med Microsoft Foundry-tjenester  
- **Mestre Multi-Agent Arkitekturer**: Implementere koordinerte AI-agent-løsninger  
- **Implementere Sikkerhets Beste Praksis**: Konfigurer autentisering og tilgangskontroll  
- **Optimalisere for Skala**: Design kostnadseffektive, ytelsesoptimaliserte distribusjoner  
- **Feilsøke Distribusjoner**: Løse vanlige problemer på egen hånd

#### 📖 Workshop Ressurser
- **🎥 Interaktiv Guide**: [Workshop Materialer](workshop/README.md) - Nettleserbasert læringsmiljø  
- **📋 Modul-for-modul Instruksjoner**:  
  - [0. Introduksjon](workshop/docs/instructions/0-Introduction.md) - Workshop oversikt og mål  
  - [1. Utvalg](workshop/docs/instructions/1-Select-AI-Template.md) - Finn og velg AI-maler  
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuer og verifiser maler  
  - [3. De-konstruksjon](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforsk malarkitektur  
  - [4. Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml  
  - [5. Tilpassing](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpass for ditt scenario  
  - [6. Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rydd opp ressurser  
  - [7. Oppsummering](workshop/docs/instructions/7-Wrap-up.md) - Gjennomgang og neste steg  
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserte øvelser  
- **💡 Rask Start**: [Workshop Oppsettsguide](workshop/README.md#quick-start) - Miljøkonfigurasjon  

**Perfekt for**: Bedriftstrening, universitetskurs, selvstudier, og utviklerbootcamps.

---

## 📖 Dypdykk: AZD Kapabiliteter

Utover grunnleggende, tilbyr AZD kraftige funksjoner for produksjonsdistribusjoner:

- **Malbaserte distribusjoner** - Bruk forhåndsbygde maler for vanlige applikasjonsmønstre  
- **Infrastruktur som kode** - Administrer Azure-ressurser med Bicep eller Terraform  
- **Integrerte arbeidsflyter** - Sømfritt provisjonering, distribusjon og overvåking av applikasjoner  
- **Utviklervennlig** - Optimalisert for utviklerproduktivitet og brukeropplevelse

### **AZD + Microsoft Foundry: Perfekt for AI Distribusjoner**

**Hvorfor AZD for AI-løsninger?** AZD adresserer de største utfordringene AI-utviklere møter:

- **AI-klare maler** - Forhåndskonfigurerte maler for Microsoft Foundry-modeller, Cognitive Services, og ML-arbeidsmengder  
- **Sikre AI-Distribusjoner** - Innebygde sikkerhetsmønstre for AI-tjenester, API-nøkler, og modellendepunkter  
- **Produksjons AI-Mønstre** - Beste praksis for skalerbare, kostnadseffektive AI-applikasjonsdistribusjoner  
- **End-to-End AI-arbeidsflyter** - Fra modellutvikling til produksjonsdistribusjon med riktig overvåking  
- **Kostnadsoptimalisering** - Smarte ressursallokeringer og skaleringsstrategier for AI-arbeidsmengder  
- **Microsoft Foundry Integrasjon** - Sømløs tilkobling til Microsoft Foundry modellkatalog og endepunkter

---

## 🎯 Maler & Eksempelsamling

### Fremhevet: Microsoft Foundry Maler  
**Start her hvis du distribuerer AI-applikasjoner!**

> **Merk:** Disse malene demonstrerer ulike AI-mønstre. Noen er eksterne Azure Samples, andre lokale implementeringer.

| Mal | Kapittel | Kompleksitet | Tjenester | Type |
|----------|---------|------------|----------|------|
| [**Kom i gang med AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom i gang med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapittel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Raskstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Fremhevet: Komplett Læringsscenario  
**Produksjonsklare applikasjonsmaler knyttet til læringskapitler**

| Mal | Læringskapittel | Kompleksitet | Viktig Læring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | Grunnleggende AI distribusjonsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapittel 4 | ⭐⭐ | Dokumentintelligens integrasjon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | Agent-rammeverk og funksjonskalling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐ | Enterprise AI orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med kunde- og lageragenter |

### Læring etter Eksempelslag

> **📌 Lokale vs. Eksterne Eksempler:**  
> **Lokale Eksempler** (i dette repositoriet) = Klare til bruk umiddelbart  
> **Eksterne Eksempler** (Azure Samples) = Klon fra tilknyttede repositorier

#### Lokale Eksempler (Klar til bruk)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fullstendig produksjonsklar implementering med ARM-maler  
  - Multi-agent arkitektur (Kunde + Lager-agenter)  
  - Omfattende overvåking og evaluering  
  - Ett-klikk distribusjon via ARM-mal

#### Lokale Eksempler - Container Applikasjoner (Kapittel 2-5)  
**Omfattende containerdistribusjonseksempler i dette repositoriet:**  
- [**Container App Eksempler**](examples/container-app/README.md) - Komplett guide til containerdistribusjoner  
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Grunnleggende REST API med skalertil-null  
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produksjonsklar fler-tjeneste distribusjon  
  - Rask start, produksjon og avanserte distribusjonsmønstre  
  - Overvåking, sikkerhet og kostnadsoptimaliseringsveiledning

#### Eksterne Eksempler - Enkle Applikasjoner (Kapittel 1-2)  
**Klon disse Azure Samples-repositoriene for å komme i gang:**  
- [Enkel Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grunnleggende distribusjonsmønstre  
- [Statisk Nettsted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribusjon av statisk innhold  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API distribusjon

#### Eksterne Eksempler - Database Integrasjon (Kapittel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databasekoblingsmønstre  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløse dataarbeidsflyter

#### Eksterne Eksempler - Avanserte Mønstre (Kapittel 4-8)  
- [Java Mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Fler-tjenestearkitektur  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrunnsprosessering  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produksjonsklare ML-mønstre

### Eksterne Mal-samlinger  
- [**Offisiell AZD Mallgalleri**](https://azure.github.io/awesome-azd/) - Kuratert samling av offisielle og community-maler  
- [**Azure Developer CLI Maler**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn dokumentasjon for maler  
- [**Eksempelkatalog**](examples/README.md) - Lokale læringseksempler med detaljerte forklaringer

---

## 📚 Læringsressurser & Referanser

### Rask Referanse  
- [**Kommando Hurtigguide**](resources/cheat-sheet.md) - Essensielle azd-kommandoer organisert etter kapittel  
- [**Ordliste**](resources/glossary.md) - Azure og azd terminologi  
- [**FAQ**](resources/faq.md) - Vanlige spørsmål organisert etter læringskapittel  
- [**Studieguide**](resources/study-guide.md) - Omfattende praksisøvelser

### Praktiske Workshops  
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør dine AI-løsninger AZD-distribuerbare (2-3 timer)  
- [**Interaktiv Workshop**](workshop/README.md) - 8-modulers veiledede øvelser med MkDocs og GitHub Codespaces  
  - Følger: Introduksjon → Utvalg → Validering → De-konstruksjon → Konfigurasjon → Tilpassing → Nedrigging → Oppsummering

### Eksterne Læringsressurser
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitektur Senter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pris Kalkulator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Ferdigheter for Din Editor
- [**Microsoft Azure Ferdigheter på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åpne agentferdigheter for Azure AI, Foundry, distribusjon, diagnostikk, kostnadsoptimalisering og mer. Installer dem i GitHub Copilot, Cursor, Claude Code, eller hvilken som helst støttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rask Feilsøkingsguide

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

# Verifiser installasjon
azd version
```
</details>

<details>
<summary><strong>❌ "Ingen abonnement funnet" eller "Abonnement ikke satt"</strong></summary>

```bash
# List tilgjengelige abonnementer
az account list --output table

# Sett standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Sett for AZD-miljø
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiser
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" eller "Quota overskredet"</strong></summary>

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
<summary><strong>❌ "azd up" mislykkes halvveis</strong></summary>

```bash
# Alternativ 1: Rengjør og prøv igjen
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
# Re-autentisere
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

# Prøv igjen med nytt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Maldistribusjon tar for lang tid</strong></summary>

**Normal ventetid:**
- Enkel nettapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikasjoner: 15-25 minutter (OpenAI-provisjonering er treg)

```bash
# Sjekk fremdrift
azd show

# Hvis fastlåst >30 minutter, sjekk Azure-portalen:
azd monitor
# Se etter mislykkede distribusjoner
```
</details>

<details>
<summary><strong>❌ "Tillatelse nektet" eller "Forbudt"</strong></summary>

```bash
# Sjekk din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du trenger minst rollen "Bidragsyter"
# Be din Azure-administrator om å gi:
# - Bidragsyter (for ressurser)
# - Brukertilgangsadministrator (for rolleoppgaver)
```
</details>

<details>
<summary><strong>❌ Klarer ikke finne distribuert applikasjons-URL</strong></summary>

```bash
# Vis alle tjenestepunkter
azd show

# Eller åpne Azure-portalen
azd monitor

# Sjekk spesifikk tjeneste
azd env get-values
# Se etter *_URL variabler
```
</details>

### 📚 Fullstendige Feilsøkingsressurser

- **Vanlige Problemer Guide:** [Detaljerte Løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Spesifikke Problemer:** [AI Feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Feilsøkingsguide:** [Trinn-for-trinn Feilsøking](docs/chapter-07-troubleshooting/debugging.md)
- **Få Hjelp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurs Fullføring & Sertifisering

### Fremdriftssporing
Spor læringsfremgangen din gjennom hvert kapittel:

- [ ] **Kapittel 1**: Grunnlag & Rask Start ✅
- [ ] **Kapittel 2**: AI-Først Utvikling ✅  
- [ ] **Kapittel 3**: Konfigurasjon & Autentisering ✅
- [ ] **Kapittel 4**: Infrastruktur som Kode & Distribusjon ✅
- [ ] **Kapittel 5**: Multi-Agent AI Løsninger ✅
- [ ] **Kapittel 6**: Forhåndsvalidering & Planlegging ✅
- [ ] **Kapittel 7**: Feilsøking & Debugging ✅
- [ ] **Kapittel 8**: Produksjon & Enterprise Mønstre ✅

### Læringsverifisering
Etter å ha fullført hvert kapittel, verifiser kunnskapen din ved å:
1. **Praktisk Øvelse**: Fullfør kapitlets praktiske distribusjon
2. **Kunnskapssjekk**: Gå gjennom FAQ-seksjonen for ditt kapittel
3. **Fellesskapsdiskusjon**: Del din erfaring i Azure Discord
4. **Neste Kapittel**: Gå videre til neste kompleksitetsnivå

### Fordeler ved Kurs Fullføring
Ved fullføring av alle kapitlene vil du ha:
- **Produksjonserfaring**: Distribuert ekte AI-applikasjoner til Azure
- **Profesjonelle Ferdigheter**: Enterprise-klare distribusjonskapasiteter  
- **Fellesskapsgjenkjennelse**: Aktiv medlem av Azure utviklerfellesskap
- **Karriereutvikling**: Etterspurt AZD og AI distribusjonsekspertise

---

## 🤝 Fellesskap & Støtte

### Få Hjelp & Støtte
- **Tekniske Problemer**: [Rapporter feil og foreslå funksjoner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørsmål**: [Microsoft Azure Discord Fellesskap](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Spesifikk Hjelp**: Bli med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasjon**: [Offisiell Azure Developer CLI dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fellesskapsinnsikt fra Microsoft Foundry Discord

**Siste meningsmålingresultater fra #Azure-kanalen:**
- **45 %** av utviklerne ønsker å bruke AZD for AI arbeidsmengder
- **Topp utfordringer**: Multi-tjeneste distribusjoner, legitimasjonshåndtering, produksjonsklarhet  
- **Mest etterspurt**: AI-spesifikke maler, feilsøkingsguider, beste praksiser

**Bli med i fellesskapet vårt for å:**
- Dele dine AZD + AI erfaringer og få hjelp
- Få tilgang til tidlige forhåndsvisninger av nye AI-maler
- Bidra til AI distribusjons beste praksis
- Påvirke fremtidig AI + AZD funksjonsutvikling

### Bidra til Kurset
Vi ønsker bidrag velkommen! Vennligst les vår [Bevisstgjøringsguide](CONTRIBUTING.md) for detaljer om:
- **Innholdsforbedringer**: Forbedre eksisterende kapitler og eksempler
- **Nye Eksempler**: Legg til virkelige scenarier og maler  
- **Oversettelse**: Hjelp til å vedlikeholde flerspråklig støtte
- **Feilrapporter**: Forbedre nøyaktighet og klarhet
- **Fellesskapsstandarder**: Følg våre inkluderende retningslinjer for fellesskapet

---

## 📄 Kursinformasjon

### Lisens
Dette prosjektet er lisensiert under MIT-lisensen - se [LICENSE](../../LICENSE)-filen for detaljer.

### Relaterte Microsoft Læringsressurser

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
 
### Generativ AI Serie
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

**🚀 Klar til å starte læring?**

**Nybegynnere**: Start med [Kapittel 1: Grunnlag og kjapp start](#-chapter-1-foundation--quick-start)  
**AI-utviklere**: Hopp til [Kapittel 2: AI-først utvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne utviklere**: Begynn med [Kapittel 3: Konfigurasjon og autentisering](#️-chapter-3-configuration--authentication)

**Neste steg**: [Begynn Kapittel 1 - AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på morsmålet bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->