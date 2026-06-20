# Naudokite savo programą - pridėkite azd prie esamo projekto

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Esamas skyrius**: Skyrius 1 - Pagrindai ir greitas startas
- **⬅️ Ankstesnis**: [Jūsų pirmasis projektas](first-project.md)
- **➡️ Kitas**: [Dev konteineriai ir Codespaces](dev-containers.md)

> Patikrinta su `azd 1.25.6` 2026 m. birželį.

## Įvadas

In [Jūsų pirmasis projektas](first-project.md) you deployed an app by starting from a template. But most of the time you already *have* an app—a Node.js API, a Python Flask service, a .NET web app—sitting in a folder on your machine. This lesson shows how to add azd to that existing code so you can deploy it with `azd up`, no template required.

## Mokymosi tikslai

By the end of this lesson, you will:
- Understand the three ways to start an azd project
- Run `azd init` inside an existing codebase
- Understand what `azure.yaml` and the `infra/` folder do for your app
- Know when to let azd generate infrastructure vs. write your own
- Deploy your existing app to Azure with `azd up`

## Mokymosi rezultatai

After completing this lesson, you will be able to:
- Initialize azd in a project you already have
- Read and edit a basic `azure.yaml` file
- Generate starter infrastructure with `azd infra generate`
- Choose an appropriate Azure host for your app
- Deploy and clean up your own application

---

## Trys būdai pradėti azd projektą

| Pradžia | Komanda | Kada naudoti |
|----------------|---------|-------------|
| **Iš šablono** | `azd init --template <name>` | Mokymuisi arba pradedant naują programą iš patikrinto pavyzdžio |
| **Iš jau turimo kodo** | `azd init` (savo projekto aplanke) | Jau turite programą ir norite ją diegti |
| **Iš Git saugyklos** | `azd init --from-code` (klonuotoje saugykloje) | Diegiant azd esamai saugyklai |

You already practiced the first option. This lesson covers the second—the most common real-world scenario.

---

## 1 žingsnis: Paleiskite `azd init` savo projekte

Open a terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Pick **"Use code in the current directory."** azd then scans your folder, detects your language and framework, and proposes a host.

### Ką aptinka azd

azd looks for signals like `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, or a `Dockerfile`, and suggests a matching Azure host:

| Jūsų programa | Tikėtinas aptiktas talpinimo sprendimas |
|----------|----------------------|
| Node.js / Python / .NET žiniatinklio programa | Azure App Service arba Container Apps |
| Konteinerizuota programa (`Dockerfile`) | Azure Container Apps |
| Funkcijų programa | Azure Functions |
| Statinis tinklalapis (React/Vue build išvestis) | Azure Static Web Apps |

Patvirtinkite aptiktas paslaugas, ir azd sukuria jums reikalingus failus.

---

## 2 žingsnis: Supraskite, ką sukūrė azd

Po init, turėsite dvi naujas dalis savo projekte:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — projekto apibrėžimas

This is the heart of an azd project. A minimal one looks like this:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

The `services` block is the key part: each entry maps a folder of your code to an Azure host. If your app has both a frontend and an API, you'll have two services.

### `infra/` — jūsų Azure ištekliai kaip kodas

The `infra/` folder holds Bicep files that define the Azure resources your app needs (the App Service, the database, etc.). You don't have to write these by hand—azd generates a working starting point. You *can* edit them later to add resources or tighten security (aptarta [4 skyriuje](../chapter-04-infrastructure/README.md)).

> **Patarimas:** Norite pamatyti arba pritaikyti sugeneruotą infrastruktūrą prieš diegiant? Paleiskite `azd infra generate` (taip pat pasiekiama kaip `azd infra synth`), kad užrašytumėte IaC į diską ir galėtumėte peržiūrėti bei valdyti versijas.

---

## 3 žingsnis: Nustatykite reikalingą konfigūraciją

If your app needs settings or secrets (a connection string, an API key), don't hardcode them. Use environment values:

```bash
# Sukurti aplinką
azd env new dev

# Nustatyti neslaptą reikšmę
azd env set API_VERSION 1.0.0
```

For real secrets, store them in Key Vault and reference them from your infrastructure—see [3 skyrius: Konfigūracija ir autentifikacija](../chapter-03-configuration/authsecurity.md).

---

## 4 žingsnis: Diegimas

Now use the same workflow you already know:

```bash
# Autentifikuoti (reikalinga azd)
azd auth login

# Peržiūrėti resursus, kurie bus sukurti
azd provision --preview

# Paruošti infrastruktūrą ir diegti jūsų kodą
azd up
```

When it finishes, azd prints your app's URL. Verify it the same way as any azd app:

```bash
azd show           # parodyti galinius taškus
azd monitor --logs # patikrinkite žurnalus, jei reikia
```

---

## Dažnos pradedančiojo problemos

| Simptomas | Tikėtina priežastis | Sprendimas |
|---------|--------------|-----|
| azd neaptiko mano programos | Trūksta manifesto (pvz., `package.json`) | Pridėkite manifestą arba pasirinkite host'ą rankiniu būdu per `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

For more, see [7 skyrius: Trikčių šalinimas](../chapter-07-troubleshooting/README.md).

---

## Išvalymas

```bash
azd down --force --purge
```

---

## Santrauka

- `azd init` → **"Naudoti kodą esamame kataloge"** prideda azd prie programos, kurią jau turite.
- `azure.yaml` susieja jūsų kodo aplankus su Azure talpinimo sprendimais; `infra/` apibrėžia išteklius kaip Bicep.
- `azd infra generate` leidžia peržiūrėti arba pritaikyti sugeneruotą infrastruktūrą.
- Kartą inicializavus, jūsų esama programa naudoja tą patį `azd up` / `azd down` darbo eigą kaip programos, sukurtos iš šablono.

---

## 🔗 Navigacija

| Kryptis | Pamoka |
|-----------|--------|
| **Ankstesnis** | [Jūsų pirmasis projektas](first-project.md) |
| **Kitas** | [Dev konteineriai ir Codespaces](dev-containers.md) |

## 📖 Susiję ištekliai

- [AZD pagrindai](azd-basics.md)
- [4 skyrius: Infrastruktūra kaip kodas](../chapter-04-infrastructure/README.md)
- [Konfigūracija ir autentifikacija](../chapter-03-configuration/authsecurity.md)
- [Komandų atmintinė](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->