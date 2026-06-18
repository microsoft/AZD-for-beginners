# Adu-ți propria aplicație - Adaugă azd la un proiect existent

**Chapter Navigation:**
- **📚 Pagina cursului**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 1 - Fundament și Pornire rapidă
- **⬅️ Anterior**: [Primul tău proiect](first-project.md)
- **➡️ Următor**: [Containere de dezvoltare & Codespaces](dev-containers.md)

> Validat cu `azd 1.25.6` în iunie 2026.

## Introducere

În [Primul tău proiect](first-project.md) ai implementat o aplicație începând de la un șablon. Dar, de cele mai multe ori, deja *ai* o aplicație — un API Node.js, un serviciu Python Flask, o aplicație web .NET — aflată într-un folder pe mașina ta. Această lecție arată cum să adaugi azd la acel cod existent ca să o poți implementa cu `azd up`, fără a fi necesar un șablon.

## Obiective de învățare

La sfârșitul acestei lecții, vei:
- Înțelege cele trei moduri de a porni un proiect azd
- Rula `azd init` în interiorul unui cod existent
- Înțelege ce fac `azure.yaml` și dosarul `infra/` pentru aplicația ta
- Să știi când să lași azd să genereze infrastructura și când să îți scrii tu propria
- Implementa aplicația existentă în Azure cu `azd up`

## Rezultate ale învățării

După finalizarea acestei lecții, vei putea:
- Inițializa azd într-un proiect pe care îl ai deja
- Citi și edita un fișier `azure.yaml` de bază
- Genera infrastructura de pornire cu `azd infra generate`
- Alege un host Azure potrivit pentru aplicația ta
- Implementa și curăța propria ta aplicație

---

## Trei moduri de a porni un proiect azd

| Punct de plecare | Comandă | Când să folosești |
|------------------|---------|-------------------|
| **Dintr-un șablon** | `azd init --template <name>` | În scop didactic, sau pentru a porni o aplicație nouă pornind de la un exemplu testat |
| **Din codul existent** | `azd init` (în folderul proiectului tău) | Deja ai o aplicație și vrei să o implementezi |
| **Dintr-un repo Git** | `azd init --from-code` (într-un repo clonat) | Adopți azd pentru un depozit existent |

Ai practicat deja prima opțiune. Această lecție acoperă a doua — cel mai comun scenariu din lumea reală.

---

## Pasul 1: Rulează `azd init` în proiectul tău

Deschide un terminal **în interiorul folderului proiectului tău existent** și rulează:

```bash
cd my-existing-app
azd init
```

azd va întreba cum dorești să inițializezi. Alege:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Alege **"Use code in the current directory."** azd va scana folderul, va detecta limbajul și framework-ul și va propune un host.

### Ce detectează azd

azd caută semnale precum `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` sau un `Dockerfile`, și sugerează un host Azure potrivit:

| Aplicația ta | Hostul probabil detectat |
|--------------|--------------------------|
| Aplicație web Node.js / Python / .NET | Azure App Service sau Container Apps |
| Aplicație containerizată (`Dockerfile`) | Azure Container Apps |
| Aplicație Function | Azure Functions |
| Site static (ieșirea build-ului React/Vue) | Azure Static Web Apps |

Confirmă serviciul/serviciile detectate, iar azd va genera fișierele necesare.

---

## Pasul 2: Înțelege ce a creat azd

După init, vei avea două elemente noi în proiectul tău:

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

Aceasta este inima unui proiect azd. Un fișier minimal arată astfel:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blocul `services` este partea cheie: fiecare intrare asociază un folder din codul tău cu un host Azure. Dacă aplicația ta are atât un frontend, cât și un API, vei avea două servicii.

### `infra/` — resursele Azure ca cod

Folderul `infra/` conține fișiere Bicep care definesc resursele Azure de care are nevoie aplicația ta (App Service, baza de date etc.). Nu trebuie să le scrii manual — azd generează un punct de pornire funcțional. Poți să le editezi mai târziu pentru a adăuga resurse sau a îmbunătăți securitatea (acoperit în [Capitolul 4](../chapter-04-infrastructure/README.md)).

> **Sfat:** Vrei să vezi sau să personalizezi infrastructura generată înainte de implementare? Rulează `azd infra generate` (disponibil și ca `azd infra synth`) pentru a scrie IaC pe disc astfel încât să o poți revizui și controla în versiuni.

---

## Pasul 3: Setează configurația necesară

Dacă aplicația ta are nevoie de setări sau secrete (un connection string, o cheie API), nu le codifica direct. Folosește valori de mediu:

```bash
# Creați un mediu
azd env new dev

# Setați o valoare non-secretă
azd env set API_VERSION 1.0.0
```

Pentru secrete reale, stochează-le în Key Vault și referențiază-le din infrastructura ta — vezi [Capitolul 3: Configurare și Autentificare](../chapter-03-configuration/authsecurity.md).

---

## Pasul 4: Implementare

Acum folosește același flux de lucru pe care îl cunoști:

```bash
# Autentificare (necesară pentru azd)
azd auth login

# Previzualizează resursele care vor fi create
azd provision --preview

# Provisionează infrastructura și implementează codul tău
azd up
```

Când se termină, azd afișează URL-ul aplicației tale. Verifică-l în același mod ca orice aplicație azd:

```bash
azd show           # afișează endpoint-urile
azd monitor --logs # verifică jurnalele dacă este necesar
```

---

## Probleme comune la prima utilizare

| Simptom | Cauză probabilă | Remediere |
|---------|-----------------|----------|
| azd nu a detectat aplicația mea | Manifest lipsă (de ex., `package.json`) | Adaugă manifestul, sau alege hostul manual în timpul `azd init` |
| Build-ul eșuează în timpul `azd up` | Aplicația necesită un pas de build | Adaugă `buildCommand`/`outputPath` sub serviciu în `azure.yaml` |
| Aplicația pornește dar returnează erori | Lipsă config/secrete | Setează valorile cu `azd env set` sau conectează Key Vault |
| Hostul greșit ales | Detectarea automată a ghicit | Editează `host:` în `azure.yaml` și rulează din nou `azd up` |

Pentru mai multe, vezi [Capitolul 7: Depanare](../chapter-07-troubleshooting/README.md).

---

## Curățare

```bash
azd down --force --purge
```

---

## Rezumat

- `azd init` → **"Use code in the current directory"** adaugă azd la o aplicație pe care o ai deja.
- `azure.yaml` asociază folderele de cod la hosturi Azure; `infra/` definește resursele ca Bicep.
- `azd infra generate` îți permite să revezi sau să personalizezi infrastructura generată.
- Odată inițializat, aplicația ta existentă folosește exact același flux `azd up` / `azd down` ca o aplicație bazată pe șablon.

---

## 🔗 Navigare

| Direcție | Lecție |
|----------|--------|
| **Anterior** | [Primul tău proiect](first-project.md) |
| **Următor** | [Containere de dezvoltare & Codespaces](dev-containers.md) |

## 📖 Resurse conexe

- [Bazele AZD](azd-basics.md)
- [Capitolul 4: Infrastructură ca Cod](../chapter-04-infrastructure/README.md)
- [Configurare & Autentificare](../chapter-03-configuration/authsecurity.md)
- [Fișă de comenzi](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->