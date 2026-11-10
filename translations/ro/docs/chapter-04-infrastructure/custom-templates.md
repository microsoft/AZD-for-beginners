# Crearea propriului șablon azd

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca Cod & Implementare
- **⬅️ Anterior**: [Ghid de implementare](deployment-guide.md)
- **🚀 Capitolul următor**: [Capitolul 5: Soluții Multi-Agent](../chapter-05-multi-agent/README.md)

> Revizuit conform `azd 1.37.2` (Noiembrie 2026). Acesta este un **ghid de creare cu fișiere parțiale**, nu un șablon complet: trebuie să furnizați codul aplicației și `modules/web.bicep` cu mediul său, registrul, Container App și rezultatele înainte de implementare. Provizionarea Azure nu a fost executată în această revizuire.

## Introducere

Până acum ați *consumat* șabloane cu `azd init --template <name>`. Dar odată ce aveți un layout de proiect pe care echipa voastră îl agrează — să zicem, un Container App cu un Cosmos DB și monitorizarea potrivită — veți dori să-l transformați într-un șablon reutilizabil propriu. Un șablon este doar un depozit Git cu o structură predictibilă pe care azd știe să o citească. Această lecție vă arată cum să construiți unul de la zero, să-l testați și (opțional) să-l publicați în galeria comunității.

## Obiective de învățare

La finalul acestei lecții, veți:
- Înțelege ce face un folder să fie un „șablon azd”
- Cunoaște fișierele și structura de folder necesare
- Adăuga un `azure.yaml` și `infra/` pe care alții să le poată reutiliza
- Testa șablonul local înainte de a-l distribui
- Publica și (opțional) trimite la Awesome AZD

## Rezultate de învățare

După ce finalizați această lecție, veți fi capabili să:
- Scafoldați un nou depozit șablon
- Parametrizați infrastructura astfel încât să funcționeze în orice subscripție
- Validati un șablon cu `azd init` și `azd up`
- Adăugați metadatele cerute de galeria comunității

---

## Ce este, de fapt, un șablon?

Un șablon azd este **un depozit Git** care conține, minim:

| Fișier / folder | Scop | Necesare? |
|---------------|--------|-----------|
| `azure.yaml` | Descrie serviciile, gazdele și furnizorul infra | ✅ Da |
| `infra/` | Definiții de provizionare Bicep sau Terraform | Necesare pentru acest exemplu explicit-IaC; proiectele generate pot să nu le includă |
| `src/` (sau codul tău) | Codul aplicației implementat de azd | Necesare pentru serviciile bazate pe sursă; nu toate șabloanele conțin cod aplicație |
| `README.md` | Cum se folosește șablonul | ✅ Recomandat puternic |
| `.azdo/` sau `.github/` | Definiții pipeline CI/CD | Opțional |
| `.devcontainer/` | Mediu de dezvoltare reproducibil | Opțional |
| `azure.yaml` `metadata` | Informații de identitate/telemetrie șablon | Recomandat; publicarea unui repo Git nu îl cere |

Nu există magie aici: când rulați `azd init --template you/your-repo`, azd clona repo-ul și citește `azure.yaml`.

---

## Pasul 1: Scafoldați depozitul

Creați structura de foldere manual sau porniți de la un șablon minimal și editați:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Un layout tipic finalizat arată așa:

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Pasul 2: Scrieți `azure.yaml`

Aceasta este inima șablonului. Spune azd ce să implementeze și cum:

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Câmpul `metadata.template` este ceea ce folosește telemetria galeriei pentru a număra utilizarea. Folosiți convenția `name@version`.

---

## Pasul 3: Parametrizați infrastructura

Regula cea mai importantă pentru un șablon *reutilizabil*: **nu hardcodați niciodată nume, regiuni sau valori specifice subscripției.** Folosiți parametri și tiparul resource token pentru ca același șablon să funcționeze în subscripția oricui.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Două lucruri fac acest șablon prietenos:

1. **Tag-ul `azd-env-name`** — azd îl folosește pentru a urmări și curăța resursele per mediu.
2. **Token-ul de resursă `uniqueString(...)`** — produce un sufix hash stabil pentru a reduce coliziunile; nu garantează unicitatea globală.

`modules/web.bicep` lipsește și trebuie să accepte `name`, `location` și `tags`, să provizioneze mediul/registrul și aplicația Container Apps, să eticheteze aplicația cu `azd-service-name: web` și să exporte `uri`. De asemenea, trebuie să expună valorile registry necesare pentru fluxul ales de build/deploy (de exemplu `AZURE_CONTAINER_REGISTRY_ENDPOINT` din modulul rădăcină). Doar un output endpoint nu conectează descoperirea serviciului, setările aplicației sau autentificarea registrului.

Furnizați un fișier de parametri corespondent care citește valorile pe care azd le injectează din mediu:

Salvați următorul ca `infra/main.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd înlocuiește automat `${AZURE_ENV_NAME}` și `${AZURE_LOCATION}` din mediul curent.

---

## Pasul 4: Testați șablonul local

Înainte de a distribui, demonstrați că șablonul funcționează de la o stare curată.

**Testați din folderul local** (nu este nevoie să faceți push pe Git):

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Apoi testați dezinstalarea** — un șablon bun curăță complet:

```bash
azd down --force --purge
```

Dacă `azd down` lasă resurse în urmă, verificați descoperirea grupului de resurse/mediu, resurse externe/partajate, permisiuni, blocaje și protecția de purjare. `--purge` nu șterge starea locală `.azure/`.

> **Sfat:** după ce ați furnizat toate fișierele lipsă, rulați `azd provision --preview` mai întâi. Inspectați hook-urile înainte de preview deoarece ele pot executa comenzi cu efecte secundare. Preview nu este o estimare de preț sau o garanție că provizionarea va reuși.

---

## Pasul 5: Publicați șablonul

Împingeți depozitul pe GitHub (public dacă vreți ca alții să-l folosească):

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

Oricine îl poate folosi acum:

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Pasul 6 (Opțional): Trimiteți la Awesome AZD

Galeria [Awesome AZD](https://azure.github.io/awesome-azd/) listează șabloanele comunității. Pentru a fi listat, repo-ul vostru ar trebui să includă:

- ✅ Un `README.md` clar cu cerințe, un diagramă de arhitectură și note despre costuri
- ✅ Un `azure.yaml` funcțional cu `metadata.template`
- ✅ Infrastructură care se provizionează curat într-o subscripție nouă
- ✅ Un fișier `LICENSE`
- ✅ (Recomandat) Un `.devcontainer/` pentru Codespaces cu un singur click

Trimiteți trimițând un pull request care adaugă șablonul vostru în fișierul de date al galeriei, urmând ghidul de contribuție de la depozitul [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Capcane comune

| Capcană | Remediere |
|---------|----------|
| Nume de resurse hardcodate | Folosiți token-ul de resursă `uniqueString()` |
| `azd down` lasă resurse în urmă | Etichetați fiecare resursă (sau grupul de resurse) cu `azd-env-name` |
| Șablonul funcționează pentru tine, dar nu și pentru alții | Eliminați ID-urile de subscripție, ID-urile de tenant și presupunerile legate de regiune |
| Output-urile nu sunt conectate în aplicație | Potriviți `azd-service-name`/`resourceName` pentru implementare și mapați output-urile explicit în setările aplicației |
| Trimiterea în galerie a fost respinsă | Adăugați `README.md`, `LICENSE`, și `metadata.template` |

---

## Rezumat

- Un șablon este doar un repo Git cu `azure.yaml`, `infra/` și codul tău.
- Parametrizați totul — nume, regiuni și ID-uri — astfel încât să ruleze oriunde.
- Etichetați întotdeauna resursele cu `azd-env-name` ca `azd down` să funcționeze.
- Testați local cu `azd init --template <local-path>` înainte de a publica.
- Adăugați metadate și un README pentru a trimite la Awesome AZD.

---

## 🔗 Navigare

| Direcție | Resursă |
|-----------|---------|
| **Anterior** | [Ghid de implementare](deployment-guide.md) |
| **Acasă capitol** | [Capitolul 4: Infrastructură ca Cod](README.md) |
| **Capitolul următor** | [Capitolul 5: Soluții Multi-Agent](../chapter-05-multi-agent/README.md) |

## 📖 Resurse relevante

- [Provizionare resurse](provisioning.md)
- [Galeria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentația oficială azd pentru șabloane](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->