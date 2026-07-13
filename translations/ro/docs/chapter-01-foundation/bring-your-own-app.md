# Adu-ți propria aplicație - Adaugă azd la un proiect existent

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 1 - Bazele & Pornire rapidă
- **⬅️ Anterior**: [Primul tău proiect](first-project.md)
- **➡️ Următor**: [Containere Dev & Codespaces](dev-containers.md)

> Validat cu `azd 1.27.1` în iulie 2026.

## Introducere

În [Primul tău proiect](first-project.md) ai implementat o aplicație pornind de la un șablon. Dar de cele mai multe ori ai deja *o aplicație* — o API Node.js, un serviciu Python Flask, o aplicație web .NET — așezate într-un folder pe calculatorul tău. Această lecție arată cum să adaugi azd la acel cod existent pentru a o implementa cu `azd up`, fără a fi nevoie de șablon.

## Obiective de învățare

Până la finalul acestei lecții, vei:
- Înțelege cele trei moduri de a începe un proiect azd
- Rula `azd init` în interiorul unui cod existent
- Înțelege ce face `azure.yaml` și folderul `infra/` pentru aplicația ta
- Știi când să lași azd să genereze infrastructura versus a scrie singur
- Implementezi aplicația existentă în Azure cu `azd up`

## Rezultate de învățare

După terminarea acestei lecții, vei putea:
- Inițializa azd într-un proiect pe care îl ai deja
- Citi și edita un fișier de bază `azure.yaml`
- Genera infrastructură de început cu `azd infra generate`
- Alege un host Azure potrivit pentru aplicația ta
- Implementa și curăța propria ta aplicație

---

## Trei moduri de a începe un proiect azd

| Punct de pornire | Comandă | Când să folosești |
|----------------|---------|-------------|
| **Dintr-un șablon** | `azd init --template <name>` | Pentru învățare sau pentru a începe o aplicație nouă pornind de la un exemplu certificat |
| **Din codul tău existent** | `azd init` (în folderul proiectului tău) | Ai deja o aplicație și vrei să o implementezi |
| **Dintr-un depozit Git** | `azd init --from-code` (într-un repo clonat) | Adoptarea azd pentru un depozit existent |

Ai exersat deja prima opțiune. Această lecție acoperă a doua — cel mai comun scenariu din lumea reală.

---

## Pasul 1: Rulează `azd init` în Proiectul Tău

Deschide un terminal **în interiorul folderului proiectului existent** și rulează:

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

Alege **"Use code in the current directory."** azd apoi scanează folderul, detectează limbajul și cadrul de lucru, și propune un host.

### Ce detectează azd

azd caută semnale precum `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` sau un `Dockerfile`, și sugerează un host Azure corespunzător:

| Aplicația ta | Host probabil detectat |
|----------|----------------------|
| Aplicație web Node.js / Python / .NET | Azure App Service sau Container Apps |
| Aplicație containerizată (`Dockerfile`) | Azure Container Apps |
| Aplicație Function | Azure Functions |
| Site static (output React/Vue build) | Azure Static Web Apps |

Confirmă serviciile detectate, iar azd construiește fișierele necesare.

---

## Pasul 2: Înțelege Ce a Creat azd

După init, vei avea două lucruri noi în proiectul tău:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definiția proiectului

Acesta este nucleul unui proiect azd. Un fișier minimal arată așa:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blocul `services` este partea cheie: fiecare intrare mapează un folder de cod la un host Azure. Dacă aplicația ta are atât frontend, cât și API, vei avea două servicii.

### `infra/` — resursele Azure ca și cod

Folderul `infra/` conține fișiere Bicep care definesc resursele Azure necesare aplicației tale (App Service, baza de date etc.). Nu trebuie să le scrii manual — azd generează un punct de plecare funcțional. *Poți* să le editezi ulterior pentru a adăuga resurse sau a întări securitatea (acoperit în [Capitolul 4](../chapter-04-infrastructure/README.md)).

> **Sfat:** Vrei să vezi sau să personalizezi infrastructura generată înainte de implementare? Rulează `azd infra generate` (disponibil și ca `azd infra synth`) pentru a scrie IaC pe disc și a putea să o verifici și să o adaugi la controlul versiunilor.

---

## Pasul 3: Setează Configurația Necesara

Dacă aplicația ta are nevoie de setări sau secrete (un string de conexiune, o cheie API), nu le hardcoda. Folosește valori din mediu:

```bash
# Creează un mediu
azd env new dev

# Setează o valoare ne-secretă
azd env set API_VERSION 1.0.0
```

Pentru secrete reale, stochează-le în Key Vault și referențiază-le din infrastructura ta — vezi [Capitolul 3: Configurare & Autentificare](../chapter-03-configuration/authsecurity.md).

---

## Pasul 4: Implementează

Acum folosește același flux de lucru pe care îl știi deja:

```bash
# Autentificare (necesară pentru azd)
azd auth login

# Previzualizează resursele care vor fi create
azd provision --preview

# Provisionare infrastructură și implementare codului tău
azd up
```

Când se termină, azd afișează URL-ul aplicației tale. Verifică-l la fel ca orice aplicație azd:

```bash
azd show           # afișează endpoint-urile
azd monitor --logs # verifică jurnalele dacă este necesar
```

---

## Probleme frecvente întâlnite prima dată

| Simptom | Cauză probabilă | Remediere |
|---------|--------------|-----|
| azd nu a detectat aplicația mea | Lipsă manifest (ex: `package.json`) | Adaugă manifestul sau alege hostul manual în timpul `azd init` |
| Build eșuează în timpul `azd up` | Aplicația are nevoie de un pas de build | Adaugă `buildCommand`/`outputPath` sub serviciu în `azure.yaml` |
| Aplicația pornește, dar returnează erori | Lipsă config/secrete | Setează valori cu `azd env set` sau conectează Key Vault |
| Host greșit ales | Detectare automată eronată | Editează `host:` în `azure.yaml` și rulează din nou `azd up` |

Pentru mai multe, vezi [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md).

---

## Curățare

```bash
azd down --force --purge
```

---

## Rezumat

- `azd init` → **"Use code in the current directory"** adaugă azd unei aplicații pe care o ai deja.
- `azure.yaml` mapă folderele de cod la hosturi Azure; `infra/` definește resursele ca Bicep.
- `azd infra generate` îți permite să revezi sau să personalizezi infrastructura generată.
- Odată inițializat, aplicația ta existentă folosește exact același flux `azd up` / `azd down` ca o aplicație bazată pe șablon.

---

## 🔗 Navigare

| Direcție | Lecție |
|-----------|--------|
| **Anterior** | [Primul tău proiect](first-project.md) |
| **Următor** | [Containere Dev & Codespaces](dev-containers.md) |

## 📖 Resurse conexe

- [Bazele AZD](azd-basics.md)
- [Capitolul 4: Infrastructură ca Cod](../chapter-04-infrastructure/README.md)
- [Configurare & Autentificare](../chapter-03-configuration/authsecurity.md)
- [Fișă cu comenzi](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->