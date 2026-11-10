# Primeri — izvirnik v angleščini in vzorci Azure

To so učni vzorci, ne aplikacije certificirane za produkcijo. Pred zagonom ukazov preberite
predpogoje, omejitve, stroške in navodila za čiščenje posameznega primera.
Razpoložljivost Azure in kvote morate preveriti v svoji naročnini.

- [Domov tečaja](../README.md)
- [Namestitev](../docs/chapter-01-foundation/installation.md)
- [Reševanje težav](../docs/chapter-07-troubleshooting/common-issues.md)

## Kaj pravzaprav obstaja lokalno

Obstajajo **štirje vzorci aplikacij** in **ena infrastruktura dirke**:

| Primer | Lokalna izvedba | Osredotočenost učenja | Stopnja |
|---|---|---|---|
| [Preprost Flask API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Namestitev kontejnerja, preglede, dnevniki | Začetnik |
| [Mikrostoritvi z dvema službama](../../../examples/container-app/microservices) | Node.js prehod in samo za branje Python produktna storitev, Dockerfile, Bicep, `azure.yaml` | Notranja HTTPS komunikacija, neodvisno skaliranje | Srednja stopnja |
| [Aplikacija z bazo podatkov](../../../examples/database-app) | Flask read API, Azure SQL, App Service, Bicep, `azure.yaml` | Povezljivost SQL, inicializacija, dnevniki | Srednja stopnja |
| [Azure OpenAI klepet](../../../examples/azure-openai-chat) | Lokalni Python CLI, Azure OpenAI in Key Vault Bicep, samo infrastruktura `azure.yaml` | Zagotavljanje modela, zgodovina klepeta, ocene žetonov | Srednja stopnja |
| [Malo infrastrukturno trgovanje](../../../examples/retail-multiagent-arm-template) | ARM predloga, parametri, Bash skripta za namestitev; **samo hello-world kontejnerji** | Infrastruktura za prihodnjo večprostorsko aplikacijo | Napredno |

Scenarij [maloprodaje](retail-scenario.md) je **arhitekturni načrt**, ne pa
popolna večagentna implementacija. Ni vključene nobene kode maloprodajnega agenta, klepetalnega uporabniškega vmesnika, vmesnika za usmerjevalnik
API, podatkovnega cevovoda iskanja, ukazne vrstice za ocenjevanje, samodejnega preklopa ali produkcijske
zaščite. To je treba zasnovati, zgraditi in preizkusiti ločeno.

Pregled [mikrostoritev](microservices/README.md) kaže na izvajalno
dvostoritveni primer; ni še ena mapa za namestitev.

## Priporočena učna pot

1. Namestite Flask API in preverite `/health` ter CRUD operacije.
2. Namestite aplikacijo baze podatkov in preverite njenih pet vnaprej določenih izdelkov.
3. Namestite dvostoritveni primer in preverite zahteve prehoda na izdelek.
4. Priskrbite vire za klepet in zaženite interaktivno ukazno vrstico **lokalno**.
5. Preučite načrt maloprodaje po Zaključku delujočih primerov.

Za vsak vzorec aplikacije predvidite približno 30–60 minut, vključno s predpogoji in
preverjanjem. Implementacija maloprodaje je ločen razvojni projekt, ne
tridesetminutna delavnica. Branje njegove arhitekture traja približno 2–3 ure; implementacija
in pripravljenost za proizvodnjo lahko vzameta znatno več časa kot ilustrativnih
80–120 razvojnih ur v vodiču.

## Hiter začetek

Iz korena repozitorija za prvi primer vsebnika:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Pričakovano: HTTP 200 in JSON, ki vsebuje `"status": "healthy"`.
Potrebujete zagnan Docker za lokalno gradnjo vsebnika.

Za klepet sledite [navodilom za klepet](azure-openai-chat/README.md): uporabite
`azd provision`, naložite ključ API iz Key Vault v trenutno lupino, namestite
`src/requirements.txt` in zaženite `python src/chat.py`. Gostujoče klepetalno storitev ni.

Za maloprodajo uporabite [ARM vodič](retail-multiagent-arm-template/README.md).
Nima `azure.yaml` in ni **nameščen** ali odstranjen z `azd up`/`azd down`.

## Stroški in omejitve

- Vse namestitve ustvarjajo zaračunljive vire Azure. Scale-to-zero velja le za
  računske aplikacije; ne odpravi stroškov registra, baze podatkov, shrambe, iskanja ali dnevnikov.
- Natančne cene so odvisne od regije, valute, prometa, modela/SKU in hranjenja.
  Uporabite [kalkulator cen Azure](https://azure.microsoft.com/pricing/calculator/)
  pred namestitvijo in nastavite proračun v upravljanju stroškov Azure.
- Flaskove CRUD podatke so v pomnilniku, omejeni na enega delavca in največ eno repliko po
  privzetku. Izginejo ob ponovnem zagonu ali scale-to-zero. To ni trajna shramba.
- Mikrostoritev za izdelek razkriva samo GET končne točke. Ni storitve naročila, uporabniške
  storitve, baze podatkov, Service Bus, C# ali Go implementacije.
- Viri Application Insights ne instrumentirajo samodejno vsake aplikacije.
  Posvetujte se z vsakim primerom za dejansko poslano telemetrijo.
- Vzorci ne izvajajo avtorizacije aplikacij. Pred produkcijo dodajte identiteto, pooblastila,
  trajno shranjevanje, mrežne kontrole, teste in operativne postopke.

## Zunanje Azure vzorce — klonirajte ločeno

Ti povezavi se nanašata na ločene repozitorije, **ne lokalne primere**.
Njihovi vzdrževalci imajo v lasti navodila za nastavitev, implementacijo, odvisnosti in stroške.

| Vzorec | Osredotočenost |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js aplikacija z bazo podatkov |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# in Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statični uporabniški vmesnik s C# Funkcijami in SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python brezstrežnik aplikacija |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Vsebnikirana trgovinska podlaga |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | AI klepetalna aplikacija |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agentna aplikacija |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG z iskanjem in navedbami |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Primer pogovorne umetne inteligence |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java mikrostoritve |

Odkrijte več projektov v [galeriji predlog AZD](https://azure.github.io/awesome-azd/).
Ne domnevajte, da zunanji projekt podpira `azd` brez preverjanja njegovega trenutnega README.

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

Ta indeks ne obljublja skupnih map `configurations/`, `scripts/` ali testov.
Dejanske datoteke in nekatere možne ideje za razširitve so navedene v vsakem vodiču.

## Čiščenje

Za štiri vzorce AZD zaženite to **iz izbrane mape vzorca**:

```bash
azd down
```

Preglejte poziv za brisanje. Za maloprodajo izbrišite le namensko skupino virov,
ki ste jo ustvarili, z uporabo navodil v njenem ARM vodiču. Po čiščenju preverite Azure Cost Management;
podatki o zaračunavanju lahko pridejo kasneje.

## Prispevanje

Vsakemu vzorcu aplikacije priložite izvorno kodo, infrastrukturo, konfiguracijo namestitve, izvedljive korake
in preverjanje, omejitve ter navodila za čiščenje. Izrecno označite materiale, ki so le arhitekturni,
in nepopolne odrezke. Ne trdite pripravljenosti za proizvodnjo brez namestitvenih, funkcionalnih in operativnih testov.


[Pogosta vprašanja](../resources/faq.md) · [Študijski vodič](../resources/study-guide.md) ·
[Prijavi težavo](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->