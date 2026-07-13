# Endringslogg - AZD For Beginners

## Introduksjon

Denne endringsloggen dokumenterer alle betydelige endringer, oppdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere med å forstå hva som har endret seg mellom versjoner.

## Læringsmål

Ved å gå gjennom denne endringsloggen vil du:
- Holdes oppdatert om nye funksjoner og nye innholdstilføyelser
- Forstå forbedringer gjort i eksisterende dokumentasjon
- Følge opp feilrettinger og korrigeringer for å sikre nøyaktighet
- Følge utviklingen av læringsmaterialene over tid

## Læringsresultater

Etter å ha gjennomgått endringsloggoppføringene vil du kunne:
- Identifisere nytt innhold og ressurser tilgjengelig for læring
- Forstå hvilke seksjoner som har blitt oppdatert eller forbedret
- Planlegge læringsveien din basert på det mest oppdaterte materialet
- Bidra med tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Oppdatering: Versjonsaktualitet
**Denne versjonen bekrefter kurset mot `azd` `1.27.1` (juli 2026, nyeste stabile utgivelse) og den nåværende preview AI agent-utvidelsen `azure.ai.agents` `1.0.0-beta.5`, og oppdaterer dermed alle "validert mot"-bannerne etter utgivelsene 1.26.0, 1.27.0 og 1.27.1.**

#### Endret
- **✅ Valideringsgrunnlag oppdatert** fra `azd 1.25.6` (juni 2026) til `azd 1.27.1` (juli 2026) i roten README, alle kapittel-READMEer, kapittel 1 dev-container-leksjonen (inkludert eksempler med fastsatt versjon), kapittel 4 custom-templates-leksjonen, kapittel 5 multi-agent-leksjonen og workshop-dokumentasjonen
- **🤖 Kapittel 2 grunnlag oppdatert** fra `azd 1.23.12` (mars 2026) til `azd 1.27.1` i `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` og `microsoft-foundry-integration.md`; valideringsnotat datoer oppdatert til 2026-07-13
- **🧩 AI agent-utvidelsen oppgradert** fra `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` til nåværende `1.0.0-beta.5` versjon i kapittel 2 README og `agents.md`
- **🧪 Workshop-valideringseksempel** (`azd version` output) oppdatert til `1.27.1`

#### Notater om relevante azd-utgivelser (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-støtte for Azure Functions på Flex Consumption, `azd config sub-filter` per-tenant abonnementfiltre, selvstendige utvidelsespakker (`azd x pack --bundle`) og `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellering av Azure AI Foundry prosjekter/agenter direkte i `azure.yaml` (init uten Bicep/Terraform), containerutrulling for App Service (`host: appservice` + `language: docker`), direkte `-s/--source` for `azd extension` kommandoer, og `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flagg for `azd extension install`, utgåtte modeller ekskludert fra katalog-/kvoteringsspørringer som standard, og flere feilrettinger

#### Oppdaterte filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Nybegynnerutfylling #2: Malforfatting, Dev Containers, Pulumi, Azure DevOps, Service Principals og mer
**Denne versjonen lukker de gjenværende mellomliggende hullene som ble avdekket av azd-dekninganalysen: hvordan lage og publisere din egen mal, reproduserbare dev-container/Codespaces-miljøer, Pulumi-infrastrukturleverandøren, gjennomgang av Azure DevOps CI/CD, service-principal-autentisering, veiledning om host-valg (AKS/Spring Apps), forklaringer av `azd restore`/`azd package`, feilbehandling i hooks, og team-/delt miljøpraksis.**

#### Tilføyd
- **🧱 Ny kapittel 4 leksjon** `docs/chapter-04-infrastructure/custom-templates.md` — hvordan lage din egen azd-mal: nødvendig struktur (`azure.yaml`, `infra/`, `src/`), `metadata.template` feltet, parameterisering av infrastruktur med `uniqueString()` ressurs-tokener og `azd-env-name` tag, testing lokalt med `azd init --template <local-path>`, publisering til GitHub, og innsending til Awesome AZD-galleriet
- **📦 Ny kapittel 1 leksjon** `docs/chapter-01-foundation/dev-containers.md` — reproduserbare azd-miljøer med Dev Containers og GitHub Codespaces: en minimal `.devcontainer/devcontainer.json` som bruker offisiell `ghcr.io/azure/azure-dev/azd` funksjon, språkspesifikke funksjoner, `docker-in-docker` for container-vertsmaskiner og `azd auth login --use-device-code` for fjerninnlogging
- **🧩 Pulumi med azd** seksjon i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-mappelayout, stakker koblet til azd-miljøer, nødvendige utdata/tagging og identisk `azd up` / `azd down` arbeidsflyt
- **🎯 Veiledning for host-valg** i `docs/chapter-04-infrastructure/provisioning.md` — en nybegynnervennlig sammenligning av `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` og `springapp`, med veiledning om når man skal velge AKS eller Azure Spring Apps
- **🛠️ Gjennomgang av Azure DevOps CI/CD** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, tjenestetilknytning med workload identity federation (OIDC), generert `azure-dev.yml`, og oppsett av variabelgruppe
- **🔑 Service Principals (Mønster 4)** lagt til i `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ikke-interaktiv `azd auth login` med klienthemmelighet vs. federerte/OIDC-legitimasjoner, når det skal brukes og sikker oppbevaring av legitimasjon
- **🪝 Feilhåndtering i hooks** delseksjon i `docs/chapter-04-infrastructure/deployment-guide.md` — exit-koder og `set -e`, `continueOnError`, testing av hooks isolert med `azd hooks run`, OS-spesifikke shell og `--debug`
- **👥 Team-/delte miljøer** seksjon i `docs/chapter-03-configuration/configuration.md` — hva som finnes i `.azure/`, hva som skal gitignores, utvikler-spesifikke miljøer, `azd env list`/`select`, og å gi miljøverdier i CI/CD
- **🧰 Forklaringer av `azd restore` og utvidet `azd package`** i `resources/cheat-sheet.md` — gjenopprettelse av avhengigheter og bygging av et deployerbart artefakt uten å deployere

#### Endret
- **🧭 Kapittel 4 leksjonstabell** oppdatert for å inkludere den nye "Authoring Your Own Template"-leksjonen (Leksjon 3)
- **🧭 Kapittel 1 leksjonstabell** oppdatert for å inkludere den nye "Dev Containers & Codespaces" leksjonen (Leksjon 5); navigeringsfootere koblet mellom `bring-your-own-app.md` og `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Nybegynnerutfylling: Praktisk Multi-Agent-leksjon, "Bring Your Own App," Terraform og CI/CD-gjennomgang
**Denne versjonen lukker de største hullene for en komplett nybegynnerguide ved å legge til to nye praktiske leksjoner (en deployerbar multi-agent gjennomgang og å legge til azd i en eksisterende app), en nybegynnervennlig introduksjon til hooks, en Terraform-med-azd-seksjon, steg-for-steg gjennomgang av GitHub Actions-pipeline, forklaring av nye preview-utvidelser og en eksplisitt sjekkliste for deployeringsverifisering.**

#### Tilføyd
- **🤝 Ny kapittel 5 leksjon** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en fullstendig praktisk, deployerbar to-agent gjennomgang (orchestrator + spesialister) med en ekte mal (`contoso-creative-writer`), som dekker når man skal bruke multi-agent, `azd up` arbeidsflyt, forståelse av deployerte ressurser, kryss-agent-tracing, tilpasning og opprydding
- **📦 Ny kapittel 1 leksjon** `docs/chapter-01-foundation/bring-your-own-app.md` — hvordan legge til azd i et eksisterende prosjekt med `azd init` ("bruk kode i nåværende katalog"), forståelse av `azure.yaml` og `infra/`, `azd infra generate`, host-detektering og deploy med `azd up`
- **🌐 Terraform med azd** seksjon lagt til i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfigurasjon, `.tf` mappelayout, nødvendige `AZURE_*` utdata og `azd-env-name` tagging, og identisk `azd up` / `azd down` arbeidsflyt (lukker hullet hvor Terraform-støtte ble påstått, men kun Bicep ble vist)
- **⚙️ Steg-for-steg GitHub Actions gjennomgang** i `docs/chapter-08-production/production-ai-practices.md` — fra GitHub repo til automatiske deployer: `azd pipeline config`, OIDC-federerte legitimasjoner (ingen lagrede hemmeligheter), generert `azure-dev.yml` og veiledning om hemmeligheter vs. variabler
- **🪝 Nybegynner "Ny til hooks?" introduksjon** i `docs/chapter-04-infrastructure/deployment-guide.md` — hva en hook er, tabell over hook-faser, en minimal første hook, og kjøring av hooks manuelt med `azd hooks run`
- **✅ "Verifiser din deployering" sjekkliste** lagt til i trinn 5 av `docs/chapter-01-foundation/first-project.md` — røyk-test, sjekk av helseendepunkt og eksplisitte suksesskriterier
- **🧩 Forklaring av nye preview-utvidelser** `azure.ai.skills` og `azure.ai.connections` (hva de er og når man bør bruke dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Endret
- **🧭 Kapittel 5 leksjonstabell** korrigert: `multi-agent-basics.md` er nå Leksjon 1 (den eneste fullstendig praktiske leksjonen), med tydelig angivelse av at Leksjon 2 finnes i kapittel 6 og at Retail-scenariet er en arkitekturmal, ikke en en-kommando-mal
- **🧭 Kapittel 1 leksjonstabell** inkluderer nå den nye "Bring Your Own App" leksjonen (Leksjon 4)
- **🔗 Navigeringsfootere** oppdatert: `first-project.md` lenker nå fremover til `bring-your-own-app.md`

#### Rettet
- **🧱 Lukket det "påståtte men manglende" Terraform-hullet** — kurset refererte tidligere til Terraform-støtte uten å vise det
- **🔀 Korrigerte misvisende krysslenker i kapittel 5** som ga inntrykk av at en full multi-agent-implementasjon eksisterte, når det kun var en arkitekturmal

#### Oppdaterte filer
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(ny)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(ny)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Oppdatering, Full Agent Livssyklus-Kommandoer & Aspire Rebranding

**Denne versjonen revaliderer kurset mot `azd` `1.25.6` (juni 2026) og utvidelsen `azure.ai.agents` `0.1.40-preview`, utvider AI-veiledning fra "skaler et agent" til hele agentens livssyklus (test → evaluer → optimaliser → inspiser → slett), introduserer de nye forhåndsvisningsutvidelsene `azure.ai.skills` og `azure.ai.connections`, og nevner produktrebrandingen fra ".NET Aspire" til "Aspire".**

#### Lagt til
- **🔁 Full dekning av agentens livssyklus** for nybegynnere og AI-ingeniører i hele dokumentasjonen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livssyklus-tabell (skaler opp → test → mål → forbedre → inspiser → rydd opp) lagt til i seksjonen for Extensions og AI-kommandoer
  - `docs/chapter-08-production/production-ai-practices.md` — Ny seksjon "Håndtere agentens livssyklus" som dekker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
  - `resources/cheat-sheet.md` — Utvidet AI Agent Commands med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
- **🧩 Nye forhåndsvisningsutvidelser** dokumentert: `azure.ai.skills` (gjenbrukbare agentferdigheter) og `azure.ai.connections` (Foundry-tilkoblinger) lagt til i utvidelsestabellen og jukselappen
- **⏱️ Veiledning for responstid** — eksempler på `azd ai agent invoke` nevner nå at den skriver ut total latenstid og tid-til-første-byte
- **📌 Versjonsbanner** i rot-README som peker brukere til `azd version` og `azd upgrade`

#### Endret
- **✅ Valideringsgrunnlag oppdatert** fra `azd 1.23.12` (mars 2026) til `azd 1.25.6` (juni 2026) i alle kapittel-README-er og workshop-dokumentasjon
- **🤖 Utvidelsesnotat for kapittel 2** oppdatert fra `azure.ai.agents` `0.1.18-preview` til `0.1.40-preview`
- **🧪 Workshop valideringseksempel** (`azd version` output) oppdatert til `1.25.6`
- **🧭 README "Hva er nytt i azd i dag"** oppdatert for å fremheve agentens ende-til-ende livssyklus, nye AI-utvidelser og nylige forbedringer i brukervennlighet (`azd init` idempotens, `azd auth login` rydding av utdaterte token, `azd tool` førstegangs-prompt)
- **📖 Kapittel 2 agents.md (Valg 4)** peker nå brukere mot post-distribusjon livssykluskommandoer i stedet for å stoppe ved `azd up`

#### Fikset
- **🏷️ Produktnavn** — lagt til en Aspire rebrand-notat (".NET Aspire" heter nå rett og slett "Aspire"); azd sin støtte for Aspire er uendret
- **🔎 Live release validering** bekreftet mot Azure Developer CLI sin release feed: stabil CLI `1.25.6` (2026-06-12) og `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Oppdaterte filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### Klarering for nybegynnere, validering av oppsett og siste rydding av AZD-kommandoer
**Denne versjonen følger opp AZD 1.23 valideringsrunden med et dokumentasjonspass fokusert på nybegynnere: den klargjør autentiseringsveiledning med AZD som førstevalg, legger til lokale skript for oppsettsvalidering, verifiserer nøkkelkommandoer mot den levende AZD CLI, og fjerner de siste foreldede engelskspråklige kommando-referansene utenfor changelog.**

#### Lagt til
- **🧪 Valideringsskript for nybegynneroppsett** med `validate-setup.ps1` og `validate-setup.sh` slik at brukere kan bekrefte nødvendige verktøy før kapittel 1 startes
- **✅ Forhåndskontroll av oppsett** i rot-README og kapittel 1 README for å fange manglende forutsetninger før `azd up`

#### Endret
- **🔐 Autentiseringsveiledning for nybegynnere** behandler nå konsekvent `azd auth login` som hovedvei for AZD arbeidsflyter, med `az login` som valgfritt med mindre Azure CLI brukes direkte
- **📚 Kapittel 1 onboarding-flyt** peker nå brukere mot validering av deres lokale oppsett før installasjon, autentisering og første distribusjonstrinn
- **🛠️ Validator-meldinger** skiller nå tydelig krav som blokkerer fra valgfrie Azure CLI-varsler for bare-AZD-nybegynnerveien
- **📖 Konfigurasjon, feilsøking og eksempeldokumenter** skiller nå mellom påkrevd AZD-autentisering og valgfri Azure CLI-pålogging der begge tidligere ble presentert uten kontekst

#### Fikset
- **📋 Gjenstående engelskspråklige kommando-referanser** oppdatert til nåværende AZD former, inkludert `azd config show` i jukselappen og `azd monitor --overview` der veiledning for Azure Portal oversikt var tiltenkt
- **🧭 Nybegynnerpåstander i kapittel 1** myknet for å unngå overlover om garantert feilfri eller rollback-adferd på tvers av alle maler og Azure-ressurser
- **🔎 Live CLI validering** bekreftet nåværende støtte for `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, og `azd down --force --purge`

#### Oppdaterte filer
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### AZD 1.23.12 validering, utvidelse av workshop-miljø og oppdatering av AI-modell
**Denne versjonen utfører en dokumentasjonsvalideringsrunde mot `azd` `1.23.12`, oppdaterer utdatert AZD-kommandoeksempler, oppfrisker AI-modell-veiledning til gjeldende standarder, og utvider workshop-instruksjoner utover GitHub Codespaces til også å støtte dev containers og lokale kloner.**

#### Lagt til
- **✅ Valideringsnotater på tvers av kjernekapitler og workshop-dokumentasjon** for å gjøre den testede AZD-baselinen eksplisitt for brukere som bruker nyere eller eldre CLI-versjoner
- **⏱️ Veiledning for tidsavbrudd ved distribusjon** for langvarige AI-app-distribusjoner med `azd deploy --timeout 1800`
- **🔎 Trinn for inspeksjon av utvidelser** med `azd extension show azure.ai.agents` i AI-arbeidsflytdokumenter
- **🌐 Bredere veiledning for workshop-miljø** som dekker GitHub Codespaces, dev containers og lokale kloner med MkDocs

#### Endret
- **📚 Kapittel-intro-README-er** bemerker nå konsekvent validering mot `azd 1.23.12` i grunnlag, konfigurasjon, infrastruktur, multi-agent, forberedelse til distribusjon, feilsøking og produksjonsseksjoner
- **🛠️ AZD-kommando-referanser** oppdatert til nåværende former over hele dokumentasjonen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` avhengig av kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` der Application Insights oversikt er tiltenkt
- **🧪 Forhåndsvisningseksempler på provision** forenklet til støttet bruk slik som `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshop-flyt** oppdatert slik at brukere kan fullføre laboratoriene i Codespaces, dev container eller lokal klon i stedet for å anta kun Codespaces-kjøring
- **🔐 Autentiseringsveiledning** foretrekker nå `azd auth login` for AZD-arbeidsflyter, med `az login` posisjonert som valgfritt når Azure CLI-kommandoer brukes direkte

#### Fikset
- **🪟 Windows installasjonskommandoer** normalisert til nåværende store/små bokstav-format for `winget` pakker i installasjonsveiledningen
- **🐧 Linux installasjonsveiledning** rettet for å unngå ikke-støttede distro-spesifikke `azd` pakkeinstruksjoner og i stedet peke til release assets der det er passende
- **📦 AI-modell-eksempler** oppdatert fra eldre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nyere eksempler som `gpt-4.1-mini`, `gpt-4.1`, og `text-embedding-3-large`
- **📋 Distribusjons- og diagnostikk-snutter** korrigert til å bruke nåværende miljø- og statuskommandoer i logger, skript og feilsøkingssteg
- **⚙️ GitHub Actions-veiledning** oppdatert fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykkeveiledning** oppdatert fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI-kapittelveiledning** forklarer nå bedre forhåndsvisningsfølsom `azd ai` oppførsel, tenant-spesifikk pålogging, nåværende utvidelsesbruk, og oppdaterte modell-distribusjonsanbefalinger
- **🧪 Workshop-instruksjoner** bruker nå mer realistiske versjonseksempler og tydeligere miljøoppsettspråk for praktiske laboratorier
- **📈 Produksjon og feilsøking dokumentasjon** samsvarer nå bedre med nåværende overvåkning, fallback-modell og kostnadsnivåeksempler

#### Oppdaterte filer
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### AZD AI CLI-kommandoer, innholdsvalidering og utvidelse av maler
**Denne versjonen legger til `azd ai`, `azd extension` og `azd mcp` kommandoer i alle AI-relaterte kapitler, fikser ødelagte linker og utgått kode i agents.md, oppdaterer jukselappen, og oppdaterer seksjonen Eksempelmaler med validerte beskrivelser og nye Azure AI AZD-maler.**

#### Lagt til
- **🤖 AZD AI CLI-omfang** i 7 filer (tidligere bare i kapittel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny seksjon "Extensions and AI Commands" som introduserer `azd extension`, `azd ai agent init` og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Valg 4: `azd ai agent init` med sammenligningstabell (mal vs manifest-tilnærming)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD Extensions for Foundry" og "Agent-First Deployment" delseksjoner

  - `docs/chapter-05-multi-agent/README.md` — Raskstart viser nå både mal- og manifestbaserte distribusjonsveier
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Distribusjonsseksjon inkluderer nå `azd ai agent init`-alternativ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI Extension Commands for Diagnostics" underseksjon
  - `resources/cheat-sheet.md` — Ny seksjon "AI & Extensions Commands" med `azd extension`, `azd ai agent init`, `azd mcp` og `azd infra generate`
- **📦 Nye AZD AI-eksempelmaler** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat med Blazor WebAssembly, Semantic Kernel og talestøtte
  - **azure-search-openai-demo-java** — Java RAG chat som bruker Langchain4J med ACA/AKS distribusjonsmuligheter
  - **contoso-creative-writer** — Kreativ skriveapp med flere agenter ved bruk av Azure AI Agent Service, Bing Grounding og Prompty
  - **serverless-chat-langchainjs** — Serverløs RAG med Azure Functions + LangChain.js + Cosmos DB med lokal utviklingsstøtte for Ollama
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med administrasjonsportal, Teams-integrasjon og PostgreSQL/Cosmos DB-valg
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferanseapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastruktur Bicep startmal
  - **🔗 Awesome AZD AI Gallery link** — Referanse til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ maler)

#### Fikset
- **🔗 agents.md navigasjon**: Forrige/Neste-lenkene samsvarer nå med kapittel 2 README-leksjonsrekkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ødelagte linker**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md utdatert kode**: Erstattet `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token-telling**: Erstattet grov `len//4`-estimat med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettet tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standardvert endret okt 2024)
- **contoso-chat**: Oppdatert beskrivelse for å referere til Azure AI Foundry + Prompty, i tråd med repoets faktiske tittel og teknologistabel

#### Fjernet
- **ai-document-processing**: Fjernet ikke-fungerende malreferanse (repo ikke offentlig tilgjengelig som AZD-mal)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nå forventet utdata og `azd monitor`-steg; Øvelse 2 inkluderer full `FunctionTool`-registreringskode; Øvelse 3 erstatter vag veiledning med konkrete `prepdocs.py`-kommandoer
- **📚 agents.md ressurser**: Oppdaterte dokumentasjonslenker til gjeldende Azure AI Agent Service-dokumentasjon og raskstart
- **📋 agents.md Neste steg tabell**: Lagt til AI Workshop Lab-lenke for full kapitteldekning

#### Filer Oppdatert
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Forbedring av kursnavigasjon
**Denne versjonen forbedrer README.md kapittelnavigasjonen med et forbedret tabellformat.**

#### Endret
- **Kurskarttabell**: Forbedret med direkte leksjonslenker, varighetsestimater og kompleksitetsvurderinger
- **Mappeopprydding**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lenkekontroll**: Alle 21+ interne lenker i kurskarttabellen verifisert

### [v3.16.0] - 2026-02-05

#### Produktnavnoppdateringer
**Denne versjonen oppdaterer produktreferanser til dagens Microsoft-merking.**

#### Endret
- **Microsoft Foundry → Microsoft Foundry**: Alle referanser oppdatert i ikketranslasjonsfiler
- **Azure AI Agent Service → Foundry Agents**: Tjenestenavn oppdatert for å reflektere dagens merking

#### Filer Oppdatert
- `README.md` - Hovedkurs landingsside
- `changelog.md` - Versjonshistorikk
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - AI-agenter veiledning
- `examples/README.md` - Eksempeldokumentasjon
- `workshop/README.md` - Workshop landingsside
- `workshop/docs/index.md` - Workshop indeks
- `workshop/docs/instructions/*.md` - Alle workshop instruksjonsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor arkivrestrukturendring: Kapittelbaserte mappenavn
**Denne versjonen omstrukturerer dokumentasjonen til dedikerte kapittelmappper for tydeligere navigasjon.**

#### Mappenavn endret
Gamle mapper er erstattet med kapittelnummererte mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lagt til ny: `docs/chapter-05-multi-agent/`

#### Filmigrasjoner
| Fil | Fra | Til |
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
| Alle pre-deployment filer | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle feilsøkingsfiler | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lagt til
- **📚 Kapittel README-filer**: Oprettet README.md i hver kapittelmappe med:
  - Læringsmål og varighet
  - Leksjonstabell med beskrivelser
  - Hurtigstart-kommandoer
  - Navigasjon til andre kapitler

#### Endret
- **🔗 Oppdatert alle interne linker**: 78+ stier oppdatert i alle dokumentasjonsfiler
- **🗺️ Hoved README.md**: Oppdatert Kurskart med ny kapittelstruktur
- **📝 examples/README.md**: Oppdatert kryssreferanser til kapittelmapper

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Arkivomstrukturering: Kapittelnavigasjon
**Denne versjonen la til kapittelnavigasjons-README-filer (erstattet av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny AI-agenter veiledning
**Denne versjonen legger til en omfattende veiledning for distribusjon av AI-agenter med Azure Developer CLI.**

#### Lagt til
- **🤖 docs/microsoft-foundry/agents.md**: Fullstendig veiledning som dekker:
  - Hva AI-agenter er og hvordan de skiller seg fra chatbots
  - Tre raskstart-agentmaler (Foundry Agents, Prompty, RAG)
  - Agentarkitektur mønstre (enkel agent, RAG, multi-agent)
  - Verktøykonfigurasjon og tilpasning
  - Overvåking og metrikksporing
  - Kostnadshensyn og optimalisering
  - Vanlige feilsøkingsscenarioer
  - Tre praktiske øvelser med suksesskriterier

#### Innholdsstruktur
- **Introduksjon**: Agentkonsepter for nybegynnere
- **Rask Start**: Distribuer agenter med `azd init --template get-started-with-ai-agents`
- **Arkitektur-mønstre**: Visuelle diagrammer av agentmønstre
- **Konfigurasjon**: Verktøykonfigurasjon og miljøvariabler
- **Overvåking**: Application Insights-integrasjon
- **Øvelser**: Progressiv praktisk læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Oppdatering av DevContainer-miljø
**Denne versjonen oppdaterer utviklingscontainer-konfigurasjonen med moderne verktøy og bedre default-innstillinger for AZD-læringsopplevelsen.**

#### Endret
- **🐳 Basisbilde**: Oppdatert fra `python:3.12-bullseye` til `python:3.12-bookworm` (nyeste stabile Debian)
- **📛 Containernavn**: Endret fra "Python 3" til "AZD for Beginners" for klarhet

#### Lagt til
- **🔧 Nye Dev Container-funksjoner**:
  - `azure-cli` med aktivert Bicep-støtte
  - `node:20` (LTS-versjon for AZD-maler)
  - `github-cli` for maladministrasjon
  - `docker-in-docker` for containerapp-distribusjoner

- **🔌 Portvideresending**: Forhåndskonfigurerte porter for vanlig utvikling:
  - 8000 (MkDocs forhåndsvisning)
  - 3000 (Nettapper)
  - 5000 (Python Flask)
  - 8080 (APIer)

- **🧩 Nye VS Code-utvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-støtte
  - `ms-azuretools.vscode-docker` - Docker-støtte
  - `ms-azuretools.vscode-bicep` - Bicep språkstøtte
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursadministrasjon
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagramstøtte
  - `redhat.vscode-yaml` - YAML-støtte (for azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git historikk

- **⚙️ VS Code-innstillinger**: La til standardinnstillinger for Python interpreter, formatering ved lagring og trimming av mellomrom

- **📦 Oppdatert requirements-dev.txt**:
  - La til MkDocs minify-plugin
  - La til pre-commit for kodekvalitet
  - La til Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Fikset
- **Post-Create kommando**: Verifiserer nå AZD og Azure CLI-installasjon ved containerstart

---

### [v3.11.0] - 2026-02-05

#### Nybegynnervennlig README-overhaling
**Denne versjonen forbedrer README.md betydelig for å være mer tilgjengelig for nybegynnere og legger til viktige ressurser for AI-utviklere.**

#### Lagt til
- **🆚 Azure CLI vs AZD sammenligning**: Klar forklaring på når man skal bruke hvert verktøy med praktiske eksempler
- **🌟 Awesome AZD lenker**: Direkte lenker til fellesskapsmalgalleri og bidragsressurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ klare til å distribuere maler
  - [Send inn en mal](https://github.com/Azure/awesome-azd/issues) - Fellesskapsbidrag
- **🎯 Hurtigstartveiledning**: Forenklet 3-stegs introduksjonsseksjon (Installer → Logg inn → Distribuer)
- **📊 Erfaring-basert navigasjonstabell**: Klar veiledning om hvor man skal starte basert på utviklererfaring

#### Endret
- **README-struktur**: Omorganisert for progressiv avsløring - nøkkelinformasjon først
- **Introduksjonsseksjon**: Omskrevet for å forklare "Magien i `azd up`" for komplette nybegynnere
- **Fjernet duplisert innhold**: Eliminert duplisert feilsøkingseksjon
- **Feilsøkingskommandoer**: Rettet `azd logs`-referanse til å bruke gyldig `azd monitor --logs`

#### Fikset

- **🔐 Autentiseringskommandoer**: La til `azd auth login` og `azd auth logout` til cheat-sheet.md
- **Ugyldige kommando referanser**: Fjernet gjenværende `azd logs` fra README feilsøkingsseksjon

#### Notater
- **Omfang**: Endringer brukt på hoved README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer spesielt rettet mot utviklere nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Oppdatering av nøyaktighet for Azure Developer CLI-kommandoer
**Denne versjonen korrigerer ikke-eksisterende AZD-kommandoer i hele dokumentasjonen, og sikrer at alle kodeeksempler bruker gyldig Azure Developer CLI-syntaks.**

#### Fikset
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Omfattende revisjon og korrigering av ugyldige kommandoer:
  - `azd logs` (eksisterer ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` underkommandoer (eksisterer ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (eksisterer ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flagg (eksisterer ikke) → fjernet
  - `azd provision --what-if/--rollback` flagg (eksisterer ikke) → oppdatert til å bruke `--preview`
  - `azd config validate` (eksisterer ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (eksisterer ikke) → fjernet

- **📚 Filer oppdatert med kommando korrigeringer**:
  - `resources/cheat-sheet.md`: Stort overhalt kommando referanse
  - `docs/deployment/deployment-guide.md`: Fikset rollback og deployeringsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigerte seksjoner for logganalyse
  - `docs/troubleshooting/common-issues.md`: Oppdaterte feilsøkingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Fikset AZD feilsøkingsseksjon
  - `docs/getting-started/azd-basics.md`: Korrigerte overvåkingskommandoer
  - `docs/getting-started/first-project.md`: Oppdaterte overvåkings- og feilsøkings-eksempler
  - `docs/getting-started/installation.md`: Fikset hjelp og versjonseksempler
  - `docs/pre-deployment/application-insights.md`: Korrigerte kommandoer for loggvisning
  - `docs/pre-deployment/coordination-patterns.md`: Fikset agent feilsøkingskommandoer

- **📝 Versjonsreferanse oppdatert**:
  - `docs/getting-started/installation.md`: Endret hardkodet `1.5.0` versjon til generisk `1.x.x` med lenke til utgivelser

#### Endret
- **Rollback strategier**: Oppdatert dokumentasjon til å bruke Git-basert rollback (AZD har ikke native rollback)
- **Loggvisning**: Erstattet `azd logs` referanser med `azd monitor --logs`, `azd monitor --live` og Azure CLI-kommandoer
- **Ytelsesseksjon**: Fjernet ikke-eksisterende parallelle/incrementale deploy-flag, levert gyldige alternativer

#### Tekniske detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor flagg**: `--live`, `--logs`, `--overview`
- **Fjernet funksjoner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notater
- **Verifikasjon**: Kommandoer validert mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Fullføring av workshop og oppdatering av dokumentasjonskvalitet
**Denne versjonen fullfører de interaktive workshop-modulene, fikser alle ødelagte dokumentasjonslenker, og forbedrer den generelle innholdskvaliteten for AI-utviklere som bruker Microsoft AZD.**

#### Lagt til
- **📝 CONTRIBUTING.md**: Nytt dokument for retningslinjer for bidrag med:
  - Klare instrukser for rapportering av problemer og forslag til endringer
  - Dokumentasjonsstandarder for nytt innhold
  - Retningslinjer for kodeeksempler og konvensjoner for commit-meldinger
  - Informasjon om samfunnsengasjement

#### Fullført
- **🎯 Workshop modul 7 (Avslutning)**: Fullstendig fullført avslutningsmodul med:
  - Omfattende oppsummering av workshop-prestasjoner
  - Seksjon med nøkkelkonsepter som dekker AZD, maler og Microsoft Foundry
  - Anbefalinger for videre læringsreise
  - Workshop utfordringsøvelser med vanskelighetsgrader
  - Tilbakemeldinger og støttelenker for fellesskapet

- **📚 Workshop modul 3 (Deconstruct)**: Oppdaterte læringsmål med:
  - Veiledning for aktivering av GitHub Copilot med MCP-servere
  - Forståelse av AZD-mal mappe-struktur
  - Infrastruktur som kode (Bicep) organisasjonsmønstre
  - Instruksjoner for praktisk lab

- **🔧 Workshop modul 6 (Nedrigg)**: Fullført med:
  - Ressursopprydding og kostnadsstyringsmål
  - Bruk av `azd down` for trygg infrastrukturavvikling
  - Veiledning for gjenoppretting av myk-slettede kognitive tjenester
  - Bonus utforskningsoppgaver for GitHub Copilot og Azure Portal

#### Fikset
- **🔗 Fikset ødelagte lenker**: Løst over 15 ødelagte interne dokumentasjonslenker:
  - `docs/ai-foundry/ai-model-deployment.md`: Fikset stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerte sti for ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattet ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fikset FAQ og feilsøkingsguide-stier
  - `examples/container-app/microservices/README.md`: Korrigerte kurs-hjem og deployeringsguide-stier
  - `resources/faq.md` og `resources/glossary.md`: Oppdaterte AI-kapitler referanser
  - `course-outline.md`: Fikset instruktørguide og AI workshop lab-referanser

- **📅 Workshop status-banner**: Oppdatert fra "Under Construction" til aktiv workshop-status med februar 2026 dato

- **🔗 Workshop navigasjon**: Fikset ødelagte navigasjonslenker i workshop README.md som pekte til ikke-eksisterende lab-1-azd-basics mappe

#### Endret
- **Workshop presentasjon**: Fjernet "under construction" advarsel, workshopen er nå komplett og klar til bruk
- **Navigasjonskonsistens**: Sikret at alle workshop-moduler har riktig navigasjon mellom moduler
- **Referanser for læringssti**: Oppdaterte kapittel-kryssreferanser til å bruke riktige microsoft-foundry stier

#### Validert
- ✅ Alle engelskspråklige markdown-filer har gyldige interne lenker
- ✅ Workshop-moduler 0-7 er fullført med læringsmål
- ✅ Navigasjon mellom kapitler og moduler fungerer korrekt
- ✅ Innholdet er egnet for AI-utviklere som bruker Microsoft AZD
- ✅ Begynnervennlig språk og struktur opprettholdes gjennomgående
- ✅ CONTRIBUTING.md gir klar veiledning for fellesskapsbidragsytere

#### Teknisk implementering
- **Lenkvalidering**: Automatisert PowerShell-skript verifiserte alle .md interne lenker
- **Innholdsgjennomgang**: Manuell vurdering av workshop-fullstendighet og egnethet for nybegynnere
- **Navigasjonssystem**: Konsistente navigasjonsmønstre for kapittel og modul anvendt

#### Notater
- **Omfang**: Endringer brukt kun på engelsk dokumentasjon
- **Oversettelser**: Oversettelsesmappene er ikke oppdatert i denne versjonen (automatisk oversettelse vil synkroniseres senere)
- **Workshop varighet**: Fullstendig workshop gir nå 3-4 timer praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avansert dokumentasjon: Overvåking, sikkerhet og multi-agent-mønstre
**Denne versjonen legger til omfattende A-grad leksjoner om Application Insights-integrasjon, autentiseringsmønstre og multi-agent koordinasjon for produksjonsdistribusjoner.**

#### Lagt til
- **📊 Application Insights-integrasjonsleksjon**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokusert deployering med automatisk provisjonering
  - Fullstendige Bicep-maler for Application Insights + Log Analytics
  - Arbeidende Python-applikasjoner med tilpasset telemetri (over 1 200 linjer)
  - AI/LLM overvåkingsmønstre (Microsoft Foundry Models token-/kostnadssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribuert sporing, telemetritrøm)
  - 3 praktiske øvelser (varsler, dashboards, AI-overvåking)
  - Kusto spørringseksempler og kostnadsoptimaliseringsstrategier
  - Live metrikstrømming og sanntidsfeilsøking
  - 40-50 minutter læringstid med produksjonsklare mønstre

- **🔐 Autentiserings- og sikkerhetsmønstre leksjon**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmønstre (tilkoblingsstrenger, Key Vault, administrert identitet)
  - Komplett Bicep infrastrukturmaler for sikre deployeringer
  - Node.js applikasjonskode med Azure SDK-integrasjon
  - 3 komplette øvelser (aktivering av administrert identitet, bruker-tilordnet identitet, Key Vault rotering)
  - Sikkerhets beste praksis og RBAC-konfigurasjoner
  - Feilsøkingsveiledning og kostnadsanalyse
  - Produksjonsklare passordfrie autentiseringsmønstre

- **🤖 Multi-Agent koordinasjonsmønstre leksjon**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinasjonsmønstre (sekvensiell, parallell, hierarkisk, hendelsesdrevet, konsensus)
  - Komplett orkestratørtjeneste-implementasjon (Python/Flask, over 1 500 linjer)
  - 3 spesialiserte agentimplementasjoner (Research, Writer, Editor)
  - Service Bus-integrasjon for meldingskø
  - Cosmos DB tilstandsadministrasjon for distribuerte systemer
  - 6 Mermaid-diagrammer som viser agentinteraksjoner
  - 3 avanserte øvelser (timeout-håndtering, retry-logikk, sikringsbryter)
  - Kostnadsoversikt ($240-565/måned) med optimaliseringsstrategier
  - Application Insights-integrasjon for overvåking

#### Forbedret
- **Pre-deployment kapittel**: Inkluderer nå omfattende overvåking og koordinasjonsmønstre
- **Kom i gang kapittel**: Forbedret med profesjonelle autentiseringsmønstre
- **Produksjonsklarhet**: Full dekning fra sikkerhet til observabilitet
- **Kursoversikt**: Oppdatert for å referere nye leksjoner i Kapittel 3 og 6

#### Endret
- **Læringsprogresjon**: Bedre integrering av sikkerhet og overvåking i hele kurset
- **Dokumentasjonskvalitet**: Konsistente A-grad standarder (95-97 %) på tvers av nye leksjoner
- **Produksjonsmønstre**: Full end-to-end dekning for bedriftsdistribusjoner

#### Forbedret
- **Utvikleropplevelse**: Klar vei fra utvikling til produksjonsovervåking
- **Sikkerhetsstandarder**: Profesjonelle mønstre for autentisering og hemmelighetshåndtering
- **Observabilitet**: Fullstendig Application Insights-integrasjon med AZD
- **AI arbeidsmengder**: Spesialisert overvåking for Microsoft Foundry-modeller og multi-agent systemer

#### Validert
- ✅ Alle leksjoner inkluderer komplett fungerende kode (ikke bare utdrag)
- ✅ Mermaid-diagrammer for visuell læring (19 totalt på tvers av 3 leksjoner)
- ✅ Praktiske øvelser med verifiseringssteg (9 totalt)
- ✅ Produksjonsklare Bicep-maler deploybare via `azd up`
- ✅ Kostnadsanalyse og optimaliseringsstrategier
- ✅ Feilsøkingsveiledninger og beste praksiser
- ✅ Kunnskapssjekker med verifikasjonskommandoer

#### Resultater fra dokumentasjonsvurdering
- **docs/pre-deployment/application-insights.md**: - Omfattende overvåkingsguide
- **docs/getting-started/authsecurity.md**: - Profesjonelle sikkerhetsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avanserte multi-agent arkitekturer
- **Alt nytt innhold**: - Konsistente høykvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribuert sporing
- **Autentisering**: Administrert identitet + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvåking**: Live metrikker + Kusto-spørringer + varsler + dashboards
- **Kostnadsstyring**: Sampling-strategier, lagringspolitikker, budsjettkontroller

### [v3.7.0] - 2025-11-19

#### Forbedringer av dokumentasjonskvalitet og nytt Microsoft Foundry Models-eksempel
**Denne versjonen forbedrer dokumentasjonskvaliteten på tvers av hele depotet og legger til et komplett Microsoft Foundry Models distribusjonseksempel med gpt-4.1 chat-grensesnitt.**

#### Lagt til
- **🤖 Microsoft Foundry Models chat-eksempel**: Komplett gpt-4.1 distribusjon med fungerende implementasjon i `examples/azure-openai-chat/`:
  - Fullstendig Microsoft Foundry Models infrastruktur (gpt-4.1 modell distribusjon)
  - Python kommandolinje chat-grensesnitt med samtalehistorikk
  - Key Vault-integrasjon for sikker API-nøkkellagring
  - Token-brukssporing og kostnadsestimering
  - Begrensning av forespørsler og feilbehandling
  - Omfattende README med 35-45 minutters distribusjonsveiledning
  - 11 produksjonsklare filer (Bicep-maler, Python-app, konfigurasjon)
- **📚 Dokumentasjonsøvelser**: La til praktiske øvelser i konfigurasjonsveiledningen:
  - Øvelse 1: Konfigurasjon for flere miljøer (15 minutter)
  - Øvelse 2: Hemmelighetshåndterings-praksis (10 minutter)
  - Klare suksesskriterier og verifiseringssteg
- **✅ Distribusjonsverifisering**: La til verifiseringsseksjon i distribusjonsveiledningen:
  - Helsesjekkprosedyrer
  - Suksesskriterie-sjekkliste
  - Forventede utdata for alle distribusjonskommandoer
  - Rask referanse for feilsøking

#### Forbedret
- **examples/README.md**: Oppdatert til A-grad kvalitet (93%):
  - Lagt til azure-openai-chat i alle relevante seksjoner
  - Oppdatert lokal eksempelantall fra 3 til 4
  - Lagt til i AI Application Examples tabell
  - Integrert i Quick Start for intermediate brukere
  - Lagt til i Microsoft Foundry Templates seksjon
  - Oppdatert sammenligningsmatrise og teknologi-finningsseksjoner
- **Dokumentasjonskvalitet**: Forbedret fra B+ (87%) til A- (92%) i docs-mappen:

  - La til forventede resultater for viktige kommandoeksempler
  - Inkluderte verifikasjonstrinn for konfigurasjonsendringer
  - Forbedret praktisk læring med øvelser

#### Endret
- **Læringsprogresjon**: Bedre integrering av AI-eksempler for mellomnivålærende
- **Dokumentasjonsstruktur**: Mer handlingsrettede øvelser med tydelige mål
- **Verifiseringsprosess**: Eksplisitte suksesskriterier lagt til nøkkelarbeidsflyter

#### Forbedret
- **Utvikleropplevelse**: Microsoft Foundry Models distribusjon tar nå 35-45 minutter (mot 60-90 for komplekse alternativer)
- **Kostnadstransparens**: Klare kostnadsestimater ($50-200/måned) for Microsoft Foundry Models-eksempel
- **Læringssti**: AI-utviklere har klart inngangspunkt med azure-openai-chat
- **Dokumentasjonsstandarder**: Konsistente forventede resultater og verifikasjonstrinn

#### Validert
- ✅ Microsoft Foundry Models-eksempel fullt funksjonelt med `azd up`
- ✅ Alle 11 implementeringsfiler er syntaktisk korrekte
- ✅ README-instruksjoner samsvarer med faktisk distribueringserfaring
- ✅ Dokumentasjonslenker oppdatert i over 8 steder
- ✅ Eksempelkatalogen viser nøyaktig 4 lokale eksempler
- ✅ Ingen dupliserte eksterne lenker i tabeller
- ✅ Alle navigasjonsreferanser er korrekte

#### Teknisk implementering
- **Microsoft Foundry Models-arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster
- **Sikkerhet**: Forvaltet identitet klar, hemmeligheter i Key Vault
- **Overvåkning**: Integrasjon med Application Insights
- **Kostnadsstyring**: Token-sporing og optimalisering av bruk
- **Distribuering**: Enkelt `azd up`-kommando for komplett oppsett

### [v3.6.0] - 2025-11-19

#### Større oppdatering: Container App distribusjonseksempler
**Denne versjonen introduserer omfattende, produksjonsklare container-applikasjonsdistribusjonseksempler ved bruk av Azure Developer CLI (AZD), med full dokumentasjon og integrasjon i læringsstien.**

#### Lagt til
- **🚀 Container App-eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett oversikt over containeriserte distribusjoner, rask start, produksjon og avanserte mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybegynnervennlig REST API med skala-til-null, helse-sjekker, overvåkning og feilsøking
  - [Microservices Architecture](../../examples/container-app/microservices): Produksjonsklar flertjeneste-distribusjon (API Gateway, Produkt, Ordre, Bruker, Varsling), asynkron meldingstjeneste, Service Bus, Cosmos DB, Azure SQL, distribuert sporing, blue-green/canary-distribusjon
- **Beste praksis**: Sikkerhet, overvåkning, kostnadsoptimalisering og CI/CD-veiledning for containerarbeidsmengder
- **Kodeeksempler**: Komplett `azure.yaml`, Bicep-maler, og flerspråklige tjenesteimplementasjoner (Python, Node.js, C#, Go)
- **Testing & feilsøking**: End-to-end testscenarier, overvåkningskommandoer, feilsøkingsveiledning

#### Endret
- **README.md**: Oppdatert for å vise og lenke til nye container app-eksempler under "Local Examples - Container Applications"
- **examples/README.md**: Oppdatert for å fremheve container app-eksempler, legge til sammenligningsmatrise og oppdatere teknologi-/arkitekturreferanser
- **Kursoversikt og studieveiledning**: Oppdatert for å referere til nye container app-eksempler og distribusjonsmønstre i relevante kapitler

#### Validert
- ✅ Alle nye eksempler kan distribueres med `azd up` og følger beste praksis
- ✅ Dokumentasjonslenker og navigasjon oppdatert
- ✅ Eksempler dekker nybegynner til avanserte scenarioer, inkludert produksjonsmikrotjenester

#### Merknader
- **Omfang**: Kun engelsk dokumentasjon og eksempler
- **Neste steg**: Utvid med flere avanserte container-mønstre og CI/CD-automatisering i fremtidige utgaver

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Denne versjonen implementerer en omfattende navneendring av produktet fra "Microsoft Foundry" til "Microsoft Foundry" i all engelsk dokumentasjon, som reflekterer Microsofts offisielle rebranding.**

#### Endret
- **🔄 Produktnavnoppdatering**: Fullstendig rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Oppdaterte alle referanser i engelsk dokumentasjon i `docs/`-mappen
  - Omdøpte mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøpte fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innholdsreferanser oppdatert i 7 dokumentasjonsfiler

- **📁 Endringer i mappestruktur**:
  - `docs/ai-foundry/` omdøpt til `docs/microsoft-foundry/`
  - Alle kryssreferanser oppdatert for å gjenspeile ny mappestruktur
  - Navigasjonslenker verifisert i hele dokumentasjonen

- **📄 Fil-omdøpinger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne lenker oppdatert for å referere til ny filnavn

#### Oppdaterte filer
- **Kapiteldokumentasjon** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigasjonslenkeoppdateringer
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnreferanser oppdatert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruker allerede Microsoft Foundry (fra tidligere oppdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referanser oppdatert (oversikt, fellesskapsinnspill, dokumentasjon)
  - `docs/getting-started/azd-basics.md` - 4 kryssreferanselenker oppdatert
  - `docs/getting-started/first-project.md` - 2 kapittelnavigasjonslenker oppdatert
  - `docs/getting-started/installation.md` - 2 lenker til neste kapittel oppdatert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referanser oppdatert (navigasjon, Discord-fellesskap)
  - `docs/troubleshooting/common-issues.md` - 1 navigasjonslenke oppdatert
  - `docs/troubleshooting/debugging.md` - 1 navigasjonslenke oppdatert

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referanser oppdatert (kursoversikt, kapitteltitler, maler-seksjon, fellesskapsinnsikt)
  - `course-outline.md` - 14 referanser oppdatert (oversikt, læringsmål, kapittelressurser)

#### Validert
- ✅ Ingen gjenværende "ai-foundry" mappestireferanser i engelske dokumenter
- ✅ Ingen gjenværende "Microsoft Foundry" produktnavnreferanser i engelske dokumenter
- ✅ Alle navigasjonslenker fungerer med ny mappestruktur
- ✅ Fil- og mappeomdøpinger gjennomført vellykket
- ✅ Kryssreferanser mellom kapitler verifisert

#### Merknader
- **Omfang**: Endringer anvendt kun på engelsk dokumentasjon i `docs/`-mappen
- **Oversettelser**: Oversettelsesmappene (`translations/`) ikke oppdatert i denne versjonen
- **Workshop**: Workshop-materialer (`workshop/`) ikke oppdatert i denne versjonen
- **Eksempler**: Eksempelfiler kan fortsatt referere til gammel navngivning (vil bli adressert i fremtidig oppdatering)
- **Eksterne lenker**: Eksterne URLer og GitHub repository-referanser er uendret

#### Migrasjonsveiledning for bidragsytere
Hvis du har lokale grener eller dokumentasjon som refererer det gamle strukturet:
1. Oppdater referanser til mapper: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Oppdater filreferanser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstatt produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Verifiser at alle interne dokumentasjonslenker fortsatt fungerer

---

### [v3.4.0] - 2025-10-24

#### Forbedringer i infrastrukturforhåndsvisning og validering
**Denne versjonen introduserer omfattende støtte for den nye forhåndsvisningsfunksjonen i Azure Developer CLI og forbedrer brukeropplevelsen i workshop.**

#### Lagt til
- **🧪 azd provision --preview funksjonsdokumentasjon**: Omfattende dekning av ny infrastrukturforhåndsvisningskapasitet
  - Kommando referanse og brukseksempler i jukselapp
  - Detaljert integrasjon i provisjoneringsveiledning med bruksområder og fordeler
  - Pre-flight sjekk integrasjon for sikrere distribusjonsvalidering
  - Oppdateringer i kom-i-gang veiledning med sikkerhet først distribusjonspraksis
- **🚧 Workshop statusbanner**: Profesjonelt HTML-banner som angir utviklingsstatus for workshop
  - Gradientdesign med byggeindikatorer for klar kommunikasjon til brukere
  - Sist oppdatert tidsstempel for åpenhet
  - Mobilresponsivt design for alle enhetstyper

#### Forbedret
- **Infrastruktursikkerhet**: Forhåndsvisningsfunksjonalitet integrert gjennom distribusjonsdokumentasjon
- **Forhåndsdistribusjonsvalidering**: Automatiserte skript inkluderer nå infrastrukturforhåndsvisningstesting
- **Utviklerarbeidsflyt**: Oppdaterte kommandorekkefølger for å inkludere forhåndsvisning som beste praksis
- **Workshop-opplevelse**: Klare forventninger satt for brukere om innholdsutviklingsstatus

#### Endret
- **Distribusjons beste praksis**: Forhåndsvisning-først arbeidsflyt anbefales nå
- **Dokumentasjonsflyt**: Infrastrukturvalidering flyttet tidligere i læringsprosessen
- **Workshop-presentasjon**: Profesjonell statuskommunikasjon med tydelig utviklingstidslinje

#### Forbedret
- **Sikkerhet-først tilnærming**: Infrastrukturendringer kan nå valideres før distribusjon
- **Team-samarbeid**: Forhåndsvisningsresultater kan deles for gjennomgang og godkjenning
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før provisjonering
- **Risikoreduksjon**: Reduserte distribusjonsfeil gjennom forhåndsvalidering

#### Teknisk implementering
- **Integrasjon i flere dokumenter**: Forhåndsvisningsfunksjon dokumentert på tvers av 4 nøkkelfiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i all dokumentasjon
- **Beste praksis integrering**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript
- **Visuelle indikatorer**: Klare NYE funksjonsmarkeringer for oppdagbarhet

#### Workshop infrastruktur
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientstil
- **Brukeropplevelse**: Klar utviklingsstatus hindrer forvirring
- **Profesjonell presentasjon**: Opprettholder repoets troverdighet mens forventninger settes
- **Tidslinjegjennomsiktighet**: Sist oppdatert oktober 2025 for ansvarlighet

### [v3.3.0] - 2025-09-24

#### Forbedrede workshop-materialer og interaktiv læringsopplevelse
**Denne versjonen introduserer omfattende workshop-materialer med nettleserbasert interaktive guider og strukturerte læringsstier.**

#### Lagt til
- **🎥 Interaktiv workshop-veiledning**: Nettleserbasert workshop-opplevelse med MkDocs forhåndsvisningsfunksjon
- **📝 Strukturerte workshop-instruksjoner**: 7-trinns guidet læringssti fra oppdagelse til tilpasning
  - 0-Introduksjon: Workshop oversikt og oppsett
  - 1-Velg-AI-mal: Prosess for maloppdagelse og utvelgelse
  - 2-Valider-AI-mal: Distribuerings- og valideringsprosedyrer
  - 3-Analyser-AI-mal: Forstå malarkitektur
  - 4-Konfigurer-AI-mal: Konfigurasjon og tilpasning
  - 5-Tilpass-AI-mal: Avanserte modifikasjoner og iterasjoner
  - 6-Rydd-opp-infrastruktur: Opprydding og ressursstyring
  - 7-Avslutning: Oppsummering og neste steg
- **🛠️ Workshop-verktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringssti**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløst utviklingsmiljøoppsett

#### Forbedret
- **AI Workshop Lab**: Utvidet med omfattende 2-3 timers strukturert læringsopplevelse
- **Workshop-dokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Tydelig steg-for-steg veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrerte verktøy for effektiviserte utviklingsarbeidsflyter

#### Forbedret
- **Tilgjengelighet**: Nettleserbasert grensesnitt med søk, kopieringsfunksjon og temabryter
- **Selvstyrt læring**: Fleksibel workshop-struktur som tilpasser seg ulike læringshastigheter
- **Praktisk anvendelse**: Virkelighetsnære AI-mal distribusjonsscenarioer
- **Fellesskapsintegrasjon**: Discord-integrasjon for workshop-støtte og samarbeid

#### Workshop-funksjoner
- **Innebygd søk**: Rask nøkkelord- og leksjonsgjenfinning
- **Kopier kodeblokker**: Hold musepekeren over for å kopiere alle kodeeksempler
- **Temabryter**: Mørk/lys modus støtte for ulike preferanser
- **Visuelle elementer**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte Discord-tilgang for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Stor navigasjonsomstrukturering og kapittelbasert læringssystem
**Denne versjonen introduserer en omfattende kapittelbasert læringsstruktur med forbedret navigasjon i hele repositoriet.**

#### Lagt til
- **📚 Kapittelbasert læringssystem**: Omstrukturert hele kurset i 8 progressive læringskapitler
  - Kapittel 1: Grunnlag & Rask start (⭐ - 30-45 minutter)
  - Kapittel 2: AI-fokusert utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon & autentisering (⭐⭐ - 45-60 minutter)
  - Kapittel 4: Infrastruktur som kode & distribusjon (⭐⭐⭐ - 1-1,5 timer)
  - Kapittel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Forhåndsvalidering & planlegging (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking & debugging (⭐⭐ - 1-1,5 timer)
  - Kapittel 8: Produksjon & bedriftsmønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonshoder og -føtter på tvers av all dokumentasjon
- **🎯 Progresjonssporing**: Sjekkliste for kursprestasjoner og læringsverifisering
- **🗺️ Veiledning for læringssti**: Klare inngangspunkter for ulike erfaringsnivåer og mål
- **🔗 Kryssreferanse-navigasjon**: Relaterte kapitler og forutsetninger tydelig lenket

#### Forbedret
- **README-struktur**: Omformet til en strukturert læringsplattform med kapittelbasert organisering
- **Dokumentasjonsnavigasjon**: Hver side inkluderer nå kapittelkontekst og veiledning for progresjon
- **Malorganisering**: Eksempler og maler kartlagt til passende læringskapitler

- **Ressursintegrasjon**: Juksesider, FAQs og studieguider knyttet til relevante kapitler
- **Workshop-integrasjon**: Praktiske laboratorier koblet til flere læringsmål i kapitlene

#### Endret
- **Læringsprogresjon**: Flyttet fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Konfigurasjonsplassering**: Omplassert konfigurasjonsveiledningen til kapittel 3 for bedre læringsflyt
- **AI-innholdsintegrasjon**: Bedre integrasjon av AI-spesifikt innhold gjennom hele læringsreisen
- **Produksjonsinnhold**: Avanserte mønstre samlet i kapittel 8 for bedriftsbrukere

#### Forbedret
- **Brukeropplevelse**: Klar navigasjonssti og kapitelfremdriftsindikatorer
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kursgjennomføring
- **Profesjonell Presentasjon**: Universitetstilpasset kursstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Redusert tid for å finne relevant innhold gjennom forbedret organisering

#### Teknisk Implementering
- **Navigasjonsoverskrifter**: Standardisert kapittelnavigasjon på over 40 dokumentasjonsfiler
- **Bunntekstnavigasjon**: Konsistent veiledning for fremdrift og kapitlets fullføringsindikatorer
- **Internlenking**: Omfattende system for interne lenker som kobler relaterte konsepter
- **Kapittelkartlegging**: Maler og eksempler tydelig knyttet til læringsmål

#### Studieguideforbedring
- **📚 Omfattende læringsmål**: Omstrukturert studieguide for å samsvare med systemet med 8 kapitler
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inkluderer spesifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ukentlig læringsplan med målbare resultater og sjekklister for ferdigstillelse
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle resultater
- **🛠️ Praktiske øvelser**: Praktiske aktiviteter med ekte distribusjonsscenarier og feilsøking
- **📊 Ferdighetsprogresjon**: Klar fremgang fra grunnleggende konsepter til bedriftsmønstre med fokus på karriereutvikling
- **🎓 Sertifiseringsrammeverk**: Resultater innen profesjonell utvikling og system for fellesskapsanerkjennelse
- **⏱️ Tidsstyring**: Strukturert 10-ukers læringsplan med validering av milepæler

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI-løsninger
**Denne versjonen forbedrer multi-agent retail-løsningen med bedre agentnavngiving og forbedret dokumentasjon.**

#### Endret
- **Multi-Agent Terminologi**: Erstattet "Cora agent" med "Kundeagent" gjennom hele retail multi-agent-løsningen for klarere forståelse
- **Agentarkitektur**: Oppdatert all dokumentasjon, ARM-maler og kodeeksempler for å bruke konsistent "Kundeagent"-navngiving
- **Konfigurasjonseksempler**: Modernisert agentkonfigurasjonsmønstre med oppdaterte navnekonvensjoner
- **Konsistent dokumentasjon**: Sikret at alle referanser bruker profesjonelle, beskrivende agentnavn

#### Forbedret
- **ARM-malpakke**: Oppdatert retail-multiagent-arm-template med Kundeagent-referanser
- **Arkitekturskisser**: Oppdaterte Mermaid-diagrammer med oppdatert agentnavngiving
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruker nå KundeAgent-navn
- **Miljøvariabler**: Oppdaterte alle deploy-skript til å bruke CUSTOMER_AGENT_NAME-konvensjoner

#### Forbedret
- **Utvikleropplevelse**: Klarere agentroller og ansvar i dokumentasjonen
- **Produksjonsparathed**: Bedre samsvar med bedriftsnavnekonvensjoner
- **Læringsmateriell**: Mer intuitiv agentnavngiving for undervisningsformål
- **Malbrukervennlighet**: Forenklet forståelse av agentfunksjoner og deploymønstre

#### Tekniske detaljer
- Oppdaterte Mermaid-arkitekturskisser med KundeAgent-referanser
- Erstattet CoraAgent-klassenavn med KundeAgent i Python-eksempler
- Modifiserte ARM-mal JSON-konfigurasjoner til å bruke "customer"-agenttypen
- Oppdaterte miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Oppfrisket alle deploy-kommandoer og containerkonfigurasjoner

### [v3.0.0] - 2025-09-12

#### Store endringer - AI-utviklerfokus og Microsoft Foundry-integrasjon
**Denne versjonen forvandler arkivet til en omfattende AI-fokusert læringsressurs med Microsoft Foundry-integrasjon.**

#### Lagt til
- **🤖 AI-Første Læringssti**: Fullstendig omstrukturering med prioritet for AI-utviklere og ingeniører
- **Microsoft Foundry Integrasjonsveiledning**: Omfattende dokumentasjon for å koble AZD med Microsoft Foundry-tjenester
- **Mønstre for AI-modellutplassering**: Detaljert guide som dekker modellvalg, konfigurasjon og produksjonsutplassering
- **AI Workshop-lab**: 2-3 timers praktisk workshop for å konvertere AI-applikasjoner til AZD-deployerbare løsninger
- **Beste praksis for produksjons-AI**: Klar-til-bedrift mønstre for skalering, overvåkning og sikring av AI-arbeidsbelastninger
- **AI-spesifikk feilsøkingsguide**: Omfattende feilsøking for Microsoft Foundry-modeller, Cognitive Services og AI-utplassering
- **AI-mal-galleri**: Utvalgt samling av Microsoft Foundry-maler med kompleksitetsvurdering
- **Workshop-materialer**: Fullstendig workshopstruktur med praktiske laboratorier og referansematerialer

#### Forbedret
- **README-struktur**: AI-utviklerfokusert med 45% fellesskapsinteresse-data fra Microsoft Foundry Discord
- **Læringsstier**: Dedikert AI-utviklerreise ved siden av tradisjonelle stier for studenter og DevOps-ingeniører
- **Mal-anbefalinger**: Utvalgte AI-maler inkludert azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Fellesskapsintegrasjon**: Forbedret Discord-fellesskapsstøtte med AI-spesifikke kanaler og diskusjoner

#### Sikkerhet og produksjonsfokus
- **Mønstre for administrert identitet**: AI-spesifikke autentiserings- og sikkerhetskonfigurasjoner
- **Kostnadsoptimalisering**: Sporing av tokenbruk og budsjettdisiplin for AI-arbeidsbelastninger
- **Distribusjon i flere regioner**: Strategier for global AI-applikasjonsutrulling
- **Ytelsesovervåkning**: AI-spesifikke måleparametere og Application Insights-integrasjon

#### Dokumentasjonskvalitet
- **Lineær kursstruktur**: Logisk progresjon fra nybegynner til avanserte AI-utplasseringmønstre
- **Validerte URL-er**: Alle eksterne repo-lenker verifisert og tilgjengelige
- **Fullstendig referanse**: Alle interne dokumentasjonslenker validert og fungerende
- **Produksjonsklar**: Bedriftsutrullingsmønstre med virkelighetseksempler

### [v2.0.0] - 2025-09-09

#### Store endringer - Arkivrestruktur og profesjonell forbedring
**Denne versjonen representerer en betydelig overhaling av arkivstruktur og innholdspresentasjon.**

#### Lagt til
- **Strukturert læringsrammeverk**: Alle dokumentasjonsider inkluderer nå seksjonene Introduksjon, Læringsmål og Læringsutbytte
- **Navigasjonssystem**: Lagt til Lenker for forrige/neste leksjon gjennom all dokumentasjon for styrt læringsprogresjon
- **Studieguide**: Omfattende studie-guide.md med læringsmål, praksisøvelser og vurderingsmateriell
- **Profesjonell presentasjon**: Fjernet alle emoji-ikoner for forbedret tilgjengelighet og profesjonelt utseende
- **Forbedret innholdsstruktur**: Bedre organisering og flyt i læringsmateriellet

#### Endret
- **Dokumentasjonsformat**: Standardisert all dokumentasjon med konsistent læringsfokusert struktur
- **Navigasjonsflyt**: Implementert logisk progresjon i alt læringsmateriell
- **Innholdspresentasjon**: Fjernet dekorative elementer til fordel for klar, profesjonell formatering
- **Lenkestruktur**: Oppdatert alle interne lenker for å støtte nytt navigasjonssystem

#### Forbedret
- **Tilgjengelighet**: Fjernet avhengigheter til emojis for bedre kompatibilitet med skjermlesere
- **Profesjonelt utseende**: Rent, akademisk stilert presentasjon egnet for bedriftslæring
- **Læringsopplevelse**: Strukturert tilnærming med klare mål og utbytte for hver leksjon
- **Innholdsorganisering**: Bedre logisk flyt og sammenheng mellom relaterte emner

### [v1.0.0] - 2025-09-09

#### Første utgivelse - Omfattende AZD læringsarkiv

#### Lagt til
- **Kjernedokumentasjonsstruktur**
  - Komplett startguide-serie
  - Omfattende dokumentasjon for utrulling og provisjonering
  - Detaljerte feilsøkingsressurser og debug-veiledninger
  - Verktøy og prosedyrer for forhåndsvalidering av utrulling

- **Start-modul**
  - AZD Grunnleggende: Kjernedefinisjoner og terminologi
  - Installasjonsveiledning: Plattformspesifikke oppsettsinstruksjoner
  - Konfigurasjonsveiledning: Miljøoppsett og autentisering
  - Første prosjekt-tutorial: Trinnvis praktisk læring

- **Utrulling og provisjons-modul**
  - Utrullingsveiledning: Fullstendig arbeidsflytdokumentasjon
  - Provisjonsveiledning: Infrastruktur som kode med Bicep
  - Beste praksis for produksjonsutrullinger
  - Mønstre for multitisjonstruktur

- **Forhåndsvalideringsmodul**
  - Kapasitetsplanlegging: Validering av tilgjengelighet for Azure-ressurser
  - SKU-valg: Omfattende veiledning for tjenestenivå
  - Sjekklister før utrulling: Automatiserte valideringsskript (PowerShell og Bash)
  - Kostnadsestimerings- og budsjettplanleggingsverktøy

- **Feilsøkingsmodul**
  - Vanlige problemer: Ofte møtte utfordringer og løsninger
  - Feilsøkingsveiledning: Systematiske metoder for feilsøking
  - Avanserte diagnostiske teknikker og verktøy
  - Ytelsesovervåkning og optimalisering

- **Ressurser og referanser**
  - Kommando-jukseside: Rask referanse for essensielle kommandoer
  - Ordliste: Omfattende terminologi- og akronymdefinisjoner
  - FAQ: Detaljerte svar på vanlige spørsmål
  - Eksterne ressurslenker og fellesskapsforbindelser

- **Eksempler og maler**
  - Enkelt webapplikasjonseksempel
  - Mal for utrulling av statisk nettsted
  - Konfigurasjon for containerapplikasjon
  - Integrasjonsmønstre for databaser
  - Eksempler på mikrotjenestearkitektur
  - Serverløse funksjonsimplementeringer

#### Funksjoner
- **Støtte for flere plattformer**: Installasjons- og konfigurasjonsveiledninger for Windows, macOS og Linux
- **Flere ferdighetsnivåer**: Innhold tilpasset studenter til profesjonelle utviklere
- **Praktisk fokus**: Praktiske eksempler og virkelige scenarier
- **Omfattende dekningsgrad**: Fra grunnleggende konsepter til avanserte bedriftsmønstre
- **Sikkerhetsfokus først**: Integrert sikkerhetspraksis gjennom hele innholdet
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive utrullinger og ressursstyring

#### Dokumentasjonskvalitet
- **Detaljerte kodeeksempler**: Praktiske, testede kodeeksempler
- **Trinnvise instruksjoner**: Klare, handlingsorienterte veiledninger
- **Omfattende feilhåndtering**: Feilsøking for vanlige problemer
- **Integrasjon av beste praksis**: Bransjestandarder og anbefalinger
- **Versjonskompatibilitet**: Oppdatert med nyeste Azure-tjenester og azd-funksjoner

## Planlagte fremtidige forbedringer

### Versjon 3.1.0 (Planlagt)
#### Utvidelse av AI-plattform
- **Støtte for flere modeller**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egendefinerte modeller
- **AI-Agent-rammeverk**: Maler for LangChain, Semantic Kernel og AutoGen-utplasseringer
- **Avanserte RAG-mønstre**: Vektor databasesystemer utover Azure AI Search (Pinecone, Weaviate osv.)
- **AI-observabilitet**: Forbedret overvåkning av modellprestasjon, tokenbruk og responskvalitet

#### Utvikleropplevelse
- **VS Code Extension**: Integrert AZD + Microsoft Foundry utvikleropplevelse
- **GitHub Copilot Integrasjon**: AI-assistert generering av AZD-maler
- **Interaktive tutorials**: Praktiske kodingøvelser med automatisk validering for AI-scenarier
- **Videoinnhold**: Supplerende videotutorials for visuelle lærende med fokus på AI-utplassering

### Versjon 4.0.0 (Planlagt)
#### Bedrifts-AI-mønstre
- **Styringsrammeverk**: AI-modellstyring, samsvar og revisjonsspor
- **Multi-leietaker AI**: Mønstre for å servere flere kunder med isolerte AI-tjenester
- **Edge AI-utplassering**: Integrasjon med Azure IoT Edge og container-instans
- **Hybrid sky AI**: Multisky- og hybridutrullingsmønstre for AI-arbeidsbelastninger

#### Avanserte funksjoner
- **AI-pipeline-automatisering**: MLOps-integrasjon med Azure Machine Learning pipelines
- **Avansert sikkerhet**: Zero-trust-mønstre, private endepunkter og avansert trusselbeskyttelse
- **Ytelsesoptimalisering**: Avanserte innstillings- og skaleringsstrategier for høy gjennomstrømming av AI-applikasjoner
- **Global distribusjon**: Innholdsleverings- og edge-caching-mønstre for AI-applikasjoner

### Versjon 3.0.0 (Planlagt) - Overgått av nåværende utgivelse
#### Foreslåtte tillegg - Nå implementert i v3.0.0
- ✅ **AI-fokusert innhold**: Omfattende Microsoft Foundry-integrasjon (Fullført)
- ✅ **Interaktive tutorials**: Praktisk AI-workshoplab (Fullført)
- ✅ **Avansert sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)
- ✅ **Ytelsesoptimalisering**: AI-arbeidsbelastning tuningstrategier (Fullført)

### Versjon 2.1.0 (Planlagt) - Delvis implementert i v3.0.0
#### Mindre forbedringer - Noen fullført i nåværende utgivelse
- ✅ **Flere eksempler**: AI-fokuserte deployscenarier (Fullført)
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)
- **Verktøyintegrasjon**: Forbedrede IDE- og redaktørintegrasjonsveiledninger
- ✅ **Overvåkningsutvidelse**: AI-spesifikke overvåkings- og alarmeringsmønstre (Fullført)

#### Fortsatt planlagt for fremtidig utgivelse
- **Mobilvennlig dokumentasjon**: Responsivt design for mobil læring
- **Offline-tilgang**: Nedlastbare dokumentasjonspakker
- **Forbedret IDE-integrasjon**: VS Code extension for AZD + AI-arbeidsflyter
- **Fellesskapsdashboard**: Sanntids fellesskapsmålinger og bidragssporing

## Å bidra til endringsloggen

### Rapportere endringer
Når du bidrar til dette arkivet, vennligst sørg for at endringsloggoppføringer inkluderer:

1. **Versjonsnummer**: Følger semantisk versjonering (major.minor.patch)
2. **Dato**: Utgivelses- eller oppdateringsdato i YYYY-MM-DD-format
3. **Kategori**: Lagt til, Endret, Utdaterte, Fjernet, Fikset, Sikkerhet
4. **Klar beskrivelse**: Kortfattet beskrivelse av hva som er endret
5. **Konsekvensvurdering**: Hvordan endringene påvirker eksisterende brukere

### Endringskategorier

#### Lagt til
- Nye funksjoner, dokumentasjonsseksjoner eller kapasiteter
- Nye eksempler, maler eller læringsressurser
- Ytterligere verktøy, skript eller hjelpemidler

#### Endret
- Endringer i eksisterende funksjonalitet eller dokumentasjon
- Oppdateringer for bedre klarhet eller nøyaktighet
- Omstrukturering av innhold eller organisasjon

#### Utdaterte
- Funksjoner eller metoder som fases ut
- Dokumentasjonsseksjoner planlagt fjernet
- Metoder som har bedre alternativer

#### Fjernet
- Funksjoner, dokumentasjon eller eksempler som ikke lenger er relevante
- Utdatert informasjon eller utdaterte tilnærminger
- Overflødig eller konsolidert innhold

#### Fikset
- Korreksjoner til feil i dokumentasjon eller kode
- Løsning av rapporterte problemer eller feil
- Forbedringer i nøyaktighet eller funksjonalitet


#### Sikkerhet
- Forbedringer eller feilrettinger relatert til sikkerhet
- Oppdateringer til beste praksis for sikkerhet
- Løsning av sikkerhetssårbarheter

### Retningslinjer for semantisk versjonering

#### Hovedversjon (X.0.0)
- Brytende endringer som krever brukerhandling
- Betydelig omstrukturering av innhold eller organisering
- Endringer som endrer den grunnleggende tilnærmingen eller metodikken

#### Mindre versjon (X.Y.0)
- Nye funksjoner eller innholds tillegg
- Forbedringer som opprettholder bakoverkompatibilitet
- Ytterligere eksempler, verktøy eller ressurser

#### Patch-versjon (X.Y.Z)
- Feilrettinger og korreksjoner
- Mindre forbedringer av eksisterende innhold
- Klargjøringer og små forbedringer

## Tilbakemeldinger og forslag fra fellesskapet

Vi oppfordrer aktivt tilbakemeldinger fra fellesskapet for å forbedre denne læringsressursen:

### Hvordan gi tilbakemelding
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-spesifikke problemer er velkomne)
- **Discord-diskusjoner**: Del ideer og engasjer deg med Microsoft Foundry-fellesskapet
- **Pull Requests**: Bidra direkte til forbedringer av innhold, spesielt AI-maler og guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen for diskusjoner om AZD + AI
- **Fellesskapsfora**: Delta i bredere diskusjoner for Azure-utviklere

### Kategorier for tilbakemelding
- **AI-innholdets nøyaktighet**: Korrigeringer av informasjon om AI-tjenesteintegrasjon og distribusjon
- **Læringsopplevelse**: Forslag til forbedret læringsflyt for AI-utviklere
- **Manglende AI-innhold**: Forespørsler om flere AI-maler, mønstre eller eksempler
- **Tilgjengelighet**: Forbedringer for ulike læringsbehov
- **Integrasjon av AI-verktøy**: Forslag til bedre integrasjon av AI i utviklingsflyt
- **Produksjonsmønstre for AI**: Forespørsler om mønstre for enterprise AI-distribusjon

### Forpliktelse til respons
- **Respons på problemer**: Innen 48 timer for rapporterte problemer
- **Funksjonsforespørsler**: Vurdering innen én uke
- **Bidrag fra fellesskapet**: Gjennomgang innen én uke
- **Sikkerhetsproblemer**: Umiddelbar prioritet med hurtig respons

## Vedlikeholdsplan

### Regelmessige oppdateringer
- **Månedlige gjennomganger**: Innholdsnøyaktighet og validering av lenker
- **Kvartalsvise oppdateringer**: Store tillegg og forbedringer av innhold
- **Halvårlige gjennomganger**: Omfattende omstrukturering og forbedringer
- **Årlige utgivelser**: Oppdateringer til hovedversjoner med betydelige forbedringer

### Overvåkning og kvalitetssikring
- **Automatiserte tester**: Regelmessig validering av kodeeksempler og lenker
- **Integrering av tilbakemeldinger fra fellesskapet**: Regelmessig innarbeiding av brukersuggesjoner
- **Teknologioppdateringer**: Justering til nyeste Azure-tjenester og azd-utgivelser
- **Tilgjengelighetsrevisjoner**: Regelmessig gjennomgang for inkluderende designprinsipper

## Policy for versjonsstøtte

### Gjeldende versjonsstøtte
- **Nyeste hovedversjon**: Full støtte med regelmessige oppdateringer
- **Forrige hovedversjon**: Sikkerhetsoppdateringer og kritiske feilrettinger i 12 måneder
- **Eldre versjoner**: Kun fellesskapsstøtte, ingen offisielle oppdateringer

### Migrasjonsveiledning
Når hovedversjoner lanseres, tilbyr vi:
- **Migrasjonsveiledninger**: Trinnvise overgangsinstruksjoner
- **Kompatibilitetsnotater**: Detaljer om brytende endringer
- **Verktøystøtte**: Skript eller verktøy for å bistå med migrasjon
- **Fellesskapsstøtte**: Dedikerte forum for spørsmål om migrasjon

---

**Navigasjon**
- **Forrige leksjon**: [Study Guide](resources/study-guide.md)
- **Neste leksjon**: Gå tilbake til [Main README](README.md)

**Hold deg oppdatert**: Følg dette depotet for varsler om nye utgivelser og viktige oppdateringer til læringsmaterialene.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->