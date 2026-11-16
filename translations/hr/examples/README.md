# Primjeri — Izvor na engleskom i Azure uzorci

Ovo su uzorci za učenje, a ne aplikacije certificirane za produkciju. Pročitajte
preduvjete, ograničenja, troškove i upute za čišćenje svakog primjera prije
pokretanja naredbi. Dostupnost i kvote Azurea morate provjeriti u svojoj pretplati.

- [Početna stranica tečaja](../README.md)
- [Instalacija](../docs/chapter-01-foundation/installation.md)
- [Rješavanje problema](../docs/chapter-07-troubleshooting/common-issues.md)

## Što zapravo postoji lokalno

Postoje **četiri uzorka aplikacija** i **jedna infrastruktura za podizanje**:

| Primjer | Lokalna implementacija | Fokus učenja | Razina |
|---|---|---|---|
| [Jednostavni Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Postavljanje kontejnera, probe, zapisi | Početnik |
| [Mikroservisi s dvije usluge](../../../examples/container-app/microservices) | Node.js gateway i Python servis samo za čitanje, Dockerfiles, Bicep, `azure.yaml` | Interna HTTPS komunikacija, neovisno skaliranje | Srednja razina |
| [Aplikacija s bazom podataka](../../../examples/database-app) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL povezivost, inicijalizacija, zapisi | Srednja razina |
| [Azure OpenAI chat](../../../examples/azure-openai-chat) | Lokalni Python CLI, Azure OpenAI i Key Vault Bicep, samo infrastruktura `azure.yaml` | Provisioniranje modela, povijest chata, procjene tokena | Srednja razina |
| [Maloprodajna infrastruktura](../../../examples/retail-multiagent-arm-template) | ARM predložak, parametri, Bash skripta za postavljanje; **samo hello-world kontejneri** | Infrastruktura za buduću aplikaciju s više agenata | Napredno |

Scenarij [maloprodaje](retail-scenario.md) je **arhitektonski nacrt**, a ne
potpuna implementacija više-agenta. Nema koda za maloprodajnog agenta, sučelja za chat,
API-ja rutera, podatkovnog pipelinesa za pretraživanje, CLI-ja za evaluaciju, automatskog failovera
ili produkcijskog osnaživanja. Sve to mora biti dizajnirano, izgrađeno i testirano zasebno.

Pregled [mikrousloga](microservices/README.md) vodi do pokretljivog
uzorka s dvije usluge; to nije još jedan direktorij za implementaciju.

## Preporučeni put učenja

1. Implementirajte Flask API i provjerite `/health` i CRUD operacije.
2. Implementirajte aplikaciju baze podataka i potvrdite njenih pet unaprijed unesenih proizvoda.
3. Implementirajte uzorak s dvije usluge i provjerite zahtjeve s gatewaya do proizvoda.
4. Nabavite chat resurse i pokrenite interaktivni CLI **lokalno**.
5. Proučite maloprodajni nacrt nakon završetka radnih primjera.

Predvidite otprilike 30–60 minuta po svakom uzorku aplikacije uključujući potrebne preduvjete i
provjeru. Implementacija maloprodaje je zaseban razvojni projekt, ne
radionica od 30 minuta. Čitanje njene arhitekture traje oko 2–3 sata; implementacija
i spremnost za produkciju mogu potrajati znatno duže od ilustrativnih
80–120 sati razvoja navedenih u vodiču.

## Brzi početak

Iz korijena repozitorija, za prvi uzorak kontejnera:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Očekivano: HTTP 200 i JSON koji sadrži `"status": "healthy"`.
Potreban je pokrenut Docker za lokalnu izgradnju kontejnera.

Za chat, slijedite [chat README](azure-openai-chat/README.md): koristite
`azd provision`, učitajte API ključ iz Key Vaulta u trenutnu ljusku, instalirajte
`src/requirements.txt` i pokrenite `python src/chat.py`. Ne postoji usluga hostanog chata.

Za maloprodaju koristite [ARM vodič](retail-multiagent-arm-template/README.md).
On nema `azure.yaml` i **se ne implementira niti briše** pomoću `azd up`/`azd down`.

## Troškovi i ograničenja

- Sve implementacije stvaraju naplaćive Azure resurse. Skaliranje na nulu odnosi se samo na
  računsku snagu aplikacije; ne uklanja troškove registra, baze podataka, spremišta, pretraživanja ili zapisa.
- Točne cijene ovise o regiji, valuti, prometu, modelu/SKU i zadržavanju podataka.
  Koristite [Azure kalkulator cijena](https://azure.microsoft.com/pricing/calculator/)
  prije implementacije i konfigurirajte budžet u Azure Cost Managementu.
- Flask CRUD podaci su u memoriji, ograničeni na jednog radnika i najviše jednu repliku po
  zadanim postavkama. Nestaju pri ponovnom pokretanju ili skaliranju na nulu. Ovo nije trajna pohrana.
- Mikrousługa proizvoda izlaže samo GET endpointove. Nema usluge za narudžbe, korisnike,
  baze podataka, Service Bus, implementaciju u C# ili Go.
- Application Insights resursi ne instrumentiraju automatski svaku aplikaciju.
  Provjerite svaki primjer za stvarni emitirani telemetry.
- Primjeri ne sadrže autentikaciju aplikacije. Dodajte identitet, autorizaciju,
  trajnu pohranu, mrežne kontrole, testove i operativne procedure prije produkcije.

## Vanjski Azure primjeri — klonirajte zasebno

Ove poveznice upućuju na zasebne repozitorije, **ne lokalne primjere**.
Njihovi održavatelji su odgovorni za upute za postavljanje, implementaciju, ovisnosti i troškove.

| Primjer | Fokus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js aplikacija s bazom podataka |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# i Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statični frontend s C# funkcijama i SQL-om |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python serverless aplikacija |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Kontejnerizirani backend trgovine |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI chat aplikacija |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agenti aplikacija |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG s pretraživanjem i citatima |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Primjer konverzacijskog AI |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java mikrousluge |

Otkrijte više projekata u [AZD galeriji predložaka](https://azure.github.io/awesome-azd/).
Nemojte pretpostavljati da vanjski projekt podržava `azd` bez provjere aktualnog README-a.

## Struktura repozitorija

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

Nema zajedničkog `configurations/`, `scripts/` ili direktorija za testove kojeg ovaj indeks obećava.
Stvarne datoteke i opcionalne ideje za proširenje identificirane su u svakom vodiču.

## Čišćenje

Za četiri AZD uzorka, pokrenite ovo **iz direktorija odabranog uzorka**:

```bash
azd down
```

Pregledajte upit za brisanje. Za maloprodaju obrišite samo dediciranu grupu resursa
koju ste kreirali, prateći upute u ARM vodiču. Provjerite Azure Cost Management
nakon čišćenja; podaci za naplatu mogu stići naknadno.

## Doprinos

Uključite izvorni kod, infrastrukturu, konfiguraciju postavljanja, korake za verificiranje i
ograničenja, kao i upute za čišćenje kod svakog primjera aplikacije.
Izričito označite materijale koji se odnose samo na arhitekturu i nepotpune isječke.
Ne tvrdite da je spremno za produkciju bez testova postavljanja, funkcionalnosti i rada.

[Često postavljana pitanja](../resources/faq.md) · [Vodič za učenje](../resources/study-guide.md) ·
[Prijavite problem](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->