# Vaš prvi projekt - praktični vodič

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutačno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Installation & Setup](installation.md)
- **➡️ Sljedeće**: [Configuration](configuration.md)
- **🚀 Sljedeće poglavlje**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli u vaš prvi Azure Developer CLI projekt! Ovaj sveobuhvatni praktični vodič pruža potpuni korak-po-korak pregled stvaranja, implementacije i upravljanja full-stack aplikacijom na Azureu koristeći azd. Radit ćete s pravom todo aplikacijom koja uključuje React frontend, Node.js API backend i MongoDB bazu podataka.

## Ciljevi učenja

Nakon završetka ovog vodiča, naučit ćete:
- Ovladati tijekovima inicijalizacije azd projekta pomoću predložaka
- Razumjeti strukturu projekta Azure Developer CLI i konfiguracijske datoteke
- Izvesti kompletnu implementaciju aplikacije na Azure s provisioningom infrastrukture
- Implementirati strategije ažuriranja aplikacije i ponovne implementacije
- Upravljati više okruženja za razvoj i staging
- Primijeniti postupke čišćenja resursa i upravljanja troškovima

## Ishodi učenja

Po dovršetku bit ćete sposobni:
- Samostalno inicijalizirati i konfigurirati azd projekte iz predložaka
- Učinkovito se snalaziti i mijenjati strukturu azd projekata
- Implementirati full-stack aplikacije na Azure s jednom naredbom
- Rješavati uobičajene probleme s implementacijom i autentifikacijom
- Upravljati više Azure okruženja za različite faze implementacije
- Implementirati tijekove kontinuirane implementacije za ažuriranja aplikacije

## Početak rada

### Popis preduvjeta
- ✅ Azure Developer CLI instaliran ([Vodič za instalaciju](installation.md))
- ✅ Azure CLI instaliran i autentificiran
- ✅ Git instaliran na vašem sustavu
- ✅ Node.js 16+ (za ovaj vodič)
- ✅ Visual Studio Code (preporučeno)

### Provjerite postavke
```bash
# Provjerite instalaciju azd
azd version
```
### Provjerite Azure autentifikaciju

```bash
az account show
```

### Provjerite verziju Node.js
```bash
node --version
```

## Korak 1: Odaberite i inicijalizirajte predložak

Počnimo s popularnim predloškom todo aplikacije koji uključuje React frontend i Node.js API backend.

```bash
# Pregledajte dostupne predloške
azd template list

# Inicijalizirajte predložak todo aplikacije
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Slijedite upute:
# - Unesite naziv okruženja: "dev"
# - Odaberite pretplatu (ako imate više pretplata)
# - Odaberite regiju: "East US 2" (ili željenu regiju)
```

### Što se upravo dogodilo?
- Preuzeli ste kôd predloška u svoj lokalni direktorij
- Stvorili `azure.yaml` datoteku s definicijama servisa
- Postavili infrastrukturni kôd u direktoriju `infra/`
- Stvorili konfiguraciju okruženja

## Korak 2: Istražite strukturu projekta

Pogledajmo što je azd stvorio za nas:

```bash
# Prikaži strukturu projekta
tree /f   # Windows
# ili
find . -type f | head -20   # macOS/Linux
```

Trebali biste vidjeti:
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

### Ključne datoteke koje treba razumjeti

**azure.yaml** - Srž vašeg azd projekta:
```bash
# Prikaži konfiguraciju projekta
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# Pogledajte kôd infrastrukture
head -30 infra/main.bicep
```

## Korak 3: Prilagodite svoj projekt (opcionalno)

Prije implementacije možete prilagoditi aplikaciju:

### Izmijenite frontend
```bash
# Otvori komponentu React aplikacije
code src/web/src/App.tsx
```

Napravite jednostavnu promjenu:
```typescript
// Pronađi naslov i promijeni ga
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte varijable okruženja
```bash
# Postavite prilagođene varijable okruženja
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Prikaži sve varijable okruženja
azd env get-values
```

## Korak 4: Implementirajte na Azure

Sada dolazi uzbudljivi dio - implementirajte sve na Azure!

```bash
# Rasporedi infrastrukturu i aplikaciju
azd up

# Ova naredba će:
# 1. Osigurati Azure resurse (App Service, Cosmos DB itd.)
# 2. Izgraditi vašu aplikaciju
# 3. Rasporediti na pripremljene resurse
# 4. Prikazati URL aplikacije
```

### Što se događa tijekom implementacije?

Naredba `azd up` izvodi ove korake:
1. **Provision** (`azd provision`) - Stvara Azure resurse
2. **Package** - Gradi vaš kôd aplikacije
3. **Deploy** (`azd deploy`) - Implementira kôd na Azure resurse

### Očekivani izlaz
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Korak 5: Testirajte svoju aplikaciju

### Pristupite svojoj aplikaciji
Kliknite na URL naveden u izlazu implementacije, ili ga dohvatite u bilo kojem trenutku:
```bash
# Dohvati krajnje točke aplikacije
azd show

# Otvori aplikaciju u pregledniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Testirajte Todo aplikaciju
1. **Dodajte stavku** - Kliknite "Dodaj zadatak" i unesite zadatak
2. **Označite kao dovršeno** - Označite dovršene stavke
3. **Obrišite stavke** - Uklonite zadatke koje više ne trebate

### Nadzirite svoju aplikaciju
```bash
# Otvorite Azure portal za vaše resurse
azd monitor

# Pregledajte dnevnike aplikacije
azd monitor --logs

# Pregledajte metrike uživo
azd monitor --live
```

## Korak 6: Napravite promjene i ponovno implementirajte

Napravimo promjenu i vidimo koliko je lako ažurirati:

### Izmijenite API
```bash
# Uredi API kod
code src/api/src/routes/lists.js
```

Dodajte prilagođeni response header:
```javascript
// Pronađite obrađivača rute i dodajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementirajte samo promjene koda
```bash
# Rasporedi samo aplikacijski kod (preskoči infrastrukturu)
azd deploy

# Ovo je puno brže od 'azd up' jer infrastruktura već postoji
```

## Korak 7: Upravljanje višestrukim okruženjima

Stvorite staging okruženje za testiranje promjena prije produkcije:

```bash
# Kreiraj novo staging okruženje
azd env new staging

# Rasporedi u staging okruženje
azd up

# Prebaci natrag na dev okruženje
azd env select dev

# Prikaži sva okruženja
azd env list
```

### Usporedba okruženja
```bash
# Prikaži razvojno okruženje
azd env select dev
azd show

# Prikaži pripremno okruženje
azd env select staging
azd show
```

## Korak 8: Očistite resurse

Kada završite s eksperimentiranjem, očistite resurse kako biste izbjegli stalne troškove:

```bash
# Izbriši sve Azure resurse za trenutno okruženje
azd down

# Prisilno izbriši bez potvrde i trajno ukloni soft-obrisane resurse
azd down --force --purge

# Izbriši određeno okruženje
azd env select staging
azd down --force --purge
```

## Što ste naučili

Čestitamo! Uspješno ste:
- ✅ Inicijalizirali azd projekt iz predloška
- ✅ Istražili strukturu projekta i ključne datoteke
- ✅ Implementirali full-stack aplikaciju na Azure
- ✅ Napravili promjene u kôdu i ponovno implementirali
- ✅ Upravljali višestrukim okruženjima
- ✅ Očistili resurse

## 🎯 Vježbe za provjeru vještina

### Vježba 1: Implementirajte drugi predložak (15 minuta)
**Cilj**: Demonstrirati ovladavanje azd init i tijekovima implementacije

```bash
# Isprobaj Python + MongoDB tehnološki stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Provjeri postavljanje
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Očisti
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Aplikacija se implementira bez pogrešaka
- [ ] Moguće je pristupiti URL-u aplikacije u pregledniku
- [ ] Aplikacija funkcionira ispravno (dodavanje/brisanje zadataka)
- [ ] Uspješno ste očistili sve resurse

### Vježba 2: Prilagodite konfiguraciju (20 minuta)
**Cilj**: Vježbati konfiguraciju varijabli okruženja

```bash
cd my-first-azd-app

# Kreiraj prilagođeno okruženje
azd env new custom-config

# Postavi prilagođene varijable
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Provjeri varijable
azd env get-values | grep APP_TITLE

# Implementiraj s prilagođenom konfiguracijom
azd up
```

**Kriteriji uspjeha:**
- [ ] Prilagođeno okruženje uspješno stvoreno
- [ ] Varijable okruženja postavljene i dohvatljive
- [ ] Aplikacija se implementira s prilagođenom konfiguracijom
- [ ] Moguće je provjeriti prilagođene postavke u implementiranoj aplikaciji

### Vježba 3: Tijek rada s više okruženja (25 minuta)
**Cilj**: Ovladati upravljanjem okruženjima i strategijama implementacije

```bash
# Kreiraj razvojno okruženje
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zabilježi razvojni URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Kreiraj pripremno okruženje
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zabilježi pripremni URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Usporedi okruženja
azd env list

# Testiraj oba okruženja
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Očisti oba okruženja
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Stvorena su dva okruženja s različitim konfiguracijama
- [ ] Oba okruženja uspješno implementirana
- [ ] Moguće je prebacivati se između okruženja koristeći `azd env select`
- [ ] Varijable okruženja razlikuju se između okruženja
- [ ] Uspješno ste očistili oba okruženja

## 📊 Vaš napredak

**Uloženo vrijeme**: ~60-90 minuta  
**Stečene vještine**:
- ✅ Inicijalizacija projekata na temelju predložaka
- ✅ Provisioning Azure resursa
- ✅ Tijekovi implementacije aplikacija
- ✅ Upravljanje okruženjima
- ✅ Upravljanje konfiguracijom
- ✅ Čišćenje resursa i upravljanje troškovima

**Sljedeća razina**: Spremni ste za [Configuration Guide](configuration.md) da naučite napredne obrasce konfiguracije!

## Rješavanje uobičajenih problema

### Pogreške autentifikacije
```bash
# Ponovno se prijavite u Azure
az login

# Provjerite pristup pretplati
az account show
```

### Neuspjesi implementacije
```bash
# Omogući debug zapisivanje
export AZD_DEBUG=true
azd up --debug

# Pregledajte zapisnike aplikacije u Azureu
azd monitor --logs

# Za Container Apps, koristite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Sukobi imena resursa
```bash
# Koristite jedinstveno ime okruženja
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi s portom/mrežom
```bash
# Provjerite jesu li portovi dostupni
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sljedeći koraci

Sada kad ste dovršili svoj prvi projekt, istražite ove napredne teme:

### 1. Prilagodite infrastrukturu
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Postavite CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Kompletni CI/CD tijekovi rada
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Konfiguracija pipelinea

### 3. Najbolje prakse za produkciju
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Sigurnost, performanse i nadzor

### 4. Istražite više predložaka
```bash
# Pregledajte predloške po kategoriji
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Isprobajte različite tehnološke stackove
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni resursi

### Materijali za učenje
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Zajednica i podrška
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predlošci i primjeri
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo na dovršetku vašeg prvog azd projekta!** Sada ste spremni graditi i implementirati izvrsne aplikacije na Azureu s povjerenjem.

---

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutačno poglavlje**: Poglavlje 1 - Osnove i brzi početak
- **⬅️ Prethodno**: [Installation & Setup](installation.md)
- **➡️ Sljedeće**: [Configuration](configuration.md)
- **🚀 Sljedeće poglavlje**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Sljedeća lekcija**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o odricanju odgovornosti:
Ovaj dokument je preveden pomoću AI usluge prevođenja Co-op Translator (https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku smatra se službenim (autoritativnim) izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->