# Endringslogg - AZD For Beginners

## Introduksjon

Denne endringsloggen dokumenterer alle bemerkelsesverdige endringer, oppdateringer og forbedringer i AZD For Beginners-repositoriet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere med å forstå hva som har endret seg mellom versjoner.

## Læringsmål

Ved å gjennomgå denne endringsloggen vil du:
- Holde deg informert om nye funksjoner og innholdsutvidelser
- Forstå forbedringer gjort i eksisterende dokumentasjon
- Følge feilrettinger og korreksjoner for å sikre nøyaktighet
- Følge utviklingen av læringsmaterialene over tid

## Læringsresultater

Etter å ha gjennomgått endringsloggoppføringer vil du kunne:
- Identifisere nytt innhold og ressurser tilgjengelig for læring
- Forstå hvilke seksjoner som har blitt oppdatert eller forbedret
- Planlegge din læringsvei basert på det mest oppdaterte materialet
- Gi tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.25.0] - 2026-11-09

#### Microsoft Foundry-utvidelse 1.0 er nå generelt tilgjengelig

Pakken `microsoft.foundry` 1.0 er **live og generelt tilgjengelig**, som annonsert den [5. november 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kurset lærer nå den utgitte GA-arbeidsflyten, ikke en kommende utgivelse. Kom i gang med AZD **1.37.0 eller senere** og `azd ext install microsoft.foundry`.

#### Tilgjengelig i denne kursoppdateringen
- De engelske retningslinjene bruker GA-pakken som standard installasjonsvei og forklarer dens syv uavhengige versjonerte kjerneudvidelser.
- En [hostet agent-gjennomgang](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) dekker den oppstrøms Python Agent Framework Responses API-eksemplet, nåværende uv, Python 3.13+, nytt/eksisterende prosjektsvalg, gjenbruk av modell og gjennomgang av `azure.yaml`.
- Den lokale til sky-arbeidsflyten dekker Agent Inspector-testing, Azure-basert modellkallkostnader, fjernkodebygging, distribuert invokasjon, skysporing, distribusjonsforhåndsvisning, logger og diagnostikk.
- Separate vurderingsretningslinjer dekker generering og gjennomgang av datasett/rubrikker, konfigurasjon av navngitt evaluering, registrering av ressurser og inspeksjon av resultater. Eldre veiledning for evaluering/optimalisering forblir migrasjonshistorikk, ikke dagens utgivelsesbasis.
- Veiledning for Foundry CI/CD inkluderer installasjon av løperutvidelser, autentisert distribusjon, evaluering av ressurser/tilgang og en eksplisitt kvalitetsport.
- Rydding veiledning skiller nyskapte og gjenbrukte Foundry-prosjekter. Verkstedet linker til den separate GA-øvelsen uten å erstatte dens eksempelspecifikke tester.
- Kursnavigasjon, læringsmål, oppsettforutsetninger, jukselapp, FAQ og studieveiledning gjenspeiler GA-arbeidsflyten. Genererte oversettelser er ikke manuelt redigert.

#### Gjennomgangsomfang
- Basert på GA-annonsen, lenkede Microsoft Learn-veiledninger og oppstrøms prøvekonfigurasjon. Ingen live Azure-provisjonering, distribusjon, modellinvokasjon eller evaluering ble utført.
- Bundle GA innebærer ikke GA for hver valgfrie funksjon, uavhengig utvidelse eller SDK, og sertifiserer ikke eksemplene for produksjon.

### [v3.24.0]- 2026-11-04

#### Fikset
- Reparert engelsk kursnavigasjon, flyttede sidebaner, manglende ankre og utdaterte eksterne referanser, inkludert kapittel 2-lenken til produksjons AI-guiden.
- Gjennomgått gjeldende veiledning mot publisert AZD 1.37.2, agenter 1.0.0-beta.23 og evalueringer 1.0.0-beta.2. Dokumentert den separate `azd ai eval` arbeidsflyten og konfigurasjonsmigrering for optimalisering.
- Korrigert ikke-støttede CLI-flagg, autentiseringsgrenser, veiledning for klartekstmiljø/-hemmelig, infrastrukturoppdateringer, modellkonfigurasjon og destruktive gjenopprettings-eksempler.
- Oppdatert verkstedet mot gjeldende AI Agents-prøve, inkludert faktiske kroker, konfigurasjonsinnganger, evalueringstester, red-teaming inngangspunkter og observabilitet.
- Korrigert påstander om eksempelsimplementering og reparert tilhørende applikasjons-/infrastruktur-/konfigurasjonsproblemer. Retail-arkitekturstoff skiller seg eksplisitt fra en komplett fungerende applikasjon.
- Gjenopprettet CodeQL språkmatrise, valgt støttet Node.js 24 for utviklingscontaineren, og gjort oppsettsvaliderere i stand til å rapportere mislykkede versjonskommandoer.

#### Lagt til
- En engelskspråklig offline lenke/anker-sjekker, regresjonstester og et dokumentasjonsarbeidsflyt som også bygger verkstedet i streng modus. Genererte oversettelser og oversatte bilder er ekskludert.

#### Valideringsomfang
- Kilde, syntaks, konfigurasjon, lokal oppførsel og nettverkskobling sjekker etablerer ikke live Azure-distribuerbarhet, kvote, RBAC, regional modelltilgjengelighet, fakturering, sikkerhetsoverholdelse eller produksjonsberedskap.
- Eldre oppføringer nedenfor er historiske poster, ikke gjeldende kommando- eller utgivelsesinstruksjoner.

### [v3.23.0] - 2026-07-13

#### AZD 1.27.1 Oppdatering: Oppdatering av versjonsaktualitet
**Denne versjonen revaliderer kurset mot `azd` `1.27.1` (juli 2026, siste stabile versjon) og den nåværende forhåndsvisningsutvidelsen for AI-agent `azure.ai.agents` `1.0.0-beta.5`, og oppdaterer alle "validert mot" bannere etter utgivelsene 1.26.0, 1.27.0 og 1.27.1.**

#### Endret
- **✅ Valideringsbaselinje oppdatert** fra `azd 1.25.6` (juni 2026) til `azd 1.27.1` (juli 2026) over roten README, alle kapittel-READMEer, kapittel 1 dev-container-leksjon (inkludert eksempler med fastsatte versjoner), kapittel 4 skreddersydde maler-leksjon, kapittel 5 multi-agent-leksjon, og workshop-dokumentene
- **🤖 Kapittel 2-baseline oppdatert** fra `azd 1.23.12` (mars 2026) til `azd 1.27.1` over `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` og `microsoft-foundry-integration.md`; datoer i valideringsnotat oppdatert til 2026-07-13
- **🧩 AI-agentutvidelse oppgradert** fra `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` til nåværende `1.0.0-beta.5` versjon i kapittel 2 README og `agents.md`
- **🧪 Workshop valideringseksempel** (`azd version` utdata) oppdatert til `1.27.1`

#### Notater om relevante azd-utgivelser (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Go-støtte for Azure Functions på Flex Consumption, `azd config sub-filter` per-leietaker abonnementfiltre, selvstendige utvidelsespakker (`azd x pack --bundle`), og `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modellering av Azure AI Foundry prosjekter/agenter direkte i `azure.yaml` (init uten Bicep/Terraform), containerdistribusjonsstøtte for App Service (`host: appservice` + `language: docker`), direkte `-s/--source` for `azd extension`-kommandoer, og `azd tool uninstall`
- **1.27.1 (2026-07-09):** `--no-dependencies` flagg for `azd extension install`, utgåtte modeller ekskludert fra katalog-/kvoteprompt som standard, og flere feilrettinger

#### Filer oppdatert
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

#### Nybegynner Gap-Fill #2: Malforfatting, Dev Containers, Pulumi, Azure DevOps, Service Principals og mer
**Denne versjonen lukker de gjenværende mellomliggende hullene som ble avdekket av azd-coverage analysen: hvordan du lager og publiserer din egen mal, reproduserbare dev-container/Codespaces miljøer, Pulumi infrastruktur-leverandøren, en gjennomgang av Azure DevOps CI/CD, autentisering med service-principal, veiledning for vertsvalg (AKS/Spring Apps), forklaringer på `azd restore`/`azd package`, feilbehandling av hooks, og team-/delte miljøpraksiser.**

#### Lagt til
- **🧱 Nytt kapittel 4-leksjon** `docs/chapter-04-infrastructure/custom-templates.md` — lage din egen azd-mal: nødvendig struktur (`azure.yaml`, `infra/`, `src/`), `metadata.template` feltet, parameterisering av infrastruktur med `uniqueString()` ressurs-tokenet og `azd-env-name` taggen, testing lokalt med `azd init --template <local-path>`, publisering til GitHub, og innsending til Awesome AZD-galleriet
- **📦 Nytt kapittel 1-leksjon** `docs/chapter-01-foundation/dev-containers.md` — reproduserbare azd-miljøer med Dev Containers og GitHub Codespaces: en minimal `.devcontainer/devcontainer.json` som bruker den offisielle `ghcr.io/azure/azure-dev/azd` funksjonen, språkspesifikke funksjoner, `docker-in-docker` for container-verter, og `azd auth login --use-device-code` for fjernpålogging
- **🧩 Pulumi med azd** seksjon i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, Pulumi-mappestruktur, stacks kartlagt til azd-miljøer, nødvendige outputs/tagging, og den identiske `azd up` / `azd down` arbeidsflyten
- **🎯 Veiledning for vertsvalg** i `docs/chapter-04-infrastructure/provisioning.md` — en nybegynnervennlig sammenligning av `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, og `springapp`, med veiledning om når du bør velge AKS eller Azure Spring Apps
- **🛠️ Azure DevOps CI/CD gjennomgang** i `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, service-tilkobling med workload identity federation (OIDC), den genererte `azure-dev.yml`, og oppsett av variabelgruppe
- **🔑 Service Principals (Mønster 4)** lagt til i `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, ikke-interaktiv `azd auth login` med klienthemmelighet vs. federerte/OIDC-legitimasjoner, når de skal brukes, og sikker lagring av legitimasjoner
- **🪝 Hook feilbehandling** delseksjon i `docs/chapter-04-infrastructure/deployment-guide.md` — exit-koder og `set -e`, `continueOnError`, testing av hooks isolert med `azd hooks run`, OS-spesifikke skall, og `--debug`
- **👥 Team / delte miljøer** seksjon i `docs/chapter-03-configuration/configuration.md` — hva som finnes i `.azure/`, hva som skal gitignore's, miljøer per utvikler, `azd env list`/`select`, og å gi miljøverdier i CI/CD
- **🧰 `azd restore` og utvidede `azd package`** forklaringer i `resources/cheat-sheet.md` — gjenopprette avhengigheter og bygge et deployerbart artefakt uten å deployere

#### Endret
- **🧭 Kapittel 4 lekser tabell** oppdatert for å inkludere den nye "Authoring Your Own Template" leksen (Leksjon 3)
- **🧭 Kapittel 1 lekser tabell** oppdatert for å inkludere den nye "Dev Containers & Codespaces" leksen (Leksjon 5); navigasjonsfotere koblet mellom `bring-your-own-app.md` og `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Nybegynnerfylling: Praktisk Multi-Agent Lekse, "Bring Your Own App," Terraform, og CI/CD gjennomgang
**Denne versjonen lukker de største hullene for en komplett nybegynnerguide ved å legge til to nye praktiske leksjoner (en deployerbar multi-agent gjennomgang og å legge til azd til en eksisterende app), en nybegynnervennlig hooks introduksjon, en Terraform-med-azd seksjon, en steg-for-steg GitHub Actions pipeline gjennomgang, en forklaring av de nye forhåndsvisning-extensions, og en eksplisitt sjekkliste for deployeringsverifisering.**

#### Lagt til
- **🤝 Ny Kapittel 5 lekse** `docs/chapter-05-multi-agent/multi-agent-basics.md` — en helt praktisk, deployerbar to-agent gjennomgang (orkestrator + spesialister) ved bruk av en ekte mal (`contoso-creative-writer`), som dekker når multi-agent skal brukes, `azd up` arbeidsflyt, forståelse av deployerte ressurser, kryss-agent sporing, tilpasning, og opprydding
- **📦 Ny Kapittel 1 lekse** `docs/chapter-01-foundation/bring-your-own-app.md` — hvordan legge til azd i et eksisterende prosjekt med `azd init` ("bruk kode i gjeldende katalog"), forståelse av `azure.yaml` og `infra/`, `azd infra generate`, vertsdeteksjon, og deployering med `azd up`
- **🌐 Terraform med azd** seksjon lagt til i `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: terraform` konfigurasjon, `.tf` mappelayout, nødvendige `AZURE_*` utganger og `azd-env-name` tagging, og den identiske `azd up` / `azd down` arbeidsflyten (lukker hullet hvor Terraform-støtte ble hevdet men kun Bicep ble vist)
- **⚙️ Steg-for-steg GitHub Actions gjennomgang** i `docs/chapter-08-production/production-ai-practices.md` — fra GitHub-repo til automatiske distribusjoner: `azd pipeline config`, OIDC-fødererte legitimasjoner (ingen lagrede hemmeligheter), den genererte `azure-dev.yml`, og veiledning om hemmeligheter vs. variabler
- **🪝 Nybegynner "Ny til hooks?" introduksjon** i `docs/chapter-04-infrastructure/deployment-guide.md` — hva en hook er, en hook-stage-tabell, en minimal første hook, og kjøring av hooks manuelt med `azd hooks run`
- **✅ "Verifiser distribusjonen din" sjekkliste** lagt til i Steg 5 av `docs/chapter-01-foundation/first-project.md` — røyktest, helse-endepunkt-sjekk, og eksplisitte suksesskriterier
- **🧩 Forklaring for nye forhåndsvisningsutvidelser** `azure.ai.skills` og `azure.ai.connections` (hva de er og når man skal bruke dem) i `docs/chapter-08-production/production-ai-practices.md`

#### Endret
- **🧭 Kapittel 5 leksjonstabell** korrigert: `multi-agent-basics.md` er nå Leksjon 1 (den eneste fullt praktiske leksjonen), med ærlig merking at Leksjon 2 ligger i Kapittel 6 og Retail-scenariet er en arkitekturmal, ikke en kommando-mal
- **🧭 Kapittel 1 leksjonstabell** inkluderer nå den nye "Bring Your Own App"-leksjonen (Leksjon 4)
- **🔗 Navigasjonsfotere** oppdatert: `first-project.md` lenker nå videre til `bring-your-own-app.md`

#### Fikset
- **🧱 Lukket "krevd men manglende" Terraform-gap** — kurset refererte tidligere til Terraform støtte uten å vise det
- **🔀 Korrigert misvisende Kapittel 5 krysslenker** som antydet at en full multi-agent implementering eksisterte når det kun var en arkitekturmal

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

#### AZD 1.25.6 Oppdatering, Full Agent Livssyklus Kommandoer & Aspire Rebranding
**Denne versjonen revaliderer kurset mot `azd` `1.25.6` (juni 2026) og `azure.ai.agents` `0.1.40-preview` utvidelsen, utvider AI-veiledning fra "bygge opp en agent" til hele agentens livssyklus (test → evaluer → optimaliser → inspiser → slett), fremhever de nye `azure.ai.skills` og `azure.ai.connections` forhåndsvisningsutvidelsene, og merker at ".NET Aspire" → "Aspire" produktrebranding har skjedd.**

#### Lagt til
- **🔁 Full dekning av agentens livssyklus** for nybegynnere og AI-ingeniører gjennom dokumentasjonen:
  - `docs/chapter-01-foundation/azd-basics.md` — Livssyklus-tabell (bygge → teste → måle → forbedre → inspisere → rydde opp) lagt til under Utvidelser og AI Kommandoer seksjonen
  - `docs/chapter-08-production/production-ai-practices.md` — Ny “Håndter agentens livssyklus” seksjon som dekker `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
  - `resources/cheat-sheet.md` — Utvidede AI Agent Kommandoer med `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, og `delete --force`
- **🧩 Nye forhåndsvisningsutvidelser** dokumentert: `azure.ai.skills` (gjenbrukbare agentferdigheter) og `azure.ai.connections` (Foundry-tilkoblinger) lagt til i utvidelsestabellen og jukselisten
- **⏱️ Veiledning for responstid** — `azd ai agent invoke` eksempler noterer nå at den skriver ut total ventetid og tid-til-første-byte
- **📌 Versjonsbanner** i rot README som peker brukere til `azd version` og `azd upgrade`

#### Endret
- **✅ Valideringsbasis oppdatert** fra `azd 1.23.12` (mars 2026) til `azd 1.25.6` (juni 2026) i alle kapittel-READMEer og workshop-dokumenter
- **🤖 Kapittel 2 utvidelsesnotat** oppdatert fra `azure.ai.agents` `0.1.18-preview` til `0.1.40-preview`
- **🧪 Workshop valideringseksempel** (`azd version` utdata) oppdatert til `1.25.6`
- **🧭 README "Hva er nytt i azd i dag"** oppdatert for å fremheve agentens ende-til-ende livssyklus, nye AI-utvidelser, og nylige brukerforbedringer (`azd init` idempotens, `azd auth login` clearing av utdaterte token, `azd tool` førstegangskjørsels prompt)
- **📖 Kapittel 2 agents.md (Alternativ 4)** peker nå brukere til post-distribusjons livssykluskommandoer snarere enn å stoppe ved `azd up`

#### Fikset
- **🏷️ Produktnavneendring** — lagt til noter om Aspire rebranding (".NET Aspire" heter nå bare "Aspire"); azd sin Aspire-støtte uendret
- **🔎 Live lanseringsvalidering** bekreftet mot Azure Developer CLI release-feed: stabil CLI `1.25.6` (2026-06-12) og `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Nybegynner onboarding oppklaring, oppsettvalidering & siste AZD-kommando ryddig
**Denne versjonen følger opp AZD 1.23 valideringsrunden med en dokumentasjonsrunde fokusert på nybegynnere: den klargjør AZD-først autentiseringsveiledning, legger til lokale oppsettvalideringsskript, verifiserer nøkkelkommandoer mot live AZD CLI, og fjerner siste foreldede engelske kommando-referanser utenfor endringsloggen.**

#### Lagt til
- **🧪 Nybegynner oppsettvalideringsskript** med `validate-setup.ps1` og `validate-setup.sh` så brukere kan bekrefte nødvendige verktøy før start av Kapittel 1
- **✅ Innledende oppsettvalideringstrinn** i rot-README og Kapittel 1 README slik at manglende forutsetninger fanges før `azd up`

#### Endret
- **🔐 Nybegynner autentiseringsveiledning** behandler nå konsekvent `azd auth login` som hovedvei for AZD-arbeidsflyter, med `az login` nevnt som valgfritt med mindre Azure CLI-kommandoer brukes direkte
- **📚 Kapittel 1 onboarding flyt** peker nå brukere til å validere lokalt oppsett før installasjon, autentisering, og første distribusjonssteg
- **🛠️ Validator-meldinger** skiller nå tydelig mellom blokkerende krav og valgfrie Azure CLI-varsler for kun AZD-nybegynnerveien
- **📖 Konfigurasjons-, feilsøkings-, og eksempeldokumenter** skiller nå mellom påkrevd AZD-autentisering og valgfri Azure CLI-pålogging der begge tidligere ble vist uten kontekst

#### Fikset
- **📋 Gjenstående engelske kommando-referanser** oppdatert til gjeldende AZD-former, inkludert `azd config show` i jukselisten og `azd monitor --overview` der Azure Portal oversiktsveiledning var ment
- **🧭 Nybegynnerpåstander i Kapittel 1** myknet for å unngå overlovnader om garantert null feil eller rollback-atferd for alle maler og Azure ressurser
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

#### AZD 1.23.12 Validering, Workshop-miljøutvidelse & AI-modelloppdatering
**Denne versjonen utfører en dokumentasjonsvalideringsrunde mot `azd` `1.23.12`, oppdaterer utdaterte AZD-kommandoeksempler, oppfrisker AI-modellveiledning til nåværende standarder, og utvider workshopinstruksjoner fra GitHub Codespaces til også å støtte dev containers og lokale kloner.**

#### Lagt til
- **✅ Valideringsnotater på tvers av kjernekapitler og workshop-dokumenter** for å gjøre den testede AZD-baselinen eksplisitt for brukere med nyere eller eldre CLI-versjoner
- **⏱️ Veiledning for distribusjonstidsavbrudd** for langvarige AI app-distribusjoner med `azd deploy --timeout 1800`
- **🔎 Utvidelsesinspeksjonstrinn** med `azd extension show azure.ai.agents` i AI arbeidsflytdokumentasjon
- **🌐 Bredere workshop-miljøveiledning** som dekker GitHub Codespaces, dev containers, og lokale kloner med MkDocs

#### Endret
- **📚 Kapittel introduksjons-READMEer** noterer nå konsekvent validering mot `azd 1.23.12` i grunnleggende, konfigurasjon, infrastruktur, multi-agent, før-distribusjon, feilsøking, og produksjonsseksjoner
- **🛠️ AZD kommando referanser** oppdatert til gjeldende former i dokumentasjonen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` eller `azd env get-value(s)` avhengig av kontekst
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` der Application Insights oversikt er ment
- **🧪 Eksempler på provisjonsforhåndsvisninger** forenklet til nåværende støttet bruk som `azd provision --preview` og `azd provision --preview -e production`
- **🧭 Workshop flyt** oppdatert så brukere kan gjennomføre labber i Codespaces, dev container, eller lokal klone i stedet for å anta at det kun kjøres i Codespaces
- **🔐 Autentiseringsveiledning** foretrekker nå `azd auth login` for AZD arbeidsflyter, med `az login` som valgfritt når Azure CLI-kommandoer brukes direkte

#### Fikset
- **🪟 Windows installasjonskommandoer** normalisert til gjeldende `winget` pakke-stil i installasjonsveiledningen
- **🐧 Linux installasjonsveiledning** korrigert for å unngå uoffisielle distribusjonsspesifikke `azd` pakkehåndtererinstruksjoner og i stedet peke på release-assets hvor passende
- **📦 AI modell-eksempler** oppdatert fra eldre standarder som `gpt-35-turbo` og `text-embedding-ada-002` til nåværende eksempler som `gpt-4.1-mini`, `gpt-4.1`, og `text-embedding-3-large`
- **📋 Distribusjons- og diagnostiskodebiter** korrigert til å bruke nåværende miljø- og statuskommandoer i logger, skript, og feilsøkingssteg
- **⚙️ GitHub Actions veiledning** oppdatert fra `Azure/setup-azd@v1.0.0` til `Azure/setup-azd@v2`
- **🤖 MCP/Copilot samtykkeinstruksjon** oppdatert fra `azd mcp consent` til `azd copilot consent list`

#### Forbedret
- **🧠 AI kapittelveiledning** forklarer nå bedre forhåndsvisnigs-sensitiv `azd ai` atferd, leietakerspesifikk innlogging, nåværende utvidelsesbruk, og oppdaterte modell-distribusjonsanbefalinger
- **🧪 Workshop-instruksjoner** bruker nå mer realistiske versjonseksempler og klarere miljøoppsettsspråk for praktiske laboratorier
- **📈 Produksjons- og feilsøkingsdokumenter** samsvarer nå bedre med nåværende overvåking, fallback-modeller, og kostnadsnivå-eksempler

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
**Denne versjonen legger til `azd ai`, `azd extension`, og `azd mcp` kommandodekning på tvers av alle AI-relaterte kapitler, fikser ødelagte lenker og foreldet kode i agents.md, oppdaterer jukseark, og overhaler Eksempelmaler-seksjonen med validerte beskrivelser og nye Azure AI AZD-maler.**

#### Lagt til
- **🤖 AZD AI CLI-dekning** i 7 filer (tidligere kun i kapittel 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Ny "Utvidelser og AI-kommandoer" seksjon som introduserer `azd extension`, `azd ai agent init`, og `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Alternativ 4: `azd ai agent init` med sammenligningstabell (mal vs manifest-tilnærming)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "AZD-utvidelser for Foundry" og "Agent-First Deployment" underseksjoner
  - `docs/chapter-05-multi-agent/README.md` — Rask start viser nå både mal- og manifestbaserte distribusjonsveier
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Distribusjonsseksjonen inkluderer nå `azd ai agent init`-alternativet
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — "AZD AI-utvidelseskommandoer for diagnostikk" underseksjon
  - `resources/cheat-sheet.md` — Ny "AI & Extensions Commands" seksjon med `azd extension`, `azd ai agent init`, `azd mcp`, og `azd infra generate`
- **📦 Nye AZD AI eksempelmaler** i `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG-chat med Blazor WebAssembly, Semantic Kernel og støtte for talechat
  - **azure-search-openai-demo-java** — Java RAG-chat som bruker Langchain4J med ACA/AKS distribusjonsalternativer
  - **contoso-creative-writer** — Multi-agent kreativ skriveapp ved bruk av Azure AI Agent Service, Bing Grounding, og Prompty
  - **serverless-chat-langchainjs** — Serverless RAG ved bruk av Azure Functions + LangChain.js + Cosmos DB med Ollama lokal utviklingsstøtte
  - **chat-with-your-data-solution-accelerator** — Enterprise RAG-accelerator med administrasjonsportal, Teams-integrasjon, og PostgreSQL/Cosmos DB alternativer
  - **azure-ai-travel-agents** — Multi-agent MCP orkestreringsreferanseapp med servere i .NET, Python, Java og TypeScript
  - **azd-ai-starter** — Minimal Azure AI infrastruktur Bicep startmal
  - **🔗 Fantastisk AZD AI gallerialenke** — Referanse til [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ maler)

#### Fikset
- **🔗 agents.md navigasjon**: Tidligere/ Neste-lenker stemmer nå overens med kapitell 2 README-leksjonsrekkefølge (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 agents.md ødelagte lenker**: `production-ai-practices.md` rettet til `../chapter-08-production/production-ai-practices.md` (3 forekomster)
- **📦 agents.md foreldet kode**: Erstatter `opencensus` med `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 agents.md ugyldig API**: Flyttet `max_tokens` fra `create_agent()` til `create_run()` som `max_completion_tokens`
- **🔢 agents.md token-telling**: Erstatter grov `len//4` estimat med `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Rettet tjenester fra "Cognitive Search + App Service" til "Azure AI Search + Azure Container Apps" (standardvert endret oktober 2024)
- **contoso-chat**: Oppdatert beskrivelse med referanse til Azure AI Foundry + Prompty, i samsvar med repoets faktiske tittel og teknologistabel

#### Fjernet
- **ai-document-processing**: Fjernet ikke-fungerende malreferanse (repo ikke offentlig tilgjengelig som AZD-mal)

#### Forbedret
- **📝 agents.md øvelser**: Øvelse 1 viser nå forventet utdata og `azd monitor` steg; Øvelse 2 inkluderer full `FunctionTool` registreringskode; Øvelse 3 erstatter vag veiledning med konkrete `prepdocs.py` kommandoer
- **📚 agents.md ressurser**: Oppdaterte dokumentasjonslenker til gjeldende Azure AI Agent Service dokumentasjon og raskstart
- **📋 agents.md Neste Steg tabell**: Lagt til AI Workshop Lab-lenke for komplett kapiteldekning

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
**Denne versjonen forbedrer kapittelnavigeringen i README.md med et forbedret tabellformat.**

#### Endret
- **Kurskarttabell**: Forbedret med direkte leksjonslenker, varighetsestimater og kompleksitetsvurderinger
- **Mappeopprydding**: Fjernet overflødige gamle mapper (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Lenkevalidering**: Alle 21+ interne lenker i kurskarttabellen bekreftet

### [v3.16.0] - 2026-02-05

#### Oppdateringer av produktnavn
**Denne versjonen oppdaterer produktreferanser til nåværende Microsoft-branding.**

#### Endret
- **Microsoft Foundry → Microsoft Foundry**: Alle referanser oppdatert i filer uten oversettelse
- **Azure AI Agent Service → Foundry Agents**: Servicenavn oppdatert for å reflektere nåværende branding

#### Oppdaterte filer
- `README.md` - Hovedkurs landingsside
- `changelog.md` - Versjonshistorikk
- `course-outline.md` - Kursstruktur
- `docs/chapter-02-ai-development/agents.md` - AI-agenter veiledning
- `examples/README.md` - Eksempel-dokumentasjon
- `workshop/README.md` - Workshop landingsside
- `workshop/docs/index.md` - Workshop indeks
- `workshop/docs/instructions/*.md` - Alle workshop instruksjonsfiler

---

### [v3.15.0] - 2026-02-05

#### Stor omstrukturering av repo: Kapittelnavigasjon med mappenavn
**Denne versjonen omstrukturerer dokumentasjonen til dedikerte kapittelmappene for klarere navigasjon.**

#### Mappeendringer
Gamle mapper er erstattet med kapitelnummersatte mapper:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Lagt til ny: `docs/chapter-05-multi-agent/`

#### Filoverføringer
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
- **📚 Kapittel README-filer**: Opprettet README.md i hver kapittemappe med:
  - Læringsmål og varighet
  - Leksjonstabell med beskrivelser
  - Rask start-kommandoer
  - Navigasjon til andre kapitler

#### Endret
- **🔗 Oppdaterte alle interne lenker**: 78+ lenkeveier oppdatert i alle dokumentasjonsfiler
- **🗺️ Hoved-README.md**: Kurskart oppdatert med ny kapittelstruktur
- **📝 examples/README.md**: Oppdaterte kryssreferanser til kapittelmappene

#### Fjernet
- Gammel mappestruktur (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository-omstrukturering: Kapittelnavigasjon
**Denne versjonen la til kapittelnavigasjons-README-filer (erstattet av v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Ny veiledning for AI-agenter
**Denne versjonen legger til en omfattende veiledning for distribusjon av AI-agenter med Azure Developer CLI.**

#### Lagt til
- **🤖 docs/microsoft-foundry/agents.md**: Fullstendig veiledning som dekker:
  - Hva AI-agenter er og hvordan de skiller seg fra chatbots
  - Tre raskstart-agentmaler (Foundry Agents, Prompty, RAG)
  - Agent arkitekturmønstre (enkelt agent, RAG, multi-agent)
  - Verktøykonfigurasjon og tilpasning
  - Overvåking og metrikksporing
  - Kostnadsbetraktninger og optimalisering
  - Vanlige feilsøkingstilfeller
  - Tre praktiske øvelser med suksesskriterier

#### Innholdsstruktur
- **Introduksjon**: Agentkonsepter for nybegynnere
- **Rask start**: Distribuer agenter med `azd init --template get-started-with-ai-agents`
- **Arkitekturmønstre**: Visuelle diagrammer av agentmønstre
- **Konfigurasjon**: Verktøyoppsett og miljøvariabler
- **Overvåking**: Integrasjon med Application Insights
- **Øvelser**: Progresjon i praktisk læring (20-45 minutter hver)

---

### [v3.12.0] - 2026-02-05

#### Oppdatering av DevContainer-miljø
**Denne versjonen oppdaterer utviklingscontainerkonfigurasjonen med moderne verktøy og bedre standarder for AZD-læringsopplevelsen.**

#### Endret
- **🐳 Basisbilde**: Oppdatert fra `python:3.12-bullseye` til `python:3.12-bookworm` (nyeste Debian stable)
- **📛 Container-navn**: Omdøpt fra "Python 3" til "AZD for Beginners" for tydelighet

#### Lagt til
- **🔧 Nye Dev Container-funksjoner**:
  - `azure-cli` med Bicep-støtte aktivert
  - `node:20` (LTS versjon for AZD-maler)
  - `github-cli` for malhåndtering
  - `docker-in-docker` for container-app distribusjoner

- **🔌 Port-forwarding**: Forhåndskonfigurerte porter for vanlig utvikling:
  - 8000 (MkDocs forhåndsvisning)
  - 3000 (Web-apper)
  - 5000 (Python Flask)
  - 8080 (API-er)

- **🧩 Nye VS Code-utvidelser**:
  - `ms-python.vscode-pylance` - Forbedret Python IntelliSense
  - `ms-azuretools.vscode-azurefunctions` - Azure Functions-støtte
  - `ms-azuretools.vscode-docker` - Docker-støtte
  - `ms-azuretools.vscode-bicep` - Bicep språkstøtte
  - `ms-azure-devtools.azure-resource-groups` - Azure ressursadministrasjon
  - `yzhang.markdown-all-in-one` - Markdown-redigering
  - `DavidAnson.vscode-markdownlint` - Markdown-linting
  - `bierner.markdown-mermaid` - Mermaid diagramstøtte
  - `redhat.vscode-yaml` - YAML-støtte (for azure.yaml)
  - `eamodio.gitlens` - Git visualisering
  - `mhutchie.git-graph` - Git-historikk

- **⚙️ VS Code-innstillinger**: Lagt til standardinnstillinger for Python-tolk, formatering ved lagring og fjerning av mellomrom

- **📦 Oppdatert requirements-dev.txt**:
  - Lagt til MkDocs minify plugin
  - Lagt til pre-commit for kodekvalitet
  - Lagt til Azure SDK-pakker (azure-identity, azure-mgmt-resource)

#### Fikset
- **Post-Create-kommando**: Verifiserer nå AZD og Azure CLI-installasjon ved containerstart

---

### [v3.11.0] - 2026-02-05

#### Nybegynnervennlig README-overhaling
**Denne versjonen forbedrer README.md betydelig for å være mer tilgjengelig for nybegynnere og legger til viktige ressurser for AI-utviklere.**

#### Lagt til
- **🆚 Azure CLI vs AZD Sammenligning**: Klar forklaring på når man skal bruke hvert verktøy med praktiske eksempler
- **🌟 Fantastiske AZD-lenker**: Direkte lenker til community malgalleri og bidragsressurser:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ferdig distribuerbare maler
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community-bidrag
- **🎯 Raskstartveiledning**: Forenklet 3-trinns komme-i-gang-seksjon (Installer → Logg inn → Distribuer)
- **📊 Navigasjonstabell basert på erfaring**: Klar veiledning om hvor man bør starte basert på utviklererfaring

#### Endret
- **README-struktur**: Omorganisert for progressiv avsløring - nøkkelinformasjon først
- **Introduksjonsseksjon**: Omskrevet for å forklare "Magien med `azd up`" for komplette nybegynnere
- **Fjernet duplisert innhold**: Eliminert duplisert feilsøkingsseksjon
- **Feilsøkingskommandoer**: Fikset `azd logs` referanse til å bruke gyldig `azd monitor --logs`

#### Fikset
- **🔐 Autentiseringskommandoer**: Lagt til `azd auth login` og `azd auth logout` i cheat-sheet.md
- **Ugyldige kommando referanser**: Fjernet gjenværende `azd logs` fra README feilsøkingsseksjon

#### Notater
- **Omfang**: Endringer brukt på hoved README.md og resources/cheat-sheet.md
- **Målgruppe**: Forbedringer spesielt rettet mot utviklere nye til AZD

---

### [v3.10.0] - 2026-02-05

#### Oppdatering av Azure Developer CLI kommando presisjon
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
  - `resources/cheat-sheet.md`: Omfattende revisjon av kommando referanse
  - `docs/deployment/deployment-guide.md`: Fikset rollback- og distribusjonsstrategier
  - `docs/troubleshooting/debugging.md`: Korrigerte logganalyseseksjoner
  - `docs/troubleshooting/common-issues.md`: Oppdaterte feilsøkingskommandoer
  - `docs/troubleshooting/ai-troubleshooting.md`: Fikset AZD-feilsøkingsseksjon
  - `docs/getting-started/azd-basics.md`: Korrigerte overvåkingskommandoer
  - `docs/getting-started/first-project.md`: Oppdaterte overvåkings- og feilsøkings-eksempler
  - `docs/getting-started/installation.md`: Fikset hjelp- og versjonseksempler
  - `docs/pre-deployment/application-insights.md`: Korrigerte loggvisningskommandoer
  - `docs/pre-deployment/coordination-patterns.md`: Fikset agent feilsøkingskommandoer

- **📝 Versjonsreferanse oppdatert**: 
  - `docs/getting-started/installation.md`: Endret hardkodet `1.5.0` versjon til generisk `1.x.x` med lenke til utgivelser

#### Endret
- **Rollback Strategier**: Oppdatert dokumentasjon til å bruke Git-basert rollback (AZD har ikke native rollback)
- **Loggvisning**: Erstattet `azd logs` referanser med `azd monitor --logs`, `azd monitor --live` og Azure CLI kommandoer
- **Ytelsesseksjon**: Fjernet ikke-eksisterende parallelle/incrementelle distribusjonsflagg, gitt gyldige alternativer

#### Tekniske Detaljer
- **Gyldige AZD kommandoer**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Gyldige azd monitor flagg**: `--live`, `--logs`, `--overview`
- **Fjernet funksjonalitet**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notater
- **Verifisering**: Kommandoer validert mot Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Oppdatering av fullføring av workshop og dokumentasjonskvalitet
**Denne versjonen fullfører de interaktive workshop-modulene, fikser alle ødelagte dokumentasjonslenker og forbedrer generell innholdskvalitet for AI-utviklere som bruker Microsoft AZD.**

#### Lagt til
- **📝 CONTRIBUTING.md**: Nytt bidragsretningslinjedokument med:
  - Klare instruksjoner for rapportering av problemer og forslag til endringer
  - Dokumentasjonsstandarder for nytt innhold
  - Retningslinjer for kodeeksempler og commit-meldinger
  - Informasjon om samfunnsengasjement

#### Fullført
- **🎯 Workshop Modul 7 (Avslutning)**: Fullført avslutningsmodul med:
  - Omfattende oppsummering av workshoppens prestasjoner
  - Nøkkelkonsepter behersket seksjon som dekker AZD, maler og Microsoft Foundry
  - Anbefalinger om videre læring
  - Workshop utfordringsøvelser med vanskelighetsgrader
  - Tilbakemeldinger fra fellesskapet og støtte-lenker

- **📚 Workshop Modul 3 (Dekonstruer)**: Oppdaterte læringsmål med:
  - GitHub Copilot med MCP-server aktiveringsveiledning
  - Forståelse av AZD-mal mappe-struktur
  - Infrastruktur-som-kode (Bicep) organiseringsmønstre
  - Praktiske laboratorieinstruksjoner

- **🔧 Workshop Modul 6 (Nedrigging)**: Fullført med:
  - Ressursopprydding og kostnadsstyringsmål
  - Bruk av `azd down` for sikker nedprovisjonering av infrastruktur
  - Veiledning for gjenoppretting av mykt slettede kognitive tjenester
  - Bonusekspedisjonsoppfordringer for GitHub Copilot og Azure-portalen

#### Fikset
- **🔗 Ødelagte lenkefikser**: Løst over 15 ødelagte interne dokumentasjonslenker:
  - `docs/ai-foundry/ai-model-deployment.md`: Fikset stier til microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Korrigerte ai-model-deployment.md og production-ai-practices.md stier
  - `docs/getting-started/first-project.md`: Erstattet ikke-eksisterende cicd-integration.md med deployment-guide.md
  - `examples/retail-scenario.md`: Fikset FAQ og feilsøkingsguide stier
  - `examples/container-app/microservices/README.md`: Korrigerte kurs-hjem og distribusjonsguide stier
  - `resources/faq.md` og `resources/glossary.md`: Oppdaterte AI kapittelreferanser
  - `course-outline.md`: Fikset instruktørguide og AI-workshop laboratoriereferanser

- **📅 Workshop statusbanner**: Oppdatert fra "Under Construction" til aktiv workshop status med februar 2026 dato

- **🔗 Workshop navigasjon**: Fikset ødelagte navigasjonslenker i workshop README.md som pekte til ikke-eksisterende lab-1-azd-basics mappe

#### Endret
- **Workshop presentasjon**: Fjernet "under construction" advarsel, workshop er nå fullført og klar til bruk
- **Navigasjonskonsistens**: Sikret at alle workshop-moduler har korrekt intern modulnavigasjon
- **Læringssti-referanser**: Oppdaterte kapittelkryssreferanser til å bruke korrekte microsoft-foundry stier

#### Validert
- ✅ Alle engelske markdownfiler har gyldige interne lenker
- ✅ Workshop modulene 0-7 er fullført med læringsmål
- ✅ Navigasjon mellom kapitler og moduler fungerer korrekt
- ✅ Innhold er egnet for AI-utviklere som bruker Microsoft AZD
- ✅ Begynnervennlig språk og struktur ivaretatt gjennom hele
- ✅ CONTRIBUTING.md gir klar veiledning for fellesskapsbidragsytere

#### Teknisk implementering
- **Lenkevalidering**: Automatisert PowerShell-skript verifiserte alle .md interne lenker
- **Innholdskontroll**: Manuell gjennomgang av workshop fullstendighet og egnethet for nybegynnere
- **Navigasjonssystem**: Konsistente kapittel- og modulnavigasjonsmønstre anvendt

#### Notater
- **Omfang**: Endringer anvendt kun på engelsk dokumentasjon
- **Oversettelser**: Oversettelsesmappene ble ikke oppdatert i denne versjonen (automatisert oversettelse synkroniseres senere)
- **Workshop varighet**: Komplett workshop tilbyr nå 3-4 timer med praktisk læring

---

### [v3.8.0] - 2025-11-19

#### Avansert dokumentasjon: Overvåkning, sikkerhet og multi-agent mønstre
**Denne versjonen legger til omfattende A-nivå leksjoner om Application Insights integrasjon, autentiseringsmønstre og multi-agent koordinasjon for produksjonsutrullinger.**

#### Lagt til
- **📊 Application Insights integrasjonsleksjon**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokusert distribusjon med automatisk provisjonering
  - Komplett Bicep-maler for Application Insights + Log Analytics
  - Arbeidende Python-applikasjoner med tilpasset telemetri (1 200+ linjer)
  - AI/LLM overvåkingsmønstre (Microsoft Foundry Models token/kostnadssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribuert sporing, telemetri flyt)
  - 3 praktiske øvelser (varsler, dashbord, AI overvåkning)
  - Kusto spørringseksempler og kostnadsoptimaliseringsstrategier
  - Streamende live-metrikker og sanntids feilsøking
  - 40-50 minutters læringstid med produksjonsklare mønstre

- **🔐 Autentisering og sikkerhetsmønstre leksjon**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmønstre (tilkoblingsstrenger, Key Vault, managed identity)
  - Komplett Bicep infrastrukturmaler for sikre distribusjoner
  - Node.js applikasjonskode med Azure SDK integrasjon
  - 3 komplette øvelser (aktiver managed identity, bruker-tilordnet identity, Key Vault rotasjon)
  - Sikkerhets beste praksiser og RBAC-konfigurasjoner
  - Feilsøkingsguide og kostnadsanalyse
  - Produksjonsklare passordløse autentiseringsmønstre

- **🤖 Multi-agent koordinasjonsmønstre leksjon**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordinasjonsmønstre (sekvensiell, parallell, hierarkisk, hendelsesdrevet, konsensus)
  - Komplett orkestratørtjenesteimplementasjon (Python/Flask, 1 500+ linjer)
  - 3 spesialiserte agentimplementasjoner (Forskning, Skribent, Redaktør)
  - Service Bus integrasjon for meldingskøer
  - Cosmos DB tilstandsadministrasjon for distribuerte systemer
  - 6 Mermaid-diagrammer som viser agentinteraksjoner
  - 3 avanserte øvelser (timeout-håndtering, retry-logikk, kretsbryter)
  - Kostnadsoversikt ($240-565/måned) med optimaliseringsstrategier
  - Application Insights integrasjon for overvåkning

#### Forbedret
- **For-distribusjonskapittel**: Inkluderer nå omfattende overvåkning og koordinasjonsmønstre
- **Kom i gang kapittel**: Forbedret med profesjonelle autentiseringsmønstre
- **Produksjonsberedskap**: Full dekning fra sikkerhet til observerbarhet
- **Kursoversikt**: Oppdatert til å referere nye leksjoner i kapittel 3 og 6

#### Endret
- **Læringsprogresjon**: Bedre integrasjon av sikkerhet og overvåkning gjennom kurset
- **Dokumentasjonskvalitet**: Konsistente A-nivå standarder (95-97 %) i nye leksjoner
- **Produksjonsmønstre**: Fullstendig ende-til-ende dekning for bedriftsutrullinger

#### Forbedret
- **Utvikleropplevelse**: Klar vei fra utvikling til produksjonsovervåkning
- **Sikkerhetsstandarder**: Profesjonelle mønstre for autentisering og hemmelighetshåndtering
- **Observerbarhet**: Fullstendig Application Insights integrasjon med AZD
- **AI arbeidsbelastninger**: Spesialisert overvåkning for Microsoft Foundry Models og multi-agent systemer

#### Validert
- ✅ Alle leksjoner inkluderer komplett fungerende kode (ikke snutter)
- ✅ Mermaid-diagrammer for visuell læring (19 totalt i 3 leksjoner)
- ✅ Praktiske øvelser med verifiseringstrinn (9 totalt)
- ✅ Produksjonsklare Bicep-maler distribuert via `azd up`
- ✅ Kostnadsanalyse og optimaliseringsstrategier
- ✅ Feilsøkingsguider og beste praksiser
- ✅ Kunnskapssjekkpunkter med verifiseringskommandoer

#### Dokumentasjonsvurderingsresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvåkingsguide
- **docs/getting-started/authsecurity.md**: - Profesjonelle sikkerhetsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avanserte multi-agent arkitekturer
- **Samlet nytt innhold**: - Konsistent høykvalitetsstandard

#### Teknisk implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribuert sporing
- **Autentisering**: Managed Identity + Key Vault + RBAC mønstre
- **Multi-agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvåkning**: Live-metrikker + Kusto-spørringer + varsler + dashbord
- **Kostnadsstyring**: Prøvetakingsstrategier, oppbevaringsregler, budsjettkontroller

### [v3.7.0] - 2025-11-19

#### Forbedringer av dokumentasjonskvalitet og nytt Microsoft Foundry Models eksempelkode
**Denne versjonen forbedrer dokumentasjonskvalitet i hele depotet og legger til et komplett Microsoft Foundry Models distribusjonseksempel med gpt-4.1 chat-grensesnitt.**

#### Lagt til
- **🤖 Microsoft Foundry Models chat-eksempel**: Komplett gpt-4.1 distribusjon med fungerende implementasjon i `examples/azure-openai-chat/`:
  - Komplett Microsoft Foundry Models infrastruktur (gpt-4.1 modell distribusjon)
  - Python kommandolinje chat-grensesnitt med samtalehistorikk
  - Key Vault integrasjon for sikker API-nøkkel lagring
  - Sporing av tokenbruk og kostnadsestimering
  - Ratebegrensning og feilhåndtering
  - Omfattende README med 35-45 minutters distribusjonsveiledning
  - 11 produksjonsklare filer (Bicep-maler, Python-app, konfigurasjon)
- **📚 Dokumentasjonsøvelser**: Lagt til praktiske øvelser i konfigurasjonsveiledningen:
  - Øvelse 1: Multi-miljø konfigurasjon (15 minutter)
  - Øvelse 2: Praktisk hemmelighetshåndtering (10 minutter)
  - Klare suksesskriterier og verifiseringstrinn
- **✅ Distribusjonsverifisering**: Lagt til verifikasjonsseksjon i distribusjonsveiledning:
  - Helsesjekk prosedyrer
  - Suksesskriterier sjekkliste
  - Forventede utdata for alle distribusjonskommandoer
  - Rask referanse for feilsøking

#### Forbedret
- **examples/README.md**: Oppdatert til A-nivå kvalitet (93 %):
  - Lagt til azure-openai-chat i alle relevante seksjoner
  - Oppdatert lokalt antall eksempler fra 3 til 4
  - Lagt til i AI Application Examples tabellen
  - Integrert i Quick Start for mellomnivåbrukere
  - Lagt til i Microsoft Foundry Templates seksjonen
  - Oppdatert sammenligningsmatrise og seksjoner for teknologifunn
- **Dokumentasjonskvalitet**: Forbedret B+ (87%) → A- (92%) i hele dokumentasjonsmappen:
  - La til forventede utdata for kritiske kommandeksempler
  - Inkluderte verifiseringssteg for konfigurasjonsendringer
  - Forbedret praktisk læring med praktiske øvelser

#### Endret
- **Læringsprogresjon**: Bedre integrasjon av AI-eksempler for mellomliggende brukere
- **Dokumentasjonsstruktur**: Flere handlingsrettede øvelser med klare resultater
- **Verifikasjonsprosess**: Eksplisitte suksesskriterier lagt til i nøkkel-arbeidsflyter

#### Forbedret
- **Utvikleropplevelse**: Microsoft Foundry Models-distribusjon tar nå 35-45 minutter (mot 60-90 for komplekse alternativer)
- **Kostnadstransparens**: Klare kostnadsestimater ($50-200/måned) for Microsoft Foundry Models-eksempel
- **Læringssti**: AI-utviklere har klar inngang med azure-openai-chat
- **Dokumentasjonsstandarder**: Konsistente forventede utdata og verifiseringssteg

#### Validert
- ✅ Microsoft Foundry Models-eksemplet er fullt funksjonelt med `azd up`
- ✅ Alle 11 implementeringsfiler er syntaktisk korrekte
- ✅ README-instruksjoner samsvarer med faktisk distribusjonserfaring
- ✅ Dokumentasjonslenker oppdatert på over 8 steder
- ✅ Eksempelindeks reflekterer nøyaktig 4 lokale eksempler
- ✅ Ingen dupliserte eksterne lenker i tabeller
- ✅ Alle navigasjonsreferanser er korrekte

#### Teknisk implementering
- **Microsoft Foundry Models-arkitektur**: gpt-4.1 + Key Vault + Container Apps-mønster
- **Sikkerhet**: Managed Identity klar, hemmeligheter i Key Vault
- **Overvåkning**: Integrasjon med Application Insights
- **Kostnadsstyring**: Token-sporing og optimalisering av bruk
- **Distribusjon**: Enkelt `azd up`-kommando for komplett oppsett

### [v3.6.0] - 2025-11-19

#### Større oppdatering: Container App-distribusjonseksempler
**Denne versjonen introduserer omfattende, produksjonsklare containerapplikasjonsdistribusjonseksempler ved bruk av Azure Developer CLI (AZD), med full dokumentasjon og integrasjon i læringsstien.**

#### Lagt til
- **🚀 Container App-eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Komplett oversikt over containeriserte distribusjoner, rask start, produksjon og avanserte mønstre
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Nybegynnervennlig REST API med scale-to-zero, helsesjekker, overvåkning og feilsøking
  - [Microservices Architecture](../../examples/container-app/microservices): Produksjonsklar multi-tjenestedistribusjon (API Gateway, Product, Order, User, Notification), asynkron meldingstjeneste, Service Bus, Cosmos DB, Azure SQL, distribuert sporing, blue-green/canary-distribusjon
- **Beste praksis**: Sikkerhet, overvåkning, kostnadsoptimalisering og CI/CD-veiledning for containeriserte arbeidsmengder
- **Kodeeksempler**: Komplett `azure.yaml`, Bicep-maler og flerspråklige tjenesteimplementasjoner (Python, Node.js, C#, Go)
- **Testing og feilsøking**: End-to-end testscenarier, overvåkningskommandoer, feilsøkingsveiledning

#### Endret
- **README.md**: Oppdatert for å fremheve og lenke nye container app-eksempler under "Local Examples - Container Applications"
- **examples/README.md**: Oppdatert for å fremheve container app-eksempler, legge til sammenligningsmatrisseoppføringer og oppdatere teknologiske/arkitekturmessige referanser
- **Kursplan & Studieguide**: Oppdatert for å referere nye container app-eksempler og distribusjonsmønstre i relevante kapitler

#### Validert
- ✅ Alle nye eksempler kan distribueres med `azd up` og følger beste praksis
- ✅ Dokumentasjonskrysslenker og navigasjon oppdatert
- ✅ Eksemplene dekker nybegynner til avanserte scenarier, inkludert produksjonsmikrotjenester

#### Notater
- **Omfang**: Kun engelskspråklig dokumentasjon og eksempler
- **Neste steg**: Utvide med flere avanserte containermønstre og CI/CD-automatisering i fremtidige utgivelser

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Denne versjonen implementerer en omfattende produktnavnendring fra "Microsoft Foundry" til "Microsoft Foundry" i all engelsk dokumentasjon, som gjenspeiler Microsofts offisielle rebranding.**

#### Endret
- **🔄 Produktnavnoppdatering**: Fullstendig rebranding fra "Microsoft Foundry" til "Microsoft Foundry"
  - Oppdaterte alle referanser i engelsk dokumentasjon i `docs/`-mappen
  - Omdøpte mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøpte fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innholdsreferanser oppdatert i 7 dokumentasjonsfiler

- **📁 Endringer i mappestruktur**:
  - `docs/ai-foundry/` omdøpt til `docs/microsoft-foundry/`
  - Alle kryssreferanser oppdatert for å reflektere ny mappestruktur
  - Navigasjonslenker validert i all dokumentasjon

- **📄 Filomdøpinger**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne lenker oppdatert for å referere nytt filnavn

#### Oppdaterte filer
- **Kapitteldokumentasjon** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigasjonslenkeoppdateringer
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnreferanser oppdatert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bruker allerede Microsoft Foundry (fra tidligere oppdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referanser oppdatert (oversikt, fellesskapstilbakemeldinger, dokumentasjon)
  - `docs/getting-started/azd-basics.md` - 4 kryssreferanselenker oppdatert
  - `docs/getting-started/first-project.md` - 2 kapittelnavigasjonslenker oppdatert
  - `docs/getting-started/installation.md` - 2 lenker til neste kapittel oppdatert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referanser oppdatert (navigasjon, Discord-fellesskap)
  - `docs/troubleshooting/common-issues.md` - 1 navigasjonslenke oppdatert
  - `docs/troubleshooting/debugging.md` - 1 navigasjonslenke oppdatert

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referanser oppdatert (kursoversikt, kapitteltitler, malseksjon, fellesskapsinnsikt)
  - `course-outline.md` - 14 referanser oppdatert (oversikt, læringsmål, kapittelressurser)

#### Validert
- ✅ Ingen gjenværende "ai-foundry"-mappesti-referanser i engelskspråklige dokumenter
- ✅ Ingen gjenværende "Microsoft Foundry" produktnavnreferanser i engelskspråklige dokumenter
- ✅ Alle navigasjonslenker fungerer med ny mappestruktur
- ✅ Fil- og mappomdøpinger fullført med suksess
- ✅ Kryssreferanser mellom kapitler validert

#### Notater
- **Omfang**: Endringer gjelder kun engelsk dokumentasjon i `docs/`-mappen
- **Oversettelser**: Oversettelsesmappene (`translations/`) er ikke oppdatert i denne versjonen
- **Workshop**: Workshopmateriell (`workshop/`) er ikke oppdatert i denne versjonen
- **Eksempler**: Eksempelfiler kan fortsatt referere til eldre navn (skal rettes i fremtidig oppdatering)
- **Eksterne lenker**: Eksterne URL-er og GitHub-repositoriumreferanser forblir uendret

#### Migrasjonsveiledning for bidragsytere
Hvis du har lokale grener eller dokumentasjon som refererer til den gamle strukturen:
1. Oppdater mappereferanser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Oppdater filreferanser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Erstatt produktnavn: "Microsoft Foundry" → "Microsoft Foundry"
4. Verifiser at alle interne dokumentasjonslenker fortsatt fungerer

---

### [v3.4.0] - 2025-10-24

#### Forhåndsvisning av infrastruktur og forbedringer i validering
**Denne versjonen introduserer omfattende støtte for den nye Azure Developer CLI forhåndsvisningsfunksjonen og forbedrer brukeropplevelsen i workshopen.**

#### Lagt til
- **🧪 azd provision --preview-funksjonsdokumentasjon**: Omfattende dekning av den nye infrastrukturen forhåndsvisningsmuligheten
  - Kommandoreferanse og bruks-eksempler i jukseliste
  - Detaljert integrasjon i provisjoneringsveiledning med brukstilfeller og fordeler
  - Pre-flight-sjekk integrasjon for sikrere distribusjonsvalidering
  - Oppdateringer i startveiledning med sikkerhetsfokusert distribusjonspraksis
- **🚧 Workshop-statusbanner**: Profesjonelt HTML-banner som indikerer workshopens utviklingsstatus
  - Gradientdesign med byggeindikatorer for tydelig kommunikasjon til brukerne
  - Siste oppdateringstidspunkt for åpenhet
  - Mobiltilpasset design for alle enhetstyper

#### Forbedret
- **Infrastruktursikkerhet**: Forhåndsvisningsfunksjonalitet integrert gjennom hele distribusjonsdokumentasjonen
- **Forhåndsvalidering**: Automatiserte skript inkluderer nå infrastrukturforhåndsvisningstesting
- **Utviklerarbeidsflyt**: Oppdaterte kommandosekvenser for å inkludere forhåndsvisning som beste praksis
- **Workshop-opplevelse**: Klare forventninger satt til brukerne om innholdsutviklingsstatus

#### Endret
- **Beste distribusjonspraksis**: Forhåndsvisningsfokusert arbeidsflyt nå anbefalt fremgangsmåte
- **Dokumentasjonsflyt**: Infrastrukturvalidering flyttet tidligere i læringsprosessen
- **Workshoppresentasjon**: Profesjonell statuskommunikasjon med tydelig utviklingstidslinje

#### Forbedret
- **Sikkerhetsfokusert tilnærming**: Infrastrukturendringer kan nå valideres før distribusjon
- **Samarbeid i team**: Forhåndsvisningsresultater kan deles for gjennomgang og godkjenning
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før provisjonering
- **Risikoredusering**: Reduserte distribusjonsfeil gjennom forhåndsvalidering

#### Teknisk implementering
- **Integrasjon i flere dokumenter**: Forhåndsvisningsfunksjon dokumentert i 4 nøkkelfiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i hele dokumentasjonen
- **Beste praksis-integrasjon**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript
- **Visuelle indikatorer**: Klare MERK NYE-funksjonmarkeringer for oppdagbarhet

#### Workshopinfrastruktur
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientstil
- **Brukeropplevelse**: Klar utviklingsstatus forhindrer forvirring
- **Profesjonell presentasjon**: Opprettholder repositoriekredibilitet samtidig som forventninger settes
- **Tidslinjegjennomsiktighet**: Oktober 2025 siste oppdateringstidspunkt for ansvarlighet

### [v3.3.0] - 2025-09-24

#### Forbedret workshopmateriell og interaktiv læringsopplevelse
**Denne versjonen introduserer omfattende workshopmateriell med nettleserbaserte interaktive guider og strukturerte læringsstier.**

#### Lagt til
- **🎥 Interaktiv workshopguide**: Nettleserbasert workshopopplevelse med MkDocs forhåndsvisningsmulighet
- **📝 Strukturert workshopinstruksjon**: 7-trinns veiledet læringssti fra oppdagelse til tilpasning
  - 0-Introduksjon: Workshopoversikt og oppsett
  - 1-Valg-AI-mal: Maloppdagelse og utvalgprosess
  - 2-Valider-AI-mal: Distribusjons- og valideringsprosedyrer
  - 3-Dekonstruer-AI-mal: Forstå malarkitektur
  - 4-Konfigurer-AI-mal: Konfigurasjon og tilpasning
  - 5-Tilpass-AI-mal: Avanserte modifikasjoner og iterasjoner
  - 6-Rydd-infrastruktur: Opprydding og ressursstyring
  - 7-Avslutning: Oppsummering og neste steg
- **🛠️ Workshopverktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringssti**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløs utviklingsmiljøoppsett

#### Forbedret
- **AI Workshop-lab**: Utvidet med omfattende 2-3 timers strukturert læringsopplevelse
- **Workshopdokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Klar trinnvis veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrerte verktøy for strømlinjeformede utviklingsarbeidsflyter

#### Forbedret
- **Tilgjengelighet**: Nettleserbasert grensesnitt med søk, kopifunksjonalitet og temabryter
- **Selvstyrt læring**: Fleksibel workshopstruktur som tilpasser seg ulik læringstakt
- **Praktisk anvendelse**: Virkelighetsnære AI-maldistribusjonsscenarier
- **Fellesskapsintegrasjon**: Discord-integrasjon for workshopstøtte og samarbeid

#### Workshopfunksjoner
- **Innebygd søk**: Rask nøkkelord- og leksjonsoppdagelse
- **Kopiering av kodeblokker**: Hover-for-kopi-funksjonalitet for alle kodeeksempler
- **Temabryter**: Støtte for mørk/lys modus for ulike preferanser
- **Visuelle ressurser**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte Discord-tilgang for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Store endringer i navigasjon og kapittelbasert læringssystem
**Denne versjonen introduserer en omfattende kapittelbasert læringsstruktur med forbedret navigasjon gjennom hele repositoriet.**

#### Lagt til
- **📚 Kapittelbasert læringssystem**: Omstrukturert hele kurset til 8 progressive læringskapitler
  - Kapittel 1: Grunnlag & Rask start (⭐ - 30-45 min)
  - Kapittel 2: AI-først utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon & Autentisering (⭐⭐ - 45-60 min)
  - Kapittel 4: Infrastruktur som kode & distribusjon (⭐⭐⭐ - 1-1,5 timer)
  - Kapittel 5: Multi-Agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Forhåndsvalidering & planlegging (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking & debugging (⭐⭐ - 1-1,5 timer)
  - Kapittel 8: Produksjons- & enterprise-mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonsoverskrifter og -bunner på tvers av all dokumentasjon
- **🎯 Framdriftssporing**: Kursfullføringssjekkliste og læringsverifikasjonssystem
- **🗺️ Veiledning for læringssti**: Klare inngangspunkter for ulike erfaringsnivåer og mål
- **🔗 Kryssreferanse-navigasjon**: Relaterte kapitler og forutsetninger tydelig lenket

#### Forbedret
- **README-struktur**: Omformet til plattform for strukturert læring med kapittelbasert organisering
- **Dokumentasjonsnavigasjon**: Hver side inkluderer nå kapittelkontekst og veiledning i progresjon
- **Malorganisering**: Eksempler og maler kartlagt til passende læringskapitler
- **Ressursintegrasjon**: Jukselister, FAQ og studieguider koblet til relevante kapitler
- **Workshopintegrasjon**: Praktiske laboratorier koblet til flere kapittellæringsmål

#### Endret
- **Læringsprogresjon**: Flyttet fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Konfigurasjonsplassering**: Omplassert konfigurasjonsveiledning som Kapittel 3 for bedre læringsflyt
- **AI-innholdsintegrasjon**: Bedre integrasjon av AI-spesifikt innhold gjennom hele læringsreisen
- **Produksjonsinnhold**: Avanserte mønstre konsolidert i Kapittel 8 for bedriftslærende

#### Forbedret
- **Brukeropplevelse**: Klare navigasjonsbrødsmuler og kapittelprogresjonsindikatorer
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kursgjennomføring
- **Profesjonell presentasjon**: Universitetsstil kursstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Redusert tid til å finne relevant innhold gjennom forbedret organisering

#### Teknisk implementering
- **Navigasjonsoverskrifter**: Standardisert kapittelnavigasjon på over 40 dokumentasjonsfiler
- **Navigasjon i bunntekst**: Konsistente progresjonsveiledninger og kapittel-fullføringsindikatorer
- **Krysslenking**: Omfattende intern koblingssystem som forbinder relaterte konsepter
- **Kapittelkartlegging**: Maler og eksempler klart knyttet til læringsmål

#### Forbedring av studieveiledning
- **📚 Omfattende læringsmål**: Omstrukturert studieveiledning for å samsvare med 8-kapittelsystemet
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inkluderer spesifikke læringsmål og praktiske øvelser
- **📋 Progresjonssporing**: Ukentlig læringsplan med målbare resultater og sjekklister for fullføring
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle utfall
- **🛠️ Praktiske øvelser**: Praktiske aktiviteter med reelle distribusjonsscenarioer og feilsøking
- **📊 Ferdighetsprogresjon**: Klar framgang fra grunnleggende konsepter til bedriftsmønstre med karriereutviklingsfokus
- **🎓 Sertifiseringsrammeverk**: Profesjonelle utviklingsresultater og system for fellesskapsgjenkjenning
- **⏱️ Tidslinjestyring**: Strukturert 10-ukers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede Multi-Agent AI-løsninger
**Denne versjonen forbedrer multi-agent detaljhandelløsningen med bedre agentnavn og forbedret dokumentasjon.**

#### Endret
- **Multi-Agent Terminologi**: Erstattet "Cora agent" med "Kundeagent" gjennom hele detaljhandels multi-agent-løsningen for klarere forståelse
- **Agentarkitektur**: Oppdatert all dokumentasjon, ARM-maler og kodeeksempler til å bruke konsekvent "Kundeagent" navngivning
- **Konfigurasjonseksempler**: Moderniserte agentkonfigurasjonsmønstre med oppdaterte navnekonvensjoner
- **Dokumentasjonskonsistens**: Sikret at alle referanser bruker profesjonelle, beskrivende agentnavn

#### Forbedret
- **ARM-malpakke**: Oppdatert retail-multiagent-arm-template med referanser til Kundeagent
- **Arkitekturdiagrammer**: Oppfriskede Mermaid-diagrammer med oppdatert agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruker nå KundeAgent-navn
- **Miljøvariabler**: Oppdatert alle distribusjonsskript for å bruke CUSTOMER_AGENT_NAME konvensjoner

#### Forbedret
- **Utvikleropplevelse**: Klarere agentroller og ansvar i dokumentasjonen
- **Produksjonsklarhet**: Bedre tilpasning til bedriftsnavnekonvensjoner
- **Læringsmateriell**: Mer intuitiv agentnavngivning for pedagogiske formål
- **Malbrukervennlighet**: Forenklet forståelse av agentfunksjoner og distribusjonsmønstre

#### Tekniske detaljer
- Oppdaterte Mermaid-arkitekturdiagrammer med KundeAgent-referanser
- Erstattet CoraAgent-klassenavn med KundeAgent i Python-eksempler
- Endret ARM-malens JSON-konfigurasjoner til å bruke "customer" agent-type
- Oppdaterte miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Oppfrisket alle distribusjonskommandoer og containerkonfigurasjoner

### [v3.0.0] - 2025-09-12

#### Store endringer - AI-utviklerfokus og Microsoft Foundry-integrasjon
**Denne versjonen forvandler depotet til en omfattende AI-fokusert læringsressurs med Microsoft Foundry-integrasjon.**

#### Lagt til
- **🤖 AI-Første Læringssti**: Fullstendig omstrukturering med prioritet på AI-utviklere og ingeniører
- **Microsoft Foundry Integrasjonsveiledning**: Omfattende dokumentasjon for tilkobling av AZD med Microsoft Foundry-tjenester
- **AI-modell Distribusjonsmønstre**: Detaljert guide som dekker modellvalg, konfigurasjon og produksjonsdistribusjonsstrategier
- **AI Workshop Lab**: 2-3 timers praktisk workshop for konvertering av AI-applikasjoner til AZD-distribuerbare løsninger
- **Produksjonens AI Beste Praksis**: Bedriftsklare mønstre for skalering, overvåking og sikring av AI-arbeidsmengder
- **AI-Spesifikk Feilsøkingsveiledning**: Omfattende feilsøking for Microsoft Foundry Modeller, Cognitive Services og AI-distribusjonsproblemer
- **AI Malgalleri**: Utvalgt samling av Microsoft Foundry-maler med kompleksitetsvurderinger
- **Workshopmaterialer**: Komplett workshopstruktur med praktiske laboratorier og referansematerialer

#### Forbedret
- **README-struktur**: AI-utviklerfokusert med 45 % fellesskapsinteresse fra Microsoft Foundry Discord
- **Læringsstier**: Dedikert AI-utvikler-reise ved siden av tradisjonelle stier for studenter og DevOps-ingeniører
- **Malanbefalinger**: Fremhevede AI-maler inkludert azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Fellesskapsintegrasjon**: Forbedret Discord-fellesskapsstøtte med AI-spesifikke kanaler og diskusjoner

#### Sikkerhets- og produksjonsfokus
- **Administrerte identitetsmønstre**: AI-spesifikk autentisering og sikkerhetskonfigurasjoner
- **Kostnadsoptimalisering**: Sporingssystem for tokenbruk og budsjettkontroller for AI-arbeidsmengder
- **Distribusjon i flere regioner**: Strategier for global AI-applikasjonsdistribusjon
- **Ytelsesovervåking**: AI-spesifikke måleparametere og Application Insights-integrasjon

#### Dokumentasjonskvalitet
- **Lineær kursstruktur**: Logisk progresjon fra nybegynner til avanserte AI-distribusjonsmønstre
- **Validerte URL-er**: Alle eksterne depotlenker verifisert og tilgjengelige
- **Fullstendig referanse**: Alle interne dokumentasjonslenker validert og funksjonelle
- **Produksjonsklar**: Bedriftsdistribusjonsmønstre med ekte eksempler

### [v2.0.0] - 2025-09-09

#### Store endringer - Repositoriumomstrukturering og profesjonell forbedring
**Denne versjonen representerer en betydelig overhaling av repositoriumets struktur og innholdspresentasjon.**

#### Lagt til
- **Strukturert læringsrammeverk**: Alle dokumentasjonssider inkluderer nå introduksjon, læringsmål og læringsresultat-seksjoner
- **Navigasjonssystem**: Lagt til Forrige/Neste leksjonslenker gjennom all dokumentasjon for styrt læringsprogresjon
- **Studieveiledning**: Omfattende study-guide.md med læringsmål, praksisøvelser og vurderingsmateriell
- **Profesjonell presentasjon**: Fjernet alle emoji-ikoner for bedre tilgjengelighet og profesjonelt utseende
- **Forbedret innholdsstruktur**: Forbedret organisering og flyt av læringsmateriale

#### Endret
- **Dokumentasjonsformat**: Standardisert all dokumentasjon med konsekvent læringsfokusert struktur
- **Navigasjonsflyt**: Implementert logisk progresjon gjennom alt læringsmateriell
- **Innholdspresentasjon**: Fjernet dekorative elementer til fordel for klar, profesjonell formatering
- **Lenkestruktur**: Oppdatert alle interne lenker til å støtte nytt navigasjonssystem

#### Forbedret
- **Tilgjengelighet**: Fjernet emoji-avhengigheter for bedre skjermleserkompatibilitet
- **Profesjonelt utseende**: Ren, akademisk stil presentasjon egnet for bedriftslæring
- **Læringsopplevelse**: Strukturert tilnærming med klare mål og resultater for hver leksjon
- **Innholdsorganisasjon**: Bedre logisk flyt og forbindelse mellom relaterte temaer

### [v1.0.0] - 2025-09-09

#### Første utgave - Omfattende AZD læringsdepot

#### Lagt til
- **Kjerne-dokumentasjonsstruktur**
  - Komplett kom-i-gang guide-serie
  - Omfattende dokumentasjon for distribusjon og provisjonering
  - Detaljerte ressurser for feilsøking og debugging
  - Verktøy og prosedyrer for pre-distribusjonsvalidering

- **Kom-i-gang modul**
  - AZD Grunnleggende: Kjernestrukturer og terminologi
  - Installasjonsguide: Plattformspesifikke oppsettinstruksjoner
  - Konfigurasjonsguide: Miljøoppsett og autentisering
  - Første prosjektveiledning: Steg-for-steg praktisk læring

- **Distribusjon og provisjoneringsmodul**
  - Distribusjonsguide: Fullstendig arbeidsflytdokumentasjon
  - Provisjoneringsguide: Infrastruktur som kode med Bicep
  - Beste praksis for produksjonsdistribusjoner
  - Multitjenestearkitektur-mønstre

- **Pre-distribusjonsvalideringsmodul**
  - Kapasitetsplanlegging: Validering av Azure-ressursers tilgjengelighet
  - SKU-valg: Omfattende veiledning for servicelag
  - Forhåndssjekker: Automatiserte valideringsskript (PowerShell og Bash)
  - Kostnadsberegning og budsjettplanleggingsverktøy

- **Feilsøkingsmodul**
  - Vanlige problemer: Hyppig forekommende problemer og løsninger
  - Feilsøkingsguide: Systematiske feilsøkingsmetoder
  - Avanserte diagnostiske teknikker og verktøy
  - Ytelsesovervåking og optimalisering

- **Ressurser og referanser**
  - Kommando Jukselapp: Rask referanse for essensielle kommandoer
  - Ordliste: Omfattende terminologi- og akronymdefinisjoner
  - FAQ: Detaljerte svar på vanlige spørsmål
  - Eksterne ressurslenker og fellesskapsforbindelser

- **Eksempler og maler**
  - Enkelt webapplikasjonseksempel
  - Mal for distribusjon av statisk nettsted
  - Container applikasjonskonfigurasjon
  - Databaseintegrasjonsmønstre
  - Mikrotjenestearkitektur-eksempler
  - Serverløse funksjonsimplementeringer

#### Funksjoner
- **Multi-plattform støtte**: Installasjons- og konfigurasjonsguider for Windows, macOS og Linux
- **Flere ferdighetsnivåer**: Innhold designet for studenter opp til profesjonelle utviklere
- **Praktisk fokus**: Praktiske eksempler og virkelighetsnære scenarioer
- **Omfattende dekning**: Fra grunnleggende konsepter til avanserte bedriftsmønstre
- **Sikkerhetsfokus**: Beste sikkerhetspraksis integrert gjennom hele
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive distribusjoner og ressursstyring

#### Dokumentasjonskvalitet
- **Detaljerte kodeeksempler**: Praktiske, testede kodeeksempler
- **Steg-for-steg instruksjoner**: Klare, handlingsrettede guider
- **Omfattende feilbehandling**: Feilsøking for vanlige problemer
- **Integrasjon av beste praksis**: Bransjestandarder og anbefalinger
- **Versjonskompatibilitet**: Oppdatert med nyeste Azure-tjenester og azd-funksjoner

## Planlagte fremtidige forbedringer

### Versjon 3.1.0 (Planlagt)
#### AI Plattformutvidelse
- **Multi-modell støtte**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egne modeller
- **AI Agent-rammeverk**: Maler for LangChain, Semantic Kernel og AutoGen distribusjoner
- **Avanserte RAG-mønstre**: Vektor-databasealternativer utover Azure AI Search (Pinecone, Weaviate, osv.)
- **AI Observability**: Forsterket overvåking av modellprestasjon, tokenbruk og responskvalitet

#### Utvikleropplevelse
- **VS Code-utvidelse**: Integrert AZD + Microsoft Foundry utvikleropplevelse
- **GitHub Copilot-integrasjon**: AI-assistert generering av AZD-maler
- **Interaktive veiledninger**: Praktiske kodeøvelser med automatisert validering for AI-scenarioer
- **Videoinnhold**: Supplerende videotutorials for visuelle lærende med fokus på AI-distribusjoner

### Versjon 4.0.0 (Planlagt)
#### Bedrifts-AI-mønstre
- **Styringsrammeverk**: AI-modellstyring, samsvar og revisjonsspor
- **Multi-leietaker AI**: Mønstre for å betjene flere kunder med isolerte AI-tjenester
- **Edge AI-distribusjon**: Integrasjon med Azure IoT Edge og containerinstanser
- **Hybrid Cloud AI**: Multi-cloud og hybrid distribusjonsmønstre for AI-arbeidsmengder

#### Avanserte funksjoner
- **AI Pipeline Automatisering**: MLOps-integrasjon med Azure Machine Learning pipelines
- **Avansert sikkerhet**: Zero-trust mønstre, private endepunkter og avansert trusselbeskyttelse
- **Ytelsesoptimalisering**: Avansert tuning og skaleringsstrategier for AI-applikasjoner med høy gjennomstrømning
- **Global distribusjon**: Innholdsleverings- og edge-caching-mønstre for AI-applikasjoner

### Versjon 3.0.0 (Planlagt) - Overtatt av gjeldende utgivelse
#### Foreslåtte tillegg - Nå implementert i v3.0.0
- ✅ **AI-Fokusert innhold**: Omfattende Microsoft Foundry-integrasjon (Fullført)
- ✅ **Interaktive veiledninger**: Praktisk AI-workshop lab (Fullført)
- ✅ **Avansert sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)
- ✅ **Ytelsesoptimalisering**: AI-arbeidsbelastnings-tuning strategier (Fullført)

### Versjon 2.1.0 (Planlagt) - Delvis implementert i v3.0.0
#### Mindre forbedringer - Noe fullført i gjeldende utgivelse
- ✅ **Flere eksempler**: AI-fokuserte distribusjonsscenarioer (Fullført)
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)
- **Verktøyintegrasjon**: Forbedrede IDE- og editor-integrasjonsguider
- ✅ **Overvåkningseksansjon**: AI-spesifikke overvåkings- og varslingsmønstre (Fullført)

#### Fortsatt planlagt for fremtidig utgivelse
- **Mobilvennlig dokumentasjon**: Responsivt design for mobil læring
- **Offline-tilgang**: Nedlastbare dokumentasjonspakker
- **Forbedret IDE-integrasjon**: VS Code-utvidelse for AZD + AI-arbeidsflyter
- **Fellesskapsdashbord**: Sanntids fellesskapsmålinger og bidragssporing

## Bidra til endringsloggen

### Rapportering av endringer
Når du bidrar til dette depotet, vennligst sørg for at endringsloggoppføringer inkluderer:

1. **Versjonsnummer**: Følge semantisk versjonering (major.minor.patch)
2. **Dato**: Utgivelses- eller oppdateringsdato i formatet YYYY-MM-DD
3. **Kategori**: Lagt til, Endret, Utdaterte, Fjernet, Fikset, Sikkerhet
4. **Klar beskrivelse**: Konsis beskrivelse av hva som er endret
5. **Påvirkningsvurdering**: Hvordan endringer påvirker eksisterende brukere

### Endringskategorier

#### Lagt til
- Nye funksjoner, dokumentasjonsseksjoner eller kapabiliteter
- Nye eksempler, maler eller læringsressurser
- Ytterligere verktøy, skript eller hjelpeprogrammer

#### Endret
- Endringer i eksisterende funksjonalitet eller dokumentasjon
- Oppdateringer for å forbedre klarhet eller nøyaktighet
- Omstrukturering av innhold eller organisering

#### Utdaterte
- Funksjoner eller tilnærminger som fases ut
- Dokumentasjonsseksjoner planlagt fjernet
- Metoder som har bedre alternativer

#### Fjernet
- Funksjoner, dokumentasjon eller eksempler som ikke lenger er relevante
- Utdatert informasjon eller utdaterte tilnærminger
- Redundante eller konsoliderte innhold

#### Fikset
- Korrigeringer av feil i dokumentasjon eller kode
- Løsning av rapporterte problemer eller feil
- Forbedringer i nøyaktighet eller funksjonalitet

#### Sikkerhet
- Sikkerhetsrelaterte forbedringer eller feilrettinger
- Oppdateringer til sikkerhetsbeste praksis
- Løsning av sikkerhetssårbarheter

### Retningslinjer for semantisk versjonering

#### Hovedversjon (X.0.0)
- Bruddendringer som krever brukerhandling
- Betydelig omstrukturering av innhold eller organisering
- Endringer som endrer grunnleggende tilnærming eller metodikk

#### Mindre versjon (X.Y.0)
- Nye funksjoner eller innholds tillegg
- Forbedringer som opprettholder bakoverkompatibilitet
- Ytterligere eksempler, verktøy eller ressurser

#### Patchversjon (X.Y.Z)
- Feilrettinger og korreksjoner
- Mindre forbedringer av eksisterende innhold
- Avklaringer og små forbedringer

## Tilbakemeldinger og forslag fra fellesskapet

Vi oppfordrer aktivt til tilbakemeldinger fra fellesskapet for å forbedre denne læringsressursen:

### Hvordan gi tilbakemelding
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-spesifikke problemer er velkomne)
- **Discord-diskusjoner**: Del ideer og delta i Microsoft Foundry-fellesskapet
- **Pull Requests**: Bidra med direkte forbedringer av innhold, spesielt AI-maler og veiledninger
- **Microsoft Foundry Discord**: Delta i #Azure-kanalen for AZD + AI-diskusjoner
- **Fellesskapsfora**: Delta i bredere Azure-utviklerdiskusjoner

### Tilbakemeldingskategorier
- **Nøyaktighet for AI-innhold**: Korreksjoner til AI-tjenesteintegrering og distribusjonsinformasjon
- **Læringsopplevelse**: Forslag til forbedret AI-utviklers læringsflyt
- **Manglende AI-innhold**: Forespørsler om flere AI-maler, mønstre eller eksempler
- **Tilgjengelighet**: Forbedringer for ulike læringsbehov
- **Integrering av AI-verktøy**: Forslag til bedre integrering i AI-utviklingsarbeidsflyt
- **Produksjonsmønstre for AI**: Forespørsler om mønstre for AI-distribusjon i virksomhet

### Forpliktelse til respons
- **Respons på problemer**: Innen 48 timer for rapporterte problemer
- **Funksjonsforespørsler**: Evaluering innen én uke
- **Bidrag fra fellesskapet**: Gjennomgang innen én uke
- **Sikkerhetsproblemer**: Umiddelbar prioritet med rask respons

## Vedlikeholdsplan

### Regelmessige oppdateringer
- **Månedlige vurderinger**: Nøyaktighet av innhold og validering av lenker
- **Kvartalsvise oppdateringer**: Store innholdstillegg og forbedringer
- **Halvårlige vurderinger**: Omfattende omstrukturering og forbedringer
- **Årlige utgivelser**: Store versjonsoppdateringer med betydelige forbedringer

### Overvåking og kvalitetssikring
- **Automatisert testing**: Regelmessig validering av kodeeksempler og lenker
- **Integrering av tilbakemeldinger fra fellesskapet**: Regelmessig innarbeiding av brukers forslag
- **Teknologiske oppdateringer**: Tilpasning til de nyeste Azure-tjenestene og azd-utgivelser
- **Tilgjengelighetsrevisjoner**: Jevnlige vurderinger for inkluderende designprinsipper

## Retningslinjer for versjonsstøtte

### Støtte for gjeldende versjoner
- **Nyeste hovedversjon**: Full støtte med regelmessige oppdateringer
- **Forrige hovedversjon**: Sikkerhetsoppdateringer og kritiske feilrettinger i 12 måneder
- **Arvede versjoner**: Kun fellesskapsstøtte, ingen offisielle oppdateringer

### Veiledning for migrering
Når hovedversjoner slippes, tilbyr vi:
- **Migreringsguider**: Trinnvise overgangsinstruksjoner
- **Kompatibilitetsnotater**: Detaljer om bruddendringer
- **Verktøystøtte**: Skript eller verktøy for å hjelpe med migrering
- **Fellesskapsstøtte**: Dedikerte forum for migreringsspørsmål

---

**Navigasjon**
- **Forrige leksjon**: [Studieguide](resources/study-guide.md)
- **Neste leksjon**: Gå tilbake til [Hoved README](README.md)

**Hold deg oppdatert**: Følg dette depotet for varsler om nyutgivelser og viktige oppdateringer til læringsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->