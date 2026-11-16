# Vaš prvi projekt - praktični vodič

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Prinesi svojo aplikacijo](bring-your-own-app.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: AI-First razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli v vaš prvi projekt z Azure Developer CLI! Postavili boste aplikacijo todo z React sprednjim delom, Node.js API-jem in Azure Cosmos DB. Predloga ohranja zgodovinsko ime `todo-nodejs-mongo`; njena trenutna infrastruktura uporablja Cosmos DB za NoSQL, zato preglejte preneseni README in `infra/` namesto, da iz imena sklepate o API-ju baze podatkov.

> Pregledano v skladu z `azd 1.37.2` in javno predlogo novembra 2026. Spodnji primeri uporabljajo Bash; za izločanje JSON je potreben tudi `jq`. Implementacije Azure povzročajo stroške in med tem pregledom niso bile izvedene.

## Cilji učenja

Z zaključkom tega vodiča boste:
- Obvladali postopek inicializacije projekta azd s pomočjo predlog
- Razumeli strukturo projekta Azure Developer CLI in konfiguracijske datoteke
- Izvedli popolno implementacijo aplikacije v Azure z zagotavljanjem infrastrukture
- Uporabili strategije za posodobitve in ponovno implementacijo aplikacije
- Upravljali več okolij za razvoj in testiranje
- Uporabili prakse čiščenja virov in upravljanja stroškov

## Rezultati učenja

Po zaključku boste sposobni:
- Neodvisno inicializirati in konfigurirati projekte azd iz predlog
- Učinkovito navigirati po strukturah projektov azd in jih spreminjati
- Implementirati aplikacije polnega sklada v Azure z enim ukazom
- Reševati pogoste napake pri implementaciji in težave z avtentikacijo
- Upravljati več okolij Azure za različne faze implementacije
- Uvesti nenehne poteke dela za implementacijo posodobitev aplikacij

## Začetek

### Kontrolni seznam predpogojev
- ✅ Azure Developer CLI nameščen ([Navodila za namestitev](installation.md))
- ✅ Opravljena avtentikacija AZD z `azd auth login`
- ✅ Git nameščen na vašem sistemu
- ✅ Node.js 22 LTS (ali podprta različica zahtevana s predlogo)
- ✅ Visual Studio Code (priporočeno)

Pred nadaljevanjem zaženite validator nastavitev iz korenskega imenika repozitorija:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Preverite svojo nastavitev
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Preverite opcijsko avtentikacijo Azure CLI

```bash
az account show
```

### Preverite različico Node.js
```bash
node --version
```

## 1. korak: Izberite in inicializirajte predlogo

Začnimo s priljubljeno predlogo aplikacije todo, ki vključuje React sprednji del in Node.js API zadnji del.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Kaj se je pravkar zgodilo?
- Predloga je bila prenesena v vaš lokalni imenik
- Ustvarjena je bila datoteka `azure.yaml` z definicijami storitev
- Nastavljena je bila infrastruktura v imeniku `infra/`
- Ustvarjena je bila konfiguracija okolja

## 2. korak: Raziščite strukturo projekta

Poglejmo, kaj je azd ustvaril za nas:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Videli boste:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Ključne datoteke, ki jih je treba razumeti

**azure.yaml** - Srce vašega azd projekta:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 3. korak: Prilagodite svoj projekt (neobvezno)

Pred implementacijo lahko prilagodite aplikacijo:

### Spremenite sprednji del
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Naredite enostavno spremembo:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigurirajte spremenljivke okolja
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Ti dve prilagojeni vrednosti prikazujeta samo lokalno shranjevanje. Osnovna predloga ne uporablja `WEBSITE_TITLE` ali `API_VERSION`, zato ne spreminjata aplikacije. Jasna sprememba vira zgoraj spremeni prikazano naslovno vrstico.

## 4. korak: Implementirajte na Azure

Zdaj pa razburljiv del - implementirajte vse v Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Kaj se dogaja med implementacijo?

Potek dela zagotavlja infrastrukturo in pakira/implementira kodo. Natančen vrstni red je mogoče prilagoditi preko `workflows.up` v `azure.yaml`; ta predloga določa najprej zagotavljanje, nato implementacijo. Ne zanašajte se na enoten univerzalni vrstni red faz za vse predloge.

### Pričakovani izhod
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5. korak: Preizkusite svojo aplikacijo

### Dostop do vaše aplikacije
Kliknite na URL, ki je prikazan v izhodu implementacije, ali ga pridobite kadarkoli:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Preizkusite aplikacijo Todo
1. **Dodajte nalogo** - Kliknite "Dodaj Todo" in vnesite opravilo
2. **Označite kot opravljeno** - Označite dokončane naloge
3. **Izbrišite naloge** - Odstranite nenamerne todo-je

### Spremljajte svojo aplikacijo
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Preverite svojo implementacijo

Pred nadaljevanjem preverite ta hitri kontrolni seznam, da potrdite, da vse dejansko deluje—ne domnevajte, da "implementacija je uspela" pomeni "aplikacija deluje":

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Implementacija je preverjena, če:**
- ✅ `azd show` navaja dosegljivi naslov URL končne točke
- ✅ URL se v brskalniku odpre brez napak
- ✅ Osnovne funkcije delujejo (dodaj/opravi/izbriši todo)
- ✅ `azd monitor --logs` prikazuje dohodne zahteve brez nepričakovanih napak

Če kateri koli pregled spodleti, pojdite na [Poglavje 7: Reševanje težav](../chapter-07-troubleshooting/README.md).

## 6. korak: Naredite spremembe in ponovno implementirajte

Naredimo spremembo in si poglejmo, kako enostavno je posodobiti:

### Spremenite API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Dodajte lastni odzivni header:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementirajte samo spremembe kode
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 7. korak: Upravljanje več okolij

Ustvarite testno okolje za preizkušanje sprememb pred produkcijo:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Primerjava okolij
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## 8. korak: Očistite vire

Ko končate z eksperimentiranjem, očistite vire, da se izognete stalnim stroškom:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klasična aplikacija proti aplikaciji z AI: Enak potek dela

Pravkar ste implementirali tradicionalno spletno aplikacijo. Kaj pa, če bi želeli namesto tega implementirati aplikacijo z AI – na primer klepetalno aplikacijo, podprto z Microsoft Foundry modeli?

Dobra novica: **potek dela je identičen.**

| Korak | Klasična Todo aplikacija | AI klepetalna aplikacija |
|------|-------------------------|---------------------------|
| Inicializacija (prazni imenik) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Avtentikacija | `azd auth login` | `azd auth login` |
| Implementacija | `azd up` | `azd up` |
| Spremljanje | `azd monitor` | `azd monitor` |
| Čiščenje | `azd down --force --purge` | `azd down --force --purge` |

Ukazi življenjskega cikla so enaki, vendar so predpogoji različni. AI predloga lahko zahteva dostop do modelov, regionalno kvoto, vnos podatkov in dodatne nastavitve. Pred implementacijo preberite njen README; `azd up` ne more zagotoviti manjkajočih dovoljenj ali kvot.

To je osnovno načelo azd: **en potek dela, kateri koli delovni nabor.** Veščine, ki ste jih vadili v tem vodiču – inicializacija, implementacija, spremljanje, ponovna implementacija in čiščenje – veljajo enako za aplikacije AI in agente.

---

## Kaj ste se naučili

Čestitamo! Uspešno ste:
- ✅ Inicializirali projekt azd iz predloge
- ✅ Raziščili strukturo projekta in ključne datoteke
- ✅ Implementirali celostno aplikacijo v Azure
- ✅ Naredili spremembe kode in ponovno implementirali
- ✅ Upravljali več okolij
- ✅ Očistili vire

## 🎯 Vadbeni testi za preverjanje veščin

### Vaja 1: Implementirajte drugo predlogo (15 minut)
**Cilj**: Pokažite obvladovanje azd init in poteka implementacije

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Aplikacija se implementira brez napak
- [ ] Do aplikacije je mogoče dostopati preko URL v brskalniku
- [ ] Aplikacija deluje pravilno (dodaj/odstrani todo)
- [ ] Vse vire ste uspešno očistili

### Vaja 2: Prilagodite konfiguracijo (20 minut)
**Cilj**: Vadite lokalno shranjevanje vrednosti okolja brez zamenjave za konfiguracijo med izvajanjem

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Kriteriji uspeha:**
- [ ] Uspešno ustvarjeno lastno okolje
- [ ] Nastavljene in dostopne so okoljske spremenljivke
- [ ] `azd env get-value APP_TITLE` izpiše `My Custom Todo App`
- [ ] Lahko razložite, zakaj te vrednosti ne spreminjajo osnovne aplikacije, razen če jih koda/infrastruktura ne porabi

### Vaja 3: Delovni tok za več okolij (25 minut)
**Cilj**: Obvladajte upravljanje okolij in strategije implementacije

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Ustvarjeni sta bili dva okolja z različnimi konfiguracijami
- [ ] Oba okolja uspešno implementirana
- [ ] Med okolji lahko preklapljate z uporabo `azd env select`
- [ ] Okoljske spremenljivke se razlikujejo med okolji
- [ ] Obe okolji uspešno očiščeni

## 📊 Vaš napredek

**Vloženi čas**: ~60-90 minut  
**Pridobljene veščine**:
- ✅ Inicializacija projekta na osnovi predlog
- ✅ Zagotavljanje Azure virov
- ✅ Poteki dela za implementacijo aplikacij
- ✅ Upravljanje okolij
- ✅ Upravljanje konfiguracije
- ✅ Čiščenje virov in upravljanje stroškov

**Naslednja stopnja**: Pripravljeni ste na [Vodnik za konfiguracijo](../chapter-03-configuration/configuration.md) za napredne vzorce konfiguracije!

## Reševanje pogostih težav

### Napake avtentikacije
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Napake implementacije
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikti imen virov
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Težave s porti/omrežjem
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Naslednji koraki

Zdaj, ko ste zaključili prvi projekt, raziščite te napredne teme:

### 1. Prilagodite infrastrukturo
- [Infrastruktura kot koda](../chapter-04-infrastructure/provisioning.md)
- [Dodajte infrastrukturo baze podatkov](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Nastavite CI/CD
- [Vodnik za implementacijo](../chapter-04-infrastructure/deployment-guide.md) - Popolni poteki CI/CD
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija cevovoda

### 3. Najboljše prakse za produkcijo
- [Vodnik za implementacijo](../chapter-04-infrastructure/deployment-guide.md) - Varnost, zmogljivost in spremljanje

### 4. Raziščite več predlog
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Dodani viri

### Učni materiali
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Center arhitekture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Dobro zasnovan okvir Azure](https://learn.microsoft.com/en-us/azure/well-architected/)

### Skupnost in podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Skupnost razvijalcev Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predloge in primeri
- [Uradna galerija predlog](https://azure.github.io/awesome-azd/)
- [Prispevki skupnosti](https://github.com/Azure/awesome-azd)
- [Vir predloge Todo](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Čestitamo za zaključek vašega prvega projekta azd!** Zdaj ste pripravljeni z zaupanjem graditi in uvajati izjemne aplikacije na Azure.

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Prinesi svojo aplikacijo](bring-your-own-app.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: AI-First razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->