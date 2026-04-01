# Vaš prvi projekt - praktičen vodič

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Konfiguracija](configuration.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj, usmerjen v AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli v vašem prvem projektu z Azure Developer CLI! Ta obsežen praktičen vodnik ponuja celoten korak za korakom postopek ustvarjanja, nameščanja in upravljanja full-stack aplikacije v Azure z uporabo azd. Delali boste z resnično todo aplikacijo, ki vključuje React frontend, Node.js API backend in MongoDB bazo podatkov.

## Cilji učenja

S končanjem tega vadnika boste:
- Obvladali postopek inicializacije azd projekta z uporabo predlog
- Razumeli strukturo azd projekta in konfiguracijske datoteke
- Izvedli popolno nameščanje aplikacije v Azure z zagotavljanjem infrastrukture
- Uvedli posodobitve aplikacije in strategije ponovnega nameščanja
- Upravljali več okolij za razvoj in staging
- Uporabili postopke čiščenja virov in upravljanja stroškov

## Rezultati učenja

Po zaključku boste lahko:
- Neodvisno inicializirali in konfigurirali azd projekte iz predlog
- Učinkovito krmarili in spreminjali strukture azd projektov
- Z enim ukazom namestili full-stack aplikacije v Azure
- Odpravljali pogoste težave z nameščanjem in preverjanjem pristnosti
- Upravljali več Azure okolij za različne faze nameščanja
- Uvedli poteke za kontinuirano nameščanje pri posodobitvah aplikacij

## Začetek

### Seznam predpogojev
- ✅ Azure Developer CLI nameščen ([Vodnik za namestitev](installation.md))
- ✅ Opravljen AZD preverjanje pristnosti z `azd auth login`
- ✅ Git nameščen na vašem sistemu
- ✅ Node.js 16+ (za ta vadnik)
- ✅ Visual Studio Code (priporočeno)

Preden nadaljujete, zaženite preverjevalnik nastavitev iz korena repozitorija:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Preverite svojo nastavitev
```bash
# Preverite namestitev azd
azd version

# Preverite avtentikacijo AZD
azd auth login --check-status
```

### Preverite neobvezno overjanje Azure CLI

```bash
az account show
```

### Preverite različico Node.js
```bash
node --version
```

## Korak 1: Izberite in inicializirajte predlogo

Začnimo s priljubljeno predlogo aplikacije todo, ki vključuje React frontend in Node.js API backend.

```bash
# Prebrskajte razpoložljive predloge
azd template list

# Inicializirajte predlogo aplikacije za opravila
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sledite pozivom:
# - Vnesite ime okolja: "dev"
# - Izberite naročnino (če imate več naročnin)
# - Izberite regijo: "East US 2" (ali regijo po vaši izbiri)
```

### Kaj se je pravkar zgodilo?
- Koda predloge je bila prenesena v vaš lokalni imenik
- Ustvarjena je bila datoteka `azure.yaml` s definicijami storitev
- Nastavljena je bila infrastrukturna koda v imeniku `infra/`
- Ustvarjena je bila konfiguracija okolja

## Korak 2: Raziščite strukturo projekta

Poglejmo, kaj je azd ustvaril za nas:

```bash
# Prikaži strukturo projekta
tree /f   # Windows
# ali
find . -type f | head -20   # macOS/Linux
```

Videli boste:
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
# Ogled kode infrastrukture
head -30 infra/main.bicep
```

## Korak 3: Prilagodite svoj projekt (neobvezno)

Pred nameščanjem lahko prilagodite aplikacijo:

### Spremenite frontend
```bash
# Odprite komponento React aplikacije
code src/web/src/App.tsx
```

Naredite preprosto spremembo:
```typescript
// Poiščite naslov in ga spremenite
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte spremenljivke okolja
```bash
# Nastavi lastne okoljske spremenljivke
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Prikaži vse okoljske spremenljivke
azd env get-values
```

## Korak 4: Namestite v Azure

Zdaj pa k razburljivemu delu - namestite vse v Azure!

```bash
# Razporedi infrastrukturo in aplikacijo
azd up

# Ta ukaz bo:
# 1. Zagotoviti Azure vire (App Service, Cosmos DB itd.)
# 2. Zgraditi vašo aplikacijo
# 3. Razporediti na zagotovljene vire
# 4. Prikazati URL aplikacije
```

### Kaj se dogaja med nameščanjem?

Ukaz `azd up` izvede naslednje korake:
1. **Provision** (`azd provision`) - Ustvari Azure vire
2. **Package** - Zgradi vašo kodo aplikacije
3. **Deploy** (`azd deploy`) - Namesti kodo na Azure vire

### Pričakovani izhod
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
Kliknite na URL, prikazan v izhodu nameščanja, ali ga pridobite kadarkoli:
```bash
# Pridobi končne točke aplikacije
azd show

# Odpri aplikacijo v brskalniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Preizkusite aplikacijo Todo
1. **Dodajte element todo** - Kliknite "Dodaj opravilo" in vnesite nalogo
2. **Označite kot opravljeno** - Označite dokončane elemente
3. **Izbrišite elemente** - Odstranite todo-je, ki jih ne potrebujete več

### Nadzorujte svojo aplikacijo
```bash
# Odprite Azure portal za vaše vire
azd monitor

# Ogled dnevnikov aplikacije
azd monitor --logs

# Ogled metrik v živo
azd monitor --live
```

## Korak 6: Naredite spremembe in ponovno namestite

Naredimo spremembo in poglejmo, kako enostavno je posodobiti:

### Spremenite API
```bash
# Uredi kodo API-ja
code src/api/src/routes/lists.js
```

Dodajte prilagojeno glavo odgovora:
```javascript
// Poiščite obdelovalca poti in dodajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Namestite samo spremembe v kodi
```bash
# Razmestite samo kodo aplikacije (preskočite infrastrukturo)
azd deploy

# To je veliko hitreje kot 'azd up', saj infrastruktura že obstaja.
```

## Korak 7: Upravljanje več okolij

Ustvarite staging okolje za preizkušanje sprememb pred produkcijo:

```bash
# Ustvari novo predprodukcijsko okolje
azd env new staging

# Razporedi v predprodukcijsko okolje
azd up

# Preklopi nazaj na razvojno okolje
azd env select dev

# Prikaži vsa okolja
azd env list
```

### Primerjava okolij
```bash
# Ogled razvojnega okolja
azd env select dev
azd show

# Ogled predprodukcijskega okolja
azd env select staging
azd show
```

## Korak 8: Počistite vire

Ko končate z eksperimentiranjem, počistite vire, da se izognete nadaljnjim stroškom:

```bash
# Izbriši vse Azure vire za trenutno okolje
azd down

# Prisili brisanje brez potrditve in trajno odstrani mehko izbrisane vire
azd down --force --purge

# Izbriši določeno okolje
azd env select staging
azd down --force --purge
```

## Klasična aplikacija v primerjavi z aplikacijo, poganjano z AI: enak potek dela

Dobra novica: **potek dela je enak.**

| Korak | Klasična aplikacija Todo | AI klepetalna aplikacija |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Edina razlika je **predloga**, s katere začnete. AI predloga vključuje dodatno infrastrukturo (na primer Microsoft Foundry Models vir ali AI Search indeks), vendar azd vse to za vas uredi. Ni vam treba učiti novih ukazov, spreminjati orodij ali spreminjati načina razmišljanja o nameščanju.

To je temeljno načelo azd: **en potek dela, katera koli obremenitev.** Veščine, ki ste jih vadili v tem vadniku — inicializacija, nameščanje, nadziranje, ponovna namestitev in čiščenje — veljajo enako za AI aplikacije in agente.

---

## Kaj ste se naučili

Čestitke! Uspešno ste:
- ✅ Inicializirali azd projekt iz predloge
- ✅ Raziščili strukturo projekta in ključne datoteke
- ✅ Namestili full-stack aplikacijo v Azure
- ✅ Naredili spremembe v kodi in ponovno namestili
- ✅ Upravljali več okolij
- ✅ Počistili vire

## 🎯 Vaje za preverjanje znanja

### Vaja 1: Namestite drugačno predlogo (15 minut)
**Cilj**: Pokažite obvladovanje azd init in postopka nameščanja

```bash
# Preizkusite sklad Python + MongoDB
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Preverite namestitev
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Očistite
azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Aplikacija se namesti brez napak
- [ ] Dostop do URL aplikacije v brskalniku
- [ ] Aplikacija deluje pravilno (dodaj/odstrani todo elemente)
- [ ] Vsi viri so bili uspešno počisteni

### Vaja 2: Prilagodite konfiguracijo (20 minut)
**Cilj**: Vaditi konfiguracijo spremenljivk okolja

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

# Razporedi z uporabo prilagojene konfiguracije
azd up
```

**Kriteriji uspeha:**
- [ ] Prilagojeno okolje je bilo uspešno ustvarjeno
- [ ] Spremenljivke okolja nastavljene in dostopne
- [ ] Aplikacija se namesti s prilagojeno konfiguracijo
- [ ] Lahko potrdite prilagojene nastavitve v nameščeni aplikaciji

### Vaja 3: Delovni postopek za več okolij (25 minut)
**Cilj**: Obvladovati upravljanje okolij in strategije nameščanja

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

# Počisti oba okolja
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Ustvarjeni sta bili dve okolji z različnimi konfiguracijami
- [ ] Obe okolji sta bili uspešno nameščeni
- [ ] Lahko preklapljate med okolji z `azd env select`
- [ ] Spremenljivke okolja se razlikujejo med okolji
- [ ] Obe okolji sta bili uspešno počistjeni

## 📊 Vaš napredek

**Porabljen čas**: ~60-90 minut  
**Pridobljene veščine**:
- ✅ Inicializacija projekta na podlagi predloge
- ✅ Zagotavljanje Azure virov
- ✅ Postopki nameščanja aplikacij
- ✅ Upravljanje okolij
- ✅ Upravljanje konfiguracij
- ✅ Čiščenje virov in upravljanje stroškov

**Naslednji korak**: Pripravljeni ste za [Vodnik za konfiguracijo](configuration.md), da se naučite naprednih vzorcev konfiguracije!

## Reševanje pogostih težav

### Napake pri preverjanju pristnosti
```bash
# Ponovno se prijavite v Azure
az login

# Preverite dostop do naročnine
az account show
```

### Neuspehi pri nameščanju
```bash
# Omogočite beleženje za odpravljanje napak
export AZD_DEBUG=true
azd up --debug

# Oglejte si dnevnike aplikacije v Azure
azd monitor --logs

# Za Container Apps uporabite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikti imen virov
```bash
# Uporabite edinstveno ime okolja
azd env new dev-$(whoami)-$(date +%s)
```

### Težave s porti/omrežjem
```bash
# Preverite, ali so vrata na voljo
netstat -an | grep :3000
netstat -an | grep :3100
```

## Naslednji koraki

Zdaj, ko ste zaključili svoj prvi projekt, raziščite te napredne teme:

### 1. Prilagodite infrastrukturo
- [Infrastruktura kot koda](../chapter-04-infrastructure/provisioning.md)
- [Dodajte baze podatkov, shranjevanje in druge storitve](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavite CI/CD
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Popolni CI/CD postopki
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija pipeline-a

### 3. Najboljše prakse za produkcijo
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Varnost, zmogljivost in nadzor

### 4. Raziščite več predlog
```bash
# Brskaj predloge po kategorijah
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Preizkusi različne tehnološke sklade
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni viri

### Učni materiali
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Center arhitekture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Skupnost in podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Skupnost razvijalcev Azure](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predloge in primeri
- [Uradna galerija predlog](https://azure.github.io/awesome-azd/)
- [Predloge skupnosti](https://github.com/Azure-Samples/azd-templates)
- [Vzorce za podjetja](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitke za dokončanje vašega prvega azd projekta!** Zdaj ste pripravljeni z zaupanjem graditi in nameščati odlične aplikacije v Azure.

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Konfiguracija](configuration.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj, usmerjen v AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Naslednja lekcija**: [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Nismo odgovorni za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->