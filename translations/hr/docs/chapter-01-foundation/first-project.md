# Vaš Prvi Projekt - Praktični Vodič

**Navigacija poglavljima:**
- **📚 Početak tečaja**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i Brzi početak
- **⬅️ Prethodno**: [Instalacija i postavljanje](installation.md)
- **➡️ Sljedeće**: [Konfiguracija](configuration.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvi razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Uvod

Dobrodošli u vaš prvi Azure Developer CLI projekt! Ovaj sveobuhvatni praktični vodič pruža potpuni pregled kreiranja, implementacije i upravljanja full-stack aplikacijom na Azureu koristeći azd. Radit ćete s pravom todo aplikacijom koja uključuje React frontend, Node.js API backend i MongoDB bazu podataka.

## Ciljevi učenja

Nakon završetka ovog vodiča moći ćete:
- Ovladati procesom inicijalizacije azd projekta korištenjem predložaka
- Razumjeti strukturu Azure Developer CLI projekta i konfiguracijske datoteke
- Izvršiti kompletnu implementaciju aplikacije na Azure uključujući pružanje infrastrukture
- Primijeniti strategije ažuriranja aplikacije i ponovne implementacije
- Upravljati višestrukim okruženjima za razvoj i fazu testiranja
- Primijeniti postupke čišćenja resursa i upravljanja troškovima

## Ishodi učenja

Po završetku moći ćete:
- Samostalno inicijalizirati i konfigurirati azd projekte iz predložaka
- Učinkovito pregledavati i mijenjati strukture azd projekata
- Implementirati full-stack aplikacije na Azure jednim naredbama
- Rješavati uobičajene probleme u implementaciji i autentifikaciji
- Upravljati različitim Azure okruženjima za razne faze implementacije
- Provoditi kontinuirane radne tokove za implementaciju ažuriranja aplikacije

## Početak rada

### Popis preduvjeta
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](installation.md))
- ✅ Instaliran i autentificiran Azure CLI
- ✅ Instaliran Git na vašem sustavu
- ✅ Node.js 16+ (za ovaj vodič)
- ✅ Visual Studio Code (preporučeno)

### Provjera vašeg okruženja
```bash
# Provjerite instalaciju azd
azd version
```
### Provjera Azure autentifikacije

```bash
az account show
```

### Provjera verzije Node.js
```bash
node --version
```

## Korak 1: Odaberite i Inicijalizirajte Predložak

Započnimo s popularnim predloškom todo aplikacije koja uključuje React frontend i Node.js API backend.

```bash
# Pregledajte dostupne predloške
azd template list

# Inicijalizirajte predložak todo aplikacije
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Slijedite upute:
# - Unesite naziv okruženja: "dev"
# - Odaberite pretplatu (ako imate više)
# - Odaberite regiju: "East US 2" (ili vašu željenu regiju)
```

### Što se upravo dogodilo?
- Preuzeli ste predložak koda u vaš lokalni direktorij
- Kreirali ste `azure.yaml` datoteku sa definicijama servisa
- Postavili ste kod infrastrukture u direktorij `infra/`
- Kreirali ste konfiguraciju okruženja

## Korak 2: Istražite Strukturu Projekta

Pogledajmo što je azd kreirao za nas:

```bash
# Pogledajte strukturu projekta
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
# Pogledajte konfiguraciju projekta
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# Pogledajte kod infrastrukture
head -30 infra/main.bicep
```

## Korak 3: Prilagodite svoj projekt (opcionalno)

Prije implementacije, možete prilagoditi aplikaciju:

### Izmjena Frontenda
```bash
# Otvorite React komponentu aplikacije
code src/web/src/App.tsx
```

Napravite jednostavnu promjenu:
```typescript
// Pronađi naslov i promijeni ga
<h1>My Awesome Todo App</h1>
```

### Konfiguracija varijabli okruženja
```bash
# Postavi prilagođene varijable okoliša
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Prikaži sve varijable okoliša
azd env get-values
```

## Korak 4: Implementirajte na Azure

Sada slijedi uzbudljivi dio - implementirajte sve na Azure!

```bash
# Postavi infrastrukturu i aplikaciju
azd up

# Ova naredba će:
# 1. Nabaviti Azure resurse (App Service, Cosmos DB, itd.)
# 2. Izgraditi vašu aplikaciju
# 3. Implementirati na nabavljene resurse
# 4. Prikazati URL aplikacije
```

### Što se događa tijekom implementacije?

Komanda `azd up` izvršava ove korake:
1. **Provision** (`azd provision`) - Kreira Azure resurse
2. **Package** - Izgrađuje vaš aplikacijski kod
3. **Deploy** (`azd deploy`) - Implementira kod na Azure resurse

### Očekivani ispis
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
Kliknite na URL dan u ispisu implementacije ili ga dohvatite u bilo kojem trenutku:
```bash
# Dohvati krajnje točke aplikacije
azd show

# Otvorite aplikaciju u svom pregledniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Testirajte Todo aplikaciju
1. **Dodajte stavku u todo** - Kliknite "Add Todo" i unesite zadatak
2. **Označite kao dovršeno** - Označite dovršene stavke
3. **Izbrišite stavke** - Uklonite todose koje vam više nisu potrebne

### Pratite svoju aplikaciju
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

### Promijenite API
```bash
# Uredi API kod
code src/api/src/routes/lists.js
```

Dodajte prilagođeni naslov u odgovor:
```javascript
// Pronađite obrađivač rute i dodajte:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementirajte samo izmjene koda
```bash
# Samo implementirajte kod aplikacije (preskočite infrastrukturu)
azd deploy

# Ovo je puno brže od 'azd up' jer infrastruktura već postoji
```

## Korak 7: Upravljajte višestrukim okruženjima

Kreirajte oblikovno okruženje za testiranje promjena prije proizvodnje:

```bash
# Kreiraj novo testno okruženje
azd env new staging

# Postavi na testno okruženje
azd up

# Vratite se na razvojno okruženje
azd env select dev

# Popis svih okruženja
azd env list
```

### Usporedba okruženja
```bash
# Pogledajte razvojno okruženje
azd env select dev
azd show

# Pogledajte pripremno okruženje
azd env select staging
azd show
```

## Korak 8: Očistite resurse

Kad završite s eksperimentiranjem, očistite resurse kako biste izbjegli daljnje troškove:

```bash
# Izbriši sve Azure resurse za trenutno okruženje
azd down

# Prisilno brisanje bez potvrde i trajno uklanjanje privremeno izbrisanih resursa
azd down --force --purge

# Izbriši određeno okruženje
azd env select staging
azd down --force --purge
```

## Klasična aplikacija vs. AI-pogonjena aplikacija: Isti radni tijek

Upravo ste implementirali tradicionalnu web aplikaciju. Ali što ako želite implementirati AI-pogonjenu aplikaciju - na primjer, chat aplikaciju podržanu Microsoft Foundry Modelima?

Dobre vijesti: **radni tijek je identičan.**

| Korak | Klasična Todo aplikacija | AI Chat aplikacija |
|------|-----------------|-------------|
| Inicijalizacija | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Autentifikacija | `azd auth login` | `azd auth login` |
| Implementacija | `azd up` | `azd up` |
| Praćenje | `azd monitor` | `azd monitor` |
| Čišćenje | `azd down --force --purge` | `azd down --force --purge` |

Jedina razlika je **predložak** od kojeg počinjete. AI predložak uključuje dodatnu infrastrukturu (poput resursa Microsoft Foundry Modela ili AI Search indeksa), ali azd to sve rješava za vas. Ne trebate učiti nove naredbe, koristiti drugi alat ili mijenjati način razmišljanja o implementaciji.

Ovo je temeljni princip azd: **jedan radni tijek, bilo koji zadatak.** Vještine koje ste uvježbali u ovom vodiču — inicijalizaciju, implementaciju, praćenje, ponovnu implementaciju i čišćenje — jednako se primjenjuju na AI aplikacije i agente.

---

## Što ste naučili

Čestitamo! Uspješno ste:
- ✅ Inicijalizirali azd projekt iz predloška
- ✅ Istražili strukturu projekta i ključne datoteke
- ✅ Implementirali full-stack aplikaciju na Azure
- ✅ Napravili promjene u kodu i ponovno implementirali
- ✅ Upravljali višestrukim okruženjima
- ✅ Očistili resurse

## 🎯 Vježbe za potvrdu vještina

### Vježba 1: Implementirajte Drugi Predložak (15 minuta)
**Cilj**: Demonstrirati ovladavanje azd init i radnim tokom implementacije

```bash
# Isprobajte Python + MongoDB stog
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Provjerite implementaciju
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Očistite
azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Aplikacija se implementira bez grešaka
- [ ] Možete pristupiti URL-u aplikacije u pregledniku
- [ ] Aplikacija ispravno radi (dodavanje/uklanjanje todo stavki)
- [ ] Uspješno ste očistili sve resurse

### Vježba 2: Prilagodite Konfiguraciju (20 minuta)
**Cilj**: Vježbati konfiguraciju varijabli okruženja

```bash
cd my-first-azd-app

# Stvori prilagođeno okruženje
azd env new custom-config

# Postavi prilagođene varijable
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Provjeri varijable
azd env get-values | grep APP_TITLE

# Postavi s prilagođenom konfiguracijom
azd up
```

**Kriteriji uspjeha:**
- [ ] Prilagođeno okruženje je uspješno kreirano
- [ ] Varijable okruženja su postavljene i moguće ih je dohvatiti
- [ ] Aplikacija se implementira s prilagođenom konfiguracijom
- [ ] Moguće je potvrditi prilagođene postavke u implementiranoj aplikaciji

### Vježba 3: Radni tijek s Višestrukim Okruženjima (25 minuta)
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

# Kreiraj testno okruženje
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zabilježi testni URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Usporedi okruženja
azd env list

# Testiraj oba okruženja
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Očisti oba
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Kriteriji uspjeha:**
- [ ] Kreirana su dva okruženja s različitim konfiguracijama
- [ ] Oba okruženja su uspješno implementirana
- [ ] Moguće je prebacivati između okruženja koristeći `azd env select`
- [ ] Varijable okruženja se razlikuju između okruženja
- [ ] Uspješno ste očistili oba okruženja

## 📊 Vaš napredak

**Uloženo vrijeme**: ~60-90 minuta  
**Stečene vještine**:
- ✅ Inicijalizacija projekata na temelju predložaka
- ✅ Pružanje Azure resursa
- ✅ Radni tokovi implementacije aplikacija
- ✅ Upravljanje okruženjima
- ✅ Upravljanje konfiguracijom
- ✅ Čišćenje resursa i upravljanje troškovima

**Sljedeći korak**: Spremni ste za [Vodič za konfiguraciju](configuration.md) da naučite napredne obrasce konfiguracije!

## Rješavanje uobičajenih problema

### Pogreške prijave
```bash
# Ponovno se autentificirajte s Azureom
az login

# Provjerite pristup pretplati
az account show
```

### Neuspjele implementacije
```bash
# Omogući zapisivanje zapisa za otklanjanje pogrešaka
export AZD_DEBUG=true
azd up --debug

# Pregledajte dnevnike aplikacije u Azureu
azd monitor --logs

# Za Container Apps, koristite Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Sukobi u imenima resursa
```bash
# Koristite jedinstveno ime okruženja
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi s portovima/mrežom
```bash
# Provjerite jesu li portovi dostupni
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sljedeći koraci

Sada kada ste završili prvi projekt, istražite ove napredne teme:

### 1. Prilagodba infrastrukture
- [Infrastruktura kao kod](../chapter-04-infrastructure/provisioning.md)
- [Dodavanje baza podataka, pohrane i drugih servisa](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Postavljanje CI/CD
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - potpuni CI/CD radni tokovi
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - konfiguracija pipeline-a

### 3. Najbolje prakse za produkciju
- [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md) - sigurnost, performanse i nadzor

### 4. Istražite više predložaka
```bash
# Pregledajte predloške po kategoriji
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Isprobajte različite tehnološke skupove
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni resursi

### Materijali za učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Zajednica i podrška
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Zajednica](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predlošci i primjeri
- [Službena galerija predložaka](https://azure.github.io/awesome-azd/)
- [Zajednički predlošci](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Obrasci](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo na završetku vašeg prvog azd projekta!** Spremni ste sada s povjerenjem graditi i implementirati izvrsne aplikacije na Azure.

---

**Navigacija poglavljima:**
- **📚 Početak tečaja**: [AZD Za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 1 - Osnove i Brzi početak
- **⬅️ Prethodno**: [Instalacija i postavljanje](installation.md)
- **➡️ Sljedeće**: [Konfiguracija](configuration.md)
- **🚀 Sljedeće poglavlje**: [Poglavlje 2: AI-prvi razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Sljedeća lekcija**: [Vodič za implementaciju](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj je dokument preveden korištenjem AI prijevodnog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakve nesporazume ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->