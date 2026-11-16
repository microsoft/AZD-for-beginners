# Voorbeelden — Engelse bron en Azure-voorbeelden

Dit zijn leervoorbeelden, geen productgecertificeerde toepassingen. Lees de
vereisten, beperkingen, kosten en opruiminstructies van elk voorbeeld voordat u
opdrachten uitvoert. Controleer de beschikbaarheid en quota van Azure in uw abonnement.

- [Cursus startpagina](../README.md)
- [Installatie](../docs/chapter-01-foundation/installation.md)
- [Probleemoplossing](../docs/chapter-07-troubleshooting/common-issues.md)

## Wat er lokaal daadwerkelijk bestaat

Er zijn **vier toepassingsvoorbeelden** en **één infrastructuurskelet**:

| Voorbeeld | Lokale implementatie | Leerfocus | Niveau |
|---|---|---|---|
| [Eenvoudige Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Container-implementatie, probes, logs | Beginner |
| [Microservices met twee services](../../../examples/container-app/microservices) | Node.js gateway en read-only Python productservice, Dockerfiles, Bicep, `azure.yaml` | Interne HTTPS-communicatie, onafhankelijk schalen | Gemiddeld |
| [Database-app](../../../examples/database-app) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL-connectiviteit, initialisatie, logs | Gemiddeld |
| [Azure OpenAI chat](../../../examples/azure-openai-chat) | Lokale Python CLI, Azure OpenAI en Key Vault Bicep, alleen infrastructuur `azure.yaml` | Modelvoorziening, chatgeschiedenis, tokenramingen | Gemiddeld |
| [Retail infrastructuur](../../../examples/retail-multiagent-arm-template) | ARM-template, parameters, Bash-implementatiescript; **alleen hello-world containers** | Infrastructuur voor een toekomstige multi-agent-applicatie | Gevorderd |

Het [retail scenario](retail-scenario.md) is een **architectuur blauwdruk**, geen
volledige multi-agent implementatie. Er is geen retail agent-code, chatfrontend, router
API, zoekgegevenspijplijn, evaluatie-CLI, automatische failover, of productie
versterking inbegrepen. Deze moeten afzonderlijk worden ontworpen, gebouwd en getest.

Het [microservices overzicht](microservices/README.md) verwijst naar het uitvoerbare
voorbeeld met twee services; het is geen andere implementatiemap.

## Aanbevolen leertraject

1. Implementeer de Flask API en verifieer `/health` en CRUD-bewerkingen.
2. Implementeer de database-app en controleer de vijf ingevoerde producten.
3. Implementeer het voorbeeld met twee services en controleer gateway-naar-product verzoeken.
4. Voorzie de chatmiddelen en voer de interactieve CLI **lokaal** uit.
5. Bestudeer de retail blauwdruk na voltooiing van werkende voorbeelden.

Reserveer ongeveer 30–60 minuten per toepassingsvoorbeeld inclusief vereisten en
verificatie. Implementatie van retail is een apart ontwikkelingsproject, geen
workshop van 30 minuten. Het lezen van de architectuur duurt ongeveer 2–3 uur; implementatie
en productieklaar maken kunnen aanzienlijk langer duren dan de illustratieve
80–120 ontwikkelingsuren in de gids.

## Snelstart

Vanaf de root van de repository, voor het eerste containersample:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Verwacht: HTTP 200 en JSON met `"status": "healthy"`.
U hebt Docker nodig die draait voor de lokale containerbouw.

Voor chat volgt u de [chat README](azure-openai-chat/README.md): gebruik
`azd provision`, laad de API-sleutel vanuit Key Vault in de huidige shell, installeer
`src/requirements.txt`, en voer `python src/chat.py` uit. Er is geen gehoste chatdienst.

Voor retail, gebruik de [ARM-gids](retail-multiagent-arm-template/README.md).
Deze heeft geen `azure.yaml` en wordt **niet** geïmplementeerd of verwijderd via `azd up`/`azd down`.

## Kosten en beperkingen

- Alle implementaties creëren factureerbare Azure-resources. Scale-to-zero geldt alleen voor
  app compute; het elimineert geen registratie-, database-, opslag-, zoek- of logkosten.
- Exacte prijzen hangen af van regio, valuta, verkeer, model/SKU en retentie.
  Gebruik de [Azure prijs calculator](https://azure.microsoft.com/pricing/calculator/)
  vóór implementatie en stel een budget in Azure Cost Management in.
- Flask CRUD-gegevens zijn in het geheugen, beperkt tot één worker en maximaal één replica volgens
  standaard. Ze verdwijnen bij herstart of scale-to-zero. Dit is geen duurzame opslag.
- De product-microservice biedt alleen GET endpoints. Geen order-service, gebruikers-
  service, database, Service Bus, C# of Go-implementatie is inbegrepen.
- Application Insights-resources instrumenteren niet automatisch elke applicatie.
  Raadpleeg elk voorbeeld voor de werkelijk uitgezonden telemetrie.
- Voorbeelden implementeren geen applicatie-authenticatie. Voeg identiteit, autorisatie,
  persistente opslag, netwerkcontroles, tests en operationele procedures toe vóór productie.

## Externe Azure-voorbeelden — apart klonen

Deze links verwijzen naar aparte repositories, **geen lokale voorbeelden**.
Hun beheerders zijn verantwoordelijk voor installatie-instructies, implementatie, afhankelijkheden en kosten.

| Voorbeeld | Focus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js-applicatie met database |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# en Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statische frontend met C# Functions en SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python serverless applicatie |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Gecontaineriseerde winkelbackend |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI chatapplicatie |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agentapplicatie |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG met zoeken en citaten |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Gespreks-AI voorbeeld |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java microservices |

Ontdek meer projecten in de [AZD template galerie](https://azure.github.io/awesome-azd/).
Ga er niet vanuit dat een extern project `azd` ondersteunt zonder de actuele README te controleren.

## Repository-structuur

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

Er is geen gedeelde `configurations/`, `scripts/` of testmap zoals door deze index wordt beloofd.
Werkelijke bestanden en optionele uitbreidingsideeën worden in elke gids aangegeven.

## Opruimen

Voer voor de vier AZD-voorbeelden dit **uit vanuit de geselecteerde voorbeeldmap**:

```bash
azd down
```

Bekijk de verwijderprompt. Voor retail verwijdert u alleen de toegewijde resourcegroep
die u hebt gemaakt, volgens de instructies in de ARM-gids. Controleer Azure Cost Management
na opruiming; factureringsgegevens kunnen later binnenkomen.

## Bijdragen

Voeg broncode, infrastructuur, implementatieconfiguratie, uitvoerbare installatie- en
verificatiestappen, beperkingen en opruiminstructies toe bij elk toepassingsvoorbeeld.
Label architectuur-alleen materiaal en onvolledige fragmenten expliciet.
Claim geen productieklaarheid zonder implementatie-, functionele en operationele tests.

[FAQ](../resources/faq.md) · [Studiemateriaal](../resources/study-guide.md) ·
[Meld een probleem](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->