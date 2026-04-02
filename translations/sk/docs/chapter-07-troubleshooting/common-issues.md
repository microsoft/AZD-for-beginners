# Bežné problémy a riešenia

**Navigácia kapitolou:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 6: Kontroly pred nasadením](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Ďalej**: [Návod na ladenie](debugging.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 8: Produkčné a podnikové vzory](../chapter-08-production/production-ai-practices.md)

## Úvod

Tento komplexný návod na riešenie problémov pokrýva najčastejšie sa vyskytujúce problémy pri používaní Azure Developer CLI. Naučte sa diagnostikovať, riešiť a odstraňovať bežné problémy s autentifikáciou, nasadzovaním, poskytovaním infraštruktúry a konfiguráciou aplikácií. Každý problém obsahuje podrobné príznaky, príčiny a krok za krokom postupy na vyriešenie.

## Vzdelávacie ciele

Po dokončení tohto návodu budete:
- Ovládať diagnostické techniky pre problémy s Azure Developer CLI
- Rozumieť bežným problémom s autentifikáciou a oprávneniami a ich riešeniam
- Riešiť zlyhania nasadenia, chyby pri poskytovaní infraštruktúry a problémy s konfiguráciou
- Implementovať proaktívne monitorovanie a stratégie ladenia
- Používať systematické metodiky riešenia problémov pre zložité situácie
- Nastaviť správne protokolovanie a monitorovanie, aby sa predišlo budúcim problémom

## Dosiahnuté výsledky

Po dokončení budete schopní:
- Diagnostikovať problémy Azure Developer CLI pomocou vstavaných diagnostických nástrojov
- Samostatne riešiť problémy s autentifikáciou, predplatným a oprávneniami
- Efektívne riešiť zlyhania nasadenia a chyby poskytovania infraštruktúry
- Ladieť problémy s konfiguráciou aplikácie a špecifické problémy prostredia
- Implementovať monitorovanie a upozornenia na proaktívne odhaľovanie možných problémov
- Uplatňovať najlepšie postupy pre protokolovanie, ladenie a pracovné toky riešenia problémov

## Rýchla diagnostika

Predtým, než sa pustíte do konkrétnych problémov, spustite tieto príkazy na zozbieranie diagnostických informácií:

```bash
# Skontrolujte verziu a stav azd
azd version
azd config show

# Overte overenie Azure
az account show
az account list

# Skontrolujte aktuálne prostredie
azd env list
azd env get-values

# Povoliť ladenie protokolovania
export AZD_DEBUG=true
azd <command> --debug
```

## Problémy s autentifikáciou

### Problém: „Nepodarilo sa získať prístupový token“
**Príznaky:**
- `azd up` zlyháva s chybami autentifikácie
- Príkazy vracajú „neautorizované“ alebo „prístup odmietnutý“

**Riešenia:**
```bash
# 1. Opätovne sa autentifikujte pomocou Azure CLI
az login
az account show

# 2. Vymažte uložené prihlasovacie údaje
az account clear
az login

# 3. Použite flow zariadenia kódu (pre bezhlavé systémy)
az login --use-device-code

# 4. Nastavte explicitné predplatné
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problém: „Nedostatočné oprávnenia“ počas nasadenia
**Príznaky:**
- Nasadenie zlyháva kvôli chybám oprávnení
- Nie je možné vytvoriť určité Azure zdroje

**Riešenia:**
```bash
# 1. Skontrolujte svoje pridelenia rolí v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Uistite sa, že máte potrebné role
# - Spolupracovník (pre tvorbu zdrojov)
# - Správca prístupu používateľa (pre pridelenie rolí)

# 3. Kontaktujte svojho správcu Azure pre správne povolenia
```

### Problém: Problémy s viacnájomnou autentifikáciou
**Riešenia:**
```bash
# 1. Prihlásiť sa s konkrétnym nájomcom
az login --tenant "your-tenant-id"

# 2. Nastaviť nájomcu v konfigurácii
azd config set auth.tenantId "your-tenant-id"

# 3. Vyčistiť vyrovnávaciu pamäť nájomcu pri prepínaní nájomcov
az account clear
```

## 🏗️ Chyby poskytovania infraštruktúry

### Problém: Konflikty názvov zdrojov
**Príznaky:**
- Chyby „Názov zdroja už existuje“
- Nasadenie zlyháva pri vytváraní zdrojov

**Riešenia:**
```bash
# 1. Používajte jedinečné názvy zdrojov s tokenmi
# Vo vašom Bicep šablóne:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Zmeňte názov prostredia
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Vyčistite existujúce zdroje
azd down --force --purge
```

### Problém: Nepodporovaná lokalita/región
**Príznaky:**
- „Lokalita 'xyz' nie je dostupná pre typ zdroja“
- Niektoré SKU nie sú v zvolenom regióne dostupné

**Riešenia:**
```bash
# 1. Skontrolujte dostupné lokality pre typy zdrojov
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Použite bežne dostupné regióny
azd config set defaults.location eastus2
# alebo
azd env set AZURE_LOCATION eastus2

# 3. Skontrolujte dostupnosť služby podľa regiónu
# Navštívte: https://azure.microsoft.com/global-infrastructure/services/
```

### Problém: Prekročená kvóta
**Príznaky:**
- „Prekročená kvóta pre typ zdroja“
- „Dosiahnutý maximálny počet zdrojov“

**Riešenia:**
```bash
# 1. Skontrolujte aktuálne využitie kvóty
az vm list-usage --location eastus2 -o table

# 2. Požiadajte o zvýšenie kvóty cez Azure portál
# Prejdite na: Predplatné > Použitie + kvóty

# 3. Použite menšie SKU pre vývoj
# V main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Odstráňte nepoužívané zdroje
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problém: Chyby šablóny Bicep
**Príznaky:**
- Neúspešná validácia šablóny
- Syntaxové chyby v súboroch Bicep

**Riešenia:**
```bash
# 1. Overiť syntax Bicep
az bicep build --file infra/main.bicep

# 2. Použiť Bicep linter
az bicep lint --file infra/main.bicep

# 3. Skontrolovať syntax súboru s parametrami
cat infra/main.parameters.json | jq '.'

# 4. Prezrieť zmeny nasadenia
azd provision --preview
```

## 🚀 Zlyhania nasadenia

### Problém: Zlyhanie buildovania
**Príznaky:**
- Aplikácia sa nepodarí zostaviť počas nasadenia
- Chyby pri inštalácii balíkov

**Riešenia:**
```bash
# 1. Skontrolujte výstup zostavenia s ladicou vlajkou
azd deploy --service web --debug

# 2. Zobraziť stav nasadených služieb
azd show

# 3. Otestovať zostavenie lokálne
cd src/web
npm install
npm run build

# 3. Skontrolovať kompatibilitu verzií Node.js/Python
node --version  # Malo by zodpovedať nastaveniam v azure.yaml
python --version

# 4. Vyčistiť vyrovnávaciu pamäť zostavenia
rm -rf node_modules package-lock.json
npm install

# 5. Skontrolujte Dockerfile, ak používate kontajnery
docker build -t test-image .
docker run --rm test-image
```

### Problém: Zlyhania pri nasadení kontajnerov
**Príznaky:**
- Kontajnerové aplikácie sa nespustia
- Chyby pri ťahaní image

**Riešenia:**
```bash
# 1. Otestujte lokálne zostavenie Docker
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Skontrolujte denníky kontajnera pomocou Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Sledujte aplikáciu cez azd
azd monitor --logs

# 3. Overte prístup k registry kontajnerov
az acr login --name myregistry

# 4. Skontrolujte konfiguráciu kontajnerovej aplikácie
az containerapp show --name my-app --resource-group my-rg
```

### Problém: Zlyhania pripojenia k databáze
**Príznaky:**
- Aplikácia sa nemôže pripojiť k databáze
- Chyby časového limitu pripojenia

**Riešenia:**
```bash
# 1. Skontrolujte pravidlá firewallu databázy
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Otestujte pripojenie z aplikácie
# Dočasne pridajte do svojej aplikácie:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Overte formát reťazca pripojenia
azd env get-values | grep DATABASE

# 4. Skontrolujte stav databázového servera
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problémy s konfiguráciou

### Problém: Prostredné premenné nefungujú
**Príznaky:**
- Aplikácia nedokáže načítať konfiguračné hodnoty
- Prostredné premenné sa zobrazujú ako prázdne

**Riešenia:**
```bash
# 1. Overte, či sú nastavené premenné prostredia
azd env get-values
azd env get DATABASE_URL

# 2. Skontrolujte názvy premenných v azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reštartujte aplikáciu
azd deploy --service web

# 4. Skontrolujte konfiguráciu služby aplikácie
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problém: Problémy so SSL/TLS certifikátmi
**Príznaky:**
- HTTPS nefunguje
- Chyby overenia certifikátu

**Riešenia:**
```bash
# 1. Skontrolujte stav SSL certifikátu
az webapp config ssl list --resource-group myrg

# 2. Povoliť iba HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Pridajte vlastnú doménu (ak je potrebné)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problém: Problémy s konfiguráciou CORS
**Príznaky:**
- Frontend nedokáže volať API
- Žiadosti z iných domén sú zablokované

**Riešenia:**
```bash
# 1. Nakonfigurujte CORS pre App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Aktualizujte API pre spracovanie CORS
# V Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Skontrolujte, či sa používa správna URL adresa
azd show
```

## 🌍 Problémy so správou prostredia

### Problém: Problémy s prepínaním prostredí
**Príznaky:**
- Používa sa nesprávne prostredie
- Konfigurácia sa nesprávne prepína

**Riešenia:**
```bash
# 1. Zoznam všetkých prostredí
azd env list

# 2. Explicitný výber prostredia
azd env select production

# 3. Overenie aktuálneho prostredia
azd env list

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

# 2. Obnoviť konfiguráciu prostredia
azd env new production-reset
# Skopírovať požadované premenné prostredia
azd env set DATABASE_URL "your-value"

# 3. Importovať existujúce zdroje (ak je to možné)
# Manuálne aktualizovať .azure/production/config.json s ID zdrojov
```

## 🔍 Problémy s výkonom

### Problém: Pomalý čas nasadenia
**Príznaky:**
- Nasadenia trvajú príliš dlho
- Časové limity počas nasadenia

**Riešenia:**
```bash
# 1. Nasadiť špecifické služby pre rýchlejšiu iteráciu
azd deploy --service web
azd deploy --service api

# 2. Použiť nasadenie iba kódu, keď sa infraštruktúra nezmenila
azd deploy  # Rýchlejšie ako azd up

# 3. Optimalizovať proces buildovania
# V package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Skontrolovať umiestnenie zdrojov (použiť rovnaký región)
azd config set defaults.location eastus2
```

### Problém: Problémy s výkonom aplikácie
**Príznaky:**
- Pomalé reakčné časy
- Vysoké využitie zdrojov

**Riešenia:**
```bash
# 1. Zvýšte zdroje
# Aktualizujte SKU v main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Povoliť monitorovanie Application Insights
azd monitor --overview

# 3. Skontrolujte aplikácie v protokoloch v Azure
az webapp log tail --name myapp --resource-group myrg
# alebo pre Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementujte kešovanie
# Pridajte Redis keš do vašej infraštruktúry
```

## 🛠️ Nástroje a príkazy na riešenie problémov

### Príkazy na ladenie
```bash
# Komplexné ladenie
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Skontrolujte verziu azd
azd version

# Zobraziť aktuálne nastavenie
azd config show

# Otestovať pripojiteľnosť
curl -v https://myapp.azurewebsites.net/health
```

### Analýza protokolov
```bash
# Protokoly aplikácie cez Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitorujte aplikáciu pomocou azd
azd monitor --logs
azd monitor --live

# Protokoly zdrojov Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Protokoly kontajnera (pre Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Skúmanie zdrojov
```bash
# Zoznam všetkých zdrojov
az resource list --resource-group myrg -o table

# Skontrolovať stav zdroja
az webapp show --name myapp --resource-group myrg --query state

# Sieťová diagnostika
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Získanie ďalšej pomoci

### Kedy eskalovať
- Problémy s autentifikáciou pretrvávajú aj po vyskúšaní všetkých riešení
- Problémy s infraštruktúrou Azure služieb
- Problémy súvisiace s fakturáciou alebo predplatným
- Bezpečnostné obavy alebo incidenty

### Podporné kanály
```bash
# 1. Skontrolujte Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Vytvorte lístok podpory Azure
# Prejdite na: https://portal.azure.com -> Pomoc + podpora

# 3. Komunitné zdroje
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informácie, ktoré treba zozbierať
Pred kontaktovaním podpory zhromaždite:
- Výstup `azd version`
- Výstup `azd config show`
- Výstup `azd show` (aktuálny stav nasadenia)
- Chybové hlásenia (plný text)
- Kroky na reprodukciu problému
- Detaily prostredia (`azd env get-values`)
- Časový horizont, kedy sa problém začal

### Skript na zber protokolov
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
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

# 4. Najprv otestovať lokálne
npm run build
npm run test

# 5. Použiť suchý beh nasadení
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
# Týždenné kontroly zdravia
./scripts/health-check.sh

# Mesačná kontrola nákladov
az consumption usage list --billing-period-name 202401

# Štvrťročná bezpečnostná kontrola
az security assessment list --resource-group myrg
```

## Súvisiace zdroje

- [Návod na ladenie](debugging.md) - Pokročilé techniky ladenia
- [Poskytovanie zdrojov](../chapter-04-infrastructure/provisioning.md) - Riešenie problémov s infraštruktúrou
- [Plánovanie kapacity](../chapter-06-pre-deployment/capacity-planning.md) - Návody na plánovanie zdrojov
- [Výber SKU](../chapter-06-pre-deployment/sku-selection.md) - Odporúčania pre úrovne služieb

---

**Tip**: Majte tento návod v záložkách a odkazujte sa naň vždy, keď narazíte na problémy. Väčšina problémov už bola zaznamenaná a má overené riešenia!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Poskytovanie zdrojov](../chapter-04-infrastructure/provisioning.md)
- **Nasledujúca lekcia**: [Návod na ladenie](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, majte prosím na pamäti, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z používania tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->