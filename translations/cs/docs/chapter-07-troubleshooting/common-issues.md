# Běžné problémy a řešení

**Navigace kapitolou:**
- **📚 Domů kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí kapitola**: [Kapitola 6: Kontroly před nasazením](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Další**: [Průvodce laděním](debugging.md)
- **🚀 Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../chapter-08-production/production-ai-practices.md)

## Úvod

Tento komplexní průvodce řešením problémů pokrývá nejčastěji se vyskytující potíže při používání Azure Developer CLI. Naučíte se diagnostikovat, řešit a odstranit běžné problémy s ověřováním, nasazením, poskytováním infrastruktury a konfigurací aplikací. Každý problém obsahuje podrobné příznaky, hlavní příčiny a postupy k jeho řešení krok za krokem.

## Vzdělávací cíle

Dokončením tohoto průvodce budete:
- Mistrovsky ovládat diagnostické techniky pro Azure Developer CLI
- Rozumět běžným problémům s ověřováním a oprávněními a jejich řešením
- Řešit selhání nasazení, chyby při poskytování infrastruktury a potíže s konfigurací
- Implementovat proaktivní sledování a strategie pro ladění
- Používat systematické metodiky řešení složitých problémů
- Konfigurovat správné protokolování a monitorování k předcházení budoucích problémů

## Výsledky učení

Po dokončení budete schopni:
- Diagnostikovat problémy Azure Developer CLI pomocí vestavěných diagnostických nástrojů
- Samostatně řešit problémy s ověřováním, předplatným a oprávněními
- Efektivně řešit selhání nasazení a chyby poskytování infrastruktury
- Ladit potíže s konfigurací aplikací a problémy specifické pro prostředí
- Implementovat monitorování a upozornění k proaktivní identifikaci možných potíží
- Aplikovat osvědčené postupy pro protokolování, ladění a řešení problémů

## Rychlá diagnostika

Než se pustíte do konkrétních problémů, spusťte tyto příkazy pro shromáždění diagnostických informací:

```bash
# Zkontrolujte verzi a stav azd
azd version
azd config show

# Ověřte autentizaci Azure
az account show
az account list

# Zkontrolujte aktuální prostředí
azd env list
azd env get-values

# Povolit ladicí protokolování
export AZD_DEBUG=true
azd <command> --debug
```

## Problémy s ověřováním

### Problém: "Nepodařilo se získat přístupový token"
**Příznaky:**
- `azd up` selhává s chybami ověřování
- Příkazy vrací "neautorizováno" nebo "přístup odepřen"

**Řešení:**
```bash
# 1. Znovu se ověřte pomocí Azure CLI
az login
az account show

# 2. Vymažte uložené přihlašovací údaje
az account clear
az login

# 3. Použijte tok zařízení (pro systémy bez hlavy)
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
# 1. Zkontrolujte svá přiřazení rolí v Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Ujistěte se, že máte požadované role
# - Přispěvatel (pro vytváření zdrojů)
# - Správce přístupu uživatelů (pro přiřazení rolí)

# 3. Kontaktujte správce Azure pro správná oprávnění
```

### Problém: Problémy s ověřováním více tenantů
**Řešení:**
```bash
# 1. Přihlaste se s konkrétním tenantem
az login --tenant "your-tenant-id"

# 2. Nastavte tenant v konfiguraci
azd config set auth.tenantId "your-tenant-id"

# 3. Vymažte cache tenantů při přepínání tenantů
az account clear
```

## 🏗️ Chyby poskytování infrastruktury

### Problém: Kolize názvů zdrojů
**Příznaky:**
- Chyby "Název zdroje již existuje"
- Selhání nasazení při vytváření zdrojů

**Řešení:**
```bash
# 1. Použijte jedinečné názvy zdrojů s tokeny
# Ve vašem Bicep šabloně:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Změňte název prostředí
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Ukliďte existující zdroje
azd down --force --purge
```

### Problém: Nedostupná lokalita/region
**Příznaky:**
- "Lokalita 'xyz' není dostupná pro typ zdroje"
- Některé SKU nejsou v daném regionu dostupné

**Řešení:**
```bash
# 1. Zkontrolujte dostupná umístění pro typy zdrojů
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Použijte běžně dostupné regiony
azd config set defaults.location eastus2
# nebo
azd env set AZURE_LOCATION eastus2

# 3. Zkontrolujte dostupnost služby podle regionu
# Navštivte: https://azure.microsoft.com/global-infrastructure/services/
```

### Problém: Překročení kvóty
**Příznaky:**
- "Překročena kvóta pro typ zdroje"
- "Dosažen maximální počet zdrojů"

**Řešení:**
```bash
# 1. Zkontrolujte aktuální využití kvóty
az vm list-usage --location eastus2 -o table

# 2. Požádejte o zvýšení kvóty přes portál Azure
# Přejděte na: Předplatná > Využití + kvóty

# 3. Používejte menší SKU pro vývoj
# V main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Vyčistěte nepoužívané zdroje
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problém: Chyby šablony Bicep
**Příznaky:**
- Selhání validace šablony
- Syntaxní chyby v Bicep souborech

**Řešení:**
```bash
# 1. Ověřte syntaxi Bicep
az bicep build --file infra/main.bicep

# 2. Použijte Bicep linter
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
- Chyby instalace balíčků

**Řešení:**
```bash
# 1. Zkontrolujte výstup sestavení s ladicím příznakem
azd deploy --service web --debug

# 2. Zobrazit stav nasazené služby
azd show

# 3. Otestujte sestavení lokálně
cd src/web
npm install
npm run build

# 3. Zkontrolujte kompatibilitu verzí Node.js/Python
node --version  # Mělo by odpovídat nastavením v azure.yaml
python --version

# 4. Vyčistit mezipaměť sestavení
rm -rf node_modules package-lock.json
npm install

# 5. Zkontrolujte Dockerfile, pokud používáte kontejnery
docker build -t test-image .
docker run --rm test-image
```

### Problém: Selhání nasazení kontejnerů
**Příznaky:**
- Kontejnerové aplikace se nespustí
- Chyby stažení image

**Řešení:**
```bash
# 1. Otestujte sestavení Dockeru lokálně
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Zkontrolujte protokoly kontejneru pomocí Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Sledujte aplikaci přes azd
azd monitor --logs

# 3. Ověřte přístup do registru kontejnerů
az acr login --name myregistry

# 4. Zkontrolujte konfiguraci kontejnerové aplikace
az containerapp show --name my-app --resource-group my-rg
```

### Problém: Selhání připojení k databázi
**Příznaky:**
- Aplikace se nemůže připojit k databázi
- Chyby vypršení časového limitu připojení

**Řešení:**
```bash
# 1. Zkontrolujte pravidla firewallu databáze
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Otestujte konektivitu z aplikace
# Dočasně přidejte do vaší aplikace:
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
- Proměnné prostředí vypadají prázdné

**Řešení:**
```bash
# 1. Ověřte, že jsou nastaveny proměnné prostředí
azd env get-values
azd env get DATABASE_URL

# 2. Zkontrolujte názvy proměnných v azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Restartujte aplikaci
azd deploy --service web

# 4. Zkontrolujte konfiguraci aplikační služby
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problém: Problémy s SSL/TLS certifikáty
**Příznaky:**
- HTTPS nefunguje
- Chyby validace certifikátu

**Řešení:**
```bash
# 1. Zkontrolujte stav SSL certifikátu
az webapp config ssl list --resource-group myrg

# 2. Povolit pouze HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Přidejte vlastní doménu (pokud je potřeba)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problém: Problémy s konfigurací CORS
**Příznaky:**
- Frontend nemůže volat API
- Žádost z jiného původu je blokována

**Řešení:**
```bash
# 1. Nakonfigurujte CORS pro App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Aktualizujte API pro správu CORS
# V Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Zkontrolujte, zda běží na správných URL
azd show
```

## 🌍 Problémy se správou prostředí

### Problém: Problémy s přepínáním prostředí
**Příznaky:**
- Používá se nesprávné prostředí
- Konfigurace se správně nepřepíná

**Řešení:**
```bash
# 1. Vypsat všechna prostředí
azd env list

# 2. Explicitně vybrat prostředí
azd env select production

# 3. Ověřit aktuální prostředí
azd env list

# 4. Vytvořit nové prostředí, pokud je poškozené
azd env new production-new
azd env select production-new
```

### Problém: Poškození prostředí
**Příznaky:**
- Prostředí ukazuje neplatný stav
- Zdroje neodpovídají konfiguraci

**Řešení:**
```bash
# 1. Aktualizujte stav prostředí
azd env refresh

# 2. Resetujte konfiguraci prostředí
azd env new production-reset
# Zkopírujte požadované proměnné prostředí
azd env set DATABASE_URL "your-value"

# 3. Importujte existující zdroje (pokud je to možné)
# Ručně aktualizujte .azure/production/config.json s ID zdrojů
```

## 🔍 Problémy s výkonem

### Problém: Pomalá doba nasazení
**Příznaky:**
- Nasazení trvá příliš dlouho
- Vypršení časového limitu během nasazení

**Řešení:**
```bash
# 1. Nasazení specifických služeb pro rychlejší iteraci
azd deploy --service web
azd deploy --service api

# 2. Použijte nasazení pouze kódu, pokud se infrastruktura nezměnila
azd deploy  # Rychlejší než azd up

# 3. Optimalizujte proces sestavení
# V package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Zkontrolujte umístění zdrojů (použijte stejný region)
azd config set defaults.location eastus2
```

### Problém: Problémy s výkonem aplikace
**Příznaky:**
- Pomalé reakce
- Vysoké využití zdrojů

**Řešení:**
```bash
# 1. Zvýšit zdroje
# Aktualizujte SKU v main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Povolit monitorování pomocí Application Insights
azd monitor --overview

# 3. Zkontrolujte protokoly aplikace v Azure
az webapp log tail --name myapp --resource-group myrg
# nebo pro Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementujte ukládání do mezipaměti
# Přidejte Redis cache do své infrastruktury
```

## 🛠️ Nástroje a příkazy pro řešení problémů

### Příkazy pro ladění
```bash
# Komplexní ladění
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Zkontrolujte verzi azd
azd version

# Zobrazit aktuální konfiguraci
azd config show

# Otestovat připojení
curl -v https://myapp.azurewebsites.net/health
```

### Analýza protokolů
```bash
# Protokoly aplikace přes Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitorovat aplikaci pomocí azd
azd monitor --logs
azd monitor --live

# Protokoly zdrojů Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Protokoly kontejneru (pro kontejnerové aplikace)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Vyšetřování zdrojů
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
- Problémy s infrastrukturou Azure služeb
- Problémy s fakturací nebo předplatným
- Bezpečnostní obavy nebo incidenty

### Podpůrné kanály
```bash
# 1. Zkontrolujte stav služby Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Vytvořte žádost o podporu Azure
# Přejděte na: https://portal.azure.com -> Nápověda + podpora

# 3. Komunitní zdroje
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informace k shromáždění
Před kontaktováním podpory shromážděte:
- Výstup `azd version`
- Výstup `azd config show`
- Výstup `azd show` (aktuální stav nasazení)
- Chybové zprávy (plný text)
- Postup reprodukce problému
- Detaily prostředí (`azd env get-values`)
- Časovou osu, kdy se problém objevil

### Skript pro sběr protokolů
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

# 5. Použít nasazení suchým během (dry-run)
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
# Týdenní kontroly zdravotního stavu
./scripts/health-check.sh

# Měsíční přehled nákladů
az consumption usage list --billing-period-name 202401

# Čtvrtletní bezpečnostní přehled
az security assessment list --resource-group myrg
```

## Související zdroje

- [Průvodce laděním](debugging.md) - Pokročilé techniky ladění
- [Poskytování zdrojů](../chapter-04-infrastructure/provisioning.md) - Řešení problémů s infrastrukturou
- [Plánování kapacity](../chapter-06-pre-deployment/capacity-planning.md) - Návody pro plánování zdrojů
- [Výběr SKU](../chapter-06-pre-deployment/sku-selection.md) - Doporučení pro úrovně služeb

---

**Tip**: Mějte tento průvodce v záložkách a odkazujte se na něj vždy, když narazíte na problém. Většina potíží už byla zaznamenána a má ověřená řešení!

---

**Navigace**
- **Předchozí lekce**: [Poskytování zdrojů](../chapter-04-infrastructure/provisioning.md)
- **Následující lekce**: [Průvodce laděním](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v rodném jazyce by měl být považován za závazný zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo chybné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->