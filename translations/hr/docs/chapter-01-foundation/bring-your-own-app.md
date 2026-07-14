# Donesi svoju aplikaciju - Dodavanje azd u postojeći projekt

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brz početak
- **⬅️ Prethodno**: [Vaš prvi projekt](first-project.md)
- **➡️ Sljedeće**: [Razvojni kontejneri i Codespaces](dev-containers.md)

> Validirano s `azd 1.27.1` u srpnju 2026.

## Uvod

U [Vašem prvom projektu](first-project.md) ste implementirali aplikaciju počevši od predloška. Ali većinu vremena već *imate* aplikaciju — Node.js API, Python Flask servis, .NET web aplikaciju — koja se nalazi u mapi na vašem računalu. Ova lekcija pokazuje kako dodati azd u taj postojeći kod kako biste ga mogli implementirati s `azd up`, bez potrebe za predloškom.

## Ciljevi učenja

Do kraja ove lekcije, naučit ćete:
- Razumjeti tri načina za pokretanje azd projekta
- Pokrenuti `azd init` unutar postojećeg koda
- Razumjeti što `azure.yaml` i mapa `infra/` rade za vašu aplikaciju
- Znati kada dopustiti azd-u da generira infrastrukturu nasuprot pisanju vlastite
- Implementirati vašu postojeću aplikaciju na Azure pomoću `azd up`

## Ishodi učenja

Nakon završetka ove lekcije, moći ćete:
- Inicijalizirati azd u projektu koji već imate
- Čitati i uređivati osnovnu datoteku `azure.yaml`
- Generirati početnu infrastrukturu pomoću `azd infra generate`
- Odabrati odgovarajući Azure host za vašu aplikaciju
- Implementirati i ukloniti vlastitu aplikaciju

---

## Tri načina za pokretanje azd projekta

| Početna točka | Naredba | Kada koristiti |
|----------------|---------|-------------|
| **Iz predloška** | `azd init --template <name>` | Za učenje ili pokretanje nove aplikacije iz dokazanog primjera |
| **Iz vašeg postojećeg koda** | `azd init` (u mapi projekta) | Već imate aplikaciju i želite je implementirati |
| **Iz Git repozitorija** | `azd init --from-code` (u kloniranom repozitoriju) | Primjena azd-a na postojeći repozitorij |

Već ste vježbali prvu opciju. Ova lekcija pokriva drugu—najčešći stvarni scenarij.

---

## Korak 1: Pokrenite `azd init` u Vašem projektu

Otvorite terminal **unutar mape vašeg postojećeg projekta** i pokrenite:

```bash
cd my-existing-app
azd init
```

azd će pitati kako želite inicijalizirati. Izaberite:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Odaberite **"Koristi kod u trenutnoj mapi."** azd tada skenira vašu mapu, detektira vaš programski jezik i okvir, i predlaže host.

### Što azd otkriva

azd traži signale kao što su `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ili `Dockerfile`, i predlaže odgovarajući Azure host:

| Vaša aplikacija | Vjerojatno otkriveni host |
|----------|----------------------|
| Node.js / Python / .NET web aplikacija | Azure App Service ili Container Apps |
| Aplikacija u kontejneru (`Dockerfile`) | Azure Container Apps |
| Funkcijska aplikacija | Azure Functions |
| Statični sajt (izlaz iz React/Vue gradnje) | Azure Static Web Apps |

Potvrdite otkrivenu uslugu/usluge, i azd postavlja potrebne datoteke.

---

## Korak 2: Razumjeti što je azd kreirao

Nakon inicijalizacije, imat ćete dvije nove stvari u vašem projektu:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definicija projekta

Ovo je srce azd projekta. Minimalna verzija izgleda ovako:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je ključni dio: svaki unos preslikava mapu vašeg koda na Azure host. Ako vaša aplikacija ima frontend i API, imat ćete dvije usluge.

### `infra/` — vaše Azure resurse kao kod

Mapa `infra/` sadrži Bicep datoteke koje definiraju Azure resurse koje vaša aplikacija treba (App Service, baza podataka itd.). Ne morate ove datoteke pisati ručno — azd generira radnu početnu točku. Kasnije ih *možete* uređivati da dodate resurse ili povećate sigurnost (što je pokriveno u [Poglavlju 4](../chapter-04-infrastructure/README.md)).

> **Savjet:** Želite li vidjeti ili prilagoditi generiranu infrastrukturu prije implementacije? Pokrenite `azd infra generate` (dostupno također kao `azd infra synth`) da zapišete IaC na disk kako biste ga mogli pregledati i verzionirati.

---

## Korak 3: Postavite potrebne konfiguracije

Ako vaša aplikacija treba postavke ili tajne (npr. string povezivanja, API ključ), nemojte ih tvrdo kodirati. Koristite vrijednosti okoline:

```bash
# Kreirajte okruženje
azd env new dev

# Postavite vrijednost koja nije tajna
azd env set API_VERSION 1.0.0
```

Za prave tajne, spremite ih u Key Vault i referencirajte ih iz vaše infrastrukture—pogledajte [Poglavlje 3: Konfiguracija i autentikacija](../chapter-03-configuration/authsecurity.md).

---

## Korak 4: Implementirajte

Sada koristite isti tijek rada koji već znate:

```bash
# Autentificirajte se (obavezno za azd)
azd auth login

# Pregledajte resurse koji će biti stvoreni
azd provision --preview

# Osigurajte infrastrukturu i implementirajte svoj kod
azd up
```

Kada završi, azd ispisuje URL vaše aplikacije. Provjerite ga kao i svaku azd aplikaciju:

```bash
azd show           # prikaži krajnje točke
azd monitor --logs # provjeri dnevnike ako je potrebno
```

---

## Uobičajeni problemi kod prvog pokretanja

| Simptom | Vjerojatni uzrok | Rješenje |
|---------|--------------|-----|
| azd nije detektirao moju aplikaciju | Nedostaje manifest (npr. `package.json`) | Dodajte manifest ili ručno odaberite host tijekom `azd init` |
| Gradnja ne uspijeva tijekom `azd up` | Aplikaciji treba korak gradnje | Dodajte `buildCommand`/`outputPath` ispod usluge u `azure.yaml` |
| Aplikacija se pokreće, ali vraća pogreške | Nedostaju konfiguracije/tajne vrijednosti | Postavite vrijednosti pomoću `azd env set` ili konfigurirajte Key Vault |
| Odabran je pogrešan host | Automatska detekcija je pogriješila | Uredite `host:` u `azure.yaml` i ponovno pokrenite `azd up` |

Za više informacija pogledajte [Poglavlje 7: Rješavanje problema](../chapter-07-troubleshooting/README.md).

---

## Čišćenje

```bash
azd down --force --purge
```

---

## Sažetak

- `azd init` → **"Koristi kod u trenutnoj mapi"** dodaje azd u aplikaciju koju već imate.
- `azure.yaml` preslikava mape vašeg koda na Azure hostove; `infra/` definira resurse pomoću Bicep-a.
- `azd infra generate` omogućuje pregled ili prilagodbu generirane infrastrukture.
- Kada je inicijalizirana, vaša postojeća aplikacija koristi isti tijek rada `azd up` / `azd down` kao i aplikacija temeljena na predlošku.

---

## 🔗 Navigacija

| Smjer | Lekcija |
|-----------|--------|
| **Prethodno** | [Vaš prvi projekt](first-project.md) |
| **Sljedeće** | [Razvojni kontejneri i Codespaces](dev-containers.md) |

## 📖 Povezani resursi

- [Osnove AZD-a](azd-basics.md)
- [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/README.md)
- [Konfiguracija i autentikacija](../chapter-03-configuration/authsecurity.md)
- [Prečac naredbi](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->