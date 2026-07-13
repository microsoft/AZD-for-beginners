# Crearea propriului șablon azd

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 4 - Infrastructură ca și Cod & Implementare
- **⬅️ Anterior**: [Ghid de implementare](deployment-guide.md)
- **🚀 Capitolul următor**: [Capitolul 5: Soluții Multi-Agent](../chapter-05-multi-agent/README.md)

> Validat cu `azd 1.27.1` în iulie 2026.

## Introducere

Până acum ai *consumat* șabloane cu `azd init --template <name>`. Dar odată ce ai un layout de proiect care place echipei tale — să zicem, o Aplicație Container cu Cosmos DB și monitorizarea potrivită — vei dori să îl transformi într-un șablon reutilizabil al tău. Un șablon este doar un depozit Git cu o structură previzibilă pe care azd știe cum să o citească. Această lecție îți arată cum să construiești unul de la zero, să îl testezi și (opțional) să îl publici în galeria comunității.

## Obiective de învățare

La finalul acestei lecții, vei:
- Înțelege ce transformă un folder într-un "șablon azd"
- Cunoaște fișierele și structura folderului necesare
- Adăuga un `azure.yaml` și `infra/` pe care alții să le poată reutiliza
- Testa șablonul local înainte de a-l partaja
- Publica și (opțional) să-l trimiți în Awesome AZD

## Rezultate de învățare

După ce termini această lecție, vei putea:
- Să faci scafolding unui nou depozit de șablon
- Să parametrizezi infrastructura astfel încât să funcționeze în orice abonament
- Să validezi un șablon cu `azd init` și `azd up`
- Să adaugi metadatele pe care galeria comunității le cere

---

## Ce este un șablon, de fapt?

Un șablon azd este **un depozit Git** care conține, minim:

| Fișier / folder | Scop | Necesitate? |
|---------------|---------|-----------|
| `azure.yaml` | Descrie servicii, gazde și furnizor de infrastructură | ✅ Da |
| `infra/` | Bicep, Terraform sau Pulumi care creează resurse | ✅ Da |
| `src/` (sau codul tău) | Codul aplicației pe care azd o implementează | ✅ Da |
| `README.md` | Cum se folosește șablonul | ✅ Foarte recomandat |
| `.azdo/` sau `.github/` | Definiții pipeline CI/CD | Opțional |
| `.devcontainer/` | Mediu de dezvoltare reproductibil | Opțional |
| `azure.yaml` `metadata` | Info galerie + telemetrie | Opțional (necesar pentru publicare) |

Nu este nimic magic aici: când rulezi `azd init --template you/your-repo`, azd clonează repo-ul și citește `azure.yaml`.

---

## Pasul 1: Crearea scheletului depozitului

Creează structura folderelor manual sau pornește de la un șablon minimal și editează:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Creează aspectul standard
mkdir -p src infra
```

Un layout final tipic arată așa:

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

## Pasul 2: Scrie `azure.yaml`

Acesta este nucleul șablonului. Spune azd ce să implementeze și cum:

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

> Câmpul `metadata.template` este ce folosește telemetria galeriei pentru a calcula utilizarea. Folosește convenția `name@version`.

---

## Pasul 3: Parametrizează infrastructura

Regula cea mai importantă pentru un șablon *reutilizabil*: **nu codifica niciodată nume, regiuni sau valori specifice abonamentului.** Folosește parametri și modelul tokenului de resursă astfel încât același șablon să funcționeze în orice abonament al oricui.

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

Două lucruri fac acest șablon prietenos:

1. **Eticheta `azd-env-name`** — azd o folosește pentru a urmări și a curăța resursele pe mediu.
2. **Tokenul de resursă `uniqueString(...)`** — produce un sufix stabil, unic global ca numele să nu se ciocnească.

Furnizează un fișier de parametri corespunzător care citește valorile inserate de azd din mediu:

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

azd înlocuiește automat `${AZURE_ENV_NAME}` și `${AZURE_LOCATION}` din mediul curent.

---

## Pasul 4: Testează-ți șablonul local

Înainte de a partaja, dovedește că șablonul funcționează dintr-o stare curată.

**Testează din folderul local** (nu este necesar push Git):

```bash
# Dintr-un director gol, inițializează folosind calea șablonului local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionare + implementare de la început până la sfârșit
azd auth login
azd up
```

**Apoi testează dezmembrarea** — un șablon bun curăță tot complet:

```bash
azd down --force --purge
```

Dacă `azd down` lasă resurse în urmă, probabil ai omis eticheta `azd-env-name` pe o resursă.

> **Sfat:** rulează mai întâi `azd provision --preview`. Execută un what-if și afișează erorile șablonului înainte de a crea ceva resursă.

---

## Pasul 5: Publică șablonul

Publică depozitul pe GitHub (public dacă vrei ca alții să-l folosească):

```bash
gh repo create my-azd-template --public --source=. --push
```

Acum oricine îl poate folosi:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Pasul 6 (Opțional): Trimite în Awesome AZD

[Galeria Awesome AZD](https://azure.github.io/awesome-azd/) listează șabloane comunitare. Pentru a fi listat, repo-ul tău ar trebui să includă:

- ✅ Un `README.md` clar cu cerințe, un diagramă de arhitectură și note despre costuri
- ✅ Un `azure.yaml` funcțional cu `metadata.template`
- ✅ Infrastructură care se provisionează curat în un abonament nou
- ✅ Un fișier `LICENSE`
- ✅ (Recomandat) Un `.devcontainer/` pentru Codespaces cu un singur clic

Trimite prin deschiderea unui pull request care adaugă șablonul tău în fișierul de date al galeriei, urmând ghidul de contribuție din [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Capcane comune

| Capcană | Corectare |
|---------|-----|
| Nume de resurse codificate fix | Folosește tokenul de resursă `uniqueString()` |
| `azd down` lasă resurse în urmă | Etichetează fiecare resursă (sau grupul de resurse) cu `azd-env-name` |
| Șablonul funcționează pentru tine, dar nu și pentru alții | Scoate ID-urile de abonament, de tenant și presupunerile legate de regiune |
| Output-urile nu sunt conectate în aplicație | Exportă `SERVICE_<NAME>_ENDPOINT_URL` și alte output-uri `AZURE_*` |
| Trimiterea pentru galerie respinsă | Adaugă `README.md`, `LICENSE` și `metadata.template` |

---

## Rezumat

- Un șablon este doar un repo Git cu `azure.yaml`, `infra/` și codul tău.
- Parametrizează totul — nume, regiuni și ID-uri — pentru a rula oriunde.
- Etichetează întotdeauna resursele cu `azd-env-name` ca să funcționeze `azd down`.
- Testează local cu `azd init --template <local-path>` înainte de publicare.
- Adaugă metadate și un README ca să poți trimite în Awesome AZD.

---

## 🔗 Navigare

| Direcție | Resursă |
|-----------|----------|
| **Anterior** | [Ghid de implementare](deployment-guide.md) |
| **Acasă capitol** | [Capitolul 4: Infrastructură ca Cod](README.md) |
| **Capitolul următor** | [Capitolul 5: Soluții Multi-Agent](../chapter-05-multi-agent/README.md) |

## 📖 Resurse conexe

- [Provisionarea resurselor](provisioning.md)
- [Galeria Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentația oficială azd pentru şabloane](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->