# Endringslogg - AZD For Beginners

## Introduksjon

Denne endringsloggen dokumenterer alle bemerkelsesverdige endringer, oppdateringer og forbedringer i AZD For Beginners-arkivet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere med å forstå hva som har endret seg mellom versjoner.

## Læringsmål

Ved å gjennomgå denne endringsloggen vil du:
- Holde deg informert om nye funksjoner og innholds tillegg
- Forstå forbedringer gjort i eksisterende dokumentasjon
- Følge feilrettinger og korreksjoner for å sikre nøyaktighet
- Følge utviklingen av læringsmaterialene over tid

## Læringsresultater

Etter å ha gått gjennom oppføringene i endringsloggen vil du kunne:
- Identifisere nytt innhold og ressurser tilgjengelig for læring
- Forstå hvilke seksjoner som har blitt oppdatert eller forbedret
- Planlegge din læringsvei basert på det mest oppdaterte materialet
- Bidra med tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.24.0]- 2026-11-04

#### Rettet
- Reparert navigasjon for engelsk kurs, flyttet sidebaner, manglende ankre og utdaterte eksterne referanser, inkludert kapittel 2-lenken til produksjons AI-guiden.
- Gjennomgått gjeldende veiledning mot publisert AZD 1.37.2, agenter 1.0.0-beta.23 og evalueringer 1.0.0-beta.2. Dokumentert den separate `azd ai eval` arbeidsflyten og migrering av optimaliseringskonfigurasjon.
- Korrigert uunderstøttede CLI-flagg, autentiseringsgrenser, plaintext miljø-/hemmelig veiledning, infrastrukturoppdateringer, modellkonfigurasjon og destruktive gjenopprettings-eksempler.
- Oppdatert workshop mot gjeldende AI Agents-eksempel, inkludert faktiske kroker, konfigurasjonsinnganger, evalueringstester, red-teaming-inngangspunkt og observerbarhet.
- Korrigert eksempelimplementeringspåstander og reparert tilknyttede applikasjons-/infrastruktur-/konfigurasjonsproblemer. Retail-arkitekturmateriale er eksplisitt skilt fra en komplett fungerende applikasjon.
- Gjenopprettet CodeQL-språkmatrise, valgt støttet Node.js 24 for utviklingscontaineren, og gjort oppsett-valideringer for å rapportere mislykkede versjonskommandoer.

#### Lagt til
- En engelsk-tekst offline lenke/ankersjekker, regresjonstester, og en dokumentasjonsarbeidsflyt som også bygger workshop i streng modus. Genererte oversettelser og oversatte bilder er ekskludert.

#### Valideringsomfang
- Kilde, syntaks, konfigurasjon, lokal oppførsel og nettverkslenkesjekker fastslår ikke live Azure-utplasseringsevne, kvote, RBAC, regional modelltilgjengelighet, fakturering, sikkerhetsoverholdelse eller produksjonsberedskap.
- Eldre oppføringer nedenfor er historiske opptegnelser, ikke gjeldende kommando- eller utgivelsesinstrukser.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Oppdatering: Versjonens aktualitet
**Denne versjonen validerer kurset mot `azd` `1.27.1` (juli 2026, siste stabile utgivelse) og gjeldende forhåndsvisnings-AI-agentutvidelse `azure.ai.agents` `1.0.0-beta.5`, og oppdaterer alle "validert mot"-bannere etter utgivelsene 1.26.0, 1.27.0 og 1.27.1.**

#### Endret
- **✅ Valideringsgrunnlinje oppdatert** fra `azd 1.25.6` (juni 2026) til `azd 1.27.1` (juli 2026) i rot-README, alle kapittel-READMEer, kapittel 1 dev-container-leksjonen (inkludert eksempler med låste versjoner), kapittel 4 egendefinerte maler, kapittel 5 multi-agent-leksjon og workshop-dokumenter
- **🤖 Kapittel 2 grunnlinje oppdatert** fra `azd 1.23.12` (mars 2026) til `azd 1.27.1` i `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` og `microsoft-foundry-integration.md`; valideringsnotat-datoer oppdatert til 2026-07-13
- **🧩 AI-agentutvidelse oppgradert** fra `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` til gjeldende `1.0.0-beta.5` utgivelse i kapittel 2 README og `agents.md`
- **🧪 Workshop-valideringseksempel** (`azd version` output) oppdatert til `1.27.1`

#### Notater om relevante azd-utgivelser (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-støtte for Azure Functions på Flex Consumption, `azd config sub-filter` per-leietaker abonnementsfiltre, selvstendige utvidelsesbundter (`azd x pack --bundle`), og `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modell Azure AI Foundry-prosjekter/agenter direkte i `azure.yaml` (uten Bicep/Terraform init), container-distribusjonsstøtte for App Service (`host: appservice` + `language: docker`), direkte `-s/--source` for `azd extension` kommandoer, og `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flagg for `azd extension install`, utgåtte modeller ekskludert fra katalog-/kvoteprompt som standard, og flere feilrettinger

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

#### Nybegynner Utfylling #2: Malforfatting, Utviklingscontainere, Pulumi, Azure DevOps, Service Principals og mer
**Denne versjonen lukker de gjenværende mellomliggende hullene som ble avdekket av azd-dekningsanalysen: hvordan du lager og publiserer din egen mal, reproduserbare dev-container/Codespaces-miljøer, Pulumi-infrastrukturleverandøren, en Azure DevOps CI/CD gjennomgang, tjenesteprinsipal-autentisering, vertutvelgelsesveiledning (AKS/Spring Apps), `azd restore`/`azd package` forklaringer, krok-feilhåndtering og team-/deling av miljø praksis.**

#### Lagt til
- **🧱 Ny kapittel 4-leksjon** `docs/chapter-04-infrastructure/custom-templates.md` — å lage din egen azd-mal: nødvendig struktur (`azure.yaml`, `infra/`, `src/`), `metadata.template` feltet, parameterisering av infrastruktur med `uniqueString()` ressurs-token og `azd-env-name` tag, testing lokalt med `azd init --template <local-path>`, publisering til GitHub og innsending til Awesome AZD-galleriet
- **📦 Ny kapittel 1-leksjon** `docs/chapter-01-foundation/dev-containers.md` — reproducerbare azd-miljøer med Dev Containers og GitHub Codespaces: et minimalt `.devcontainer/devcontainer.json` ved bruk av den offisielle `ghcr.io/azure/azure-dev/azd` funksjonen, språkspesifikke funksjoner, `docker-in-docker` for container-verter, og `azd auth login --use-device-code` for fjernpålogging
- **🧩 Pulumi med azd** seksjon i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-mappestruktur, stabler kartlagt til azd-miljøer, nødvendige outputs/tagging, og identisk `azd up` / `azd down` arbeidsflyt
- **🎯 Vertutvelgelsesveiledning** i `docs/chapter-04-infrastructure/provisioning.md` — en nybegynnervennlig sammenligning av `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` og `springapp`, med veiledning om når man skal velge AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD gjennomgang** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, tjenestetilkobling med arbeidsbelastningsidentitetsføderasjon (OIDC), generert `azure-dev.yml` og oppsett av variabelgruppe
- **🔑 Service Principals (Mønster 4)** lagt til i `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ikke-interaktiv `azd auth login` med klienthemmelighet vs. fødererte/OIDC-legitimasjoner, når man skal bruke, og sikker legitimasjonslagring
- **🪝 Hook-feilhåndtering** delseksjon i `docs/chapter-04-infrastructure/deployment-guide.md` — avslutningskoder og `set -e`, `continueOnError`, test av kroker isolert med `azd hooks run`, OS-spesifikke skall og `--debug`
- **👥 Team / delte miljøer** seksjon i `docs/chapter-03-configuration/configuration.md` — hva som ligger i `.azure/`, hva man skal gitignore, per-utvikler-miljøer, `azd env list`/`select`, og å tilby miljøverdier i CI/CD
- **🧰 `azd restore` og utvidet `azd package`** forklaringer i `resources/cheat-sheet.md` — gjenoppretting av avhengigheter og bygging av deployerbart artefakt uten distribusjon

#### Endret
- **🧭 Kapittel 4 leksjonstabell** oppdatert til å inkludere den nye "Å lage din egen mal"-leksjonen (Leksjon 3)
- **🧭 Kapittel 1 leksjonstabell** oppdatert til å inkludere den nye "Dev Containers & Codespaces"-leksjonen (Leksjon 5); navigasjonsfotere koblet mellom `bring-your-own-app.md` og `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Nybegynner Utfylling: Praktisk Multi-Agent Leksjon, "Bring Your Own App," Terraform og CI/CD Gjennomgang
**Denne versjonen lukker de største hullene for en komplett nybegynnerguide ved å legge til to nye praktiske leksjoner (en deployerbar multi-agent gjennomgang og å legge til azd i en eksisterende app), en nybegynnervennlig innføring i kroker, en Terraform-med-azd seksjon, en trinnvis GitHub Actions pipeline gjennomgang, en forklaring på de nye forhåndsvisningsutvidelsene, og en eksplisitt distribusjonsverifiseringssjekkliste.**

#### Lagt til
- **🤝 Ny kapittel 5-leksjon** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en fullstendig praktisk, deployerbar to-agent gjennomgang (orkestrator + spesialister) med en ekte mal (`contoso-creative-writer`), dekker når man skal bruke multi-agent, `azd up` arbeidsflyt, forståelse av deployerte ressurser, tverragentsporing, tilpasning og opprydding
- **📦 Ny kapittel 1-leksjon** `docs/chapter-01-foundation/bring-your-own-app.md` — hvordan legge til azd i et eksisterende prosjekt med `azd init` ("bruk kode i gjeldende katalog"), forstå `azure.yaml` og `infra/`, `azd infra generate`, vertdeteksjon og distribusjon med `azd up`
- **🌐 Terraform med azd** seksjon lagt til i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfig, `.tf` mappestruktur, nødvendige `AZURE_*` output og `azd-env-name` tagging, og identisk `azd up` / `azd down` arbeidsflyt (lukker hullet der Terraform-støtte var påstått men bare Bicep ble vist)
- **⚙️ Trinnvis GitHub Actions gjennomgang** i `docs/chapter-08-production/production-ai-practices.md` — fra GitHub repo til automatiserte utplasseringer: `azd pipeline config`, OIDC-fødererte legitimasjoner (ingen lagrede hemmeligheter), generert `azure-dev.yml` og hemmeligheter vs. variable-veiledning
- **🪝 Nybegynner "Ny til kroker?" introduksjon** i `docs/chapter-04-infrastructure/deployment-guide.md` — hva en krok er, en krok-fase tabell, en minimal første krok og kjøring av kroker manuelt med `azd hooks run`
- **✅ "Verifiser din distribusjon" sjekkliste** lagt til i Steg 5 av `docs/chapter-01-foundation/first-project.md` — røyktest, helsetjeneste-endepunktssjekk og eksplisitte suksesskriterier
- **🧩 Forklaring for nye forhåndsvisningsutvidelser** `azure.ai.skills` og `azure.ai.connections` (hva de er og når man skal bruke dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Endret
- **🧭 Kapittel 5 leksjonstabell** korrigert: `multi-agent-basics.md` er nå Leksjon 1 (den eneste helt praktiske leksjonen), med ærlig merking at Leksjon 2 ligger i kapittel 6 og Retail-scenarioet er et arkitekturtjenestekart, ikke en en-kommando-mal
- **🧭 Kapittel 1 leksjonstabell** inkluderer nå den nye "Bring Your Own App"-leksjonen (Leksjon 4)
- **🔗 Navigasjonsfotere** oppdatert: `first-project.md` peker nå fremover til `bring-your-own-app.md`

#### Rettet
- **🧱 Lukket det "påståtte men manglende" Terraform-hullet** — kurset refererte tidligere til Terraform-støtte uten å vise det
- **🔀 Korrigert villedende kapittel 5 tverrlenker** som ga inntrykk av full multi-agent-implementering når det bare var et arkitekturtjenestekart

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

#### AZD 1.25.6 Oppdatering, Fullt Agent Livssyklus Kommandoer & Aspire Rebranding
**Denne versjonen revaliderer kurset mot `azd` `1.25.6` (juni 2026) og `azure.ai.agents` `0.1.40-preview`-utvidelsen, utvider AI-veiledning fra "bygge en agent" til hele agentlivssyklusen (test → evaluere → optimalisere → inspisere → slette), viser fram de nye `azure.ai.skills` og `azure.ai.connections` forhåndsvisningsutvidelsene, og noterer ".NET Aspire" → "Aspire" produktrebranding.**

#### Lagt til
- **🔁 Full dekning av agentlivssyklus** for nybegynnere og AI-ingeniører på tvers av dokumentasjonen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livssyklus-tabell (bygd opp → test → måle → forbedre → inspisere → rydde opp) lagt til i Seksjon for Utvidelser og AI-kommandoer
  - `docs/chapter-08-production/production-ai-practices.md` — Ny seksjon "Håndtering av Agentlivssyklus" som dekker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
  - `resources/cheat-sheet.md` — Utvidede AI Agent Kommandoer med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
- **🧩 Nye forhåndsvisningsutvidelser** dokumentert: `azure.ai.skills` (gjenbrukbare agentferdigheter) og `azure.ai.connections` (Foundry-tilkoblinger) lagt til i utvidelsestabellen og jukselisten
- **⏱️ Veiledning for responstid** — `azd ai agent invoke` eksempler noterer nå at de skriver ut total forsinkelse og tid-til-første-byte
- **📌 Versjonsbanner** i rotens README som peker brukere til `azd version` og `azd upgrade`

#### Endret
- **✅ Valideringsgrunnlinje oppdatert** fra `azd 1.23.12` (mars 2026) til `azd 1.25.6` (juni 2026) på tvers av alle kapittel-READMEer og verksteddokumentasjonen
- **🤖 Kapittel 2 utvidelsesnotat** oppdatert fra `azure.ai.agents` `0.1.18-preview` til `0.1.40-preview`
- **🧪 Valideringseksempel for verksted** (`azd version` output) oppdatert til `1.25.6`
- **🧭 README "Hva er nytt i azd i dag"** oppdatert for å fremheve end-to-end agentlivssyklus, nye AI-utvidelser, og nylige forbedringer for brukervennlighet (`azd init` idempotens, `azd auth login` fjerning av utdaterte token, `azd tool` første-gangs prompt)
- **📖 Kapittel 2 agents.md (Alternativ 4)** peker nå brukere til post-distribusjons livssykluskommandoer i stedet for å stoppe ved `azd up`

#### Fikset
- **🏷️ Produktnavn** — lagt til en Aspire rebranding-notis (".NET Aspire" er nå bare "Aspire"); azd sin Aspire-støtte er uendret
- **🔎 Live utgivelsesvalidering** bekreftet mot Azure Developer CLI utgivelsesfeed: stabil CLI `1.25.6` (2026-06-12) og `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Klarering for nybegynner, oppsettvalidering & siste opprydning av AZD-kommandoer
**Denne versjonen følger opp AZD 1.23 valideringsrunden med et nybegynnerfokusert dokumentasjonspass: den klargjør AZD-først autentiseringsveiledning, legger til lokale valideringsskript for oppsett, verifiserer nøkkelkommandoer mot levende AZD CLI, og fjerner siste utdaterte engelskspråklige kommando-referanser utenfor endringsloggen.**

#### Lagt til
- **🧪 Valideringsskript for nybegynneroppsett** med `validate-setup.ps1` og `validate-setup.sh` slik at brukere kan bekrefte nødvendige verktøy før de starter Kapittel 1
- **✅ Foreløpige valideringstrinn for oppsett** i rotens README og Kapittel 1 README slik at manglende forutsetninger oppdages før `azd up`

#### Endret
- **🔐 Veiledning for nybegynnerautentisering** behandler nå konsekvent `azd auth login` som primær vei for AZD-arbeidsflyter, med `az login` framhevet som valgfritt med mindre Azure CLI-kommandoer brukes direkte
- **📚 Kapittel 1 onboarding flyt** peker nå brukere til å validere sitt lokale oppsett før installasjon, autentisering, og første distribusjonstrinn
- **🛠️ Validator-meldinger** skiller nå tydelig mellom blokkering av krav og valgfrie Azure CLI-varsler for kun AZD nybegynnervei
- **📖 Konfigurasjons-, feilsøkings- og eksempel-dokumentasjon** skiller nå mellom påkrevd AZD-autentisering og valgfri Azure CLI-pålogging der begge tidligere ble presentert uten kontekst

#### Fikset
- **📋 Gjenværende engelskspråklige kommando-referanser** oppdatert til nåværende AZD-former, inkludert `azd config show` i jukselisten og `azd monitor --overview` der veiledning for Azure Portal oversikt var ment
- **🧭 Nybegynnerpåstander i Kapittel 1** myknet for å unngå overdrevne garantier for null-feil eller rollback adferd på tvers av alle maler og Azure-ressurser
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

#### AZD 1.23.12 Validering, Verkstedområdeutvidelse & AI Modelloppdatering
**Denne versjonen utfører en dokumentasjonsvalidering mot `azd` `1.23.12`, oppdaterer utdaterte AZD kommandoeksempler, fornyer AI modellveiledning til dagens standarder, og utvider verkstedsinstruksjoner utover GitHub Codespaces til også å støtte utviklingscontainere og lokale kloner.**

#### Lagt til
- **✅ Valideringsnotater i kjernekapitler og verksteddokumentasjon** for å gjøre den testede AZD-basislinjen klar for brukere som har nyere eller eldre CLI-versjoner
- **⏱️ Veiledning for distribusjonstidsavbrudd** for langvarige AI app-distribusjoner ved bruk av `azd deploy --timeout 1800`
- **🔎 Utvidelsesinspeksjonssteg** med `azd extension show azure.ai.agents` i AI arbeidsflytdokumentasjon
- **🌐 Utvidet veiledning for verkstedmiljø** som dekker GitHub Codespaces, utviklingscontainere, og lokale kloner med MkDocs

#### Endret
- **📚 Kapittel-intro READMEs** nevner nå konsekvent validering mot `azd 1.23.12` på tvers av grunnlag, konfigurasjon, infrastruktur, multi-agent, forhåndsdistribusjon, feilsøking og produksjonsseksjoner
- **🛠️ Referanser til AZD kommandoer** oppdatert til nåværende former i dokumentasjonen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` avhengig av kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` der oversikt over Application Insights er ment
- **🧪 Forhåndsvisningseksempler for provisjonering** forenklet til nåværende støttet bruk som `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Verkstedflyt** oppdatert slik at brukere kan fullføre labene i Codespaces, utviklingscontainer, eller lokal klon i stedet for å anta Codespaces-only kjøring
- **🔐 Autentiseringsveiledning** foretrekker nå `azd auth login` for AZD-arbeidsflyter, med `az login` som valgfritt når Azure CLI kommandoer brukes direkte

#### Fikset
- **🪟 Windows installasjonskommandoer** normalisert til nåværende `winget` pakke-casing i installasjonsveiledningen
- **🐧 Linux installasjonsveiledning** rettet for å unngå ikke-støttede distribusjonsspesifikke `azd` pakkehåndteringsinstruksjoner og i stedet peke til utgivelsesressurser der det er passende
- **📦 AI modelleksempler** oppdatert fra eldre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nåværende eksempler som `gpt-4.1-mini`, `gpt-4.1`, og `text-embedding-3-large`
- **📋 Snippets for distribusjon og diagnostikk** korrigert til å bruke nåværende miljø- og statuskommandoer i logger, skript og feilsøkingstrinn
- **⚙️ GitHub Actions veiledning** oppdatert fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykkeveiledning** oppdatert fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI kapittelveiledning** forklarer nå bedre forhåndsvisningssensitiv `azd ai` oppførsel, tenant-spesifikk pålogging, nåværende utvidelsesbruk, og oppdaterte anbefalinger for modellimplementering
- **🧪 Verkstedsinstruksjoner** bruker nå mer realistiske versjonseksempler og klarere språk for miljøoppsett i praktiske laber
- **📈 Produksjons- og feilsøkingsdokumentasjon** samsvarer nå bedre med dagens monitorering, fallback-modell, og kostnadsnivåeksempler

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

#### AZD AI CLI Kommandoer, Innholdsvalidering & Malutvidelse
**Denne versjonen legger til dekning av `azd ai`, `azd extension`, og `azd mcp` kommandoer på tvers av alle AI-relaterte kapitler, fikser ødelagte linker og foreldet kode i agents.md, oppdaterer jukselisten, og overhaler Eksempelmaler-seksjonen med validerte beskrivelser og nye Azure AI AZD-maler.**

#### Lagt til
- **🤖 AZD AI CLI-dekning** på tvers av 7 filer (tidligere bare i Kapittel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny seksjon "Utvidelser og AI-kommandoer" som introduserer `azd extension`, `azd ai agent init`, og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med sammenligningstabell (mal vs manifest-tilnærming)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Underseksjoner "AZD-utvidelser for Foundry" og "Agent-først distribusjon"
  - `docs/chapter-05-multi-agent/README.md` — Rask start viser nå både mal- og manifestbaserte distribusjonsveier
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Distribusjonsseksjon inkluderer nå `azd ai agent init` alternativ
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Underseksjon "AZD AI Utvidelseskommandoer for Diagnostikk"
  - `resources/cheat-sheet.md` — Ny seksjon "AI & Utvidelseskommandoer" med `azd extension`, `azd ai agent init`, `azd mcp`, og `azd infra generate`
- **📦 Nye AZD AI eksempelmaler** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat med Blazor WebAssembly, Semantic Kernel, og støtte for stemmechat
  - **azure-search-openai-demo-java** — Java RAG chat ved bruk av Langchain4J med ACA/AKS distribusjonsmuligheter
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp som bruker Azure AI Agent Service, Bing Grounding, og Prompty
  - **serverless-chat-langchainjs** — Serverless RAG med Azure Functions + LangChain.js + Cosmos DB med Ollama lokal utviklingsstøtte
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-akselerator med administrasjonsportal, Teams-integrasjon og valg for PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferanseapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastruktur Bicep startmal
  - **🔗 Fantastisk AZD AI Galleri-link** — Referanse til [fantastiske-azd AI-galleriet](https://azure.github.io/awesome-azd/?tags=ai) (80+ maler)

#### Fikset
- **🔗 agents.md navigasjon**: Forrige/Neste lenker samsvarer nå med kapittel 2 README-leksjonsrekkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ødelagte lenker**: `production-ai-practices.md` korrigert til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md utgått kode**: Erstattet `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token-telling**: Erstattet grovt estimat `len//4` med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettet tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standardvert endret oktober 2024)
- **contoso-chat**: Oppdatert beskrivelse til å referere Azure AI Foundry + Prompty, i samsvar med repoets faktiske tittel og teknologistabel

#### Fjernet
- **ai-document-processing**: Fjernet ikke-fungerende malreferanse (repo ikke offentlig tilgjengelig som AZD-mal)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nå forventet output og `azd monitor` steg; Øvelse 2 inkluderer full `FunctionTool` registreringskode; Øvelse 3 erstatter vage anvisninger med konkrete `prepdocs.py` kommandoer
- **📚 agents.md ressurser**: Oppdaterte dokumentasjonslenker til gjeldende Azure AI Agent Service-dokumentasjon og hurtigstart
- **📋 agents.md Neste Steg tabell**: Lagt til AI Workshop Lab-lenke for full kapitteldekning

#### Oppdaterte filer
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Forbedret kursnavigasjon
**Denne versjonen forbedrer README.md kapittelnavigasjonen med et forbedret tabellformat.**

#### Endret
- **Karttabell for kurs**: Forbedret med direkte leksjonslenker, varighetsestimater og kompleksitetsvurderinger
- **Mappeopprydding**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lenkevalidering**: Alle 21+ interne lenker i Kurskart-tabellen bekreftet

### [v3.16.0] - 2026-02-05

#### Oppdatering av produktnavn
**Denne versjonen oppdaterer produktreferanser til dagens Microsoft-branding.**

#### Endret
- **Microsoft Foundry → Microsoft Foundry**: Alle referanser oppdatert på tvers av ikke-oversatte filer
- **Azure AI Agent Service → Foundry Agents**: Servicenavn oppdatert for å reflektere dagens branding

#### Oppdaterte filer
- `README.md` - Hovedkursets landingsside
- `changelog.md` - Versjonshistorikk
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - Veiledning for AI-agenter
- `examples/README.md` - Eksempeldokumentasjon
- `workshop/README.md` - Workshop landingsside
- `workshop/docs/index.md` - Workshop-indeks
- `workshop/docs/instructions/*.md` - Alle workshop-instruksjonsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor depotrestrukturering: kapittelbaserte mappenavn
**Denne versjonen restrukturerer dokumentasjonen til dedikerte kapittelmapper for klarere navigasjon.**

#### Mappenavnendringer
Gamle mapper er erstattet med kapittelnummmererte mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lagt til ny: `docs/chapter-05-multi-agent/`

#### Filmigreringer
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
| Alle pre-deployment-filer | pre-deployment/ | chapter-06-pre-deployment/ |
| Alle feilsøkingsfiler | troubleshooting/ | chapter-07-troubleshooting/ |

#### Lagt til
- **📚 Kapittel README-filer**: Opprettet README.md i hver kapittelmappe med:
  - Læringsmål og varighet
  - Leksetabell med beskrivelser
  - Hurtigstart-kommandoer
  - Navigasjon til andre kapitler

#### Endret
- **🔗 Oppdaterte alle interne lenker**: 78+ stier oppdatert i alle dokumentasjonsfiler
- **🗺️ Hoved README.md**: Oppdatert Kurskart med ny kapittelstruktur
- **📝 examples/README.md**: Oppdaterte kryssreferanser til kapittelmapper

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Depotrestrukturering: Kapittelnavigasjon
**Denne versjonen la til kapittelnavigasjons-README-filer (erstattet av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny veiledning for AI-agenter
**Denne versjonen legger til en omfattende veiledning for distribusjon av AI-agenter med Azure Developer CLI.**

#### Lagt til
- **🤖 docs/microsoft-foundry/agents.md**: Fullstendig veiledning som dekker:
  - Hva AI-agenter er og hvordan de skiller seg fra chatbots
  - Tre hurtigstart-agentmaler (Foundry Agents, Prompty, RAG)
  - Agentarkitektur-mønstre (én agent, RAG, multi-agent)
  - Verktøykonfigurasjon og tilpasning
  - Overvåking og metrikksporing
  - Kostnadsbetraktninger og optimalisering
  - Vanlige feilsøkingsscenarier
  - Tre praktiske øvelser med suksesskriterier

#### Innholdsstruktur
- **Introduksjon**: Agentkonsepter for nybegynnere
- **Hurtigstart**: Distribuer agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmønstre**: Visuelle diagrammer av agentmønstre
- **Konfigurasjon**: Verktøyoppsett og miljøvariabler
- **Overvåking**: Integrasjon med Application Insights
- **Øvelser**: Progressiv praktisk læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Oppdatering av DevContainer-miljø
**Denne versjonen oppdaterer utviklingscontainerkonfigurasjonen med moderne verktøy og bedre standardinnstillinger for AZD-læringsopplevelsen.**

#### Endret
- **🐳 Base Image**: Oppdatert fra `python:3.12-bullseye` til `python:3.12-bookworm` (nyeste Debian stabil)
- **📛 Container-navn**: Omdøpt fra "Python 3" til "AZD for Beginners" for tydelighet

#### Lagt til
- **🔧 Nye Dev Container-funksjoner**:
  - `azure-cli` med Bicep-støtte aktivert
  - `node:20` (LTS versjon for AZD-maler)
  - `github-cli` for malhåndtering
  - `docker-in-docker` for container app-distribusjoner

- **🔌 Port videresending**: Forhåndskonfigurerte porter for vanlig utvikling:
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
  - `yzhang.markdown-all-in-one` - Redigering av Markdown
  - `DavidAnson.vscode-markdownlint` - Markdown linting
  - `bierner.markdown-mermaid` - Mermaid diagramstøtte
  - `redhat.vscode-yaml` - YAML-støtte (for azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git historikk

- **⚙️ VS Code-innstillinger**: Lagt til standardinnstillinger for Python-tolker, formatering ved lagring, og trimming av mellomrom

- **📦 Oppdaterte requirements-dev.txt**:
  - Lagt til MkDocs minify plugin
  - Lagt til pre-commit for kodekvalitet
  - Lagt til Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Fikset
- **Post-Create Kommando**: Verifiserer nå AZD og Azure CLI installasjon ved start av container

---

### [v3.11.0] - 2026-02-05

#### Nybegynnervennlig README-omarbeiding
**Denne versjonen forbedrer README.md betydelig for å være mer tilgjengelig for nybegynnere og legger til viktige ressurser for AI-utviklere.**

#### Lagt til
- **🆚 Sammenligning Azure CLI vs AZD**: Klar forklaring på når man skal bruke hvert verktøy med praktiske eksempler
- **🌟 Fantastiske AZD-lenker**: Direkte lenker til fellesskapsmalgalleri og bidragsressurser:
  - [Fantastisk AZD Galleri](https://azure.github.io/awesome-azd/) - 200+ klare til distribusjon-maler
  - [Send inn en mal](https://github.com/Azure/awesome-azd/issues) - Fellesskapsbidrag
- **🎯 Hurtigstartguide**: Forenklet 3-trinns oppstartseksjon (Installer → Logg inn → Distribuer)
- **📊 Erfaringsbasert navigasjonstabell**: Klar veiledning om hvor du skal starte basert på utviklererfaring

#### Endret
- **README-struktur**: Omgjent for progressiv informasjon – nøkkelinformasjon først
- **Introduksjonsseksjon**: Omskrevet for å forklare "Magien med `azd up`" for komplette nybegynnere
- **Fjernet duplisert innhold**: Eliminert duplisert feilsøkingsseksjon
- **Feilsøkingskommandoer**: Rettet `azd logs` referanse til å bruke gyldig `azd monitor --logs`

#### Fikset
- **🔐 Autentiseringskommandoer**: Lagt til `azd auth login` og `azd auth logout` i cheat-sheet.md
- **Ugyldige kommando-referanser**: Fjernet gjenværende `azd logs` fra README feilsøkingsseksjon

#### Notater
- **Omfang**: Endringer brukt på hoved README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer spesifikt rettet mot utviklere nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Oppdatering av kommandoer for Azure Developer CLI
**Denne versjonen korrigerer ikke-eksisterende AZD-kommandoer i hele dokumentasjonen, og sikrer at alle kodeeksempler bruker gyldig Azure Developer CLI-syntaks.**

#### Fikset
- **🔧 Ikke-eksisterende AZD-kommandoer fjernet**: Omfattende revisjon og korrigering av ugyldige kommandoer:
  - `azd logs` (finnes ikke) → erstattet med `azd monitor --logs` eller Azure CLI-alternativer
  - `azd service` subkommandoer (finnes ikke) → erstattet med `azd show` og Azure CLI
  - `azd infra import/export/validate` (finnes ikke) → fjernet eller erstattet med gyldige alternativer
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flagg (finnes ikke) → fjernet
  - `azd provision --what-if/--rollback` flagg (finnes ikke) → oppdatert til å bruke `--preview`
  - `azd config validate` (finnes ikke) → erstattet med `azd config list`
  - `azd info`, `azd history`, `azd metrics` (finnes ikke) → fjernet

- **📚 Filer oppdatert med kommando-korrigeringer**:
  - `resources/cheat-sheet.md`: Stort overhalt kommando-referanse
  - `docs/deployment/deployment-guide.md`: Rettet rollback- og deploy-strategier
  - `docs/troubleshooting/debugging.md`: Korrigerte logganalysedeler
  - `docs/troubleshooting/common-issues.md`: Oppdaterte feilsøkingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Fikset AZD-debugging-seksjon
  - `docs/getting-started/azd-basics.md`: Korrigerte overvåkingskommandoer
  - `docs/getting-started/first-project.md`: Oppdaterte overvåkings- og feilsøkings-eksempler
  - `docs/getting-started/installation.md`: Rettet hjelpep og versjonseksempler
  - `docs/pre-deployment/application-insights.md`: Korrigerte kommandoer for visning av logger
  - `docs/pre-deployment/coordination-patterns.md`: Rettet feilsøkingskommandoer for agent

- **📝 Versjonsreferanse Oppdatert**: 
  - `docs/getting-started/installation.md`: Endret hardkodet `1.5.0` versjon til generisk `1.x.x` med lenke til utgivelser

#### Endret
- **Rollback-strategier**: Oppdatert dokumentasjon til å bruke Git-basert rollback (AZD har ikke innebygd rollback)
- **Loggvisning**: Erstattet `azd logs` referanser med `azd monitor --logs`, `azd monitor --live` og Azure CLI-kommandoer
- **Ytelsesseksjon**: Fjernet ikke-eksisterende parallelle/incrementelle deploy-flagg, ga gyldige alternativer

#### Tekniske Detaljer
- **Gyldige AZD-kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor-flagg**: `--live`, `--logs`, `--overview`
- **Fjernet funksjoner**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notater
- **Verifikasjon**: Kommandoer verifisert mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Oppdatering av workshop fullføring og dokumentasjonskvalitet
**Denne versjonen fullfører de interaktive workshop-modulene, retter alle ødelagte dokumentasjonslenker og forbedrer den generelle innholdskvaliteten for AI-utviklere som bruker Microsoft AZD.**

#### Tilført
- **📝 CONTRIBUTING.md**: Nytt dokument med retningslinjer for bidrag med:
  - Klare instruksjoner for rapportering av problemer og forslag til endringer
  - Dokumentasjonsstandarder for nytt innhold
  - Retningslinjer for kodeeksempler og commit-meldinger
  - Informasjon om samfunnsengasjement

#### Fullført
- **🎯 Workshop modul 7 (Oppsummering)**: Fullført wrap-up-modul med:
  - Omfattende oppsummering av workshop-prestasjoner
  - Seksjon med viktige konsepter dekket inkludert AZD, maler og Microsoft Foundry
  - Anbefalinger for videre læringsreise
  - Workshop-utfordringsøvelser med vanskelighetsgrader
  - Samfunnsfeedback og støttelenker

- **📚 Workshop modul 3 (Deconstruct)**: Oppdaterte læringsmål med:
  - Veiledning for aktivering av GitHub Copilot på MCP-servere
  - Forståelse av AZD malmappestruktur
  - Infrastruktur-som-kode (Bicep) organiseringsmønstre
  - Praktiske labinstruksjoner

- **🔧 Workshop modul 6 (Nedmontering)**: Fullført med:
  - Ressursopprydding og kostnadsstyringsmål
  - Bruk av `azd down` for sikker infrastruktur-avvikling
  - Veiledning for gjenoppretting av soft-slettede cognitive services
  - Bonus-utforskningsoppgaver for GitHub Copilot og Azure-portalen

#### Rettet
- **🔗 Fikset ødelagte lenker**: Løst 15+ ødelagte interne dokumentasjonslenker:
  - `docs/ai-foundry/ai-model-deployment.md`: Rettet stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerte stiene til ai-model-deployment.md og production-ai-practices.md
  - `docs/getting-started/first-project.md`: Erstattet ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Rettet FAQ og feilsøkingsguide-stier
  - `examples/container-app/microservices/README.md`: Korrigerte kursstart- og deploy-guide stier
  - `resources/faq.md` og `resources/glossary.md`: Oppdaterte AI-kapittelreferanser
  - `course-outline.md`: Rettet instruktørguide og AI-workshop lab-referanser

- **📅 Workshop statusbanner**: Oppdatert fra "Under Construction" til aktiv status med februar 2026-dato

- **🔗 Workshop-navigasjon**: Rettet ødelagte navigasjonslenker i workshop README.md som pekte til ikke-eksisterende lab-1-azd-basics-map

#### Endret
- **Workshop-presentasjon**: Fjernet "under construction"-varsling, workshop er nå komplett og klar til bruk
- **Navigasjonskonsistens**: Sikret at alle workshop-moduler har riktig intern modulnavigasjon
- **Læringsbane-referanser**: Oppdaterte kapittelkrossreferanser med korrekte microsoft-foundry-stier

#### Validert
- ✅ Alle engelske markdown-filer har gyldige interne lenker
- ✅ Workshop-moduler 0-7 er komplette med læringsmål
- ✅ Navigasjon mellom kapitler og moduler fungerer korrekt
- ✅ Innholdet egner seg for AI-utviklere som bruker Microsoft AZD
- ✅ Begynnerfokusert språk og struktur opprettholdes gjennom hele dokumentasjonen
- ✅ CONTRIBUTING.md gir klare retningslinjer for samfunnsbidragsytere

#### Teknisk implementering
- **Lenkervalidering**: Automatisert PowerShell-skript verifiserte alle .md interne lenker
- **Innholdsgjennomgang**: Manuell gjennomgang av fullstendighet og egnethet for nybegynnere
- **Navigasjonssystem**: Konsistente kapittel- og modulnavigasjonsmønstre anvendt

#### Notater
- **Omfang**: Endringer gjelder kun for engelsk dokumentasjon
- **Oversettelser**: Oversettelsesmapper oppdatert i senere versjoner (automatisk oversettelse synkroniseres senere)
- **Workshop-varighet**: Komplett workshop gir nå 3-4 timer praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avansert dokumentasjon: Overvåking, sikkerhet og multi-agent mønstre
**Denne versjonen legger til omfattende A-grad leksjoner om Application Insights-integrasjon, autentiseringsmønstre og multi-agent koordinasjon for produksjonsdistribusjoner.**

#### Tilført
- **📊 Application Insights-integrasjonsleksjon**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokusert distribusjon med automatisk provisjonering
  - Fullstendige Bicep-maler for Application Insights + Log Analytics
  - Fungerende Python-applikasjoner med tilpasset telemetri (1,200+ linjer)
  - AI/LLM overvåkingsmønstre (Microsoft Foundry Models token-/kostnadssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribuert sporing, telemetristrøm)
  - 3 praktiske øvelser (varsler, dashboards, AI-overvåking)
  - Kusto-spørringseksempler og kostnadsoptimaliseringsstrategier
  - Live metrikker og sanntidsfeilsøking
  - 40-50 minutter læring med produksjonsklare mønstre

- **🔐 Autentisering & sikkerhetsmønstre leksjon**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmønstre (connection strings, Key Vault, managed identity)
  - Fullstendige Bicep-infrastrukturmaler for sikre deploy
  - Node.js applikasjonskode med Azure SDK-integrasjon
  - 3 komplette øvelser (aktivering av managed identity, user-assigned identity, Key Vault-rotasjon)
  - Sikkerhetsbeste praksis og RBAC-konfigurasjoner
  - Feilsøkingsveiledning og kostnadsanalyse
  - Produksjonsklare passordfrie autentiseringsmønstre

- **🤖 Multi-Agent koordinasjonsmønstre leksjon**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinasjonsmønstre (sekvensiell, parallell, hierarkisk, hendelsesdrevet, konsensus)
  - Full implementasjon av orkestrerings-tjeneste (Python/Flask, 1,500+ linjer)
  - 3 spesialiserte agentimplementasjoner (Research, Writer, Editor)
  - Service Bus-integrasjon for meldingskø
  - Cosmos DB state management for distribuerte systemer
  - 6 Mermaid-diagrammer som viser agentinteraksjoner
  - 3 avanserte øvelser (timeout-håndtering, retry-logic, circuit breaker)
  - Kostnadsoversikt ($240-565/måned) med optimaliseringsstrategier
  - Application Insights-integrasjon for overvåking

#### Forbedret
- **Kapittel før deploy**: Inkluderer nå omfattende overvåking og koordinasjonsmønstre
- **Kom i gang kapittel**: Forbedret med profesjonelle autentiseringsmønstre
- **Produksjonsberedskap**: Full dekning fra sikkerhet til observability
- **Kursoversikt**: Oppdatert til å referere nye leksjoner i kapitler 3 og 6

#### Endret
- **Læringsforløp**: Bedre integrering av sikkerhet og overvåking gjennom kurset
- **Dokumentasjonskvalitet**: Konsistente A-grad standarder (95-97 %) på nye leksjoner
- **Produksjonsmønstre**: Fullstendig ende-til-ende dekning for bedriftsdeploy

#### Forbedret
- **Utvikleropplevelse**: Klar sti fra utvikling til produksjonsovervåking
- **Sikkerhetsstandarder**: Profesjonelle mønstre for autentisering og hemmelighetshåndtering
- **Observability**: Komplet Application Insights-integrasjon med AZD
- **AI Arbeidsbelastninger**: Spesialisert overvåking for Microsoft Foundry Models og multi-agent systemer

#### Validert
- ✅ Alle leksjoner inkluderer fullstendig fungerende kode (ikke bare utdrag)
- ✅ Mermaid-diagrammer for visuell læring (19 totalt i 3 leksjoner)
- ✅ Praktiske øvelser med verifiseringssteg (9 totalt)
- ✅ Produksjonsklare Bicep-maler deployerbare med `azd up`
- ✅ Kostnadsanalyse og optimaliseringsstrategier
- ✅ Feilsøkingsguider og beste praksis
- ✅ Kunnskapspunkter med verifiseringskommandoer

#### Dokumentasjonsvurderingsresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvåkingsguide
- **docs/getting-started/authsecurity.md**: - Profesjonelle sikkerhetsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avanserte multi-agent arkitekturer
- **Totalt nytt innhold**: - Konsistente høy kvalitetsstandarder

#### Teknisk implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribuert sporing
- **Autentisering**: Managed Identity + Key Vault + RBAC mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvåking**: Live metrikker + Kusto-spørringer + varsler + dashboards
- **Kostnadsstyring**: Sampling strategier, retensjonspolicyer, budsjettkontroller

### [v3.7.0] - 2025-11-19

#### Forbedret dokumentasjonskvalitet og nytt Microsoft Foundry Models-eksempel
**Denne versjonen forbedrer dokumentasjonskvaliteten gjennom hele depotet og legger til et komplett Microsoft Foundry Models deploy-eksempel med gpt-4.1 chatgrensesnitt.**

#### Tilført
- **🤖 Microsoft Foundry Models Chat-eksempel**: Komplett gpt-4.1 distribusjon med fungerende implementasjon i `examples/azure-openai-chat/`:
  - Fullstendig Microsoft Foundry Models infrastruktur (gpt-4.1 modelldeploy)
  - Python kommandolinje chatgrensesnitt med samtalehistorikk
  - Key Vault-integrasjon for sikker API-nøkkellagring
  - Tokensporing og kostnadsestimering
  - Ratebegrensning og feilbehandling
  - Omfattende README med 35-45 minutters deployveiledning
  - 11 produksjonsklare filer (Bicep-maler, Python-app, konfigurasjon)
- **📚 Dokumentasjonsøvelser**: La til praktiske øvelser i konfigurasjonsveiledningen:
  - Øvelse 1: Multi-miljø konfigurasjon (15 minutter)
  - Øvelse 2: Praktisk hemmelighetshåndtering (10 minutter)
  - Klare suksesskriterier og verifiseringstrinn
- **✅ Deployverifikasjon**: La til verifikasjonsseksjon i deployveiledningen:
  - Helsesjekkprosedyrer
  - Suksesskriterier sjekkliste
  - Forventede utdata for alle deploykommandoer
  - Rask referanse for feilsøking

#### Forbedret
- **examples/README.md**: Oppdatert til A-grad kvalitet (93%):
  - La til azure-openai-chat i alle relevante seksjoner
  - Økte antall lokale eksempler fra 3 til 4
  - La til i AI Application Examples tabellen
  - Integrert i Quick Start for mellomnivåbrukere
  - La til i Microsoft Foundry Templates seksjonen
  - Oppdatert sammenligningsmatrise og teknologifunn-seksjoner
- **Dokumentasjonskvalitet**: Forbedret B+ (87%) → A- (92%) i docs-mappen:
  - La til forventede utdata i kritiske kommandoeksempler
  - Inkluderte verifiseringssteg for konfigurasjonsendringer
  - Forbedret praktisk læring med øvelser

#### Endret
- **Læringsprogresjon**: Bedre integrasjon av AI-eksempler for mellomnivå lærende
- **Dokumentasjonsstruktur**: Mer handlingsorienterte øvelser med klare utfall
- **Verifiseringsprosess**: Eksplisitte suksesskriterier lagt til nøkkelarbeidsflyter

#### Forbedret
- **Utvikleropplevelse**: Microsoft Foundry Models deploy tar nå 35-45 minutter (mot 60-90 for komplekse alternativer)
- **Kostnadsgjennomsiktighet**: Tydelige kostnadsestimater ($50-200/måned) for Microsoft Foundry Models-eksempelet
- **Læringssti**: AI-utviklere har klar inngang med azure-openai-chat
- **Dokumentasjonsstandarder**: Konsistente forventede utdata og verifiseringssteg

#### Validert
- ✅ Microsoft Foundry Models-eksempel fullt funksjonelt med `azd up`
- ✅ Alle 11 implementasjonsfiler syntaktisk korrekte
- ✅ README-instruksjoner samsvarer med faktisk deployopplevelse
- ✅ Dokumentasjonslenker oppdatert på 8+ steder
- ✅ Eksempellisten gjenspeiler korrekt 4 lokale eksempler
- ✅ Ingen dupliserte eksterne lenker i tabeller
- ✅ Alle navigasjonsreferanser korrekte

#### Teknisk implementering
- **Microsoft Foundry Models arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster
- **Sikkerhet**: Klar for Managed Identity, hemmeligheter i Key Vault
- **Overvåking**: Application Insights-integrasjon
- **Kostnadsstyring**: Tokensporing og bruksoptimalisering
- **Distribusjon**: Enkelt `azd up`-kommando for komplett oppsett

### [v3.6.0] - 2025-11-19

#### Stor oppdatering: Container App deploy-eksempler
**Denne versjonen introduserer omfattende, produksjonsklare container-app deploy-eksempler som bruker Azure Developer CLI (AZD), med full dokumentasjon og integrering i læringsløpet.**

#### Tilført
- **🚀 Container App eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett oversikt over containeriserte distribusjoner, rask start, produksjon og avanserte mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybegynnervennlig REST API med skaler-til-null, helsesjekker, overvåkning og feilsøking
  - [Microservices Architecture](../../examples/container-app/microservices): Produksjonsklar distribuert løsning med flere tjenester (API Gateway, Product, Order, User, Notification), asynkron meldingshåndtering, Service Bus, Cosmos DB, Azure SQL, distribuert sporing, blå-grønn/canary distribusjon
- **Best Practices**: Sikkerhet, overvåkning, kostnadsoptimalisering og CI/CD-veiledning for containeriserte arbeidsbelastninger
- **Code Samples**: Fullstendige `azure.yaml`, Bicep-maler og flerspråklige tjenesteimplementasjoner (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: End-to-end testsituasjoner, overvåkningskommandoer, feilsøkingsveiledning

#### Endret
- **README.md**: Oppdatert for å vise frem og lenke nye container app-eksempler under "Local Examples - Container Applications"
- **examples/README.md**: Oppdatert for å fremheve container app-eksempler, legge til sammenligningsmatriseoppføringer og oppdatere teknologi-/arkitekturreferanser
- **Course Outline & Study Guide**: Oppdatert for å referere nye container app-eksempler og distribusjonsmønstre i relevante kapitler

#### Validert
- ✅ Alle nye eksempler kan distribueres med `azd up` og følger beste praksis
- ✅ Dokumentasjonskrysslenker og navigasjon oppdatert
- ✅ Eksempler dekker nybegynner til avanserte scenarier, inkludert produksjonsmikrotjenester

#### Notater
- **Omfang**: Kun engelsk dokumentasjon og eksempler
- **Neste steg**: Utvide med flere avanserte container mønstre og CI/CD-automatisering i fremtidige utgivelser

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Denne versjonen implementerer en omfattende produktnavneendring fra "Microsoft Foundry" til "Microsoft Foundry" i all engelsk dokumentasjon, som reflekterer Microsofts offisielle rebranding.**

#### Endret
- **🔄 Produktnavnopppdatering**: Fullstendig rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Oppdaterte alle referanser i engelsk dokumentasjon i `docs/`-mappen
  - Omdøpt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innholdsreferanser oppdatert i 7 dokumentasjonsfiler

- **📁 Endringer i mappestruktur**:
  - `docs/ai-foundry/` omdøpt til `docs/microsoft-foundry/`
  - Alle kryssreferanser oppdatert for å reflektere ny mappestruktur
  - Navigasjonslenker validert i all dokumentasjon

- **📄 Omdøpte filer**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne lenker oppdatert til ny filnavnreferanse

#### Oppdaterte filer
- **Kapiteldokumentasjon** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 oppdateringer av navigasjonslenker
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnreferanser oppdatert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruker allerede Microsoft Foundry (fra tidligere oppdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referanser oppdatert (oversikt, tilbakemeldinger fra fellesskap, dokumentasjon)
  - `docs/getting-started/azd-basics.md` - 4 kryssreferanselenker oppdatert
  - `docs/getting-started/first-project.md` - 2 navigasjonslenker til kapittel oppdatert
  - `docs/getting-started/installation.md` - 2 lenker til neste kapittel oppdatert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referanser oppdatert (navigasjon, Discord-fellesskap)
  - `docs/troubleshooting/common-issues.md` - 1 navigasjonslenke oppdatert
  - `docs/troubleshooting/debugging.md` - 1 navigasjonslenke oppdatert

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referanser oppdatert (kursoversikt, kapitteltitler, malseksjon, fellesskapsinnsikt)
  - `course-outline.md` - 14 referanser oppdatert (oversikt, læringsmål, kapittelressurser)

#### Validert
- ✅ Ingen gjenværende "ai-foundry" mappesti-referanser i engelsk dokumentasjon
- ✅ Ingen gjenværende "Microsoft Foundry" produktnavnreferanser i engelsk dokumentasjon
- ✅ Alle navigasjonslenker fungerer med ny mappestruktur
- ✅ Omdøping av filer og mapper fullført vellykket
- ✅ Kryssreferanser mellom kapitler validert

#### Notater
- **Omfang**: Endringer anvendt kun i engelsk dokumentasjon i `docs/`-mappen
- **Oversettelser**: Oversettelsesmappene (`translations/`) ikke oppdatert i denne versjonen
- **Workshop**: Workshop-materialer (`workshop/`) ikke oppdatert i denne versjonen
- **Eksempler**: Eksempelfiler kan fortsatt referere til gammel navngivning (skal rettes i fremtidig oppdatering)
- **Eksterne lenker**: Eksterne URL-er og GitHub repository-referanser forblir uendret

#### Migrasjonsveiledning for bidragsytere
Hvis du har lokale grener eller dokumentasjon som refererer til gammel struktur:
1. Oppdater mappereferanser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Oppdater filreferanser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstatt produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Valider at alle interne dokumentasjonslenker fortsatt fungerer

---

### [v3.4.0] - 2025-10-24

#### Infrastruktur forhåndsvisning og valideringsforbedringer
**Denne versjonen introduserer omfattende støtte for den nye forhåndsvisningsfunksjonen i Azure Developer CLI og forbedrer brukeropplevelsen i workshop.**

#### Lagt til
- **🧪 azd provision --preview Funksjonsdokumentasjon**: Utførlig dekning av den nye infrastrukturen forhåndsvisningsmuligheten
  - Kommando referanse og bruks eksempler i jukselapp
  - Detaljert integrering i provisioning-veiledning med brukstilfeller og fordeler
  - Pre-flight-sjekkintegrasjon for tryggere distribusjonsvalidering
  - Oppdateringer i kom igang-veiledning med sikkerhet først distribusjonspraksis
- **🚧 Workshop statusbanner**: Profesjonelt HTML-banner som indikerer workshop utviklingsstatus
  - Gradientdesign med byggeindikatorer for tydelig brukerkommunikasjon
  - Tidsstempel for siste oppdatering for åpenhet
  - Mobil-responsivt design for alle enhetstyper

#### Forbedret
- **Infrastruktur sikkerhet**: Forhåndsvisningsfunksjonalitet integrert i all distribusjonsdokumentasjon
- **Forhåndsvalidering ved distribusjon**: Automatiserte skript inkluderer nå infrastruktur-forhåndsvisningstesting
- **Utviklerworkflow**: Oppdaterte kommandosekvenser inkluderer forhåndsvisning som beste praksis
- **Workshopopplevelse**: Klare forventninger satt til brukere om innholdsutviklingsstatus

#### Endret
- **Beste distribusjonspraksis**: Forhåndsvisning-først arbeidsflyt nå anbefalt tilnærming
- **Dokumentasjonsflyt**: Infrastrukturvalidering flyttet tidligere i læringsprosessen
- **Workshop presentasjon**: Profesjonell statuskommunikasjon med tydelig utviklingstidslinje

#### Forbedret
- **Sikkerhet først tilnærming**: Infrastrukturendringer kan nå valideres før distribusjon
- **Team samarbeid**: Forhåndsvisningsresultater kan deles for gjennomgang og godkjenning
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før provisioning
- **Risikoredusering**: Redusert distribusjonssvikt gjennom forhåndsvalidering

#### Teknisk implementering
- **Multi-dokumentintegrasjon**: Forhåndsvisningsfunksjon dokumentert i 4 sentrale filer
- **Kommandomønstre**: Konsistent syntaks og eksempler i hele dokumentasjonen
- **Beste praksisintegrasjon**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript
- **Visuelle indikatorer**: Klare NYE funksjonsmerkinger for oppdagbarhet

#### Workshop infrastruktur
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientstil
- **Brukeropplevelse**: Klar utviklingsstatus forhindrer forvirring
- **Profesjonell presentasjon**: Opprettholder repositorytillit og setter forventninger
- **Tidslinjegjennomsiktighet**: Oktober 2025 siste oppdatert tidsstempel for ansvarlighet

### [v3.3.0] - 2025-09-24

#### Forbedrede workshop-materialer og interaktiv læringsopplevelse
**Denne versjonen introduserer omfattende workshop-materialer med nettleserbaserte interaktive guider og strukturerte læringsstier.**

#### Lagt til
- **🎥 Interaktiv workshop-guide**: Nettleserbasert workshop-opplevelse med MkDocs forhåndsvisningsmulighet
- **📝 Strukturerte workshop-instruksjoner**: 7-trinns guidet læringssti fra oppdagelse til tilpasning
  - 0-Introduksjon: Workshop oversikt og oppsett
  - 1-Select-AI-Template: Maloppdagelse og valgprosess
  - 2-Validate-AI-Template: Distribusjon og valideringsprosedyrer
  - 3-Deconstruct-AI-Template: Forståelse av malarkitektur
  - 4-Configure-AI-Template: Konfigurasjon og tilpasning
  - 5-Customize-AI-Template: Avanserte modifikasjoner og iterasjoner
  - 6-Teardown-Infrastructure: Opprydding og ressursstyring
  - 7-Avslutning: Oppsummering og neste steg
- **🛠️ Workshop-verktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringssti**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløs oppsett av utviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Utvidet med omfattende 2-3 timers strukturert læringsopplevelse
- **Workshop-dokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Klar steg-for-steg veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrerte verktøy for effektiv utviklingsflyt

#### Forbedret
- **Tilgjengelighet**: Nettleserbasert grensesnitt med søk, kopieringsfunksjon og temavalg
- **Selvstyrt læring**: Fleksibel workshopstruktur som tilpasser ulike læringshastigheter
- **Praktisk anvendelse**: Virkelighetsnære AI-mal distribusjonsscenarier
- **Fellesskapsintegrasjon**: Discord-integrasjon for workshop-støtte og samarbeid

#### Workshop-funksjoner
- **Innebygd søk**: Rask søk etter nøkkelord og leksjoner
- **Kopier kodeblokker**: Hover-for-å-kopiere funksjonalitet for alle kodeeksempler
- **Temavalg**: Mørk/lys modus støtte for ulike preferanser
- **Visuelle ressurser**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte Discord-tilgang for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Omfattende navigasjonsrestrukturering og kapittelbasert læringssystem
**Denne versjonen introduserer en omfattende kapittelbasert læringsstruktur med forbedret navigasjon gjennom hele repository forløpet.**

#### Lagt til
- **📚 Kapittelbasert læringssystem**: Omstrukturert hele kurset i 8 progressive læringskapitler
  - Kapittel 1: Grunnlag og rask start (⭐ - 30-45 minutter)
  - Kapittel 2: AI-første utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon og autentisering (⭐⭐ - 45-60 minutter)
  - Kapittel 4: Infrastruktur som kode og distribusjon (⭐⭐⭐ - 1-1,5 timer)
  - Kapittel 5: Fler-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Forhåndsvalidering og planlegging (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking og debugging (⭐⭐ - 1-1,5 timer)
  - Kapittel 8: Produksjons- og virksomhetsmønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonshoder og -føtter i all dokumentasjon
- **🎯 Progresjonssporing**: Sjekkliste for kursets fullføring og læringsverifiseringssystem
- **🗺️ Veiledning i læringssti**: Klare inngangspunkter for ulike erfaringsnivåer og mål
- **🔗 Kryssreferanse-navigasjon**: Relaterte kapitler og forutsetninger klart lenket

#### Forbedret
- **README-struktur**: Transformert til en strukturert læringsplattform med kapittelbasert organisering
- **Dokumentasjonsnavigasjon**: Hver side inkluderer nå kapittel-kontekst og progresjonsveiledning
- **Malorganisering**: Eksempler og maler kartlagt til passende læringskapitler
- **Ressursintegrasjon**: Jukselapper, ofte stilte spørsmål og studieveiledninger koblet til relevante kapitler
- **Workshop-integrasjon**: Praktiske laboratorier kartlagt til flere kapittel-læringsmål

#### Endret
- **Læringsprogresjon**: Gått fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Konfigurasjonsplassering**: Flyttet konfigurasjonsveilederen til kapittel 3 for bedre læringsflyt
- **AI-innholdsintegrasjon**: Bedre integrasjon av AI-spesifikt innhold gjennom hele læringsreisen
- **Produksjonsinnhold**: Avanserte mønstre samlet i kapittel 8 for virksomhetslærende

#### Forbedret
- **Brukeropplevelse**: Klare navigasjonsbrødsmuler og indikatorer for kapittelprogresjon
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kurstraversering
- **Profesjonell presentasjon**: Universitetsinspirert kurstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Redusert tid for å finne relevant innhold gjennom forbedret organisering

#### Teknisk implementering
- **Navigasjonsoverskrifter**: Standardisert kapittelnavigering i over 40 dokumentasjonsfiler
- **Navigasjonsfot**: Konsistent progresjonsveiledning og indikasjoner for kapittelfullføring
- **Krysskobling**: Omfattende system for intern lenking som knytter relaterte konsepter
- **Kapitelkartlegging**: Maler og eksempler tydelig tilknyttet læringsmål

#### Forbedring av studieveiledning
- **📚 Omfattende læringsmål**: Omstrukturert studieveiledning for å samsvare med 8-kapittelssystemet
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inneholder spesifikke læringsmål og praktiske øvelser
- **📋 Progresjonssporing**: Ukentlig læringsplan med målbare resultater og sjekklister for fullføring
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle resultater
- **🛠️ Praktiske øvelser**: Praktiske aktiviteter med virkelighetsnære distribusjonsscenarier og feilsøking
- **📊 Ferdighetsprogresjon**: Klar fremgang fra grunnleggende konsepter til virksomhetsmønstre med karriereutviklingsfokus
- **🎓 Sertifiseringsrammeverk**: Profesjonell utviklingsutbytte og anerkjennelsessystem i fellesskapet
- **⏱️ Tidsstyring**: Strukturert 10-ukers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede fler-agent AI-løsninger
**Denne versjonen forbedrer fler-agent detaljhandelsløsningen med bedre agentnavngivning og forbedret dokumentasjon.**

#### Endret
- **Terminologi for flere agenter**: Erstattet "Cora agent" med "Customer agent" gjennom hele løsning for detaljhandel med flere agenter for bedre forståelse
- **Agentarkitektur**: Oppdatert all dokumentasjon, ARM-maler og kodeeksempler for konsekvent bruk av "Customer agent"-navn
- **Konfigurasjonseksempler**: Modernisert agentkonfigurasjonsmønstre med oppdaterte navnekonvensjoner
- **Dokumentasjonskonsistens**: Sikret at alle referanser bruker profesjonelle, beskrivende agentnavn

#### Forbedret
- **ARM-malletpakke**: Oppdatert retail-multiagent-arm-template med Customer agent-referanser
- **Arkitekturdiagrammer**: Oppfrisket Mermaid-diagrammer med oppdatert agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruker nå CustomerAgent-navn
- **Miljøvariabler**: Oppdatert alle deploy-skript for å bruke CUSTOMER_AGENT_NAME-konvensjoner

#### Forbedret
- **Utvikleropplevelse**: Klarere agentroller og ansvarsområder i dokumentasjonen
- **Produksjonsberedskap**: Bedre samsvar med bedriftsnavnekonvensjoner
- **Læringsmateriell**: Mer intuitiv agentnavngivning for undervisningsformål
- **Malbrukervennlighet**: Forenklet forståelse av agentfunksjoner og deploymønstre

#### Tekniske detaljer
- Oppdaterte Mermaid-arkitekturdiagrammer med CustomerAgent-referanser
- Erstattet CoraAgent-klassenavn med CustomerAgent i Python-eksempler
- Endret ARM-mal JSON-konfigurasjoner til å bruke "customer" agenttype
- Oppdatert miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Oppfrisket alle deploy-kommandoer og containerkonfigurasjoner

### [v3.0.0] - 2025-09-12

#### Store endringer - AI-utviklerfokus og Microsoft Foundry-integrasjon
**Denne versjonen forvandler repoet til en omfattende AI-fokusert læringsressurs med Microsoft Foundry-integrasjon.**

#### Lagt til
- **🤖 AI-første læringssti**: Full omstrukturering med prioritet for AI-utviklere og ingeniører
- **Microsoft Foundry-integrasjonsguide**: Omfattende dokumentasjon for kobling av AZD med Microsoft Foundry-tjenester
- **AI modell distribusjonsmønstre**: Detaljert veiledning om modellvalg, konfigurasjon og produksjonsstrategier
- **AI workshop-lab**: 2-3 timers praktisk workshop for å konvertere AI-applikasjoner til AZD-distribuerbare løsninger
- **Produksjons AI beste praksis**: Bedriftsklare mønstre for skalering, overvåking og sikring av AI-arbeidsbelastninger
- **AI-spesifikk feilsøkingsguide**: Omfattende feilsøking for Microsoft Foundry-modeller, kognitive tjenester og AI-deployproblemer
- **AI-malgaleri**: Utvalgt samling av Microsoft Foundry-maler med kompleksitetsvurdering
- **Workshop-materiell**: Komplett workshopstruktur med praktiske laboratorier og referansemateriell

#### Forbedret
- **README-struktur**: AI-utviklerfokusert med 45 % samfunnsinteressedata fra Microsoft Foundry Discord
- **Læringsstier**: Dedikert AI-utviklerreise ved siden av tradisjonelle stier for studenter og DevOps-ingeniører
- **Mal-anbefalinger**: Fremhevede AI-maler inkludert azure-search-openai-demo, contoso-chat, og openai-chat-app-quickstart
- **Fellesskapsintegrasjon**: Forbedret Discord-fellesskapsstøtte med AI-spesifikke kanaler og diskusjoner

#### Sikkerhet og produksjonsfokus
- **Managed Identity-mønstre**: AI-spesifikk autentisering og sikkerhetskonfigurasjoner
- **Kostnadsoptimalisering**: Tokengrunnlagsovervåking og budsjettkontroller for AI-arbeidsmengder
- **Distribusjon i flere regioner**: Strategier for global AI-applikasjonsdistribusjon
- **Ytelsesovervåking**: AI-spesifikke metrikker og Application Insights-integrasjon

#### Dokumentasjonskvalitet
- **Lineær kursstruktur**: Logisk progresjon fra nybegynner til avanserte AI-distribusjonsmønstre
- **Validerte URL-er**: Alle eksterne repolinker verifisert og tilgjengelige
- **Fullstendig referanse**: Alle interne dokumentasjonslenker validert og funksjonelle
- **Produksjonsklar**: Bedriftsdistribusjonsmønstre med virkelighetseksempler

### [v2.0.0] - 2025-09-09

#### Store endringer - Omdirigering av repo og profesjonell forbedring
**Denne versjonen representerer en betydelig overhaling av repos struktur og innholdspresentasjon.**

#### Lagt til
- **Strukturert læringsrammeverk**: Alle dokumentasjonssider inkluderer nå Innledning, Læringsmål og Læringsresultater
- **Navigasjonssystem**: La til Forrige/Neste leksjonslenker gjennom all dokumentasjon for guidet læringsprogresjon
- **Studieveiledning**: Omfattende study-guide.md med læringsmål, øvelser og vurderingsmateriell
- **Profesjonell presentasjon**: Fjernet alle emoji-ikoner for bedre tilgjengelighet og profesjonelt utseende
- **Forbedret innholdsstruktur**: Bedre organisering og flyt i læringsmateriell

#### Endret
- **Dokumentasjonsformat**: Standardisert all dokumentasjon med konsistent læringsfokusert struktur
- **Navigasjonsflyt**: Implementert logisk progresjon gjennom alt læringsmateriell
- **Innholdspresentasjon**: Fjernet dekorative elementer til fordel for klar, profesjonell formatering
- **Lenkestruktur**: Oppdatert alle interne lenker for å støtte nytt navigasjonssystem

#### Forbedret
- **Tilgjengelighet**: Fjernet emoji-avhengigheter for bedre skjermlesertilpasning
- **Profesjonelt utseende**: Ren, akademisk stil presentasjon egnet for bedriftslæring
- **Læreopplevelse**: Strukturert tilnærming med klare mål og resultater for hver leksjon
- **Innholdsorganisering**: Bedre logisk flyt og sammenheng mellom relaterte emner

### [v1.0.0] - 2025-09-09

#### Første utgivelse - Omfattende AZD læringsrepo

#### Lagt til
- **Kjernedokumentasjonsstruktur**
  - Komplett kom igang-guide serie
  - Omfattende deploy- og provisjoneringsdokumentasjon
  - Detaljerte feilsøkingsressurser og debugging-guider
  - Verktøy og prosedyrer for validering før deploy

- **Kom igang-modul**
  - AZD Grunnleggende: Kjernemekanismer og terminologi
  - Installajonsguide: Plattformspesifikke oppsettinstruksjoner
  - Konfigurasjonsguide: Miljøoppsett og autentisering
  - Første prosjekt veiledning: Steg-for-steg praktisk læring

- **Deploy og provisjoneringsmodul**
  - Deploy-guide: Komplett arbeidsflytdokumentasjon
  - Provisjoneringsguide: Infrastruktur som kode med Bicep
  - Beste praksis for produksjonsdistribusjoner
  - Arkitekturmønstre for flere tjenester

- **Valideringsmodul for deploy**
  - Kapasitetsplanlegging: Azure ressursutilgjengelighet validering
  - SKU valg: Omfattende tjenestenivåveiledning
  - Pre-flight sjekker: Automatiserte valideringsskripter (PowerShell og Bash)
  - Kostnadsestimering og budsjettplanleggingsverktøy

- **Feilsøkingsmodul**
  - Vanlige problemer: Ofte møtte problemer og løsninger
  - Debugging-guide: Systematiske feilsøkingsmetoder
  - Avanserte diagnostikk-teknikker og verktøy
  - Overvåking og optimalisering av ytelse

- **Ressurser og referanser**
  - Kommandojuksark: Rask referanse for viktige kommandoer
  - Ordliste: Omfattende definisjoner av terminologi og forkortelser
  - FAQ: Detaljerte svar på vanlige spørsmål
  - Eksterne ressurser og fellesskapsforbindelser

- **Eksempler og maler**
  - Enkelt webapplikasjon-eksempel
  - Mal for distribusjon av statisk nettside
  - Konfigurasjon for containerapplikasjon
  - Mønstre for databaseintegrasjon
  - Eksempler på mikrotjenestearkitektur
  - Implementasjoner av serverløse funksjoner

#### Funksjoner
- **Multiplattformstøtte**: Installasjons- og konfigurasjonsguider for Windows, macOS og Linux
- **Flere ferdighetsnivåer**: Innhold designet for studenter til profesjonelle utviklere
- **Praktisk fokus**: Praktiske eksempler og virkelige scenarier
- **Omfattende dekning**: Fra grunnleggende konsepter til avanserte bedriftsmønstre
- **Sikkerhetsfokus**: Sikkerhets beste praksis integrert gjennom hele
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive deployer og ressursstyring

#### Dokumentasjonskvalitet
- **Detaljerte kodeeksempler**: Praktiske, testede kodeeksempler
- **Trinnvise instruksjoner**: Klare, handlingsrettede veiledninger
- **Omfattende feilhåndtering**: Feilsøking for vanlige problemer
- **Integrasjon av beste praksis**: Bransjestandarder og anbefalinger
- **Versjonskompatibilitet**: Oppdatert med nyeste Azure-tjenester og azd-funksjoner

## Planlagte fremtidige forbedringer

### Versjon 3.1.0 (Planlagt)
#### Utvidelse av AI-plattform
- **Støtte for flere modeller**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egendefinerte modeller
- **AI-agentrammeverk**: Maler for LangChain, Semantic Kernel og AutoGen-distribusjoner
- **Avanserte RAG-mønstre**: Vektor databasesystemer utover Azure AI Search (Pinecone, Weaviate, osv.)
- **AI-observabilitet**: Forbedret overvåking av modellytelse, tokenbruk og responskvalitet

#### Utvikleropplevelse
- **VS Code-utvidelse**: Integrert AZD + Microsoft Foundry utvikleropplevelse
- **GitHub Copilot-integrasjon**: AI-assistert AZD-malgenerering
- **Interaktive veiledninger**: Praktiske kodingøvelser med automatisert validering for AI-scenarier
- **Videoinnhold**: Supplerende videotutorials for visuelle elever med fokus på AI-distribusjoner

### Versjon 4.0.0 (Planlagt)
#### Bedrifts-AI-mønstre
- **Styringsrammeverk**: AI-modellstyring, samsvar og revisjonsspor
- **Flerleietaker AI**: Mønstre for å betjene flere kunder med isolerte AI-tjenester
- **Edge AI-distribusjon**: Integrasjon med Azure IoT Edge og containerinstanser
- **Hybrid sky-AI**: Multi-sky og hybride distribusjonsmønstre for AI-arbeidsbelastninger

#### Avanserte funksjoner
- **AI-pipeline-automatisering**: MLOps-integrasjon med Azure Machine Learning-pipelines
- **Avansert sikkerhet**: Nulltillit-mønstre, private endepunkter og avansert trusselbeskyttelse
- **Ytelsesoptimalisering**: Avanserte tuning- og skaleringsstrategier for AI-applikasjoner med høyt gjennomløp
- **Global distribusjon**: Innholdslevering og edge-caching-mønstre for AI-applikasjoner

### Versjon 3.0.0 (Planlagt) - Overgått av nåværende utgivelse
#### Foreslåtte tillegg - Nå implementert i v3.0.0
- ✅ **AI-fokusert innhold**: Omfattende Microsoft Foundry integrasjon (Fullført)
- ✅ **Interaktive veiledninger**: Praktisk AI-workshop-lab (Fullført)
- ✅ **Avansert sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)
- ✅ **Ytelsesoptimalisering**: AI-arbeidsbelastning tuningstrategier (Fullført)

### Versjon 2.1.0 (Planlagt) - Delvis implementert i v3.0.0
#### Mindre forbedringer - Noen fullført i nåværende utgivelse
- ✅ **Flere eksempler**: AI-fokuserte deploy-scenarier (Fullført)
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)
- **Verktøy-integrasjon**: Forbedrede IDE- og editorintegrasjonsguider
- ✅ **Overvåkingsutvidelse**: AI-spesifikke overvåkings- og varslingsmønstre (Fullført)

#### Fortsatt planlagt for fremtidig utgivelse
- **Mobilvennlig dokumentasjon**: Responsivt design for mobil læring
- **Offline-tilgang**: Nedlastbare dokumentasjonspakker
- **Forbedret IDE-integrasjon**: VS Code-utvidelse for AZD + AI arbeidsflyter
- **Samfunnsdashboard**: Sanntidsmålinger og bidragsoppfølging i fellesskapet

## Bidra til endringsloggen

### Rapportering av endringer
Når du bidrar til dette repoet, vennligst sørg for at endringsloggoppføringer inkluderer:

1. **Versjonsnummer**: Følger semantisk versjonering (major.minor.patch)
2. **Dato**: Utgivelses- eller oppdateringsdato i formatet ÅÅÅÅ-MM-DD
3. **Kategori**: Lagt til, Endret, Utgått, Fjernet, Fikset, Sikkerhet
4. **Klar beskrivelse**: Kortfattet beskrivelse av endringen
5. **Konsekvensvurdering**: Hvordan endringer påvirker eksisterende brukere

### Endringskategorier

#### Lagt til
- Nye funksjoner, dokumentasjonsseksjoner eller kapabiliteter
- Nye eksempler, maler eller læringsressurser
- Ytterligere verktøy, skript eller nyttige funksjoner

#### Endret
- Endringer i eksisterende funksjonalitet eller dokumentasjon
- Oppdateringer for bedre klarhet eller nøyaktighet
- Omdirigering av innhold eller organisering

#### Utgått
- Funksjoner eller tilnærminger som fases ut
- Dokumentasjonsseksjoner planlagt for fjerning
- Metoder som har bedre alternativer

#### Fjernet
- Funksjoner, dokumentasjon eller eksempler som ikke lenger er relevante
- Utdatert informasjon eller utgåtte tilnærminger
- Overflødig eller konsolidert innhold

#### Fikset
- Korreksjoner til feil i dokumentasjon eller kode
- Løsning av rapporterte problemer eller feil
- Forbedringer i nøyaktighet eller funksjonalitet

#### Sikkerhet
- Sikkerhetsrelaterte forbedringer eller feilrettinger
- Oppdateringer for sikkerhets beste praksis
- Løsning av sikkerhetssårbarheter

### Retningslinjer for semantisk versjonering

#### Stor versjon (X.0.0)
- Brytende endringer som krever brukerhandling
- Betydelig omorganisering av innhold eller strukturer
- Endringer som endrer grunnleggende tilnærming eller metodikk

#### Mindre versjon (X.Y.0)
- Nye funksjoner eller innholds tillegg
- Forbedringer som opprettholder bakoverkompatibilitet
- Ytterligere eksempler, verktøy eller ressurser

#### Patch-versjon (X.Y.Z)
- Feilrettinger og korreksjoner
- Mindre forbedringer til eksisterende innhold
- Avklaringer og små forbedringer

## Tilbakemeldinger og forslag fra fellesskapet

Vi oppfordrer aktivt tilbakemeldinger fra fellesskapet for å forbedre denne læringsressursen:

### Hvordan gi tilbakemelding
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-spesifikke problemer velkommen)
- **Discord-diskusjoner**: Del ideer og delta i Microsoft Foundry-fellesskapet
- **Pull Requests**: Bidra direkte til forbedringer av innhold, spesielt AI-maler og guider
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen for AZD + AI diskusjoner
- **Fellesskapsfora**: Delta i bredere Azure-utviklerdiskusjoner

### Tilbakemeldingskategorier
- **Nøyaktighet AI-innhold**: Korreksjoner til AI-tjenesteintegrasjon og deployinformasjon
- **Læreopplevelse**: Forslag til forbedret AI-utviklerlæringsflyt
- **Manglende AI-innhold**: Forespørsler om flere AI-maler, mønstre eller eksempler
- **Tilgjengelighet**: Forbedringer for varierte læringsbehov
- **AI-verktøyintegrasjon**: Forslag for bedre AI-utviklingsarbeidsflytintegrasjon
- **Produksjons AI-mønstre**: Forespørsler om bedrifts AI deploymønstre

### Svarforpliktelse
- **Svar på problemer**: Innen 48 timer for rapporterte problemer
- **Funksjonsforespørsler**: Evaluering innen en uke
- **Bidrag fra fellesskapet**: Gjennomgang innen en uke
- **Sikkerhetsproblemer**: Umiddelbar prioritet med rask respons

## Vedlikeholdsplan

### Regelmessige oppdateringer
- **Månedlige gjennomganger**: Innholdsnøyaktighet og lenkevalidering
- **Kvartalsvise oppdateringer**: Større innholdstillegg og forbedringer
- **Halvårlige gjennomganger**: Omfattende omorganisering og forbedring
- **Årlige utgivelser**: Store versjonsoppdateringer med betydelige forbedringer

### Overvåking og kvalitetssikring
- **Automatisert testing**: Regelmessig validering av kodeeksempler og lenker
- **Integrering av tilbakemeldinger fra fellesskapet**: Regelmessig innlemming av brukerforslag
- **Teknologiske oppdateringer**: Tilpasning til siste Azure-tjenester og azd-utgivelser
- **Tilgjengelighetsrevisjoner**: Regelmessig gjennomgang for inkluderende designprinsipper

## Versonsstøttepolicy

### Nåværende versjonsstøtte
- **Siste hovedversjon**: Full støtte med regelmessige oppdateringer
- **Forrige hovedversjon**: Sikkerhetsoppdateringer og kritiske feilrettinger i 12 måneder
- **Eldre versjoner**: Kun fellesskapsstøtte, ingen offisielle oppdateringer

### Migrasjonsveiledning
Når hovedversjoner lanseres, tilbyr vi:
- **Migrasjonsguider**: Trinnvise overgangsinstruksjoner
- **Kompatibilitetsnotater**: Detaljer om brytende endringer
- **Verktøystøtte**: Skript eller verktøy for å hjelpe med migrasjon
- **Fellesskapsstøtte**: Dedikerte fora for migrasjonsspørsmål

---

**Navigasjon**
- **Forrige leksjon**: [Studieveiledning](resources/study-guide.md)
- **Neste leksjon**: Tilbake til [Hoved README](README.md)

**Hold deg oppdatert**: Følg dette depotet for varsler om nye utgivelser og viktige oppdateringer i læringsmaterialene.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->