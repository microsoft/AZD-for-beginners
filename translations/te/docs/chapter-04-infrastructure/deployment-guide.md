# డిప్లాయ్‌మెంట్ గైడ్ - AZD డిప్లాయ్‌మెంట్‌లలో నైపుణ్యం

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD ప్రారంభికుల కోసం](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 4 - కోడ్ ద్వారా ఇన్‌ఫ్రాస్ట్రక్చర్ & డిప్లాయ్‌మెంట్
- **⬅️ ముందు చాప్టర్**: [చాప్టర్ 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)
- **➡️ తదుపరి**: [వనరుల ప్రావిజనింగ్](provisioning.md)
- **🧩 ఈ చాప్టర్‌లో ఇదీ కూడా ఉంది**: [మీ స్వంత టెంప్లేట్ రచన](custom-templates.md)
- **🚀 తదుపరి చాప్టర్**: [చాప్టర్ 5: బహుళ-ఏజెంట్ AI పరిష్కారాలు](../../examples/retail-scenario.md)

## పరిచయం

ఈ సమగ్ర గైడ్ Azure డెవలపర్ CLI ఉపయోగించి అప్లికేషన్లను డిప్లాయ్ చేయడంపై అవసరమయ్యే ప్రతీ విషయాన్నీ కవర్ చేస్తుంది — ఒకే ఆదేశంతో సంక్షిప్త డిప్లాయ్‌ల నుండి కస్టమ్ హుక్స్, బహుళ వైశాల్యాలు మరియు CI/CD ఇంటిగ్రేషన్ వంటి అధునాతన ప్రొడక్షన్ సందర్భాల వరకు. ప్రాక్టికల్ ఉదాహరణలు మరియు ఉత్తమ అభ్యాసాలతో పూర్తి డిప్లాయ్‌మెంట్ లైఫ్‌సైకిల్‌లో నైపుణ్యం పొందండి.

## అభ్యాస లక్ష్యాలు

ఈ గైడ్ పూర్తి చేసిన తరువాత మీరు:
- Azure డెవలపర్ CLI డిప్లాయ్‌మెంట్ ఆదేశాలు మరియు వర్క్‌ఫ్లోలను పూర్తిగా పరిపాలించగలుగుతారు
- ప్రావిజనింగ్ నుండి మానిటరింగ్ వరకు పూర్తి డిప్లాయ్‌మెంట్ లైఫ్‌సైకిల్‌ను అర్థం చేసుకోగలుగుతారు
- ప్రీ మరియు పోస్ట్-డిప్లాయ్‌మెంట్ ఆటోమేషన్ కోసం కస్టమ్ డిప్లాయ్‌మెంట్ హుక్స్ అమలు చేయగలుగుతారు
- వాతావరణ-నిర్దిష్ట పారామీటర్లతో బహుళ వాతావరణాలను కాన్ఫిగర్ చేయగలుగుతారు
- బ్లూ-గ్రీన్ మరియు కెనరీ వంటి అధునాతన డిప్లాయ్‌మెంట్ వ్యూహాలను ఏర్పాటు చేయగలుగుతారు
- azd డిప్లాయ్‌మెంట్స్‌ను CI/CD పైప్లైన్స్ మరియు DevOps వర్క్‌ఫ్లోలలో సమగ్రపరచగలుగుతారు

## అభ్యాస ఫలితాలు

పూర్తిచేసిన తర్వాత, మీరు చేయగలరని:
- అన్ని azd డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలను స్వతంత్రంగా ఎగ్జిక్యూట్ చేయడం మరియు సమస్యలను పరిష్కరించడం
- హుక్స్ ఉపయోగించి కస్టమ్ డిప్లాయ్‌మెంట్ ఆటోమేషన్ డిజైన్ చేయడం మరియు అమలు చేయడం
- సరైన సెక్యూరిటీ మరియు మానిటరింగ్‌తో ప్రొడక్షన్-రెడీ డిప్లాయ్‌మెంట్స్‌ను కాన్ఫిగర్ చేయడం
- సంక్లిష్ట బహుళ-వాతావరణ డిప్లాయ్‌మెంట్ సందర్భాలను నిర్వహించడం
- డిప్లాయ్‌మెంట్ పనితీరును మ.optిమైజ్ చేయడం మరియు రోల్‌బ్యాక్ వ్యూహాలను అమలు చేయడం
- azd డిప్లాయ్‌మెంట్స్‌ను ఎంటర్ప్రైజ్ DevOps ఆచారాలలో అనుసంధానం చేయడం

## డిప్లాయ్‌మెంట్ అవలోకనం

Azure డెవలపర్ CLI కొన్ని డిప్లాయ్‌మెంట్ ఆదేశాలు అందిస్తుంది:
- `azd up` - పూర్తి వర్క్‌ఫ్లో (ప్రావిజన్ + డిప్లాయ్)
- `azd provision` - కేవలం Azure వనరులను సృష్టించు/అప్డేట్ చేయండి
- `azd deploy` - కేవలం అప్లికేషన్ కోడ్‌ను డిప్లాయ్ చేయండి
- `azd package` - అప్లికేషన్లను బిల్డ్ చేసి ప్యాకేజ్ చేయండి

## మౌలిక డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోలు

### పూర్తి డిప్లాయ్‌మెంట్ (azd up)
కొత్త ప్రాజెక్టుల కోసం అత్యంత సాధారణ వర్క్‌ఫ్లో:
```bash
# అన్నింటినీ మొదటినుంచి అమలు చేయండి
azd up

# నిర్దిష్ట పరిసరంతో అమలు చేయండి
azd up --environment production

# అనుకూల పరామితులతో అమలు చేయండి
azd up --parameter location=westus2 --parameter sku=P1v2
```

### ఇన్‌ఫ్రాస్ట్రక్చర్-మాత్రమే డిప్లాయ్‌మెంట్
మీకు కేవలం Azure వనరులను అప్డేట్ చేయాల్సిన అవసరం ఉన్నప్పుడు:
```bash
# ఇన్ఫ్రాస్ట్రక్చర్‌ను ఏర్పాటు/నవీకరించండి
azd provision

# మార్పులను ముందుగా చూపించుకోవడానికి డ్రై-రన్‌తో ప్రొవిజన్ చేయండి
azd provision --preview

# నిర్దిష్ట సేవలను ప్రొవిజన్ చేయండి
azd provision --service database
```

### కోడ్-మాత్రమే డిప్లాయ్‌మెంట్
త్వరిత అప్లికేషన్ అప్డేట్‌ల కోసం:
```bash
# అన్ని సేవలను డిప్లాయ్ చేయండి
azd deploy

# నిరೀಕ್ಷిత అవుట్‌పుట్:
# సేవలను డిప్లాయ్ చేస్తున్నాయి (azd deploy)
# - web: డిప్లాయ్ జరుగుతోంది... పూర్తి
# - api: డిప్లాయ్ జరుగుతోంది... పూర్తి
# విజయం: మీ డిప్లాయ్‌మెంట్ 2 నిమిషాలు 15 సెకన్లలో పూర్తయింది

# ఒక నిర్దిష్ట సేవను డిప్లాయ్ చేయండి
azd deploy --service web
azd deploy --service api

# కస్టమ్ బిల్డ్ ఆర్గుమెంట్లతో డిప్లాయ్ చేయండి
azd deploy --service api --build-arg NODE_ENV=production

# డిప్లాయ్‌మెంట్‌ను ధృవీకరించండి
azd show --output json | jq '.services'
```

### ✅ డిప్లాయ్‌మెంట్ నిర్ధారణ

ఏ డిప్లాయ్‌మెంట్ అయినా తర్వాత, విజయం నిర్ధారించండి:

```bash
# అన్ని సేవలు నడుస్తున్నాయా అని తనిఖీ చేయండి
azd show

# హెల్త్ ఎండ్పాయింట్లను పరీక్షించండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

curl -f "$WEB_URL/health" || echo "❌ Web health check failed"
curl -f "$API_URL/health" || echo "❌ API health check failed"

# లోపాల కోసం పర్యవేక్షించండి (డిఫాల్ట్‌గా బ్రౌజర్‌లో తెరుస్తుంది)
azd monitor --logs
```

**విజయ ప్రమాణాలు:**
- ✅ అన్ని సేవలు "Running" స్థితిని చూపబడాలి
- ✅ ఆరోగ్య ఎండ్‌పాయింట్లు HTTP 200 రిటర్న్ చేయాలి
- ✅ గత 5 నిమిషాల్లో ఎటువంటి error logs ఉండకూడదు
- ✅ అప్లికేషన్ టెస్ట్ రిక్వెస్ట్స్‌కు స్పందించాలి

## 🏗️ డిప్లాయ్‌మెంట్ ప్రక్రియను అవగాహన

### హుక్స్ గురించి కొత్తవారా? ఇక్కడి నుంచి ప్రారంభించండి

ఒక **హుక్** అనేది azd డిప్లాయ్ ప్రక్రియలో ఒక నిర్దిష్ట క్షణంలో ఆటోమేటిక్‌గా అమలవుతున్న ఆదేశం — ప్రావిజనింగ్ ముందు లేదా পরে, మరియు మీ కోడ్‌ను డిప్లాయ్ చేయడముకు ముందు లేదా తర్వాత. ఇవి డిప్లాయ్‌మెంట్‌ను సారించిన చిన్న పనులను ఆటోమేట్ చేయడానికి అనుమతిస్తాయి: డేటాబేస్ సీడింగ్, మైగ్రేషన్లు నడపడం, ఆస్తులను బిల్డ్ చేయడం, లేదా లైవ్ యాప్‌ను స్మోక్-టెస్టింగ్ చేయడం.

| Hook | అమలవుతుంది… | సాధారణ ఉపయోగం |
|------|--------------|------------------|
| `preprovision` | వనరులు సృష్టించబడే ముందు | ప్రారంభ లక్షణాలు ధృవీకరించండి, రిజిస్ట్రీలో లాగిన్ చేయండి |
| `postprovision` | వనరులు ఉన్నాయి తర్వాత | వనరులను కాన్ఫిగర్ చేయండి, డేటాబేస్ సెటప్ చేయండి |
| `predeploy` | కోడ్ పంపిణీ చేయబడే ముందు | ఫ్రంట్-ఎండ్ ఆస్తులను బిల్డ్ చేయండి, యూనిట్ టెస్ట్‌లు నడపండి |
| `postdeploy` | కోడ్ లైవ్ అయిన తర్వాత | DB మైగ్రేషన్లు నడపండి, ఎండ్‌పాయింట్‌ను స్మోక్-టెస్ట్ చేయండి |

హుక్స్ మీ `azure.yaml` లో ఉంటాయి. ఇక్కడ చిన్నతరమైన ఉదాహరణ ఉంది—ఇది డిప్లాయ్‌మెంట్ తర్వాత బాధ్యతతో ఒక సందేశాన్ని మాత్రమే ప్రింట్ చేస్తుంది:

```yaml
# azure.yaml
hooks:
  postdeploy:
    shell: sh
    run: echo "Deployment finished! 🎉"
```

అదే — తర్వాత మీరు `azd up` అమలు చేసినపుడు, సందేశం ఆటోమేటిక్‌గా ప్రింట్ అవుతుంది. మీరు పూర్తి డిప్లాయ్ చేయకుండానే ఒక హుక్‌ను వేరుగా కూడా అమలు చేయవచ్చు, ఇది టెస్టింగ్‌కి చాలా మంచిది:

```bash
azd hooks run postdeploy
```

కిందని దశలు ప్రతి దశ కోసం నిజజీవిత హుక్స్ (మైగ్రేషన్లు, టెస్టులు, ధృవీకరణ) చూపిస్తాయి.

### దశ 1: ప్రీ-ప్రావిజన్ హుక్స్
```yaml
# azure.yaml
hooks:
  preprovision:
    shell: sh
    run: |
      echo "Validating configuration..."
      ./scripts/validate-prereqs.sh
      
      echo "Setting up secrets..."
      ./scripts/setup-secrets.sh
```

### దశ 2: ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రావిజనింగ్
- ఇన్‌ఫ్రాస్ట్రక్చర్ టెంప్లేట్స్‌ను చదివి (Bicep/Terraform)
- Azure వనరులను సృష్టించడం లేదా అప్డేట్ చేయడం
- నెట్వర్కింగ్ మరియు సెక్యూరిటీని కాన్ఫిగర్ చేయడం
- మానిటరింగ్ మరియు లాగింగ్ సెటప్ చేయడం

### దశ 3: పోస్టు-ప్రావిజన్ హుక్స్
```yaml
hooks:
  postprovision:
    shell: pwsh
    run: |
      Write-Host "Infrastructure ready, setting up databases..."
      ./scripts/setup-database.ps1
      
      Write-Host "Configuring application settings..."
      ./scripts/configure-app-settings.ps1
```

### దశ 4: అప్లికేషన్ ప్యాకేజింగ్
- అప్లికేషన్ కోడ్‌ను బిల్డ్ చేయడం
- డిప్లాయ్‌మెంట్ ఆర్టిఫాక్ట్స్‌ను సృష్టించడం
- లక్ష్య ప్లాట్‌ఫారమ్ కోసం ప్యాకేజింగ్ (కాంటైనర్లు, ZIP ఫైళ్ల వంటి)

### దశ 5: ప్రీ-డిప్లాయ్ హుక్స్
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      echo "Running pre-deployment tests..."
      npm run test:unit
      
      echo "Database migrations..."
      npm run db:migrate
```

### దశ 6: అప్లికేషన్ డిప్లాయ్‌మెంట్
- ప్యాకేజ్డ్ అప్లికేషన్లను Azure సేవలకు డిప్లాయ్ చేయడం
- కాన్ఫిగరేషన్ సెట్టింగ్స్‌ను అప్డేట్ చేయడం
- సేవలను స్టార్ట్/రిస్టార్ట్ చేయడం

### దశ 7: పోస్టు-డిప్లాయ్ హుక్స్
```yaml
hooks:
  postdeploy:
    shell: sh
    run: |
      echo "Running integration tests..."
      npm run test:integration
      
      echo "Warming up applications..."
      curl https://${WEB_URL}/health
```

### హుక్ లోపాలను నిర్వహించడం

డిఫాల్ట్ ప్రకారం, **ఒక హుక్ కమాండ్ నాన్-జీరో exit కోడ్ తో ముగిసితే, azd మొత్తం ఆపరేషన్‌ను నిలిపేస్తుంది.** ఇది సాధారణంగా మీరు కోరుకునేనే వ్యవహారం — ఓపెనైన మైగ్రేషన్ డిప్లాయ్‌ను నిలిపివేయాలి, లోకడైన అప్లికేషన్‌ను పంపించరాదు. కానీ దీని కారణంగా హుక్స్ జాగ్రత్తగా రాయాలి.

**1. వైఫల్యాలను శబ్దంగా మరియు ఉద్దేశపూర్వకంగా చేయండి.** ఒక హుక్ తప్పవు అవుతుందని భావిస్తే, చివరి కమాండ్ నాన్-జీరో exit కోడ్ రిటర్న్ చేస్తే హుక్ ఫెయిల్ అవుతుంది. షెల్ స్క్రిప్ట్‌ల్లో, మొదటి విఫలమైన కమాండ్ వద్ద హుక్ ఆగేలా `set -e` జోడించండి, దాని వల్ల మౌనంగా కొనసాగకుండా ఉంటుంది:

```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      set -e                      # stop on the first error
      npm run test:unit           # if tests fail, the deploy halts here
      npm run db:migrate
```

**2. హుక్ azd ను ఆపకుండా విఫలమయ్యేటట్లు అనుమతించండి.** అపవిత్రమైన దశల కోసం (ఒప్షనల్ క్యాష్ వార్మ్-అప్, బెస్ట్-ఎఫోర్ట్ నోటిఫికేషన్), `continueOnError: true` సెట్టు చేయండి. azd ఫెయిల్యూర్‌ను లాగ్ చేస్తుంది కానీ ప్రాసెస్ కొనసాగుతుంది:

```yaml
hooks:
  postdeploy:
    shell: sh
    continueOnError: true         # a failure here won't fail 'azd up'
    run: curl -f https://${WEB_URL}/warmup || echo "Warm-up skipped"
```

**3. పూర్తి రన్ ముందు హుక్స్‌ను వేరుగా పరీక్షించండి.** హుక్ డీబగ్ చేయడానికి `azd up` నడపాల్సిన అవసరం లేదు — దాన్ని ఒంటరిగా నడిపి త్వరగా తిరుగుబాటు చేయండి:

```bash
azd hooks run predeploy          # కేవలం ప్రీడిప్లాయ్ హుక్‌ను నడుపుతుంది
azd hooks run postdeploy --service api
```

**4. OS-స్పెసిఫిక్ షెల్ల్స్ కోసం జాగ్రత్త పడండి.** `shell: pwsh` ఉపయోగించిన హుక్‌ను అమలు చేయడానికి ఆ మెషీన్(లు)లో PowerShell ఇన్‌స్టాల్ చేయబడాలి (CI ఏజెంట్స్ కూడా సహా). అత్యధిక పోర్టబిలిటీ కోసం `shell: sh` ఉపయోగించండి, లేదా `windows` మరియు `posix` వేరియంట్‌లను అందించండి:

```yaml
hooks:
  postprovision:
    posix:
      shell: sh
      run: ./scripts/setup.sh
    windows:
      shell: pwsh
      run: ./scripts/setup.ps1
```

> **డీబగ్గింగ్ టిప్:** హుక్ యొక్క ఖచ్చితమైన కమాండ్ లైన్ మరియు పూర్తి అవుట్పుట్ చూడడానికి ఏదైనా azd కమాండ్‌ను `--debug` తో నడపండి—హుక్ స్థానికంగా పనిచేస్తుంది కానీ CIలో తప్పిపోతే ఇది అమూల్యమైనది.

## 🎛️ డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్

### సేవ-నిర్దిష్ట డిప్లాయ్‌మెంట్ సెట్టింగ్స్
```yaml
# azure.yaml
services:
  web:
    project: ./src/web
    host: staticwebapp
    buildCommand: npm run build
    outputPath: dist
    
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
    env:
      - name: NODE_ENV
        value: production
      - name: API_VERSION
        value: "1.0.0"
        
  worker:
    project: ./src/worker
    host: function
    runtime: node
    buildCommand: npm install --production
```

### వాతావరణ-నిర్దిష్ట కాన్ఫిగరేషన్లు
```bash
# అభివృద్ధి వాతావరణం
azd env set NODE_ENV development
azd env set DEBUG true
azd env set LOG_LEVEL debug

# స్టేజింగ్ వాతావరణం
azd env new staging
azd env set NODE_ENV staging
azd env set DEBUG false
azd env set LOG_LEVEL info

# ఉత్పత్తి వాతావరణం
azd env new production
azd env set NODE_ENV production
azd env set DEBUG false
azd env set LOG_LEVEL error
```

## 🔧 అధునాతన డిప్లాయ్‌మెంట్ సందర్భాలు

### బహుళ-సేవ్ అప్లికేషన్లు
```yaml
# Complex application with multiple services
services:
  # Frontend applications
  web-app:
    project: ./src/web
    host: staticwebapp
  
  admin-portal:
    project: ./src/admin
    host: appservice
    
  # Backend services
  user-api:
    project: ./src/services/users
    host: containerapp
    
  order-api:
    project: ./src/services/orders
    host: containerapp
    
  payment-api:
    project: ./src/services/payments
    host: function
    
  # Background processing
  notification-worker:
    project: ./src/workers/notifications
    host: containerapp
    
  report-worker:
    project: ./src/workers/reports
    host: function
```

### బ్లూ-గ్రీన్ డిప్లాయ్‌మెంట్స్
```bash
# నీలి పరిసరాన్ని సృష్టించండి
azd env new production-blue
azd up --environment production-blue

# నీలి పరిసరాన్ని పరీక్షించండి
./scripts/test-environment.sh production-blue

# ట్రాఫిక్‌ను నీలి వైపు మార్చండి (చేతితో DNS/లోడ్ బ్యాలెన్సర్ నవీకరణ)
./scripts/switch-traffic.sh production-blue

# ఆకుపచ్చ పరిసరాన్ని శుభ్రపరచండి
azd env select production-green
azd down --force
```

### కెనరీ డిప్లాయ్‌మెంట్స్
```yaml
# azure.yaml - Configure traffic splitting
services:
  api:
    project: ./src/api
    host: containerapp
    trafficSplit:
      - revision: stable
        percentage: 90
      - revision: canary
        percentage: 10
```

### స్టేజ్డ్ డిప్లాయ్‌మెంట్స్
```bash
#!/bin/bash
# deploy-staged.sh

echo "Deploying to development..."
azd env select dev
azd up --confirm-with-no-prompt

echo "Running dev tests..."
./scripts/test-environment.sh dev

echo "Deploying to staging..."
azd env select staging
azd up --confirm-with-no-prompt

echo "Running staging tests..."
./scripts/test-environment.sh staging

echo "Manual approval required for production..."
read -p "Deploy to production? (y/N): " confirm
if [[ $confirm == [yY] ]]; then
    echo "Deploying to production..."
    azd env select production
    azd up --confirm-with-no-prompt
    
    echo "Running production smoke tests..."
    ./scripts/test-environment.sh production
fi
```

## 🐳 కంటైనర్ డిప్లాయ్‌మెంట్స్

### కంటైనర్ అప్లికేషన్ డిప్లాయ్‌మెంట్స్
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        BUILD_VERSION: ${BUILD_VERSION}
        NODE_ENV: production
    env:
      - name: DATABASE_URL
        value: ${DATABASE_URL}
    secrets:
      - name: jwt-secret
        value: ${JWT_SECRET}
    scale:
      minReplicas: 1
      maxReplicas: 10
```

### మల్టీ-స్టేజ్ Dockerfile ఆప్టిమైజేషన్
```dockerfile
# Dockerfile
FROM node:18-alpine AS base
WORKDIR /app
COPY package*.json ./

FROM base AS development
RUN npm ci
COPY . .
CMD ["npm", "run", "dev"]

FROM base AS build
RUN npm ci --only=production
COPY . .
RUN npm run build

FROM node:18-alpine AS production
WORKDIR /app
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY package*.json ./
EXPOSE 3000
CMD ["npm", "start"]
```

## ⚡ పనితీరు ఆప్టిమైజేషన్

### సేవ-నిర్దిష్ట డిప్లాయ్‌మెంట్స్
```bash
# త్వరిత పునరావృతానికి ఒక నిర్దిష్ట సేవను అమర్చండి
azd deploy --service web
azd deploy --service api

# అన్ని సేవలను అమర్చండి
azd deploy
```

### బిల్డ్ క్యాషింగ్
```yaml
# azure.yaml - Configure build commands
services:
  web:
    project: ./src/web
    buildCommand: npm run build
    outputPath: dist
```

### సమర్థవంతమైన కోడ్ డిప్లాయ్‌మెంట్స్
```bash
# కేవలం కోడ్ మార్పుల కోసం azd deploy (azd up కాదు) ఉపయోగించండి
# ఇది ఇన్‌ఫ్రాస్ట్రక్చర్ ప్రొవిజనింగ్‌ను మినహాయిస్తుంది మరియు చాలా వేగంగా ఉంటుంది
azd deploy

# అత్యంత వేగవంతమైన పునరావృతి కోసం నిర్దిష్ట సేవను డిప్లాయ్ చేయండి
azd deploy --service api
```

## 🔍 డిప్లాయ్‌మెంట్ మానిటరింగ్

### రియల్-టైమ్ డిప్లాయ్‌మెంట్ మానిటరింగ్
```bash
# అప్లికేషన్‌ను రియల్-టైమ్‌లో పర్యవేక్షించండి
azd monitor --live

# అప్లికేషన్ లాగ్‌లను వీక్షించండి
azd monitor --logs

# డిప్లాయ్‌మెంట్ స్థితిని తనిఖీ చేయండి
azd show
```

### హెల్త్ చెక్స್
```yaml
# azure.yaml - Configure health checks
services:
  api:
    project: ./src/api
    host: containerapp
    healthCheck:
      path: /health
      interval: 30s
      timeout: 10s
      retries: 3
```

### పోస్టు-డిప్లాయ్‌మెంట్ ధృవీకరణ
```bash
#!/bin/bash
# scripts/validate-deployment.sh

echo "Validating deployment..."

# అప్లికేషన్ ఆరోగ్యాన్ని తనిఖీ చేయండి
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
API_URL=$(azd show --output json | jq -r '.services.api.endpoint')

echo "Testing web application..."
if curl -f "$WEB_URL/health"; then
    echo "✅ Web application is healthy"
else
    echo "❌ Web application health check failed"
    exit 1
fi

echo "Testing API..."
if curl -f "$API_URL/health"; then
    echo "✅ API is healthy"
else
    echo "❌ API health check failed"
    exit 1
fi

echo "Running integration tests..."
npm run test:integration

echo "✅ Deployment validation completed successfully"
```

## 🔐 సెక్యూరిటీ విషయాలు

### సీక్రెట్లు నిర్వహణ
```bash
# సురక్షితంగా రహస్యాలను నిల్వ చేయండి
azd env set DATABASE_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set JWT_SECRET "$(openssl rand -base64 64)" --secret
azd env set API_KEY "your-api-key" --secret

# azure.yaml లో రహస్యాలను సూచించండి
```

```yaml
services:
  api:
    secrets:
      - name: database-password
        value: ${DATABASE_PASSWORD}
      - name: jwt-secret
        value: ${JWT_SECRET}
```

### నెట్‌వర్క్ సెక్యూరిటీ
```yaml
# azure.yaml - Configure network security
infra:
  parameters:
    enablePrivateEndpoints: true
    allowedIPs:
      - "203.0.113.0/24"  # Office IP range
      - "198.51.100.0/24" # VPN IP range
```

### గుర్తింపు మరియు యాక్సెస్ నిర్వహణ
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    identity:
      type: systemAssigned
    keyVault:
      - name: app-secrets
        secrets:
          - database-connection
          - external-api-key
```

## 🚨 రోల్‌బ్యాక్ వ్యూహాలు

### తాత్కాలిక రోల్‌బ్యాక్
```bash
# AZD కి అంతర్గత రోల్‌బ్యాక్ లేదు. సిఫార్సు చేయబడిన విధానాలు:

# ఎంపిక 1: Git నుండి మళ్లీ డిప్లాయ్ చేయండి (సిఫార్సు చేయబడింది)
git revert HEAD  # సమస్యాత్మక కమిట్‌ను రివర్ట్ చేయండి
git push
azd deploy

# ఎంపిక 2: నిర్దిష్ట కమిట్‌ను మళ్లీ డిప్లాయ్ చేయండి
git checkout <previous-commit-hash>
azd deploy
git checkout main
```

### ఇన్‌ఫ్రాస్ట్రక్చర్ రోల్‌బ్యాక్
```bash
# అమలు చేయడానికి ముందు ఇన్‌ఫ్రాస్ట్రక్చర్ మార్పులను పూర్వదర్శనం చేయండి
azd provision --preview

# ఇన్‌ఫ్రాస్ట్రక్చర్ రోల్బ్యాక్ కోసం, వెర్షన్ నియంత్రణను ఉపయోగించండి:
git revert HEAD  # ఇన్‌ఫ్రాస్ట్రక్చర్ మార్పులను తిరిగి తీసుకోండి
azd provision    # మునుపటి ఇన్‌ఫ్రాస్ట్రక్చర్ స్థితిని అమలు చేయండి
```

### డేటాబేస్ మైగ్రేషన్ రోల్‌బ్యాక్
```bash
#!/bin/bash
# scripts/rollback-database.sh

echo "Rolling back database migrations..."
npm run db:rollback

echo "Validating database state..."
npm run db:validate

echo "Database rollback completed"
```

## 📊 డిప్లాయ్‌మెంట్ మెట్రిక్స్

### డిప్లాయ్‌మెంట్ పనితీరును ట్రాక్ చేయండి
```bash
# ప్రస్తుత డిప్లాయ్‌మెంట్ స్థితిని చూడండి
azd show

# Application Insights ద్వారా అప్లికేషన్‌ను పర్యవేక్షించండి
azd monitor --overview

# సజీవ మెట్రిక్స్‌ను చూడండి
azd monitor --live
```

### కస్టమ్ మెట్రిక్స్ కలెక్షన్
```yaml
# azure.yaml - Configure custom metrics
hooks:
  postdeploy:
    shell: sh
    run: |
      # Record deployment metrics
      DEPLOY_TIME=$(date +%s)
      SERVICE_COUNT=$(azd show --output json | jq '.services | length')
      
      # Send to monitoring system
      curl -X POST "https://metrics.company.com/deployments" \
        -H "Content-Type: application/json" \
        -d "{\"timestamp\": $DEPLOY_TIME, \"service_count\": $SERVICE_COUNT}"
```

## 🎯 ఉత్తమ అభ్యాసాలు

### 1. వాతావరణ సాథ్యం
```bash
# పేరుల కోసం ఒకే విధమైన నియమాలు ఉపయోగించండి
azd env new dev-$(whoami)
azd env new staging-$(git rev-parse --short HEAD)
azd env new production-v1

# పరిసరాల సమానతను నిలబెట్టండి
./scripts/sync-environments.sh
```

### 2. ఇన్‌ఫ్రాస్ట్రక్చర్ ధృవీకరణ
```bash
# డిప్లాయ్ చేయడానికి ముందుగా ఇన్‌ఫ్రాస్ట్రక్చర్ మార్పులను పూర్వదర్శనం చేయండి
azd provision --preview

# ARM/Bicep లింటింగ్‌ను ఉపయోగించండి
az bicep lint --file infra/main.bicep

# Bicep వ్యాకరణాన్ని ధృవీకరించండి
az bicep build --file infra/main.bicep
```

### 3. టెస్టింగ్ ఇంటిగ్రేషన్
```yaml
hooks:
  predeploy:
    shell: sh
    run: |
      # Unit tests
      npm run test:unit
      
      # Security scanning
      npm audit
      
      # Code quality checks
      npm run lint
      npm run type-check
      
  postdeploy:
    shell: sh
    run: |
      # Integration tests
      npm run test:integration
      
      # Performance tests
      npm run test:performance
      
      # Smoke tests
      npm run test:smoke
```

### 4. డాక్యుమెంటేషన్ మరియు లాగింగ్
```bash
# అమలుపరచే ప్రక్రియలను డాక్యుమెంట్ చేయండి
echo "# Deployment Log - $(date)" >> DEPLOYMENT.md
echo "Environment: $(azd env get-value AZURE_ENV_NAME)" >> DEPLOYMENT.md
echo "Services deployed: $(azd show --output json | jq -r '.services | keys | join(", ")')" >> DEPLOYMENT.md
```

## తదుపరి మెట్లు

- [వనరుల ప్రావిజనింగ్](provisioning.md) - ఇన్‌ఫ్రాస్ట్రక్చర్ నిర్వహణలో లోతైన విశ్లేషణ
- [ప్రీ-డిప్లాయ్‌మెంట్ ప్లానింగ్](../chapter-06-pre-deployment/capacity-planning.md) - మీ డిప్లాయ్‌మెంట్ వ్యూహాన్ని నిర్వహించండి
- [సాధారణ సమస్యలు](../chapter-07-troubleshooting/common-issues.md) - డిప్లాయ్‌మెంట్ సమస్యలను పరిష్కరించండి
- [ఉత్తమ అభ్యాసాలు](../chapter-07-troubleshooting/debugging.md) - ప్రొడక్షన్-రెడీ డిప్లాయ్‌మెంట్ వ్యూహాలు

## 🎯 హ్యాండ్స్-ఆన్ డిప్లాయ్‌మెంట్ వ్యాయామాలు

### వ్యాయామం 1: ఇన్‌క్రిమెంటల్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో (20 నిమిషాలు)
**గోల్**: పూర్తి మరియు ఇన్‌క్రిమెంటల్ డిప్లాయ్‌మెంట్స్ మధ్య వైవిధ్యాన్ని నైపుణ్యం చేయడం

```bash
# ప్రారంభ డిప్లాయ్‌మెంట్
mkdir deployment-practice && cd deployment-practice
azd init --template todo-nodejs-mongo
azd up

# ప్రారంభ డిప్లాయ్‌మెంట్ సమయాన్ని నమోదు చేయండి
echo "Full deployment: $(date)" > deployment-log.txt

# కోడ్‌లో మార్పు చేయండి
echo "// Updated $(date)" >> src/api/src/server.js

# కేవలం కోడ్‌ను డిప్లాయ్ చేయండి (త్వరగా)
time azd deploy
echo "Code-only deployment: $(date)" >> deployment-log.txt

# సమయాలను పోల్చండి
cat deployment-log.txt

# శుభ్రపరచండి
azd down --force --purge
```

**విజయం ప్రమాణాలు:**
- [ ] పూర్తి డిప్లాయ్‌మెంట్ 5-15 నిమిషాల్లో అక్కర్లేనియ్
- [ ] కోడ్-మాత్రమే డిప్లాయ్‌మెంట్ 2-5 నిమిషాల్లో తీసుకుంటుంది
- [ ] కోడ్ మార్పులు డిప్లాయ్ చేసిన అప్లికేషన్లో ప్రతిబింబిస్తాయి
- [ ] `azd deploy` తర్వాత ఇన్‌ఫ్రాస్ట్రక్చర్ మార్చుకోకపోవాలి

**అభ్యాస ఫలితం**: కోడ్ మార్పుల కోసం `azd deploy` `azd up` కంటే 50-70% వేగంగా ఉంటుంది

### వ్యాయామం 2: కస్టమ్ డిప్లాయ్‌మెంట్ హుక్స్ (30 నిమిషాలు)
**గోల్**: ప్రీ మరియు పోస్ట్-డిప్లాయ్‌మెంట్ ఆటోమేషన్ అమలు చేయండి

```bash
# ప్రీ-డిప్లాయ్ నిర్ధారణ స్క్రిప్ట్ సృష్టించండి
mkdir -p scripts
cat > scripts/pre-deploy-check.sh << 'EOF'
#!/bin/bash
echo "⚠️ Running pre-deployment checks..."

# టెస్టులు పాస్ అవుతున్నాయో లేదో తనిఖీ చేయండి
if ! npm run test:unit; then
    echo "❌ Tests failed! Aborting deployment."
    exit 1
fi

# కమిట్ చేయబడని మార్పుల కోసం తనిఖీ చేయండి
if [[ -n $(git status -s) ]]; then
    echo "⚠️ Warning: Uncommitted changes detected"
fi

echo "✅ Pre-deployment checks passed!"
EOF

chmod +x scripts/pre-deploy-check.sh

# పోస్ట్-డిప్లాయ్ స్మోక్ టెస్ట్ సృష్టించండి
cat > scripts/post-deploy-test.sh << 'EOF'
#!/bin/bash
echo "💨 Running smoke tests..."

WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')

if curl -f "$WEB_URL/health"; then
    echo "✅ Health check passed!"
else
    echo "❌ Health check failed!"
    exit 1
fi

echo "✅ Smoke tests completed!"
EOF

chmod +x scripts/post-deploy-test.sh

# azure.yaml లో హుక్స్ జోడించండి
cat >> azure.yaml << 'EOF'

hooks:
  predeploy:
    shell: sh
    run: ./scripts/pre-deploy-check.sh
    
  postdeploy:
    shell: sh
    run: ./scripts/post-deploy-test.sh
EOF

# హుక్స్‌తో డిప్లాయ్‌మెంట్‌ను పరీక్షించండి
azd deploy
```

**విజయం ప్రమాణాలు:**
- [ ] ప్రీ-డిప్లాయ్ స్క్రిప్ట్ డిప్లాయ్‌మెంట్ కన్నా ముందు నడవాలి
- [ ] టెస్టులు 실패 అయితే డిప్లాయ్ రద్దు అవుతుంది
- [ ] పోస్ట్-డిప్లాయ్ స్మోక్ టెస్ట్ హెల్త్‌ను ధృవీకరించాలి
- [ ] హుక్స్ సరైన క్రమంలో అమలు కావాలి

### వ్యాయామం 3: బహుళ-వాతావరణ డిప్లాయ్‌మెంట్ వ్యూహం (45 నిమిషాలు)
**గోల్**: స్టేజ్డ్ డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లో అమలు చేయండి (dev → staging → production)

```bash
# డిప్లాయ్‌మెంట్ స్క్రిప్ట్ సృష్టించండి
cat > deploy-staged.sh << 'EOF'
#!/bin/bash
set -e

echo "🚀 Staged Deployment Workflow"
echo "=============================="

# దశ 1: డెవ్‌కి డిప్లాయ్ చేయండి
echo "
🛠️ Step 1: Deploying to development..."
azd env select dev
azd up --no-prompt

echo "Running dev tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# దశ 2: స్టేజింగ్‌కు డిప్లాయ్ చేయండి
echo "
🔍 Step 2: Deploying to staging..."
azd env select staging
azd up --no-prompt

echo "Running staging tests..."
curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health

# దశ 3: ప్రొడక్షన్‌ కోసం మాన్యువల్ ఆమోదం
echo "
✅ Dev and staging deployments successful!"
read -p "Deploy to production? (yes/no): " confirm

if [[ $confirm == "yes" ]]; then
    echo "
🎉 Step 3: Deploying to production..."
    azd env select production
    azd up --no-prompt
    
    echo "Running production smoke tests..."
    curl -f $(azd show --output json | jq -r '.services.web.endpoint')/health
    
    echo "
✅ Production deployment completed!"
else
    echo "❌ Production deployment cancelled"
fi
EOF

chmod +x deploy-staged.sh

# ఎన్‌విరాన్‌మెంట్‌లను సృష్టించండి
azd env new dev
azd env new staging
azd env new production

# స్టేజ్‌ చేయబడిన డిప్లాయ్‌మెంట్ నడపండి
./deploy-staged.sh
```

**విజయం ప్రమాణాలు:**
- [ ] డెవ్ వాతావరణం విజయవంతంగా డిప్లాయ్ అయ్యింది
- [ ] స్టేజింగ్ వాతావరణం విజయవంతంగా డిప్లాయ్ అయ్యింది
- [ ] ప్రొడక్షన్ కోసం మాన్యువల్ ఆమోదం అవసరం
- [ ] అన్ని వాతావరణాల్లో పనికిరాని హెల్త్ చెక్స్లు ఉన్నాయి
- [ ] అవసరమైతే రోల్ బ్యాక్ చేయగలుగుతారు

### వ్యాయామం 4: రోల్‌బ్యాక్ వ్యూహం (25 నిమిషాలు)
**గోల్**: Git ఉపయోగించి డిప్లాయ్‌మెంట్ రోల్‌బ్యాక్ అమలు చేసి పరీక్షించండి

```bash
# v1 ని డిప్లాయ్ చేయండి
azd env set APP_VERSION "1.0.0"
azd up

# v1 కమిట్ హాష్‌ను సేవ్ చేయండి
V1_COMMIT=$(git rev-parse HEAD)
echo "v1 commit: $V1_COMMIT"

# బ్రేకింగ్ చేంజ్‌తో v2 ని డిప్లాయ్ చేయండి
echo "throw new Error('Intentional break')" >> src/api/src/server.js
git add . && git commit -m "v2 with intentional break"
azd env set APP_VERSION "2.0.0"
azd deploy

# విఫలతను గుర్తించి రోల్బ్యాక్ చేయండి
if ! curl -f $(azd show --output json | jq -r '.services.api.endpoint')/health; then
    echo "❌ v2 deployment failed! Rolling back..."
    
    # git ఉపయోగించి రోల్బ్యాక్ చేయండి
    git revert HEAD --no-edit
    
    # పర్యావరణాన్ని రోల్బ్యాక్ చేయండి
    azd env set APP_VERSION "1.0.0"
    
    # v1 ని మళ్లీ డిప్లాయ్ చేయండి
    azd deploy
    
    echo "✅ Rolled back to v1.0.0"
fi
```

**విజయం ప్రమాణాలు:**
- [ ] డిప్లాయ్‌మెంట్ వైఫల్యాలను గుర్తించగలగాలి
- [ ] రోల్‌బ్యాక్ స్క్రిప్ట్ ఆటోమేటుగా అమలు అవుతుంది
- [ ] అప్లికేషన్ తిరిగి పని చేసే స్థితికి వస్తుంది
- [ ] రోల్‌బ్యాక్ తరువాత హెల్త్ చెక్లు పాస్ అవుతాయి

## 📊 డిప్లాయ్‌మెంట్ మెట్రిక్స్ ట్రాకింగ్

### మీ డిప్లాయ్‌మెంట్ పనితీరును ట్రాక్ చేయండి

```bash
# డిప్లాయ్‌మెంట్ మెట్రిక్స్ స్క్రిప్ట్ సృష్టించండి
cat > track-deployment.sh << 'EOF'
#!/bin/bash
START_TIME=$(date +%s)

azd deploy "$@"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo "
📊 Deployment Metrics:"
echo "Duration: ${DURATION}s"
echo "Timestamp: $(date)"
echo "Environment: $(azd env get-value AZURE_ENV_NAME)"
echo "Services: $(azd show --output json | jq -r '.services | keys | join(", ")')"

# లాగ్‌ను ఫైల్లో నమోదు చేయండి
echo "$(date +%Y-%m-%d,%H:%M:%S),$DURATION,$(azd env get-value AZURE_ENV_NAME)" >> deployment-metrics.csv
EOF

chmod +x track-deployment.sh

# దాన్ని ఉపయోగించండి
./track-deployment.sh
```

**మీ మెట్రిక్స్‌ను విశ్లేషించండి:**
```bash
# డిప్లాయ్‌మెంట్ చరిత్రను వీక్షించండి
cat deployment-metrics.csv

# సగటు డిప్లాయ్‌మెంట్ సమయాన్ని లెక్కించండి
awk -F',' '{sum+=$2; count++} END {print "Average: " sum/count "s"}' deployment-metrics.csv
```

## అదనపు వనరులు

- [Azure Developer CLI Deployment Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Azure App Service Deployment](https://learn.microsoft.com/en-us/azure/app-service/deploy-local-git)
- [Azure Container Apps Deployment](https://learn.microsoft.com/en-us/azure/container-apps/deploy-artifact)
- [Azure Functions Deployment](https://learn.microsoft.com/en-us/azure/azure-functions/functions-deployment-slots)

---

**నావిగేషన్**
- **ముందు పాఠం**: [మీ మొదటి ప్రాజెక్ట్](../chapter-01-foundation/first-project.md)
- **తదుపరి పాఠం**: [వనరుల ప్రావిజనింగ్](provisioning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->