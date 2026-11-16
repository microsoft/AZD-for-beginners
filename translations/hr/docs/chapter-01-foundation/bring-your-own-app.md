# Donesi svoju aplikaciju - Dodajte azd u postojeći projekt

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Vaš prvi projekt](first-project.md)
- **➡️ Sljedeće**: [Razvojni kontejneri i Codespaces](dev-containers.md)

> Cilj pregleda naredbi i konfiguracije: `azd 1.37.2` (studeni 2026.). Generirane datoteke ovise o otkrivenoj aplikaciji; u ovom pregledu nije izvršeno Azure postavljanje.

## Uvod

U [Vašem prvom projektu](first-project.md) rasporedili ste aplikaciju započinjući iz predloška. Ali većinu vremena već *imate* aplikaciju—Node.js API, Python Flask servis, .NET web aplikaciju—smještenu u mapi na vašem računalu. Ova lekcija pokazuje kako dodati azd toj postojećoj aplikaciji kako biste je mogli rasporediti s `azd up`, bez potrebe za predloškom.

## Ciljevi učenja

Do kraja ove lekcije ćete:
- Razumjeti tri načina pokretanja azd projekta
- Pokrenuti `azd init` unutar postojeće baze koda
- Razumjeti što `azure.yaml` i mapa `infra/` rade za vašu aplikaciju
- Znati kada pustiti azd da generira infrastrukturu, a kada sami pisati
- Rasporediti svoju postojeću aplikaciju na Azure pomoću `azd up`

## Ishodi učenja

Nakon završetka ove lekcije bit ćete sposobni:
- Inicijalizirati azd u projektu koji već imate
- Čitati i uređivati osnovnu datoteku `azure.yaml`
- Generirati početnu infrastrukturu pomoću `azd infra generate`
- Odabrati prikladnog Azure domaćina za vašu aplikaciju
- Rasporediti i očistiti vlastitu aplikaciju

---

## Tri načina za pokretanje azd projekta

| Polazna točka | Naredba | Kada koristiti |
|----------------|---------|-------------|
| **Iz predloška** | `azd init --template <name> .` (prazni direktorij) | Učenje ili pokretanje nove aplikacije iz provjerenog primjera |
| **Iz postojećeg koda** | `azd init` (u mapi vašeg projekta) | Već imate aplikaciju i želite je rasporediti |
| **Iz Git repozitorija** | `azd init --from-code` (u kloniranom repozitoriju) | Usvajanje azd za postojeći repozitorij |

Već ste isprobali prvu opciju. Ova lekcija pokriva drugu—najčešći scenarij u stvarnom svijetu.

---

## Korak 1: Pokrenite `azd init` u vašem projektu

Otvorite terminal **unutar mape vašeg postojećeg projekta** i pokrenite:

```bash
cd my-existing-app
azd init
```

azd će upitati kako želite inicijalizirati. Odaberite:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Odaberite **"Koristi kod u trenutnom direktoriju."** zatim azd skenira vašu mapu, otkriva jezik i okvir te predlaže domaćina.

### Što azd otkriva

azd traži signale aplikacije poput `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` ili `Dockerfile`. Tok od koda nije čarobnjak za odabir domaćina za svaki podržani cilj raspoređivanja:

| Vaša aplikacija | Vjerojatno otkriveni domaćin |
|----------|----------------------|
| Podržana Node.js / Python / .NET web aplikacija | Obično Azure Container Apps; pregledajte generirani opis |
| Kontejnerizirana aplikacija (`Dockerfile`) | Azure Container Apps |
| Function app ili Static Web Apps projekt | Koristite odgovarajući predložak ili napišite `azure.yaml` i infrastrukturu ako tok od koda ne podržava vaš raspored |

Potvrdite otkrivene usluge, a azd generira potrebne datoteke.

---

## Korak 2: Razumijevanje što je azd stvorio

Nakon inicijalizacije, pregledajte `azure.yaml`. Generirana infrastruktura može ostati implicitna dok ne pokrenete `azd infra generate`; nemojte pretpostaviti da `infra/` već postoji:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definicija projekta

Ovo je srce azd projekta. Sljedeća **ilustrativna definicija App Servicea** zahtijeva odgovarajuću App Service infrastrukturu; nije razlog za promjenu generiranog domaćina Container Apps bez promjene infrastrukture:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je ključni dio: svaki unos preslikava mapu vašeg koda na Azure domaćina. Ako vaša aplikacija ima i frontend i API, imat ćete dvije usluge.

### `infra/` — vaši Azure resursi kao kod

Mapa `infra/` sadrži Bicep datoteke koje definiraju Azure resurse koje vaša aplikacija treba (App Service, bazu podataka itd.). Ne morate ih pisati ručno—azd generira radnu početnu točku. Kasnije ih *možete* uređivati da dodate resurse ili pooštrite sigurnost (objašnjeno u [Poglavlju 4](../chapter-04-infrastructure/README.md)).

> **Savjet:** Želite li vidjeti ili prilagoditi generiranu infrastrukturu prije raspoređivanja? Pokrenite `azd infra generate` (dostupno i kao `azd infra synth`) za zapisivanje IaC na disk radi pregleda i upravljanja verzijama.

---

## Korak 3: Postavite potrebnu konfiguraciju

Ako vaša aplikacija treba postavke ili tajne (npr. niz veze, API ključ), nemojte ih tvrdo kodirati. Koristite vrijednosti okoline:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Ovo pohranjuje samo lokalnu vrijednost. Za utjecaj na aplikaciju, eksplicitno je koristite u parametrima infrastrukture, podržanoj postavci usluge ili hooku; postavljanje proizvoljne varijable ne konfigurira raspoređeno runtime okruženje.

Za prave tajne, pohranite ih u Key Vault i referencirajte ih iz vaše infrastrukture—vidi [Poglavlje 3: Konfiguracija i autentikacija](../chapter-03-configuration/authsecurity.md).

---

## Korak 4: Raspoređivanje

Sada upotrijebite isti tijek rada koji već znate:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Kad završi, azd ispisuje URL vaše aplikacije. Provjerite ga isto kao i bilo koju azd aplikaciju:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Česti problemi pri prvom korištenju

| Simptomi | Vjerojatan uzrok | Rješenje |
|---------|--------------|-----|
| azd nije otkrio moju aplikaciju | Nedostaje manifest (npr. `package.json`) | Dodajte manifest ili ručno odaberite domaćina tijekom `azd init` |
| Izgradnja ne uspijeva tijekom `azd up` | Aplikacija treba korak izgradnje | Konfigurirajte pakete aplikacije ili `prepackage` hook za uslugu; koristite `dist` za izlaz raspoređivanja, ne `buildCommand`/`outputPath` |
| Aplikacija se pokreće, ali vraća pogreške | Nedostaju konfiguracija/tajne vrijednosti | Povežite vrijednosti u runtime postavke aplikacije ili Key Vault referencu; `azd env set` sam po sebi nije dovoljan |
| Odabran je pogrešan domaćin | Automatsko otkrivanje ne odgovara vašim potrebama | Promijenite oba `host:` i odgovarajuću infrastrukturu ili odaberite odgovarajući predložak |

Za više informacija pogledajte [Poglavlje 7: Rješavanje problema](../chapter-07-troubleshooting/README.md).

---

## Čišćenje

```bash
azd down --force --purge
```

---

## Sažetak

- `azd init` → **"Koristi kod u trenutnom direktoriju"** dodaje azd u aplikaciju koju već imate.
- `azure.yaml` preslikava vaše mape koda na Azure domaćine; `infra/` definira resurse kao Bicep.
- `azd infra generate` omogućuje pregled ili prilagodbu generirane infrastrukture.
- Jednom inicijalizirana, vaša postojeća aplikacija koristi isti `azd up` / `azd down` tijek rada kao aplikacija temeljena na predlošku.

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