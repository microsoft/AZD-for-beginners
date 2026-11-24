# Eksempler — Engelsk kilde og Azure-eksempler

Dette er læringseksempler, ikke produksjonssertifiserte applikasjoner. Les hver
eksempels forutsetninger, begrensninger, kostnader og oppryddingsinstruksjoner før
du kjører kommandoer. Tilgjengelighet og kvoter i Azure må sjekkes i ditt abonnement.

- [Kursforside](../README.md)
- [Installering](../docs/chapter-01-foundation/installation.md)
- [Feilsøking](../docs/chapter-07-troubleshooting/common-issues.md)

## Hva som faktisk finnes lokalt

Det finnes **fire applikasjonsprøver** og **ett infrastrukturskjelett**:

| Eksempel | Lokal implementering | Læringsfokus | Nivå |
|---|---|---|---|
| [Enkel Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Containerdistribusjon, prøver, logger | Nybegynner |
| [To-tjenesters mikrotjenester](../../../examples/container-app/microservices) | Node.js gateway og skrivebeskyttet Python produkttjeneste, Dockerfiles, Bicep, `azure.yaml` | Intern HTTPS-kommunikasjon, uavhengig skalering | Mellomnivå |
| [Databaseapp](../../../examples/database-app) | Flask lese-API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL-tilkobling, initialisering, logger | Mellomnivå |
| [Azure OpenAI-chat](../../../examples/azure-openai-chat) | Lokal Python CLI, Azure OpenAI og Key Vault Bicep, kun infrastruktur `azure.yaml` | Modellprovisjonering, chatthistorikk, tokenestimater | Mellomnivå |
| [Detaljhandelinfrastruktur](../../../examples/retail-multiagent-arm-template) | ARM-mal, parametere, Bash distribusjonsskript; **kun hello-world-containere** | Infrastruktur for en fremtidig multi-agent-applikasjon | Avansert |

Det [forhandlerscenarioet](retail-scenario.md) er et **arkitekturblåkopi**, ikke en
fullstendig implementering for flere agenter. Ingen detaljhandelsagentkode, chat-grensesnitt, ruter
API, søkedatapipeline, evaluerings-CLI, automatisk failover, eller produksjons
hardening er inkludert. Disse må designes, bygges og testes separat.

Oversikten over [mikrotjenester](microservices/README.md) peker til det kjørbare
to-tjenesteeksemplet; det er ikke en annen distribusjonskatalog.

## Anbefalt læringsvei

1. Distribuer Flask-API-et og bekreft `/health` og CRUD-operasjoner.
2. Distribuer databaseappen og bekreft de fem forhåndsdefinerte produktene.
3. Distribuer eksemplet med to tjenester og bekreft forespørsler fra gateway til produkt.
4. Klargjør chat-ressursene og kjør den interaktive CLI **lokalt**.
5. Studer detaljhandelsmalen etter å ha fullført fungerende eksempler.

Sett av omtrent 30–60 minutter per applikasjonsprøve inkludert forutsetninger og
verifisering. Retail-implementering er et eget utviklingsprosjekt, ikke en
30-minutters workshop. Å lese arkitekturen tar omtrent 2–3 timer; implementering
og produksjonsklarhet kan ta betydelig lengre tid enn de illustrative
80–120 utviklingstimene i guiden.

## Rask start

Fra repository-roten, for det første container-eksempelet:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Forventet: HTTP 200 og JSON som inneholder `"status": "healthy"`.
Du trenger Docker kjørende for lokal containerbygging.

For chat, følg [chat README](azure-openai-chat/README.md): bruk
`azd provision`, last API-nøkkelen fra Key Vault inn i den nåværende shell, installer
`src/requirements.txt`, og kjør `python src/chat.py`. Det finnes ingen hostet chat-tjeneste.

For detaljhandel, bruk [ARM-guiden](retail-multiagent-arm-template/README.md).
Den har ingen `azure.yaml` og blir **ikke** distribuert eller fjernet av `azd up`/`azd down`.

## Kostnader og begrensninger

- Alle distribusjoner oppretter fakturerbare Azure-ressurser. Skaler-til-null gjelder kun for
  app-beregning; det eliminerer ikke kostnader for register, database, lagring, søk eller logger.
- Eksakte priser avhenger av region, valuta, trafikk, modell/SKU og beholdning.
  Bruk [Azure prismåler](https://azure.microsoft.com/pricing/calculator/)
  før distribusjon og sett opp et budsjett i Azure Cost Management.
- Flask CRUD-data ligger i minnet, begrenset til én worker og maksimalt én replika som
  standard. Det forsvinner ved omstart eller skaler-til-null. Dette er ikke varig lagring.
- Produkt-mikrotjenesten eksponerer kun GET-endepunkter. Ingen ordre-, bruker-
  tjeneste, database, Service Bus, C# eller Go-implementasjon er inkludert.
- Application Insights-ressurser instrumenterer ikke automatisk alle applikasjoner.
  Se hvert eksempel for faktisk sendt telemetri.
- Eksemplene implementerer ikke applikasjonsautentisering. Legg til identitet, autorisasjon,
  varig lagring, nettverkskontroller, tester og operative rutiner før produksjon.

## Eksterne Azure-eksempler — klon separat

Disse lenkene peker til separate repositorier, **ikke lokale eksempler**.
Vedlikeholdere av dem har ansvar for oppsettsinstruksjoner, implementasjon, avhengigheter og kostnader.

| Eksempel | Fokus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js-applikasjon med database |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# og Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statisk frontend med C#-funksjoner og SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python serverløs applikasjon |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Containerisert butikk-backend |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI chatte-applikasjon |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent-applikasjon |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG med søk og sitater |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Samtalebasert AI-eksempel |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java mikrotjenester |

Oppdag flere prosjekter i [AZD malgalleri](https://azure.github.io/awesome-azd/).
Ikke anta at et eksternt prosjekt støtter `azd` uten å sjekke dets nåværende README.

## Repositorie-struktur

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Det er ingen delt `configurations/`, `scripts/` eller testkatalog lovet av
denne indeksen. Faktiske filer og valgfrie utvidelsesideer identifiseres i hver guide.

## Opprydding

For de fire AZD-eksemplene, kjør dette **fra den valgte eksempel-katalogen**:

```bash
azd down
```

Gå gjennom slettespørringen. For detaljhandel, slett kun den dedikerte ressursgruppen
du opprettet, ved å bruke instruksjonene i dens ARM-guide. Sjekk Azure Cost Management
etter opprydding; fakturadata kan komme senere.

## Bidra

Inkluder kildekode, infrastruktur, distribusjonskonfigurasjon, handlingsrettede oppsett- og
verifiseringstrinn, begrensninger og oppryddingsinstruksjoner med hvert applikasjonseksempel.
Merk arkitekturmateriale og ufullstendige utdrag eksplisitt.
Ikke hev produksjonsklarhet uten distribusjons-, funksjons- og driftsmessige tester.

[FAQ](../resources/faq.md) · [Studieveiledning](../resources/study-guide.md) ·
[Rapporter et problem](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->