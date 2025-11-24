<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ba67ea0b26574a03ffcade6c98a9af60",
  "translation_date": "2025-11-23T21:40:36+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "sl"
}
-->
# Vaš prvi projekt - praktični vodič

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hitri začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Konfiguracija](configuration.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj z AI v ospredju](../microsoft-foundry/microsoft-foundry-integration.md)

## Uvod

Dobrodošli v vašem prvem projektu z Azure Developer CLI! Ta obsežen praktični vodič vas bo korak za korakom vodil skozi proces ustvarjanja, uvajanja in upravljanja aplikacije s polnim skladom na Azure z uporabo azd. Delali boste z resnično aplikacijo za upravljanje nalog, ki vključuje React frontend, Node.js API backend in MongoDB podatkovno bazo.

## Cilji učenja

Z dokončanjem tega vodiča boste:
- Obvladali postopek inicializacije projekta azd z uporabo predlog
- Razumeli strukturo projekta Azure Developer CLI in konfiguracijske datoteke
- Izvedli popolno uvajanje aplikacije na Azure z zagotavljanjem infrastrukture
- Uvedli posodobitve aplikacije in strategije ponovnega uvajanja
- Upravljali več okolij za razvoj in testiranje
- Uporabili prakse čiščenja virov in upravljanja stroškov

## Rezultati učenja

Po zaključku boste sposobni:
- Samostojno inicializirati in konfigurirati azd projekte iz predlog
- Učinkovito navigirati in spreminjati strukture projektov azd
- Uvajati aplikacije s polnim skladom na Azure z enojnimi ukazi
- Reševati pogoste težave pri uvajanju in avtentikaciji
- Upravljati več Azure okolij za različne faze uvajanja
- Uvesti delovne tokove za neprekinjeno uvajanje posodobitev aplikacij

## Začetek

### Seznam predpogojev
- ✅ Nameščen Azure Developer CLI ([Vodnik za namestitev](installation.md))
- ✅ Nameščen in avtenticiran Azure CLI
- ✅ Nameščen Git na vašem sistemu
- ✅ Node.js 16+ (za ta vodič)
- ✅ Priporočeno: Visual Studio Code

### Preverite svojo nastavitev
```bash
# Preverite namestitev azd
azd version
```
### Preverite avtentikacijo Azure

```bash
az account show
```

### Preverite različico Node.js
```bash
node --version
```

## Korak 1: Izberite in inicializirajte predlogo

Začnimo s priljubljeno predlogo aplikacije za upravljanje nalog, ki vključuje React frontend in Node.js API backend.

```bash
# Brskaj po razpoložljivih predlogah
azd template list

# Inicializiraj predlogo aplikacije za opravila
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Sledi navodilom:
# - Vnesi ime okolja: "dev"
# - Izberi naročnino (če jih imaš več)
# - Izberi regijo: "East US 2" (ali tvojo želeno regijo)
```

### Kaj se je pravkar zgodilo?
- Prenesli ste kodo predloge v lokalni imenik
- Ustvarili datoteko `azure.yaml` z definicijami storitev
- Nastavili kodo infrastrukture v imeniku `infra/`
- Ustvarili konfiguracijo okolja

## Korak 2: Raziščite strukturo projekta

Poglejmo, kaj je azd ustvaril za nas:

```bash
# Ogled strukture projekta
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
# Oglejte si kodo infrastrukture
head -30 infra/main.bicep
```

## Korak 3: Prilagodite svoj projekt (neobvezno)

Pred uvajanjem lahko prilagodite aplikacijo:

### Spremenite frontend
```bash
# Odpri komponento aplikacije React
code src/web/src/App.tsx
```

Naredite preprosto spremembo:
```typescript
// Poišči naslov in ga spremeni
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte okoljske spremenljivke
```bash
# Nastavite prilagojene okoljske spremenljivke
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Oglejte si vse okoljske spremenljivke
azd env get-values
```

## Korak 4: Uvedite na Azure

Zdaj pa k razburljivemu delu - uvedite vse na Azure!

```bash
# Namesti infrastrukturo in aplikacijo
azd up

# Ta ukaz bo:
# 1. Zagotovil Azure vire (App Service, Cosmos DB, itd.)
# 2. Zgradil vašo aplikacijo
# 3. Namestil na zagotovljene vire
# 4. Prikazal URL aplikacije
```

### Kaj se dogaja med uvajanjem?

Ukaz `azd up` izvaja naslednje korake:
1. **Zagotavljanje** (`azd provision`) - Ustvari Azure vire
2. **Pakiranje** - Zgradi kodo vaše aplikacije
3. **Uvajanje** (`azd deploy`) - Uvede kodo na Azure vire

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
Kliknite na URL, ki je naveden v izhodu uvajanja, ali ga pridobite kadarkoli:
```bash
# Pridobi končne točke aplikacije
azd show

# Odpri aplikacijo v svojem brskalniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Preizkusite aplikacijo za upravljanje nalog
1. **Dodajte nalogo** - Kliknite "Dodaj nalogo" in vnesite opravilo
2. **Označite kot dokončano** - Označite dokončane naloge
3. **Izbrišite naloge** - Odstranite naloge, ki jih ne potrebujete več

### Spremljajte svojo aplikacijo
```bash
# Odprite Azure portal za vaše vire
azd monitor

# Oglejte si dnevniške zapise aplikacije
azd logs
```

## Korak 6: Naredite spremembe in ponovno uvedite

Naredimo spremembo in preverimo, kako enostavno je posodobiti:

### Spremenite API
```bash
# Uredi API kodo
code src/api/src/routes/lists.js
```

Dodajte prilagojeno odzivno glavo:
```javascript
// Poišči upravljalca poti in dodaj:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Uvedite samo spremembe kode
```bash
# Namesti samo programsko kodo (preskoči infrastrukturo)
azd deploy

# To je veliko hitreje kot 'azd up', saj infrastruktura že obstaja
```

## Korak 7: Upravljajte več okolij

Ustvarite testno okolje za preverjanje sprememb pred produkcijo:

```bash
# Ustvari novo okolje za pripravo
azd env new staging

# Namesti na okolje za pripravo
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

# Ogled testnega okolja
azd env select staging
azd show
```

## Korak 8: Očistite vire

Ko končate z eksperimentiranjem, očistite, da se izognete stalnim stroškom:

```bash
# Izbriši vse Azure vire za trenutno okolje
azd down

# Prisilno izbriši brez potrditve in očisti mehko izbrisane vire
azd down --force --purge

# Izbriši določeno okolje
azd env select staging
azd down --force --purge
```

## Kaj ste se naučili

Čestitke! Uspešno ste:
- ✅ Inicializirali azd projekt iz predloge
- ✅ Raziščili strukturo projekta in ključne datoteke
- ✅ Uvedli aplikacijo s polnim skladom na Azure
- ✅ Naredili spremembe kode in ponovno uvedli
- ✅ Upravljali več okolij
- ✅ Očistili vire

## 🎯 Vaje za preverjanje znanja

### Naloga 1: Uvedite drugo predlogo (15 minut)
**Cilj**: Pokažite obvladovanje postopka inicializacije in uvajanja azd

```bash
# Poskusi Python + MongoDB sklad
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Preveri namestitev
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Počisti
azd down --force --purge
```

**Merila uspeha:**
- [ ] Aplikacija se uvede brez napak
- [ ] Dostop do URL-ja aplikacije v brskalniku
- [ ] Aplikacija deluje pravilno (dodajanje/odstranjevanje nalog)
- [ ] Uspešno očiščeni vsi viri

### Naloga 2: Prilagodite konfiguracijo (20 minut)
**Cilj**: Vadite konfiguracijo okoljskih spremenljivk

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

# Namesti s prilagojeno konfiguracijo
azd up
```

**Merila uspeha:**
- [ ] Uspešno ustvarjeno prilagojeno okolje
- [ ] Okoljske spremenljivke nastavljene in dostopne
- [ ] Aplikacija se uvede s prilagojeno konfiguracijo
- [ ] Preverite prilagojene nastavitve v uvedeni aplikaciji

### Naloga 3: Delovni tok z več okolji (25 minut)
**Cilj**: Obvladovanje upravljanja okolij in strategij uvajanja

```bash
# Ustvari razvojno okolje
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zabeleži URL za razvoj
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Ustvari testno okolje
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zabeleži URL za testiranje
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Primerjaj okolja
azd env list

# Preizkusi obe okolji
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Počisti obe
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Merila uspeha:**
- [ ] Ustvarjeni dve okolji z različnimi konfiguracijami
- [ ] Obe okolji uspešno uvedeni
- [ ] Preklapljanje med okolji z uporabo `azd env select`
- [ ] Okoljske spremenljivke se razlikujejo med okolji
- [ ] Uspešno očiščeni obe okolji

## 📊 Vaš napredek

**Porabljen čas**: ~60-90 minut  
**Pridobljene veščine**:
- ✅ Inicializacija projektov na podlagi predlog
- ✅ Zagotavljanje Azure virov
- ✅ Delovni tokovi uvajanja aplikacij
- ✅ Upravljanje okolij
- ✅ Upravljanje konfiguracij
- ✅ Čiščenje virov in upravljanje stroškov

**Naslednja stopnja**: Pripravljeni ste na [Vodnik za konfiguracijo](configuration.md), kjer boste spoznali napredne vzorce konfiguracije!

## Reševanje pogostih težav

### Napake pri avtentikaciji
```bash
# Ponovno se avtenticirajte z Azure
az login

# Preverite dostop do naročnine
az account show
```

### Napake pri uvajanju
```bash
# Omogoči beleženje odpravljanja napak
export AZD_DEBUG=true
azd up --debug

# Prikaži podrobne dnevnike
azd logs --service api
azd logs --service web
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
- [Infrastruktura kot koda](../deployment/provisioning.md)
- [Dodajanje podatkovnih baz, shranjevanja in drugih storitev](../deployment/provisioning.md#adding-services)

### 2. Nastavite CI/CD
- [Integracija z GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Najboljše prakse za produkcijo
- [Varnostne konfiguracije](../deployment/best-practices.md#security)
- [Optimizacija zmogljivosti](../deployment/best-practices.md#performance)
- [Spremljanje in beleženje](../deployment/best-practices.md#monitoring)

### 4. Raziščite več predlog
```bash
# Brskajte po predlogah glede na kategorijo
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Preizkusite različne tehnološke sklope
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni viri

### Učna gradiva
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Skupnost in podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Skupnost Azure Developer](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predloge in primeri
- [Uradna galerija predlog](https://azure.github.io/awesome-azd/)
- [Skupnostne predloge](https://github.com/Azure-Samples/azd-templates)
- [Vzorci za podjetja](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitke za dokončanje vašega prvega azd projekta!** Zdaj ste pripravljeni na gradnjo in uvajanje izjemnih aplikacij na Azure z zaupanjem.

---

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hitri začetek
- **⬅️ Prejšnje**: [Namestitev in nastavitev](installation.md)
- **➡️ Naslednje**: [Konfiguracija](configuration.md)
- **🚀 Naslednje poglavje**: [Poglavje 2: Razvoj z AI v ospredju](../microsoft-foundry/microsoft-foundry-integration.md)
- **Naslednja lekcija**: [Vodnik za uvajanje](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->