# Donesite vlastitu aplikaciju - Dodajte azd u postojeći projekt

**Navigacija poglavljem:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i Brzi početak
- **⬅️ Prethodno**: [Vaš prvi projekt](first-project.md)
- **➡️ Sljedeće**: [Razvojni kontejneri i Codespaces](dev-containers.md)

> Potvrđeno za `azd 1.25.6` u lipnju 2026.

## Uvod

U [Vašem prvom projektu](first-project.md) ste rasporedili aplikaciju započevši od predloška. Ali većinu vremena već imate aplikaciju—Node.js API, Python Flask servis, .NET web aplikaciju—u mapi na svom računalu. Ova lekcija pokazuje kako dodati azd u postojeći kod kako biste je mogli rasporediti s `azd up`, bez potrebe za predloškom.

## Ciljevi učenja

Do kraja ove lekcije ćete:
- Razumjeti tri načina za započeti azd projekt
- Pokrenuti `azd init` unutar postojećeg koda
- Razumjeti što `azure.yaml` i mapa `infra/` rade za vašu aplikaciju
- Znati kada dopustiti da azd generira infrastrukturu naspram pisanja vlastite
- Rasporediti svoju postojeću aplikaciju u Azure koristeći `azd up`

## Ishodi učenja

Nakon završetka ove lekcije, moći ćete:
- Inicijalizirati azd u projektu koji već imate
- Čitati i uređivati osnovnu datoteku `azure.yaml`
- Generirati početnu infrastrukturu pomoću `azd infra generate`
- Odabrati odgovarajući Azure host za svoju aplikaciju
- Rasporediti i očistiti vlastitu aplikaciju

---

## Tri načina za započeti azd projekt

| Početna točka | Naredba | Kada koristiti |
|----------------|---------|-------------|
| **Iz predloška** | `azd init --template <name>` | Učenje, ili početak nove aplikacije iz provjerenog primjera |
| **Iz postojećeg koda** | `azd init` (u mapi vašeg projekta) | Već imate aplikaciju i želite je rasporediti |
| **Iz Git repozitorija** | `azd init --from-code` (u kloniranom repo-u) | Uvođenje azd-a u postojeći repozitorij |

Već ste vježbali prvu opciju. Ova lekcija pokriva drugu — najčešći stvarni scenarij.

---

## Korak 1: Pokrenite `azd init` u svom projektu

Otvorite terminal **u mapi vašeg postojećeg projekta** i pokrenite:

```bash
cd my-existing-app
azd init
```

azd će pitati kako želite inicijalizirati. Odaberite:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Odaberite **"Koristi kod u trenutnom direktoriju."** azd zatim skenira vašu mapu, prepoznaje jezik i okvir (framework) te predlaže host.

### Što azd otkriva

azd traži pokazatelje poput `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ili `Dockerfile`, i predlaže odgovarajući Azure host:

| Vaša aplikacija | Vjerojatno otkriveni host |
|----------|----------------------|
| Node.js / Python / .NET web aplikacija | Azure App Service ili Container Apps |
| Aplikacija u kontejneru (`Dockerfile`) | Azure Container Apps |
| Aplikacija Functions | Azure Functions |
| Statijska stranica (izlaz builda React/Vue) | Azure Static Web Apps |

Potvrdite otkrivenu uslugu/e, i azd kreira potrebne datoteke.

---

## Korak 2: Razumijte što je azd stvorio

Nakon init-a, imat ćete dvije nove stvari u svom projektu:

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

Blok `services` je ključni dio: svaka stavka mapira mapu vašeg koda na Azure host. Ako vaša aplikacija ima i frontend i API, imat ćete dvije usluge.

### `infra/` — vaši Azure resursi kao kod

Mapa `infra/` sadrži Bicep datoteke koje definiraju Azure resurse koje vaša aplikacija treba (App Service, baza podataka itd.). Ne morate ih pisati ručno — azd generira radnu početnu točku. Kasnije ih *možete* urediti kako biste dodali resurse ili pojačali sigurnost (obrađeno u [Poglavlje 4](../chapter-04-infrastructure/README.md)).

> **Savjet:** Želite li vidjeti ili prilagoditi generiranu infrastrukturu prije raspoređivanja? Pokrenite `azd infra generate` (također dostupno kao `azd infra synth`) da zapišete IaC na disk kako biste ga pregledali i verzionirali.

---

## Korak 3: Postavite potrebnu konfiguraciju

Ako vaša aplikacija treba postavke ili tajne (npr. connection string, API ključ), nemojte ih hardkodirati. Koristite vrijednosti iz okoline:

```bash
# Stvori okruženje
azd env new dev

# Postavi vrijednost koja nije tajna
azd env set API_VERSION 1.0.0
```

Za stvarne tajne, pohranite ih u Key Vault i referencirajte ih iz svoje infrastrukture — pogledajte [Poglavlje 3: Konfiguracija i autentifikacija](../chapter-03-configuration/authsecurity.md).

---

## Korak 4: Raspoređivanje

Sada upotrijebite isti tijek rada koji već znate:

```bash
# Autentificirajte se (obavezno za azd)
azd auth login

# Pregledajte resurse koji će biti stvoreni
azd provision --preview

# Postavite infrastrukturu i implementirajte svoj kod
azd up
```

Kad završi, azd ispiše URL vaše aplikacije. Provjerite ga na isti način kao i svaku azd aplikaciju:

```bash
azd show           # prikaži krajnje točke
azd monitor --logs # provjeri zapise ako je potrebno
```

---

## Uobičajeni problemi pri prvom pokretanju

| Simptom | Vjerojatni uzrok | Rješenje |
|---------|--------------|-----|
| azd nije otkrio moju aplikaciju | Nedostaje manifest (npr. `package.json`) | Dodajte manifest ili odaberite host ručno tijekom `azd init` |
| Build ne uspijeva tijekom `azd up` | Aplikacija zahtijeva korak izgradnje | Dodajte `buildCommand`/`outputPath` pod servisom u `azure.yaml` |
| Aplikacija se pokreće ali vraća pogreške | Nedostaje konfiguracija/tajna | Postavite vrijednosti pomoću `azd env set` ili povežite Key Vault |
| Odabran pogrešan host | Automatsko otkrivanje je pogrešno odabralo | Uredite `host:` u `azure.yaml` i ponovo pokrenite `azd up` |

Za više, pogledajte [Poglavlje 7: Rješavanje problema](../chapter-07-troubleshooting/README.md).

---

## Čišćenje

```bash
azd down --force --purge
```

---

## Sažetak

- `azd init` → **"Koristi kod u trenutnom direktoriju"** dodaje azd aplikaciji koju već imate.
- `azure.yaml` mapira mape vašeg koda na Azure hostove; `infra/` definira resurse kao Bicep.
- `azd infra generate` vam omogućuje pregled ili prilagodbu generirane infrastrukture.
- Nakon inicijalizacije, vaša postojeća aplikacija koristi potpuno isti tijek rada `azd up` / `azd down` kao aplikacija temeljena na predlošku.

---

## 🔗 Navigacija

| Smjer | Lekcija |
|-----------|--------|
| **Prethodno** | [Vaš prvi projekt](first-project.md) |
| **Sljedeće** | [Razvojni kontejneri i Codespaces](dev-containers.md) |

## 📖 Povezani resursi

- [Osnove AZD-a](azd-basics.md)
- [Poglavlje 4: Infrastruktura kao kod](../chapter-04-infrastructure/README.md)
- [Konfiguracija i autentifikacija](../chapter-03-configuration/authsecurity.md)
- [Kratka referenca naredbi](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->