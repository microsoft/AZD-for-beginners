# Bežné problémy a riešenia

**Chapter Navigation:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 6: Predbežné kontroly](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Ďalej**: [Príručka ladenia](debugging.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 8: Produkčné a podnikové vzory](../chapter-08-production/production-ai-practices.md)

## Úvod

Táto komplexná príručka na riešenie problémov pokrýva najčastejšie problémy pri používaní Azure Developer CLI. Naučíte sa diagnostikovať, riešiť a odstraňovať bežné problémy s overovaním, nasadzovaním, provisioningom infraštruktúry a konfiguráciou aplikácií. Každý problém obsahuje podrobné príznaky, základné príčiny a postupné riešenia.

## Ciele učenia

Po dokončení tejto príručky budete:
- Osvojiť si diagnostické techniky pre problémy s Azure Developer CLI
- Pochopiť bežné problémy s autentifikáciou a povoleniami a ich riešenia
- Riešiť zlyhania nasadenia, chyby pri provisioningu infraštruktúry a problémy s konfiguráciou
- Implementovať proaktívne stratégie monitorovania a ladenia
- Aplikovať systematické metodológie riešenia problémov pre zložité prípady
- Nastaviť správne logovanie a monitorovanie na predchádzanie budúcim problémom

## Výsledky učenia

Po dokončení budete schopní:
- Diagnostikovať problémy Azure Developer CLI pomocou vstavaných diagnostických nástrojov
- Samostatne riešiť problémy súvisiace s autentifikáciou, predplatným a povoleniami
- Efektívne riešiť zlyhania nasadenia a chyby pri provisioningu infraštruktúry
- Ladiť problémy s konfiguráciou aplikácie a špecifické problémy prostredia
- Implementovať monitorovanie a upozornenia na proaktívne identifikovanie potenciálnych problémov
- Aplikovať osvedčené postupy pre logovanie, ladenie a pracovné postupy riešenia problémov

## Rýchla diagnostika

Predtým, než sa pustíte do konkrétnych problémov, spustite tieto príkazy na získanie diagnostických informácií:

```bash
# Skontrolovať verziu azd a stav
azd version
azd config list

# Overiť autentifikáciu Azure
az account show
az account list

# Skontrolovať aktuálne prostredie
azd env show
azd env get-values

# Povoliť protokolovanie ladenia
export AZD_DEBUG=true
azd <command> --debug
```

## Problémy s autentifikáciou

### Problém: "Failed to get access token"
**Príznaky:**
- `azd up` zlyháva s chybami autentifikácie
- Príkazy vracajú "unauthorized" alebo "access denied"

**Riešenia:**
```bash
# 1. Znovu sa autentifikujte pomocou Azure CLI
az login
az account show

# 2. Vymazať medzipamäť prihlasovacích údajov
az account clear
az login

# 3. Použiť tok s kódom zariadenia (pre bezhlavé systémy)
az login --use-device-code

# 4. Nastaviť explicitné predplatné
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problém: "Insufficient privileges" počas nasadzovania
**Príznaky:**
- Nasadenie zlyháva kvôli chybám povolení
- Nie je možné vytvoriť určité Azure zdroje

**Riešenia:**
```bash
# 1. Skontrolujte svoje priradenia rolí v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Uistite sa, že máte požadované roly
# - Contributor (pre vytváranie prostriedkov)
# - User Access Administrator (pre priraďovanie rolí)

# 3. Kontaktujte svojho správcu Azure pre získanie potrebných oprávnení
```

### Problém: Problémy s autentifikáciou v multi-tenant prostredí
**Riešenia:**
```bash
# 1. Prihláste sa s konkrétnym nájomcom
az login --tenant "your-tenant-id"

# 2. Nastavte nájomcu v konfigurácii
azd config set auth.tenantId "your-tenant-id"

# 3. Vymažte vyrovnávaciu pamäť pri prepnutí medzi nájomcami
az account clear
```

## 🏗️ Chyby pri provisioningu infraštruktúry

### Problém: Konflikty mien zdrojov
**Príznaky:**
- "The resource name already exists" errors
- Nasadenie zlyháva počas vytvárania zdrojov

**Riešenia:**
```bash
# 1. Použite jedinečné názvy zdrojov pomocou tokenov
# Vo vašej Bicep šablóne:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Zmeňte názov prostredia
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Vyčistite existujúce zdroje
azd down --force --purge
```

### Problém: Lokalita/Región nie je dostupný
**Príznaky:**
- "The location 'xyz' is not available for resource type"
- Niektoré SKUs nie sú dostupné v zvolenom regióne

**Riešenia:**
```bash
# 1. Skontrolujte dostupné lokality pre typy prostriedkov
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Použite bežne dostupné regióny
azd config set defaults.location eastus2
# alebo
azd env set AZURE_LOCATION eastus2

# 3. Skontrolujte dostupnosť služby podľa regiónu
# Navštívte: https://azure.microsoft.com/global-infrastructure/services/
```

### Problém: Chyby prekročenia kvóty
**Príznaky:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Riešenia:**
```bash
# 1. Skontrolujte aktuálne využitie kvóty
az vm list-usage --location eastus2 -o table

# 2. Požiadajte o zvýšenie kvóty prostredníctvom Azure portálu
# Prejdite na: Subscriptions > Usage + quotas

# 3. Použite menšie SKU pre vývoj
# V súbore main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Odstráňte nepoužívané zdroje
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problém: Chyby v Bicep šablónach
**Príznaky:**
- Zlyhania validácie šablóny
- Syntaktické chyby v súboroch Bicep

**Riešenia:**
```bash
# 1. Overiť syntaktickú správnosť kódu Bicep
az bicep build --file infra/main.bicep

# 2. Použiť linter pre Bicep
az bicep lint --file infra/main.bicep

# 3. Skontrolovať syntaktickú správnosť súboru s parametrami
cat infra/main.parameters.json | jq '.'

# 4. Zobraziť náhľad zmien nasadenia
azd provision --preview
```

## 🚀 Zlyhania nasadenia

### Problém: Zlyhania zostavenia
**Príznaky:**
- Aplikácia sa nepodarí zostaviť počas nasadenia
- Chyby pri inštalácii balíkov

**Riešenia:**
```bash
# 1. Skontrolujte výstup zostavenia s prepínačom ladenia
azd deploy --service web --debug

# 2. Zobrazte stav nasadenej služby
azd show

# 3. Otestujte zostavenie lokálne
cd src/web
npm install
npm run build

# 3. Skontrolujte kompatibilitu verzií Node.js a Pythonu
node --version  # Malo by zodpovedať nastaveniam v azure.yaml
python --version

# 4. Vymažte medzipamäť zostavenia
rm -rf node_modules package-lock.json
npm install

# 5. Skontrolujte Dockerfile, ak používate kontajnery
docker build -t test-image .
docker run --rm test-image
```

### Problém: Zlyhania nasadenia kontajnerov
**Príznaky:**
- Kontajnerové aplikácie sa nespustia
- Chyby pri sťahovaní image

**Riešenia:**
```bash
# 1. Otestujte lokálne zostavenie Docker obrazu
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Skontrolujte denníky kontajnera pomocou Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitorujte aplikáciu pomocou azd
azd monitor --logs

# 3. Overte prístup k registru kontajnerov
az acr login --name myregistry

# 4. Skontrolujte konfiguráciu aplikácie kontajnera
az containerapp show --name my-app --resource-group my-rg
```

### Problém: Zlyhania pripojenia k databáze
**Príznaky:**
- Aplikácia sa nemôže pripojiť k databáze
- Chyby časového prekročenia pripojenia

**Riešenia:**
```bash
# 1. Skontrolujte pravidlá firewallu databázy
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Otestujte pripojenie z aplikácie
# Do svojej aplikácie pridajte dočasne:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Overte formát reťazca pripojenia
azd env get-values | grep DATABASE

# 4. Skontrolujte stav databázového servera
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problémy s konfiguráciou

### Problém: Premenné prostredia nefungujú
**Príznaky:**
- Aplikácia nedokáže načítať konfiguračné hodnoty
- Premenné prostredia sa javia ako prázdne

**Riešenia:**
```bash
# 1. Overte, či sú nastavené premenné prostredia
azd env get-values
azd env get DATABASE_URL

# 2. Skontrolujte názvy premenných v súbore azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reštartujte aplikáciu
azd deploy --service web

# 4. Skontrolujte konfiguráciu služby aplikácie
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problém: Problémy s SSL/TLS certifikátmi
**Príznaky:**
- HTTPS nefunguje
- Chyby pri validácii certifikátu

**Riešenia:**
```bash
# 1. Skontrolujte stav SSL certifikátu
az webapp config ssl list --resource-group myrg

# 2. Povoľte iba HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Pridajte vlastnú doménu (ak je to potrebné)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problém: Problémy s konfiguráciou CORS
**Príznaky:**
- Frontend nedokáže volať API
- Žiadosť z iného zdroja zablokovaná

**Riešenia:**
```bash
# 1. Nakonfigurujte CORS pre App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Aktualizujte API, aby podporovalo CORS
# V Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Skontrolujte, či beží na správnych adresách URL
azd show
```

## 🌍 Problémy s manažmentom prostredí

### Problém: Problémy so prepínaním prostredia
**Príznaky:**
- Používa sa nesprávne prostredie
- Konfigurácia sa nesprávne prepína

**Riešenia:**
```bash
# 1. Zobraziť všetky prostredia
azd env list

# 2. Explicitne vybrať prostredie
azd env select production

# 3. Overiť aktuálne prostredie
azd env show

# 4. Vytvoriť nové prostredie, ak je poškodené
azd env new production-new
azd env select production-new
```

### Problém: Poškodenie prostredia
**Príznaky:**
- Prostredie zobrazuje neplatný stav
- Zdroje nezodpovedajú konfigurácii

**Riešenia:**
```bash
# 1. Obnoviť stav prostredia
azd env refresh

# 2. Resetovať konfiguráciu prostredia
azd env new production-reset
# Skopírovať požadované premenné prostredia
azd env set DATABASE_URL "your-value"

# 3. Importovať existujúce zdroje (ak je to možné)
# Ručne aktualizovať .azure/production/config.json s ID zdrojov
```

## 🔍 Problémy s výkonom

### Problém: Pomalé časy nasadenia
**Príznaky:**
- Nasadenia trvajú príliš dlho
- Časové limity počas nasadenia

**Riešenia:**
```bash
# 1. Nasadzujte konkrétne služby pre rýchlejšiu iteráciu
azd deploy --service web
azd deploy --service api

# 2. Používajte nasadenie iba kódu, keď sa infraštruktúra nezmenila
azd deploy  # Rýchlejšie ako azd up

# 3. Optimalizujte proces zostavovania
# V súbore package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Skontrolujte umiestnenia prostriedkov (použite rovnaký región)
azd config set defaults.location eastus2
```

### Problém: Problémy s výkonom aplikácie
**Príznaky:**
- Pomalé reakčné časy
- Vysoké využitie prostriedkov

**Riešenia:**
```bash
# 1. Zvýšiť zdroje
# Aktualizujte SKU v main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Povoliť monitorovanie Application Insights
azd monitor --overview

# 3. Skontrolujte aplikačné denníky v Azure
az webapp log tail --name myapp --resource-group myrg
# alebo pre Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementovať cache
# Pridajte Redis cache do svojej infraštruktúry
```

## 🛠️ Nástroje a príkazy na riešenie problémov

### Príkazy na ladenie
```bash
# Komplexné ladenie
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Skontrolovať verziu azd
azd version

# Zobraziť aktuálnu konfiguráciu
azd config list

# Otestovať pripojenie
curl -v https://myapp.azurewebsites.net/health
```

### Analýza logov
```bash
# Protokoly aplikácie cez Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitorovanie aplikácie pomocou azd
azd monitor --logs
azd monitor --live

# Protokoly prostriedkov Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Protokoly kontajnerov (pre Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Preskúmanie zdrojov
```bash
# Zobraziť všetky zdroje
az resource list --resource-group myrg -o table

# Skontrolovať stav zdroja
az webapp show --name myapp --resource-group myrg --query state

# Diagnostika siete
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Získanie ďalšej pomoci

### Kedy eskalovať
- Problémy s autentifikáciou pretrvávajú po vyskúšaní všetkých riešení
- Problémy s infraštruktúrou služieb Azure
- Problémy súvisiace s fakturáciou alebo predplatným
- Bezpečnostné obavy alebo incidenty

### Kanály podpory
```bash
# 1. Skontrolujte Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Vytvorte tiket podpory v Azure
# Prejdite na: https://portal.azure.com -> Pomoc a podpora

# 3. Komunitné zdroje
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informácie, ktoré treba zozbierať
Pred kontaktovaním podpory zozbierajte:
- `azd version` výstup
- `azd config list` výstup
- `azd show` výstup (aktuálny stav nasadenia)
- Chybové hlášky (plný text)
- Kroky na reprodukciu problému
- Detaily prostredia (`azd env show`)
- Časová os, kedy sa problém začal

### Skript na zber logov
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Prevencia problémov

### Kontrolný zoznam pred nasadením
```bash
# 1. Overiť autentifikáciu
az account show

# 2. Skontrolovať kvóty a limity
az vm list-usage --location eastus2

# 3. Overiť šablóny
az bicep build --file infra/main.bicep

# 4. Najprv otestujte lokálne
npm run build
npm run test

# 5. Použiť skúšobné nasadenia
azd provision --preview
```

### Nastavenie monitorovania
```bash
# Povoliť Application Insights
# Pridať do main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Nastaviť upozornenia
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Pravidelná údržba
```bash
# Týždenné kontroly stavu
./scripts/health-check.sh

# Mesačné prehodnotenie nákladov
az consumption usage list --billing-period-name 202401

# Štvrťročné preskúmanie bezpečnosti
az security assessment list --resource-group myrg
```

## Súvisiace zdroje

- [Príručka ladenia](debugging.md) - Pokročilé techniky ladenia
- [Provisionovanie zdrojov](../chapter-04-infrastructure/provisioning.md) - Riešenie problémov infraštruktúry
- [Plánovanie kapacity](../chapter-06-pre-deployment/capacity-planning.md) - Usmernenia pre plánovanie zdrojov
- [Výber SKU](../chapter-06-pre-deployment/sku-selection.md) - Odporúčania pre úrovne služieb

---

**Tip**: Majte túto príručku uloženú v záložkách a odkazujte sa na ňu vždy, keď narazíte na problém. Väčšina problémov bola už zaznamenaná a má osvedčené riešenia!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Provisionovanie zdrojov](../chapter-04-infrastructure/provisioning.md)
- **Nasledujúca lekcia**: [Príručka ladenia](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vylúčenie zodpovednosti:
Tento dokument bol preložený pomocou automatizovanej AI prekladateľskej služby Co-op Translator (https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, upozorňujeme, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku treba považovať za autoritatívny zdroj. Pre dôležité informácie odporúčame využiť profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->