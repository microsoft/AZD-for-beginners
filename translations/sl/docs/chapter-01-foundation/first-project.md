# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Previous**: [Namestitev in nastavitev](installation.md)
- **➡️ Next**: [Konfiguracija](configuration.md)
- **🚀 Next Chapter**: [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Dobrodošli v vašem prvem Azure Developer CLI projektu! Ta obsežen praktičen vodič nudi popoln korak za korakom prikaz ustvarjanja, nameščanja in upravljanja polne aplikacije na Azure z uporabo azd. Delali boste z resnično aplikacijo za seznam opravil, ki vključuje React frontend, Node.js API backend in MongoDB bazo podatkov.

## Learning Goals

Z dokončanjem tega vodiča boste:
- Obvladali potek inicializacije azd projektov z uporabo predlog
- Razumeli strukturo azd projekta in konfiguracijske datoteke
- Izvedli popolno nameščanje aplikacije v Azure z zagotavljanjem infrastrukture
- Uvedli strategije posodabljanja aplikacij in ponovnega nameščanja
- Upravljali več okolij za razvoj in pred-produkcijo
- Uporabili postopke čiščenja virov in upravljanja stroškov

## Learning Outcomes

Po zaključku boste sposobni:
- Neodvisno inicializirati in konfigurirati azd projekte iz predlog
- Učinkovito krmariti in spreminjati strukturo azd projektov
- Z enim ukazom razmestiti polne stack aplikacije v Azure
- Odpravljati pogoste napake pri nameščanju in težave z overjanjem
- Upravljati več Azure okolij za različne faze nameščanja
- Uvesti kontinuirane delovne procese za posodobitve aplikacij

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI nameščen ([Vodnik za namestitev](installation.md))
- ✅ AZD overjanje zaključeno z `azd auth login`
- ✅ Git nameščen na vašem sistemu
- ✅ Node.js 16+ (za ta vodič)
- ✅ Visual Studio Code (priporočeno)

Preden nadaljujete, zaženite validator nastavitve iz korena repozitorija:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verify Your Setup
```bash
# Preverite namestitev azd
azd version

# Preverite avtentikacijo AZD
azd auth login --check-status
```

### Verify optional Azure CLI authentication

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

Začnimo s priljubljeno predlogo aplikacije za seznam opravil, ki vključuje React frontend in Node.js API backend.

```bash
# Prebrskajte razpoložljive predloge
azd template list

# Inicializirajte predlogo aplikacije za opravila
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sledite navodilom:
# - Vnesite ime okolja: "dev"
# - Izberite naročnino (če imate več naročnin)
# - Izberite regijo: "East US 2" (ali želeno regijo)
```

### What Just Happened?
- Prenesena predloga kode v vaš lokalni imenik
- Ustvarjena datoteka `azure.yaml` s definicijami storitev
- Nastavljena infrastruktura v direktoriju `infra/`
- Ustvarjena konfiguracija okolja

## Step 2: Explore the Project Structure

Poglejmo, kaj je azd ustvaril za nas:

```bash
# Prikaži strukturo projekta
tree /f   # Windows
# ali
find . -type f | head -20   # macOS/Linux
```

You should see:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Key Files to Understand

**azure.yaml** - Srce vašega azd projekta:
```bash
# Ogled konfiguracije projekta
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# Poglej kodo infrastrukture
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Pred nameščanjem lahko prilagodite aplikacijo:

### Modify the Frontend
```bash
# Odprite komponento React aplikacije
code src/web/src/App.tsx
```

Make a simple change:
```typescript
// Poišči naslov in ga spremeni
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Nastavi prilagojene spremenljivke okolja
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Prikaži vse spremenljivke okolja
azd env get-values
```

## Step 4: Deploy to Azure

Zdaj pride razburljiv del - namestite vse v Azure!

```bash
# Razporedi infrastrukturo in aplikacijo
azd up

# Ta ukaz bo:
# 1. Zagotovi Azure vire (App Service, Cosmos DB itd.)
# 2. Izgradi vašo aplikacijo
# 3. Razporedi na zagotovljene vire
# 4. Prikaže URL aplikacije
```

### What's Happening During Deployment?

Ukaz `azd up` izvede te korake:
1. **Zagotavljanje** (`azd provision`) - Ustvari Azure vire
2. **Pakiranje** - Sestavi kodo vaše aplikacije
3. **Razmestitev** (`azd deploy`) - Razmesti kodo v Azure vire

### Expected Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Step 5: Test Your Application

### Access Your Application
Kliknite URL, naveden v izhodu namestitve, ali ga pridobite kadar koli:
```bash
# Pridobite končne točke aplikacije
azd show

# Odprite aplikacijo v brskalniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Add a todo item** - Kliknite "Add Todo" in vnesite nalogo
2. **Mark as complete** - Označite dokončane elemente
3. **Delete items** - Odstranite opravila, ki jih ne potrebujete več

### Monitor Your Application
```bash
# Odpri Azure portal za vaše vire
azd monitor

# Prikaži dnevnike aplikacije
azd monitor --logs

# Prikaži meritve v živo
azd monitor --live
```

### ✅ Verify Your Deployment

Preden nadaljujete, preglejte ta hiter kontrolni seznam, da potrdite, da vse dejansko deluje—ne predpostavljajte, da "nameščanje je uspelo" pomeni "aplikacija deluje":

```bash
# 1. Potrdite, da končna točka obstaja in je dosegljiva
azd show

# 2. Izvedite osnovni test končne točke (pričakuje HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Preverite končno točko za preverjanje stanja, če jo vaša aplikacija izpostavlja
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Deployment is verified when:**
- ✅ `azd show` izpiše dosegljiv URL končne točke
- ✅ URL se odpre v vašem brskalniku brez napak
- ✅ Osnovne funkcije delujejo (dodaj/zaključi/izbriši opravilo)
- ✅ `azd monitor --logs` prikazuje prihajajoče zahteve brez nepričakovanih napak

Če kateri koli preizkus ne uspe, pojdite na [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md).

## Step 6: Make Changes and Redeploy

Naredimo spremembo in poglejmo, kako enostavno je posodobiti:

### Modify the API
```bash
# Uredi kodo API-ja
code src/api/src/routes/lists.js
```

Add a custom response header:
```javascript
// Poiščite obdelovalca poti in dodajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# Razporedi samo kodo aplikacije (preskoči infrastrukturo)
azd deploy

# To je veliko hitreje kot 'azd up', saj infrastruktura že obstaja
```

## Step 7: Manage Multiple Environments

Ustvarite staging okolje za preizkus sprememb pred produkcijo:

```bash
# Ustvari novo pripravljalno okolje
azd env new staging

# Razporedi v pripravljalno okolje
azd up

# Preklopi nazaj na razvojno okolje
azd env select dev

# Prikaži vsa okolja
azd env list
```

### Environment Comparison
```bash
# Ogled razvojnega okolja
azd env select dev
azd show

# Ogled predprodukcijskega okolja
azd env select staging
azd show
```

## Step 8: Clean Up Resources

Ko končate z eksperimenti, očistite vire, da se izognete stalnim stroškom:

```bash
# Izbriši vse Azure vire za trenutno okolje
azd down

# Prisilno izbriši brez potrditve in trajno odstrani mehko izbrisane vire
azd down --force --purge

# Izbriši določeno okolje
azd env select staging
azd down --force --purge
```

## Classic App vs. AI-Powered App: Same Workflow

Pravkar ste razmestili tradicionalno spletno aplikacijo. Kaj pa, če želite namestiti aplikacijo, ki uporablja AI—na primer klepetalnico, ki jo poganjajo Microsoft Foundry Models?

Dobra novica: **potek dela je enak.**

| Step | Klasična aplikacija Todo | AI klepetalna aplikacija |
|------|-------------------------|--------------------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Edina razlika je **predloga**, s katere začnete. AI predloga vključuje dodatno infrastrukturo (na primer Microsoft Foundry Models vir ali AI Search indeks), vendar azd poskrbi za vse to za vas. Ni vam treba spoznati novih ukazov, sprejeti drugega orodja ali spremeniti razmišljanja o nameščanju.

To je temeljno načelo azd: **en delovni potek, katera koli obremenitev.** Veščine, ki ste jih vadili v tem vodiču—inicializacija, nameščanje, spremljanje, ponovno nameščanje in čiščenje—veljajo enako za AI aplikacije in agente.

---

## What You've Learned

Čestitamo! Uspešno ste:
- ✅ Inicializirali azd projekt iz predloge
- ✅ Raziščili strukturo projekta in ključne datoteke
- ✅ Razmestili polno stack aplikacijo v Azure
- ✅ Naredili spremembe v kodi in jih ponovno razmestili
- ✅ Upravili več okolij
- ✅ Očistili vire

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Demonstrirajte obvladovanje azd init in poteka nameščanja

```bash
# Preizkusite sklad Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Preverite uvajanje
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Očistite
azd down --force --purge
```

**Success Criteria:**
- [ ] Aplikacija se namesti brez napak
- [ ] Do URL aplikacije je mogoče dostopati v brskalniku
- [ ] Aplikacija deluje pravilno (dodaj/odstrani opravila)
- [ ] Vsi viri so uspešno očiščeni

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Vadite konfiguracijo spremenljivk okolja

```bash
cd my-first-azd-app

# Ustvari prilagojeno okolje
azd env new custom-config

# Nastavi prilagojene spremenljivke
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Preveri spremenljivke
azd env get-values | grep APP_TITLE

# Razporedi z prilagojeno konfiguracijo
azd up
```

**Success Criteria:**
- [ ] Ustvarjeno prilagojeno okolje
- [ ] Spremenljivke okolja nastavljene in pridobljive
- [ ] Aplikacija nameščena s prilagojeno konfiguracijo
- [ ] Prilagojene nastavitve mogoče preveriti v nameščeni aplikaciji

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Obvladovanje upravljanja okolij in strategij nameščanja

```bash
# Ustvari razvojno okolje
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zabeleži URL razvojnega okolja
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Ustvari predprodukcijsko okolje
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zabeleži URL predprodukcijskega okolja
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Primerjaj okolja
azd env list

# Preizkusi oba okolja
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Počisti oba okolja
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Ustvarjeni dve okolji z različnimi konfiguracijami
- [ ] Obe okolji uspešno nameščeni
- [ ] Preklapljanje med okolji z `azd env select`
- [ ] Spremenljivke okolja se razlikujejo med okolji
- [ ] Obe okolji uspešno očiščeni

## 📊 Your Progress

**Time Invested**: ~60-90 minutes  
**Skills Acquired**:
- ✅ Inicializacija projektov na osnovi predlog
- ✅ Zagotavljanje Azure virov
- ✅ Poteki nameščanja aplikacij
- ✅ Upravljanje okolij
- ✅ Upravljanje konfiguracij
- ✅ Čiščenje virov in upravljanje stroškov

**Next Level**: Pripravljeni ste za [Vodnik za konfiguracijo](configuration.md) za učenje naprednih vzorcev konfiguracije!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Ponovno se prijavite v Azure
az login

# Preverite dostop do naročnine
az account show
```

### Deployment Failures
```bash
# Omogoči beleženje za odpravljanje napak
export AZD_DEBUG=true
azd up --debug

# Prikaži dnevnike aplikacije v Azure
azd monitor --logs

# Za Container Apps uporabite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# Uporabite edinstveno ime okolja
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Preveri, ali so vrata na voljo
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

Zdaj, ko ste zaključili svoj prvi projekt, raziščite te napredne teme:

### 1. Customize Infrastructure
- [Infrastruktura kot koda](../chapter-04-infrastructure/provisioning.md)
- [Dodaj baze podatkov, shrambo in druge storitve](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Set Up CI/CD
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Popolni CI/CD poteki
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija pipeline-a

### 3. Production Best Practices
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Varnost, zmogljivost in spremljanje

### 4. Explore More Templates
```bash
# Brskaj predloge po kategorijah
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Preizkusi različne tehnološke rešitve
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Additional Resources

### Learning Materials
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Examples
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo za zaključek vašega prvega azd projekta!** Zdaj ste pripravljeni graditi in razmestiti neverjetne aplikacije v Azure z zaupanjem.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Previous**: [Namestitev in nastavitev](installation.md)
- **➡️ Next**: [Uporabi svojo aplikacijo](bring-your-own-app.md)
- **🚀 Next Chapter**: [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->