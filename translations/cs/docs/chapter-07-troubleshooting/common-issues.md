# Běžné problémy a řešení

**Navigace kapitol:**
- **📚 Domov kurzu**: [AZD For Beginners](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Odstraňování problémů a ladění
- **⬅️ Předchozí kapitola**: [Kapitola 6: Kontroly před nasazením](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Další**: [Průvodce laděním](debugging.md)
- **🚀 Následující kapitola**: [Kapitola 8: Produkční & podnikové vzory](../chapter-08-production/production-ai-practices.md)

## Úvod

Tento komplexní průvodce řešením problémů pokrývá nejčastěji se vyskytující potíže při používání Azure Developer CLI. Naučte se diagnostikovat, řešit a opravovat běžné problémy s autentizací, nasazením, zřizováním infrastruktury a konfigurací aplikací. Každý problém obsahuje podrobné symptomy, hlavní příčiny a postupy řešení krok za krokem.

## Cíle učení

Po dokončení tohoto průvodce budete:
- Ovládat diagnostické techniky pro problémy s Azure Developer CLI
- Rozumět běžným problémům s autentizací a oprávněními a jejich řešením
- Řešit selhání nasazení, chyby při zřizování infrastruktury a problémy s konfigurací
- Implementovat proaktivní monitorování a strategie ladění
- Používat systematické metodiky řešení problémů u složitých případů
- Nastavit správné logování a monitorování, aby se předešlo budoucím problémům

## Výsledky učení

Po dokončení budete schopni:
- Diagnostikovat problémy Azure Developer CLI pomocí vestavěných diagnostických nástrojů
- Nezávisle řešit problémy s autentizací, předplatným a oprávněními
- Efektivně řešit selhání nasazení a chyby při zřizování infrastruktury
- Ladit problémy s konfigurací aplikací a specifické problémy prostředí
- Implementovat monitorování a alertování k proaktivní identifikaci potenciálních problémů
- Uplatňovat osvědčené postupy pro logování, ladění a workflowy řešení problémů

## Rychlá diagnostika

Před ponořením se do konkrétních problémů spusťte tyto příkazy pro získání diagnostických informací:

```bash
# Zkontrolovat verzi a stav azd
azd version
azd config list

# Ověřit autentizaci Azure
az account show
az account list

# Zkontrolovat aktuální prostředí
azd env show
azd env get-values

# Povolit ladicí protokolování
export AZD_DEBUG=true
azd <command> --debug
```

## Problémy s ověřováním

### Problém: "Nepodařilo se získat přístupový token"
**Příznaky:**
- `azd up` selže s chybami ověřování
- Příkazy vracejí "unauthorized" nebo "access denied"

**Řešení:**
```bash
# 1. Znovu se přihlaste pomocí Azure CLI
az login
az account show

# 2. Vymažte uložené přihlašovací údaje
az account clear
az login

# 3. Použijte ověřování pomocí kódu zařízení (pro bezhlavé systémy)
az login --use-device-code

# 4. Nastavte explicitní předplatné
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problém: "Nedostatečná oprávnění" během nasazení
**Příznaky:**
- Nasazení selže s chybami oprávnění
- Nelze vytvořit některé Azure prostředky

**Řešení:**
```bash
# 1. Zkontrolujte svá přiřazení rolí v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ujistěte se, že máte požadované role
# - Contributor (pro vytváření prostředků)
# - User Access Administrator (pro přiřazování rolí)

# 3. Kontaktujte svého administrátora Azure ohledně potřebných oprávnění
```

### Problém: Problémy s ověřováním v multitenant prostředí
**Řešení:**
```bash
# 1. Přihlaste se s konkrétním tenantem
az login --tenant "your-tenant-id"

# 2. Nastavte tenanta v konfiguraci
azd config set auth.tenantId "your-tenant-id"

# 3. Vymažte mezipaměť tenanta při přepínání tenantů
az account clear
```

## 🏗️ Chyby při zřizování infrastruktury

### Problém: Konflikty názvů zdrojů
**Příznaky:**
- Chyby "The resource name already exists"
- Nasazení selže během vytváření zdrojů

**Řešení:**
```bash
# 1. Použijte jedinečná jména prostředků pomocí tokenů
# Ve vaší šabloně Bicep:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Změňte název prostředí
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Odstraňte existující prostředky
azd down --force --purge
```

### Problém: Umístění/region není dostupný
**Příznaky:**
- Chyba "The location 'xyz' is not available for resource type"
- Některé SKU nejsou dostupné ve vybraném regionu

**Řešení:**
```bash
# 1. Zkontrolujte dostupná umístění pro typy prostředků
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Použijte běžně dostupné regiony
azd config set defaults.location eastus2
# nebo
azd env set AZURE_LOCATION eastus2

# 3. Zkontrolujte dostupnost služeb podle regionu
# Navštivte: https://azure.microsoft.com/global-infrastructure/services/
```

### Problém: Překročení kvóty
**Příznaky:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Řešení:**
```bash
# 1. Zkontrolujte aktuální využití kvóty
az vm list-usage --location eastus2 -o table

# 2. Požádejte o zvýšení kvóty přes portál Azure
# Přejděte na: Předplatná > Využití + kvóty

# 3. Použijte menší SKU pro vývoj
# V souboru main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Odstraňte nepoužívané prostředky
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problém: Chyby šablony Bicep
**Příznaky:**
- Selhání validace šablony
- Syntaktické chyby v Bicep souborech

**Řešení:**
```bash
# 1. Ověřit syntaxi Bicep
az bicep build --file infra/main.bicep

# 2. Použít linter pro Bicep
az bicep lint --file infra/main.bicep

# 3. Zkontrolovat syntaxi souboru s parametry
cat infra/main.parameters.json | jq '.'

# 4. Zobrazit náhled změn nasazení
azd provision --preview
```

## 🚀 Selhání nasazení

### Problém: Selhání sestavení
**Příznaky:**
- Aplikace se během nasazení nepodaří sestavit
- Chyby při instalaci balíčků

**Řešení:**
```bash
# 1. Zkontrolujte výstup sestavení s přepínačem pro ladění
azd deploy --service web --debug

# 2. Zobrazte stav nasazené služby
azd show

# 3. Otestujte sestavení lokálně
cd src/web
npm install
npm run build

# 3. Zkontrolujte kompatibilitu verzí Node.js a Pythonu
node --version  # Mělo by odpovídat nastavením v souboru azure.yaml
python --version

# 4. Vyčistěte mezipaměť sestavení
rm -rf node_modules package-lock.json
npm install

# 5. Zkontrolujte Dockerfile, pokud používáte kontejnery
docker build -t test-image .
docker run --rm test-image
```

### Problém: Selhání nasazení kontejneru
**Příznaky:**
- Aplikace kontejnerů se nespustí
- Chyby při stahování image

**Řešení:**
```bash
# 1. Otestujte lokální sestavení Dockeru
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Zkontrolujte protokoly kontejneru pomocí Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Sledujte aplikaci pomocí azd
azd monitor --logs

# 3. Ověřte přístup k registru kontejnerů
az acr login --name myregistry

# 4. Zkontrolujte konfiguraci kontejnerové aplikace
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
# Do vaší aplikace dočasně přidejte:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Ověřte formát připojovacího řetězce
azd env get-values | grep DATABASE

# 4. Zkontrolujte stav databázového serveru
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Problémy s konfigurací

### Problém: Proměnné prostředí nefungují
**Příznaky:**
- Aplikace nemůže číst konfigurační hodnoty
- Proměnné prostředí se jeví jako prázdné

**Řešení:**
```bash
# 1. Ověřte, že jsou nastaveny proměnné prostředí
azd env get-values
azd env get DATABASE_URL

# 2. Zkontrolujte názvy proměnných v azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restartujte aplikaci
azd deploy --service web

# 4. Zkontrolujte konfiguraci App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problém: Problémy s SSL/TLS certifikáty
**Příznaky:**
- HTTPS nefunguje
- Chyby ověřování certifikátu

**Řešení:**
```bash
# 1. Zkontrolovat stav SSL certifikátu
az webapp config ssl list --resource-group myrg

# 2. Povolit pouze HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Přidat vlastní doménu (pokud je potřeba)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problém: Problémy s konfigurací CORS
**Příznaky:**
- Frontend nemůže volat API
- Požadavek z jiného původu je zablokován

**Řešení:**
```bash
# 1. Nakonfigurujte CORS pro App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Aktualizujte API, aby zpracovávalo CORS
# V Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Zkontrolujte, zda běží na správných URL
azd show
```

## 🌍 Problémy správy prostředí

### Problém: Problémy s přepínáním prostředí
**Příznaky:**
- Používá se špatné prostředí
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
- Prostředky neodpovídají konfiguraci

**Řešení:**
```bash
# 1. Obnovit stav prostředí
azd env refresh

# 2. Resetovat konfiguraci prostředí
azd env new production-reset
# Zkopírujte požadované proměnné prostředí
azd env set DATABASE_URL "your-value"

# 3. Importovat existující zdroje (pokud je to možné)
# Ručně aktualizujte .azure/production/config.json s ID zdrojů
```

## 🔍 Problémy s výkonem

### Problém: Pomalé časy nasazení
**Příznaky:**
- Nasazení trvá příliš dlouho
- Časové limity během nasazení

**Řešení:**
```bash
# 1. Nasazujte konkrétní služby pro rychlejší iterace
azd deploy --service web
azd deploy --service api

# 2. Použijte nasazení pouze kódu, když se infrastruktura nezměnila
azd deploy  # Rychlejší než azd up

# 3. Optimalizujte proces sestavení
# V souboru package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Zkontrolujte umístění prostředků (použijte stejný region)
azd config set defaults.location eastus2
```

### Problém: Problémy s výkonem aplikace
**Příznaky:**
- Pomalé odezvy
- Vysoké využití prostředků

**Řešení:**
```bash
# 1. Zvyšte zdroje
# Aktualizujte SKU v souboru main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Povolte monitorování pomocí Application Insights
azd monitor --overview

# 3. Zkontrolujte protokoly aplikace v Azure
az webapp log tail --name myapp --resource-group myrg
# nebo pro Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Zaveďte kešování
# Přidejte Redis cache do vaší infrastruktury
```

## 🛠️ Nástroje a příkazy pro odstraňování problémů

### Příkazy pro ladění
```bash
# Komplexní ladění
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Zkontrolovat verzi azd
azd version

# Zobrazit aktuální konfiguraci
azd config list

# Otestovat připojení
curl -v https://myapp.azurewebsites.net/health
```

### Analýza logů
```bash
# Protokoly aplikace přes Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitorování aplikace pomocí azd
azd monitor --logs
azd monitor --live

# Protokoly prostředků Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Protokoly kontejnerů (pro Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Zkoumání zdrojů
```bash
# Vypsat všechny zdroje
az resource list --resource-group myrg -o table

# Zkontrolovat stav zdroje
az webapp show --name myapp --resource-group myrg --query state

# Diagnostika sítě
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Získání další pomoci

### Kdy eskalovat
- Problémy s ověřováním přetrvávají i po vyzkoušení všech řešení
- Problémy s infrastrukturou u služeb Azure
- Problémy s účtováním nebo předplatným
- Bezpečnostní obavy nebo incidenty

### Kanály podpory
```bash
# 1. Zkontrolujte stav služeb Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Vytvořte požadavek na podporu Azure
# Přejděte na: https://portal.azure.com -> Nápověda a podpora

# 3. Komunitní zdroje
# - Stack Overflow: štítek azure-developer-cli
# - Problémy na GitHubu: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informace k získání
Před kontaktováním podpory shromážděte:
- `azd version` output
- `azd config list` output
- `azd show` output (aktuální stav nasazení)
- Chybové zprávy (plný text)
- Kroky k reprodukci problému
- Detaily prostředí (`azd env show`)
- Časová osa, kdy problém začal

### Skript pro sběr logů
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

## 📊 Prevence problémů

### Kontrolní seznam před nasazením
```bash
# 1. Ověřit autentizaci
az account show

# 2. Zkontrolovat kvóty a limity
az vm list-usage --location eastus2

# 3. Ověřit šablony
az bicep build --file infra/main.bicep

# 4. Nejprve otestovat lokálně
npm run build
npm run test

# 5. Použít nasazení v režimu dry-run
azd provision --preview
```

### Nastavení monitoringu
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
# Týdenní kontroly stavu
./scripts/health-check.sh

# Měsíční revize nákladů
az consumption usage list --billing-period-name 202401

# Čtvrtletní přezkum bezpečnosti
az security assessment list --resource-group myrg
```

## Související zdroje

- [Průvodce laděním](debugging.md) - Pokročilé techniky ladění
- [Zřizování zdrojů](../chapter-04-infrastructure/provisioning.md) - Řešení problémů s infrastrukturou
- [Plánování kapacity](../chapter-06-pre-deployment/capacity-planning.md) - Pokyny pro plánování zdrojů
- [Výběr SKU](../chapter-06-pre-deployment/sku-selection.md) - Doporučení pro úrovně služeb

---

**Tip**: Uložte si tento průvodce do záložek a odkazujte se na něj vždy, když narazíte na problémy. Většina problémů již byla dříve zaznamenána a má osvědčená řešení!

---

**Navigace**
- **Předchozí lekce**: [Zřizování zdrojů](../chapter-04-infrastructure/provisioning.md)
- **Další lekce**: [Průvodce laděním](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí služby automatického překladu založené na umělé inteligenci [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli usilujeme o přesnost, vezměte prosím na vědomí, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v originálním jazyce by měl být považován za rozhodující zdroj. Pro zásadní informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo mylné výklady vzniklá v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->