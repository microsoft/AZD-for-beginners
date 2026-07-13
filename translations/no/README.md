# AZD For Nybegynnere: En Strukturert Læringsreise

![AZD-for-beginners](../../translated_images/no/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiserte Oversettelser (Alltid Oppdatert)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](./README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Foretrekker du å Klone Lokalt?**
>
> Dette depotet inkluderer 50+ språkoversettelser som øker nedlastingsstørrelsen betydelig. For å klone uten oversettelser, bruk sparsom utsjekking:
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

## 🆕 Hva er Nytt i azd I Dag

> 📌 Dette kurset er validert mot **`azd 1.27.1`** (juli 2026). Kjør `azd version` for å sjekke din versjon, og `azd upgrade` for å få det siste.

Azure Developer CLI har vokst utover tradisjonelle webapper og APIer. I dag er azd det eneste verktøyet for å distribuere **enhver** applikasjon til Azure—inkludert AI-drevne applikasjoner og intelligente agenter.

Her er hva det betyr for deg:

- **AI-agenter er nå førsteklasses azd arbeidsbelastninger.** Du kan initialisere, distribuere og administrere AI-agentprosjekter ved å bruke samme `azd init` → `azd up` arbeidsflyt som du allerede kjenner.
- **En komplett agentlivssyklus fra CLI.** `azure.ai.agents`-utvidelsen dekker nå hele reisen—`azd ai agent init` for å lage skjelett, `azd ai agent invoke` for testing (med svartid-utdata), `azd ai agent eval generate` og `azd ai agent optimize` for å måle og forbedre kvalitet, og `azd ai agent delete` for opprydding.
- **Flere AI-byggeklosser.** Nye forhåndsvisningsutvidelser—`azure.ai.skills` og `azure.ai.connections`—lar deg administrere gjenbrukbare agentferdigheter og Foundry-tilkoblinger direkte med azd.
- **Microsoft Foundry-integrasjon** bringer modellutplassering, agenthosting og AI-tjenestekonfigurasjon direkte inn i azd-mal-økosystemet.
- **Smidigere dag-til-dag grunnleggende.** Nylige utgaver har gjort `azd init` idempotent (trygt å kjøre på nytt), gjort `azd auth login` til å rydde opp utdaterte tokens automatisk, og lagt til en vennlig `azd tool` første-gangs oppsettprompt.
- **Kjernarbeidsflyten har ikke endret seg.** Enten du distribuerer en todo-app, en mikrotjeneste eller en multi-agent AI-løsning, er kommandoene de samme.

> **Merk for Aspire-brukere:** Microsoft refererer nå til produktet enkelt som **Aspire** (tidligere ".NET Aspire"). azds Aspire-støtte er uendret—bare navnet ble oppdatert.

Hvis du har brukt azd før, er AI-støtte en naturlig forlengelse—ikke et eget verktøy eller en avansert bane. Hvis du starter helt ferskt, vil du lære en arbeidsflyt som fungerer for alt.

---

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

**Det er det!** Ingen klikk i Azure-portalen, ingen komplekse ARM-maler å lære først, ingen manuell konfigurasjon - bare fungerende applikasjoner på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hva er Forskjellen?

Dette er det vanligste spørsmålet nybegynnere stiller. Her er det enkle svaret:

| Funksjon | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrere individuelle Azure-ressurser | Distribuere komplette applikasjoner |
| **Tankegang** | Infrastrukturfokusert | Applikasjonsfokusert |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Må kjenne Azure-tjenester | Bare kjenne appen din |
| **Best for** | DevOps, Infrastruktur | Utviklere, Prototyping |

### Enkel Analog

- **Azure CLI** er som å ha alle verktøy for å bygge et hus - hammere, sager, spiker. Du kan bygge alt, men du må kunne bygging.
- **Azure Developer CLI** er som å leie en entreprenør - du beskriver hva du vil ha, og de tar seg av byggingen.

### Når du skal bruke hver

| Scenario | Bruk Dette |
|----------|----------|
| "Jeg vil distribuere webappen min raskt" | `azd up` |
| "Jeg trenger bare å opprette en lagringskonto" | `az storage account create` |
| "Jeg bygger en full AI-applikasjon" | `azd init --template azure-search-openai-demo` |
| "Jeg må feilsøke en spesifikk Azure-ressurs" | `az resource show` |
| "Jeg vil ha produksjonsklar distribusjon på minutter" | `azd up --environment production` |

### De Fungerer Sammen!

AZD bruker Azure CLI under panseret. Du kan bruke begge:
```bash
# Distribuer appen din med AZD
azd up

# Finjuster deretter spesifikke ressurser med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Finn Maler i Awesome AZD

Ikke start fra bunnen av! **Awesome AZD** er fellesskapets samling av klar-til-distribusjon-maler:

| Ressurs | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD Galleriet**](https://azure.github.io/awesome-azd/) | Bla gjennom 200+ maler med ett-klikk-distribusjon |
| 🔗 [**Send inn en Mal**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mal til fellesskapet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Stjern og utforsk kildekoden |

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

## 🎯 Kom i Gang på 3 Steg

Før du starter, sørg for at maskinen din er klar for malen du vil distribuere:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis noen av nødvendige sjekker feiler, fiks det først og fortsett så med kjappstarten.

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

Hvis du er usikker på hvilken du trenger, følg hele oppsettflyten i [Installasjon & Oppsett](docs/chapter-01-foundation/installation.md#authentication-setup).

### Steg 3: Distribuer Din Første App

```bash
# Initialiser fra en mal
azd init --template todo-nodejs-mongo

# Distribuer til Azure (oppretter alt!)
azd up
```

**🎉 Det er det!** Appen din er nå live på Azure.

### Rydd Opp (Glem Ikke!)

```bash
# Fjern alle ressurser når eksperimenteringen er ferdig
azd down --force --purge
```

---

## 📚 Hvordan Bruke Dette Kurset

Dette kurset er designet for **progressiv læring** - start der du føler deg komfortabel og jobb deg oppover:

| Din Erfaring | Start Her |
|-----------------|------------|
| **Helt ny på Azure** | [Kapittel 1: Grunnlag](#-chapter-1-foundation--quick-start) |
| **Kjenner Azure, ny til AZD** | [Kapittel 1: Grunnlag](#-chapter-1-foundation--quick-start) |
| **Vil distribuere AI-apper** | [Kapittel 2: AI-Første Utvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vil ha praktisk øvelse** | [🎓 Interaktiv Workshop](workshop/README.md) - 3-4 timers guidet lab |
| **Trenger produksjonsmønstre** | [Kapittel 8: Produksjon & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Kjapt Oppsett

1. **Fork Dette Depotet**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon Det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få Hjelp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrekker du å Klone Lokalt?**

> Dette depotet inkluderer 50+ språkoversettelser som øker nedlastingsstørrelsen betydelig. For å klone uten oversettelser, bruk sparsom utsjekking:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette gir deg alt du trenger for å fullføre kurset med mye raskere nedlasting.


## Kursoversikt

Mestre Azure Developer CLI (azd) gjennom strukturerte kapitler designet for progressiv læring. **Spesiell fokus på AI-applikasjonsdistribusjon med Microsoft Foundry-integrasjon.**


### Hvorfor dette kurset er essensielt for moderne utviklere

Basert på innsikt fra Microsoft Foundry Discord-fellesskapet ønsker **45 % av utviklere å bruke AZD for AI-arbeidsbelastninger**, men støter på utfordringer med:
- Kompleks fler-tjeneste AI-arkitektur
- Beste praksis for produksjonsdistribusjon av AI  
- Integrasjon og konfigurasjon av Azure AI-tjenester
- Kostnadsoptimalisering for AI-arbeidsbelastninger
- Feilsøking av AI-spesifikke distribusjonsproblemer

### Læringsmål

Ved å fullføre dette strukturerte kurset vil du:
- **Mestre AZD-grunnleggende**: Kjernebegreper, installasjon og konfigurasjon
- **Distribuere AI-applikasjoner**: Bruke AZD med Microsoft Foundry-tjenester
- **Implementere infrastruktur som kode**: Administrere Azure-ressurser med Bicep-maler
- **Feilsøke distribusjoner**: Løse vanlige problemer og debugge feil
- **Optimalisere for produksjon**: Sikkerhet, skalering, overvåking og kostnadsstyring
- **Bygge fleragent-løsninger**: Distribuere komplekse AI-arkitekturer

## Før du begynner: Kontoer, tilgang og forutsetninger

Før du starter kapittel 1, sørg for at du har følgende på plass. Installasjonstrinnene senere i guiden forutsetter at disse grunnleggende tingene allerede er ordnet.

- **Et Azure-abonnement**: Du kan bruke et eksisterende abonnement fra jobb eller din egen konto, eller opprette en [gratis prøveversjon](https://aka.ms/azurefreetrial) for å komme i gang.
- **Tillatelse til å opprette Azure-ressurser**: For de fleste øvelser bør du ha minst **Bidragsyter**-tilgang på målabonnementet eller ressursgruppen. Noen kapitler forutsetter også at du kan opprette ressursgrupper, administrerte identiteter og RBAC-tilordninger.
- [**En GitHub-konto**](https://github.com): Dette er nyttig for å forke depotet, spore dine egne endringer og bruke GitHub Codespaces for workshoppen.
- **Forutsetninger for mal-kjøretid**: Noen maler trenger lokale verktøy som Node.js, Python, Java eller Docker. Kjør oppsettsvalidatoren før du starter slik at du fanger opp manglende verktøy tidlig.
- **Grunnleggende terminalkunnskaper**: Du trenger ikke å være ekspert, men bør være komfortabel med å kjøre kommandoer som `git clone`, `azd auth login` og `azd up`.

> **Jobber du i et bedriftsabonnement?**
> Hvis Azure-miljøet ditt administreres av en administrator, bekreft på forhånd at du kan distribuere ressurser i abonnementet eller ressursgruppen du planlegger å bruke. Hvis ikke, be om et sandkasse-abonnement eller Bidragsyter-tilgang før du starter.

> **Ny på Azure?**
> Start med din egen Azure-prøveversjon eller pay-as-you-go-abonnement på https://aka.ms/azurefreetrial slik at du kan fullføre øvelsene fra start til slutt uten å vente på godkjenninger på leietakernivå.

## 🗺️ Kurskart: Rask navigering etter kapittel

Hvert kapittel har en dedikert README med læringsmål, raske starter og øvelser:

| Kapittel | Tema | Leksjoner | Varighet | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Grunnlag](docs/chapter-01-foundation/README.md)** | Komme i gang | [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) &#124; [Installasjon](docs/chapter-01-foundation/installation.md) &#124; [Første prosjekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utvikling](docs/chapter-02-ai-development/README.md)** | AI-første apper | [Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modellutrulling](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 t | ⭐⭐ |
| **[Kap 3: Konfigurasjon](docs/chapter-03-configuration/README.md)** | Auth og sikkerhet | [Konfigurasjon](docs/chapter-03-configuration/configuration.md) &#124; [Auth og sikkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC og distribusjon | [Distribusjonsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisjonering](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 t | ⭐⭐⭐ |
| **[Kap 5: Fleragent](docs/chapter-05-multi-agent/README.md)** | AI-agentløsninger | [Detaljhandel-scenario](examples/retail-scenario.md) &#124; [Koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[Kap 6: For-distribusjon](docs/chapter-06-pre-deployment/README.md)** | Planlegging og validering | [Preflight-sjekker](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 t | ⭐⭐ |
| **[Kap 7: Feilsøking](docs/chapter-07-troubleshooting/README.md)** | Debugging og fiks | [Vanlige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 t | ⭐⭐ |
| **[Kap 8: Produksjon](docs/chapter-08-production/README.md)** | Bedriftsmønstre | [Produksjonspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk lab | [Introduksjon](workshop/docs/instructions/0-Introduction.md) &#124; [Utvalg](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruksjon](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpassing](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedpakking](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Avslutning](workshop/docs/instructions/7-Wrap-up.md) | 3-4 t | ⭐⭐ |

**Total kursvarighet:** ~10-14 timer | **Ferdighetsnivå:** Nybegynner → Produksjonsklar

---

## 📚 Læringskapitler

*Velg din læringssti basert på erfaringsnivå og mål*

### 🚀 Kapittel 1: Grunnlag og rask start
**Forutsetninger**: Azure-abonnement, grunnleggende kommandolinjekunnskap  
**Varighet**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hva du vil lære
- Forstå Azure Developer CLI-grunnleggende
- Installere AZD på din plattform
- Din første vellykkede distribusjon

#### Læringsressurser
- **🎯 Start her**: [Hva er Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Grunnleggende](docs/chapter-01-foundation/azd-basics.md) - Kjernen i begreper og terminologi
- **⚙️ Oppsett**: [Installasjon og oppsett](docs/chapter-01-foundation/installation.md) - Plattformspesifikke guider
- **🛠️ Praktisk**: [Ditt første prosjekt](docs/chapter-01-foundation/first-project.md) - Steg-for-steg veiledning
- **📋 Rask referanse**: [Kommando snarveier](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Rask installasjonskontroll
azd version

# Distribuer din første applikasjon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapittelresultat**: Distribuere en enkel webapplikasjon til Azure ved bruk av AZD

**✅ Suksessvalidering:**
```bash
# Etter å ha fullført kapittel 1, bør du kunne:
azd version              # Viser installert versjon
azd init --template todo-nodejs-mongo  # Initialiserer prosjekt
azd up                  # Distribuerer til Azure
azd show                # Viser URL for kjørende app
# Applikasjonen åpnes i nettleseren og fungerer
azd down --force --purge  # Rydder opp ressurser
```

**📊 Tidsbruk:** 30-45 minutter  
**📈 Ferdighetsnivå etter:** Kan distribuere grunnleggende applikasjoner på egenhånd
**📈 Ferdighetsnivå etter:** Kan distribuere grunnleggende applikasjoner på egenhånd

---

### 🤖 Kapittel 2: AI-første utvikling (Anbefalt for AI-utviklere)
**Forutsetninger**: Kapittel 1 fullført  
**Varighet**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hva du vil lære
- Microsoft Foundry-integrasjon med AZD
- Distribuere AI-drevne applikasjoner
- Forstå AI-tjenestekonfigurasjoner

#### Læringsressurser
- **🎯 Start her**: [Microsoft Foundry-integrasjon](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI Agent-veiledning](docs/chapter-02-ai-development/agents.md) - Distribuer intelligente agenter med AZD
- **📖 Mønstre**: [AI-modellutrulling](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuer og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop-lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsningene dine AZD-klare
- **🎥 Interaktiv veiledning**: [Workshop-materialer](workshop/README.md) - Nettleserbasert læring med MkDocs * DevContainer-miljø
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

**💡 Kapittelresultat**: Distribuere og konfigurere en AI-drevet chat-applikasjon med RAG-funksjonalitet

**✅ Suksessvalidering:**
```bash
# Etter kapittel 2 skal du kunne:
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
**💰 Kostnadsbevissthet:** Forstå utviklingskostnader på $80-150/måned, produksjonskostnader på $300-3500/måned

#### 💰 Kostnadshensyn for AI-distribusjoner

**Utviklingsmiljø (estimert $80-150/måned):**
- Microsoft Foundry-modeller (Pay-as-you-go): $0-50/måned (basert på tokenbruk)
- AI Search (grunnleggende nivå): $75/måned
- Container Apps (forbruk): $0-20/måned
- Lagring (standard): $1-5/måned

**Produksjonsmiljø (estimert $300-3 500+/måned):**
- Microsoft Foundry-modeller (PTU for konsekvent ytelse): $3 000+/måned ELLER Pay-as-you-go med høy volum
- AI Search (standard nivå): $250/måned
- Container Apps (dedikert): $50-100/måned
- Application Insights: $5-50/måned
- Lagring (premium): $10-50/måned

**💡 Kostnadsoptimaliseringstips:**
- Bruk **Gratisnivået** Microsoft Foundry-modeller for læring (Azure OpenAI inkluderer 50 000 tokens/måned)
- Kjør `azd down` for å deallokere ressurser når du ikke aktivt utvikler
- Start med forbruksbasert fakturering, oppgrader til PTU kun for produksjon
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

### ⚙️ Kapittel 3: Konfigurasjon og autentisering
**Forutsetninger**: Kapittel 1 fullført  
**Varighet**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hva du vil lære
- Miljøkonfigurasjon og administrasjon
- Autentisering og beste praksis for sikkerhet
- Navngivning og organisering av ressurser

#### Læringsressurser
- **📖 Konfigurasjon**: [Konfigurasjonsguide](docs/chapter-03-configuration/configuration.md) - Miljøoppsett
- **🔐 Sikkerhet**: [Autentiseringsmønstre og administrert identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmønstre
- **📝 Eksempler**: [Database-app-eksempel](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurere flere miljøer (dev, staging, produksjon)
- Sette opp autentisering med administrert identitet
- Implementere miljøspesifikke konfigurasjoner

**💡 Kapittelresultat**: Administrere flere miljøer med korrekt autentisering og sikkerhet

---

### 🏗️ Kapittel 4: Infrastruktur som kode og distribusjon
**Forutsetninger**: Kapitler 1-3 fullført  
**Varighet**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Hva du vil lære
- Avanserte distribusjonsmønstre
- Infrastruktur som kode med Bicep
- Strategier for ressursprovisjonering

#### Læringsressurser
- **📖 Distribusjon**: [Distribusjonsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Fullstendige arbeidsflyter
- **🏗️ Provisjonering**: [Provisjonere ressurser](docs/chapter-04-infrastructure/provisioning.md) - Azure ressursadministrasjon
- **📝 Eksempler**: [Container App-eksempel](../../examples/container-app) - Containeriserte distribusjoner

#### Praktiske øvelser
- Lage tilpassede Bicep-maler
- Distribuere fler-tjeneste applikasjoner
- Implementere blue-green distribusjonsstrategier

**💡 Kapittelresultat**: Distribuere komplekse fler-tjeneste applikasjoner ved bruk av tilpassede infrastrukturmaler

---


### 🎯 Kapittel 5: Multi-Agent AI-løsninger (Avansert)
**Forutsetninger**: Kapitlene 1-2 fullført  
**Varighet**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hva Du Vil Lære
- Multi-agent arkitekturmønstre
- Agentorkestrering og koordinasjon
- Produksjonsklare AI-distribusjoner

#### Læringsressurser
- **🤖 Utvalgt Prosjekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Fullstendig implementering
- **🛠️ ARM-maler**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Én-klikk distribusjon
- **📖 Arkitektur**: [Multi-agent koordinasjonsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske Øvelser
```bash
# Distribuer den komplette fleragentløsningen for detaljhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforsk agentkonfigurasjoner
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapittelresultat**: Distribuer og administrer en produksjonsklar multi-agent AI-løsning med Kunde- og Lager-agenter

---

### 🔍 Kapittel 6: Forhåndsvalidering & Planlegging
**Forutsetninger**: Kapittel 4 fullført  
**Varighet**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hva Du Vil Lære
- Kapasitetsplanlegging og ressursvalidering
- Strategier for SKU-utvelgelse
- Forhåndssjekker og automatisering

#### Læringsressurser
- **📊 Planlegging**: [Kapasitetsplanlegging](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressursvalidering
- **💰 Utvelgelse**: [SKU-utvelgelse](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektive valg
- **✅ Validering**: [Forhåndssjekker](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserte skript

#### Praktiske Øvelser
- Kjør valideringsskript for kapasitet
- Optimaliser SKU-valg for kostnad
- Implementer automatiserte forhåndssjekker før distribusjon

**💡 Kapittelresultat**: Valider og optimaliser distribusjoner før utførelse

---

### 🚨 Kapittel 7: Feilsøking & Debugging
**Forutsetninger**: Ethvert distribusjonskapittel fullført  
**Varighet**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐

#### Hva Du Vil Lære
- Systematiske debuggingmetoder
- Vanlige problemer og løsninger
- AI-spesifikk feilsøking

#### Læringsressurser
- **🔧 Vanlige problemer**: [Vanlige problemer](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Trinnvise strategier
- **🤖 AI-problemer**: [AI-spesifikk feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemer med AI-tjenester

#### Praktiske Øvelser
- Diagnostiser distribusjonssvikt
- Løs autentiseringsproblemer
- Debugg AI-tjenestetilkobling

**💡 Kapittelresultat**: Diagnostiser og løse vanlige distribusjonsproblemer selvstendig

---

### 🏢 Kapittel 8: Produksjon & Enterprise-mønstre
**Forutsetninger**: Kapitlene 1-4 fullført  
**Varighet**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hva Du Vil Lære
- Strategier for produksjonsdistribusjon
- Enterprise sikkerhetsmønstre
- Overvåking og kostnadsoptimalisering

#### Læringsressurser
- **🏭 Produksjon**: [Produksjons AI beste praksis](docs/chapter-08-production/production-ai-practices.md) - Enterprise-mønstre
- **📝 Eksempler**: [Mikrotjeneste-eksempel](../../examples/microservices) - Kompleks arkitektur
- **📊 Overvåking**: [Application Insights-integrering](docs/chapter-06-pre-deployment/application-insights.md) - Overvåking

#### Praktiske Øvelser
- Implementer enterprise sikkerhetsmønstre
- Sett opp omfattende overvåking
- Distribuer til produksjon med riktig styring

**💡 Kapittelresultat**: Distribuer enterprise-klare applikasjoner med full produksjonskapasitet

---

## 🎓 Workshop Oversikt: Praktisk Læringserfaring

> **⚠️ WORKSHOP STATUS: Aktiv Utvikling**  
> Workshop-materialene utvikles og forbedres for øyeblikket. Kjerne-moduler fungerer, men noen avanserte seksjoner er ufullstendige. Vi jobber aktivt for å fullføre alt innhold. [Følg fremdriften →](workshop/README.md)

### Interaktive Workshop-materialer
**Omfattende praktisk læring med nettleserbaserte verktøy og veiledede øvelser**

Våre workshop-materialer tilbyr en strukturert, interaktiv læringsopplevelse som kompletterer kapittelbasert pensum ovenfor. Workshoppen er designet for både selvstyrt læring og instruktørledede sesjoner.

#### 🛠️ Workshop-funksjoner
- **Nettleserbasert grensesnitt**: Fullstendig MkDocs-drevet workshop med søk, kopiering og tema-funksjoner
- **GitHub Codespaces-integrasjon**: Én-klikk oppsett av utviklingsmiljø
- **Strukturert læringssti**: 8-modulers veiledede øvelser (totalt 3-4 timer)
- **Progressiv metodikk**: Introduksjon → Utvelgelse → Validering → Nedbrytning → Konfigurasjon → Tilpasning → Nedrigging → Oppsummering
- **Interaktiv DevContainer-miljø**: Forhåndskonfigurerte verktøy og avhengigheter

#### 📚 Workshop-modulstruktur
Workshoppen følger en **8-modulers progressiv metodikk** som tar deg fra oppdagelse til distribusjonsmestring:

| Modul | Tema | Hva Du Vil Gjøre | Varighet |
|--------|-------|----------------|----------|
| **0. Introduksjon** | Workshop Oversikt | Forstå læringsmål, forutsetninger og workshopstruktur | 15 min |
| **1. Utvelgelse** | Malutforskning | Utforsk AZD-maler og velg riktig AI-mal for ditt scenario | 20 min |
| **2. Validering** | Distribuer & Verifiser | Distribuer malen med `azd up` og valider at infrastrukturen fungerer | 30 min |
| **3. Nedbrytning** | Forstå Struktur | Bruk GitHub Copilot for å utforske malarkitektur, Bicep-filer og kodeorganisering | 30 min |
| **4. Konfigurasjon** | azure.yaml grundig gjennomgang | Mestre `azure.yaml`-konfigurasjon, livssyklus-kroker, og miljøvariabler | 30 min |
| **5. Tilpasning** | Gjør Det Ditt | Aktiver AI-søk, sporing, evaluering, og tilpass for ditt scenario | 45 min |
| **6. Nedrigging** | Rydd Opp | Sikker avprovisjonering av ressurser med `azd down --purge` | 15 min |
| **7. Oppsummering** | Neste Steg | Gå gjennom resultater, nøkkelkonsepter, og fortsett læringsreisen | 15 min |

**Workshopflyt:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Komme i Gang med Workshoppen
```bash
# Alternativ 1: GitHub Codespaces (Anbefalt)
# Klikk "Code" → "Create codespace on main" i depotet

# Alternativ 2: Lokal utvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg oppsettinstruksjonene i workshop/README.md
```

#### 🎯 Workshop Læringsutbytte
Ved å fullføre workshoppen vil deltakerne:
- **Distribuere AI-applikasjoner i produksjon**: Bruke AZD med Microsoft Foundry-tjenester
- **Mestre Multi-Agent Arkitekturer**: Implementere koordinerte AI-agentløsninger
- **Implementere sikkerhets beste praksis**: Konfigurere autentisering og tilgangskontroll
- **Optimalisere for skala**: Designe kostnadseffektive, ytelsessterke distribusjoner
- **Feilsøke distribusjoner**: Løse vanlige problemer selvstendig

#### 📖 Workshop-ressurser
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Nettleserbasert læringsmiljø
- **📋 Modul-for-modul instruksjoner**:
  - [0. Introduksjon](workshop/docs/instructions/0-Introduction.md) - Workshop oversikt og mål
  - [1. Utvelgelse](workshop/docs/instructions/1-Select-AI-Template.md) - Finn og velg AI-maler
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuer og verifiser maler
  - [3. Nedbrytning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforsk malarkitektur
  - [4. Konfigurasjon](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpass for ditt scenario
  - [6. Nedrigging](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rydd opp ressurser
  - [7. Oppsummering](workshop/docs/instructions/7-Wrap-up.md) - Gjennomgang og neste steg
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserte øvelser
- **💡 Rask Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljøkonfigurasjon

**Perfekt for**: Bedriftstrening, universitetskurs, selvstudium, og utvikler-bootcamps.

---

## 📖 Dypdykk: AZD Kapasiteter

Utover det grunnleggende tilbyr AZD kraftige funksjoner for produksjonsdistribusjoner:

- **Malbaserte distribusjoner** - Bruk forhåndsbygde maler for vanlige applikasjonsmønstre
- **Infrastructure as Code** - Administrer Azure-ressurser med Bicep eller Terraform  
- **Integrerte arbeidsflyter** - Sømløs provisjonering, distribusjon og overvåking av applikasjoner
- **Utviklervennlig** - Optimalisert for utviklerproduktivitet og opplevelse

### **AZD + Microsoft Foundry: Perfekt for AI-distribusjoner**

**Hvorfor AZD for AI-løsninger?** AZD tar tak i de største utfordringene AI-utviklere møter:

- **AI-klare maler** - Forhåndskonfigurerte maler for Microsoft Foundry-modeller, Azure AI-tjenester, og ML-arbeidsbelastninger
- **Sikre AI-distribusjoner** - Innebygde sikkerhetsmønstre for AI-tjenester, API-nøkler, og modelendepunkt  
- **Produksjons AI-mønstre** - Beste praksis for skalerbare, kostnadseffektive AI-applikasjonsdistribusjoner
- **Ende-til-ende AI-arbeidsflyter** - Fra modellutvikling til produksjonsdistribusjon med riktig overvåking
- **Kostnadsoptimalisering** - Smart ressursallokering og skalering for AI-arbeidsbelastninger
- **Microsoft Foundry-integrasjon** - Sømløs kobling til Microsoft Foundry-modellkatalog og endepunkter

---

## 🎯 Maler & Eksempelsamling

### Utvalgte: Microsoft Foundry Maler
**Start her hvis du distribuerer AI-applikasjoner!**

> **Merk:** Disse malene demonstrerer ulike AI-mønstre. Noen er eksterne Azure Samples, andre er lokale implementeringer.

| Mal | Kapittel | Kompleksitet | Tjenester | Type |
|----------|---------|------------|----------|------|
| [**Kom i gang med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom i gang med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapittel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalgte: Fullstendige Læringsscenarier
**Produksjonsklare applikasjonsmaler tilordnet læringskapitler**

| Mal | Læringskapittel | Kompleksitet | Nøkkellæring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapittel 2 | ⭐ | Grunnleggende AI distribusjonsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapittel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapittel 4 | ⭐⭐ | Document Intelligence-integrasjon |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapittel 5 | ⭐⭐⭐ | Agent-rammeverk og funksjonskalling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapittel 8 | ⭐⭐⭐ | Enterprise AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapittel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med Kunde- og Lager-agenter |

### Læring etter Eksempeltype

> **📌 Lokale vs. Eksterne Eksempler:**  
> **Lokale Eksempler** (i dette repoet) = Klare til å bruke umiddelbart  
> **Eksterne Eksempler** (Azure Samples) = Klon fra lenkede repoer

#### Lokale Eksempler (Klar til Bruk)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fullstendig produksjonsklar implementering med ARM-maler
  - Multi-agent arkitektur (Kunde + Lager-agenter)
  - Omfattende overvåking og evaluering
  - Én-klikk distribusjon via ARM-mal

#### Lokale Eksempler - Containerapplikasjoner (Kapitler 2-5)
**Omfattende containerdistribusjonseksempler i dette depotet:**

- [**Container App-eksempler**](examples/container-app/README.md) - Komplett guide til containerbaserte distribusjoner
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Grunnleggende REST API med skaler til null
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produksjonsklar fler-tjeneste distribusjon
  - Hurtigstart, produksjon og avanserte distribusjonsmønstre
  - Veiledning om overvåking, sikkerhet og kostnadsoptimalisering

#### Eksterne eksempler - Enkle applikasjoner (Kapittel 1-2)
**Klone disse Azure Samples repositoriene for å komme i gang:**
- [Enkel Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grunnleggende distribusjonsmønstre
- [Statisk nettsted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribusjon av statisk innhold
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API distribusjon

#### Eksterne eksempler - Databaseintegrasjon (Kapittel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databasetilkoblingsmønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløs dataflyt

#### Eksterne eksempler - Avanserte mønstre (Kapittel 4-8)
- [Java Mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Fler-tjeneste arkitekturer
- [Container Apps Jobber](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrunnsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produksjonsklare ML-mønstre

### Eksterne mal-samlinger
- [**Offisiell AZD Malgalleri**](https://azure.github.io/awesome-azd/) - Kuratert samling av offisielle og fellesskapsmaler
- [**Azure Developer CLI-maler**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn maldokumentasjon
- [**Eksempelkatalog**](examples/README.md) - Lokale læringseksempler med detaljerte forklaringer

---

## 📚 Læringsressurser & Referanser

### Hurtigreferanser
- [**Kommandooversikt**](resources/cheat-sheet.md) - Viktige azd-kommandoer organisert per kapittel
- [**Ordliste**](resources/glossary.md) - Azure og azd terminologi  
- [**FAQ**](resources/faq.md) - Vanlige spørsmål organisert etter læringskapittel
- [**Studieguide**](resources/study-guide.md) - Omfattende øvingsoppgaver

### Praktiske workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gjør AI-løsningene dine klar for AZD-distribusjon (2-3 timer)
- [**Interaktiv Workshop**](workshop/README.md) - 8-moduls veiledede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduksjon → Valg → Validering → Nedbrytning → Konfigurasjon → Tilpasning → Nedrigging → Oppsummering

### Eksterne læringsressurser
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitektursenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Priskalkulator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI-agentferdigheter for din editor
- [**Microsoft Azure Skills på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åpne agentferdigheter for Azure AI, Foundry, distribusjon, diagnostikk, kostnadsoptimalisering, og mer. Installer dem i GitHub Copilot, Cursor, Claude Code, eller en hvilken som helst støttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Rask feilsøkingsguide

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
<summary><strong>❌ "InsufficientQuota" eller "Kvoten overskredet"</strong></summary>

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
<summary><strong>❌ "azd up" feiler halvveis</strong></summary>

```bash
# Alternativ 1: Rydd opp og prøv igjen
azd down --force --purge
azd up

# Alternativ 2: Bare fikse infrastrukturen
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
# Re-autentiser for AZD
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
# AZD genererer unike navn, men hvis det oppstår konflikt:
azd down --force --purge

# Prøv igjen med et nytt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mal-distribusjon tar for lang tid</strong></summary>

**Normal ventetid:**
- Enkel webapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikasjoner: 15-25 minutter (OpenAI-provisjonering er treg)

```bash
# Sjekk fremdrift
azd show

# Hvis fast >30 minutter, sjekk Azure Portal:
azd monitor --overview
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
# - Brukertilgangsadministrator (for rolleoppgaver)
```
</details>

<details>
<summary><strong>❌ Finner ikke distribuert applikasjons-URL</strong></summary>

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

### 📚 Fullstendige feilsøkingsressurser

- **Vanlige problemer-guide:** [Detaljerte løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-spesifikke problemer:** [AI feilsøking](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging-guide:** [Trinnvis feilsøking](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjelp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursfullføring & Sertifisering

### Fremdriftssporing
Følg med på læringsfremgangen din gjennom hvert kapittel:

- [ ] **Kapittel 1**: Grunnlag & Hurtigstart ✅
- [ ] **Kapittel 2**: AI-først utvikling ✅  
- [ ] **Kapittel 3**: Konfigurasjon & autentisering ✅
- [ ] **Kapittel 4**: Infrastruktur som kode & distribusjon ✅
- [ ] **Kapittel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapittel 6**: Validering & planlegging før distribusjon ✅
- [ ] **Kapittel 7**: Feilsøking & debugging ✅
- [ ] **Kapittel 8**: Produksjons- & bedriftsmønstre ✅

### Læringsverifisering
Etter å ha fullført hvert kapittel, verifiser kunnskapen din ved å:
1. **Praktisk øvelse**: Fullfør kapittelets praktiske distribusjon
2. **Kunnskapssjekk**: Gå gjennom FAQ-delen for kapittelet ditt
3. **Fellesskapsdiskusjon**: Del din erfaring i Azure Discord
4. **Neste kapittel**: Gå videre til neste kompleksitetsnivå

### Fordeler ved kursfullføring
Når du har fullført alle kapitlene, vil du ha:
- **Produksjonserfaring**: Distribuert ekte AI-applikasjoner til Azure
- **Profesjonelle ferdigheter**: Bedriftsklare distribusjonsevner  
- **Fellesskapsgjenkjenning**: Aktiv medlem av Azure utviklerfellesskapet
- **Karriereutvikling**: Ettertraktet AZD- og AI-distribusjonsekspertise

---

## 🤝 Fellesskap & Support

### Få hjelp & støtte
- **Tekniske problemer**: [Rapporter feil og foreslå funksjoner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørsmål**: [Microsoft Azure Discord-fellesskap](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-spesifikk hjelp**: Bli med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasjon**: [Offisiell Azure Developer CLI-dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fellesskapsinnsikt fra Microsoft Foundry Discord

**Nylige avstemningsresultater fra #Azure-kanalen:**
- **45 %** av utviklere ønsker å bruke AZD for AI-arbeidsmengder
- **Topp utfordringer**: Fler-tjeneste distribusjoner, legitimasjonshåndtering, produksjonsklarhet  
- **Mest etterspurt**: AI-spesifikke maler, feilsøkingsguider, beste praksis

**Bli med i fellesskapet vårt for å:**
- Dele dine AZD + AI-opplevelser og få hjelp
- Få tidlige forhåndsvisninger av nye AI-maler
- Bidra til beste praksis for AI-distribusjon
- Påvirke fremtidig AI + AZD funksjonsutvikling

### Bidra til kurset
Vi ønsker bidrag velkommen! Vennligst les vår [Bidragsguide](CONTRIBUTING.md) for detaljer om:
- **Forbedringer av innhold**: Forbedre eksisterende kapitler og eksempler
- **Nye eksempler**: Legg til virkelige scenarier og maler  
- **Oversettelse**: Hjelp med å opprettholde flerspråklig støtte
- **Feilrapporter**: Forbedre nøyaktighet og klarhet
- **Fellesskapsstandarder**: Følg våre inkluderende retningslinjer for fellesskapet

---

## 📄 Kursinformasjon

### Lisens
Dette prosjektet er lisensiert under MIT License - se [LICENSE](../../LICENSE)-filen for detaljer.

### Relaterte Microsoft læringsressurser

Teamet vårt produserer også andre omfattende læringskurs:

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

[![Generativ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kjernelæring
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

**Nybegynnere**: Start med [Kapittel 1: Grunnlag & Rask start](#-chapter-1-foundation--quick-start)  
**AI-utviklere**: Hopp til [Kapittel 2: AI-første utvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne utviklere**: Begynn med [Kapittel 3: Konfigurasjon & Autentisering](#️-chapter-3-configuration--authentication)

**Neste steg**: [Begynn Kapittel 1 - AZD-grunnleggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->