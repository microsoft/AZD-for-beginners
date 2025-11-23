<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-23T11:09:57+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "cs"
}
-->
# Běžné problémy a jejich řešení

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí kapitola**: [Kapitola 6: Kontroly před nasazením](../pre-deployment/preflight-checks.md)
- **➡️ Další**: [Průvodce laděním](debugging.md)
- **🚀 Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../microsoft-foundry/production-ai-practices.md)

## Úvod

Tento komplexní průvodce řešením problémů pokrývá nejčastěji se vyskytující problémy při používání Azure Developer CLI. Naučte se diagnostikovat, řešit a odstraňovat běžné problémy s autentizací, nasazením, zajišťováním infrastruktury a konfigurací aplikací. Každý problém obsahuje podrobné příznaky, příčiny a postupy krok za krokem pro jeho vyřešení.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Ovládat diagnostické techniky pro problémy s Azure Developer CLI
- Rozumět běžným problémům s autentizací a oprávněními a jejich řešením
- Řešit chyby při nasazení, problémy se zajišťováním infrastruktury a konfigurací
- Implementovat proaktivní strategie monitorování a ladění
- Používat systematické metodiky řešení složitých problémů
- Nastavit správné logování a monitorování, aby se předešlo budoucím problémům

## Výsledky učení

Po dokončení budete schopni:
- Diagnostikovat problémy s Azure Developer CLI pomocí vestavěných diagnostických nástrojů
- Samostatně řešit problémy s autentizací, předplatným a oprávněními
- Efektivně řešit chyby při nasazení a problémy se zajišťováním infrastruktury
- Ladit problémy s konfigurací aplikací a problémy specifické pro prostředí
- Implementovat monitorování a upozornění pro proaktivní identifikaci potenciálních problémů
- Používat osvědčené postupy pro logování, ladění a pracovní postupy řešení problémů

## Rychlá diagnostika

Než se pustíte do konkrétních problémů, spusťte tyto příkazy pro získání diagnostických informací:

```bash
# Zkontrolujte verzi azd a stav
azd version
azd config list

# Ověřte autentizaci Azure
az account show
az account list

# Zkontrolujte aktuální prostředí
azd env show
azd env get-values

# Aktivujte ladicí protokolování
export AZD_DEBUG=true
azd <command> --debug
```

## Problémy s autentizací

### Problém: "Nepodařilo se získat přístupový token"
**Příznaky:**
- `azd up` selhává s chybami autentizace
- Příkazy vracejí "neautorizováno" nebo "přístup zamítnut"

**Řešení:**
```bash
# 1. Znovu se ověřte pomocí Azure CLI
az login
az account show

# 2. Vymažte uložené přihlašovací údaje
az account clear
az login

# 3. Použijte tok kódu zařízení (pro systémy bez hlavy)
az login --use-device-code

# 4. Nastavte explicitní předplatné
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problém: "Nedostatečná oprávnění" během nasazení
**Příznaky:**
- Nasazení selhává s chybami oprávnění
- Nelze vytvořit určité Azure zdroje

**Řešení:**
```bash
# 1. Zkontrolujte své přiřazení rolí v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ujistěte se, že máte požadované role
# - Přispěvatel (pro vytváření prostředků)
# - Správce přístupu uživatelů (pro přiřazení rolí)

# 3. Kontaktujte svého správce Azure pro správná oprávnění
```

### Problém: Problémy s autentizací v multi-tenant prostředí
**Řešení:**
```bash
# 1. Přihlaste se s konkrétním nájemcem
az login --tenant "your-tenant-id"

# 2. Nastavte nájemce v konfiguraci
azd config set auth.tenantId "your-tenant-id"

# 3. Vymažte mezipaměť nájemce při přepínání nájemců
az account clear
```

## 🏗️ Chyby při zajišťování infrastruktury

### Problém: Konflikty názvů zdrojů
**Příznaky:**
- Chyby "Název zdroje již existuje"
- Nasazení selhává během vytváření zdrojů

**Řešení:**
```bash
# 1. Použijte jedinečné názvy zdrojů s tokeny
# Ve vašem Bicep šabloně:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Změňte název prostředí
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Odstraňte existující zdroje
azd down --force --purge
```

### Problém: Nedostupná lokalita/region
**Příznaky:**
- "Lokalita 'xyz' není dostupná pro typ zdroje"
- Určité SKUs nejsou dostupné ve vybraném regionu

**Řešení:**
```bash
# 1. Zkontrolujte dostupné lokality pro typy zdrojů
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Použijte běžně dostupné regiony
azd config set defaults.location eastus2
# nebo
azd env set AZURE_LOCATION eastus2

# 3. Zkontrolujte dostupnost služeb podle regionu
# Navštivte: https://azure.microsoft.com/global-infrastructure/services/
```

### Problém: Překročené kvóty
**Příznaky:**
- "Kvóta překročena pro typ zdroje"
- "Maximální počet zdrojů dosažen"

**Řešení:**
```bash
# 1. Zkontrolujte aktuální využití kvóty
az vm list-usage --location eastus2 -o table

# 2. Požádejte o zvýšení kvóty prostřednictvím portálu Azure
# Přejděte na: Předplatné > Využití + kvóty

# 3. Použijte menší SKU pro vývoj
# V main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Odstraňte nepoužívané zdroje
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problém: Chyby v šablonách Bicep
**Příznaky:**
- Selhání validace šablon
- Chyby syntaxe v souborech Bicep

**Řešení:**
```bash
# 1. Ověřte syntaxi Bicep
az bicep build --file infra/main.bicep

# 2. Použijte linter Bicep
az bicep lint --file infra/main.bicep

# 3. Zkontrolujte syntaxi souboru parametrů
cat infra/main.parameters.json | jq '.'

# 4. Náhled změn nasazení
azd provision --preview
```

## 🚀 Selhání nasazení

### Problém: Selhání sestavení
**Příznaky:**
- Aplikace se nepodaří sestavit během nasazení
- Chyby při instalaci balíčků

**Řešení:**
```bash
# 1. Zkontrolujte protokoly sestavení
azd logs --service web
azd deploy --service web --debug

# 2. Otestujte sestavení lokálně
cd src/web
npm install
npm run build

# 3. Zkontrolujte kompatibilitu verzí Node.js/Python
node --version  # Mělo by odpovídat nastavením v azure.yaml
python --version

# 4. Vymažte mezipaměť sestavení
rm -rf node_modules package-lock.json
npm install

# 5. Zkontrolujte Dockerfile, pokud používáte kontejnery
docker build -t test-image .
docker run --rm test-image
```

### Problém: Selhání nasazení kontejnerů
**Příznaky:**
- Kontejnerové aplikace se nepodaří spustit
- Chyby při stahování obrazů

**Řešení:**
```bash
# 1. Otestujte lokální sestavení Dockeru
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Zkontrolujte logy kontejneru
azd logs --service api --follow

# 3. Ověřte přístup k registru kontejnerů
az acr login --name myregistry

# 4. Zkontrolujte konfiguraci aplikace kontejneru
az containerapp show --name my-app --resource-group my-rg
```

### Problém: Selhání připojení k databázi
**Příznaky:**
- Aplikace se nemůže připojit k databázi
- Chyby časového limitu připojení

**Řešení:**
```bash
# 1. Zkontrolujte pravidla firewallu databáze
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Otestujte konektivitu z aplikace
# Přidejte do své aplikace dočasně:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Ověřte formát připojovacího řetězce
azd env get-values | grep DATABASE

# 4. Zkontrolujte stav serveru databáze
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problémy s konfigurací

### Problém: Prostředí proměnné nefungují
**Příznaky:**
- Aplikace nemůže číst hodnoty konfigurace
- Prostředí proměnné se zdají prázdné

**Řešení:**
```bash
# 1. Ověřte, zda jsou nastaveny proměnné prostředí
azd env get-values
azd env get DATABASE_URL

# 2. Zkontrolujte názvy proměnných v azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restartujte aplikaci
azd deploy --service web

# 4. Zkontrolujte konfiguraci služby aplikace
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problém: Problémy s SSL/TLS certifikáty
**Příznaky:**
- HTTPS nefunguje
- Chyby validace certifikátů

**Řešení:**
```bash
# 1. Zkontrolujte stav SSL certifikátu
az webapp config ssl list --resource-group myrg

# 2. Povolit pouze HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Přidat vlastní doménu (pokud je potřeba)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problém: Problémy s konfigurací CORS
**Příznaky:**
- Frontend nemůže volat API
- Blokování požadavků z jiných domén

**Řešení:**
```bash
# 1. Nakonfigurujte CORS pro App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Aktualizujte API pro zpracování CORS
# V Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Zkontrolujte, zda běží na správných URL
azd show
```

## 🌍 Problémy s řízením prostředí

### Problém: Problémy s přepínáním prostředí
**Příznaky:**
- Používá se nesprávné prostředí
- Konfigurace se nepřepíná správně

**Řešení:**
```bash
# 1. Vypsat všechna prostředí
azd env list

# 2. Explicitně vybrat prostředí
azd env select production

# 3. Ověřit aktuální prostředí
azd env show

# 4. Vytvořit nové prostředí, pokud je poškozené
azd env new production-new
azd env select production-new
```

### Problém: Poškození prostředí
**Příznaky:**
- Prostředí vykazuje neplatný stav
- Zdroje neodpovídají konfiguraci

**Řešení:**
```bash
# 1. Obnovit stav prostředí
azd env refresh

# 2. Resetovat konfiguraci prostředí
azd env new production-reset
# Zkopírovat požadované proměnné prostředí
azd env set DATABASE_URL "your-value"

# 3. Importovat existující zdroje (pokud je to možné)
# Ručně aktualizovat .azure/production/config.json s ID zdrojů
```

## 🔍 Problémy s výkonem

### Problém: Pomalé časy nasazení
**Příznaky:**
- Nasazení trvá příliš dlouho
- Časové limity během nasazení

**Řešení:**
```bash
# 1. Povolit paralelní nasazení
azd config set deploy.parallelism 5

# 2. Použít inkrementální nasazení
azd deploy --incremental

# 3. Optimalizovat proces sestavení
# V package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Zkontrolovat umístění zdrojů (použít stejný region)
azd config set defaults.location eastus2
```

### Problém: Problémy s výkonem aplikace
**Příznaky:**
- Pomalé odezvy
- Vysoké využití zdrojů

**Řešení:**
```bash
# 1. Zvětšit zdroje
# Aktualizovat SKU v main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Povolit monitorování Application Insights
azd monitor

# 3. Zkontrolovat logy aplikace kvůli úzkým místům
azd logs --service api --follow

# 4. Implementovat ukládání do mezipaměti
# Přidat Redis cache do vaší infrastruktury
```

## 🛠️ Nástroje a příkazy pro řešení problémů

### Ladicí příkazy
```bash
# Komplexní ladění
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Zkontrolovat informace o systému
azd info

# Ověřit konfiguraci
azd config validate

# Otestovat připojení
curl -v https://myapp.azurewebsites.net/health
```

### Analýza logů
```bash
# Protokoly aplikace
azd logs --service web --follow
azd logs --service api --since 1h

# Protokoly zdrojů Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Protokoly kontejnerů (pro Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Vyšetřování zdrojů
```bash
# Seznam všech zdrojů
az resource list --resource-group myrg -o table

# Zkontrolovat stav zdroje
az webapp show --name myapp --resource-group myrg --query state

# Diagnostika sítě
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Získání další pomoci

### Kdy eskalovat
- Problémy s autentizací přetrvávají i po vyzkoušení všech řešení
- Problémy s infrastrukturou u služeb Azure
- Problémy s fakturací nebo předplatným
- Bezpečnostní obavy nebo incidenty

### Kanály podpory
```bash
# 1. Zkontrolujte Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Vytvořte podporu Azure ticket
# Přejděte na: https://portal.azure.com -> Nápověda + podpora

# 3. Komunitní zdroje
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informace k shromáždění
Před kontaktováním podpory shromážděte:
- Výstup `azd version`
- Výstup `azd info`
- Chybové zprávy (celý text)
- Kroky k reprodukci problému
- Detaily prostředí (`azd env show`)
- Časovou osu, kdy problém začal

### Skript pro sběr logů
```bash
#!/bin/bash
# shromáždit-debug-info.sh

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

## 📊 Prevence problémů

### Kontrolní seznam před nasazením
```bash
# 1. Ověřte autentizaci
az account show

# 2. Zkontrolujte kvóty a limity
az vm list-usage --location eastus2

# 3. Ověřte šablony
az bicep build --file infra/main.bicep

# 4. Nejprve otestujte lokálně
npm run build
npm run test

# 5. Použijte nasazení na sucho
azd provision --preview
```

### Nastavení monitorování
```bash
# Povolit Application Insights
# Přidat do main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Nastavit upozornění
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Pravidelná údržba
```bash
# Týdenní zdravotní kontroly
./scripts/health-check.sh

# Měsíční přezkum nákladů
az consumption usage list --billing-period-name 202401

# Čtvrtletní přezkum bezpečnosti
az security assessment list --resource-group myrg
```

## Související zdroje

- [Průvodce laděním](debugging.md) - Pokročilé techniky ladění
- [Zajišťování zdrojů](../deployment/provisioning.md) - Řešení problémů s infrastrukturou
- [Plánování kapacity](../pre-deployment/capacity-planning.md) - Pokyny pro plánování zdrojů
- [Výběr SKU](../pre-deployment/sku-selection.md) - Doporučení pro úrovně služeb

---

**Tip**: Uložte si tento průvodce do záložek a odkazujte na něj, kdykoli narazíte na problémy. Většina problémů již byla zaznamenána a má zavedená řešení!

---

**Navigace**
- **Předchozí lekce**: [Zajišťování zdrojů](../deployment/provisioning.md)
- **Další lekce**: [Průvodce laděním](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho rodném jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->