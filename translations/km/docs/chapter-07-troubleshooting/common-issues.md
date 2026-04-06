# បញ្ហាទូទៅ និងដំណោះស្រាយ

**ចុចផ្លូវជាបទបញ្ជា៖**
- **📚 ទំព័រផ្ទះវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 មុខវិជ្ជាបច្ចុប្បន្ន**: មុខវិជ្ជា 7 - ការដោះស្រាយបញ្ហា និងការត្រួតពិនិត្យកំហុស
- **⬅️ មុខវិជ្ជាហើយ**: [មុខវិជ្ជា 6: ការត្រួតពិនិត្យមុនការចេញផ្សាយ](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ បន្ទាប់**: [មគ្គុទេសក៍កែបញ្ហា](debugging.md)
- **🚀 មុខវិជ្ជាបន្ទាប់**: [មុខវិជ្ជា 8: លំនាំផលិតកម្ម និងសហគ្រាស](../chapter-08-production/production-ai-practices.md)

## មាតិកាទូទៅ

មគ្គុទេសក៍ដោះស្រាយបញ្ហាតាមលំដាប់នេះគ្របដណ្តប់បញ្ហាដែលប្រើប្រាស់ប្រេីមុខមួយៗសម្រាប់ Azure Developer CLI។ រៀនពីរបៀបវាយតម្លៃបញ្ហា, ដោះស្រាយបញ្ហា និងដោះស្រាយបញ្ហាទូទៅដែលមានទាក់ទងនឹងការផ្ទៀងផ្ទាត់, ការចេញផ្សាយ, ការផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ និងការកំណត់កម្មវិធី។ បញ្ហាទាំងអស់មានរាយការណ៍សញ្ញារួមទាំងមូលហេតុដើម និងវិធីដោះស្រាយជាកំហុសដំណាក់កាល។

## គោលបំណងរៀន

ដោយបញ្ចប់មគ្គុទេសក៍នេះ អ្នកនឹងអាច៖
- ជំនាញកំណត់បញ្ហាដោយការវាស់វែងសម្រាប់បញ្ហា Azure Developer CLI
- យល់ដឹងពីបញ្ហាការផ្ទៀងផ្ទាត់ និងសិទ្ធិទូទៅ និងដំណោះស្រាយរបស់វា
- ដោះស្រាយករណីចេញផ្សាយបរាជ័យ, កំហុសផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ និងបញ្ហាការកំណត់
- អនុវត្តការត្រួតពិនិត្យ និងកែបញ្ហាដោយមុន
- អនុវត្តវិធីសាស្រ្តដោះស្រាយបញ្ហាសម្រាប់បញ្ហាស្មុគស្មាញ
- កំណត់ការអនុវត្តការចុះកំណត់ហើយត្រួតពិនិត្យដើម្បីទប់ស្កាត់បញ្ហាអនាគត

## លទ្ធផលក្នុងការរៀន

បន្ទាប់ពីបញ្ចប់ អ្នកនឹងអាច៖
- វាយតម្លៃបញ្ហា Azure Developer CLI ដោយប្រើឧបករណ៍វាយតម្លៃក្នុងខាងក្នុង
- ដោះស្រាយបញ្ហាការផ្ទៀងផ្ទាត់, ការជាវសេវា និងបញ្ហាសិទិ្ធដោយផ្ទាល់ខ្លួន
- ដោះស្រាយបញ្ហាចេញផ្សាយបរាជ័យ និងកំហុសផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធបានយ៉ាងមានប្រសិទ្ធភាព
- កែបញ្ហាការកំណត់កម្មវិធី និងបញ្ហាបរិស្ថានជាក់លាក់បាន
- អនុវត្តការត្រួតពិនិត្យ និងព្រមានដើម្បីរកឃើញបញ្ហាដែលអាចកើតមានជាមុន
- អនុវត្តអនុសាសន៍កំណត់កំណត់ហើយបញ្ចូលច្រកហើយបញ្ហាដំណោះស្រាយ

## ការវាស់វែងលឿន

មុនជម្រះចូលទៅកាន់បញ្ហាផ្ទាល់ សូមបញ្ជូលពាក្យបញ្ជារខាងក្រោមដើម្បីប្រមូលព័ត៌មានវាស់វែង៖

```bash
# ពិនិត្យមើលកំណែ និងសុខភាព azd
azd version
azd config show

# ផ្ទៀងផ្ទាត់ការផ្ទៀងផ្ទាត់ Azure
az account show
az account list

# ពិនិត្យបរិវេណបច្ចុប្បន្ន
azd env list
azd env get-values

# ដំណើរការការចុះបញ្ជីដំណើរការបញ្ហា
export AZD_DEBUG=true
azd <command> --debug
```

## បញ្ហាការផ្ទៀងផ្ទាត់

### បញ្ហា៖ "បរាជ័យក្នុងការទទួលបានសាព្វកិច្ចចូល"
**សញ្ញា៖**
- `azd up` បរាជ័យជាមួយកំហុសការផ្ទៀងផ្ទាត់
- ពាក្យបញ្ជាថតថ្លៃ "មិនមានសិទិ្ធ" ឬ "ការចូលបដិសេធ"

**ដំណោះស្រាយ៖**
```bash
# ១. ផ្ទៀងផ្ទាត់ម្ដងទៀតជាមួយ Azure CLI
az login
az account show

# ២. ធ្វើការលុបកំណត់ព័ត៌មានគណនីដែលបានផ្ទុក
az account clear
az login

# ៣. ប្រើរបបកូដឧបករណ៍ (សម្រាប់ប្រព័ន្ធគ្មានមុខ)
az login --use-device-code

# ៤. កំណត់ការជាវជាក់លាក់
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### បញ្ហា៖ "សិទ្ធិមិនគ្រប់គ្រាន់" នៅពេលចេញផ្សាយ
**សញ្ញា៖**
- ការចេញផ្សាយបរាជ័យជាមួយកំហុសសិទ្ធិ
- មិនអាចបង្កើតធនធាន Azure ជាក់លាក់បាន

**ដំណោះស្រាយ៖**
```bash
# 1. ពិនិត្យការចាត់តាំងតួនាទី Azure របស់អ្នក
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. ធានាថាអ្នកមានតួនាទីដែលចាំបាច់
# - អ្នករួមចំណែក (សម្រាប់ការបង្កើតធនធាន)
# - អ្នកគ្រប់គ្រងការចូលប្រើអ្នកប្រើ (សម្រាប់ការចាត់តាំងតួនាទី)

# 3. ទាក់ទងអ្នកគ្រប់គ្រង Azure របស់អ្នក សម្រាប់ច្បាប់សិទ្ធិត្រឹមត្រូវ
```

### បញ្ហា៖ បញ្ហាការផ្ទៀងផ្ទាត់ម៉ាស្សាភាគីច្រើន
**ដំណោះស្រាយ៖**
```bash
# 1. ចូលប្រើជាមួយអ្នកជួលជាក់លាក់
az login --tenant "your-tenant-id"

# 2. កំណត់អ្នកជួលនៅក្នុងការតំឡើង
azd config set auth.tenantId "your-tenant-id"

# 3. លៀបសំអាតឃ្លាំងអ្នកជួលបើប្ដូរអ្នកជួល
az account clear
```

## 🏗️ កំហុសផ្គត់ផ្គង់ហេដ្ឋារចនាសម្ព័ន្ធ

### បញ្ហា៖ ឈ្មោះធនធានមានការប្រឆាំងគ្នា
**សញ្ញា៖**
- កំហុស "ឈ្មោះធនធានមានរួចហើយ"
- ការចេញផ្សាយបរាជ័យនៅពេលបង្កើតធនធាន

**ដំណោះស្រាយ៖**
```bash
# 1. ប្រើឈ្មោះធនធានដាច់ដោយឡែកជាមួយនឹង token
# នៅក្នុងគំរូ Bicep របស់អ្នក៖
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. ប្រែប្ដូរឈ្មោះបរិយាកាស
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. សម្អាតធនធានដែលមានស្រាប់
azd down --force --purge
```

### បញ្ហា៖ ទីតាំង/តំបន់មិនមាន
**សញ្ញា៖**
- "ទីតាំង 'xyz' មិនមានសំរាប់ប្រភេទធនធាន"
- SKU ជាក់លាក់មិនមាននៅតំបន់ដែលបានជ្រើសរើស

**ដំណោះស្រាយ៖**
```bash
# 1. ពិនិត្យតំបន់ដែលអាចប្រើបានសម្រាប់ប្រភេទធនធាន
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. ប្រើតំបន់ដែលមានប្រើប្រាស់ទូទៅ
azd config set defaults.location eastus2
# ឬ
azd env set AZURE_LOCATION eastus2

# 3. ពិនិត្យភាពអាចប្រើបាននៃសេវាកម្មដោយតំបន់
# សូមចូលទៅកាន់៖ https://azure.microsoft.com/global-infrastructure/services/
```

### បញ្ហា៖ កំហុសលើសគុណភាព
**សញ្ញា៖**
- "លើសគុណភាពសម្រាប់ប្រភេទធនធាន"
- "ចំនួនធនធានអតិបរមាបានឈានដល់"

**ដំណោះស្រាយ៖**
```bash
# 1. ពិនិត្យការប្រើប្រាស់គុណភាពបច្ចុប្បន្ន
az vm list-usage --location eastus2 -o table

# 2. ស្នើសុំបន្ថែមគុណភាពតាមរយៈគេហទំព័រ Azure
# ចូលទៅកាន់: Subscriptions > Usage + quotas

# 3. ប្រើ SKUs តូចសម្រាប់ការអភិវឌ្ឍន៍
# នៅក្នុង main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. សម្អាតធនធានដែលមិនបានប្រើ
az resource list --query "[?contains(name, 'unused')]" -o table
```

### បញ្ហា៖ កំហុសសាច់រូបត្រីកោណ Bicep
**សញ្ញា៖**
- ការផ្ទៀងផ្ទាត់សាច់រូបបរាជ័យ
- កំហុសវេយ្យាករណ៍ក្នុងឯកសារ Bicep

**ដំណោះស្រាយ៖**
```bash
# ១. បញ្ចេញវេយ្យាករណ៍ Bicep
az bicep build --file infra/main.bicep

# ២. ប្រើកម្មវិធីលីនធឺរ Bicep
az bicep lint --file infra/main.bicep

# ៣. ពិនិត្យវេយ្យាករណ៍ឯកសារប៉ារ៉ាម៉ែត្រ
cat infra/main.parameters.json | jq '.'

# ៤. មើលទិដ្ឋភាពមុនការដាក់ឲ្យដំណើរការ
azd provision --preview
```

## 🚀 ការចេញផ្សាយបរាជ័យ

### បញ្ហា៖ ការបើកកញ្ចក់បរាជ័យ
**សញ្ញា៖**
- កម្មវិធីបរាជ័យក្នុងការបង្កើតពេលចេញផ្សាយ
- កំហុសតម្លើងកញ្ចប់

**ដំណោះស្រាយ៖**
```bash
# 1. ពិនិត្យមើលលទ្ធផលសាងសង់ជាមួយនឹងគន្លឹះបញ្ឆិត
azd deploy --service web --debug

# 2. មើលស្ថានភាពសេវាកម្មបានដាក់បញ្ចូល
azd show

# 3. សាកល្បងសាងសង់ក្នុងរាជធានី
cd src/web
npm install
npm run build

# 3. ពិនិត្យសមត្ថភាពគ្នារវាង Node.js/Python version
node --version  # ត្រូវតែផ្គូផ្គងនឹងការកំណត់ azure.yaml
python --version

# 4. លប់បំពង់ប្រមូលសាងសង់
rm -rf node_modules package-lock.json
npm install

# 5. ពិនិត្យ Dockerfile ប្រសិនបើប្រើកុងតឺន័រ
docker build -t test-image .
docker run --rm test-image
```

### បញ្ហា៖ ការចេញផ្សាយតំបន់ខ្ទង់បរាជ័យ
**សញ្ញា៖**
- កម្មវិធីតំបន់ខ្ទង់បរាជ័យក្នុងការចាប់ផ្តើម
- កំហុសទាញរូបភាព

**ដំណោះស្រាយ៖**
```bash
# 1. សាកល្បងការបង្កើត Docker នៅក្នុងកន្លែង
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. ពិនិត្យកំណត់ហេតុតង់កឺរជាមួយ Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. តាមដានកម្មវិធីតាមរយៈ azd
azd monitor --logs

# 3. ផ្ទៀងផ្ទាត់ការចូលប្រើប្រព័ន្ធចុះបញ្ជីតង់កឺរ
az acr login --name myregistry

# 4. ពិនិត្យការកំណត់កម្មវិធីតង់កឺរ
az containerapp show --name my-app --resource-group my-rg
```

### បញ្ហា៖ ការតភ្ជាប់មូលដ្ឋានទិន្នន័យបរាជ័យ
**សញ្ញា៖**
- កម្មវិធីមិនអាចភ្ជាប់ទៅមូលដ្ឋានទិន្នន័យ
- កំហុសពេលកំណត់កំណត់ភ្ជាប់

**ដំណោះស្រាយ៖**
```bash
# 1. ตรวจสอบกฏไฟร์วอลล์ฐานข้อมูล
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. ทดสอบการเชื่อมต่อจากแอปพลิเคชัน
# เพิ่มในแอปของคุณชั่วคราว:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. ตรวจสอบรูปแบบสายการเชื่อมต่อ
azd env get-values | grep DATABASE

# 4. ตรวจสอบสถานะเซิร์ฟเวอร์ฐานข้อมูล
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 បញ្ហាការកំណត់

### បញ្ហា៖ បរិស្ថានអថេរមិនដំណើរការ
**សញ្ញា៖**
- កម្មវិធីមិនអាចអានតម្លៃកំណត់បាន
- អថេរបរិស្ថានបង្ហាញថាវាល

**ដំណោះស្រាយ៖**
```bash
# 1. ពិនិត្យមើលថាតើអថេរបរិស្ថានបានកំណត់រួចហើយឬនៅ
azd env get-values
azd env get DATABASE_URL

# 2. ពិនិត្យឈ្មោះអថេរនៅក្នុង azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. ធ្វើការចាប់ផ្តើមកម្មវិធីឡើងវិញ
azd deploy --service web

# 4. ពិនិត្យការគ្រប់គ្រងសេវាកម្មកម្មវិធី
az webapp config appsettings list --name myapp --resource-group myrg
```

### បញ្ហា៖ បញ្ហាសញ្ញាបណ្ណ SSL/TLS
**សញ្ញា៖**
- HTTPS មិនដំណើរការ
- កំហុសផ្ទៀងផ្ទាត់សញ្ញាបណ្ណ

**ដំណោះស្រាយ៖**
```bash
# 1. ពិនិត្យ​ស្ថិតិវិញ្ញាបនបត្រ SSL
az webapp config ssl list --resource-group myrg

# 2. បើក​បង្ហាញ HTTPS តែប៉ុណ្ណោះ
az webapp update --name myapp --resource-group myrg --https-only true

# 3. បន្ថែម​ដឺម៉ឺន​ផ្ទាល់ខ្លួន (បើត្រូវការជា)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### បញ្ហា៖ បញ្ហាការកំណត់ CORS
**សញ្ញា៖**
- មុខផ្ទៃមិនអាចហៅ API បាន
- សំណើបណ្តូលដែកត្រូវបានបិទ

**ដំណោះស្រាយ៖**
```bash
# ១. កំណត់ CORS សម្រាប់ App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# ២. ប្រសិទ្ធភាព API ដើម្បីគ្រប់គ្រង CORS
# ក្នុង Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# ៣. ពិនិត្យមើលថាតើកំពុងបើកបរ​នៅលើ URL ត្រឹមត្រូវឬទេ
azd show
```

## 🌍 បញ្ហាការគ្រប់គ្រងបរិស្ថាន

### បញ្ហា៖ បញ្ហាការប្តូរបរិស្ថាន
**សញ្ញា៖**
- បរិស្ថានមិនត្រូវបានប្រើ
- ការកំណត់មិនប្តូរបានត្រឹមត្រូវ

**ដំណោះស្រាយ៖**
```bash
# 1. បញ្ជីបរិស្ថានទាំងអស់
azd env list

# 2. ជ្រើសរើសបរិស្ថានដោយច្បាស់
azd env select production

# 3. ពិនិត្យបរិស្ថានបច្ចុប្បន្ន
azd env list

# 4. បង្កើតបរិស្ថានថ្មីប្រសិនបើខូចខាត
azd env new production-new
azd env select production-new
```

### បញ្ហា៖ បរិស្ថានផ្ទុកខូច
**សញ្ញា៖**
- បរិស្ថានបង្ហាញស្ថានភាពខុស
- ធនធានមិនផ្គូផ្គងនឹងការកំណត់

**ដំណោះស្រាយ៖**
```bash
# 1. បន្ទាន់សម័យស្ថានភាពបរិយាកាស
azd env refresh

# 2. កំណត់ឡើងវិញការកំណត់បរិយាកាស
azd env new production-reset
# ចម្លងអថេរបរិយាកាសដែលត្រូវការ
azd env set DATABASE_URL "your-value"

# 3. នាំចូលធនធានដែលមានស្រាប់ (បើអាចធ្វើបាន)
# បន្ទាន់សម័យដោយដៃ .azure/production/config.json ជាមួយ ID របស់ធនធាន
```

## 🔍 បញ្ហាប្រសិទ្ធភាព

### បញ្ហា៖ ពេលវេលាចេញផ្សាយយឺត
**សញ្ញា៖**
- ការចេញផ្សាយប្រើពេលយូរ
- កំហុសពេលវេលូខាតពេលចេញផ្សាយ

**ដំណោះស្រាយ៖**
```bash
# ១. ផ្ដល់សេវាកម្មជាក់លាក់សម្រាប់ការបន្តរហ័សជាងមុន
azd deploy --service web
azd deploy --service api

# ២. ប្រើការចេញផ្សាយដោយកូដតែប៉ុណ្ណោះពេលហេដ្ឋារចនាសម្ព័ន្ធមិនបានផ្លាស់ប្តូរ
azd deploy  # រហ័សជាង azd up

# ៣. បង្កើនប្រសិទ្ធិភាពដំណើរការសាងសង់
# ក្នុង package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# ៤. ពិនិត្យទីតាំងធនធាន (ប្រើតំបន់ដដែលគ្នា)
azd config set defaults.location eastus2
```

### បញ្ហា៖ បញ្ហារបាំងប្រតិបត្តិការ
**សញ្ញា៖**
- ពេលតបយឺត
- ការប្រើប្រាស់ធនធានខ្ពស់

**ដំណោះស្រាយ៖**
```bash
# 1. បង្កើតធនធានឡើងវិញ
# បន្ទាន់សម័យ SKU ក្នុង main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. បើកកម្មវិធីត្រួតពិនិត្យ Application Insights
azd monitor --overview

# 3. ពិនិត្យកំណត់ហេតុនៃកម្មវិធីនៅក្នុង Azure
az webapp log tail --name myapp --resource-group myrg
# ឬសម្រាប់ Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. អនុវត្តការផ្ទុកបណ្តោះអាសន្ន
# បញ្ចូល Redis cache ទៅក្នុងហេដ្ឋារចនាសម្ព័ន្ធរបស់អ្នក
```

## 🛠️ គ្រឿងម៉ាស៊ីនដោះស្រាយបញ្ហា និងពាក្យបញ្ជា

### ពាក្យបញ្ជាកែបញ្ហា
```bash
# ការដោះស្រាយ​បញ្ហា​ក្នុង​រូបភាព​ទូលំទូលាយ
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# ពិនិត្យ​មើល​កំណែ azd
azd version

# មើល​ការ​កំណត់​បច្ចុប្បន្ន
azd config show

# សាកល្បង​ភ្ជាប់​ភាព
curl -v https://myapp.azurewebsites.net/health
```

### វិភាគកំណត់ត្រា
```bash
# រចនាសម្ព័ន្ធកំណត់ហេតុកម្មវិធីតាមរយៈ Azure CLI
az webapp log tail --name myapp --resource-group myrg

# ត្រួតពិនិត្យកម្មវិធីជាមួយ azd
azd monitor --logs
azd monitor --live

# កំណត់ហេតុធនធាន Azure
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# កំណត់ហេតុខុនតឺន័រ (សម្រាប់កម្មវិធី Container)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### ការស្រាវជ្រាវធនធាន
```bash
# បញ្ជីធនធានទាំងអស់
az resource list --resource-group myrg -o table

# ពិនិត្យสถานะធនធាន
az webapp show --name myapp --resource-group myrg --query state

# វិភាគបណ្តាញ
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 លំនៅទីបន្ថែមជំនួយ

### ពេលវេលាត្រូវបានជាលើក
- បញ្ហាការផ្ទៀងផ្ទាត់នៅតែបន្តក្រោយព្យាយាមដំណោះស្រាយទាំងអស់
- បញ្ហាហេដ្ឋារចនាសម្ព័ន្ធជាមួយសេវា Azure
- បញ្ហាជាវឬការជួសជុល
- ការព្រួយបារម្ភសុវត្ថិភាពឬព្រឹត្តិការណ៍

### ស្ថានីយជំនួយ
```bash
# 1. ពិនិត្យសុខភាពសេវាកម្ម Azure
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. បង្កើតសំបុត្រគាំទ្រ Azure
# ទៅកាន់: https://portal.azure.com -> ជំនួយ + គាំទ្រ

# 3. ប្រភពសហគមន៍
# - Stack Overflow: ស្លាក azure-developer-cli
# - ប្រតិបត្តិការលើ GitHub: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### ព័ត៌មានដែលត្រូវប្រមូល
មុនទំនាក់ទំនងជំនួយ សូមប្រមូល៖
- លទ្ធផល `azd version`
- លទ្ធផល `azd config show`
- លទ្ធផល `azd show` (ស្ថានភាពចេញផ្សាយបច្ចុប្បន្ន)
- សារកំហុស (អត្ថបទពេញ)
- ជំហានវាយតម្លៃបញ្ហា
- ព័ត៌មានបរិស្ថាន (`azd env get-values`)
- របៀបទៅកាន់ពេលវេលាដែលបញ្ហាបានចាប់ផ្តើម

### កម្មវិធីប្រមូលកំណត់ហេតុ
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

## 📊ការទប់ស្កាត់បញ្ហា

### បញ្ជីពិនិត្យមុនការចេញផ្សាយ
```bash
# 1. ពិនិត្យភាពត្រឹមត្រូវនៃការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
az account show

# 2. ពិនិត្យភាគរយ និងចំណុចកំណត់
az vm list-usage --location eastus2

# 3. ពិនិត្យភាពត្រឹមត្រូវនៃគំរូ
az bicep build --file infra/main.bicep

# 4. សាកល្បងនៅកន្លែងដំបូង
npm run build
npm run test

# 5. ប្រើការដាក់បញ្ជូនបែបប្រតិបត្តិការស្ងួត
azd provision --preview
```

### ការតំឡើងការត្រួតពិនិត្យ
```bash
# បើកចំហរ Application Insights
# បន្ថែមទៅ main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# កំណត់ការជូនដំណឹង
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### ការថែទាំបែបប្រចាំ
```bash
# ការត្រួតពិនិត្យសុខភាពប្រចាំសប្តាហ៍
./scripts/health-check.sh

# ការត្រួតពិនិត្យការចំណាយប្រចាំខែ
az consumption usage list --billing-period-name 202401

# ការត្រួតពិនិត្យសន្តិសុខប្រចាំត្រីមាស
az security assessment list --resource-group myrg
```

## ឯកសារដែលពាក់ព័ន្ធ

- [មគ្គុទេសក៍កែបញ្ហា](debugging.md) - វិធីសាស្រ្តកែបញ្ហាជម្រៅ
- [ការផ្គត់ផ្គង់ធនធាន](../chapter-04-infrastructure/provisioning.md) - ការដោះស្រាយបញ្ហាហេដ្ឋារចនាសម្ព័ន្ធ
- [ការធ្វើផែនការសមត្ថភាព](../chapter-06-pre-deployment/capacity-planning.md) - មគ្គុទេសក៏ផែនការធនធាន
- [ការជ្រើសរើស SKU](../chapter-06-pre-deployment/sku-selection.md) - សំណើផ្នែកសេវា

---

**កំប្លែង**៖ រក្សាមគ្គុទេសក៍នេះជាសម្គាល់ហើយយោងវាទៅទីប៉ុនប៉ងជួបប្រទះបញ្ហា។ បញ្ហាចម្បងភាគច្រើនត្រូវបានឃើញមុនហើយមានដំណោះស្រាយបានបណ្ដាលបង្កើត!

---

**ចុចផ្លូវ**
- **មុខវិជ្ជាជាសំណុំមុន**: [ការផ្គត់ផ្គង់ធនធាន](../chapter-04-infrastructure/provisioning.md)
- **មុខវិជ្ជាជាបន្ទាប់**: [មគ្គុទេសក៍កែបញ្ហា](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖  
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលយើងខិតខំសម្រាប់ភាពត្រឹមត្រូវ សូមជ្រាបថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាដើមគួរត្រូវបានគេចាត់ទុកជាទិន្នន័យឯកសារដែលមានសិទ្ធិលើព័ត៌មាន។ សម្រាប់ព័ត៌មានសំខាន់ៗ ជាការប្រសើរណាស់ក្នុងការអនុវត្តបកប្រែដោយអ្នកជំនាញមនស្សវិជ្ជាជីវៈ។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកប្រែខុសពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->