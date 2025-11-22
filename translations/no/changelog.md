<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-21T14:29:52+00:00",
  "source_file": "changelog.md",
  "language_code": "no"
}
-->
# Endringslogg - AZD For Nybegynnere

## Introduksjon

Denne endringsloggen dokumenterer alle merkbare endringer, oppdateringer og forbedringer i AZD For Nybegynnere-repositoriet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere med å forstå hva som har endret seg mellom versjonene.

## Læringsmål

Ved å gjennomgå denne endringsloggen vil du:
- Holde deg oppdatert på nye funksjoner og innholdstilføyelser
- Forstå forbedringer gjort i eksisterende dokumentasjon
- Følge feilrettinger og korrigeringer for å sikre nøyaktighet
- Følge utviklingen av læringsmaterialet over tid

## Læringsutbytte

Etter å ha gjennomgått endringsloggoppføringene vil du kunne:
- Identifisere nytt innhold og ressurser tilgjengelig for læring
- Forstå hvilke seksjoner som har blitt oppdatert eller forbedret
- Planlegge din læringsvei basert på det mest oppdaterte materialet
- Bidra med tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.8.0] - 2025-11-19

#### Avansert Dokumentasjon: Overvåking, Sikkerhet og Multi-Agent Mønstre
**Denne versjonen legger til omfattende A-nivå leksjoner om integrasjon med Application Insights, autentiseringsmønstre og koordinering av multi-agenter for produksjonsutrullinger.**

#### Lagt til
- **📊 Application Insights Integrasjonsleksjon**: i `docs/pre-deployment/application-insights.md`:
  - AZD-fokusert utrulling med automatisk klargjøring
  - Fullstendige Bicep-maler for Application Insights + Log Analytics
  - Fungerende Python-applikasjoner med tilpasset telemetri (1 200+ linjer)
  - AI/LLM-overvåkingsmønstre (Azure OpenAI token-/kostnadssporing)
  - 6 Mermaid-diagrammer (arkitektur, distribuert sporing, telemetriflyt)
  - 3 praktiske øvelser (varsler, dashbord, AI-overvåking)
  - Kusto-spørringseksempler og kostnadsoptimaliseringsstrategier
  - Live-metrikkstrømming og sanntidsfeilsøking
  - 40-50 minutters læringstid med produksjonsklare mønstre

- **🔐 Autentiserings- og Sikkerhetsmønstre Leksjon**: i `docs/getting-started/authsecurity.md`:
  - 3 autentiseringsmønstre (tilkoblingsstrenger, Key Vault, administrert identitet)
  - Fullstendige Bicep-infrastrukturmaler for sikre utrullinger
  - Node.js-applikasjonskode med Azure SDK-integrasjon
  - 3 komplette øvelser (aktivere administrert identitet, brukerdefinert identitet, Key Vault-rotasjon)
  - Sikkerhetsbeste praksis og RBAC-konfigurasjoner
  - Feilsøkingsguide og kostnadsanalyse
  - Produksjonsklare mønstre for passordløs autentisering

- **🤖 Multi-Agent Koordineringsmønstre Leksjon**: i `docs/pre-deployment/coordination-patterns.md`:
  - 5 koordineringsmønstre (sekvensiell, parallell, hierarkisk, hendelsesdrevet, konsensus)
  - Fullstendig orkestratortjenesteimplementasjon (Python/Flask, 1 500+ linjer)
  - 3 spesialiserte agentimplementasjoner (Forsker, Skribent, Redaktør)
  - Service Bus-integrasjon for meldingskøer
  - Cosmos DB tilstandshåndtering for distribuerte systemer
  - 6 Mermaid-diagrammer som viser agentinteraksjoner
  - 3 avanserte øvelser (timeout-håndtering, retry-logikk, kretsbryter)
  - Kostnadsoversikt ($240-565/måned) med optimaliseringsstrategier
  - Application Insights-integrasjon for overvåking

#### Forbedret
- **Pre-deployment Kapittel**: Inkluderer nå omfattende overvåkings- og koordineringsmønstre
- **Kom i Gang Kapittel**: Forbedret med profesjonelle autentiseringsmønstre
- **Produksjonsklarhet**: Full dekning fra sikkerhet til observabilitet
- **Kursoversikt**: Oppdatert for å referere til nye leksjoner i Kapittel 3 og 6

#### Endret
- **Læringsprogresjon**: Bedre integrasjon av sikkerhet og overvåking gjennom hele kurset
- **Dokumentasjonskvalitet**: Konsistente A-nivå standarder (95-97%) på tvers av nye leksjoner
- **Produksjonsmønstre**: Fullstendig ende-til-ende dekning for bedriftsutrullinger

#### Forbedret
- **Utvikleropplevelse**: Klar vei fra utvikling til produksjonsovervåking
- **Sikkerhetsstandarder**: Profesjonelle mønstre for autentisering og hemmelighetshåndtering
- **Observabilitet**: Full Application Insights-integrasjon med AZD
- **AI Arbeidsbelastninger**: Spesialisert overvåking for Azure OpenAI og multi-agent systemer

#### Validert
- ✅ Alle leksjoner inkluderer komplett fungerende kode (ikke bare utdrag)
- ✅ Mermaid-diagrammer for visuell læring (19 totalt på tvers av 3 leksjoner)
- ✅ Praktiske øvelser med verifikasjonstrinn (9 totalt)
- ✅ Produksjonsklare Bicep-maler som kan distribueres via `azd up`
- ✅ Kostnadsanalyse og optimaliseringsstrategier
- ✅ Feilsøkingsguider og beste praksis
- ✅ Kunnskapssjekkpunkter med verifikasjonskommandoer

#### Dokumentasjonsvurderingsresultater
- **docs/pre-deployment/application-insights.md**: - Omfattende overvåkingsguide
- **docs/getting-started/authsecurity.md**: - Profesjonelle sikkerhetsmønstre
- **docs/pre-deployment/coordination-patterns.md**: - Avanserte multi-agent arkitekturer
- **Totalt Nytt Innhold**: - Konsistente høykvalitetsstandarder

#### Teknisk Implementering
- **Application Insights**: Log Analytics + tilpasset telemetri + distribuert sporing
- **Autentisering**: Administrert identitet + Key Vault + RBAC-mønstre
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrering
- **Overvåking**: Live-metrikker + Kusto-spørringer + varsler + dashbord
- **Kostnadsstyring**: Utvalgsstrategier, oppbevaringspolicyer, budsjettkontroller

### [v3.7.0] - 2025-11-19

#### Forbedringer i Dokumentasjonskvalitet og Nytt Azure OpenAI Eksempel
**Denne versjonen forbedrer dokumentasjonskvaliteten i hele repositoriet og legger til et komplett Azure OpenAI utrullingseksempel med GPT-4 chatgrensesnitt.**

#### Lagt til
- **🤖 Azure OpenAI Chat Eksempel**: Komplett GPT-4 utrulling med fungerende implementasjon i `examples/azure-openai-chat/`:
  - Komplett Azure OpenAI infrastruktur (GPT-4 modellutrulling)
  - Python kommandolinje chatgrensesnitt med samtalehistorikk
  - Key Vault-integrasjon for sikker API-nøkkellagring
  - Tokensporing og kostnadsestimering
  - Hastighetsbegrensning og feilhåndtering
  - Omfattende README med 35-45 minutters utrullingsguide
  - 11 produksjonsklare filer (Bicep-maler, Python-app, konfigurasjon)
- **📚 Dokumentasjonsøvelser**: Lagt til praktiske øvelser i konfigurasjonsguiden:
  - Øvelse 1: Konfigurasjon for flere miljøer (15 minutter)
  - Øvelse 2: Hemmelighetshåndteringspraksis (10 minutter)
  - Klare suksesskriterier og verifikasjonstrinn
- **✅ Utrullingsverifikasjon**: Lagt til verifikasjonsseksjon i utrullingsguiden:
  - Helsekontrollprosedyrer
  - Suksesskriteriesjekkliste
  - Forventede utdata for alle utrullingskommandoer
  - Feilsøkingsreferanse

#### Forbedret
- **examples/README.md**: Oppdatert til A-nivå kvalitet (93%):
  - Lagt til azure-openai-chat i alle relevante seksjoner
  - Oppdatert antall lokale eksempler fra 3 til 4
  - Lagt til i tabellen for AI-applikasjonseksempler
  - Integrert i Hurtigstart for Mellomnivåbrukere
  - Lagt til i Azure AI Foundry Maler-seksjonen
  - Oppdatert sammenligningsmatrise og teknologifunnseksjoner
- **Dokumentasjonskvalitet**: Forbedret fra B+ (87%) → A- (92%) i hele docs-mappen:
  - Lagt til forventede utdata til kritiske kommandolinjeeksempler
  - Inkludert verifikasjonstrinn for konfigurasjonsendringer
  - Forbedret praktisk læring med praktiske øvelser

#### Endret
- **Læringsprogresjon**: Bedre integrasjon av AI-eksempler for mellomnivåbrukere
- **Dokumentasjonsstruktur**: Mer handlingsrettede øvelser med klare resultater
- **Verifikasjonsprosess**: Eksplisitte suksesskriterier lagt til i nøkkelarbeidsflyter

#### Forbedret
- **Utvikleropplevelse**: Azure OpenAI utrulling tar nå 35-45 minutter (vs 60-90 for komplekse alternativer)
- **Kostnadstransparens**: Klare kostnadsestimater ($50-200/måned) for Azure OpenAI-eksempel
- **Læringssti**: AI-utviklere har en klar inngang med azure-openai-chat
- **Dokumentasjonsstandarder**: Konsistente forventede utdata og verifikasjonstrinn

#### Validert
- ✅ Azure OpenAI-eksempel fullt funksjonelt med `azd up`
- ✅ Alle 11 implementeringsfiler syntaktisk korrekte
- ✅ README-instruksjoner samsvarer med faktisk utrullingserfaring
- ✅ Dokumentasjonslenker oppdatert på tvers av 8+ steder
- ✅ Eksempler-indeks reflekterer nøyaktig 4 lokale eksempler
- ✅ Ingen dupliserte eksterne lenker i tabeller
- ✅ Alle navigasjonsreferanser korrekte

#### Teknisk Implementering
- **Azure OpenAI Arkitektur**: GPT-4 + Key Vault + Container Apps mønster
- **Sikkerhet**: Klar for administrert identitet, hemmeligheter i Key Vault
- **Overvåking**: Application Insights-integrasjon
- **Kostnadsstyring**: Tokensporing og bruksoptimalisering
- **Utrulling**: Enkelt `azd up`-kommando for komplett oppsett

### [v3.6.0] - 2025-11-19

#### Større Oppdatering: Eksempler på Container App Utrulling
**Denne versjonen introduserer omfattende, produksjonsklare eksempler på containerapplikasjonsutrulling ved bruk av Azure Developer CLI (AZD), med full dokumentasjon og integrasjon i læringsstien.**

#### Lagt til
- **🚀 Container App Eksempler**: Nye lokale eksempler i `examples/container-app/`:
  - [Hovedguide](examples/container-app/README.md): Komplett oversikt over containeriserte utrullinger, hurtigstart, produksjon og avanserte mønstre
  - [Enkel Flask API](../../examples/container-app/simple-flask-api): Nybegynnervennlig REST API med scale-to-zero, helseprober, overvåking og feilsøking
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices): Produksjonsklar multi-tjeneste utrulling (API Gateway, Produkt, Ordre, Bruker, Varsling), asynkron meldingsutveksling, Service Bus, Cosmos DB, Azure SQL, distribuert sporing, blå-grønn/kanarifuglutrulling
- **Beste Praksis**: Sikkerhet, overvåking, kostnadsoptimalisering og CI/CD-veiledning for containeriserte arbeidsbelastninger
- **Kodeeksempler**: Fullstendig `azure.yaml`, Bicep-maler og flerspråklige tjenesteimplementeringer (Python, Node.js, C#, Go)
- **Testing & Feilsøking**: Ende-til-ende testscenarier, overvåkingskommandoer, feilsøkingsveiledning

#### Endret
- **README.md**: Oppdatert for å fremheve og lenke til nye containerapp-eksempler under "Lokale Eksempler - Container Applikasjoner"
- **examples/README.md**: Oppdatert for å fremheve containerapp-eksempler, legge til sammenligningsmatriseoppføringer og oppdatere teknologi-/arkitekturreferanser
- **Kursoversikt & Studieguide**: Oppdatert for å referere til nye containerapp-eksempler og utrullingsmønstre i relevante kapitler

#### Validert
- ✅ Alle nye eksempler kan distribueres med `azd up` og følger beste praksis
- ✅ Dokumentasjonskrysslenker og navigasjon oppdatert
- ✅ Eksempler dekker nybegynner til avanserte scenarier, inkludert produksjonsmikrotjenester

#### Notater
- **Omfang**: Engelsk dokumentasjon og eksempler kun
- **Neste Steg**: Utvid med flere avanserte containermønstre og CI/CD-automatisering i fremtidige utgivelser

### [v3.5.0] - 2025-11-19

#### Produktrebranding: Microsoft Foundry
**Denne versjonen implementerer en omfattende produktnavnendring fra "Azure AI Foundry" til "Microsoft Foundry" i all engelsk dokumentasjon, i tråd med Microsofts offisielle rebranding.**

#### Endret
- **🔄 Produktnavnoppdatering**: Full rebranding fra "Azure AI Foundry" til "Microsoft Foundry"
  - Oppdatert alle referanser i engelsk dokumentasjon i `docs/`-mappen
  - Omdøpt mappe: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Omdøpt fil: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Totalt: 23 innholdsreferanser oppdatert på tvers av 7 dokumentasjonsfiler

- **📁 Mappestrukturendringer**:
  - `docs/ai-foundry/` omdøpt til `docs/microsoft-foundry/`
  - Alle kryssreferanser oppdatert for å reflektere ny mappestruktur
  - Navigasjonslenker validert på tvers av all dokumentasjon

- **📄 Filnavnendringer**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle interne lenker oppdatert for å referere til nytt filnavn

#### Oppdaterte Filer
- **Kapitteldokumentasjon** (7 filer):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 navigasjonslenker oppdatert
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 produktnavnreferanser oppdatert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Allerede bruker Microsoft Foundry (fra tidligere oppdateringer)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referanser oppdatert (oversikt, tilbakemeldinger fra fellesskapet, dokumentasjon)
  - `docs/getting-started/azd-basics.md` - 4 kryssreferanselenker oppdatert
  - `docs/getting-started/first-project.md` - 2 kapittelnavigasjonslenker oppdatert
  - `docs/getting-started/installation.md` - 2 neste kapittellenker oppdatert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referanser oppdatert (navigasjon, Discord-fellesskap)
  - `docs/troubleshooting/common-issues.md` - 1 navigasjonslenke oppdatert
  - `docs/troubleshooting/debugging.md` - 1 navigasjonslenke oppdatert

- **Kursstrukturfiler** (2 filer):
  - `README.md` - 17 referanser oppdatert (kursoversikt, kapitteltitler, maler-seksjon, fellesskapsinnsikt)
  - `course-outline.md` - 14 referanser oppdatert (oversikt, læringsmål, kapittelressurser)

#### Validert
- ✅ Ingen gjenværende "ai-foundry"-mappereferanser i engelsk dokumentasjon
- ✅ Ingen gjenværende "Azure AI Foundry"-produktnavnreferanser i engelsk dokumentasjon
- ✅ Alle navigasjonslenker fungerer med ny mappestruktur
- ✅ Fil- og mappenavnendringer fullført vellykket
- ✅ Kryssreferanser mellom kapitler validert

#### Notater
- **Om
- **Workshop**: Workshop-materialer (`workshop/`) ikke oppdatert i denne versjonen
- **Eksempler**: Eksempelfiler kan fortsatt referere til eldre navngivning (vil bli adressert i fremtidig oppdatering)
- **Eksterne lenker**: Eksterne URL-er og GitHub-referanser forblir uendret

#### Migreringsveiledning for bidragsytere
Hvis du har lokale grener eller dokumentasjon som refererer til den gamle strukturen:
1. Oppdater mappereferanser: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Oppdater filreferanser: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Bytt produktnavn: "Azure AI Foundry" → "Microsoft Foundry"
4. Valider at alle interne dokumentasjonslenker fortsatt fungerer

---

### [v3.4.0] - 2025-10-24

#### Forhåndsvisning av infrastruktur og forbedringer i validering
**Denne versjonen introduserer omfattende støtte for den nye forhåndsvisningsfunksjonen i Azure Developer CLI og forbedrer brukeropplevelsen i workshop.**

#### Nytt
- **🧪 azd provision --preview Funksjonsdokumentasjon**: Omfattende dekning av den nye forhåndsvisningsfunksjonen for infrastruktur
  - Kommandoreferanse og bruksanvisninger i jukselapp
  - Detaljert integrasjon i veiledning for klargjøring med brukstilfeller og fordeler
  - Integrasjon av forhåndssjekk for tryggere distribusjonsvalidering
  - Oppdateringer i oppstartsguide med fokus på sikker distribusjon
- **🚧 Workshop-statusbanner**: Profesjonelt HTML-banner som indikerer workshopens utviklingsstatus
  - Gradientdesign med byggeindikatorer for tydelig kommunikasjon til brukere
  - Sist oppdatert tidsstempel for åpenhet
  - Mobilvennlig design for alle enhetstyper

#### Forbedret
- **Infrastruktursikkerhet**: Forhåndsvisningsfunksjonalitet integrert i hele distribusjonsdokumentasjonen
- **Validering før distribusjon**: Automatiserte skript inkluderer nå testing av infrastrukturforhåndsvisning
- **Utviklerarbeidsflyt**: Oppdaterte kommandosekvenser for å inkludere forhåndsvisning som beste praksis
- **Workshop-opplevelse**: Klare forventninger satt for brukere om innholdets utviklingsstatus

#### Endret
- **Beste praksis for distribusjon**: Forhåndsvisningsbasert arbeidsflyt anbefales nå som tilnærming
- **Dokumentasjonsflyt**: Validering av infrastruktur flyttet tidligere i læringsprosessen
- **Workshop-presentasjon**: Profesjonell statuskommunikasjon med tydelig utviklingstidslinje

#### Forbedret
- **Sikkerhet først-tilnærming**: Infrastrukturendringer kan nå valideres før distribusjon
- **Teamarbeid**: Forhåndsvisningsresultater kan deles for gjennomgang og godkjenning
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før klargjøring
- **Risikoreduksjon**: Reduserte distribusjonsfeil gjennom forhåndsvalidering

#### Teknisk implementering
- **Integrasjon i flere dokumenter**: Forhåndsvisningsfunksjon dokumentert på tvers av 4 nøkkelfiler
- **Kommandomønstre**: Konsistent syntaks og eksempler gjennom hele dokumentasjonen
- **Beste praksis-integrasjon**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript
- **Visuelle indikatorer**: Tydelige NYE funksjonsmarkeringer for oppdagbarhet

#### Workshop-infrastruktur
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientdesign
- **Brukeropplevelse**: Klar utviklingsstatus forhindrer forvirring
- **Profesjonell presentasjon**: Opprettholder depotets troverdighet samtidig som forventninger settes
- **Tidslinjeåpenhet**: Oktober 2025 sist oppdatert tidsstempel for ansvarlighet

### [v3.3.0] - 2025-09-24

#### Forbedrede workshop-materialer og interaktiv læringsopplevelse
**Denne versjonen introduserer omfattende workshop-materialer med nettleserbaserte interaktive guider og strukturerte læringsstier.**

#### Nytt
- **🎥 Interaktiv workshop-guide**: Nettleserbasert workshop-opplevelse med MkDocs forhåndsvisningsfunksjon
- **📝 Strukturerte workshop-instruksjoner**: 7-trinns veiledet læringssti fra oppdagelse til tilpasning
  - 0-Introduksjon: Oversikt over workshop og oppsett
  - 1-Velg-AI-mal: Oppdagelse og valg av mal
  - 2-Valider-AI-mal: Distribusjons- og valideringsprosedyrer
  - 3-Dekonstruer-AI-mal: Forståelse av malarkitektur
  - 4-Konfigurer-AI-mal: Konfigurasjon og tilpasning
  - 5-Tilpass-AI-mal: Avanserte modifikasjoner og iterasjoner
  - 6-Rydd opp infrastruktur: Opprydding og ressursstyring
  - 7-Oppsummering: Oppsummering og neste steg
- **🛠️ Workshop-verktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringssti**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløst oppsett av utviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Utvidet med en omfattende 2-3 timers strukturert læringsopplevelse
- **Workshop-dokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Klar trinn-for-trinn veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrerte verktøy for strømlinjeformede utviklingsarbeidsflyter

#### Forbedret
- **Tilgjengelighet**: Nettleserbasert grensesnitt med søk, kopieringsfunksjonalitet og temavelger
- **Selvstyrt læring**: Fleksibel workshop-struktur som tilpasser seg ulike læringshastigheter
- **Praktisk anvendelse**: Virkelige distribusjonsscenarier for AI-maler
- **Fellesskapsintegrasjon**: Discord-integrasjon for workshop-støtte og samarbeid

#### Workshop-funksjoner
- **Innebygd søk**: Rask oppdagelse av nøkkelord og leksjoner
- **Kopier kodeblokker**: Hover-til-kopier-funksjonalitet for alle kodeeksempler
- **Temavelger**: Støtte for mørk/lys modus for ulike preferanser
- **Visuelle ressurser**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte Discord-tilgang for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Større navigasjonsomstrukturering og kapittelbasert læringssystem
**Denne versjonen introduserer en omfattende kapittelbasert læringsstruktur med forbedret navigasjon gjennom hele depotet.**

#### Nytt
- **📚 Kapittelbasert læringssystem**: Omstrukturert hele kurset i 8 progressive læringskapitler
  - Kapittel 1: Grunnlag og rask start (⭐ - 30-45 min)
  - Kapittel 2: AI-først utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon og autentisering (⭐⭐ - 45-60 min)
  - Kapittel 4: Infrastruktur som kode og distribusjon (⭐⭐⭐ - 1-1,5 timer)
  - Kapittel 5: Multi-agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Validering og planlegging før distribusjon (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking og debugging (⭐⭐ - 1-1,5 timer)
  - Kapittel 8: Produksjon og bedriftsmønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonsoverskrifter og bunntekster på tvers av all dokumentasjon
- **🎯 Fremdriftssporing**: Sjekkliste for kursfullføring og læringsverifisering
- **🗺️ Veiledning for læringssti**: Klare inngangspunkter for ulike erfaringsnivåer og mål
- **🔗 Kryssreferansenavigasjon**: Relaterte kapitler og forutsetninger tydelig lenket

#### Forbedret
- **README-struktur**: Transformert til en strukturert læringsplattform med kapittelbasert organisering
- **Dokumentasjonsnavigasjon**: Hver side inkluderer nå kapittelkontekst og progresjonsveiledning
- **Malorganisering**: Eksempler og maler kartlagt til relevante læringskapitler
- **Ressursintegrasjon**: Jukselapper, vanlige spørsmål og studieveiledninger koblet til relevante kapitler
- **Workshop-integrasjon**: Praktiske laboratorier kartlagt til flere kapittel-læringsmål

#### Endret
- **Læringsprogresjon**: Flyttet fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Konfigurasjonsplassering**: Reposisjonert konfigurasjonsveiledning som Kapittel 3 for bedre læringsflyt
- **AI-innholdsintegrasjon**: Bedre integrasjon av AI-spesifikt innhold gjennom hele læringsreisen
- **Produksjonsinnhold**: Avanserte mønstre konsolidert i Kapittel 8 for bedriftslærere

#### Forbedret
- **Brukeropplevelse**: Klare navigasjonsbrødsmuler og kapittelprogresjonsindikatorer
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kursgjennomgang
- **Profesjonell presentasjon**: Universitetsstil kursstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Redusert tid for å finne relevant innhold gjennom forbedret organisering

#### Teknisk implementering
- **Navigasjonsoverskrifter**: Standardiserte kapittelnavigasjoner på tvers av 40+ dokumentasjonsfiler
- **Bunntekstnavigasjon**: Konsistent progresjonsveiledning og kapittelfullføringsindikatorer
- **Krysslenking**: Omfattende internt lenkesystem som kobler relaterte konsepter
- **Kapittelkartlegging**: Maler og eksempler tydelig assosiert med læringsmål

#### Forbedring av studieveiledning
- **📚 Omfattende læringsmål**: Restrukturert studieveiledning for å tilpasse seg 8-kapittelsystemet
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inkluderer spesifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ukentlig læringsplan med målbare resultater og fullføringssjekklister
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle utfall
- **🛠️ Praktiske øvelser**: Praktiske aktiviteter med reelle distribusjonsscenarier og feilsøking
- **📊 Ferdighetsprogresjon**: Klar fremgang fra grunnleggende konsepter til bedriftsmønstre med karriereutviklingsfokus
- **🎓 Sertifiseringsrammeverk**: Profesjonelle utviklingsresultater og fellesskapsanerkjennelse
- **⏱️ Tidsstyring**: Strukturert 10-ukers læringsplan med milepælsvalidering
- **Innholdspresentasjon**: Fjernet dekorative elementer til fordel for klar, profesjonell formatering
- **Lenkestruktur**: Oppdatert alle interne lenker for å støtte det nye navigasjonssystemet

#### Forbedret
- **Tilgjengelighet**: Fjernet avhengighet av emoji for bedre skjermleserkompatibilitet
- **Profesjonelt Utseende**: Ren, akademisk stil som passer for læring i bedrifter
- **Læringsopplevelse**: Strukturert tilnærming med klare mål og resultater for hver leksjon
- **Innholdsorganisering**: Bedre logisk flyt og sammenheng mellom relaterte temaer

### [v1.0.0] - 2025-09-09

#### Første Utgivelse - Omfattende AZD Læringsarkiv

#### Lagt til
- **Kjernedokumentasjonsstruktur**
  - Komplett serie med introduksjonsveiledninger
  - Omfattende dokumentasjon for utrulling og klargjøring
  - Detaljerte ressurser for feilsøking og feildiagnostisering
  - Verktøy og prosedyrer for validering før utrulling

- **Introduksjonsmodul**
  - AZD Grunnleggende: Kjernebegreper og terminologi
  - Installasjonsveiledning: Plattformspesifikke oppsettinstruksjoner
  - Konfigurasjonsveiledning: Miljøoppsett og autentisering
  - Første Prosjekt Tutorial: Trinn-for-trinn praktisk læring

- **Utrullings- og Klargjøringsmodul**
  - Utrullingsveiledning: Komplett arbeidsflytdokumentasjon
  - Klargjøringsveiledning: Infrastruktur som kode med Bicep
  - Beste praksis for produksjonsutrullinger
  - Arkitekturmønstre for flere tjenester

- **Valideringsmodul før Utrulling**
  - Kapasitetsplanlegging: Validering av tilgjengelige Azure-ressurser
  - Valg av SKU: Omfattende veiledning for tjenestenivåer
  - Kontroll før utrulling: Automatiserte valideringsskript (PowerShell og Bash)
  - Verktøy for kostnadsestimering og budsjettplanlegging

- **Feilsøkingsmodul**
  - Vanlige Problemer: Ofte møtte utfordringer og løsninger
  - Feildiagnostiseringsveiledning: Systematiske metoder for feilsøking
  - Avanserte diagnostiseringsteknikker og verktøy
  - Overvåking og optimalisering av ytelse

- **Ressurser og Referanser**
  - Kommando-hurtigreferanse: Rask tilgang til essensielle kommandoer
  - Ordliste: Omfattende definisjoner av terminologi og akronymer
  - FAQ: Detaljerte svar på vanlige spørsmål
  - Eksterne ressurslenker og fellesskapsforbindelser

- **Eksempler og Maler**
  - Eksempel på enkel webapplikasjon
  - Mal for utrulling av statisk nettsted
  - Konfigurasjon for containerapplikasjon
  - Mønstre for databaseintegrasjon
  - Eksempler på mikrotjenestearkitektur
  - Implementeringer av serverløse funksjoner

#### Funksjoner
- **Støtte for flere plattformer**: Installasjons- og konfigurasjonsveiledninger for Windows, macOS og Linux
- **Flere Ferdighetsnivåer**: Innhold designet for studenter og profesjonelle utviklere
- **Praktisk Fokus**: Praktiske eksempler og virkelige scenarioer
- **Omfattende Dekning**: Fra grunnleggende konsepter til avanserte mønstre for bedrifter
- **Sikkerhetsfokusert Tilnærming**: Beste praksis for sikkerhet integrert gjennom hele
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive utrullinger og ressursstyring

#### Dokumentasjonskvalitet
- **Detaljerte Kodeeksempler**: Praktiske, testede kodeeksempler
- **Trinn-for-Trinn Instruksjoner**: Klar, handlingsrettet veiledning
- **Omfattende Feilhåndtering**: Feilsøking for vanlige problemer
- **Integrering av Beste Praksis**: Bransjestandarder og anbefalinger
- **Versjonskompatibilitet**: Oppdatert med de nyeste Azure-tjenestene og AZD-funksjonene

## Planlagte Fremtidige Forbedringer

### Versjon 3.1.0 (Planlagt)
#### Utvidelse av AI-plattform
- **Støtte for flere modeller**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egendefinerte modeller
- **AI Agent Rammeverk**: Maler for LangChain, Semantic Kernel og AutoGen utrullinger
- **Avanserte RAG-mønstre**: Alternativer for vektordatabaser utover Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observabilitet**: Forbedret overvåking av modellytelse, tokenbruk og svarkvalitet

#### Utvikleropplevelse
- **VS Code Utvidelse**: Integrert AZD + AI Foundry utviklingsopplevelse
- **GitHub Copilot Integrasjon**: AI-assistert AZD malgenerering
- **Interaktive Tutorials**: Praktiske kodeøvelser med automatisert validering for AI-scenarioer
- **Videoinnhold**: Supplerende videotutorials for visuelle lærere med fokus på AI-utrullinger

### Versjon 4.0.0 (Planlagt)
#### Mønstre for Bedrifts-AI
- **Styringsrammeverk**: Styring av AI-modeller, samsvar og revisjonsspor
- **Multi-Tenant AI**: Mønstre for å betjene flere kunder med isolerte AI-tjenester
- **Edge AI Utrulling**: Integrasjon med Azure IoT Edge og containerinstanser
- **Hybrid Cloud AI**: Mønstre for multi-cloud og hybrid utrulling av AI-arbeidsbelastninger

#### Avanserte Funksjoner
- **Automatisering av AI-pipeline**: MLOps-integrasjon med Azure Machine Learning-pipelines
- **Avansert Sikkerhet**: Zero-trust mønstre, private endepunkter og avansert trusselbeskyttelse
- **Ytelsesoptimalisering**: Avanserte justerings- og skaleringsstrategier for AI-applikasjoner med høy gjennomstrømning
- **Global Distribusjon**: Mønstre for innholdslevering og caching på kanten for AI-applikasjoner

### Versjon 3.0.0 (Planlagt) - Erstattet av Nåværende Utgivelse
#### Foreslåtte Tillegg - Nå Implementert i v3.0.0
- ✅ **AI-Fokusert Innhold**: Omfattende integrasjon med Azure AI Foundry (Fullført)
- ✅ **Interaktive Tutorials**: Praktisk AI-verkstedlab (Fullført)
- ✅ **Avansert Sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)
- ✅ **Ytelsesoptimalisering**: Justeringsstrategier for AI-arbeidsbelastninger (Fullført)

### Versjon 2.1.0 (Planlagt) - Delvis Implementert i v3.0.0
#### Mindre Forbedringer - Noen Fullført i Nåværende Utgivelse
- ✅ **Ekstra Eksempler**: AI-fokuserte utrullingsscenarioer (Fullført)
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)
- **Verktøyintegrasjon**: Forbedrede veiledninger for IDE og editorintegrasjon
- ✅ **Utvidet Overvåking**: AI-spesifikke mønstre for overvåking og varsling (Fullført)

#### Fremdeles Planlagt for Fremtidige Utgivelser
- **Mobilvennlig Dokumentasjon**: Responsivt design for mobil læring
- **Offline Tilgang**: Nedlastbare dokumentasjonspakker
- **Forbedret IDE-integrasjon**: VS Code-utvidelse for AZD + AI-arbeidsflyter
- **Fellesskapsdashboard**: Sanntids fellesskapsstatistikk og bidragssporing

## Bidra til Endringsloggen

### Rapportering av Endringer
Når du bidrar til dette arkivet, sørg for at endringsloggoppføringer inkluderer:

1. **Versjonsnummer**: Følger semantisk versjonering (major.minor.patch)
2. **Dato**: Utgivelses- eller oppdateringsdato i YYYY-MM-DD-format
3. **Kategori**: Lagt til, Endret, Utfaset, Fjernet, Fikset, Sikkerhet
4. **Klar Beskrivelse**: Kort beskrivelse av hva som er endret
5. **Vurdering av Innvirkning**: Hvordan endringene påvirker eksisterende brukere

### Endringskategorier

#### Lagt til
- Nye funksjoner, dokumentasjonsseksjoner eller kapabiliteter
- Nye eksempler, maler eller læringsressurser
- Ekstra verktøy, skript eller hjelpemidler

#### Endret
- Modifikasjoner av eksisterende funksjonalitet eller dokumentasjon
- Oppdateringer for å forbedre klarhet eller nøyaktighet
- Omstrukturering av innhold eller organisering

#### Utfaset
- Funksjoner eller tilnærminger som fases ut
- Dokumentasjonsseksjoner som er planlagt fjernet
- Metoder som har bedre alternativer

#### Fjernet
- Funksjoner, dokumentasjon eller eksempler som ikke lenger er relevante
- Utdatert informasjon eller utfasete tilnærminger
- Overflødig eller konsolidert innhold

#### Fikset
- Rettelser av feil i dokumentasjon eller kode
- Løsning av rapporterte problemer eller utfordringer
- Forbedringer av nøyaktighet eller funksjonalitet

#### Sikkerhet
- Sikkerhetsrelaterte forbedringer eller rettelser
- Oppdateringer til beste praksis for sikkerhet
- Løsning av sikkerhetsproblemer

### Retningslinjer for Semantisk Versjonering

#### Hovedversjon (X.0.0)
- Endringer som krever brukerhandling
- Betydelig omstrukturering av innhold eller organisering
- Endringer som påvirker den grunnleggende tilnærmingen eller metodikken

#### Mindre Versjon (X.Y.0)
- Nye funksjoner eller innholdsutvidelser
- Forbedringer som opprettholder bakoverkompatibilitet
- Ekstra eksempler, verktøy eller ressurser

#### Patch Versjon (X.Y.Z)
- Feilrettinger og korrigeringer
- Mindre forbedringer av eksisterende innhold
- Presiseringer og små utvidelser

## Fellesskapets Tilbakemeldinger og Forslag

Vi oppmuntrer aktivt til tilbakemeldinger fra fellesskapet for å forbedre dette læringsressursen:

### Hvordan Gi Tilbakemelding
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-spesifikke problemer velkomne)
- **Discord Diskusjoner**: Del ideer og engasjer deg med Azure AI Foundry-fellesskapet
- **Pull Requests**: Bidra med direkte forbedringer til innhold, spesielt AI-maler og veiledninger
- **Azure AI Foundry Discord**: Delta i #Azure-kanalen for AZD + AI-diskusjoner
- **Fellesskapsforum**: Delta i bredere diskusjoner blant Azure-utviklere

### Kategorier for Tilbakemelding
- **AI Innholds Nøyaktighet**: Rettelser til informasjon om AI-tjenesteintegrasjon og utrulling
- **Læringsopplevelse**: Forslag for forbedret AI-utviklerlæringsflyt
- **Manglende AI Innhold**: Forespørsler om ekstra AI-maler, mønstre eller eksempler
- **Tilgjengelighet**: Forbedringer for ulike læringsbehov
- **AI Verktøyintegrasjon**: Forslag for bedre AI-utviklingsarbeidsflytintegrasjon
- **Produksjons-AI Mønstre**: Forespørsler om mønstre for bedrifts-AI utrulling

### Forpliktelse til Respons
- **Respons på Problemer**: Innen 48 timer for rapporterte problemer
- **Funksjonsforespørsler**: Evaluering innen én uke
- **Fellesskapsbidrag**: Gjennomgang innen én uke
- **Sikkerhetsproblemer**: Umiddelbar prioritet med rask respons

## Vedlikeholdsplan

### Regelmessige Oppdateringer
- **Månedlige Gjennomganger**: Nøyaktighet av innhold og validering av lenker
- **Kvartalsvise Oppdateringer**: Større innholdsutvidelser og forbedringer
- **Halvårlige Gjennomganger**: Omfattende omstrukturering og forbedring
- **Årlige Utgivelser**: Hovedversjonsoppdateringer med betydelige forbedringer

### Overvåking og Kvalitetssikring
- **Automatisk Testing**: Regelmessig validering av kodeeksempler og lenker
- **Integrering av Fellesskapets Tilbakemeldinger**: Regelmessig innarbeiding av brukerforslag
- **Teknologiske Oppdateringer**: Justering med de nyeste Azure-tjenestene og AZD-utgivelser
- **Tilgjengelighetsrevisjoner**: Regelmessig gjennomgang for inkluderende designprinsipper

## Versjonsstøttepolitikk

### Støtte for Nåværende Versjon
- **Siste Hovedversjon**: Full støtte med regelmessige oppdateringer
- **Forrige Hovedversjon**: Sikkerhetsoppdateringer og kritiske rettelser i 12 måneder
- **Eldre Versjoner**: Kun fellesskapsstøtte, ingen offisielle oppdateringer

### Veiledning for Migrering
Når hovedversjoner utgis, tilbyr vi:
- **Migreringsveiledninger**: Trinn-for-trinn instruksjoner for overgang
- **Kompatibilitetsnotater**: Detaljer om endringer som bryter kompatibilitet
- **Verktøystøtte**: Skript eller hjelpemidler for å bistå med migrering
- **Fellesskapsstøtte**: Dedikerte forum for migreringsspørsmål

---

**Navigasjon**
- **Forrige Leksjon**: [Studieveiledning](resources/study-guide.md)
- **Neste Leksjon**: Gå tilbake til [Hoved README](README.md)

**Hold deg Oppdatert**: Følg dette arkivet for varsler om nye utgivelser og viktige oppdateringer til læringsmaterialet.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->