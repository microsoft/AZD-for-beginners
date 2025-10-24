<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T17:30:34+00:00",
  "source_file": "changelog.md",
  "language_code": "no"
}
-->
# Endringslogg - AZD For Nybegynnere

## Introduksjon

Denne endringsloggen dokumenterer alle merkbare endringer, oppdateringer og forbedringer i AZD For Nybegynnere-repositoriet. Vi følger prinsippene for semantisk versjonering og opprettholder denne loggen for å hjelpe brukere med å forstå hva som har endret seg mellom versjonene.

## Læringsmål

Ved å gjennomgå denne endringsloggen vil du:
- Holde deg oppdatert på nye funksjoner og innholdstillegg
- Forstå forbedringer gjort i eksisterende dokumentasjon
- Følge feilrettinger og korrigeringer for å sikre nøyaktighet
- Følge utviklingen av læringsmaterialene over tid

## Læringsutbytte

Etter å ha gjennomgått endringsloggoppføringene vil du kunne:
- Identifisere nytt innhold og ressurser tilgjengelig for læring
- Forstå hvilke seksjoner som har blitt oppdatert eller forbedret
- Planlegge din læringsvei basert på de nyeste materialene
- Gi tilbakemeldinger og forslag til fremtidige forbedringer

## Versjonshistorikk

### [v3.4.0] - 2025-10-24

#### Forhåndsvisning av infrastruktur og valideringsforbedringer
**Denne versjonen introduserer omfattende støtte for den nye forhåndsvisningsfunksjonen i Azure Developer CLI og forbedrer workshop-brukeropplevelsen.**

#### Lagt til
- **🧪 azd provision --preview Funksjonsdokumentasjon**: Omfattende dekning av den nye forhåndsvisningsfunksjonen for infrastruktur
  - Kommando-referanse og brukseksempler i jukselapp
  - Detaljert integrasjon i veiledning for klargjøring med brukstilfeller og fordeler
  - Integrasjon av forhåndssjekk for tryggere distribusjonsvalidering
  - Oppdateringer i kom-i-gang-veiledningen med fokus på sikker distribusjonspraksis
- **🚧 Workshop Statusbanner**: Profesjonelt HTML-banner som indikerer workshopens utviklingsstatus
  - Gradientdesign med konstruksjonsindikatorer for tydelig kommunikasjon til brukere
  - Sist oppdatert tidsstempel for åpenhet
  - Mobilvennlig design for alle enhetstyper

#### Forbedret
- **Infrastruktursikkerhet**: Forhåndsvisningsfunksjonalitet integrert i hele distribusjonsdokumentasjonen
- **Validering før distribusjon**: Automatiserte skript inkluderer nå testing av infrastrukturforhåndsvisning
- **Utviklerarbeidsflyt**: Oppdaterte kommandosekvenser for å inkludere forhåndsvisning som beste praksis
- **Workshop-opplevelse**: Klare forventninger satt for brukere om innholdsutviklingsstatus

#### Endret
- **Beste praksis for distribusjon**: Forhåndsvisning-først arbeidsflyt anbefales nå som tilnærming
- **Dokumentasjonsflyt**: Infrastrukturvalidering flyttet tidligere i læringsprosessen
- **Workshop-presentasjon**: Profesjonell statuskommunikasjon med tydelig utviklingstidslinje

#### Forbedret
- **Sikkerhet-først tilnærming**: Infrastrukturendringer kan nå valideres før distribusjon
- **Teamarbeid**: Forhåndsvisningsresultater kan deles for gjennomgang og godkjenning
- **Kostnadsbevissthet**: Bedre forståelse av ressurskostnader før klargjøring
- **Risikoreduksjon**: Reduserte distribusjonsfeil gjennom forhåndsvalidering

#### Teknisk implementering
- **Multi-dokument integrasjon**: Forhåndsvisningsfunksjonen dokumentert på tvers av 4 nøkkelfiler
- **Kommandomønstre**: Konsistent syntaks og eksempler i hele dokumentasjonen
- **Beste praksis integrasjon**: Forhåndsvisning inkludert i valideringsarbeidsflyter og skript
- **Visuelle indikatorer**: Tydelige NYE funksjonsmarkeringer for oppdagbarhet

#### Workshop-infrastruktur
- **Statuskommunikasjon**: Profesjonelt HTML-banner med gradientstil
- **Brukeropplevelse**: Klar utviklingsstatus forhindrer forvirring
- **Profesjonell presentasjon**: Opprettholder repositoriets troverdighet samtidig som forventninger settes
- **Tidslinjeåpenhet**: Oktober 2025 sist oppdatert tidsstempel for ansvarlighet

### [v3.3.0] - 2025-09-24

#### Forbedrede workshop-materialer og interaktiv læringsopplevelse
**Denne versjonen introduserer omfattende workshop-materialer med nettleserbaserte interaktive guider og strukturerte læringsveier.**

#### Lagt til
- **🎥 Interaktiv workshop-guide**: Nettleserbasert workshop-opplevelse med MkDocs forhåndsvisningsfunksjon
- **📝 Strukturerte workshop-instruksjoner**: 7-trinns veiledet læringsvei fra oppdagelse til tilpasning
  - 0-Introduksjon: Workshop-oversikt og oppsett
  - 1-Velg-AI-Mal: Prosess for oppdagelse og valg av mal
  - 2-Valider-AI-Mal: Prosedyre for distribusjon og validering
  - 3-Dekonstruer-AI-Mal: Forståelse av malarkitektur
  - 4-Konfigurer-AI-Mal: Konfigurasjon og tilpasning
  - 5-Tilpass-AI-Mal: Avanserte modifikasjoner og iterasjoner
  - 6-Fjern-Infrastruktur: Opprydding og ressursstyring
  - 7-Oppsummering: Oppsummering og neste steg
- **🛠️ Workshop-verktøy**: MkDocs-konfigurasjon med Material-tema for forbedret læringsopplevelse
- **🎯 Praktisk læringsvei**: 3-trinns metodikk (Oppdagelse → Distribusjon → Tilpasning)
- **📱 GitHub Codespaces-integrasjon**: Sømløst oppsett av utviklingsmiljø

#### Forbedret
- **AI Workshop Lab**: Utvidet med omfattende 2-3 timers strukturert læringsopplevelse
- **Workshop-dokumentasjon**: Profesjonell presentasjon med navigasjon og visuelle hjelpemidler
- **Læringsprogresjon**: Klar steg-for-steg veiledning fra malvalg til produksjonsdistribusjon
- **Utvikleropplevelse**: Integrerte verktøy for strømlinjeformede utviklingsarbeidsflyter

#### Forbedret
- **Tilgjengelighet**: Nettleserbasert grensesnitt med søk, kopieringsfunksjonalitet og tema-veksling
- **Selvstyrt læring**: Fleksibel workshop-struktur som tilpasser seg ulike læringshastigheter
- **Praktisk anvendelse**: Virkelige scenarier for distribusjon av AI-maler
- **Integrering i fellesskapet**: Discord-integrasjon for workshop-støtte og samarbeid

#### Workshop-funksjoner
- **Innebygd søk**: Rask søke- og leksjonsoppdagelse
- **Kopier kodeblokker**: Hover-for-å-kopiere funksjonalitet for alle kodeeksempler
- **Tema-veksling**: Støtte for mørk/lys modus for ulike preferanser
- **Visuelle ressurser**: Skjermbilder og diagrammer for bedre forståelse
- **Hjelpeintegrasjon**: Direkte tilgang til Discord for fellesskapsstøtte

### [v3.2.0] - 2025-09-17

#### Større navigasjonsomstrukturering og kapittelbasert læringssystem
**Denne versjonen introduserer en omfattende kapittelbasert læringsstruktur med forbedret navigasjon gjennom hele repositoriet.**

#### Lagt til
- **📚 Kapittelbasert læringssystem**: Omstrukturert hele kurset i 8 progressive læringskapitler
  - Kapittel 1: Grunnlag & Kom-i-gang (⭐ - 30-45 min)
  - Kapittel 2: AI-Først Utvikling (⭐⭐ - 1-2 timer)
  - Kapittel 3: Konfigurasjon & Autentisering (⭐⭐ - 45-60 min)
  - Kapittel 4: Infrastruktur som kode & Distribusjon (⭐⭐⭐ - 1-1,5 timer)
  - Kapittel 5: Multi-Agent AI-løsninger (⭐⭐⭐⭐ - 2-3 timer)
  - Kapittel 6: Validering før distribusjon & Planlegging (⭐⭐ - 1 time)
  - Kapittel 7: Feilsøking & Debugging (⭐⭐ - 1-1,5 timer)
  - Kapittel 8: Produksjon & Enterprise-mønstre (⭐⭐⭐⭐ - 2-3 timer)
- **📚 Omfattende navigasjonssystem**: Konsistente navigasjonsoverskrifter og -fotnoter på tvers av all dokumentasjon
- **🎯 Fremdriftssporing**: Kursfullføringssjekkliste og læringsverifiseringssystem
- **🗺️ Veiledning for læringsvei**: Klare inngangspunkter for ulike erfaringsnivåer og mål
- **🔗 Kryssreferanse-navigasjon**: Relaterte kapitler og forutsetninger tydelig lenket

#### Forbedret
- **README-struktur**: Transformert til en strukturert læringsplattform med kapittelbasert organisering
- **Dokumentasjonsnavigasjon**: Hver side inkluderer nå kapittelkontekst og progresjonsveiledning
- **Malorganisering**: Eksempler og maler kartlagt til passende læringskapitler
- **Ressursintegrasjon**: Jukselapper, FAQ-er og studieveiledninger koblet til relevante kapitler
- **Workshop-integrasjon**: Praktiske laboratorier kartlagt til flere kapittel-læringsmål

#### Endret
- **Læringsprogresjon**: Flyttet fra lineær dokumentasjon til fleksibel kapittelbasert læring
- **Plassering av konfigurasjon**: Omplassert konfigurasjonsveiledning som Kapittel 3 for bedre læringsflyt
- **AI-innholdsintegrasjon**: Bedre integrering av AI-spesifikt innhold gjennom hele læringsreisen
- **Produksjonsinnhold**: Avanserte mønstre konsolidert i Kapittel 8 for enterprise-lærere

#### Forbedret
- **Brukeropplevelse**: Klare navigasjonsbrødsmuler og kapittelprogresjonsindikatorer
- **Tilgjengelighet**: Konsistente navigasjonsmønstre for enklere kursgjennomgang
- **Profesjonell presentasjon**: Universitetsstil kursstruktur egnet for akademisk og bedriftsopplæring
- **Læringseffektivitet**: Redusert tid for å finne relevant innhold gjennom forbedret organisering

#### Teknisk implementering
- **Navigasjonsoverskrifter**: Standardiserte kapittelnavigasjoner på tvers av 40+ dokumentasjonsfiler
- **Fotnavigasjon**: Konsistent progresjonsveiledning og kapittelfullføringsindikatorer
- **Krysskobling**: Omfattende internt lenkesystem som kobler relaterte konsepter
- **Kapittelkartlegging**: Maler og eksempler tydelig assosiert med læringsmål

#### Forbedring av studieveiledning
- **📚 Omfattende læringsmål**: Omstrukturert studieveiledning for å tilpasse seg 8-kapittelsystemet
- **🎯 Kapittelbasert vurdering**: Hvert kapittel inkluderer spesifikke læringsmål og praktiske øvelser
- **📋 Fremdriftssporing**: Ukentlig læringsplan med målbare resultater og fullføringssjekklister
- **❓ Vurderingsspørsmål**: Kunnskapsvalideringsspørsmål for hvert kapittel med profesjonelle utfall
- **🛠️ Praktiske øvelser**: Praktiske aktiviteter med virkelige distribusjonsscenarier og feilsøking
- **📊 Ferdighetsutvikling**: Klar fremgang fra grunnleggende konsepter til enterprise-mønstre med fokus på karriereutvikling
- **🎓 Sertifiseringsrammeverk**: Profesjonelle utviklingsresultater og fellesskapsanerkjennelsessystem
- **⏱️ Tidslinjestyring**: Strukturert 10-ukers læringsplan med milepælsvalidering

### [v3.1.0] - 2025-09-17

#### Forbedrede multi-agent AI-løsninger
**Denne versjonen forbedrer den fleragentbaserte detaljhandelsløsningen med bedre agentnavngivning og forbedret dokumentasjon.**

#### Endret
- **Multi-agent terminologi**: Erstattet "Cora agent" med "Kundeagent" i hele detaljhandelsløsningen for fleragenter for bedre forståelse
- **Agentarkitektur**: Oppdatert all dokumentasjon, ARM-maler og kodeeksempler til å bruke konsistent "Kundeagent"-navngivning
- **Konfigurasjonseksempler**: Moderniserte agentkonfigurasjonsmønstre med oppdaterte navnekonvensjoner
- **Dokumentasjonskonsistens**: Sikret at alle referanser bruker profesjonelle, beskrivende agentnavn

#### Forbedret
- **ARM-malpakke**: Oppdatert detaljhandel-multiagent-arm-mal med Kundeagent-referanser
- **Arkitekturdiagrammer**: Oppdatert Mermaid-diagrammer med oppdatert agentnavngivning
- **Kodeeksempler**: Python-klasser og implementeringseksempler bruker nå KundeAgent-navngivning
- **Miljøvariabler**: Oppdatert alle distribusjonsskript til å bruke CUSTOMER_AGENT_NAME-konvensjoner

#### Forbedret
- **Utvikleropplevelse**: Klarere agentroller og ansvar i dokumentasjonen
- **Produksjonsklarhet**: Bedre tilpasning til enterprise-navngivningskonvensjoner
- **Læringsmaterialer**: Mer intuitiv agentnavngivning for pedagogiske formål
- **Malbrukervennlighet**: Forenklet forståelse av agentfunksjoner og distribusjonsmønstre

#### Teknisk detaljer
- Oppdatert Mermaid-arkitekturdiagrammer med KundeAgent-referanser
- Erstattet CoraAgent-klassenavn med KundeAgent i Python-eksempler
- Endret ARM-mal JSON-konfigurasjoner til å bruke "kunde"-agenttype
- Oppdatert miljøvariabler fra CORA_AGENT_* til CUSTOMER_AGENT_* mønstre
- Oppdatert alle distribusjonskommandoer og containerkonfigurasjoner

### [v3.0.0] - 2025-09-12

#### Store endringer - Fokus på AI-utvikling og integrering av Azure AI Foundry
**Denne versjonen transformerer repositoriet til en omfattende AI-fokusert læringsressurs med integrering av Azure AI Foundry.**

#### Lagt til
- **🤖 AI-Først Læringsvei**: Fullstendig omstrukturering med prioritering av AI-utviklere og ingeniører
- **Azure AI Foundry Integreringsveiledning**: Omfattende dokumentasjon for tilkobling av AZD med Azure AI Foundry-tjenester
- **Distribusjonsmønstre for AI-modeller**: Detaljert veiledning som dekker modellvalg, konfigurasjon og produksjonsdistribusjonsstrategier
- **AI Workshop Lab**: 2-3 timers praktisk workshop for konvertering av AI-applikasjoner til AZD-distribuerbare løsninger
- **Beste praksis for produksjons-AI**: Enterprise-klare mønstre for skalering, overvåking og sikring av AI-arbeidsbelastninger
- **AI-spesifikk feilsøkingsveiledning**: Omfattende feilsøking for Azure OpenAI, Cognitive Services og AI-distribusjonsproblemer
- **AI-mal-galleri**: Utvalgt samling av Azure AI Foundry-maler med kompleksitetsvurderinger
- **Workshop-materialer**: Komplett workshop-struktur med praktiske laboratorier og referansematerialer

#### Forbedret
- **README-struktur**: AI-utviklerfokusert med 45% samfunnsinteresse-data fra Azure AI Foundry Discord
- **Læringsveier**: Dedikert AI-utviklerreise sammen med tradisjonelle veier for studenter og DevOps-ingeniører
- **Malanbefalinger**: Utvalgte AI-maler inkludert azure-search-openai-demo, contoso-chat og openai-chat-app-quickstart
- **Samfunnsintegrasjon**: Forbedret Discord-fellesskapsstøtte med AI-spesifikke kanaler og diskusjoner

#### Sikkerhet & Produksjonsfokus
- **Mønstre for administrert identitet**: AI-spesifikke autentiserings- og sikkerhetskonfigurasjoner
- **Kostnadsoptimalisering**: Sporing av tokenbruk og budsjettkontroller for AI-arbeidsbelastninger
- **Distribusjon i flere regioner**: Strategier for global distribusjon av AI-applikasjoner
- **Ytelsesovervåking**: AI-spesifikke metrikker og integrering av Application Insights

#### Dokumentasjonskvalitet
- **Lineær kursstruktur**:
- **Dokumentasjonsformat**: Standardiserte all dokumentasjon med en konsistent læringsfokusert struktur
- **Navigasjonsflyt**: Implementerte logisk progresjon gjennom alt læringsmateriale
- **Innholdspresentasjon**: Fjernet dekorative elementer til fordel for klar, profesjonell formatering
- **Lenkestruktur**: Oppdaterte alle interne lenker for å støtte det nye navigasjonssystemet

#### Forbedret
- **Tilgjengelighet**: Fjernet avhengighet av emojier for bedre kompatibilitet med skjermlesere
- **Profesjonelt utseende**: Ren, akademisk stil som passer for bedriftslæring
- **Læringsopplevelse**: Strukturert tilnærming med klare mål og resultater for hver leksjon
- **Innholdsorganisering**: Bedre logisk flyt og sammenheng mellom relaterte temaer

### [v1.0.0] - 2025-09-09

#### Første utgivelse - Omfattende AZD læringsarkiv

#### Lagt til
- **Kjerne-dokumentasjonsstruktur**
  - Komplett serie med introduksjonsguider
  - Omfattende dokumentasjon for utrulling og klargjøring
  - Detaljerte ressurser for feilsøking og debugging-guider
  - Verktøy og prosedyrer for validering før utrulling

- **Introduksjonsmodul**
  - AZD Grunnleggende: Kjernebegreper og terminologi
  - Installasjonsguide: Plattformspesifikke oppsettinstruksjoner
  - Konfigurasjonsguide: Miljøoppsett og autentisering
  - Første prosjektveiledning: Trinn-for-trinn praktisk læring

- **Utrulling og klargjøringsmodul**
  - Utrullingsguide: Komplett arbeidsflytdokumentasjon
  - Klargjøringsguide: Infrastruktur som kode med Bicep
  - Beste praksis for produksjonsutrullinger
  - Mønstre for arkitektur med flere tjenester

- **Valideringsmodul før utrulling**
  - Kapasitetsplanlegging: Validering av tilgjengelighet for Azure-ressurser
  - Valg av SKU: Omfattende veiledning for tjenestenivåer
  - Kontroll før utrulling: Automatiserte valideringsskript (PowerShell og Bash)
  - Verktøy for kostnadsestimering og budsjettplanlegging

- **Feilsøkingsmodul**
  - Vanlige problemer: Ofte møtte utfordringer og løsninger
  - Feilsøkingsguide: Systematiske metoder for feilsøking
  - Avanserte diagnostiske teknikker og verktøy
  - Overvåking og optimalisering av ytelse

- **Ressurser og referanser**
  - Kommando-hurtigreferanse: Rask tilgang til essensielle kommandoer
  - Ordliste: Omfattende definisjoner av terminologi og akronymer
  - FAQ: Detaljerte svar på vanlige spørsmål
  - Eksterne ressurslenker og fellesskapsforbindelser

- **Eksempler og maler**
  - Eksempel på enkel webapplikasjon
  - Mal for utrulling av statisk nettside
  - Konfigurasjon av containerapplikasjon
  - Mønstre for databaseintegrasjon
  - Eksempler på mikrotjenestearkitektur
  - Implementeringer av serverløse funksjoner

#### Funksjoner
- **Støtte for flere plattformer**: Installasjons- og konfigurasjonsguider for Windows, macOS og Linux
- **Flere ferdighetsnivåer**: Innhold designet for studenter og profesjonelle utviklere
- **Praktisk fokus**: Praktiske eksempler og virkelige scenarioer
- **Omfattende dekning**: Fra grunnleggende konsepter til avanserte bedriftsmønstre
- **Sikkerhetsfokusert tilnærming**: Beste praksis for sikkerhet integrert gjennom hele materialet
- **Kostnadsoptimalisering**: Veiledning for kostnadseffektive utrullinger og ressursstyring

#### Dokumentasjonskvalitet
- **Detaljerte kodeeksempler**: Praktiske, testede kodeeksempler
- **Trinn-for-trinn instruksjoner**: Klar, handlingsrettet veiledning
- **Omfattende feilhåndtering**: Feilsøking for vanlige problemer
- **Integrering av beste praksis**: Bransjestandarder og anbefalinger
- **Versjonskompatibilitet**: Oppdatert med de nyeste Azure-tjenestene og AZD-funksjonene

## Planlagte fremtidige forbedringer

### Versjon 3.1.0 (Planlagt)
#### Utvidelse av AI-plattform
- **Støtte for flere modeller**: Integrasjonsmønstre for Hugging Face, Azure Machine Learning og egendefinerte modeller
- **AI-agentrammeverk**: Maler for LangChain, Semantic Kernel og AutoGen-utrullinger
- **Avanserte RAG-mønstre**: Alternativer for vektordatabaser utover Azure AI Search (Pinecone, Weaviate, etc.)
- **AI-overvåking**: Forbedret overvåking av modellytelse, tokenbruk og responskvalitet

#### Utvikleropplevelse
- **VS Code-utvidelse**: Integrert AZD + AI Foundry utviklingsopplevelse
- **GitHub Copilot-integrasjon**: AI-assistert generering av AZD-maler
- **Interaktive opplæringer**: Praktiske kodeøvelser med automatisert validering for AI-scenarier
- **Videoinnhold**: Supplerende videotutorials for visuelle elever med fokus på AI-utrullinger

### Versjon 4.0.0 (Planlagt)
#### Bedriftsmønstre for AI
- **Styringsrammeverk**: Styring av AI-modeller, samsvar og revisjonsspor
- **AI for flere leietakere**: Mønstre for å betjene flere kunder med isolerte AI-tjenester
- **Edge AI-utrulling**: Integrasjon med Azure IoT Edge og containerinstanser
- **Hybrid sky-AI**: Mønstre for utrulling av AI-arbeidsbelastninger i flere skyer og hybridmiljøer

#### Avanserte funksjoner
- **Automatisering av AI-pipeline**: MLOps-integrasjon med Azure Machine Learning-pipelines
- **Avansert sikkerhet**: Nulltillitsmønstre, private endepunkter og avansert trusselbeskyttelse
- **Ytelsesoptimalisering**: Avanserte innstillings- og skaleringsstrategier for AI-applikasjoner med høy gjennomstrømning
- **Global distribusjon**: Mønstre for innholdslevering og caching ved kanten for AI-applikasjoner

### Versjon 3.0.0 (Planlagt) - Erstattet av nåværende utgivelse
#### Foreslåtte tillegg - Nå implementert i v3.0.0
- ✅ **AI-fokusert innhold**: Omfattende integrasjon med Azure AI Foundry (Fullført)
- ✅ **Interaktive opplæringer**: Praktisk AI-verksted (Fullført)
- ✅ **Avansert sikkerhetsmodul**: AI-spesifikke sikkerhetsmønstre (Fullført)
- ✅ **Ytelsesoptimalisering**: Optimaliseringsstrategier for AI-arbeidsbelastninger (Fullført)

### Versjon 2.1.0 (Planlagt) - Delvis implementert i v3.0.0
#### Mindre forbedringer - Noen fullført i nåværende utgivelse
- ✅ **Flere eksempler**: AI-fokuserte utrullingsscenarier (Fullført)
- ✅ **Utvidet FAQ**: AI-spesifikke spørsmål og feilsøking (Fullført)
- **Verktøyintegrasjon**: Forbedrede guider for integrasjon med IDE og redigeringsverktøy
- ✅ **Utvidet overvåking**: AI-spesifikke mønstre for overvåking og varsling (Fullført)

#### Fortsatt planlagt for fremtidige utgivelser
- **Mobilvennlig dokumentasjon**: Responsivt design for mobil læring
- **Offline tilgang**: Nedlastbare dokumentasjonspakker
- **Forbedret IDE-integrasjon**: VS Code-utvidelse for AZD + AI-arbeidsflyter
- **Fellesskapsdashboard**: Sanntidsmetrikker og sporing av bidrag fra fellesskapet

## Bidra til endringsloggen

### Rapportering av endringer
Når du bidrar til dette arkivet, må endringsloggoppføringer inkludere:

1. **Versjonsnummer**: I henhold til semantisk versjonering (major.minor.patch)
2. **Dato**: Utgivelses- eller oppdateringsdato i formatet YYYY-MM-DD
3. **Kategori**: Lagt til, Endret, Utfaset, Fjernet, Fikset, Sikkerhet
4. **Klar beskrivelse**: Kortfattet beskrivelse av hva som er endret
5. **Vurdering av påvirkning**: Hvordan endringene påvirker eksisterende brukere

### Endringskategorier

#### Lagt til
- Nye funksjoner, dokumentasjonsseksjoner eller kapabiliteter
- Nye eksempler, maler eller læringsressurser
- Ekstra verktøy, skript eller hjelpemidler

#### Endret
- Endringer i eksisterende funksjonalitet eller dokumentasjon
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

### Retningslinjer for semantisk versjonering

#### Hovedversjon (X.0.0)
- Endringer som krever brukerhandling
- Betydelig omstrukturering av innhold eller organisering
- Endringer som påvirker den grunnleggende tilnærmingen eller metodikken

#### Mindre versjon (X.Y.0)
- Nye funksjoner eller innholdsutvidelser
- Forbedringer som opprettholder bakoverkompatibilitet
- Ekstra eksempler, verktøy eller ressurser

#### Patchversjon (X.Y.Z)
- Feilrettinger og korrigeringer
- Mindre forbedringer av eksisterende innhold
- Presiseringer og små forbedringer

## Fellesskapets tilbakemeldinger og forslag

Vi oppfordrer aktivt til tilbakemeldinger fra fellesskapet for å forbedre dette læringsressursen:

### Hvordan gi tilbakemelding
- **GitHub Issues**: Rapporter problemer eller foreslå forbedringer (AI-spesifikke problemer er velkomne)
- **Discord-diskusjoner**: Del ideer og engasjer deg med Azure AI Foundry-fellesskapet
- **Pull Requests**: Bidra med direkte forbedringer til innholdet, spesielt AI-maler og guider
- **Azure AI Foundry Discord**: Delta i #Azure-kanalen for AZD + AI-diskusjoner
- **Fellesskapsfora**: Delta i bredere diskusjoner blant Azure-utviklere

### Kategorier for tilbakemelding
- **Nøyaktighet i AI-innhold**: Rettelser til informasjon om integrasjon og utrulling av AI-tjenester
- **Læringsopplevelse**: Forslag til forbedret læringsflyt for AI-utviklere
- **Manglende AI-innhold**: Forespørsler om ekstra AI-maler, mønstre eller eksempler
- **Tilgjengelighet**: Forbedringer for ulike læringsbehov
- **Integrasjon av AI-verktøy**: Forslag til bedre arbeidsflytintegrasjon for AI-utvikling
- **Produksjonsmønstre for AI**: Forespørsler om bedriftsmønstre for AI-utrulling

### Forpliktelse til respons
- **Respons på problemer**: Innen 48 timer for rapporterte problemer
- **Funksjonsforespørsler**: Evaluering innen én uke
- **Fellesskapsbidrag**: Gjennomgang innen én uke
- **Sikkerhetsproblemer**: Umiddelbar prioritet med rask respons

## Vedlikeholdsplan

### Regelmessige oppdateringer
- **Månedlige gjennomganger**: Nøyaktighet i innhold og validering av lenker
- **Kvartalsvise oppdateringer**: Større innholdsutvidelser og forbedringer
- **Halvårlige gjennomganger**: Omfattende omstrukturering og forbedring
- **Årlige utgivelser**: Hovedversjonsoppdateringer med betydelige forbedringer

### Overvåking og kvalitetssikring
- **Automatisk testing**: Regelmessig validering av kodeeksempler og lenker
- **Integrering av fellesskapets tilbakemeldinger**: Regelmessig innarbeiding av brukerforslag
- **Teknologiske oppdateringer**: Justering med de nyeste Azure-tjenestene og AZD-utgivelser
- **Tilgjengelighetsrevisjoner**: Regelmessig gjennomgang for inkluderende designprinsipper

## Versjonsstøttepolicy

### Støtte for nåværende versjon
- **Siste hovedversjon**: Full støtte med regelmessige oppdateringer
- **Forrige hovedversjon**: Sikkerhetsoppdateringer og kritiske rettelser i 12 måneder
- **Eldre versjoner**: Kun fellesskapsstøtte, ingen offisielle oppdateringer

### Veiledning for migrering
Når hovedversjoner utgis, tilbyr vi:
- **Migreringsguider**: Trinn-for-trinn instruksjoner for overgang
- **Kompatibilitetsnotater**: Detaljer om endringer som bryter kompatibilitet
- **Verktøystøtte**: Skript eller hjelpemidler for å bistå med migrering
- **Fellesskapsstøtte**: Dedikerte fora for migreringsspørsmål

---

**Navigasjon**
- **Forrige leksjon**: [Studieguide](resources/study-guide.md)
- **Neste leksjon**: Gå tilbake til [Hoved README](README.md)

**Hold deg oppdatert**: Følg dette arkivet for varsler om nye utgivelser og viktige oppdateringer til læringsmaterialet.

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.