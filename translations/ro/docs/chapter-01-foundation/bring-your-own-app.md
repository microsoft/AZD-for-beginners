# Adu-ți propria aplicație - Adaugă azd la un proiect existent

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 1 - Fundamente & Pornire Rapidă
- **⬅️ Anterior**: [Primul Tău Proiect](first-project.md)
- **➡️ Următor**: [Containere Dev & Codespaces](dev-containers.md)

> Revizuirea comenzilor și a configurației țintă: `azd 1.37.2` (Noiembrie 2026). Fișierele generate depind de aplicația detectată; implementarea în Azure nu a fost executată în această revizuire.

## Introducere

În [Primul Tău Proiect](first-project.md) ai implementat o aplicație pornind de la un șablon. Dar de cele mai multe ori deja *ai* o aplicație – o API Node.js, un serviciu Python Flask, o aplicație web .NET – aflată într-un folder pe mașina ta. Această lecție arată cum să adaugi azd codului existent pentru a o implementa cu `azd up`, fără a fi nevoie de un șablon.

## Obiective de învățare

La finalul acestei lecții, vei:
- Înțelege cele trei moduri de a începe un proiect azd
- Rula `azd init` într-un cod existent
- Înțelege ce fac `azure.yaml` și folderul `infra/` pentru aplicația ta
- Știi când să lași azd să genereze infrastructura vs. să-ți scrii propria infrastructură
- Să implementezi aplicația ta existentă în Azure cu `azd up`

## Rezultate de învățare

După ce finalizezi această lecție, vei putea:
- Inițializa azd într-un proiect pe care îl ai deja
- Citi și edita un fișier de bază `azure.yaml`
- Genera infrastructură de start cu `azd infra generate`
- Alege un host Azure potrivit pentru aplicația ta
- Implementa și curăța propria aplicație

---

## Trei moduri de a începe un proiect azd

| Punct de plecare | Comandă | Când să folosești |
|----------------|---------|-------------|
| **Dintr-un șablon** | `azd init --template <name> .` (director gol) | Pentru învățare sau pornirea unei aplicații noi dintr-un exemplu dovedit |
| **Din codul tău existent** | `azd init` (în folderul proiectului tău) | Deja ai o aplicație și vrei să o implementezi |
| **Dintr-un repo Git** | `azd init --from-code` (într-un repo clonat) | Adopți azd pentru un depozit existent |

Ai exersat deja prima opțiune. Această lecție acoperă a doua – scenariul cel mai comun din lumea reală.

---

## Pasul 1: Rulează `azd init` în Proiectul Tău

Deschide un terminal **în folderul proiectului tău existent** și rulează:

```bash
cd my-existing-app
azd init
```

azd va întreba cum vrei să inițializezi. Alege:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Alege **„Folosește codul din directorul curent.”** azd scanează apoi folderul tău, detectează limbajul și cadrul tău, și propune un host.

### Ce detectează azd

azd caută semnale ale aplicației precum `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, sau un `Dockerfile`. Fluxul din cod nu este un expert general de selecție a hostului pentru fiecare țintă suportată de implementare:

| Aplicația ta | Host probabil detectat |
|------------|-----------------------|
| Aplicație web suportată Node.js / Python / .NET | Tipic Azure Container Apps; inspectează definiția generată |
| Aplicație containerizată (`Dockerfile`) | Azure Container Apps |
| Aplicație Function sau proiect Static Web Apps | Folosește un șablon corespunzător sau scrie `azure.yaml` și infrastructură dacă fluxul din cod nu suportă layout-ul tău |

Confirmă serviciile detectate și azd construiește fișierele de care ai nevoie.

---

## Pasul 2: Înțelege Ce a Creat azd

După inițializare, inspectează `azure.yaml`. Fluxul infrastructurii generate poate lăsa infrastructura implicită până rulezi `azd infra generate`; nu presupune că `infra/` există deja:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definiția proiectului

Acesta este nucleul unui proiect azd. Următoarea **definiție ilustrativă pentru App Service** necesită infrastructura App Service corespunzătoare; nu este un motiv să schimbi hostul Container Apps generat fără să schimbi infrastructura:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blocul `services` este partea cheie: fiecare intrare mapează un folder al codului tău către un host Azure. Dacă aplicația ta are atât frontend cât și o API, vei avea două servicii.

### `infra/` — resursele tale Azure ca cod

Folderul `infra/` conține fișiere Bicep care definesc resursele Azure de care are nevoie aplicația ta (App Service, baza de date, etc.). Nu trebuie să le scrii manual—azd generează un punct de start funcțional. *Poți* să le editezi mai târziu pentru a adăuga resurse sau pentru a întări securitatea (acoperit în [Capitolul 4](../chapter-04-infrastructure/README.md)).

> **Sfat:** Vrei să vezi sau să personalizezi infrastructura generată înainte de implementare? Rulează `azd infra generate` (disponibil și ca `azd infra synth`) pentru a scrie IaC pe disc astfel încât să o poți revizui și controla versiunea.

---

## Pasul 3: Setează Configurația Necesara

Dacă aplicația ta are nevoie de setări sau secrete (un connection string, o cheie API), nu le codifica fix. Folosește valori de mediu:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Aceasta păstrează o valoare locală doar. Pentru a afecta aplicația, consum-o explicit în parametrii infrastructurii, o setare de serviciu suportată sau un hook; setarea unei variabile arbitrare nu configurează runtime-ul implementat.

Pentru secrete reale, păstrează-le în Key Vault și referențiază-le din infrastructura ta—vezi [Capitolul 3: Configurare & Autentificare](../chapter-03-configuration/authsecurity.md).

---

## Pasul 4: Implementează

Acum folosește fluxul de lucru pe care îl cunoști deja:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Când se finalizează, azd afișează URL-ul aplicației tale. Verifică-l la fel ca orice aplicație azd:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Probleme comune întâmpinate prima dată

| Simptom | Cauză probabilă | Soluție |
|---------|-----------------|--------|
| azd nu a detectat aplicația mea | Lipsă manifest (de exemplu, `package.json`) | Adaugă manifestul sau alege manual hostul în timpul `azd init` |
| Construirea eșuează în timpul `azd up` | Aplicația are nevoie de pas de build | Configurează scripturile pachetului aplicației sau hook-ul de serviciu `prepackage`; folosește `dist` pentru outputul de implementare, nu `buildCommand`/`outputPath` |
| Aplicația pornește dar returnează erori | Lipsă config/secrete | Leagă valorile în setările runtime ale aplicației sau o referință Key Vault; `azd env set` singur nu este suficient |
| Host greșit ales | Detectarea automată nu corespunde nevoilor tale | Schimbă atât `host:` cât și infrastructura corespunzătoare sau alege un șablon potrivit |

Pentru mai multe, vezi [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md).

---

## Curățare

```bash
azd down --force --purge
```

---

## Rezumat

- `azd init` → **„Folosește codul din directorul curent”** adaugă azd la o aplicație pe care o ai deja.
- `azure.yaml` mapează folderele codului tău către hosturi Azure; `infra/` definește resursele ca Bicep.
- `azd infra generate` îți permite să revezi sau să personalizezi infrastructura generată.
- Odată inițializată, aplicația ta existentă folosește același flux de lucru `azd up` / `azd down` ca o aplicație bazată pe șablon.

---

## 🔗 Navigare

| Direcție | Lecție |
|-----------|--------|
| **Anterior** | [Primul Tău Proiect](first-project.md) |
| **Următor** | [Containere Dev & Codespaces](dev-containers.md) |

## 📖 Resurse conexe

- [Bazele AZD](azd-basics.md)
- [Capitolul 4: Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configurare & Autentificare](../chapter-03-configuration/authsecurity.md)
- [Fișa de comandă](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->