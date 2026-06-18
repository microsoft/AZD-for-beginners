# Crearea propriului șablon azd

**Navigare capitol:**
- **📚 Pagina cursului**: [AZD For Beginners](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca Cod și Implementare
- **⬅️ Anterior**: [Deployment Guide](deployment-guide.md)
- **🚀 Capitolul următor**: [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md)

> Validat cu `azd 1.25.6` în iunie 2026.

## Introducere

Până acum ați folosit șabloane cu `azd init --template <name>`. Dar odată ce aveți un aranjament de proiect care place echipei voastre — de exemplu, o Container App cu un Cosmos DB și monitorizarea potrivită — veți dori să îl transformați într-un șablon reutilizabil propriu. Un șablon este doar un repository Git cu o structură previzibilă pe care azd știe să o citească. Această lecție vă arată cum să construiți unul de la zero, să îl testați și (opțional) să îl publicați în galeria comunității.

## Obiective de învățare

La sfârșitul acestei lecții, veți:
- Înțelege ce face ca un folder să fie un "șablon azd"
- Cunoaște fișierele necesare și structura de foldere
- Adăuga un `azure.yaml` și `infra/` pe care alți utilizatori le pot reutiliza
- Testa șablonul local înainte de a-l distribui
- Publica șablonul și (opțional) îl trimite la Awesome AZD

## Rezultatele învățării

După finalizarea acestei lecții, veți putea:
- Genera un nou repository de șabloane
- Parametriza infrastructura astfel încât să funcționeze în orice abonament
- Valida un șablon cu `azd init` și `azd up`
- Adăuga metadatele cerute de galeria comunității

---

## Ce este, de fapt, un șablon?

Un șablon azd este **un repository Git** care conține, cel puțin:

| Fișier / folder | Scop | Obligatoriu? |
|---------------|---------|-----------|
| `azure.yaml` | Descrie serviciile, gazdele și furnizorul de infrastructură | ✅ Da |
| `infra/` | Bicep, Terraform sau Pulumi care provisionează resursele | ✅ Da |
| `src/` (sau codul vostru) | Codul aplicației pe care azd îl deployează | ✅ Da |
| `README.md` | Cum se folosește șablonul | ✅ Puternic recomandat |
| `.azdo/` sau `.github/` | Definiții pipeline CI/CD | Opțional |
| `.devcontainer/` | Mediu de dezvoltare reproducibil | Opțional |
| `azure.yaml` `metadata` | Informații pentru galerie + telemetrie | Opțional (necesar pentru publicare) |

Nu e nimic magic aici: când rulați `azd init --template you/your-repo`, azd clonează repo-ul și citește `azure.yaml`.

---

## Pasul 1: Schițarea depozitului

Creați structura de foldere manual sau porniți de la un șablon minim și editați-l:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Creează aspectul standard
mkdir -p src infra
```

Un layout tipic final arată astfel:

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
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Câmpul `metadata.template` este cel pe care telemetria galeriei îl folosește pentru a număra utilizările. Folosiți convenția `name@version`.

---

## Pasul 3: Parametrizați infrastructura

Regula cea mai importantă pentru un șablon *reutilizabil*: **nu hardcodați niciodată nume, regiuni sau valori specifice abonamentului.** Folosiți parametri și patternul token-ului de resursă astfel încât același șablon să funcționeze în abonamentul oricui.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Două lucruri fac ca acest șablon să fie prietenos pentru reutilizare:

1. **`azd-env-name` tag** — azd îl folosește pentru a urmări și a curăța resursele per mediu.
2. **`uniqueString(...)` resource token** — produce un sufix stabil, unic la nivel global, astfel încât numele să nu intre în coliziune.

Furnizați un fișier de parametri corespunzător care citește valorile pe care azd le injectează din mediu:

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd înlocuiește `${AZURE_ENV_NAME}` și `${AZURE_LOCATION}` din mediul curent automat.

---

## Pasul 4: Testați șablonul local

Înainte de a-l distribui, demonstrați că șablonul funcționează dintr-o stare curată.

**Testați din folderul local** (nu este nevoie de push către Git):

```bash
# Dintr-un director gol, inițializează folosind calea șablonului local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Configurează resursele și implementează cap-coadă
azd auth login
azd up
```

**Apoi testați curățarea** — un șablon bun curăță complet resursele:

```bash
azd down --force --purge
```

Dacă `azd down` lasă resurse în urmă, probabil ați omis tag-ul `azd-env-name` pe o resursă.

> **Sfat:** rulați `azd provision --preview` mai întâi. Efectuează o analiză what-if și evidențiază erorile din șablon înainte ca vreo resursă să fie creată.

---

## Pasul 5: Publicați șablonul

Împingeți repository-ul pe GitHub (public dacă doriți ca alții să-l folosească):

```bash
gh repo create my-azd-template --public --source=. --push
```

Oricine îl poate folosi acum:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Pasul 6 (Opțional): Trimiteți la Awesome AZD

Galeria [Awesome AZD](https://azure.github.io/awesome-azd/) listează șabloane comunitare. Pentru a fi listat, repo-ul dvs. ar trebui să includă:

- ✅ Un `README.md` clar cu prerechizite, un diagramă de arhitectură și note despre costuri
- ✅ Un `azure.yaml` funcțional cu `metadata.template`
- ✅ Infrastructură care se provisionează curat într-un abonament nou
- ✅ Un fișier `LICENSE`
- ✅ (Recomandat) Un `.devcontainer/` pentru Codespaces cu un singur click

Trimiteți prin deschiderea unui pull request care adaugă șablonul dvs. în fișierul de date al galeriei, urmând ghidul de contribuție din repository-ul [Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Capcane comune

| Capcană | Remediu |
|---------|-----|
| Nume de resurse hardcodate | Folosiți token-ul de resursă `uniqueString()` |
| `azd down` lasă resurse | Tag-uiți fiecare resursă (sau grupul de resurse) cu `azd-env-name` |
| Șablonul funcționează pentru dvs., dar nu și pentru alții | Eliminați ID-urile de abonament, ID-urile de tenant și presupunerile privind regiunea |
| Outputs nerelegate în aplicație | Exportați `SERVICE_<NAME>_ENDPOINT_URL` și alte output-uri `AZURE_*` |
| Trimiterea la galerie respinsă | Adăugați `README.md`, `LICENSE` și `metadata.template` |

---

## Rezumat

- Un șablon este doar un repo Git cu `azure.yaml`, `infra/` și codul vostru.
- Parametrizați totul — nume, regiuni și ID-uri — astfel încât să ruleze oriunde.
- Marcați întotdeauna resursele cu `azd-env-name` astfel încât `azd down` să funcționeze.
- Testați local cu `azd init --template <local-path>` înainte de publicare.
- Adăugați metadate și un README pentru a trimite la Awesome AZD.

---

## 🔗 Navigare

| Direcție | Resursă |
|-----------|----------|
| **Anterior** | [Deployment Guide](deployment-guide.md) |
| **Pagina capitolului** | [Chapter 4: Infrastructure as Code](README.md) |
| **Capitolul următor** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

## 📖 Resurse conexe

- [Provisioning Resources](provisioning.md)
- [Awesome AZD Gallery](https://azure.github.io/awesome-azd/)
- [Documentația oficială pentru șabloane azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->