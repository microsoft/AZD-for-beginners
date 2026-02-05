# Vaš Prvi Projekt - Praktični Vodič

**Navigacija Poglavljem:**
- **📚 Početna Stranica Tečaja**: [AZD za Početnike](../../README.md)
- **📖 Trenutno Poglavlje**: Poglavlje 1 - Osnove i Brzi Start
- **⬅️ Prethodno**: [Instalacija i Postavljanje](installation.md)
- **➡️ Sljedeće**: [Konfiguracija](configuration.md)
- **🚀 Sljedeće Poglavlje**: [Poglavlje 2: AI-Prvi Razvoj](../microsoft-foundry/microsoft-foundry-integration.md)

## Uvod

Dobrodošli u vaš prvi projekt s Azure Developer CLI! Ovaj sveobuhvatni praktični vodič pruža potpuni pregled stvaranja, implementacije i upravljanja full-stack aplikacijom na Azureu koristeći azd. Radit ćete s pravom todo aplikacijom koja uključuje React frontend, Node.js API backend i MongoDB bazu podataka.

## Ciljevi Učenja

Završetkom ovog vodiča, naučit ćete:
- Ovladati azd procesom inicijalizacije projekta koristeći predloške
- Razumjeti strukturu projekta i konfiguracijske datoteke Azure Developer CLI-a
- Izvršiti potpunu implementaciju aplikacije na Azure uz osiguranje infrastrukture
- Provesti ažuriranja aplikacije i strategije ponovne implementacije
- Upravljati višestrukim okruženjima za razvoj i testiranje
- Primijeniti prakse čišćenja resursa i upravljanja troškovima

## Ishodi Učenja

Po završetku, moći ćete:
- Samostalno inicijalizirati i konfigurirati azd projekte iz predložaka
- Učinkovito navigirati i mijenjati strukture azd projekata
- Implementirati full-stack aplikacije na Azure koristeći jednostavne naredbe
- Rješavati uobičajene probleme s implementacijom i autentifikacijom
- Upravljati višestrukim Azure okruženjima za različite faze implementacije
- Provoditi kontinuirane radne tokove implementacije za ažuriranja aplikacija

## Početak

### Popis Preduvjeta
- ✅ Instaliran Azure Developer CLI ([Vodič za Instalaciju](installation.md))
- ✅ Instaliran i autentificiran Azure CLI
- ✅ Instaliran Git na vašem sustavu
- ✅ Node.js 16+ (za ovaj vodič)
- ✅ Visual Studio Code (preporučeno)

### Provjera Postavki
```bash
# Provjerite azd instalaciju
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

Počnimo s popularnim predloškom todo aplikacije koji uključuje React frontend i Node.js API backend.

```bash
# Pregledajte dostupne predloške
azd template list

# Inicijalizirajte predložak aplikacije za zadatke
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Slijedite upute:
# - Unesite naziv okruženja: "dev"
# - Odaberite pretplatu (ako imate više njih)
# - Odaberite regiju: "East US 2" (ili vašu preferiranu regiju)
```

### Što se Upravo Dogodilo?
- Preuzeli ste kod predloška u lokalni direktorij
- Kreirali ste `azure.yaml` datoteku s definicijama usluga
- Postavili ste infrastrukturni kod u direktoriju `infra/`
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

### Ključne Datoteke za Razumijevanje

**azure.yaml** - Srce vašeg azd projekta:
```bash
# Pogledajte konfiguraciju projekta
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# Pregledajte kod infrastrukture
head -30 infra/main.bicep
```

## Korak 3: Prilagodite Svoj Projekt (Opcionalno)

Prije implementacije, možete prilagoditi aplikaciju:

### Izmijenite Frontend
```bash
# Otvorite React komponentu aplikacije
code src/web/src/App.tsx
```

Napravite jednostavnu promjenu:
```typescript
// Pronađi naslov i promijeni ga
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte Varijable Okruženja
```bash
# Postavite prilagođene varijable okruženja
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Pregledajte sve varijable okruženja
azd env get-values
```

## Korak 4: Implementirajte na Azure

Sada dolazi uzbudljivi dio - implementirajte sve na Azure!

```bash
# Implementiraj infrastrukturu i aplikaciju
azd up

# Ova naredba će:
# 1. Osigurati Azure resurse (App Service, Cosmos DB, itd.)
# 2. Izgraditi vašu aplikaciju
# 3. Implementirati na osigurane resurse
# 4. Prikazati URL aplikacije
```

### Što se Događa Tijekom Implementacije?

Naredba `azd up` izvodi sljedeće korake:
1. **Provision** (`azd provision`) - Kreira Azure resurse
2. **Package** - Gradi kod vaše aplikacije
3. **Deploy** (`azd deploy`) - Implementira kod na Azure resurse

### Očekivani Izlaz
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Korak 5: Testirajte Svoju Aplikaciju

### Pristupite Svojoj Aplikaciji
Kliknite na URL naveden u izlazu implementacije ili ga dohvatite bilo kada:
```bash
# Dohvati krajnje točke aplikacije
azd show

# Otvori aplikaciju u svom pregledniku
azd show --output json | jq -r '.services.web.endpoint'
```

### Testirajte Todo Aplikaciju
1. **Dodajte todo stavku** - Kliknite "Add Todo" i unesite zadatak
2. **Označite kao završeno** - Označite završene stavke
3. **Izbrišite stavke** - Uklonite todo stavke koje vam više ne trebaju

### Pratite Svoju Aplikaciju
```bash
# Otvorite Azure portal za svoje resurse
azd monitor

# Pregledajte zapisnike aplikacije
azd logs
```

## Korak 6: Napravite Promjene i Ponovno Implementirajte

Napravimo promjenu i vidimo koliko je lako ažurirati:

### Izmijenite API
```bash
# Uredi API kod
code src/api/src/routes/lists.js
```

Dodajte prilagođeni odgovor zaglavlja:
```javascript
// Pronađi rukovatelja rute i dodaj:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementirajte Samo Promjene Koda
```bash
# Implementirajte samo kod aplikacije (preskočite infrastrukturu)
azd deploy

# Ovo je puno brže od 'azd up' jer infrastruktura već postoji
```

## Korak 7: Upravljajte Višestrukim Okruženjima

Kreirajte testno okruženje za isprobavanje promjena prije produkcije:

```bash
# Kreiraj novo okruženje za testiranje
azd env new staging

# Implementiraj na testiranje
azd up

# Vrati se na razvojno okruženje
azd env select dev

# Popis svih okruženja
azd env list
```

### Usporedba Okruženja
```bash
# Pregledaj razvojno okruženje
azd env select dev
azd show

# Pregledaj okruženje za testiranje
azd env select staging
azd show
```

## Korak 8: Očistite Resurse

Kada završite s eksperimentiranjem, očistite resurse kako biste izbjegli daljnje troškove:

```bash
# Izbriši sve Azure resurse za trenutni okoliš
azd down

# Prisilno brisanje bez potvrde i čišćenje mekano izbrisanih resursa
azd down --force --purge

# Izbriši specifični okoliš
azd env select staging
azd down --force --purge
```

## Što Ste Naučili

Čestitamo! Uspješno ste:
- ✅ Inicijalizirali azd projekt iz predloška
- ✅ Istražili strukturu projekta i ključne datoteke
- ✅ Implementirali full-stack aplikaciju na Azure
- ✅ Napravili promjene u kodu i ponovno implementirali
- ✅ Upravljali višestrukim okruženjima
- ✅ Očistili resurse

## 🎯 Vježbe za Validaciju Vještina

### Vježba 1: Implementirajte Drugi Predložak (15 minuta)
**Cilj**: Pokažite vještinu azd inicijalizacije i implementacije

```bash
# Pokušajte Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Provjerite implementaciju
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Očistite
azd down --force --purge
```

**Kriteriji Uspjeha:**
- [ ] Aplikacija se implementira bez grešaka
- [ ] Možete pristupiti URL-u aplikacije u pregledniku
- [ ] Aplikacija ispravno funkcionira (dodavanje/brisanje todo stavki)
- [ ] Uspješno očišćeni svi resursi

### Vježba 2: Prilagodite Konfiguraciju (20 minuta)
**Cilj**: Vježbajte konfiguraciju varijabli okruženja

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

**Kriteriji Uspjeha:**
- [ ] Uspješno kreirano prilagođeno okruženje
- [ ] Varijable okruženja postavljene i dostupne
- [ ] Aplikacija implementirana s prilagođenom konfiguracijom
- [ ] Možete provjeriti prilagođene postavke u implementiranoj aplikaciji

### Vježba 3: Radni Tok s Više Okruženja (25 minuta)
**Cilj**: Ovladavanje upravljanjem okruženjima i strategijama implementacije

```bash
# Kreiraj razvojno okruženje
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Zabilježi URL za razvoj
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Kreiraj okruženje za testiranje
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Zabilježi URL za testiranje
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

**Kriteriji Uspjeha:**
- [ ] Kreirana dva okruženja s različitim konfiguracijama
- [ ] Oba okruženja uspješno implementirana
- [ ] Možete se prebacivati između okruženja koristeći `azd env select`
- [ ] Varijable okruženja razlikuju se između okruženja
- [ ] Uspješno očišćena oba okruženja

## 📊 Vaš Napredak

**Uloženo Vrijeme**: ~60-90 minuta  
**Stečene Vještine**:
- ✅ Inicijalizacija projekta temeljenog na predlošku
- ✅ Osiguranje Azure resursa
- ✅ Radni tokovi implementacije aplikacija
- ✅ Upravljanje okruženjima
- ✅ Upravljanje konfiguracijom
- ✅ Čišćenje resursa i upravljanje troškovima

**Sljedeća Razina**: Spremni ste za [Vodič za Konfiguraciju](configuration.md) kako biste naučili napredne obrasce konfiguracije!

## Rješavanje Uobičajenih Problema

### Pogreške Autentifikacije
```bash
# Ponovno se autentificirajte s Azureom
az login

# Provjerite pristup pretplati
az account show
```

### Neuspjesi Implementacije
```bash
# Omogući zapisivanje pogrešaka
export AZD_DEBUG=true
azd up --debug

# Pregledaj detaljne zapise
azd logs --service api
azd logs --service web
```

### Sukobi Imena Resursa
```bash
# Koristite jedinstveno ime okruženja
azd env new dev-$(whoami)-$(date +%s)
```

### Problemi s Portovima/Mrežom
```bash
# Provjerite jesu li portovi dostupni
netstat -an | grep :3000
netstat -an | grep :3100
```

## Sljedeći Koraci

Sada kada ste završili svoj prvi projekt, istražite ove napredne teme:

### 1. Prilagodite Infrastrukturu
- [Infrastruktura kao Kod](../deployment/provisioning.md)
- [Dodajte baze podataka, pohranu i druge usluge](../deployment/provisioning.md#adding-services)

### 2. Postavite CI/CD
- [Integracija s GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Cjevovodi](../deployment/cicd-integration.md#azure-devops)

### 3. Najbolje Prakse za Produkciju
- [Sigurnosne konfiguracije](../deployment/best-practices.md#security)
- [Optimizacija performansi](../deployment/best-practices.md#performance)
- [Praćenje i zapisivanje](../deployment/best-practices.md#monitoring)

### 4. Istražite Više Predložaka
```bash
# Pregledajte predloške po kategorijama
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Isprobajte različite tehnološke skupove
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Dodatni Resursi

### Materijali za Učenje
- [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arhitekturni Centar](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Dobro Arhitekturni Okvir](https://learn.microsoft.com/en-us/azure/well-architected/)

### Zajednica i Podrška
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Zajednica](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predlošci i Primjeri
- [Službena Galerija Predložaka](https://azure.github.io/awesome-azd/)
- [Zajednički Predlošci](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Obrasci](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo na završetku vašeg prvog azd projekta!** Sada ste spremni graditi i implementirati nevjerojatne aplikacije na Azureu s povjerenjem.

---

**Navigacija Poglavljem:**
- **📚 Početna Stranica Tečaja**: [AZD za Početnike](../../README.md)
- **📖 Trenutno Poglavlje**: Poglavlje 1 - Osnove i Brzi Start
- **⬅️ Prethodno**: [Instalacija i Postavljanje](installation.md)
- **➡️ Sljedeće**: [Konfiguracija](configuration.md)
- **🚀 Sljedeće Poglavlje**: [Poglavlje 2: AI-Prvi Razvoj](../microsoft-foundry/microsoft-foundry-integration.md)
- **Sljedeća Lekcija**: [Vodič za Implementaciju](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne odgovaramo za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->