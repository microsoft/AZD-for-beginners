# Exemple — Sursa în engleză și mostre Azure

Acestea sunt mostre pentru învățare, nu aplicații certificate pentru producție. Citiți fiecare
cerință prealabilă, limitare, cost și instrucțiunile de curățare înainte de
a rula comenzile. Disponibilitatea și cotele Azure trebuie verificate în abonamentul dvs.

- [Pagina principală a cursului](../README.md)
- [Instalare](../docs/chapter-01-foundation/installation.md)
- [Depanare](../docs/chapter-07-troubleshooting/common-issues.md)

## Ce există efectiv local

Există **patru mostre de aplicații** și **un schelet de infrastructură**:

| Exemplu | Implementare locală | Focus învățare | Nivel |
|---|---|---|---|
| [API Flask simplu](../../../examples/container-app/simple-flask-api) | API CRUD Flask, Dockerfile, Bicep, `azure.yaml` | Implementare containere, sonde, jurnale | Începător |
| [Microservicii cu două servicii](../../../examples/container-app/microservices) | Gateway Node.js și serviciu produs Python read-only, Dockerfiles, Bicep, `azure.yaml` | Comunicare internă HTTPS, scalare independentă | Intermediar |
| [Aplicație baze de date](../../../examples/database-app) | API Flask read, Azure SQL, App Service, Bicep, `azure.yaml` | Conectivitate SQL, inițializare, jurnale | Intermediar |
| [Chat Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python local, Azure OpenAI și Key Vault Bicep, doar infrastructură `azure.yaml` | Provizionare model, istoric chat, estimări tokeni | Intermediar |
| [Infrastructură retail](../../../examples/retail-multiagent-arm-template) | Template ARM, parametri, script de implementare Bash; **doar containere hello-world** | Infrastructură pentru o aplicație multi-agent viitoare | Avansat |

Scenariul [retail](retail-scenario.md) este un **plan de arhitectură**, nu o
implementare completă multi-agent. Nu include cod agent retail, interfață chat,
API router, pipeline date căutare, CLI evaluare, failover automat sau
întărire pentru producție. Acestea trebuie proiectate, construite și testate separat.

Prezentarea generală a [microserviciilor](microservices/README.md) indică mostarul rulabil
cu două servicii; nu este un alt director de implementare.

## Calea recomandată de învățare

1. Implementați API-ul Flask și verificați `/health` și operațiile CRUD.
2. Implementați aplicația bazei de date și verificați cele cinci produse preîncărcate.
3. Implementați exemplul cu două servicii și verificați cererile gateway-ului către produs.
4. Provizionați resursele de chat și rulați CLI interactiv **local**.
5. Studiați planul retail după ce finalizați exemplele funcționale.

Alocați aproximativ 30–60 de minute pentru fiecare mostră de aplicație, incluzând cerințele prealabile și
verificarea. Implementarea retail este un proiect de dezvoltare separat, nu un
atelier de 30 de minute. Lecturarea arhitecturii durează aproximativ 2–3 ore; implementarea
și pregătirea pentru producție pot dura semnificativ mai mult decât cele ilustrative
80–120 de ore de dezvoltare din ghid.

## Pornire rapidă

Din rădăcina depozitului, pentru prima mostră de container:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Așteptat: HTTP 200 și JSON conținând `"status": "healthy"`.
Trebuie să aveți Docker pornit pentru construirea containerului local.

Pentru chat, urmați [README-ul chat](azure-openai-chat/README.md): folosiți
`azd provision`, încărcați cheia API din Key Vault în shell-ul curent, instalați
`src/requirements.txt` și rulați `python src/chat.py`. Nu există serviciu chat găzduit.

Pentru retail, folosiți [ghidul ARM](retail-multiagent-arm-template/README.md).
Nu are `azure.yaml` și **nu** este implementat sau eliminat de `azd up`/`azd down`.

## Costuri și limitări

- Toate implementările creează resurse Azure facturabile. Scala-la-zero se aplică doar la
  calculul aplicației; nu elimină costurile pentru registru, bază de date, stocare, căutare sau jurnale.
- Prețurile exacte depind de regiune, monedă, trafic, model/SKU și retenție.
  Folosiți [calculatorul de prețuri Azure](https://azure.microsoft.com/pricing/calculator/)
  înainte de implementare și configurați un buget în Azure Cost Management.
- Datele CRUD Flask sunt în memorie, limitate la un singur worker și cel mult o replică implicit.
  Acestea dispar la repornire sau la scalare-la-zero. Nu este stocare durabilă.
- Microserviciul produs expune doar endpoint-uri GET. Nu este inclus serviciu de comenzi, serviciu utilizator,
  bază de date, Service Bus, implementare C# sau Go.
- Resursele Application Insights nu instrumentează automat fiecare aplicație.
  Consultați fiecare exemplu pentru telemetria efectiv emisă.
- Mostrele nu implementează autentificare a aplicației. Adăugați identitate, autorizare,
  stocare persistentă, controale de rețea, teste și proceduri operaționale înainte de producție.

## Mostre Azure externe — clonați separat

Aceste linkuri sunt referințe către depozite separate, **nu exemple locale**.
Administratorii lor dețin instrucțiunile de configurare, implementarea, dependențele și costurile.

| Mostră | Focus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Aplicație Node.js cu bază de date |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# și Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Frontend static cu C# Functions și SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Aplicație serverless Python |
| [API magazin Container Apps](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend magazin containerizat |
| [Pornire rapidă chat AI](https://github.com/Azure-Samples/get-started-with-ai-chat) | Aplicație chat AI |
| [Pornire rapidă agenți AI](https://github.com/Azure-Samples/get-started-with-ai-agents) | Aplicație agenți |
| [Demonstratie Search + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG cu căutare și citări |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Mostră AI conversațional |
| [Java pe Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microservicii Java |

Descoperiți mai multe proiecte în [galeria șabloanelor AZD](https://azure.github.io/awesome-azd/).
Nu presupuneți că un proiect extern suportă `azd` fără a verifica README-ul său actual.

## Structura depozitului

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

Nu există un director comun `configurations/`, `scripts/` sau de teste promis de
acest index. Fișierele reale și ideile opționale de extindere sunt identificate în fiecare ghid.

## Curățare

Pentru cele patru mostre AZD, rulați aceasta **din directorul selectat al mostrei**:

```bash
azd down
```

Examinați promptul de ștergere. Pentru retail, eliminați doar grupul de resurse dedicat
pe care l-ați creat, folosind instrucțiunile din ghidul său ARM. Verificați Azure Cost Management
după curățare; datele de facturare pot sosi ulterior.

## Contribuții

Includeți sursa, infrastructura, configurația de implementare, pașii de configurare și
verificare acționabili, limitările și instrucțiunile de curățare cu fiecare exemplu de aplicație.
Marcați în mod explicit materialul ce conține doar arhitectura și fragmentele incomplete.
Nu afirmați pregătirea pentru producție fără teste de implementare, funcționale și operaționale.

[Întrebări frecvente](../resources/faq.md) · [Ghid de studiu](../resources/study-guide.md) ·
[Raportați o problemă](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->