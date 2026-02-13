# Vaš prvi projekt - praktičen vodič

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove & Hitri začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Konfiguracija](configuration.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli pri vašem prvem projektu za Azure Developer CLI! Ta obsežen praktični vodnik ponuja popoln korak-po-korak pregled ustvarjanja, nameščanja in upravljanja celostne aplikacije na Azure z uporabo azd. Delali boste z resnično aplikacijo za todo, ki vključuje React frontend, Node.js API backend in MongoDB podatkovno bazo.

## Cilji učenja

Z izvedbo tega vodiča boste:
- Obvladali postopek inicializacije azd projekta z uporabo predlog
- Razumeli strukturo projekta Azure Developer CLI in konfiguracijske datoteke
- Izvedli celotno nameščanje aplikacije v Azure z zagotavljanjem infrastrukture
- Uvedli posodobitve aplikacije in strategije ponovnega nameščanja
- Upravljali več okolij za razvoj in preizkušanje (staging)
- Uporabili prakse čiščenja virov in upravljanja stroškov

## Rezultati učenja

Po zaključku boste sposobni:
- Samostojno inicializirati in konfigurirati azd projekte iz predlog
- Učinkovito se premikati po strukturi azd projektov in jih spreminjati
- Nameščati full-stack aplikacije v Azure z enim samim ukazom
- Odpravljati pogoste težave pri nameščanju in težave z overjanjem
- Upravljati več Azure okolij za različne faze nameščanja
- Uvesti delovne procese za neprekinjeno nameščanje pri posodobitvah aplikacij

## Začnimo

### Seznam predpogojev
- ✅ Azure Developer CLI nameščen ([Vodnik za namestitev](installation.md))
- ✅ Azure CLI nameščen in prijavljen
- ✅ Git nameščen na vašem sistemu
- ✅ Node.js 16+ (za ta vodič)
- ✅ Visual Studio Code (priporočeno)

### Preverite svojo namestitev
```bash
# Preverite namestitev azd
azd version
```
### Preverite prijavo v Azure

```bash
az account show
```

### Preverite različico Node.js
```bash
node --version
```

## Korak 1: Izberite in inicializirajte predlogo

Začnimo s priljubljeno predlogo aplikacije za opravilnik (todo), ki vključuje React frontend in Node.js API backend.

```bash
# Prebrskajte razpoložljive predloge
azd template list

# Inicializirajte predlogo aplikacije za opravila
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sledite pozivom:
# - Vnesite ime okolja: "dev"
# - Izberite naročnino (če jih imate več)
# - Izberite regijo: "East US 2" (ali regijo po vaši izbiri)
```

### Kaj se je pravkar zgodilo?
- Prenesli ste kodo predloge v vaš lokalni imenik
- Ustvarili ste datoteko `azure.yaml` z definicijami storitev
- Nastavili ste kodo infrastrukture v imeniku `infra/`
- Ustvarili ste konfiguracijo okolja

## Korak 2: Raziskovanje strukture projekta

Oglejmo si, kaj je azd ustvaril za nas:

```bash
# Prikaži strukturo projekta
tree /f   # Windows
# ali
find . -type f | head -20   # macOS/Linux
```

Videti bi morali:
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

### Ključne datoteke za razumevanje

**azure.yaml** - Srce vašega azd projekta:
```bash
# Prikaži konfiguracijo projekta
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# Oglejte si kodo infrastrukture
head -30 infra/main.bicep
```

## Korak 3: Prilagodite svoj projekt (neobvezno)

Pred nameščanjem lahko prilagodite aplikacijo:

### Spremenite frontend
```bash
# Odprite komponento aplikacije React
code src/web/src/App.tsx
```

Naredite preprosto spremembo:
```typescript
// Poiščite naslov in ga spremenite
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte spremenljivke okolja
```bash
# Nastavi lastne spremenljivke okolja
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Prikaži vse spremenljivke okolja
azd env get-values
```

## Korak 4: Namestitev v Azure

Zdaj pa vznemirljivi del – namestite vse v Azure!

```bash
# Razmestite infrastrukturo in aplikacijo
azd up

# Ta ukaz bo:
# 1. Zagotovi vire v Azure (App Service, Cosmos DB itd.)
# 2. Zgradi vašo aplikacijo
# 3. Razmestite na zagotovljene vire
# 4. Prikaže URL aplikacije
```

### Kaj se dogaja med nameščanjem?

Ukaz `azd up` izvede naslednje korake:
1. **Zagotavljanje** (`azd provision`) - Ustvari Azure vire
2. **Pakiranje** - Sestavi vašo aplikacijsko kodo
3. **Nameščanje** (`azd deploy`) - Namesti kodo na Azure vire

### Pričakovan izhod
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Korak 5: Preizkusite svojo aplikacijo

### Dostop do vaše aplikacije
Kliknite na URL, ki je naveden v izhodu nameščanja, ali ga pridobite kadarkoli:
```bash
# Pridobite končne točke aplikacije
azd show

# Odprite aplikacijo v svojem brskalniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Preizkusite aplikacijo Todo
1. **Dodajte opravilo (todo)** - Kliknite "Add Todo" in vnesite nalogo
2. **Označite kot dokončano** - Označite dokončana opravila
3. **Izbrišite opravila** - Odstranite opravila, ki jih več ne potrebujete

### Spremljajte svojo aplikacijo
```bash
# Odprite Azure portal za vaše vire
azd monitor

# Ogled dnevnikov aplikacije
azd monitor --logs

# Ogled meritev v živo
azd monitor --live
```

## Korak 6: Naredite spremembe in ponovno namestite

Naredimo spremembo in poglejmo, kako enostavno je posodobiti:

### Spremenite API
```bash
# Uredi kodo API-ja
code src/api/src/routes/lists.js
```

Dodajte prilagojeno odzivno glavo:
```javascript
// Poiščite obdelovalca poti in dodajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Namestite samo spremembe kode
```bash
# Razporedi samo kodo aplikacije (preskoči infrastrukturo)
azd deploy

# To je veliko hitreje kot 'azd up', saj infrastruktura že obstaja
```

## Korak 7: Upravljanje več okolij

Ustvarite preizkusno (staging) okolje za testiranje sprememb pred produkcijo:

```bash
# Ustvari novo predprodukcijsko okolje
azd env new staging

# Namesti v predprodukcijsko okolje
azd up

# Preklopi nazaj na razvojno okolje
azd env select dev

# Prikaži vsa okolja
azd env list
```

### Primerjava okolij
```bash
# Poglej razvojno okolje
azd env select dev
azd show

# Poglej predprodukcijsko okolje
azd env select staging
azd show
```

## Korak 8: Počistite vire

Ko končate z eksperimentiranjem, počistite vire, da se izognete stalnim stroškom:

```bash
# Izbriši vse vire Azure za trenutno okolje
azd down

# Prisili brisanje brez potrditve in trajno odstrani mehko izbrisane vire
azd down --force --purge

# Izbriši določeno okolje
azd env select staging
azd down --force --purge
```

## Kaj ste se naučili

Čestitamo! Uspešno ste:
- ✅ Inicializirali azd projekt iz predloge
- ✅ Raziskali strukturo projekta in ključne datoteke
- ✅ Namestili full-stack aplikacijo v Azure
- ✅ Naredili spremembe v kodi in ponovno namestili
- ✅ Upravljali več okolij
- ✅ Počistili vire

## 🎯 Vaje za preverjanje veščin

### Vaja 1: Namestite drugo predlogo (15 minut)
**Cilj**: Pokažite obvladovanje delovnega toka azd init in nameščanja

```bash
# Preizkusi sklad Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Preveri namestitev
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Počisti
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Aplikacija se namesti brez napak
- [ ] Dostop do URL aplikacije v brskalniku
- [ ] Aplikacija deluje pravilno (dodaj/odstrani opravila)
- [ ] Uspešno počistili vse vire

### Vaja 2: Prilagodite konfiguracijo (20 minut)
**Cilj**: Vadite konfiguracijo spremenljivk okolja

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

# Namesti z uporabo prilagojene konfiguracije
azd up
```

**Kriteriji uspeha:**
- [ ] Uspešno ustvarjeno okolje po meri
- [ ] Spremenljivke okolja nastavljene in dostopne
- [ ] Aplikacija se namesti s prilagojeno konfiguracijo
- [ ] Možno preveriti prilagojene nastavitve v nameščeni aplikaciji

### Vaja 3: Delovni tok z več okolji (25 minut)
**Cilj**: Obvladati upravljanje okolij in strategije nameščanja

```bash
# Ustvari razvojno okolje
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zabeleži razvojni URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Ustvari predprodukcijsko okolje
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zabeleži predprodukcijski URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Primerjaj okolja
azd env list

# Preizkusi oba okolja
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Očisti oba okolja
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Ustvarjeni dve okolji z različnimi konfiguracijami
- [ ] Obe okolji uspešno nameščeni
- [ ] Možno preklapljati med okolji z uporabo `azd env select`
- [ ] Spremenljivke okolja se razlikujejo med okolji
- [ ] Uspešno počistili obe okolji

## 📊 Vaš napredek

**Vloženi čas**: ~60-90 minut  
**Pridobljene veščine**:
- ✅ Inicializacija projektov na osnovi predlog
- ✅ Zagotavljanje Azure virov
- ✅ Poteki za nameščanje aplikacij
- ✅ Upravljanje okolij
- ✅ Upravljanje konfiguracij
- ✅ Čiščenje virov in upravljanje stroškov

**Naslednji korak**: Pripravljeni ste za [Vodnik za konfiguracijo](configuration.md), da se naučite naprednih vzorcev konfiguracije!

## Odpravljanje pogostih težav

### Napake pri overjanju
```bash
# Ponovno se prijavite v Azure
az login

# Preverite dostop do naročnine
az account show
```

### Neuspešna nameščanja
```bash
# Omogoči zapisovanje za razhroščevanje
export AZD_DEBUG=true
azd up --debug

# Ogled dnevnikov aplikacije v Azure
azd monitor --logs

# Za Container Apps uporabite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikti imen virov
```bash
# Uporabite edinstveno ime okolja
azd env new dev-$(whoami)-$(date +%s)
```

### Težave s pristanišči/omrežjem
```bash
# Preveri, ali so vrata na voljo
netstat -an | grep :3000
netstat -an | grep :3100
```

## Naslednji koraki

Zdaj, ko ste zaključili svoj prvi projekt, raziščite te napredne teme:

### 1. Prilagodite infrastrukturo
- [Infrastruktura kot koda](../chapter-04-infrastructure/provisioning.md)
- [Dodajte podatkovne baze, shranjevanje in druge storitve](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavite CI/CD
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Celotni poteki CI/CD
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija cevovoda

### 3. Najboljše prakse za produkcijo
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Varnost, zmogljivost in spremljanje

### 4. Raziščite več predlog
```bash
# Prebrskajte predloge po kategorijah
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Preizkusite različne tehnološke sklade
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni viri

### Učne vsebine
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Center arhitekture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Okvir Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Skupnost in podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Skupnost razvijalcev Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predloge in primeri
- [Uradna galerija predlog](https://azure.github.io/awesome-azd/)
- [Skupnostne predloge](https://github.com/Azure-Samples/azd-templates)
- [Vzorci za podjetja](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo za dokončanje vašega prvega azd projekta!** Zdaj ste pripravljeni graditi in nameščati neverjetne aplikacije v Azure z zaupanjem.

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove & Hitri začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Konfiguracija](configuration.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Naslednja lekcija**: [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v svojem izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne prevzemamo odgovornosti za kakršne koli nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->