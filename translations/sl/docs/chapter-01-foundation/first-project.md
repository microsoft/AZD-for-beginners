# Vaš prvi projekt - praktičen vodič

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Konfiguracija](configuration.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli pri vašem prvem projektu z Azure Developer CLI! Ta obsežen praktični vodič ponuja popoln korak-po-korak postopek za ustvarjanje, nameščanje in upravljanje full-stack aplikacije v Azure z uporabo azd. Delali boste z dejansko aplikacijo za opravila (todo), ki vključuje React frontend, Node.js API backend in MongoDB podatkovno bazo.

## Cilji učenja

Z dokončanjem tega vodiča boste:
- Obvladali postopek inicializacije projekta azd z uporabo predlog
- Razumeli strukturo projekta Azure Developer CLI in konfiguracijske datoteke
- Izvedli popolno nameščanje aplikacije v Azure z zagotavljanjem infrastrukture
- Uvedli posodobitve aplikacije in strategije ponovnega nameščanja
- Upravljali več okolij za razvoj in predprodukcijo (staging)
- Uporabljali postopke čiščenja virov in upravljanja stroškov

## Rezultati učenja

Po zaključku boste lahko:
- Neodvisno inicializirali in konfigurirali azd projekte iz predlog
- Učinkovito navigirali in spreminjali strukturo azd projekta
- Z enim ukazom namestili full-stack aplikacije v Azure
- Odpravljali pogoste težave pri nameščanju in avtentikaciji
- Upravljali več Azure okolij za različne faze nameščanja
- Uvedli nenehne procese nameščanja za posodobitve aplikacij

## Začetek

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
### Preverite Azure avtentikacijo

```bash
az account show
```

### Preverite različico Node.js
```bash
node --version
```

## Korak 1: Izberite in inicializirajte predlogo

Začnimo s priljubljeno predlogo aplikacije za upravljanje opravil (todo), ki vključuje React frontend in Node.js API backend.

```bash
# Prebrskaj razpoložljive predloge
azd template list

# Inicializiraj predlogo aplikacije za opravila
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sledi pozivom:
# - Vnesi ime okolja: "dev"
# - Izberi naročnino (če imaš več)
# - Izberi regijo: "East US 2" (ali želeno regijo)
```

### Kaj se je pravkar zgodilo?
- Prenesli ste kodo predloge v lokalni imenik
- Ustvarjena je bila datoteka `azure.yaml` z definicijami storitev
- Nastavljena je bila infrastrukturna koda v imeniku `infra/`
- Ustvarjena je bila konfiguracija okolja

## Korak 2: Raziskovanje strukture projekta

Poglejmo, kaj je azd ustvaril za nas:

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
# Ogled konfiguracije projekta
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# Ogled kode infrastrukture
head -30 infra/main.bicep
```

## Korak 3: Prilagodite svoj projekt (neobvezno)

Pred nameščanjem lahko prilagodite aplikacijo:

### Prilagodite frontend
```bash
# Odprite komponento aplikacije React
code src/web/src/App.tsx
```

Naredite enostavno spremembo:
```typescript
// Poišči naslov in ga spremeni.
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte spremenljivke okolja
```bash
# Nastavi prilagojene spremenljivke okolja
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Prikaži vse spremenljivke okolja
azd env get-values
```

## Korak 4: Nameščanje v Azure

Zdaj pride vznemirljivi del - namestite vse v Azure!

```bash
# Razporedi infrastrukturo in aplikacijo
azd up

# Ta ukaz bo:
# 1. Ustvaril vire v Azure (App Service, Cosmos DB itd.)
# 2. Sestavi vašo aplikacijo
# 3. Razporedi na zagotovljene vire
# 4. Prikaže URL aplikacije
```

### Kaj se dogaja med nameščanjem?

Ukaz `azd up` izvede naslednje korake:
1. **Zagotavljanje** (`azd provision`) - Ustvari Azure vire
2. **Pakiranje** - Zgradi vašo kodo aplikacije
3. **Nameščanje** (`azd deploy`) - Namesti kodo v Azure vire

### Pričakovani izhod
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Korak 5: Preizkusite aplikacijo

### Dostop do vaše aplikacije
Kliknite na URL, podan v izpisu po namestitvi, ali ga pridobite kadarkoli:
```bash
# Pridobite končne točke aplikacije
azd show

# Odprite aplikacijo v brskalniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Preizkusite aplikacijo Todo
1. **Dodajte opravilo** - Kliknite "Dodaj opravilo" in vnesite nalogo
2. **Označite kot dokončano** - Označite dokončana opravila
3. **Izbrišite elemente** - Odstranite opravila, ki jih ne potrebujete več

### Nadzorujte svojo aplikacijo
```bash
# Odprite Azure portal za vaše vire
azd monitor

# Prikaži dnevnike aplikacije
azd monitor --logs

# Prikaži meritve v živo
azd monitor --live
```

## Korak 6: Naredite spremembe in ponovno namestite

Naredimo spremembo in poglejmo, kako enostavno je posodobiti:

### Prilagodite API
```bash
# Uredi kodo API-ja
code src/api/src/routes/lists.js
```

Dodajte prilagojeno glavo odgovora:
```javascript
// Poiščite obdelovalca poti in dodajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Namestitev samo sprememb kode
```bash
# Razporedi samo kodo aplikacije (preskoči infrastrukturo)
azd deploy

# To je veliko hitreje kot 'azd up', saj infrastruktura že obstaja
```

## Korak 7: Upravljanje več okolij

Ustvarite predprodukcijsko (staging) okolje za testiranje sprememb pred produkcijo:

```bash
# Ustvari novo prehodno okolje
azd env new staging

# Razporedi v prehodno okolje
azd up

# Preklopi nazaj na razvojno okolje
azd env select dev

# Prikaži vsa okolja
azd env list
```

### Primerjava okolij
```bash
# Prikaži razvojno okolje
azd env select dev
azd show

# Prikaži preizkusno okolje
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

## Klasična aplikacija vs. aplikacija, ki jo poganja AI: isti potek dela

Pravkar ste namestili tradicionalno spletno aplikacijo. Kaj pa, če bi namesto tega želeli namestiti aplikacijo, ki jo poganja AI — na primer klepetalnico, podprto z Microsoft Foundry modeli?

Dobra novica: **postopek dela je enak.**

| Korak | Klasična aplikacija Todo | AI klepetalnica |
|------|-------------------------|------------------|
| Inicializacija | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Avtentikacija | `azd auth login` | `azd auth login` |
| Nameščanje | `azd up` | `azd up` |
| Spremljanje | `azd monitor` | `azd monitor` |
| Počisti | `azd down --force --purge` | `azd down --force --purge` |

Edina razlika je v **predlogi**, s katere začnete. AI predloga vključuje dodatno infrastrukturo (na primer vir Microsoft Foundry Models ali AI Search index), vendar azd vse to uredi namesto vas. Ni vam treba učiti novih ukazov, spreminjati orodij ali drugače razmišljati o nameščanju.

To je temeljno načelo azd: **en potek dela, katerakoli obremenitev.** Spretnosti, ki ste jih vadili v tem vodiču — inicializacija, nameščanje, spremljanje, ponovno nameščanje in čiščenje — veljajo enako za AI aplikacije in agente.

---

## Kaj ste se naučili

Čestitamo! Uspešno ste:
- ✅ Inicializirali azd projekt iz predloge
- ✅ Raziskali strukturo projekta in ključne datoteke
- ✅ Namestili full-stack aplikacijo v Azure
- ✅ Naredili spremembe v kodi in ponovno namestili
- ✅ Upravljali več okolij
- ✅ Počistili vire

## 🎯 Vaje za preverjanje znanja

### Vaja 1: Namestite drugo predlogo (15 minut)
**Cilj**: Pokažite obvladovanje `azd init` in poteka namestitve

```bash
# Preizkusite Python + MongoDB sklad
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
- [ ] Dostop do URL aplikacije v brskalniku je mogoč
- [ ] Aplikacija deluje pravilno (dodaj/odstrani opravila)
- [ ] Uspešno počistili vse vire

### Vaja 2: Prilagodite konfiguracijo (20 minut)
**Cilj**: Vaja nastavitve spremenljivk okolja

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

# Razporedi s prilagojeno konfiguracijo
azd up
```

**Kriteriji uspeha:**
- [ ] Ustvarjeno je bilo prilagojeno okolje
- [ ] Spremenljivke okolja nastavljene in pridobljive
- [ ] Aplikacija se namesti s prilagojeno konfiguracijo
- [ ] Možno preveriti prilagojene nastavitve v nameščeni aplikaciji

### Vaja 3: Delovni proces z več okolji (25 minut)
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

# Počisti oba okolja
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteriji uspeha:**
- [ ] Ustvarjeni sta bila dve okolji z različnimi konfiguracijami
- [ ] Obe okolji uspešno nameščeni
- [ ] Možno preklapljati med okolji z `azd env select`
- [ ] Spremenljivke okolja se razlikujejo med okolji
- [ ] Uspešno počistili obe okolji

## 📊 Vaš napredek

**Vloženi čas**: ~60-90 minut  
**Pridobljene veščine**:
- ✅ Inicializacija projektov iz predlog
- ✅ Zagotavljanje Azure virov
- ✅ Postopki nameščanja aplikacij
- ✅ Upravljanje okolij
- ✅ Upravljanje konfiguracij
- ✅ Čiščenje virov in upravljanje stroškov

**Naslednji nivo**: Pripravljeni ste za [Vodnik za konfiguracijo](configuration.md), da se naučite naprednih vzorcev konfiguracije!

## Reševanje pogostih težav

### Napake pri avtentikaciji
```bash
# Ponovno se prijavite v Azure
az login

# Preverite dostop do naročnine
az account show
```

### Napake pri nameščanju
```bash
# Omogoči beleženje za odpravljanje napak
export AZD_DEBUG=true
azd up --debug

# Prikaži dnevnike aplikacije v Azure
azd monitor --logs

# Za Container Apps uporabite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Spori imen virov
```bash
# Uporabite edinstveno ime okolja
azd env new dev-$(whoami)-$(date +%s)
```

### Težave s porti/mrežo
```bash
# Preveri, ali so vrata na voljo
netstat -an | grep :3000
netstat -an | grep :3100
```

## Naslednji koraki

Zdaj, ko ste zaključili svoj prvi projekt, raziskujte te napredne teme:

### 1. Prilagodite infrastrukturo
- [Infrastruktura kot koda](../chapter-04-infrastructure/provisioning.md)
- [Dodajte podatkovne baze, shranjevanje in druge storitve](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Nastavite CI/CD
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Popolni CI/CD postopki
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija cevovoda

### 3. Najboljše prakse za produkcijo
- [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md) - Varnost, zmogljivost in spremljanje

### 4. Raziskujte več predlog
```bash
# Brskaj predloge po kategorijah
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Preizkusi različne tehnološke sklope
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni viri

### Učna gradiva
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Središče arhitekture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Okvir Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

### Skupnost in podpora
- [Azure Developer CLI na GitHubu](https://github.com/Azure/azure-dev)
- [Skupnost Azure razvijalcev](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predloge in primeri
- [Uradna galerija predlog](https://azure.github.io/awesome-azd/)
- [Skupnostne predloge](https://github.com/Azure-Samples/azd-templates)
- [Vzorec za podjetja](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo ob dokončanju vašega prvega azd projekta!** Zdaj ste pripravljeni z zaupanjem ustvarjati in nameščati odlične aplikacije v Azure.

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Konfiguracija](configuration.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Naslednja lekcija**: [Vodnik za nameščanje](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko samodejni prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda, ne odgovarjamo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->