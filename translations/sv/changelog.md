# Ändringslogg - AZD For Beginners

## Introduktion

Denna ändringslogg dokumenterar alla betydande ändringar, uppdateringar och förbättringar i AZD For Beginners-repositoriet. Vi följer principer för semantisk versionering och upprätthåller denna logg för att hjälpa användare förstå vad som har ändrats mellan versioner.

## Lärandemål

Genom att granska denna ändringslogg kommer du att:
- Hålla dig informerad om nya funktioner och tillagt innehåll
- Förstå förbättringar som gjorts i befintlig dokumentation
- Spåra buggfixar och korrigeringar för att säkerställa noggrannhet
- Följa utvecklingen av lärmaterialet över tid

## Läranderesultat

Efter att ha granskat ändringsloggsposter kommer du att kunna:
- Identifiera nytt innehåll och resurser som finns tillgängliga för lärande
- Förstå vilka avsnitt som har uppdaterats eller förbättrats
- Planera din inlärningsväg baserat på det mest aktuella materialet
- Bidra med feedback och förslag för framtida förbättringar

## Versionshistorik

### [v3.17.0] - 2026-02-05

#### Förbättring av kursnavigering
**Denna version förbättrar README.md-kapitelnavigeringen med ett förbättrat tabellformat.**

#### Ändrat
- **Kurskarta-tabell**: Förbättrad med direkta lektionslänkar, tidsuppskattningar och komplexitetsbetyg
- **Rensning av mappar**: Tog bort redundanta gamla mappar (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Länkvalidering**: Alla 21+ interna länkar i Kurskarta-tabellen verifierade

### [v3.16.0] - 2026-02-05

#### Uppdateringar av produktnamn
**Denna version uppdaterar produktreferenser till nuvarande Microsoft-varumärke.**

#### Ändrat
- **Azure AI Foundry → Microsoft Foundry**: Alla referenser uppdaterade i filer som inte är översättningar
- **Azure AI Agent Service → Foundry Agents**: Servicenamn uppdaterat för att återspegla nuvarande varumärke

#### Uppdaterade filer
- `README.md` - Kursens huvudsida
- `changelog.md` - Versionshistorik
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Guide för AI-agenter
- `examples/README.md` - Exempeldokumentation
- `workshop/README.md` - Workshopens huvudsida
- `workshop/docs/index.md` - Workshopindex
- `workshop/docs/instructions/*.md` - Alla workshop-instruktionsfiler

---

### [v3.15.0] - 2026-02-05

#### Större omstrukturering av repository: Kapitelbaserade mappnamn
**Denna version omstrukturerar dokumentationen till dedikerade kapitelmappar för tydligare navigering.**

#### Omdöpning av mappar
Gamla mappar har ersatts med kapitelnumrerade mappar:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Filmigreringar
| Fil | Från | Till |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lagt till
- **📚 Kapitel-README-filer**: Skapade README.md i varje kapitelmapp med:
  - Lärandemål och tidsåtgång
  - Lektionstabell med beskrivningar
  - Snabbstartskommandon
  - Navigering till andra kapitel

#### Ändrat
- **🔗 Uppdaterade alla interna länkar**: 78+ sökvägar uppdaterade i alla dokumentationsfiler
- **🗺️ Huvud-README.md**: Uppdaterad kurskarta med ny kapitelstruktur
- **📝 examples/README.md**: Uppdaterade korsreferenser till kapitelmappar

#### Borttaget
- Gammal mappstruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-omstrukturering: kapitelnavigering
**Denna version lade till README-filer för kapitelnavigering (ersatt av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny guide för AI-agenter
**Denna version lägger till en omfattande guide för att distribuera AI-agenter med Azure Developer CLI.**

#### Lagt till
- **🤖 docs/microsoft-foundry/agents.md**: Komplett guide som täcker:
  - Vad AI-agenter är och hur de skiljer sig från chatbottar
  - Tre snabbstartsmallar för agenter (Foundry Agents, Prompty, RAG)
  - Agentarkitekturmönster (enkel agent, RAG, multi-agent)
  - Verktygskonfiguration och anpassning
  - Övervakning och mätvärdesuppföljning
  - Kostnadsöverväganden och optimering
  - Vanliga felsökningsscenarier
  - Tre praktiska övningar med framgångskriterier

#### Innehållsstruktur
- **Introduktion**: Agentkoncept för nybörjare
- **Snabbstart**: Distribuera agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmönster**: Visuella diagram över agentmönster
- **Konfiguration**: Verktygskonfiguration och miljövariabler
- **Övervakning**: Application Insights-integration
- **Övningar**: Progressivt praktiskt lärande (20–45 minuter vardera)

---

### [v3.12.0] - 2026-02-05

#### Uppdatering av DevContainer-miljö
**Denna version uppdaterar utvecklingscontainerns konfiguration med moderna verktyg och bättre standardinställningar för AZD-lärandeupplevelsen.**

#### Ändrat
- **🐳 Basbild**: Uppdaterad från `python:3.12-bullseye` till `python:3.12-bookworm` (senaste Debian-stabila)
- **📛 Containernamn**: Omdöpt från "Python 3" till "AZD for Beginners" för tydlighet

#### Lagt till
- **🔧 Nya Dev Container-funktioner**:
  - `azure-cli` med Bicep-stöd aktiverat
  - `node:20` (LTS-version för AZD-mallar)
  - `github-cli` för mallhantering
  - `docker-in-docker` för distribution av containerappar

- **🔌 Portvidarebefordran**: Förkonfigurerade portar för vanlig utveckling:
  - 8000 (MkDocs-förhandsvisning)
  - 3000 (Webbappar)
  - 5000 (Python Flask)
  - 8080 (API:er)

- **🧩 Nya VS Code-tillägg**:
  - `ms-python.vscode-pylance` - Förbättrad Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Stöd för Azure Functions
  - `ms-azuretools.vscode-docker` - Docker-stöd
  - `ms-azuretools.vscode-bicep` - Bicep-språkstöd
  - `ms-azure-devtools.azure-resource-groups` - Hantering av Azure-resurser
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-lintning
  - `bierner.markdown-mermaid` - Stöd för Mermaid-diagram
  - `redhat.vscode-yaml` - YAML-stöd (för azure.yaml)
  - `eamodio.gitlens` - Git-visualisering
  - `mhutchie.git-graph` - Git-historik

- **⚙️ VS Code-inställningar**: Lagt till standardinställningar för Python-tolk, formatering vid sparande och borttagning av blanksteg

- **📦 Uppdaterade requirements-dev.txt**:
  - La till MkDocs minify-plugin
  - La till pre-commit för kodkvalitet
  - La till Azure SDK-paket (azure-identity, azure-mgmt-resource)

#### Fixat
- **Post-Create Command**: Verifierar nu AZD- och Azure CLI-installation vid containerstart

---

### [v3.11.0] - 2026-02-05

#### README omarbetad för nybörjare
**Denna version förbättrar README.md avsevärt för att vara mer tillgänglig för nybörjare och lägger till viktiga resurser för AI-utvecklare.**

#### Lagt till
- **🆚 Jämförelse Azure CLI vs AZD**: Tydlig förklaring av när man ska använda varje verktyg med praktiska exempel
- **🌟 Fantastiska AZD-länkar**: Direktlänkar till communityns mallgalleri och resurser för bidrag:
  - [Fantastiskt AZD-galleri](https://azure.github.io/awesome-azd/) - 200+ mallar redo för distribution
  - [Skicka in en mall](https://github.com/Azure/awesome-azd/issues) - Gemenskapsbidrag
- **🎯 Snabbstartsguide**: Förenklad 3-stegs introduktionssektion (Installera → Logga in → Distribuera)
- **📊 Navigeringstabell baserad på erfarenhet**: Tydlig vägledning om var man ska börja baserat på utvecklarens erfarenhet

#### Ändrat
- **README-struktur**: Omdisponerad för progressiv visning - viktig information först
- **Introduktionssektionen**: Omskriven för att förklara "The Magic of `azd up`" för fullständiga nybörjare
- **Duplikatinnehåll borttaget**: Tog bort duplicerad felsökningssektion
- **Felsökningskommandon**: Fixade referensen `azd logs` för att använda giltiga `azd monitor --logs`

#### Fixat
- **🔐 Autentiseringskommandon**: Lade till `azd auth login` och `azd auth logout` i cheat-sheet.md
- **Ogiltiga kommando-referenser**: Tog bort återstående `azd logs` från README:s felsökningssektion

#### Anteckningar
- **Omfattning**: Ändringar tillämpade på huvud-README.md och resources/cheat-sheet.md
- **Målgrupp**: Förbättringar specifikt inriktade på utvecklare nya till AZD

---

### [v3.10.0] - 2026-02-05

#### Uppdatering för korrekta Azure Developer CLI-kommandon
**Denna version korrigerar icke-existerande AZD-kommandon i hela dokumentationen och säkerställer att alla kodexempel använder giltig Azure Developer CLI-syntax.**

#### Fixat
- **🔧 Icke-existerande AZD-kommandon borttagna**: Omfattande granskning och korrigering av ogiltiga kommandon:
  - `azd logs` (finns inte) → ersatt med `azd monitor --logs` eller Azure CLI-alternativ
  - `azd service` subkommandon (finns inte) → ersatt med `azd show` och Azure CLI
  - `azd infra import/export/validate` (finns inte) → borttaget eller ersatt med giltiga alternativ
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes`-flaggor (finns inte) → borttagna
  - `azd provision --what-if/--rollback`-flaggor (finns inte) → uppdaterade för att använda `--preview`
  - `azd config validate` (finns inte) → ersatt med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (finns inte) → borttagna

- **📚 Filer uppdaterade med kommando-korrigeringar**:
  - `resources/cheat-sheet.md`: Storskalig översyn av kommandoöversikten
  - `docs/deployment/deployment-guide.md`: Fixade rollback- och distributionsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigerade avsnitt om logganalys
  - `docs/troubleshooting/common-issues.md`: Uppdaterade felsökningskommandon
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixade AZD-felsökningssektionen
  - `docs/getting-started/azd-basics.md`: Korrigerade övervakningskommandon
  - `docs/getting-started/first-project.md`: Uppdaterade exempel på övervakning och felsökning
  - `docs/getting-started/installation.md`: Fixade hjälp- och versionsexempel
  - `docs/pre-deployment/application-insights.md`: Korrigerade kommandon för loggvisning
  - `docs/pre-deployment/coordination-patterns.md`: Fixade agentfelsökningskommandon

#### Ändrat
- **Rollback-strategier**: Uppdaterade dokumentationen för att använda Git-baserad rollback (AZD har ingen inbyggd rollback)
- **Loggvisning**: Ersatte referenser till `azd logs` med `azd monitor --logs`, `azd monitor --live` och Azure CLI-kommandon
- **Prestandasektionen**: Tog bort icke-existerande flaggor för parallell/incrementell distribution och gav giltiga alternativ

#### Tekniska detaljer
- **Giltiga AZD-kommandon**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Giltiga azd monitor-flaggor**: `--live`, `--logs`, `--overview`
- **Borttagna funktioner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Anteckningar
- **Verifiering**: Kommandon validerade mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Workshopslutförande och uppdatering av dokumentationskvalitet
**Denna version slutför de interaktiva workshopmodulerna, åtgärdar alla brutna dokumentationslänkar och förbättrar den övergripande innehållskvaliteten för AI-utvecklare som använder Microsoft AZD.**

#### Lagt till
- **📝 CONTRIBUTING.md**: Nyt dokument med riktlinjer för bidrag med:
  - Tydliga instruktioner för att rapportera problem och föreslå ändringar
  - Dokumentationsstandarder för nytt innehåll
  - Riktlinjer för kodexempel och konventioner för commit-meddelanden
  - Information om community-engagemang

#### Slutfört
- **🎯 Workshopmodul 7 (Avslutning)**: Fullt slutförd avslutningsmodul med:
  - Omfattande sammanfattning av workshopens resultat
  - Avsnitt om nyckelkoncept som täcker AZD, mallar och AI Foundry
  - Rekommendationer för fortsatt läranderesa
  - Workshoputmaningsövningar med svårighetsgrader
  - Länkar för community-feedback och support

- **📚 Workshopmodul 3 (Deconstruct)**: Uppdaterade lärandemål med:
  - Vägledning för aktivering av GitHub Copilot med MCP-servrar
  - Förståelse för AZD-mallens mappstruktur
  - Organiseringsmönster för Infrastructure-as-Code (Bicep)
  - Praktiska labbinstruktioner

- **🔧 Workshopmodul 6 (Teardown)**: Slutförd med:
  - Mål för resursstädning och kostnadshantering
  - Användning av `azd down` för säker avprovisionering av infrastruktur
  - Vägledning för återställning av mjukt raderade kognitiva tjänster
  - Extra utforskningsuppmaningar för GitHub Copilot och Azure Portal

#### Åtgärdat
- **🔗 Åtgärdade brutna länkar**: Löst 15+ brutna interna dokumentationslänkar:
  - `docs/ai-foundry/ai-model-deployment.md`: Åtgärdade sökvägar till microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerade sökvägar till ai-model-deployment.md och production-ai-practices.md
  - `docs/getting-started/first-project.md`: Ersatte icke-existerande cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Åtgärdade FAQ- och felsökningsguide-sökvägar
  - `examples/container-app/microservices/README.md`: Korrigerade kurshem- och deploy-guide-sökvägar
  - `resources/faq.md` och `resources/glossary.md`: Uppdaterade referenser i AI-kapitlet
  - `course-outline.md`: Åtgärdade referenser till instruktörsguide och AI-workshop-labbar

- **📅 Workshopstatusbanner**: Uppdaterad från "Under Construction" till aktiv workshopstatus med datum februari 2026

- **🔗 Workshopnavigering**: Korrigerade brutna navigeringslänkar i workshop README.md som pekade på icke-existerande lab-1-azd-basics-mapp

#### Ändrat
- **Workshoppresentation**: Tagit bort varningen "under construction", workshopen är nu komplett och redo att användas
- **Navigeringskonsistens**: Säkerställt att alla workshopmoduler har korrekt inter-modulnavigering
- **Referenser i lärvägar**: Uppdaterade kapitelkorsreferenser för att använda korrekta microsoft-foundry-sökvägar

#### Validerat
- ✅ Alla engelska markdown-filer har giltiga interna länkar
- ✅ Workshopmoduler 0–7 är kompletta med lärandemål
- ✅ Navigeringen mellan kapitel och moduler fungerar korrekt
- ✅ Innehållet är lämpligt för AI-utvecklare som använder Microsoft AZD
- ✅ Nybörjarvänligt språk och struktur bibehållet genomgående
- ✅ CONTRIBUTING.md ger tydlig vägledning för community-bidragsgivare

#### Teknisk implementering
- **Länkvalidering**: Automatiskt PowerShell-skript verifierade alla .md interna länkar
- **Innehållsgranskning**: Manuell granskning av workshopens fullständighet och lämplighet för nybörjare
- **Navigationssystem**: Konsekventa kapitel- och modulnavigeringsmönster tillämpade

#### Anteckningar
- **Omfattning**: Ändringar tillämpade endast i den engelska dokumentationen
- **Översättningar**: Översättningsmappar uppdaterades inte i denna version (automatisk översättning synkroniseras senare)
- **Workshopens varaktighet**: Komplett workshop erbjuder nu 3–4 timmars praktiskt lärande

---

### [v3.8.0] - 2025-11-19

#### Avancerad dokumentation: Övervakning, säkerhet och multi-agent-mönster
**Denna version lägger till omfattande lektioner av A-nivå om Application Insights-integration, autentiseringsmönster och multi-agent-koordinering för produktionsdistributioner.**

#### Lagt till
- **📊 Lektion om Application Insights-integration**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokuserad distribution med automatisk provisionering
  - Fullständiga Bicep-mallar för Application Insights + Log Analytics
  - Arbetande Python-applikationer med anpassad telemetri (1 200+ rader)
  - AI/LLM-övervakningsmönster (Azure OpenAI-token-/kostnadsspårning)
  - 6 Mermaid-diagram (arkitektur, distribuerad spårning, telemetriflöde)
  - 3 praktiska övningar (larm, dashboards, AI-övervakning)
  - Kusto-frågeexempel och strategier för kostnadsoptimering
  - Live-metrikströmning och felsökning i realtid
  - 40–50 minuters lärtid med produktionsklara mönster

- **🔐 Lektion om autentisering och säkerhetsmönster**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmönster (anslutningssträngar, Key Vault, managed identity)
  - Fullständiga Bicep-infrastrukturmallar för säkra distributioner
  - Node.js-applikationskod med Azure SDK-integration
  - 3 kompletta övningar (aktivera managed identity, user-assigned identity, Key Vault-rotation)
  - Säkerhetsbästa praxis och RBAC-konfigurationer
  - Felsökningsguide och kostnadsanalys
  - Produktionsklara lösenordsfria autentiseringsmönster

- **🤖 Lektion om multi-agent-koordinationsmönster**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinationsmönster (sekventiell, parallell, hierarkisk, händelsestyrd, konsensus)
  - Fullständig orkestratörtjänst-implementation (Python/Flask, 1 500+ rader)
  - 3 specialiserade agentimplementationer (Research, Writer, Editor)
  - Service Bus-integration för meddelandeköer
  - Cosmos DB state management för distribuerade system
  - 6 Mermaid-diagram som visar agentinteraktioner
  - 3 avancerade övningar (timeout-hantering, retry-logik, circuit breaker)
  - Kostnadsuppdelning ($240–565/month) med optimeringsstrategier
  - Application Insights-integration för övervakning

#### Förbättrat
- **Pre-deployment-kapitel**: Inkluderar nu omfattande övervaknings- och koordinationsmönster
- **Getting Started-kapitel**: Förstärkt med professionella autentiseringsmönster
- **Produktionsberedskap**: Komplett täckning från säkerhet till observerbarhet
- **Kursöversikt**: Uppdaterad för att referera de nya lektionerna i kapitel 3 och 6

#### Ändrat
- **Lärprogression**: Bättre integration av säkerhet och övervakning genom kursen
- **Dokumentationskvalitet**: Konsekventa A-nivåstandarder (95–97 %) över nya lektioner
- **Produktionsmönster**: Fullständig end-to-end-täckning för företagsdistributioner

#### Förbättrad
- **Utvecklarupplevelse**: Tydlig väg från utveckling till produktionsövervakning
- **Säkerhetsstandarder**: Professionella mönster för autentisering och hantering av hemligheter
- **Observerbarhet**: Fullständig Application Insights-integration med AZD
- **AI-arbetslaster**: Specialiserad övervakning för Azure OpenAI och multi-agent-system

#### Validerat
- ✅ Alla lektioner innehåller komplett fungerande kod (inte utdrag)
- ✅ Mermaid-diagram för visuellt lärande (19 totalt över 3 lektioner)
- ✅ Praktiska övningar med verifieringssteg (9 totalt)
- ✅ Produktionsklara Bicep-mallar deployerbara via `azd up`
- ✅ Kostnadsanalys och optimeringsstrategier
- ✅ Felsökningsguider och bästa praxis
- ✅ Kunskapskontroller med verifieringskommandon

#### Dokumentationsgradering
- **docs/pre-deployment/application-insights.md**: - Omfattande guide för övervakning
- **docs/getting-started/authsecurity.md**: - Professionella säkerhetsmönster
- **docs/pre-deployment/coordination-patterns.md**: - Avancerade multi-agent-arkitekturer
- **Övergripande nytt innehåll**: - Konsekventa höga kvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + anpassad telemetri + distribuerad spårning
- **Autentisering**: Managed Identity + Key Vault + RBAC-mönster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Övervakning**: Live-metrik + Kusto-frågor + larm + dashboards
- **Kostnadshantering**: Sampling-strategier, retention-policys, budgetkontroller

### [v3.7.0] - 2025-11-19

#### Förbättringar av dokumentationskvalitet och nytt Azure OpenAI-exempel
**Denna version förbättrar dokumentationskvaliteten i hela förvaret och lägger till ett komplett Azure OpenAI-distributionsexempel med GPT-4-chattgränssnitt.**

#### Lagt till
- **🤖 Azure OpenAI Chat-exempel**: Komplett GPT-4-distribution med fungerande implementering i `examples/azure-openai-chat/`:
  - Fullständig Azure OpenAI-infrastruktur (GPT-4 modellutplacering)
  - Python-kommandoradschattgränssnitt med konversationshistorik
  - Key Vault-integration för säker lagring av API-nycklar
  - Spårning av tokenanvändning och kostnadsuppskattning
  - Hastighetsbegränsning och felhantering
  - Omfattande README med 35–45 minuters distributionsguide
  - 11 produktionsklara filer (Bicep-mallar, Python-app, konfiguration)
- **📚 Dokumentationsövningar**: Lagt till praktiska övningar i konfigurationsguiden:
  - Övning 1: Fler-miljö-konfiguration (15 minuter)
  - Övning 2: Övning i hemlighetshantering (10 minuter)
  - Tydliga framgångskriterier och verifieringssteg
- **✅ Deploy-verifiering**: Lagt till verifieringssektion i deploy-guiden:
  - Hälsokontrollprocedurer
  - Checklista för framgångskriterier
  - Förväntade utdata för alla deploy-kommandon
  - Snabbreferens för felsökning

#### Förbättrat
- **examples/README.md**: Uppdaterad till A-nivåkvalitet (93 %):
  - Lagt till azure-openai-chat i alla relevanta avsnitt
  - Uppdaterat antal lokala exempel från 3 till 4
  - Lagt till i AI Application Examples-tabellen
  - Integrerat i Quick Start för mellanliggande användare
  - Lagt till i Microsoft Foundry Templates-avsnittet
  - Uppdaterad jämförelsematris och teknologifyndavsnitt
- **Dokumentationskvalitet**: Förbättrad från B+ (87 %) → A- (92 %) i docs-mappen:
  - Lagt till förväntade utdata för kritiska kommandoexempel
  - Inkluderade verifieringssteg för konfigurationsändringar
  - Förbättrad praktisk inlärning med konkreta övningar

#### Ändrat
- **Lärprogression**: Bättre integration av AI-exempel för mellanliggande elever
- **Dokumentationsstruktur**: Mer handlingsbara övningar med tydliga resultat
- **Verifieringsprocess**: Explicit framgångskriterier tillagda i nyckelarbeten

#### Förbättrad
- **Utvecklarupplevelse**: Azure OpenAI-distribution tar nu 35–45 minuter (jämfört med 60–90 för mer komplexa alternativ)
- **Kostnadstransparens**: Tydliga kostnadsuppskattningar ($50–200/month) för Azure OpenAI-exemplet
- **Lärväg**: AI-utvecklare har en tydlig ingång med azure-openai-chat
- **Dokumentationsstandarder**: Konsekventa förväntade utdata och verifieringssteg

#### Validerat
- ✅ Azure OpenAI-exempel fullt fungerande med `azd up`
- ✅ Alla 11 implementationsfiler är syntaktiskt korrekta
- ✅ README-instruktioner matchar faktisk distributionsupplevelse
- ✅ Dokumentationslänkar uppdaterade på 8+ platser
- ✅ Exempelindexet speglar korrekt 4 lokala exempel
- ✅ Inga dubbletter av externa länkar i tabeller
- ✅ Alla navigationsreferenser korrekta

#### Teknisk implementering
- **Azure OpenAI-arkitektur**: GPT-4 + Key Vault + Container Apps-mönster
- **Säkerhet**: Managed Identity redo, hemligheter i Key Vault
- **Övervakning**: Application Insights-integration
- **Kostnadshantering**: Token-spårning och användningsoptimering
- **Distribution**: Ett enda `azd up`-kommando för komplett setup

### [v3.6.0] - 2025-11-19

#### Större uppdatering: Exempel för distribution av Container Apps
**Denna version introducerar omfattande, produktionsredo exempel för distribution av containerapplikationer med Azure Developer CLI (AZD), med full dokumentation och integration i lärvägen.**

#### Lagt till
- **🚀 Container App-exempel**: Nya lokala exempel i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett översikt över containeriserade distributioner, snabbstart, produktion och avancerade mönster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybörjarvänligt REST-API med scale-to-zero, health probes, övervakning och felsökning
  - [Microservices Architecture](../../examples/container-app/microservices): Produktionsredo multi-service-distribution (API Gateway, Product, Order, User, Notification), asynkron messaging, Service Bus, Cosmos DB, Azure SQL, distribuerad spårning, blue-green/canary-deploy
- **Bästa praxis**: Säkerhet, övervakning, kostnadsoptimering och CI/CD-vägledning för containeriserade arbetslaster
- **Kodexempel**: Fullständiga `azure.yaml`, Bicep-mallar och tjänsteimplementationer i flera språk (Python, Node.js, C#, Go)
- **Testning & felsökning**: Slut-till-slut-testscenarier, övervakningskommandon, felsökningsvägledning

#### Ändrat
- **README.md**: Uppdaterad för att lyfta fram och länka nya container app-exempel under "Local Examples - Container Applications"
- **examples/README.md**: Uppdaterad för att framhäva container app-exempel, lägga till poster i jämförelsematrisen och uppdatera teknik-/arkitekturreferenser
- **Kursöversikt & Studieguide**: Uppdaterad för att referera till nya exempel på containerappar och distributionsmönster i relevanta kapitel

#### Validerat
- ✅ Alla nya exempel kan distribueras med `azd up` och följer bästa praxis
- ✅ Dokumentationens korslänkar och navigering uppdaterade
- ✅ Exemplen täcker nybörjar- till avancerade scenarier, inklusive produktionsmikrotjänster

#### Anteckningar
- **Omfattning**: Endast engelska dokumentation och exempel
- **Nästa steg**: Utöka med ytterligare avancerade containermönster och CI/CD-automation i framtida utgåvor

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Denna version genomför en omfattande ändring av produktnamnet från "Microsoft Foundry" till "Microsoft Foundry" i all engelsk dokumentation, vilket återspeglar Microsofts officiella omprofilering.**

#### Ändrat
- **🔄 Uppdatering av produktnamn**: Fullständig ommärkning från "Microsoft Foundry" till "Microsoft Foundry"
  - Uppdaterade alla referenser i den engelska dokumentationen i mappen `docs/`
  - Omdöpt mapp: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdöpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innehållsreferenser uppdaterade i 7 dokumentationsfiler

- **📁 Ändringar i mappstruktur**:
  - `docs/ai-foundry/` omdöpt till `docs/microsoft-foundry/`
  - Alla korsreferenser uppdaterade för att återspegla den nya mappstrukturen
  - Navigeringslänkar validerade i hela dokumentationen

- **📄 Filomdöpningar**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alla interna länkar uppdaterade för att referera till det nya filnamnet

#### Uppdaterade filer
- **Kapitel-dokumentation** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigeringslänkar uppdaterade
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnamnsreferenser uppdaterade
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Använder redan Microsoft Foundry (från tidigare uppdateringar)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referenser uppdaterade (översikt, gemenskapsfeedback, dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 korsreferenslänkar uppdaterade
  - `docs/getting-started/first-project.md` - 2 kapitelnavigeringslänkar uppdaterade
  - `docs/getting-started/installation.md` - 2 länkar till nästa kapitel uppdaterade
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referenser uppdaterade (navigering, Discord-community)
  - `docs/troubleshooting/common-issues.md` - 1 navigeringslänk uppdaterad
  - `docs/troubleshooting/debugging.md` - 1 navigeringslänk uppdaterad

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referenser uppdaterade (kursöversikt, kapiteltitlar, avsnittet om mallar, communityinsikter)
  - `course-outline.md` - 14 referenser uppdaterade (översikt, lärandemål, kapitelresurser)

#### Validerat
- ✅ Inga återstående mappreferenser till "ai-foundry" i de engelska dokumenten
- ✅ Inga återstående produktnamnsreferenser till "Microsoft Foundry" i de engelska dokumenten
- ✅ Alla navigeringslänkar fungerar med den nya mappstrukturen
- ✅ Omdöpning av filer och mappar slutförd framgångsrikt
- ✅ Korsreferenser mellan kapitel validerade

#### Anteckningar
- **Omfattning**: Ändringar tillämpade endast i den engelska dokumentationen i mappen `docs/`
- **Översättningar**: Översättningsmapparna (`translations/`) uppdaterades inte i denna version
- **Workshop**: Workshopmaterial (`workshop/`) uppdaterades inte i denna version
- **Exempel**: Exempelfiler kan fortfarande referera till äldre namngivning (åtgärdas i framtida uppdatering)
- **Externa länkar**: Externa URL:er och GitHub-referenser förblir oförändrade

#### Migreringsguide för bidragsgivare
Om du har lokala grenar eller dokumentation som refererar till den gamla strukturen:
1. Uppdatera mappreferenser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Uppdatera filreferenser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ersätt produktnamn: "Microsoft Foundry" → "Microsoft Foundry"
4. Validera att alla interna dokumentlänkar fortfarande fungerar

---

### [v3.4.0] - 2025-10-24

#### Förbättringar av infrastrukturförhandsvisning och validering
**Denna version introducerar omfattande stöd för den nya förhandsvisningsfunktionen i Azure Developer CLI och förbättrar workshop-användarupplevelsen.**

#### Tillagt
- **🧪 azd provision --preview Funktionsdokumentation**: Omfattande täckning av den nya förhandsvisningsfunktionen för infrastruktur
  - Kommandoreferens och användningsexempel i fusklappen
  - Detaljerad integration i provisioning-guiden med användningsfall och fördelar
  - Integration av förkontroll för säkrare distributionsvalidering
  - Uppdateringar i kom-igång-guiden med säkerhetsfokuserade distributionsrutiner
- **🚧 Workshop-statusbanderoll**: Professionell HTML-banner som visar workshopens utvecklingsstatus
  - Gradientdesign med byggindikatorer för tydlig användarkommunikation
  - Tidsstämpel för senast uppdaterad för transparens
  - Mobilanpassad design för alla enhetstyper

#### Förbättrat
- **Infrastruktursäkerhet**: Förhandsvisningsfunktionalitet integrerad i hela distributionsdokumentationen
- **Förvalidering före distribution**: Automatiserade skript inkluderar nu testning av infrastrukturförhandsvisning
- **Utvecklararbetsflöde**: Uppdaterade kommandosekvenser för att inkludera förhandsvisning som bästa praxis
- **Workshopupplevelse**: Tydliga förväntningar för användare om innehållets utvecklingsstatus

#### Ändrat
- **Bästa praxis för distribution**: Förhandsvisning-först arbetsflöde rekommenderas nu som tillvägagångssätt
- **Dokumentationsflöde**: Infrastrukturvalidering flyttad tidigare i inlärningsprocessen
- **Workshop-presentation**: Professionell statuskommunikation med tydlig utvecklingstidslinje

#### Förbättrat
- **Säkerhetsförst-tillvägagångssätt**: Infrastrukturförändringar kan nu valideras före distribution
- **Team-samarbete**: Förhandsvisningsresultat kan delas för granskning och godkännande
- **Kostnadsmedvetenhet**: Bättre förståelse för resurskostnader före provisionering
- **Riskreducering**: Minskade distributionsfel genom förhandsvalidering

#### Teknisk implementering
- **Integration över flera dokument**: Förhandsvisningsfunktionen dokumenterad i 4 nyckelfiler
- **Kommandomönster**: Konsekvent syntax och exempel i hela dokumentationen
- **Integrering av bästa praxis**: Förhandsvisning inkluderad i valideringsarbetsflöden och skript
- **Visuella indikatorer**: Tydliga NYA funktionsmarkeringar för upptäckbarhet

#### Workshopinfrastruktur
- **Statuskommunikation**: Professionell HTML-banner med gradientstil
- **Användarupplevelse**: Tydlig utvecklingsstatus förhindrar förvirring
- **Professionell presentation**: Bibehåller arkivets trovärdighet samtidigt som förväntningar sätts
- **Tidslinjetransparens**: Senast uppdaterad-tidsstämpel oktober 2025 för ansvarstagande

### [v3.3.0] - 2025-09-24

#### Förbättrade workshopmaterial och interaktiv inlärningsupplevelse
**Denna version introducerar omfattande workshopmaterial med webbläsarbaserade interaktiva guider och strukturerade lärvägar.**

#### Tillagt
- **🎥 Interaktiv workshopguide**: Webbläsarbaserad workshopupplevelse med MkDocs-förhandsvisningsfunktionalitet
- **📝 Strukturerade workshopinstruktioner**: 7-stegs guidad lärväg från upptäckt till anpassning
  - 0-Introduction: Workshopöversikt och uppsättning
  - 1-Select-AI-Template: Mallupptäckt och urvalsprocess
  - 2-Validate-AI-Template: Distributions- och valideringsprocedurer
  - 3-Deconstruct-AI-Template: Förstå mallens arkitektur
  - 4-Configure-AI-Template: Konfiguration och anpassning
  - 5-Customize-AI-Template: Avancerade modifieringar och iterationer
  - 6-Teardown-Infrastructure: Rensning och resurshantering
  - 7-Wrap-up: Sammanfattning och nästa steg
- **🛠️ Workshopverktyg**: MkDocs-konfiguration med Material-tema för förbättrad inlärningsupplevelse
- **🎯 Praktisk lärväg**: 3-stegsmetodik (Upptäckt → Distribution → Anpassning)
- **📱 GitHub Codespaces-integration**: Sömlös uppsättning av utvecklingsmiljö

#### Förbättrat
- **AI-workshoplab**: Utökat med en omfattande 2–3 timmars strukturerad inlärningsupplevelse
- **Workshopdokumentation**: Professionell presentation med navigering och visuella hjälpmedel
- **Inlärningsprogression**: Tydlig steg-för-steg-vägledning från mallval till produktionsdistribution
- **Utvecklarupplevelse**: Integrerade verktyg för förenklade utvecklingsarbetsflöden

#### Förbättrat
- **Tillgänglighet**: Webbläsargränssnitt med sök-, kopiera- och temaväxlingsfunktioner
- **Självstyrd inlärning**: Flexibel workshopstruktur som rymmer olika inlärningstakt
- **Praktisk tillämpning**: Verkliga AI-mall-distributionsscenarier
- **Gemenskapsintegration**: Discord-integration för workshopsupport och samarbete

#### Workshopfunktioner
- **Inbyggd sökfunktion**: Snabb sökning efter nyckelord och lektioner
- **Kopiera kodblock**: Funktion för att hovra och kopiera för alla kodexempel
- **Temaomkopplare**: Stöd för mörkt/ljust läge för olika preferenser
- **Visuella tillgångar**: Skärmdumpar och diagram för bättre förståelse
- **Hjälpintegration**: Direkt åtkomst till Discord för communitysupport

### [v3.2.0] - 2025-09-17

#### Större navigeringsomstrukturering och kapitelsbaserat lärsystem
**Denna version introducerar en omfattande kapitelsbaserad lärstruktur med förbättrad navigering i hela arkivet.**

#### Tillagt
- **📚 Kapitelsbaserat lärsystem**: Omstrukturerade hela kursen till 8 progressiva lärkapitel
  - Kapitel 1: Grundläggande & Snabbstart (⭐ - 30–45 min)
  - Kapitel 2: AI-först-utveckling (⭐⭐ - 1–2 timmar)
  - Kapitel 3: Konfiguration & Autentisering (⭐⭐ - 45–60 min)
  - Kapitel 4: Infrastruktur som kod & distribution (⭐⭐⭐ - 1–1,5 timmar)
  - Kapitel 5: Multi-agent AI-lösningar (⭐⭐⭐⭐ - 2–3 timmar)
  - Kapitel 6: Förvalidering före distribution & planering (⭐⭐ - 1 timme)
  - Kapitel 7: Felsökning & Debugging (⭐⭐ - 1–1,5 timmar)
  - Kapitel 8: Produktions- & företagsmönster (⭐⭐⭐⭐ - 2–3 timmar)
- **📚 Omfattande navigeringssystem**: Konsekventa navigeringshuvuden och sidfötter i hela dokumentationen
- **🎯 Framstegsspårning**: Checklista för kursavslut och system för lärandeverifiering
- **🗺️ Vägledning för lärväg**: Tydliga ingångspunkter för olika erfarenhetsnivåer och mål
- **🔗 Korsreferensnavigering**: Relaterade kapitel och förkunskapskrav tydligt länkade

#### Förbättrat
- **README-struktur**: Omvandlad till en strukturerad lärplattform med kapitelsbaserad organisering
- **Dokumentationsnavigering**: Varje sida inkluderar nu kapitelkontext och vägledning för progression
- **Mallorganisation**: Exempel och mallar kartlagda till lämpliga lärkapitel
- **Resursintegration**: Fusklappar, FAQs och studieguider kopplade till relevanta kapitel
- **Workshopintegration**: Praktiska labb kopplade till flera kapitelns lärmål

#### Ändrat
- **Inlärningsprogression**: Flyttad från linjär dokumentation till flexibel kapitelsbaserad inlärning
- **Konfigurationsplacering**: Konfigurationsguiden omplacerad till Kapitel 3 för bättre inlärningsflöde
- **AI-innehållsintegration**: Bättre integration av AI-specifikt innehåll genom hela inlärningsresan
- **Produktionsinnehåll**: Avancerade mönster konsoliderade i Kapitel 8 för företagsinriktade elever

#### Förbättrat
- **Användarupplevelse**: Tydlig brödsmulenavigering och indikatorer för kapitelprogression
- **Tillgänglighet**: Konsekventa navigeringsmönster för enklare kursgenomgång
- **Professionell presentation**: Universitetsliknande kursstruktur lämplig för akademisk och företagsutbildning
- **Inlärningseffektivitet**: Minskat tidsåtgång för att hitta relevant innehåll genom förbättrad organisering

#### Teknisk implementering
- **Navigeringshuvuden**: Standardiserad kapitelnavigering i över 40 dokumentationsfiler
- **Sidfotsnavigering**: Konsekvent vägledning för progression och indikatorer för kapitelavslut
- **Korslänkning**: Omfattande internt länkverk som förbinder relaterade koncept
- **Kapitelkartläggning**: Mallar och exempel tydligt kopplade till lärandemål

#### Förbättring av studieguide
- **📚 Omfattande lärandemål**: Omstrukturerad studieguide för att anpassas till 8-kapitelssystemet
- **🎯 Kapitelbaserad bedömning**: Varje kapitel inkluderar specifika lärandemål och praktiska övningar
- **📋 Framstegsspårning**: Veckoschema för inlärning med mätbara resultat och checklista för slutförande
- **❓ Bedömningsfrågor**: Kunskapsvalideringsfrågor för varje kapitel med professionella resultat
- **🛠️ Praktiska övningar**: Praktiska aktiviteter med verkliga distributionsscenarier och felsökning
- **📊 Kompetensutveckling**: Tydlig utveckling från grundläggande koncept till företagsmönster med fokus på karriärutveckling
- **🎓 Certifieringsramverk**: Professionella utvecklingsresultat och system för gemenskapsigenkänning
- **⏱️ Tidslinjehantering**: Strukturerad 10-veckors inlärningsplan med milstolpsvalidering

### [v3.1.0] - 2025-09-17

#### Förbättrade multi-agent AI-lösningar
**Denna version förbättrar multi-agent retail-lösningen med bättre agentnamngivning och förbättrad dokumentation.**

#### Ändrat
- **Multi-agentterminologi**: Ersatte "Cora agent" med "Customer agent" i hela detaljhandels multi-agentlösningen för tydligare förståelse
- **Agentarkitektur**: Uppdaterade all dokumentation, ARM-mallar och kodexempel för att använda konsekvent namngivning "Customer agent"
- **Konfigurationsexempel**: Moderniserade agentkonfigurationsmönster med uppdaterade namngivningskonventioner
- **Dokumentationskonsistens**: Säkrade att alla referenser använder professionella, beskrivande agentnamn

#### Förbättrat
- **ARM-mallspaket**: Uppdaterade retail-multiagent-arm-template med referenser till Customer agent
- **Arkitekturdiagram**: Uppdaterade Mermaid-diagram med uppdaterad agentnamngivning
- **Kodexempel**: Python-klasser och implementeringsexempel använder nu CustomerAgent-namngivning
- **Miljövariabler**: Uppdaterade alla distributionsskript för att använda CUSTOMER_AGENT_NAME-konventioner

#### Förbättrat
- **Utvecklarupplevelse**: Tydligare agentroller och ansvarsområden i dokumentationen
- **Produktionsberedskap**: Bättre anpassning till företagsnamngivningskonventioner
- **Lärmaterial**: Mer intuitiva agentnamn för utbildningsändamål
- **Mallanvändbarhet**: Förenklad förståelse av agentfunktioner och driftsättningsmönster

#### Tekniska detaljer
- Uppdaterade Mermaid-arkitekturdiagram med CustomerAgent-referenser
- Ersatte CoraAgent-klassnamn med CustomerAgent i Python-exempel
- Modifierade ARM-mallens JSON-konfigurationer för att använda "customer" agent-typ
- Uppdaterade miljövariabler från CORA_AGENT_* till CUSTOMER_AGENT_* mönster
- Uppdaterade alla driftsättningskommandon och containerkonfigurationer

### [v3.0.0] - 2025-09-12

#### Stora ändringar - AI-utvecklarfokus och Microsoft Foundry-integration
**Denna version förvandlar arkivet till en omfattande AI-fokuserad lärresurs med Microsoft Foundry-integration.**

#### Lagt till
- **🤖 AI-First Learning Path**: Fullständig omstrukturering som prioriterar AI-utvecklare och ingenjörer
- **Microsoft Foundry Integration Guide**: Omfattande dokumentation för att ansluta AZD till Microsoft Foundry-tjänster
- **AI Model Deployment Patterns**: Detaljerad vägledning som täcker modellval, konfiguration och produktionsdriftsättningsstrategier
- **AI Workshop Lab**: 2–3 timmars praktiskt workshop för att konvertera AI-applikationer till AZD-driftsättningsbara lösningar
- **Production AI Best Practices**: Företagsklara mönster för skalning, övervakning och säkring av AI-arbetslaster
- **AI-Specific Troubleshooting Guide**: Omfattande felsökningsguide för Azure OpenAI, Cognitive Services och AI-driftsättningsproblem
- **AI Template Gallery**: Utvald samling Microsoft Foundry-mallar med komplexitetsbetyg
- **Workshop Materials**: Komplett workshopstruktur med praktiska labbar och referensmaterial

#### Förbättrat
- **README Structure**: AI-utvecklarfokuserad med 45% communityintressedata från Microsoft Foundry Discord
- **Learning Paths**: Dedikerad AI-utvecklarresa parallellt med traditionella vägar för studenter och DevOps-ingenjörer
- **Template Recommendations**: Utvalda AI-mallar inklusive azure-search-openai-demo, contoso-chat, and openai-chat-app-quickstart
- **Community Integration**: Förbättrat Discord-communitystöd med AI-specifika kanaler och diskussioner

#### Säkerhet & Produktionsfokus
- **Managed Identity Patterns**: AI-specifika autentiserings- och säkerhetskonfigurationer
- **Cost Optimization**: Spårning av tokenanvändning och budgetkontroller för AI-arbetslaster
- **Multi-Region Deployment**: Strategier för global driftsättning av AI-applikationer
- **Performance Monitoring**: AI-specifika mätvärden och Application Insights-integration

#### Dokumentationskvalitet
- **Linear Course Structure**: Logisk progression från nybörjare till avancerade AI-driftsättningsmönster
- **Validated URLs**: Alla externa arkivlänkar verifierade och åtkomliga
- **Complete Reference**: Alla interna dokumentationslänkar validerade och fungerande
- **Production Ready**: Företagsdriftsättningsmönster med verkliga exempel

### [v2.0.0] - 2025-09-09

#### Stora ändringar - Arkivomstrukturering och professionell förbättring
**Denna version representerar en betydande översyn av arkivets struktur och innehållspresentation.**

#### Lagt till
- **Structured Learning Framework**: Alla dokumentationssidor innehåller nu Introduction, Learning Goals och Learning Outcomes-sektioner
- **Navigation System**: Lade till Previous/Next-lektionlänkar genom hela dokumentationen för vägledd lärandeprogression
- **Study Guide**: Omfattande study-guide.md med lärandemål, övningsuppgifter och bedömningsmaterial
- **Professional Presentation**: Tog bort alla emoji-ikoner för förbättrad tillgänglighet och ett mer professionellt utseende
- **Enhanced Content Structure**: Förbättrad organisation och flöde i lärmaterialen

#### Ändrat
- **Documentation Format**: Standardiserade all dokumentation med konsekvent lärandefokuserad struktur
- **Navigation Flow**: Implementerade logisk progression genom allt lärmaterial
- **Content Presentation**: Tog bort dekorativa element till förmån för tydlig, professionell formatering
- **Link Structure**: Uppdaterade alla interna länkar för att stödja det nya navigationssystemet

#### Förbättrat
- **Accessibility**: Tog bort beroenden av emoji för bättre skärmläsarkompatibilitet
- **Professional Appearance**: Ren, akademisk presentation lämplig för företagsutbildning
- **Learning Experience**: Strukturerat tillvägagångssätt med tydliga mål och resultat för varje lektion
- **Content Organization**: Bättre logiskt flöde och koppling mellan relaterade ämnen

### [v1.0.0] - 2025-09-09

#### Initialt släpp - Omfattande AZD-lärarkiv

#### Lagt till
- **Core Documentation Structure**
  - Komplett getting-started guide-serie
  - Omfattande dokumentation för driftsättning och provisionshantering
  - Detaljerade felsökningsresurser och debug-guider
  - Verktyg och procedurer för förvalidering inför driftsättning

- **Getting Started Module**
  - AZD Basics: Kärnkoncept och terminologi
  - Installation Guide: Plattformsspecifika installationsinstruktioner
  - Configuration Guide: Miljöinställning och autentisering
  - First Project Tutorial: Steg-för-steg praktiskt lärande

- **Deployment and Provisioning Module**
  - Deployment Guide: Komplett arbetsflödesdokumentation
  - Provisioning Guide: Infrastruktur som kod med Bicep
  - Bästa praxis för produktionsdriftsättningar
  - Multi-service arkitekturmönster

- **Pre-deployment Validation Module**
  - Capacity Planning: Validering av Azure-resursers tillgänglighet
  - SKU Selection: Omfattande vägledning för servicetierval
  - Pre-flight Checks: Automatiska valideringsskript (PowerShell och Bash)
  - Kostnadsuppskattning och budgetplaneringsverktyg

- **Troubleshooting Module**
  - Common Issues: Vanliga problem och lösningar
  - Debugging Guide: Systematiska felsökningsmetoder
  - Avancerade diagnostiska tekniker och verktyg
  - Prestandaövervakning och optimering

- **Resources and References**
  - Command Cheat Sheet: Snabbreferens för viktiga kommandon
  - Glossary: Omfattande terminologi- och förkortningsdefinitioner
  - FAQ: Utförliga svar på vanliga frågor
  - Externa resurslänkar och community-kontakter

- **Examples and Templates**
  - Simple Web Application-exempel
  - Mall för driftsättning av statisk webbplats
  - Konfiguration för containerapplikation
  - Databasintegrationsmönster
  - Microservices-arkitekturexempel
  - Serverless-funktionsimplementationer

#### Funktioner
- **Multi-Platform Support**: Installations- och konfigurationsguider för Windows, macOS och Linux
- **Multiple Skill Levels**: Innehåll utformat för studenter till professionella utvecklare
- **Practical Focus**: Praktiska exempel och verkliga scenarier
- **Comprehensive Coverage**: Från grundläggande koncept till avancerade företagsmönster
- **Security-First Approach**: Säkerhetsbästa praxis integrerad genomgående
- **Cost Optimization**: Råd för kostnadseffektiva driftsättningar och resursstyrning

#### Dokumentationskvalitet
- **Detailed Code Examples**: Praktiska, testade kodexempel
- **Step-by-Step Instructions**: Tydlig, handlingsbar vägledning
- **Comprehensive Error Handling**: Felsökning för vanliga problem
- **Best Practices Integration**: Branschstandarder och rekommendationer
- **Version Compatibility**: Uppdaterad med senaste Azure-tjänsterna och azd-funktionerna

## Planerade framtida förbättringar

### Version 3.1.0 (Planerad)
#### AI-plattformsutvidgning
- **Multi-Model Support**: Integrationsmönster för Hugging Face, Azure Machine Learning och egna modeller
- **AI Agent Frameworks**: Mallar för LangChain, Semantic Kernel och AutoGen-driftsättningar
- **Advanced RAG Patterns**: Vektorbasalternativ utöver Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Förbättrad övervakning för modellprestanda, tokenanvändning och svarskvalitet

#### Utvecklarupplevelse
- **VS Code Extension**: Integrerad AZD + AI Foundry-utvecklingsupplevelse
- **GitHub Copilot Integration**: AI-assisterad AZD-mallgenerering
- **Interactive Tutorials**: Praktiska kodningsövningar med automatisk validering för AI-scenarier
- **Video Content**: Kompletterande videotutorials för visuella elever med fokus på AI-driftsättningar

### Version 4.0.0 (Planerad)
#### Företags-AI-mönster
- **Governance Framework**: AI-modellstyrning, efterlevnad och revisionsspår
- **Multi-Tenant AI**: Mönster för att betjäna flera kunder med isolerade AI-tjänster
- **Edge AI Deployment**: Integration med Azure IoT Edge och containerinstanser
- **Hybrid Cloud AI**: Multi-cloud och hybriddriftsättningsmönster för AI-arbetslaster

#### Avancerade funktioner
- **AI Pipeline Automation**: MLOps-integration med Azure Machine Learning-pipelines
- **Advanced Security**: Zero-trust-mönster, privata endpoints och avancerat hotsskydd
- **Performance Optimization**: Avancerad tuning och skalningsstrategier för höggenomströmmande AI-applikationer
- **Global Distribution**: Innehållsleverans och edge-caching-mönster för AI-applikationer

### Version 3.0.0 (Planerad) - Överskridet av aktuell utgåva
#### Föreslagna tillägg - Nu implementerat i v3.0.0
- ✅ **AI-Focused Content**: Omfattande Microsoft Foundry-integration (Slutförd)
- ✅ **Interactive Tutorials**: Praktiskt AI-workshoplab (Slutförd)
- ✅ **Advanced Security Module**: AI-specifika säkerhetsmönster (Slutförd)
- ✅ **Performance Optimization**: Tuningstrategier för AI-arbetslaster (Slutförd)

### Version 2.1.0 (Planerad) - Delvis implementerat i v3.0.0
#### Mindre förbättringar - Några slutförda i nuvarande utgåva
- ✅ **Additional Examples**: AI-fokuserade driftsättningsscenarier (Slutförd)
- ✅ **Extended FAQ**: AI-specifika frågor och felsökning (Slutförd)
- **Tool Integration**: Förbättrade IDE- och redigerarintegrationsguider
- ✅ **Monitoring Expansion**: AI-specifik övervakning och larmmönster (Slutförd)

#### Fortfarande planerat för framtida utgåva
- **Mobile-Friendly Documentation**: Responsiv design för mobilinlärning
- **Offline Access**: Nedladdningsbara dokumentationspaket
- **Enhanced IDE Integration**: VS Code-extension för AZD + AI-arbetsflöden
- **Community Dashboard**: Realtidscommunity-mått och bidragsspårning

## Bidra till ändringsloggen

### Rapportera ändringar
När du bidrar till detta arkiv, vänligen säkerställ att ändringsnoteringar innehåller:

1. **Version Number**: Enligt semantisk versionering (major.minor.patch)
2. **Date**: Utgivnings- eller uppdateringsdatum i formatet YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Kortfattad beskrivning av vad som ändrats
5. **Impact Assessment**: Hur ändringarna påverkar befintliga användare

### Ändringskategorier

#### Lagt till
- Nya funktioner, dokumentationssektioner eller kapaciteter
- Nya exempel, mallar eller lärresurser
- Ytterligare verktyg, skript eller hjälpprogram

#### Ändrat
- Modifieringar av befintlig funktionalitet eller dokumentation
- Uppdateringar för att förbättra tydlighet eller noggrannhet
- Omstrukturering av innehåll eller organisation

#### Föråldrat
- Funktioner eller tillvägagångssätt som fasas ut
- Dokumentationssektioner planerade för borttagning
- Metoder som har bättre alternativ

#### Borttaget
- Funktioner, dokumentation eller exempel som inte längre är relevanta
- Föråldrad information eller föråldrade tillvägagångssätt
- Redundant eller konsoliderat innehåll

#### Fikserat
- Korrigeringar av fel i dokumentation eller kod
- Lösning av rapporterade problem eller buggar
- Förbättringar av noggrannhet eller funktionalitet

#### Säkerhet
- Säkerhetsrelaterade förbättringar eller fixar
- Uppdateringar till säkerhetsbästa praxis
- Åtgärder för säkerhetsbrister

### Riktlinjer för semantisk versionering

#### Major Version (X.0.0)
- Brytande ändringar som kräver användaråtgärd
- Betydande omstrukturering av innehåll eller organisation
- Ändringar som förändrar grundläggande angreppssätt eller metodologi

#### Minor Version (X.Y.0)
- Nya funktioner eller innehållstillägg
- Förbättringar som bibehåller bakåtkompatibilitet
- Ytterligare exempel, verktyg eller resurser

#### Patch Version (X.Y.Z)
- Buggfixar och korrigeringar
- Mindre förbättringar av befintligt innehåll
- Förtydliganden och små förbättringar

## Community-feedback och förslag

Vi uppmuntrar aktivt community-feedback för att förbättra denna lärresurs:

### Hur man lämnar feedback
- **GitHub Issues**: Rapportera problem eller föreslå förbättringar (AI-specifika problem välkomnas)
- **Discord Discussions**: Dela idéer och engagera dig med Microsoft Foundry-communityt
- **Pull Requests**: Bidra med direkta förbättringar av innehåll, särskilt AI-mallar och guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen för AZD + AI-diskussioner
- **Community Forums**: Delta i bredare Azure-utvecklardiskussioner

### Feedbackkategorier
- **AI Content Accuracy**: Korrigeringar av AI-tjänsteintegration och driftsättningsinformation
- **Learning Experience**: Förslag för förbättrat AI-utvecklarlärflöde
- **Missing AI Content**: Förfrågningar om fler AI-mallar, mönster eller exempel
- **Accessibility**: Förbättringar för olika inlärningsbehov
- **AI Tool Integration**: Förslag för bättre integration av AI-utvecklingsarbetsflöden
- **Production AI Patterns**: Förfrågningar om företags-AI-driftsättningsmönster

### Svarsåtagande
- **Issue Response**: Inom 48 timmar för rapporterade problem
- **Feature Requests**: Utvärdering inom en vecka
- **Community Contributions**: Granskning inom en vecka
- **Security Issues**: Omedelbar prioritet med påskyndat svar

## Underhållsschema

### Regelbundna uppdateringar
- **Monthly Reviews**: Innehållsnoggrannhet och länkvalidering
- **Quarterly Updates**: Större innehållstillägg och förbättringar
- **Semi-Annual Reviews**: Omfattande omstrukturering och förbättringar
- **Annual Releases**: Större versionsuppdateringar med betydande förbättringar

### Övervakning och kvalitetssäkring
- **Automated Testing**: Regelbunden validering av kodexempel och länkar
- **Community Feedback Integration**: Regelbunden inarbetning av användarförslag
- **Technology Updates**: Anpassning till senaste Azure-tjänster och azd-release
- **Accessibility Audits**: Regelbunden granskning för inkluderande designprinciper

## Versionssupportpolicy

### Aktuell versionssupport
- **Latest Major Version**: Fullt stöd med regelbundna uppdateringar
- **Previous Major Version**: Säkerhetsuppdateringar och kritiska fixar i 12 månader
- **Legacy Versions**: Endast community-stöd, inga officiella uppdateringar

### Migreringsvägledning
När större versioner släpps, tillhandahåller vi:
- **Migreringsguider**: Steg-för-steg-instruktioner för övergång
- **Kompatibilitetsanteckningar**: Detaljer om brytande ändringar
- **Verktygsstöd**: Skript eller verktyg som hjälper till med migreringen
- **Communitystöd**: Dedikerade forum för frågor om migrering

---

**Navigering**
- **Föregående lektion**: [Studieguide](resources/study-guide.md)
- **Nästa lektion**: Gå tillbaka till [Huvud-README](README.md)

**Håll dig uppdaterad**: Bevaka detta repository för aviseringar om nya utgåvor och viktiga uppdateringar av inlärningsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess ursprungsspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller felaktiga tolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->