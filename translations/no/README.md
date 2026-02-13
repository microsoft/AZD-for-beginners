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
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](./README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Foretrekker du å klone lokalt?**
>
> Dette depotet inkluderer over 50 språkoversettelser som betydelig øker nedlastingsstørrelsen. For å klone uten oversettelser, bruk sparse checkout:
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

## 🚀 Hva er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et utviklervennlig kommandolinjeverktøy som gjør det enkelt å distribuere applikasjoner til Azure. I stedet for å manuelt opprette og koble dusinvis av Azure-ressurser, kan du distribuere hele applikasjoner med en enkelt kommando.

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

**Det er det!** Ingen klikk i Azure-portalen, ingen kompliserte ARM-maler du må lære først, ingen manuell konfigurasjon - bare fungerende applikasjoner på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hva er forskjellen?

Dette er det vanligste spørsmålet nybegynnere stiller. Her er det enkle svaret:

| Funksjon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrere individuelle Azure-ressurser | Distribuere komplette applikasjoner |
| **Tankesett** | Infrastruktur-fokusert | Applikasjons-fokusert |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Må kunne Azure-tjenester | Bare kjenn din app |
| **Best For** | DevOps, Infrastruktur | Utviklere, prototypebygging |

### Enkel analogi

- **Azure CLI** er som å ha alle verktøyene for å bygge et hus - hammere, sager, spiker. Du kan bygge hva som helst, men du må kunne konstruksjon.
- **Azure Developer CLI** er som å leie en entreprenør - du beskriver hva du vil ha, og de tar seg av byggingen.

### Når bør man bruke hva

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

Ikke start fra bunnen! **Awesome AZD** er det fellesskapsbaserte samlingen av maler klare til distribusjon:

| Ressurs | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Bla gjennom 200+ maler med ett-klikk distribusjon |
| 🔗 [**Send inn en mal**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mal til fellesskapet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Sett stjerne og utforsk koden |

### Populære AI-maler fra Awesome AZD

```bash
# RAG-chat med Azure OpenAI + AI Search
azd init --template azure-search-openai-demo

# Rask AI-chatapplikasjon
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry Agents
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

**🎉 Det er det!** Appen din er nå live på Azure.

### Rydd opp (Ikke glem!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hvordan bruke dette kurset

Dette kurset er designet for **gradvis læring** - start der du føler deg komfortabel og jobb deg oppover:

| Din erfaring | Start her |
|-----------------|------------|
| **Helt ny med Azure** | [Kapittel 1: Grunnlag](../..) |
| **Kan Azure, ny med AZD** | [Kapittel 1: Grunnlag](../..) |
| **Vil distribuere AI-apper** | [Kapittel 2: AI-først utvikling](../..) |
| **Vil ha praktisk øvelse** | [🎓 Interaktivt verksted](workshop/README.md) - 3-4 timers guidet lab |
| **Trenger produksjonsmønstre** | [Kapittel 8: Produksjon & Enterprise](../..) |

### Rask oppsett

1. **Fork dette depotet**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjelp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrekker du å klone lokalt?**

> Dette depotet inkluderer over 50 språkoversettelser som betydelig øker nedlastingsstørrelsen. For å klone uten oversettelser, bruk sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette gir deg alt du trenger for å fullføre kurset med en mye raskere nedlasting.


## Kursoversikt

Mestre Azure Developer CLI (azd) gjennom strukturerte kapitler designet for progressiv læring. **Spesiell fokus på AI-applikasjonsdistribusjon med Microsoft Foundry-integrasjon.**

### Hvorfor dette kurset er essensielt for moderne utviklere

Basert på innsikt fra Microsoft Foundry Discord-fellesskapet, ønsker **45 % av utviklerne å bruke AZD for AI-arbeidsmengder** men møter utfordringer med:
- Komplekse multi-tjeneste AI-arkitekturer
- Beste praksis for AI-produksjonsdistribusjon  
- Integrering og konfigurering av Azure AI-tjenester
- Kostnadsoptimalisering for AI-arbeidsmengder
- Feilsøking av AI-spesifikke distribusjonsproblemer

### Læringsmål

Ved å fullføre dette strukturerte kurset vil du:
- **Mestre AZD Grunnleggende**: Kjernebegreper, installasjon og konfigurasjon
- **Distribuere AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester
- **Implementere Infrastruktur som kode**: Administrere Azure-ressurser med Bicep-maler
- **Feilsøke distribusjoner**: Løse vanlige problemer og debugge
- **Optimalisere for produksjon**: Sikkerhet, skalering, overvåking og kostnadsstyring
- **Bygge multi-agent løsninger**: Distribuere komplekse AI-arkitekturer

## 🗺️ Kurskart: Rask navigasjon etter kapittel

Hvert kapittel har egen README med læringsmål, raske starter og øvelser:

| Kapittel | Tema | Leksjoner | Varighet | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Grunnlag](docs/chapter-01-foundation/README.md)** | Kom i gang | [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) &#124; [Installasjon](docs/chapter-01-foundation/installation.md) &#124; [Første prosjekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utvikling](docs/chapter-02-ai-development/README.md)** | AI-først apper | [Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modellutplassering](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 t | ⭐⭐ |
| **[Kap 3: Konfigurasjon](docs/chapter-03-configuration/README.md)** | Autentisering & sikkerhet | [Konfigurasjon](docs/chapter-03-configuration/configuration.md) &#124; [Autentisering & sikkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Distribusjon | [Distribusjonsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 t | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI-agentløsninger | [Retail Scenario](examples/retail-scenario.md) &#124; [Koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[Kap 6: Forhåndsdistribusjon](docs/chapter-06-pre-deployment/README.md)** | Planlegging & Validering | [Forhåndssjekk](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 t | ⭐⭐ |
| **[Kap 7: Feilsøking](docs/chapter-07-troubleshooting/README.md)** | Debugging & Fiks | [Vanlige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 t | ⭐⭐ |
| **[Kap 8: Produksjon](docs/chapter-08-production/README.md)** | Enterprise-mønstre | [Produksjonspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk lab | [Introduksjon](workshop/docs/instructions/0-Introduction.md) &#124; [Valg](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruksjon](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Oppsummering](workshop/docs/instructions/7-Wrap-up.md) | 3-4 t | ⭐⭐ |

**Total kurstid:** ~10-14 timer | **Ferdighetsutvikling:** Nybegynner → Produksjonsklar

---

## 📚 Læringskapitler

*Velg din læringsvei basert på erfaring og mål*

### 🚀 Kapittel 1: Grunnlag og Rask Start
**Forutsetninger**: Azure-abonnement, grunnleggende kommandolinjekunnskap  
**Varighet**: 30-45 minutter  
**Vanskelighetsgrad**: ⭐

#### Hva du vil lære
- Forstå grunnleggende Azure Developer CLI
- Installere AZD på din plattform
- Din første vellykkede distribusjon

#### Læringsressurser
- **🎯 Start her**: [Hva er Azure Developer CLI?](../..)
- **📖 Teori**: [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) - Kjernebegreper og terminologi
- **⚙️ Oppsett**: [Installasjon & Oppsett](docs/chapter-01-foundation/installation.md) - Plattformspesifikke guider
- **🛠️ Praktisk**: [Ditt første prosjekt](docs/chapter-01-foundation/first-project.md) - Steg-for-steg veiledning
- **📋 Raskreferanse**: [Kommandooversikt](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Rask installasjonskontroll
azd version

# Distribuer din første applikasjon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapittelresultat**: Vellykket distribusjon av en enkel webapplikasjon til Azure med AZD

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

**📊 Tidsbruk:** 30-45 minutter  
**📈 Ferdighetsnivå etterpå:** Kan distribuere grunnleggende applikasjoner selvstendig

**✅ Suksessvalidering:**
```bash
# Etter å ha fullført kapittel 1, skal du kunne:
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                  # Distribuerer til Azure
azd show                # Viser kjørende app-URL
# Applikasjonen åpnes i nettleseren og fungerer
azd down --force --purge  # Rydder opp i ressurser
```

**📊 Tidsbruk:** 30-45 minutter  
**📈 Ferdighetsnivå etterpå:** Kan distribuere grunnleggende applikasjoner selvstendig

---

### 🤖 Kapittel 2: AI-Første Utvikling (Anbefalt for AI-utviklere)
**Forutsetninger**: Kapittel 1 fullført  
**Varighet**: 1-2 timer  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære
- Microsoft Foundry-integrasjon med AZD
- Distribusjon av AI-drevne applikasjoner
- Forstå AI-tjenestekonfigurasjoner

#### Læringsressurser
- **🎯 Start her**: [Microsoft Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Distribuer intelligente agenter med AZD
- **📖 Mønstre**: [AI-modell distribusjon](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuer og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsningene dine AZD-klare
- **🎥 Interaktiv guide**: [Workshop-materialer](workshop/README.md) - Nettleserbasert læring med MkDocs * DevContainer-miljø
- **📋 Maler**: [Microsoft Foundry-malene](../..)
- **📝 Eksempler**: [AZD distribusjonseksempler](examples/README.md)

#### Praktiske øvelser
```bash
# Distribuer din første AI-applikasjon
azd init --template azure-search-openai-demo
azd up

# Prøv flere AI-maler
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapittelresultat**: Distribuer og konfigurer en AI-drevet chatteapplikasjon med RAG-funksjoner

**✅ Suksessvalidering:**
```bash
# Etter kapittel 2 skal du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrensesnittet
# Stille spørsmål og få AI-drevne svar med kilder
# Verifisere at søkeintegrasjonen fungerer
azd monitor  # Sjekke at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsbruk:** 1-2 timer  
**📈 Ferdighetsnivå etterpå:** Kan distribuere og konfigurere produksjonsklare AI-applikasjoner  
**💰 Kostnadsbevissthet:** Forstå utviklingskostnader på $80-150/mnd og produksjonskostnader på $300-3500/mnd

#### 💰 Kostnadsvurderinger for AI-distribusjoner

**Utviklingsmiljø (Estimert $80-150/mnd):**
- Azure OpenAI (betal etter bruk): $0-50/mnd (avhengig av tokenbruk)
- AI Search (Grunnleggende nivå): $75/mnd
- Container Apps (Forbruk): $0-20/mnd
- Lagring (Standard): $1-5/mnd

**Produksjonsmiljø (Estimert $300-3500+/mnd):**
- Azure OpenAI (PTU for konsistent ytelse): $3,000+/mnd ELLER Betal etter bruk med høyt volum
- AI Search (Standard nivå): $250/mnd
- Container Apps (Dedikert): $50-100/mnd
- Application Insights: $5-50/mnd
- Lagring (Premium): $10-50/mnd

**💡 Kostnadsoptimaliseringstips:**
- Bruk **Gratisnivå** Azure OpenAI til læring (50 000 tokens/mnd inkludert)
- Kjør `azd down` for å avallokere ressurser når du ikke utvikler aktivt
- Start med forbruksbasert fakturering, oppgrader til PTU kun for produksjon
- Bruk `azd provision --preview` for å estimere kostnader før distribusjon
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
- Miljøkonfigurasjon og administrasjon
- Autentisering og sikkerhets beste praksiser
- Ressursnavngivning og organisering

#### Læringsressurser
- **📖 Konfigurasjon**: [Konfigurasjonsguide](docs/chapter-03-configuration/configuration.md) - Miljøoppsett
- **🔐 Sikkerhet**: [Autentiseringsmønstre og administrert identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmønstre
- **📝 Eksempler**: [Databaseapp-eksempel](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Sett opp administrert identitets-autentisering
- Implementer miljøspesifikke konfigurasjoner

**💡 Kapittelresultat**: Administrer flere miljøer med korrekt autentisering og sikkerhet

---

### 🏗️ Kapittel 4: Infrastruktur som kode & Distribusjon
**Forutsetninger**: Kapitler 1-3 fullført  
**Varighet**: 1-1,5 timer  
**Vanskelighetsgrad**: ⭐⭐⭐

#### Hva du vil lære
- Avanserte distribusjonsmønstre
- Infrastruktur som kode med Bicep
- Ressursprovisjoneringsstrategier

#### Læringsressurser
- **📖 Distribusjon**: [Distribusjonsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Fullstendige arbeidsflyter
- **🏗️ Provisioning**: [Provisionering av ressurser](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursadministrasjon
- **📝 Eksempler**: [Container App-eksempel](../../examples/container-app) - Containeriserte distribusjoner

#### Praktiske øvelser
- Lag tilpassede Bicep-maler
- Distribuer fler-tjeneste applikasjoner
- Implementer blå-grønn distribusjonsstrategi

**💡 Kapittelresultat**: Distribuer komplekse fler-tjeneste applikasjoner ved bruk av tilpassede infrastrukturmaler

---

### 🎯 Kapittel 5: Multi-Agent AI Løsninger (Avansert)
**Forutsetninger**: Kapitler 1-2 fullført  
**Varighet**: 2-3 timer  
**Vanskelighetsgrad**: ⭐⭐⭐⭐

#### Hva du vil lære
- Multi-agent arkitektur-mønstre
- Agentorkestrering og koordinering
- Produksjonsklare AI-distribusjoner

#### Læringsressurser
- **🤖 Fremhevet prosjekt**: [Retail Multi-Agent-løsning](examples/retail-scenario.md) - Komplett implementering
- **🛠️ ARM-maler**: [ARM template-pakke](../../examples/retail-multiagent-arm-template) - Ett-klikk distribusjon
- **📖 Arkitektur**: [Multi-agent koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Distribuer den komplette detaljhandel multi-agent-løsningen
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforsk agentkonfigurasjoner
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapittelresultat**: Distribuer og administrer en produksjonsklar multi-agent AI-løsning med Customer og Inventory agenter

---

### 🔍 Kapittel 6: Forhåndsdistribusjon Validering & Planlegging
**Forutsetninger**: Kapittel 4 fullført  
**Varighet**: 1 time  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære
- Kapasitetsplanlegging og ressursvalidering
- SKU-valgsstrategier
- Forhåndssjekker og automatisering

#### Læringsressurser
- **📊 Planlegging**: [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursvalidering
- **💰 Valg**: [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektive valg
- **✅ Validering**: [Forhåndssjekk](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserte skript

#### Praktiske øvelser
- Kjør valideringsskript for kapasitet
- Optimaliser SKU-valg for kostnad
- Implementer automatiserte forhåndssjekker

**💡 Kapittelresultat**: Valider og optimaliser distribusjoner før utførelse

---

### 🚨 Kapittel 7: Feilsøking & Debugging
**Forutsetninger**: Ethvert distribusjonskapittel fullført  
**Varighet**: 1-1,5 timer  
**Vanskelighetsgrad**: ⭐⭐

#### Hva du vil lære
- Systematiske feilsøkingsmetoder
- Vanlige problemer og løsninger
- AI-spesifikk feilsøking

#### Læringsressurser
- **🔧 Vanlige problemer**: [Vanlige problemer](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging-guide](docs/chapter-07-troubleshooting/debugging.md) - Steg-for-steg strategier
- **🤖 AI-problemer**: [AI-spesifikk feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-tjenesteproblemer

#### Praktiske øvelser
- Diagnostiser distribusjonssvikt
- Løs autentiseringsproblemer
- Debug AI tjenestetilkobling

**💡 Kapittelresultat**: Selvstendig diagnosere og løse vanlige distribusjonsproblemer

---

### 🏢 Kapittel 8: Produksjon & Enterprise Mønstre
**Forutsetninger**: Kapitler 1-4 fullført  
**Varighet**: 2-3 timer  
**Vanskelighetsgrad**: ⭐⭐⭐⭐

#### Hva du vil lære
- Strategier for produksjonsdistribusjon
- Enterprise sikkerhetsmønstre
- Overvåking og kostnadsoptimalisering

#### Læringsressurser
- **🏭 Produksjon**: [Produksjonspraksis for AI](docs/chapter-08-production/production-ai-practices.md) - Enterprise-mønstre
- **📝 Eksempler**: [Mikrotjenester-eksempel](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvåking**: [Application Insights-integrasjon](docs/chapter-06-pre-deployment/application-insights.md) - Overvåking

#### Praktiske øvelser
- Implementer enterprise-sikkerhetsmønstre
- Sett opp omfattende overvåking
- Distribuer til produksjon med korrekt styring

**💡 Kapittelresultat**: Distribuer enterprise-klare applikasjoner med full produksjonskapasitet

---

## 🎓 Workshop Oversikt: Praktisk læringserfaring

> **⚠️ WORKSHOP STATUS: Aktiv utvikling**  

> Verkstedmaterialene er for øyeblikket under utvikling og forbedring. Kjernemodulene fungerer, men noen avanserte seksjoner er ufullstendige. Vi jobber aktivt med å fullføre alt innhold. [Følg fremdriften →](workshop/README.md)

### Interaktive verkstedmaterialer
**Omfattende praktisk læring med nettleserbaserte verktøy og veiledede øvelser**

Våre verkstedmaterialer gir en strukturert, interaktiv læringsopplevelse som utfyller det kapittelbaserte pensumet ovenfor. Verkstedet er designet for både selvstyrt læring og instruktørledede økter.

#### 🛠️ Verkstedsfunksjoner
- **Nettleserbasert grensesnitt**: Fullbyrdet MkDocs-drevet verksted med søk, kopiering og temafunksjoner
- **Integrasjon med GitHub Codespaces**: Én-klikk oppsett av utviklingsmiljø
- **Strukturert læringssti**: 8-modulers veiledede øvelser (3-4 timer totalt)
- **Progressiv metodikk**: Introduksjon → Valg → Validering → Dekonstruksjon → Konfigurasjon → Tilpasning → Nedpakking → Oppsummering
- **Interaktiv DevContainer-miljø**: Forhåndskonfigurerte verktøy og avhengigheter

#### 📚 Verkstedsmodulstruktur
Verkstedet følger en **8-modulers progressiv metodikk** som tar deg fra oppdagelse til ferdighet i distribusjon:

| Modul | Emne | Hva du skal gjøre | Varighet |
|--------|-------|----------------|----------|
| **0. Introduksjon** | Oversikt over verkstedet | Forstå læringsmål, forutsetninger og verkstedstruktur | 15 min |
| **1. Valg** | Malutforskning | Utforsk AZD-maler og velg riktig AI-mal for ditt scenario | 20 min |
| **2. Validering** | Distribuer og verifiser | Distribuer malen med `azd up` og valider at infrastrukturen fungerer | 30 min |
| **3. Dekonstruksjon** | Forstå struktur | Bruk GitHub Copilot til å utforske malens arkitektur, Bicep-filer og kodeorganisering | 30 min |
| **4. Konfigurasjon** | azure.yaml grundig gjennomgang | Mestre `azure.yaml` konfigurasjon, livssyklus-hooks og miljøvariabler | 30 min |
| **5. Tilpasning** | Gjør det ditt | Aktiver AI-søk, sporing, evaluering og tilpass for ditt scenario | 45 min |
| **6. Nedpakking** | Rydd opp | Fjern ressurser trygt med `azd down --purge` | 15 min |
| **7. Oppsummering** | Neste steg | Gå gjennom oppnådde resultater, nøkkelkonsepter og fortsett læringsreisen | 15 min |

**Verkstedflyt:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Komme i gang med verkstedet
```bash
# Alternativ 1: GitHub Codespaces (Anbefalt)
# Klikk på "Code" → "Create codespace on main" i depotet

# Alternativ 2: Lokal utvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg oppsettsinstruksjonene i workshop/README.md
```

#### 🎯 Læringsutbytte fra verkstedet
Ved å fullføre verkstedet vil deltakerne:
- **Distribuere produksjonsklare AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester
- **Mestre multi-agent arkitekturer**: Implementere koordinerte AI-agent løsninger
- **Implementere sikkerhetsbeste praksis**: Konfigurere autentisering og tilgangskontroll
- **Optimalisere for skala**: Designe kostnadseffektive og ytelsesoptimaliserte distribusjoner
- **Feilsøke distribusjoner**: Løse vanlige problemer selvstendig

#### 📖 Verkstedsressurser
- **🎥 Interaktiv veiledning**: [Verkstedmaterialer](workshop/README.md) - Nettleserbasert læringsmiljø
- **📋 Modul-for-modul instruksjoner**:
  - [0. Introduksjon](workshop/docs/instructions/0-Introduction.md) - Verkstedoversikt og mål
  - [1. Valg](workshop/docs/instructions/1-Select-AI-Template.md) - Finn og velg AI-maler
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuer og verifiser maler
  - [3. Dekonstruksjon](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforsk malarkitektur
  - [4. Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpass for ditt scenario
  - [6. Nedpakking](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rydd opp ressurser
  - [7. Oppsummering](workshop/docs/instructions/7-Wrap-up.md) - Gjennomgang og neste steg
- **🛠️ AI-verkstedlab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserte øvelser
- **💡 Rask start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljøkonfigurasjon

**Perfekt for**: Bedriftstrening, universitetskurs, selvstyrt læring og utvikler-bootcamps.

---

## 📖 Grundig gjennomgang: AZD-funksjonalitet

Utover det grunnleggende gir AZD kraftige funksjoner for produksjonsdistribusjoner:

- **Malbaserte distribusjoner** - Bruk ferdiglagde maler for vanlige applikasjonsmønstre
- **Infrastructure as Code** - Administrer Azure-ressurser med Bicep eller Terraform  
- **Integrerte arbeidsflyter** - Sømløs provisjonering, distribusjon og overvåkning av apper
- **Utviklervennlig** - Optimalisert for produktivitet og brukeropplevelse

### **AZD + Microsoft Foundry: Perfekt for AI-distribusjoner**

**Hvorfor AZD for AI-løsninger?** AZD møter de største utfordringene AI-utviklere står overfor:

- **AI-klare maler** - Forhåndskonfigurerte maler for Azure OpenAI, Cognitive Services og ML last
- **Sikre AI-distribusjoner** - Innebygde sikkerhetsmønstre for AI-tjenester, API-nøkler og modellendepunkter  
- **Produksjons-AI-mønstre** - Beste praksis for skalerbare og kostnadseffektive AI-applikasjons-distribusjoner
- **Ende-til-ende AI-arbeidsflyter** - Fra modellutvikling til produksjonsdistribusjon med riktig overvåkning
- **Kostnadsoptimalisering** - Smarte ressursallokeringer og skaleringsstrategier for AI-last
- **Microsoft Foundry-integrasjon** - Sømløs tilkobling til Microsoft Foundry modellkatalog og endepunkter

---

## 🎯 Mal- og eksempelsamling

### Utvalgte: Microsoft Foundry-maler
**Start her hvis du distribuerer AI-applikasjoner!**

> **Merk:** Disse malene viser ulike AI-mønstre. Noen er eksterne Azure Samples, andre er lokale implementasjoner.

| Mal | Kapittel | Kompleksitet | Tjenester | Type |
|----------|---------|------------|----------|------|
| [**Kom i gang med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom i gang med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapittel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalgte: Fullstendige læringsscenarier
**Produksjonsklare applikasjonsmaler koblet til læringskapitler**

| Mal | Læringskapittel | Kompleksitet | Nøkkellæring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | Grunnleggende AI-distribusjonsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapittel 4 | ⭐⭐ | Dokumentintelligens-integrasjon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | Agent-rammeverk og funksjonskall |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐ | Enterprise AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med Kunde- og Lager-agenter |

### Læring etter eksempelkategori

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repoet) = Klare til bruk umiddelbart  
> **Eksterne eksempler** (Azure Samples) = Klon fra tilknyttede repositorier

#### Lokale eksempler (klare til bruk)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fullstendig produksjonsklar implementering med ARM-maler
  - Multi-agent arkitektur (Kunde + Lager-agenter)
  - Omfattende overvåking og evaluering
  - Én-klikk distribusjon via ARM-mal

#### Lokale eksempler - Containerapplikasjoner (Kapittel 2-5)
**Omfattende containerdistribusjonseksempler i dette repoet:**
- [**Container App-eksempler**](examples/container-app/README.md) - Fullstendig guide til containeriserte distribusjoner
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Grunnleggende REST API med scale-to-zero
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produksjonsklar multitesjet distribusjon
  - Rask start, produksjon og avanserte distribusjonsmønstre
  - Veiledning for overvåking, sikkerhet og kostnadsoptimalisering

#### Eksterne eksempler - Enkle applikasjoner (Kapittel 1-2)
**Klon disse Azure Samples repoene for å komme i gang:**
- [Enkel webapp - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grunnleggende distribusjonsmønstre
- [Statisk nettside - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribusjon av statisk innhold
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API distribusjon

#### Eksterne eksempler - Databaseintegrasjon (Kapittel 3-4)  
- [Database-app - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database-tilkoblingsmønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløs databehandling

#### Eksterne eksempler - Avanserte mønstre (Kapittel 4-8)
- [Java-mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multitesjet arkitektur
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrunnsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produksjonsklare ML-mønstre

### Eksterne mal-samlinger
- [**Offisiell AZD-mal-galleri**](https://azure.github.io/awesome-azd/) - Kuratert samling av offisielle og community-maler
- [**Azure Developer CLI-maler**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn maldokumentasjon
- [**Eksempelkatalog**](examples/README.md) - Lokale læringseksempler med detaljerte forklaringer

---

## 📚 Læringsressurser og referanser

### Raskereferanser
- [**Kommando-jukselapp**](resources/cheat-sheet.md) - Viktige azd-kommandoer organisert per kapittel
- [**Ordliste**](resources/glossary.md) - Azure- og azd-terminologi  
- [**FAQ**](resources/faq.md) - Vanlige spørsmål sortert etter læringskapittel
- [**Studieveiledning**](resources/study-guide.md) - Omfattende øvelser

### Praktiske verksted
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsningene dine klar for AZD-distribusjon (2-3 timer)
- [**Interaktivt verksted**](workshop/README.md) - 8-modulers veiledede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduksjon → Valg → Validering → Dekonstruksjon → Konfigurasjon → Tilpasning → Nedpakking → Oppsummering

### Eksterne læringsressurser
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prisregner](https://azure.microsoft.com/pricing/calculator/)
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
<summary><strong>❌ "Utilstrekkelig kvote" eller "Kvote overskredet"</strong></summary>

```bash
# Prøv en annen Azure-region
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

# Verifisere autentisering
az account show
```
</details>

<details>
<summary><strong>❌ "Ressursen finnes allerede" eller navnekonflikter</strong></summary>

```bash
# AZD genererer unike navn, men ved konflikt:
azd down --force --purge

# Prøv på nytt med nytt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Malutrulling tar for lang tid</strong></summary>

**Vanlige ventetider:**
- Enkel nettapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikasjoner: 15-25 minutter (OpenAI-provisjonering er treg)

```bash
# Sjekk fremgang
azd show

# Hvis den sitter fast >30 minutter, sjekk Azure-portalen:
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
# Be Azure-administratoren din om å gi:
# - Bidragsyter (for ressurser)
# - Brukerrettighetsadministrator (for roller)
```
</details>

<details>
<summary><strong>❌ Finner ikke URL for utrullet applikasjon</strong></summary>

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

### 📚 Fullstendige feilsøkingsressurser

- **Guide for vanlige problemer:** [Detaljerte løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spesifikke problemer:** [AI-feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging-guide:** [Trinn-for-trinn debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjelp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Fullføring av kurs og sertifisering

### Fremdriftssporing
Følg læringsfremdriften din gjennom hvert kapittel:

- [ ] **Kapittel 1**: Grunnlag og rask start ✅
- [ ] **Kapittel 2**: AI-først utvikling ✅  
- [ ] **Kapittel 3**: Konfigurasjon og autentisering ✅
- [ ] **Kapittel 4**: Infrastruktur som kode og utrulling ✅
- [ ] **Kapittel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapittel 6**: Validering og planlegging før utrulling ✅
- [ ] **Kapittel 7**: Feilsøking og debugging ✅
- [ ] **Kapittel 8**: Produksjon og bedriftsmønstre ✅

### Verifisering av læring
Etter å ha fullført hvert kapittel, verifiser kunnskapen ved å:
1. **Praktisk øvelse**: Fullfør kapittelets praktiske utrulling
2. **Kunnskapssjekk**: Gå gjennom FAQ-seksjonen for kapittelet ditt
3. **Fellesskapsdiskusjon**: Del erfaringene dine i Azure Discord
4. **Neste kapittel**: Gå videre til neste kompleksitetsnivå

### Fordeler ved fullført kurs
Når du har fullført alle kapitlene, vil du ha:
- **Produksjonserfaring**: Rullet ut ekte AI-applikasjoner til Azure
- **Profesjonelle ferdigheter**: Bedriftsklare utrullingsmuligheter  
- **Fellesskapsgjenkjennelse**: Aktiv medlem av Azure-utviklermiljøet
- **Karriereutvikling**: Ettertraktet kompetanse innen AZD og AI-utrulling

---

## 🤝 Fellesskap og support

### Få hjelp og støtte
- **Tekniske problemer**: [Rapporter feil og foreslå funksjoner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørsmål**: [Microsoft Azure Discord-fellesskap](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifikk hjelp**: Bli med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasjon**: [Offisiell Azure Developer CLI-dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fellesskapsinnsikt fra Microsoft Foundry Discord

**Nylige meningsmålinger fra #Azure-kanalen:**
- **45 %** av utviklere ønsker å bruke AZD for AI-arbeidsmengder
- **Viktigste utfordringer**: Utrulling av tjenester, håndtering av legitimasjon, produksjonsberedskap  
- **Mest etterspurt**: AI-spesifikke maler, feilsøkingsguider, beste praksis

**Bli med i vårt fellesskap for å:**
- Dele dine AZD + AI-opplevelser og få hjelp
- Få tidlig tilgang til nye AI-maler
- Bidra til beste praksis for AI-utrulling
- Påvirke fremtidig AI + AZD-funksjonsutvikling

### Bidra til kurset
Vi tar gjerne imot bidrag! Les vår [Guide for bidragsytere](CONTRIBUTING.md) for detaljer om:
- **Forbedringer av innhold**: Forbedre eksisterende kapitler og eksempler
- **Nye eksempler**: Legg til virkelighetsnære scenarioer og maler  
- **Oversettelse**: Hjelp til å opprettholde flerspråklig støtte
- **Feilmeldinger**: Forbedre nøyaktighet og klarhet
- **Fellesskapsstandarder**: Følg våre inkluderende retningslinjer

---

## 📄 Kursinformasjon

### Lisens
Dette prosjektet er lisensiert under MIT-lisensen – se [LICENSE](../../LICENSE)-filen for detaljer.

### Relaterte Microsoft-læringsressurser

Teamet vårt produserer andre omfattende læringskurs:

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
 
### Grunnleggende læring
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

**🚀 Klar til å begynne å lære?**

**Nybegynnere**: Start med [Kapittel 1: Grunnlag & Rask Start](../..)  
**AI-utviklere**: Hopp til [Kapittel 2: AI-Først Utvikling](../..)  
**Erfarne utviklere**: Begynn med [Kapittel 3: Konfigurasjon & Autentisering](../..)

**Neste steg**: [Begynn Kapittel 1 - AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->