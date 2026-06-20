# AZD for nybegynnere: En strukturert læringsreise

![AZD-for-beginners](../../translated_images/no/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiserte oversettelser (Alltid oppdaterte)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Kinesisk (Forenklet)](../zh-CN/README.md) | [Kinesisk (Tradisjonell, Hong Kong)](../zh-HK/README.md) | [Kinesisk (Tradisjonell, Macau)](../zh-MO/README.md) | [Kinesisk (Tradisjonell, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tsjekkisk](../cs/README.md) | [Dansk](../da/README.md) | [Nederlandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Gresk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malayisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalsk](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norsk](./README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasil)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumensk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (Filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrekker du å klone lokalt?**
>
> Dette arkivet inkluderer over 50 språklige oversettelser som øker nedlastingsstørrelsen betydelig. For å klone uten oversettelser, bruk sparse checkout:
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

> 📌 Dette kurset er validert mot **`azd 1.25.6`** (juni 2026). Kjør `azd version` for å sjekke versjonen din, og `azd upgrade` for å få den nyeste.

Azure Developer CLI har vokst utover tradisjonelle webapper og API-er. I dag er azd det eneste verktøyet for å distribuere **enhver** applikasjon til Azure—inkludert AI-drevne applikasjoner og intelligente agenter.

Dette betyr følgende for deg:

- **AI-agenter er nå førsteklasses azd-arbeidsbelastninger.** Du kan initialisere, distribuere og administrere AI-agentprosjekter med den samme `azd init` → `azd up`-arbeidsflyten du allerede kjenner.
- **En komplett agentlivssyklus fra CLI.** `azure.ai.agents`-utvidelsen dekker nå hele reisen—`azd ai agent init` for å generere kode, `azd ai agent invoke` for å teste (med responstidsutdata), `azd ai agent eval generate` og `azd ai agent optimize` for å måle og forbedre kvalitet, og `azd ai agent delete` for å rydde opp.
- **Flere AI-byggesteiner.** Nye preview-utvidelser—`azure.ai.skills` og `azure.ai.connections`—lar deg administrere gjenbrukbare agentferdigheter og Foundry-tilkoblinger direkte med azd.
- **Microsoft Foundry-integrasjon** bringer modellutplassering, agenthosting og AI-tjenestekonfigurasjon direkte inn i azd-maløkosystemet.
- **Smidigere daglige grunnleggende funksjoner.** Nylige versjoner har gjort `azd init` idempotent (trygt å kjøre flere ganger), gjort `azd auth login` automatisk rydder opp utdaterte tokens, og lagt til en brukervennlig `azd tool` startoppsettprompt.
- **Kjernearbeidsflyten har ikke endret seg.** Enten du distribuerer en todo-app, en mikrotjeneste eller en multi-agent AI-løsning, er kommandoene de samme.

> **Merk for Aspire-brukere:** Microsoft refererer nå til produktet enkelt som **Aspire** (tidligere «.NET Aspire»). azd sin Aspire-støtte er uendret—kun navnet er oppdatert.

Hvis du har brukt azd før, er AI-støtte en naturlig forlengelse—ikke et eget verktøy eller et avansert spor. Hvis du starter på nytt, lærer du én arbeidsflyt som fungerer for alt.

---

## 🚀 Hva er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et utviklervennlig kommandolinjeverktøy som gjør det enkelt å distribuere applikasjoner til Azure. I stedet for å manuelt opprette og koble mange Azure-ressurser, kan du distribuere hele applikasjoner med en enkelt kommando.

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

**Det er det!** Ingen klikk i Azure-portalen, ingen komplekse ARM-maler å lære først, ingen manuell konfigurasjon – bare fungerende applikasjoner på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hva er forskjellen?

Dette er det vanligste spørsmålet nybegynnere stiller. Her er det enkle svaret:

| Funksjon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrere individuelle Azure-ressurser | Distribuere komplette applikasjoner |
| **Tankesett** | Infrastrukturfokusert | Applikasjonsfokusert |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Må kunne Azure-tjenester | Bare kjenne appen din |
| **Best for** | DevOps, Infrastruktur | Utviklere, Prototyping |

### Enkel analogi

- **Azure CLI** er som å ha alle verktøyene for å bygge et hus – hammer, sag, spiker. Du kan bygge hva som helst, men du må kunne bygging.
- **Azure Developer CLI** er som å ansette en entreprenør – du beskriver hva du vil ha, og de håndterer byggingen.

### Når bruke hva

| Scenario | Bruk dette |
|----------|------------|
| "Jeg vil distribuere webappen min raskt" | `azd up` |
| "Jeg trenger bare å opprette en lagringskonto" | `az storage account create` |
| "Jeg bygger en full AI-applikasjon" | `azd init --template azure-search-openai-demo` |
| "Jeg trenger å feilsøke en spesifikk Azure-ressurs" | `az resource show` |
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

Ikke start fra bunnen! **Awesome AZD** er fellesskapets samling av maler klare til distribusjon:

| Ressurs | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD-galleriet**](https://azure.github.io/awesome-azd/) | Bla gjennom 200+ maler med ett-klikk-distribusjon |
| 🔗 [**Send inn en mal**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mal til fellesskapet |
| 🔗 [**GitHub-repositorium**](https://github.com/Azure/awesome-azd) | Gi stjerne og utforsk koden |

### Populære AI-maler fra Awesome AZD

```bash
# RAG-chat med Microsoft Foundry-modeller + AI-søk
azd init --template azure-search-openai-demo

# Rask AI-chatapplikasjon
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry-agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom i gang i 3 steg

Før du begynner, sørg for at maskinen din er klar for malen du vil distribuere:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis noen nødvendige sjekker feiler, rett opp det først før du fortsetter med hurtigstarten.

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

### Steg 2: Autentiser for AZD

```bash
# Valgfritt hvis du planlegger å bruke Azure CLI-kommandoer direkte i dette kurset
az login

# Påkrevd for AZD-arbeidsflyter
azd auth login
```

Hvis du er usikker på hvilken du trenger, følg hele oppsettflyten i [Installasjon og oppsett](docs/chapter-01-foundation/installation.md#authentication-setup).

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
| **Helt ny til Azure** | [Kapittel 1: Grunnlag](#-chapter-1-foundation--quick-start) |
| **Kan Azure, ny til AZD** | [Kapittel 1: Grunnlag](#-chapter-1-foundation--quick-start) |
| **Vil distribuere AI-apper** | [Kapittel 2: AI-First-utvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vil ha praktisk øvelse** | [🎓 Interaktivt verksted](workshop/README.md) - 3-4 timers veiledet lab |
| **Trenger produksjonsmønstre** | [Kapittel 8: Produksjon og Enterprise](#-chapter-8-production--enterprise-patterns) |

### Rask oppsett

1. **Fork dette repositoriet**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjelp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrekker å klone lokalt?**

> Dette arkivet inkluderer over 50 språklige oversettelser som øker nedlastingsstørrelsen betydelig. For å klone uten oversettelser, bruk sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette gir deg alt du trenger for å fullføre kurset med mye raskere nedlasting.


## Kursets oversikt

Mestre Azure Developer CLI (azd) gjennom strukturerte kapitler designet for gradvis læring. **Spesiell fokus på AI-applikasjonsdistribusjon med Microsoft Foundry-integrasjon.**
### Hvorfor dette kurset er essensielt for moderne utviklere

Basert på innsikt fra Microsoft Foundry Discord-fellesskapet ønsker **45 % av utviklere å bruke AZD til AI-arbeidsmengder**, men møter utfordringer med:
- Komplekse AI-arkitekturer med flere tjenester
- Beste praksis for produksjonsdistribusjon av AI  
- Integrasjon og konfigurering av Azure AI-tjenester
- Kostnadsoptimalisering for AI-arbeidsmengder
- Feilsøking av AI-spesifikke distribusjonsproblemer

### Læringsmål

Ved å fullføre dette strukturerte kurset vil du:
- **Beherske AZD-grunnleggende**: Kjernebegreper, installasjon og konfigurasjon
- **Distribuere AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester
- **Implementere infrastruktur som kode**: Administrere Azure-ressurser med Bicep-maler
- **Feilsøke distribusjoner**: Løse vanlige problemer og feilsøke feil
- **Optimalisere for produksjon**: Sikkerhet, skalering, overvåking og kostnadsstyring
- **Bygge løsninger med flere agenter**: Distribuere komplekse AI-arkitekturer

## Før du starter: Kontoer, tilgang og forutsetninger

Før du begynner med kapittel 1, sørg for at du har følgende på plass. Installasjonstrinnene senere i denne guiden forutsetter at disse grunnleggende tingene allerede er håndtert.

- **Et Azure-abonnement**: Du kan bruke et eksisterende abonnement fra jobb eller din egen konto, eller opprette en [gratis prøveperiode](https://aka.ms/azurefreetrial) for å komme i gang.
- **Tillatelse til å opprette Azure-ressurser**: For de fleste øvelser bør du ha minst **Bidragsyter**-tilgang på målabonnementet eller ressursgruppen. Noen kapitler kan også anta at du kan opprette ressursgrupper, administrerte identiteter og RBAC-tilordninger.
- [**En GitHub-konto**](https://github.com): Dette er nyttig for å forkere repositoriet, spore dine egne endringer og bruke GitHub Codespaces for workshopen.
- **Kjøretidsforutsetninger for maler**: Noen maler krever lokale verktøy som Node.js, Python, Java eller Docker. Kjør oppsettvalideringen før du starter slik at du tidlig oppdager manglende verktøy.
- **Grunnleggende terminalkunnskaper**: Du trenger ikke å være ekspert, men du bør være komfortabel med å kjøre kommandoer som `git clone`, `azd auth login` og `azd up`.

> **Jobber du i et bedriftsabonnement?**  
> Hvis Azure-miljøet ditt styres av en administrator, bekreft på forhånd at du kan distribuere ressurser i abonnementet eller ressursgruppen du planlegger å bruke. Hvis ikke, be om et sandkasseabonnement eller Bidragsyter-tilgang før du starter.

> **Ny i Azure?**  
> Start med eget Azure-prøveabonnement eller betalings-abonnement på https://aka.ms/azurefreetrial slik at du kan fullføre øvelsene fra start til slutt uten å vente på godkjenninger på leietakernivå.

## 🗺️ Kurskart: Rask navigering etter kapittel

Hvert kapittel har en egen README med læringsmål, raske starter og øvelser:

| Kapittel | Emne | Leksjoner | Varighet | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Grunnlag](docs/chapter-01-foundation/README.md)** | Komme i gang | [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) &#124; [Installasjon](docs/chapter-01-foundation/installation.md) &#124; [Første prosjekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utvikling](docs/chapter-02-ai-development/README.md)** | AI-første apper | [Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modelldistribusjon](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 t | ⭐⭐ |
| **[Kap 3: Konfigurasjon](docs/chapter-03-configuration/README.md)** | Autentisering og sikkerhet | [Konfigurasjon](docs/chapter-03-configuration/configuration.md) &#124; [Autentisering & sikkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & distribusjon | [Distribusjonsveiledning](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 t | ⭐⭐⭐ |
| **[Kap 5: Flere agenter](docs/chapter-05-multi-agent/README.md)** | AI-agentløsninger | [Detaljhandelsscenario](examples/retail-scenario.md) &#124; [Koordinasjonsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[Kap 6: Før distribusjon](docs/chapter-06-pre-deployment/README.md)** | Planlegging & validering | [Preflight-sjekker](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 t | ⭐⭐ |
| **[Kap 7: Feilsøking](docs/chapter-07-troubleshooting/README.md)** | Feilsøking & fikser | [Vanlige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Feilsøking](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 t | ⭐⭐ |
| **[Kap 8: Produksjon](docs/chapter-08-production/README.md)** | Enterprise-mønstre | [Produksjonspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk lab | [Introduksjon](workshop/docs/instructions/0-Introduction.md) &#124; [Valg](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbryting](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Avrunding](workshop/docs/instructions/7-Wrap-up.md) | 3-4 t | ⭐⭐ |

**Total kurstid:** ~10-14 timer | **Ferdighetsutvikling:** Nybegynner → Produksjonsklar

---

## 📚 Læringskapitler

*Velg din læringssti basert på erfaring og mål*

### 🚀 Kapittel 1: Grunnlag & Rask start  
**Forutsetninger**: Azure-abonnement, grunnleggende kommandolinjekunnskaper  
**Varighet**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Dette lærer du  
- Forstå Azure Developer CLI-grunnleggende  
- Installere AZD på din plattform  
- Din første vellykkede distribusjon  

#### Læringsressurser  
- **🎯 Start her**: [Hva er Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 Teori**: [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) - Kjernebegreper og terminologi  
- **⚙️ Oppsett**: [Installasjon og konfigurasjon](docs/chapter-01-foundation/installation.md) - Plattformspesifikke guider  
- **🛠️ Praktisk**: [Ditt første prosjekt](docs/chapter-01-foundation/first-project.md) - Trinn-for-trinn veiledning  
- **📋 Rask referanse**: [Kommando-oversikt](resources/cheat-sheet.md)  

#### Praktiske øvelser  
```bash
# Rask installasjonssjekk
azd version

# Distribuer din første applikasjon
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Kapittelresultat**: Distribuer en enkel webapplikasjon til Azure ved bruk av AZD

**✅ Suksessvalidering:**  
```bash
# Etter å ha fullført kapittel 1, bør du kunne:
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                  # Distribuerer til Azure
azd show                # Viser URL for kjørende app
# Applikasjonen åpnes i nettleser og fungerer
azd down --force --purge  # Rydder opp ressurser
```
  
**📊 Tidsbruk:** 30-45 minutter  
**📈 Ferdighetsnivå etter:** Kan distribuere grunnleggende applikasjoner selvstendig  
**📈 Ferdighetsnivå etter:** Kan distribuere grunnleggende applikasjoner selvstendig

---

### 🤖 Kapittel 2: AI-første utvikling (Anbefalt for AI-utviklere)  
**Forutsetninger**: Kapittel 1 fullført  
**Varighet**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Dette lærer du  
- Microsoft Foundry-integrasjon med AZD  
- Distribuere AI-drevne applikasjoner  
- Forstå konfigurasjoner for AI-tjenester  

#### Læringsressurser  
- **🎯 Start her**: [Microsoft Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI-agenter**: [AI Agent Guide](docs/chapter-02-ai-development/agents.md) - Distribuer intelligente agenter med AZD  
- **📖 Mønstre**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuer og administrer AI-modeller  
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsningene dine klare for AZD  
- **🎥 Interaktiv veiledning**: [Workshop-materialer](workshop/README.md) - Nettleserbasert opplæring med MkDocs * DevContainer-miljø  
- **📋 Maler**: [Microsoft Foundry-maler](#workshop-ressurser)  
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
  
**💡 Kapittelresultat**: Distribuer og konfigurer en AI-drevet chatteapplikasjon med RAG-funksjonalitet

**✅ Suksessvalidering:**  
```bash
# Etter kapittel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrensesnittet
# Stille spørsmål og få AI-drevne svar med kilder
# Bekrefte at søkeintegrasjonen fungerer
azd monitor  # Sjekke at Application Insights viser telemetri
azd down --force --purge
```
  
**📊 Tidsbruk:** 1-2 timer  
**📈 Ferdighetsnivå etter:** Kan distribuere og konfigurere produksjonsklare AI-applikasjoner  
**💰 Kostnadsbevissthet:** Forstå utviklingskostnader på 80-150 USD/måned, produksjonskostnader 300-3500 USD/måned  

#### 💰 Kostnadsbetraktninger for AI-distribusjoner

**Utviklingsmiljø (Estimert 80-150 USD/måned):**  
- Microsoft Foundry-modeller (betal etter bruk): 0-50 USD/måned (basert på tokenbruk)  
- AI Search (grunnplan): 75 USD/måned  
- Container Apps (forbruksnivå): 0-20 USD/måned  
- Lagring (standard): 1-5 USD/måned  

**Produksjonsmiljø (Estimert 300-3500+ USD/måned):**  
- Microsoft Foundry-modeller (PTU for jevn ytelse): 3000+ USD/måned ELLER betal etter bruk med høy volum  
- AI Search (standardplan): 250 USD/måned  
- Container Apps (dedikert): 50-100 USD/måned  
- Application Insights: 5-50 USD/måned  
- Lagring (premium): 10-50 USD/måned  

**💡 Tips for kostnadsoptimalisering:**  
- Bruk **gratisnivået** for Microsoft Foundry-modeller til læring (Azure OpenAI inkluderer 50 000 tokens/måned)  
- Kjør `azd down` for å frigjøre ressurser når du ikke utvikler aktivt  
- Start med forbruksbasert fakturering, oppgrader til PTU bare for produksjon  
- Bruk `azd provision --preview` for å estimere kostnader før distribusjon  
- Aktiver autoskalering: betal kun for faktisk bruk  

**Kostnadsovervåking:**  
```bash
# Sjekk estimerte månedlige kostnader
azd provision --preview

# Overvåk faktiske kostnader i Azure-portalen
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Kapittel 3: Konfigurasjon & autentisering  
**Forutsetninger**: Kapittel 1 fullført  
**Varighet**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Dette lærer du  
- Miljøkonfigurasjon og -administrasjon  
- Autentisering og sikkerhetsbeste praksis  
- Navngiving og organisering av ressurser  

#### Læringsressurser  
- **📖 Konfigurasjon**: [Konfigurasjonsguide](docs/chapter-03-configuration/configuration.md) - Miljøoppsett  
- **🔐 Sikkerhet**: [Autentiseringsmønstre og administrerte identiteter](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmønstre  
- **📝 Eksempler**: [Databaseapplikasjonseksempel](examples/database-app/README.md) - AZD Databaseeksempler  

#### Praktiske øvelser  
- Konfigurer flere miljøer (dev, staging, prod)  
- Sett opp administrert identitetsautentisering  
- Implementer miljøspesifikke konfigurasjoner  

**💡 Kapittelresultat**: Administrer flere miljøer med korrekt autentisering og sikkerhet

---

### 🏗️ Kapittel 4: Infrastruktur som kode & distribusjon  
**Forutsetninger**: Kapitler 1-3 fullført  
**Varighet**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Dette lærer du  
- Avanserte distribusjonsmønstre  
- Infrastruktur som kode med Bicep  
- Strategier for ressursprovisjonering  

#### Læringsressurser  
- **📖 Distribusjon**: [Distribusjonsveiledning](docs/chapter-04-infrastructure/deployment-guide.md) - Fullstendige arbeidsflyter  
- **🏗️ Provisionering**: [Provisionering av ressurser](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursadministrasjon  
- **📝 Eksempler**: [Container App-eksempel](../../examples/container-app) - Containerbaserte distribusjoner  

#### Praktiske øvelser  
- Lag tilpassede Bicep-maler  
- Distribuer applikasjoner med flere tjenester  
- Implementer blue-green distribusjonsstrategier  

**💡 Kapittelresultat**: Distribuer komplekse applikasjoner med flere tjenester ved bruk av tilpassede infrastrukturmaler

---
### 🎯 Kapittel 5: Multi-agent AI-løsninger (Avansert)  
**Forutsetninger**: Kapittel 1-2 fullført  
**Varighet**: 2-3 timer  
**Vanskelighetsgrad**: ⭐⭐⭐⭐

#### Det du vil lære  
- Multi-agent arkitektur mønstre  
- Agentorkestrering og koordinering  
- Produksjonsklare AI-distribusjoner

#### Læringsressurser  
- **🤖 Utvalgt prosjekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplett implementering  
- **🛠️ ARM-maler**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Ett-klikk distribusjon  
- **📖 Arkitektur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser  
```bash
# Distribuer den komplette multi-agent løsningen for detaljhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforsk agentkonfigurasjoner
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Kapittelresultat**: Distribuer og administrer en produksjonsklar multi-agent AI-løsning med Kunde- og Lager-agenter

---

### 🔍 Kapittel 6: Validering og planlegging før distribusjon  
**Forutsetninger**: Kapittel 4 fullført  
**Varighet**: 1 time  
**Vanskelighetsgrad**: ⭐⭐

#### Det du vil lære  
- Kapasitetsplanlegging og ressursvalidering  
- Strategier for valg av SKU  
- Pre-flight-sjekker og automatisering

#### Læringsressurser  
- **📊 Planlegging**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursvalidering  
- **💰 Valg**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektive valg  
- **✅ Validering**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserte skript

#### Praktiske øvelser  
- Kjør skript for kapasitetsvalidering  
- Optimaliser SKU-valg for kostnad  
- Implementer automatiserte pre-distribusjonskontroller

**💡 Kapittelresultat**: Validere og optimalisere distribusjoner før utførelse

---

### 🚨 Kapittel 7: Feilsøking og debugging  
**Forutsetninger**: Ethvert distribusjonskapittel fullført  
**Varighet**: 1-1,5 time  
**Vanskelighetsgrad**: ⭐⭐

#### Det du vil lære  
- Systematiske debugging-tilnærminger  
- Vanlige problemer og løsninger  
- AI-spesifikk feilsøking

#### Læringsressurser  
- **🔧 Vanlige problemer**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger  
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Trinnvise strategier  
- **🤖 AI-problemer**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemer med AI-tjenester

#### Praktiske øvelser  
- Diagnostiser distribusjonssvikt  
- Løs autentiseringsproblemer  
- Feilsøk AI-tjenestetilkobling

**💡 Kapittelresultat**: Selvstendig diagnostisere og løse vanlige distribusjonsproblemer

---

### 🏢 Kapittel 8: Produksjon og bedriftsmønstre  
**Forutsetninger**: Kapittel 1-4 fullført  
**Varighet**: 2-3 timer  
**Vanskelighetsgrad**: ⭐⭐⭐⭐

#### Det du vil lære  
- Produksjonsdistribusjonsstrategier  
- Bedriftssikkerhetsmønstre  
- Overvåking og kostnadsoptimalisering

#### Læringsressurser  
- **🏭 Produksjon**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Bedriftsmønstre  
- **📝 Eksempler**: [Microservices Example](../../examples/microservices) - Komplekse arkitekturer  
- **📊 Overvåking**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Overvåking

#### Praktiske øvelser  
- Implementer bedrifts­sikkerhetsmønstre  
- Sett opp omfattende overvåking  
- Distribuer til produksjon med riktig styring

**💡 Kapittelresultat**: Distribuer bedriftsklare applikasjoner med full produksjonskapasitet

---

## 🎓 Workshop Oversikt: Praktisk læringsopplevelse

> **⚠️ WORKSHOP STATUS: Aktiv utvikling**  
> Workshop-materialene er under utvikling og finpussing. Kjernemoduler fungerer, men noen avanserte seksjoner er uferdige. Vi jobber aktivt med å fullføre alt innhold. [Følg fremdriften →](workshop/README.md)

### Interaktive Workshop-materialer  
**Omfattende praktisk læring med nettleserbaserte verktøy og veiledede øvelser**

Våre workshop-materialer gir en strukturert, interaktiv læringsopplevelse som utfyller kapittelbasert pensum ovenfor. Workshopen er designet for både selvstyrt læring og instruktørledede sesjoner.

#### 🛠️ Workshop-funksjoner  
- **Nettleserbasert grensesnitt**: Komplett MkDocs-drevet workshop med søk, kopiering og temafunksjoner  
- **GitHub Codespaces-integrasjon**: Ett-knapps oppsett av utviklingsmiljø  
- **Strukturert læringssti**: 8 modulveiledede øvelser (3-4 timer totalt)  
- **Progressiv metodikk**: Introduksjon → Valg → Validering → Dekonstruksjon → Konfigurasjon → Tilpasning → Nedrigging → Oppsummering  
- **Interaktivt DevContainer-miljø**: Forhåndskonfigurerte verktøy og avhengigheter

#### 📚 Workshop-modulstruktur  
Workshopen følger en **8-moduls progressiv metodikk** som tar deg fra oppdagelse til mestring av distribusjon:

| Modul | Tema | Hva du gjør | Varighet |
|--------|-------|----------------|----------|
| **0. Introduksjon** | Workshop oversikt | Forstå læringsmål, forutsetninger og workshopstruktur | 15 min |
| **1. Valg** | Maloppdagelse | Utforsk AZD-maler og velg riktig AI-mal for ditt scenario | 20 min |
| **2. Validering** | Distribuer & verifiser | Distribuer malen med `azd up` og valider at infrastrukturen fungerer | 30 min |
| **3. Dekonstruksjon** | Forstå struktur | Bruk GitHub Copilot for å utforske malen arkitektur, Bicep-filer og kodeorganisering | 30 min |
| **4. Konfigurasjon** | azure.yaml detaljdykk | Mestre `azure.yaml` konfigurasjon, livssyklus-hooker og miljøvariabler | 30 min |
| **5. Tilpasning** | Gjør det ditt | Aktiver AI Search, tracing, evaluering og tilpass for ditt scenario | 45 min |
| **6. Nedrigging** | Rydd opp | Sikker nedrigging av ressurser med `azd down --purge` | 15 min |
| **7. Oppsummering** | Neste steg | Gå gjennom resultater, nøkkelkonsepter og fortsett læringsreisen | 15 min |

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
  
#### 🎯 Workshop læringsutbytte  
Ved fullføring av workshopen vil deltakerne:  
- **Distribuere produksjonsklare AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester  
- **Beherske multi-agent arkitekturer**: Implementere koordinerte AI-agent-løsninger  
- **Implementere sikkerhets­beste praksis**: Konfigurere autentisering og tilgangskontroll  
- **Optimalisere for skala**: Designe kostnadseffektive, ytelsessterke distribusjoner  
- **Feilsøke distribusjoner**: Løse vanlige problemer selvstendig

#### 📖 Workshop-ressurser  
- **🎥 Interaktiv veiledning**: [Workshop Materials](workshop/README.md) - Nettleserbasert læringsmiljø  
- **📋 Modulvise instruksjoner**:  
  - [0. Introduksjon](workshop/docs/instructions/0-Introduction.md) - Workshop oversikt og mål  
  - [1. Valg](workshop/docs/instructions/1-Select-AI-Template.md) - Finn og velg AI-maler  
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuer og verifiser maler  
  - [3. Dekonstruksjon](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforsk malarkitektur  
  - [4. Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml  
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpass for ditt scenario  
  - [6. Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rydd opp ressurser  
  - [7. Oppsummering](workshop/docs/instructions/7-Wrap-up.md) - Gjennomgang og neste steg  
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserte øvelser  
- **💡 Rask start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljøkonfigurasjon

**Perfekt for**: Bedriftstreninger, universitetskurs, selvstudium og utviklerbootcamps.

---

## 📖 Dypdykk: AZD-funksjonalitet

Utover grunnleggende tilbyr AZD kraftige funksjoner for produksjonsdistribusjoner:

- **Malbaserte distribusjoner** - Bruk ferdige maler for vanlige applikasjonsmønstre  
- **Infrastruktur som kode** - Administrer Azure-ressurser med Bicep eller Terraform  
- **Integrerte arbeidsflyter** - Sømløs provisjonering, distribusjon og overvåking av applikasjoner  
- **Utviklervennlig** - Optimalisert for produktivitet og brukeropplevelse

### **AZD + Microsoft Foundry: Perfekt for AI-distribusjoner**

**Hvorfor AZD for AI-løsninger?** AZD tar tak i de største utfordringene AI-utviklere møter:

- **AI-klare maler** - Ferdigkonfigurert for Microsoft Foundry-modeller, Azure AI-tjenester og ML-arbeidsmengder  
- **Sikre AI-distribusjoner** - Innebygde sikkerhetsmønstre for AI-tjenester, API-nøkler og modellendepunkter  
- **Produksjons-AI-mønstre** - Beste praksis for skalerbare, kostnadseffektive AI-applikasjonsdistribusjoner  
- **End-to-end AI-arbeidsflyter** - Fra modellutvikling til produksjonsdistribusjon med passende overvåking  
- **Kostnadsoptimalisering** - Smarte ressursallokerings- og skaleringsstrategier for AI-arbeidsmengder  
- **Microsoft Foundry-integrasjon** - Sømløs tilkobling til Microsoft Foundry-modellkatalog og endepunkter

---

## 🎯 Maler og eksempelsamling

### Utvalgt: Microsoft Foundry maler  
**Start her hvis du distribuerer AI-applikasjoner!**

> **Merk:** Disse malene demonstrerer ulike AI-mønstre. Noen er eksterne Azure Samples, andre er lokale implementasjoner.

| Mal | Kapittel | Vanskelighetsgrad | Tjenester | Type |
|----------|---------|------------|----------|------|
| [**Kom i gang med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom i gang med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapittel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalgt: Fullstendige læringsscenarioer  
**Produksjonsklare applikasjonsmaler knyttet til læringskapitler**

| Mal | Læringskapittel | Vanskelighetsgrad | Nøkkellæring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | Grunnleggende AI-distribusjonsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapittel 4 | ⭐⭐ | Dokumentintelligens-integrasjon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | Agentrammeverk og funksjonsanrop |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐ | Bedrifts-AI orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med Kunde- og Lager-agenter |

### Læring etter eksempeltype

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repoet) = Klare til bruk umiddelbart  
> **Eksterne eksempler** (Azure Samples) = Klon fra tilknyttede repositorier

#### Lokale eksempler (klare til bruk)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Komplett produksjonsklar implementering med ARM-maler  
  - Multi-agent arkitektur (Kunde + Lager-agenter)  
  - Omfattende overvåking og evaluering  
  - Ett-klikk distribusjon via ARM-mal

#### Lokale eksempler - Container-applikasjoner (Kapittel 2-5)  
**Omfattende containerdistribusjonseksempler i dette arkivet:**
- [**Container App-eksempler**](examples/container-app/README.md) - Komplette veiledninger for containerbaserte distribusjoner
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Enkel REST API med scale-to-zero
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produksjonsklar distribusjon med flere tjenester
  - Rask start, produksjon og avanserte distribusjonsmønstre
  - Veiledning for overvåking, sikkerhet og kostnadsoptimalisering

#### Eksterne eksempler - Enkle applikasjoner (Kapittel 1-2)
**Klone disse Azure Samples-repositoriene for å komme i gang:**
- [Enkel nettapp - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grunnleggende distribusjonsmønstre
- [Statisk nettsted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribusjon av statisk innhold
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API distribusjon

#### Eksterne eksempler - Databaseintegrasjon (Kapittel 3-4)  
- [Databaseapp - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mønstre for databaseforbindelse
- [Funksjoner + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløs databehandling

#### Eksterne eksempler - Avanserte mønstre (Kapittel 4-8)
- [Java mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arkitektur med flere tjenester
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrunnsprosesser  
- [Enterprise ML-pipeline](https://github.com/Azure-Samples/mlops-v2) - Produksjonsklare ML-mønstre

### Eksterne mal-samlinger
- [**Offisiell AZD malgalleri**](https://azure.github.io/awesome-azd/) - Kuratert samling av offisielle og fellesskapsmaler
- [**Azure Developer CLI-maler**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn maldokumentasjon
- [**Eksempelkatalog**](examples/README.md) - Lokale læringseksempler med detaljerte forklaringer

---

## 📚 Læringsressurser og referanser

### Raskereferanser
- [**Kommando-hurtigreferanse**](resources/cheat-sheet.md) - Viktige azd-kommandoer organisert etter kapittel
- [**Ordlista**](resources/glossary.md) - Azure og azd terminologi  
- [**FAQ**](resources/faq.md) - Vanlige spørsmål organisert etter læringskapittel
- [**Studieveiledning**](resources/study-guide.md) - Omfattende øvingsoppgaver

### Praktiske workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør dine AI-løsninger distribuérbare med AZD (2-3 timer)
- [**Interaktiv Workshop**](workshop/README.md) - 8 moduler med veiledede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduksjon → Valg → Validering → Nedbryting → Konfigurering → Tilpasning → Nedleggelse → Oppsummering

### Eksterne læringsressurser
- [Azure Developer CLI-dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI-agentferdigheter for din editor
- [**Microsoft Azure Skills på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åpne agentferdigheter for Azure AI, Foundry, distribusjon, diagnostikk, kostnadsoptimalisering med mer. Installer dem i GitHub Copilot, Cursor, Claude Code eller en hvilken som helst støttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rask problemløsningsguide

**Vanlige problemer nybegynnere støter på og umiddelbare løsninger:**

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

# Sett standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Sett for AZD-miljø
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiser
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" eller "Kvote overskredet"</strong></summary>

```bash
# Prøv forskjellige Azure-regioner
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
<summary><strong>❌ "azd up" mislykkes halvveis</strong></summary>

```bash
# Alternativ 1: Rens og prøv igjen
azd down --force --purge
azd up

# Alternativ 2: Bare fiks infrastruktur
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
# Autentiser på nytt for AZD
azd auth logout
azd auth login

# Valgfritt: oppdater også Azure CLI hvis du kjører az-kommandoer
az logout
az login

# Verifiser autentisering
az account show
```
</details>

<details>
<summary><strong>❌ "Ressurs eksisterer allerede" eller navnekonflikter</strong></summary>

```bash
# AZD genererer unike navn, men hvis konflikt:
azd down --force --purge

# Prøv igjen med nytt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mal-distribusjon tar for lang tid</strong></summary>

**Vanlige ventetider:**
- Enkel nettapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikasjoner: 15-25 minutter (OpenAI provisjonering er tregt)

```bash
# Sjekk fremdrift
azd show

# Hvis fastlåst >30 minutter, sjekk Azure-portalen:
azd monitor --overview
# Se etter mislykkede distribusjoner
```
</details>

<details>
<summary><strong>❌ "Tillatelse nektet" eller "Forbudt"</strong></summary>

```bash
# Sjekk din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du trenger minst "Bidragsyter" rolle
# Be din Azure-administrator om å gi:
# - Bidragsyter (for ressurser)
# - Brukertilgangsadministrator (for rolleoppgaver)
```
</details>

<details>
<summary><strong>❌ Finner ikke URL til distribuert applikasjon</strong></summary>

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

### 📚 Fullstendige problemløsningsressurser

- **Guide for vanlige problemer:** [Detaljerte løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spesifikke problemer:** [AI Problemløsning](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Feilsøkingsguide:** [Trinnvis feilsøking](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjelp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursfullføring og sertifisering

### Fremdriftssporing
Følg læringsprogresjonen gjennom hvert kapittel:

- [ ] **Kapittel 1**: Grunnlag & Rask start ✅
- [ ] **Kapittel 2**: AI-Første Utvikling ✅  
- [ ] **Kapittel 3**: Konfigurasjon & Autentisering ✅
- [ ] **Kapittel 4**: Infrastruktur som kode & Distribusjon ✅
- [ ] **Kapittel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapittel 6**: Forhåndsvalidering & Planlegging ✅
- [ ] **Kapittel 7**: Problemløsning & Feilsøking ✅
- [ ] **Kapittel 8**: Produksjon & Enterprise mønstre ✅

### Bekreftelse av læring
Etter å ha fullført hvert kapittel, bekreft kunnskapen ved å:
1. **Praktisk øvelse**: Fullfør kapittelets praktiske distribusjon
2. **Kunnskapstest**: Gå gjennom FAQ-delen for ditt kapittel
3. **Fellesskapsdiskusjon**: Del dine erfaringer i Azure Discord
4. **Neste kapittel**: Fortsett til neste kompleksitetsnivå

### Fordeler ved kursfullføring
Etter å ha fullført alle kapitler vil du ha:
- **Produksjonserfaring**: Distribuert ekte AI-applikasjoner til Azure
- **Profesjonelle ferdigheter**: Produksjonsklare distribusjonskapabiliteter  
- **Fellesskapsanerkjennelse**: Aktiv medlem av Azure-utviklerfellesskapet
- **Karrierefremgang**: Etterspurt AZD- og AI-distribusjonskompetanse

---

## 🤝 Fellesskap & Support

### Få hjelp og støtte
- **Tekniske problemer**: [Rapporter feil og be om funksjoner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørsmål**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifikk hjelp**: Bli med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasjon**: [Offisiell Azure Developer CLI-dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fellesskapsinnsikt fra Microsoft Foundry Discord

**Nylige meningsmålinger fra #Azure-kanalen:**
- **45%** av utviklere ønsker å bruke AZD for AI arbeidsmengder
- **Topp utfordringer**: Distribusjoner med flere tjenester, håndtering av legitimasjon, produksjonsklarhet  
- **Mest etterspurte**: AI-spesifikke maler, problemløsningsguider, beste praksis

**Bli med i vårt fellesskap for å:**
- Dele dine AZD + AI erfaringer og få hjelp
- Få tidlig tilgang til nye AI-maler
- Bidra til beste praksis for AI-distribusjon
- Påvirke fremtidig AI + AZD funksjonsutvikling

### Bidra til kurset
Vi ønsker bidrag velkommen! Vennligst les vår [Bidragsveiledning](CONTRIBUTING.md) for detaljer om:
- **Innholdsforbedringer**: Forbedre eksisterende kapitler og eksempler
- **Nye eksempler**: Legg til virkelige scenarier og maler  
- **Oversettelser**: Hjelp med å vedlikeholde flerspråklig støtte
- **Feilrapporter**: Øk nøyaktighet og klarhet
- **Fellesskapsstandarder**: Følg våre inkluderende retningslinjer for fellesskapet

---

## 📄 Kursinformasjon

### Lisens
Dette prosjektet er lisensiert under MIT-lisensen - se [LICENSE](../../LICENSE) filen for detaljer.

### Relaterte Microsoft Læringsressurser

Teamet vårt produserer andre omfattende læringskurs:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for nybegynnere](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for nybegynnere](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for nybegynnere](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD for nybegynnere](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for nybegynnere](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for nybegynnere](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agenter for nybegynnere](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI-serie
[![Generativ AI for nybegynnere](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
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
**AI Utviklere**: Gå til [Kapittel 2: AI-Først Utvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne utviklere**: Begynn med [Kapittel 3: Konfigurasjon & Autentisering](#️-chapter-3-configuration--authentication)

**Neste steg**: [Begynn Kapittel 1 - AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->