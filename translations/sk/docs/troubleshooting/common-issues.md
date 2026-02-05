# Bežné problémy a riešenia

**Navigácia kapitol:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca kapitola**: [Kapitola 6: Kontroly pred nasadením](../pre-deployment/preflight-checks.md)
- **➡️ Ďalej**: [Príručka na ladenie](debugging.md)
- **🚀 Nasledujúca kapitola**: [Kapitola 8: Produkčné a podnikové vzory](../microsoft-foundry/production-ai-practices.md)

## Úvod

Táto komplexná príručka na riešenie problémov pokrýva najčastejšie problémy pri používaní Azure Developer CLI. Naučte sa diagnostikovať, riešiť a odstraňovať bežné problémy s autentifikáciou, nasadením, poskytovaním infraštruktúry a konfiguráciou aplikácií. Každý problém obsahuje podrobné príznaky, hlavné príčiny a postupy krok za krokom na jeho vyriešenie.

## Ciele učenia

Po dokončení tejto príručky budete:
- Ovládať diagnostické techniky pre problémy s Azure Developer CLI
- Rozumieť bežným problémom s autentifikáciou a povoleniami a ich riešeniam
- Riešiť zlyhania nasadenia, chyby pri poskytovaní infraštruktúry a problémy s konfiguráciou
- Implementovať proaktívne monitorovanie a stratégie ladenia
- Používať systematické metodológie riešenia problémov pri zložitých problémoch
- Nastaviť správne logovanie a monitorovanie na prevenciu budúcich problémov

## Výsledky učenia

Po dokončení budete schopní:
- Diagnostikovať problémy s Azure Developer CLI pomocou vstavaných diagnostických nástrojov
- Samostatne riešiť problémy s autentifikáciou, predplatným a povoleniami
- Efektívne riešiť zlyhania nasadenia a chyby pri poskytovaní infraštruktúry
- Ladiť problémy s konfiguráciou aplikácií a problémy špecifické pre prostredie
- Implementovať monitorovanie a upozornenia na proaktívnu identifikáciu potenciálnych problémov
- Používať osvedčené postupy pre logovanie, ladenie a pracovné postupy na riešenie problémov

## Rýchla diagnostika

Predtým, než sa pustíte do konkrétnych problémov, spustite tieto príkazy na získanie diagnostických informácií:

```bash
# Skontrolujte verziu azd a stav
azd version
azd config list

# Overte autentifikáciu Azure
az account show
az account list

# Skontrolujte aktuálne prostredie
azd env show
azd env get-values

# Povoliť ladenie logovania
export AZD_DEBUG=true
azd <command> --debug
```

## Problémy s autentifikáciou

### Problém: "Nepodarilo sa získať prístupový token"
**Príznaky:**
- `azd up` zlyháva s chybami autentifikácie
- Príkazy vracajú "neautorizované" alebo "prístup zamietnutý"

**Riešenia:**
```bash
# 1. Znova sa autentifikujte pomocou Azure CLI
az login
az account show

# 2. Vymažte uložené poverenia
az account clear
az login

# 3. Použite tok kódu zariadenia (pre systémy bez hlavy)
az login --use-device-code

# 4. Nastavte explicitné predplatné
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problém: "Nedostatočné oprávnenia" počas nasadenia
**Príznaky:**
- Nasadenie zlyháva s chybami povolení
- Nie je možné vytvoriť určité Azure zdroje

**Riešenia:**
```bash
# 1. Skontrolujte svoje priradenia rolí v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Uistite sa, že máte požadované role
# - Prispievateľ (pre vytváranie zdrojov)
# - Administrátor prístupu používateľa (pre priradenie rolí)

# 3. Kontaktujte svojho administrátora Azure pre správne povolenia
```

### Problém: Problémy s autentifikáciou v multi-tenant prostredí
**Riešenia:**
```bash
# 1. Prihlásiť sa s konkrétnym nájomcom
az login --tenant "your-tenant-id"

# 2. Nastaviť nájomcu v konfigurácii
azd config set auth.tenantId "your-tenant-id"

# 3. Vymazať vyrovnávaciu pamäť nájomcu pri zmene nájomcov
az account clear
```

## 🏗️ Chyby pri poskytovaní infraštruktúry

### Problém: Konflikty názvov zdrojov
**Príznaky:**
- Chyby "Názov zdroja už existuje"
- Nasadenie zlyháva počas vytvárania zdrojov

**Riešenia:**
```bash
# 1. Použite jedinečné názvy zdrojov s tokenmi
# Vo vašej Bicep šablóne:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Zmeňte názov prostredia
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Vyčistite existujúce zdroje
azd down --force --purge
```

### Problém: Nedostupnosť lokality/oblasti
**Príznaky:**
- "Lokalita 'xyz' nie je dostupná pre typ zdroja"
- Určité SKUs nie sú dostupné vo vybranej oblasti

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

### Problém: Chyby prekročenia kvóty
**Príznaky:**
- "Kvóta prekročená pre typ zdroja"
- "Dosiahnutý maximálny počet zdrojov"

**Riešenia:**
```bash
# 1. Skontrolujte aktuálne využitie kvóty
az vm list-usage --location eastus2 -o table

# 2. Požiadajte o zvýšenie kvóty cez Azure portál
# Choďte na: Predplatné > Využitie + kvóty

# 3. Použite menšie SKUs pre vývoj
# V main.parameters.json:
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
- Zlyhania validácie šablón
- Chyby syntaxe v Bicep súboroch

**Riešenia:**
```bash
# 1. Overiť syntax Bicep
az bicep build --file infra/main.bicep

# 2. Použiť linter Bicep
az bicep lint --file infra/main.bicep

# 3. Skontrolovať syntax súboru parametrov
cat infra/main.parameters.json | jq '.'

# 4. Náhľad zmien nasadenia
azd provision --preview
```

## 🚀 Zlyhania nasadenia

### Problém: Zlyhania zostavenia
**Príznaky:**
- Aplikácia sa nepodarí zostaviť počas nasadenia
- Chyby pri inštalácii balíkov

**Riešenia:**
```bash
# 1. Skontrolujte denníky zostavenia
azd logs --service web
azd deploy --service web --debug

# 2. Otestujte zostavenie lokálne
cd src/web
npm install
npm run build

# 3. Skontrolujte kompatibilitu verzií Node.js/Python
node --version  # Mal by zodpovedať nastaveniam azure.yaml
python --version

# 4. Vymažte vyrovnávaciu pamäť zostavenia
rm -rf node_modules package-lock.json
npm install

# 5. Skontrolujte Dockerfile, ak používate kontajnery
docker build -t test-image .
docker run --rm test-image
```

### Problém: Zlyhania nasadenia kontajnerov
**Príznaky:**
- Kontajnerové aplikácie sa nepodarí spustiť
- Chyby pri sťahovaní obrazu

**Riešenia:**
```bash
# 1. Otestujte lokálnu zostavu Dockeru
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Skontrolujte logy kontajnera
azd logs --service api --follow

# 3. Overte prístup k registru kontajnerov
az acr login --name myregistry

# 4. Skontrolujte konfiguráciu aplikácie kontajnera
az containerapp show --name my-app --resource-group my-rg
```

### Problém: Chyby pripojenia k databáze
**Príznaky:**
- Aplikácia sa nemôže pripojiť k databáze
- Chyby časového limitu pripojenia

**Riešenia:**
```bash
# 1. Skontrolujte pravidlá firewallu databázy
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Otestujte konektivitu z aplikácie
# Dočasne pridajte do svojej aplikácie:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Overte formát reťazca pripojenia
azd env get-values | grep DATABASE

# 4. Skontrolujte stav servera databázy
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problémy s konfiguráciou

### Problém: Prostredné premenné nefungujú
**Príznaky:**
- Aplikácia nemôže čítať hodnoty konfigurácie
- Prostredné premenné sa zdajú byť prázdne

**Riešenia:**
```bash
# 1. Overte, či sú nastavené environmentálne premenné
azd env get-values
azd env get DATABASE_URL

# 2. Skontrolujte názvy premenných v azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Reštartujte aplikáciu
azd deploy --service web

# 4. Skontrolujte konfiguráciu služby aplikácie
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problém: Problémy s SSL/TLS certifikátmi
**Príznaky:**
- HTTPS nefunguje
- Chyby validácie certifikátov

**Riešenia:**
```bash
# 1. Skontrolujte stav certifikátu SSL
az webapp config ssl list --resource-group myrg

# 2. Povoliť iba HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Pridať vlastnú doménu (ak je potrebné)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problém: Problémy s konfiguráciou CORS
**Príznaky:**
- Frontend nemôže volať API
- Blokované požiadavky z iného pôvodu

**Riešenia:**
```bash
# 1. Nakonfigurujte CORS pre App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Aktualizujte API na spracovanie CORS
# V Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Skontrolujte, či beží na správnych URL adresách
azd show
```

## 🌍 Problémy s manažmentom prostredia

### Problém: Problémy s prepínaním prostredí
**Príznaky:**
- Používa sa nesprávne prostredie
- Konfigurácia sa neprepína správne

**Riešenia:**
```bash
# 1. Zoznam všetkých prostredí
azd env list

# 2. Výslovne vybrať prostredie
azd env select production

# 3. Overiť aktuálne prostredie
azd env show

# 4. Vytvoriť nové prostredie, ak je poškodené
azd env new production-new
azd env select production-new
```

### Problém: Poškodenie prostredia
**Príznaky:**
- Prostredie ukazuje neplatný stav
- Zdroje nezodpovedajú konfigurácii

**Riešenia:**
```bash
# 1. Obnoviť stav prostredia
azd env refresh

# 2. Resetovať konfiguráciu prostredia
azd env new production-reset
# Skopírovať potrebné premenné prostredia
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
# 1. Povoliť paralelné nasadenie
azd config set deploy.parallelism 5

# 2. Použiť inkrementálne nasadenia
azd deploy --incremental

# 3. Optimalizovať proces zostavovania
# V package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Skontrolovať umiestnenia zdrojov (použiť rovnaký región)
azd config set defaults.location eastus2
```

### Problém: Problémy s výkonom aplikácie
**Príznaky:**
- Pomalé časy odozvy
- Vysoké využitie zdrojov

**Riešenia:**
```bash
# 1. Zväčšiť zdroje
# Aktualizovať SKU v main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Povoliť monitorovanie Application Insights
azd monitor

# 3. Skontrolovať logy aplikácie kvôli úzkym miestam
azd logs --service api --follow

# 4. Implementovať caching
# Pridať Redis cache do vašej infraštruktúry
```

## 🛠️ Nástroje a príkazy na riešenie problémov

### Príkazy na ladenie
```bash
# Komplexné ladenie
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Skontrolovať systémové informácie
azd info

# Overiť konfiguráciu
azd config validate

# Otestovať pripojenie
curl -v https://myapp.azurewebsites.net/health
```

### Analýza logov
```bash
# Protokoly aplikácie
azd logs --service web --follow
azd logs --service api --since 1h

# Protokoly zdrojov Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Protokoly kontajnera (pre aplikácie kontajnera)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Vyšetrenie zdrojov
```bash
# Zoznam všetkých zdrojov
az resource list --resource-group myrg -o table

# Skontrolovať stav zdroja
az webapp show --name myapp --resource-group myrg --query state

# Diagnostika siete
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Získanie ďalšej pomoci

### Kedy eskalovať
- Problémy s autentifikáciou pretrvávajú po vyskúšaní všetkých riešení
- Problémy s infraštruktúrou Azure služieb
- Problémy súvisiace s fakturáciou alebo predplatným
- Bezpečnostné obavy alebo incidenty

### Kanály podpory
```bash
# 1. Skontrolujte stav služby Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Vytvorte podporný tiket Azure
# Prejdite na: https://portal.azure.com -> Pomoc + podpora

# 3. Komunitné zdroje
# - Stack Overflow: značka azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informácie na zhromaždenie
Pred kontaktovaním podpory zhromaždite:
- Výstup `azd version`
- Výstup `azd info`
- Chybové správy (celý text)
- Kroky na reprodukciu problému
- Detaily prostredia (`azd env show`)
- Časovú os, kedy problém začal

### Skript na zhromaždenie logov
```bash
#!/bin/bash
# zhromaždiť-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

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

# 5. Použiť nasadenia na skúšku
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

# Mesačný prehľad nákladov
az consumption usage list --billing-period-name 202401

# Štvrťročná kontrola bezpečnosti
az security assessment list --resource-group myrg
```

## Súvisiace zdroje

- [Príručka na ladenie](debugging.md) - Pokročilé techniky ladenia
- [Poskytovanie zdrojov](../deployment/provisioning.md) - Riešenie problémov s infraštruktúrou
- [Plánovanie kapacity](../pre-deployment/capacity-planning.md) - Usmernenia na plánovanie zdrojov
- [Výber SKU](../pre-deployment/sku-selection.md) - Odporúčania pre úrovne služieb

---

**Tip**: Uložte si túto príručku do záložiek a odkazujte na ňu vždy, keď narazíte na problémy. Väčšina problémov už bola zaznamenaná a má stanovené riešenia!

---

**Navigácia**
- **Predchádzajúca lekcia**: [Poskytovanie zdrojov](../deployment/provisioning.md)
- **Nasledujúca lekcia**: [Príručka na ladenie](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Aj keď sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->