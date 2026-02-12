# AZD கொண்டு Microsoft SQL தரவுத்தளம் மற்றும் Web App பதிவேற்றம்

⏱️ **அனுமானிக்கப்பட்ட நேரம்**: 20-30 நிமிடங்கள் | 💰 **அனுமானிக்கப்பட்ட செலவு**: ~$15-25/மாதம் | ⭐ **சிக்கல்நிலை**: இடைநிலை

இந்த **முழுமையான, செயல்பாட்டிற்குரிய எடுத்துக்காட்டு** [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) ஐ பயன்படுத்தி Microsoft SQL தரவுத்தளத்துடன் கூடிய Python Flask வலை பயன்பாட்டை Azure-க்கு எப்படி பதிவேற்றுவது என்பதை விளக்குகிறது. அனைத்து குறியீட்டும் உட்படுக்கப்பட்டு சோதிக்கப்பட்டுள்ளது—எந்த வெளி சார்ந்த சார்புகளும் தேவையில்லை.

## நீங்கள் கற்றுக்கொள்ளவுள்ளவை

இந்த எடுத்துக்காட்டை முடித்தவுடன், நீங்கள்:
- கட்டமைப்பு-செயலூக்கமாக பல அடுக்கு பயன்பாட்டை (web app + database) deploy செய்வதைக் கற்றுக்கொள்வீர்கள்
- ரகசியங்களை இதழ்படாமல் பாதுகாப்பாக தரவுத்தள இணைப்புகளை கட்டமைப்பது
- Application Insights மூலம் பயன்பாட்டின் ஆரோக்கியத்தை கண்காணிப்பது
- AZD CLI மூலம் Azure வளங்களை திறம்பட நிர்வகிப்பது
- பாதுகாப்பு, செலவு முந்திருப்பு மற்றும் அறியப்படுதல் அணுகுமுறைகளில் Azure சிறந்த நடைமுறைகளை பின்பற்றுவது

## நிலைமையின் கண்ணோட்டம்
- **Web App**: தரவுத்தள இணைப்பு கொண்ட Python Flask REST API
- **Database**: மாதிரி தரவுகளுடன் Azure SQL Database
- **Infrastructure**: Bicep கொண்டு provision (மொடுலர், மீண்டும் பயன்படுத்தக்கூடிய டெம்ப்ளேட்கள்)
- **Deployment**: `azd` கட்டளைகளால் முழுமையாக தானியங்கி
- **Monitoring**: பதிவுகள் மற்றும் டெலிமெட்ரிக்காக Application Insights

## தேவையான முன் நிபந்தனைகள்

### தேவையான கருவிகள்

தொடக்கத்திற்கு முன்னர், கீழ்காணும் கருவிகள் உங்கள் கணினியில் நிறுவப்பட்டுள்ளதா என்று சரிபார்க்கவும்:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (பதிப்பு 2.50.0 அல்லது அதற்கு மேல்)
   ```sh
   az --version
   # எதிர்பார்க்கப்படும் வெளியீடு: azure-cli 2.50.0 அல்லது அதற்கு மேல்
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (பதிப்பு 1.0.0 அல்லது அதற்கு மேல்)
   ```sh
   azd version
   # எதிர்பார்க்கப்படும் வெளியீடு: azd பதிப்பு 1.0.0 அல்லது அதற்கும் மேல்
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (உள்ளூர் அபிவிருத்திக்காக)
   ```sh
   python --version
   # எதிர்பார்க்கப்படும் வெளியீடு: Python 3.8 அல்லது அதற்கு மேற்பட்டது
   ```

4. **[Docker](https://www.docker.com/get-started)** (விருப்பமானது, உள்ளூரில் கன்டெய்னரைக் கொண்டு அபிவிருத்திக்காக)
   ```sh
   docker --version
   # எதிர்பார்க்கப்படும் வெளியீடு: Docker பதிப்பு 20.10 அல்லது அதற்கு மேல்
   ```

### Azure தேவைகள்

- செயலில் உள்ள **Azure subscription** ([create a free account](https://azure.microsoft.com/free/))
- உங்கள் subscription-இல் வளங்களை உருவாக்கும் அனுமதிகள்
- Subscription அல்லது resource group üzerinde **Owner** அல்லது **Contributor** பங்கு

### அறிவு முன் நிபந்தனைகள்

இது ஒரு **இடைநிலை** எடுத்துக்காட்சி. நீங்கள் கீழdakையைப் பற்றி அடிப்படை அறிவு கொண்டிருக்க வேண்டும்:
- கட்டளை வரிசை அடிப்படை செயல்பாடுகள்
- முளையான கிளவுட் கருத்துக்கள் (வளங்கள், resource groups)
- வலை பயன்பாடுகள் மற்றும் தரவுத்தளங்கள் பற்றிய அடிப்படை புரிதல்

**AZD புதியவரா?** முதலில் [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) ஐத் தொடங்கிக் கொள்ளுங்கள்.

## கட்டமைப்பு

இந்த எடுத்துக்காட்சி ஒரு இரண்டு-அடுக்கு கட்டமைப்பை (web application மற்றும் SQL database) deploy செய்கிறது:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**வளங்களை உருவாக்குதல்:**
- **Resource Group**: அனைத்து வளங்களுக்கும் கொண்டகமாக உள்ளது
- **App Service Plan**: Linux அடிப்படையிலான ஹோஸ்டிங் (செலவு பாதுகாப்பிற்கான B1 tier)
- **Web App**: Python 3.11 runtime உடன் Flask செயலி
- **SQL Server**: TLS 1.2 குறைந்தபட்சத் தேவையுடன் நிர்வகிக்கப்படும் தரவுத்தள சேவையகம்
- **SQL Database**: Basic tier (2GB, அபிவிருத்தி/சோதனைக்குப் பொருத்தமானது)
- **Application Insights**: கண்காணிப்பு மற்றும் பதிவு
- **Log Analytics Workspace**: மையப்படுத்தப்பட்ட பதிவு சேமிப்பு

**உருவகப்படுத்தல்**: இது ஒரு உணவகம் (web app) மற்றும் ஓர் பெரிய ஃப்ரீசர் (database) போன்று நினைக்கவும். வாடிக்கையாளர் மெனுவில் இருந்து ஆர்டர் செய்கிறார் (API endpoints), சமையலறை (Flask app) ஃப்ரீசர் (தரவு) இருந்து உருப்படிகளை மீட்டெடுக்கிறது. உணவக மேலாளர் (Application Insights) நடக்கும் அனைத்தையும் பின்தொடர்கிறார்.

## கோப்புறை அமைப்பு

இந்த எடுத்துக்காட்டில் அனைத்து கோப்புகளும் உட்படுக்கப்பட்டுள்ளன—பூஜ்யமான வெளி சார்புகள் தேவையில்லை:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**ஒவ்வொரு கோப்பும் என்ன செய்கிறது:**
- **azure.yaml**: AZD-க்கு என்னவும் எங்கே deploy செய்வதையும் கூறுகிறது
- **infra/main.bicep**: அனைத்து Azure வளங்களையும் ஒழுங்குபடுத்துகிறது
- **infra/resources/*.bicep**: தனி வள வரையறைகள் (மீண்டும் பயன்பாட்டிற்கு மொடுலார்)
- **src/web/app.py**: தரவுத்தள லாஜிக் கொண்ட Flask செயலி
- **requirements.txt**: Python பாகேஜ் சார்புகள்
- **Dockerfile**: deployment-க்கான கன்டெய்னரை உருவாக்கும் வழிமுறைகள்

## விரைவு தொடக்கம் (படி படியாக)

### படி 1: கிளோன் செய்து கோப்புறைக்கு செல்லவும்

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ வெற்றி சரிபார்க்கை**: `azure.yaml` மற்றும் `infra/` கோப்புறையை நீங்கள் காண்கிறீர்களா என்பதை சரிபார்க்கவும்:
```sh
ls
# எதிர்பார்க்கப்படுகிறது: README.md, azure.yaml, infra/, src/
```

### படி 2: Azure-இல் அங்கீகாரம் பெறுதல்

```sh
azd auth login
```

இது உங்கள் உலாவியில் Azure அங்கீகாரம் பெற உலாவியை திறக்கும். உங்கள் Azure அடையாளத்தால் உள்நுழையவும்.

**✓ வெற்றி சரிபார்க்கை**: நீங்கள் கீழdakரை காண வேண்டும்:
```
Logged in to Azure.
```

### படி 3: சூழலை 초기ம்செய்தல்

```sh
azd init
```

**என்ன జరుగுகிறது**: AZD உங்கள் பதிவேற்றத்திற்கான உள்ளூர் கட்டமைப்பை உருவாக்கும்.

**நீங்கள் காண்பீர்கள் என்ற பிரியவாக்குகள்**:
- **Environment name**: ஒரு குறுகிய பெயரை உள்ளிடவும் (எ.கா., `dev`, `myapp`)
- **Azure subscription**: பட்டியலில் இருந்து உங்கள் subscription-ஐ தேர்ந்தெடுக்கவும்
- **Azure location**: ஒரு பகுதியை தேர்ந்தெடுக்கவும் (எ.கா., `eastus`, `westeurope`)

**✓ வெற்றி சரிபார்க்கை**: நீங்கள் கீழdakரை காண வேண்டும்:
```
SUCCESS: New project initialized!
```

### படி 4: Azure வளங்களை Provision செய்தல்

```sh
azd provision
```

**என்ன происходит**: AZD அனைத்து கட்டமைப்பையும் deploy செய்யும் (5-8 நிமிடங்கள் எடுக்கலாம்):
1. Resource group உருவாக்குகிறது
2. SQL Server மற்றும் Database உருவாக்குகிறது
3. App Service Plan உருவாக்குகிறது
4. Web App உருவாக்குகிறது
5. Application Insights உருவாக்குகிறது
6. நெட்வொர்க்கிங் மற்றும் பாதுகாப்பு கட்டமைப்புகளை அமைக்கும்

**நீங்கள் கேட்கப்படுவது**:
- **SQL admin username**: ஒரு பயனர்பெயரை உள்ளிடவும் (எ.கா., `sqladmin`)
- **SQL admin password**: ஒரு வலுவான கடவுச்சொல்லை உள்ளிடவும் (இதை சேமிக்கவும்!)

**✓ வெற்றி சரிபார்க்கை**: நீங்கள் கீழdakரை காண வேண்டும்:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ நேரம்**: 5-8 நிமிடங்கள்

### படி 5: பயன்பாட்டை Deploy செய்தல்

```sh
azd deploy
```

**என்ன நடைபெறும்**: AZD உங்கள் Flask செயலியை build செய்து deploy செய்யும்:
1. Python செயலியை package செய்கிறது
2. Docker கன்டெய்னரை கட்டுகிறது
3. Azure Web App-க்கு push செய்கிறது
4. மாதிரி தரவுகளுடன் தரவுத்தளத்தை initialize செய்கிறது
5. செயலியை தொடங்குகிறது

**✓ வெற்றி சரிபார்க்கை**: நீங்கள் கீழdakரை காண வேண்டும்:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ நேரம்**: 3-5 நிமிடங்கள்

### படி 6: பயன்பாட்டை உலாவியில் திறக்கவும்

```sh
azd browse
```

இது உங்கள் பதிவேற்றப்பட்ட web app-ஐ உலாவியில் `https://app-<unique-id>.azurewebsites.net` என்ற முகவரியில் திறக்கும்

**✓ வெற்றி சரிபார்க்கை**: நீங்கள் JSON வெளியீட்டை காண வேண்டும்:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### படி 7: API Endpoints-ஐ சோதிக்கவும்

**ஆரோக்கியச் சோதனை** (தரவுத்தள இணைப்பை சரிபார்க்க):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**எதிர்பார்க்கப்படும் பதில்**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**பொருட்களின் பட்டியல்** (மாதிரி தரவு):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**எதிர்பார்க்கப்படும் பதில்**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**ஒரு தனி பொருள் பெறுதல்**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ வெற்றி சரிபார்க்கை**: 모든 endpoints பிழையின்றி JSON தரவுகளை திருப்ப வேண்டும்.

---

**🎉 வாழ்த்துகள்!** நீங்கள் AZD பயன்படுத்தி Azure-க்கு வெற்றிகரமாக ஒரு வலை பயன்பாட்டையும் தரவுத்தளத்தையும் deploy செய்துள்ளீர்கள்.

## கட்டமைப்பு ஆழமான பகுப்பாய்வு

### சூழல் மாறிலிகள்

ரகசியங்கள் Azure App Service கட்டமைப்பின் மூலம் பாதுகாப்பாக நிர்வகிக்கப்படுகின்றன—**source code-ல் ஒருபோதும் hardcode செய்யப்படக்கூடாது**.

**AZD மூலம் தானாக கட்டமைக்கப்படும்**:
- `SQL_CONNECTION_STRING`: குறியாக்கப்பட்ட நுண்ணறிவுடன் தரவுத்தள இணைப்பு
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: கண்காணிப்பு டெலிமெட்ரி முடிவு
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: தானாக சார்புகள் நிறுவப்படும்படி இயக்கு

**ரகசியங்கள் எங்கே சேமிக்கப்படுகின்றன**:
1. `azd provision` போது, நீங்கள் SQL சான்றுகளை பாதுகாப்பான பிரியவாக்குகள் மூலம் வழங்குகிறீர்கள்
2. AZD அவற்றை உங்கள் உள்ளூர் `.azure/<env-name>/.env` கோப்பில் (git-ignored) சேமிக்கிறது
3. AZD அவற்றை Azure App Service கட்டமைப்பில் இயக்கு (rest-இல் குறியாக்கம்)
4. செயலி runtime-இல் `os.getenv()` மூலம் அவை வாசிக்கப்படும்

### உள்ளூர் அபிவிருத்தி

உள்ளூரில் சோதனை செய்ய, மாதிரி கொண்டு `.env` கோப்பை உருவாக்கவும்:

```sh
cp .env.sample .env
# உங்கள் உள்ளூர் தரவுத்தள இணைப்பை பயன்படுத்தி .env ஐ திருத்தவும்
```

**உள்ளூர் அபிவிருத்தி பண்படை**:
```sh
# தேவையான சார்புகளை நிறுவவும்
cd src/web
pip install -r requirements.txt

# சூழல் மாறிலிகளை அமைக்கவும்
export SQL_CONNECTION_STRING="your-local-connection-string"

# பயன்பாட்டை இயக்கவும்
python app.py
```

**உள்ளூரில் சோதிக்க**:
```sh
curl http://localhost:8000/health
# எதிர்பார்க்கப்பட்டது: {"status": "healthy", "database": "connected"}
```

### கோடாக் கட்டமைப்பு (Infrastructure as Code)

அனைத்து Azure வளங்களும் **Bicep டெம்ப்ளேட்களில்** (`infra/` கோப்புறை) வரையறுக்கபட்டுள்ளன:

- **மொடுலர் வடிவமைப்பு**: ஒவ்வொரு வள வகைக்கும் மீண்டும் பயன்படக்கூடிய தனி கோப்பு
- **பாராமிட்டரிடப்பட்டு**: SKUs, பிரிவுகள், பெயரிடல் நெறிமுறைகளை தனிப்பயனாக்க முடியும்
- **சிறந்த நடைமுறைகள்**: Azure பெயர் தரநிலைகள் மற்றும் பாதுகாப்பு டீஃபால்ட்களை பின்பற்றுகிறது
- **பதிவேற்பு கட்டுப்படுத்தப்பட்டது**: கட்டமைப்பு மாற்றங்கள் Git-ல் பதிவு செய்யப்படுகின்றன

**தனிப்பயன் உதாரணம்**:
தரவுத்தளத் த்தியைக் மாற்ற விரும்பினால், `infra/resources/sql-database.bicep` ஐ எடிட் செய்யவும்:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## பாதுகாப்பு சிறந்த நடைமுறைகள்

இந்த எடுத்துக்காட்சி Azure பாதுகாப்பு சிறந்த நடைமுறைகளை பின்பற்றுகிறது:

### 1. **மூல குறியீட்டில் ரகசியங்கள் இல்லை**
- ✅ சான்றுகள் Azure App Service கட்டமைப்பில் சேமிக்கப்படுகின்றன (குறியாக்கம் செய்யப்பட்டவை)
- ✅ `.env` கோப்புகள் `.gitignore` மூலம் Git-லிருந்து விலக்கப்பட்டுள்ளன
- ✅ Provisioning போது ரகசியங்கள் பாதுகாப்பான அளவுருக்களால் வழங்கப்படுகின்றன

### 2. **குறியாக்கப்பட்ட இணைப்புகள்**
- ✅ SQL Server-க்கு குறைந்தபட்சம் TLS 1.2
- ✅ Web App-க்கு HTTPS மட்டுமே கட்டாயம்
- ✅ தரவுத்தள இணைப்புகள் குறியாக்கப்பட்ட சேனல்களை பயன்படுத்துகின்றன

### 3. **நெட்வொர்க் பாதுகாப்பு**
- ✅ SQL Server ஃபயர்வால் Azure சேவைகளுக்கு மட்டுமே அனுமதி கொடுக்கப்பட்டுள்ளது
- ✅ பொது நெட்வொர்க் அணுகல் கட்டுப்பட்டுள்ளது (Private Endpoints கொண்டு மேலதிகமாக கட்டுப்படுத்தலாம்)
- ✅ Web App-ல் FTPS இயலாது

### 4. **அங்கீகாரம் & அங்கீகாரமளிப்பு**
- ⚠️ **தற்போது**: SQL அங்கீகாரம் (username/password)
- ✅ **தொழிற்சாலை பரிந்துரை**: கடவுச்சொல்லற்ற அங்கீகாரத்துக்காக Azure Managed Identity பயன்படுத்தவும்

**Managed Identity-க்கு மேம்படுத்துவதற்கான படிகள்** (உற்பத்திக்கு):
1. Web App-ல் managed identity ஐ இயக்கு
2. அந்த identity-க்கு SQL அனுமதிகளை வழங்கவும்
3. connection string-ஐ managed identity பயன்படுத்தக்கூடியவாக புதுப்பிக்கவும்
4. கடவுச்சொல் அடிப்படையிலான அங்கீகாரத்தை நீக்கவும்

### 5. **ஆடிட்டிங் & கட்டுப்பாடுகள்**
- ✅ Application Insights அனைத்து கோரிக்கைகளையும் மற்றும் பிழைகளையுமே பதிவு செய்கிறது
- ✅ SQL Database ஆடிட்டிங் இயக்கு (கட்டுப்பாட்டு தேவைக்கேற்ப கொள்கை அமைக்கலாம்)
- ✅ அனைத்து வளங்களும் நிர்வாகத்திற்காக டேக் செய்யப்பட்டுள்ளன

**உற்பத்திக்கு முன்னர் பாதுகாப்பு செயற்தாள்**:
- [ ] Azure Defender for SQL-ஐ இயக்கு
- [ ] SQL Database-க்கு Private Endpoints அமைக்கவும்
- [ ] Web Application Firewall (WAF) ஐ இயக்கு
- [ ] ரகசிய மாற்றத்திற்காக Azure Key Vault செயல்படுத்தவும்
- [ ] Azure AD அங்கீகாரத்தை அமைக்கவும்
- [ ] அனைத்து வளங்களுக்கும் டைக்னொஸ்டிக் பதிவு இயக்கு

## செலவு குறைப்புக்கான வழிமுறைகள்

**அனுமான மாதச் செலவுகள்** (நவம்பர் 2025 நிலவரப்படி):

| Resource | SKU/Tier | Estimated Cost |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Total** | | **~$20/month** |

**💡 செலவு சேமிப்பு குறிப்புகள்**:

1. **கற்றலுக்காக Free Tier பயன்படுத்தவும்**:
   - App Service: F1 tier (இலவசம், குறிப்பிட்ட நேரம் மட்டுமே)
   - SQL Database: Azure SQL Database serverless பயன்படுத்தவும்
   - Application Insights: 5GB/மாதம் இலவச உட்குழப்பு

2. **பயன்பாட்டில் இல்லாதபோது வளங்களை நிறுத்தவும்**:
   ```sh
   # வலைப் பயன்பாட்டை நிறுத்தவும் (தரவுத்தளச் செலவுகள் தொடரும்)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # தேவையான போது மீண்டும் தொடங்கவும்
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **சோதனை முடிந்தால் அனைத்தையும் நீக்கவும்**:
   ```sh
   azd down
   ```
   இது அனைத்து வளங்களையும் நீக்கி கட்டணங்களை நிறுத்தும்.

4. **அபிவிருத்தி vs உற்பத்தி SKUs**:
   - **அபிவிருத்தி**: இந்த எடுத்துக்காட்டில் பயன்படுத்திய Basic tier
   - **உற்பத்தி**: redundancy கொண்ட Standard/Premium tier

**செலவு கண்காணிப்பு**:
- [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement) இல் செலவுகளைப் பார்க்கவும்
- அதிர்ச்சிகளை தவிர்க்க செலவு оповещения அமைக்கவும்
- கணக்கெடுத்தல் தடயத்திற்காக அனைத்து வளங்களையும் `azd-env-name` என்ற tag-ஆலேயே அடையாளம் காண்க

**இலவச பரிமாற்ற மாற்று**:
கற்றலுக்காக, `infra/resources/app-service-plan.bicep` ஐ மாற்றி Free tier பயன்படுத்தலாம்:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**குறிப்பு**: இலவச தடவை வரம்புகள் உள்ளன (1 நாள் 60 நிமிட CPU, எப்போதும்-ஓன் இல்லை).

## கண்காணிப்பு & காணுபதி

### Application Insights ஒருங்கிணைப்பு

இந்த எடுத்துக்காட்சி விரிவான கண்காணிப்பிற்காக **Application Insights** ஐ உட்படுத்துகிறது:

**என்ன கண்காணிக்கப்படுகிறது**:
- ✅ HTTP கோரிக்கைகள் (விரைவு, நிலை குறியீடுகள், endpoints)
- ✅ செயலி பிழைகள் மற்றும் exceptions
- ✅ Flask செயலியிலிருந்து வரையறுக்கப்பட்ட பதிவு
- ✅ தரவுத்தள இணைப்பு ஆரோக்கியம்
- ✅ செயல்திறன் அளவுருக்கள் (CPU, நினைவகம்)

**Application Insights அணுகுதல்**:
1. [Azure Portal](https://portal.azure.com) திறக்கவும்
2. உங்கள் resource group (`rg-<env-name>`) க்கு செல்லவும்
3. Application Insights resource (`appi-<unique-id>`) மீது கிளிக் செய்க

**பயனுள்ள கேள்விகள்** (Application Insights → Logs):

**அனைத்து கோரிக்கைகளையும் பார்வையிடுக**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**பிழைகளை கண்டுபிடிக்க**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**ஆரோக்கிய Endpoint-ஐ சரிபார்க்க**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database ஆடிட்டிங்

**SQL Database ஆடிட்டிங் இயக்கு** என்பதன் மூலம் கீழdakைகள் ट्रாக் செய்யப்படுகின்றன:
- தரவுத்தள அணுகல் முறைமைகள்
- தோல்வியடைந்த உள்நுழைவு முயற்சிகள்
- ஸ்கீமா மாற்றங்கள்
- தரவு அணுகல் (கட்டுப்பாட்டிற்காக)

**ஆடிட் பதிவுகளை அணுக**:
1. Azure Portal → SQL Database → Auditing
2. Log Analytics workspace-ல் பதிவுகளை பார்வையிடவும்

### நேரடி கண்காணிப்பு

**Live Metrics பார்க்க**:
1. Application Insights → Live Metrics
2. நேரடியாக கோரிக்கைகள், தோல்விகள் மற்றும் செயல்திறன் பார்க்கலாம்

**எச்சரிக்கை அமைக்க**:
முக்கிய நிகழ்வுகளுக்காக எச்சரிக்கைகளை உருவாக்கவும்:
- 5 நிமிடத்தில் HTTP 500 பிழைகள் > 5
- தரவுத்தள இணைப்பு தோல்விகள்
- பதிலளிப்பு நேரம் உயர் (>2 வினாடிகள்)

**எச்சரிக்கை உருவாக்க உதாரணம்**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## பிரச்சனை தீர்க்குதல்

### பொதுவான பிரச்சனைகள் மற்றும் தீர்வுகள்

#### 1. `azd provision` "Location not available" என்ற பிழையுடன் தோல்வியடைகிறது

**அறிகுறி**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**தீர்வு**:
வேறு Azure பிராந்தியத்தைத் தேர்ந்தெடுக்கவும் அல்லது resource provider-ஐ பதிவு செய்யவும்:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL இணைப்பு ஏற்றும் போது தோல்வியடைகிறது

**அறிகுறி**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**தீர்வு**:
- SQL Server firewall Azure சேவைகளை அனுமதிக்கிறதா என்பதை சரிபார்க்கவும் (தானாக கட்டமைக்கப்படுகிறது)
- `azd provision` 실행時 SQL நிர்வாக கடவுச்சொல் சரியாக உள்ளிடப்பட்டது என்பதை சரிபார்க்கவும்
- SQL Server முழுமையாக உருவாக்கப்பட்டுவிட்டதா என்பதை உறுதிசெய்க (2-3 நிமிடங்கள் எடுக்கலாம்)

**இணைப்பை சரிபார்க்கவும்**:
```sh
# Azure போர்டலிலிருந்து SQL Database → Query editor சென்று கொள்ளவும்
# உங்கள் அங்கீகார விவரங்களை பயன்படுத்தி இணைக்க முயற்சிக்கவும்
```

#### 3. Web App "Application Error" காட்டுகிறது

**அறிகுறி**:
உலாவி பொதுவான பிழை பக்கத்தை காட்டுகிறது.

**தீர்வு**:
அப்பிளிகேஷன் பதிவு கோப்புகளைச் சோதிக்கவும்:
```sh
# சமீபத்திய பதிவுகளைப் பார்க்கவும்
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**பொதுவான காரணங்கள்**:
- சுற்றுப்புற மாறிலிகள் குறைவு (App Service → Configuration-ஐ சரிபார்க்கவும்)
- Python package நிறுவல் தோல்வி (deployment பதிவுகளைச் சரிபார்க்கவும்)
- தரவுத்தளம் தொடக்கம் பிழை (SQL இணைதிறலைச் சரிபார்க்கவும்)

#### 4. `azd deploy` "Build Error" என்ற பிழையுடன் தோல்வியடைகிறது

**அறிகுறி**:
```
Error: Failed to build project
```

**தீர்வு**:
- `requirements.txt` இல் syntax பிழைகள் இல்லை என்பதை உறுதிசெய்க
- `infra/resources/web-app.bicep` இல் Python 3.11 குறிப்பிடப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
- Dockerfile-ல் சரியான base image உள்ளது என்பதை சரிபார்க்கவும்

**உள்ளகமாக பிழைதிருத்தம் செய்யவும்**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. AZD கட்டளைகள் ஓட்டும் போது "Unauthorized"

**அறிகுறி**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**தீர்வு**:
Azure-இல் மீண்டும் அங்கீகரிக்கவும்:
```sh
azd auth login
az login
```

சப்ஸ்கிரிப்ஷனில் உங்களுக்கு சரியான அனுமதிகள் (Contributor role) உள்ளதா என்பதை சரிபார்க்கவும்.

#### 6. தரவுத்தள செலவுகள் அதிகம்

**அறிகுறி**:
எதிர்பாராத Azure கட்டணம்.

**தீர்வு**:
- சோதனைக்குப் பிறகு `azd down` இயக்குவதை மறந்துவிட்டீர்களா என்பதைச் சரிபார்க்கவும்
- SQL Database Basic tier ஐப் பயன்படுத்துகிறதா என சரிபார்க்கவும் (Premium அல்ல)
- Azure Cost Management-இல் செலவுகளை மதிப்பாய்வு செய்யவும்
- செலவு எச்சரிப்புகளை அமைக்கவும்

### உதவி பெறுவது

**அனைத்து AZD சூழல் மாறிலிகளையும் காண்க**:
```sh
azd env get-values
```

**வெளியீட்டு நிலையை சரிபார்க்கவும்**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**அப்பிளிகேஷன் பதிவுகளை அணுகுக**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**மேலும் உதவி வேண்டுமா?**
- [AZD பிரச்சனை தீர்க்கும் கையேடு](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service பிரச்சனை தீர்க்குதல்](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL பிரச்சனைகள் தீர்வு](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## நடைமுறை பயிற்சிகள்

### பயிற்சி 1: உங்கள் வெளியீட்டை சரிபார்க்கவும் (ஆரம்ப நிலை)

**நோக்கம்**: அனைத்து வளங்களும் உருவாக்கப்பட்டுள்ளன மற்றும் பயன்பாடு வேலை செய்கிறதா என்பதை உறுதிசெய்யுதல்.

**படிகள்**:
1. உங்கள் resource group-இல் உள்ள அனைத்து வளங்களையும் பட்டியலிடுக:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **எதிர்பார்க்கப்படுகிறது**: 6-7 வளங்கள் (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. அனைத்து API endpoints-ஐ சோதிக்கவும்:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **எதிர்பார்க்கப்படுகிறது**: எல்லாமே பிழைகள் இல்லாமல் செல்லுபடியான JSON ஐ திருப்பும்

3. Application Insights-ஐ சரிபார்க்கவும்:
   - Azure போர்டலில் Application Insights-க்கு சென்று
   - "Live Metrics" க்கு செல்லவும்
   - வெப் செயலியில் உலாவியை புதுப்பிக்கவும்
   **எதிர்பார்க்கப்படுகிறது**: கோரிக்கைகள் நேரடியாக தோன்றுவதைக் காணலாம்

**வெற்றி நிபந்தனைகள்**: அனைத்து 6-7 வளங்களும் உள்ளன, அனைத்து endpoints-களும் தரவைத் தருகின்றன, Live Metrics செயல்பாட்டைக் காட்சி செய்கிறது.

---

### பயிற்சி 2: புதிய API Endpoint ஒன்றைச் சேர்க்கவும் (நடுத்தர)

**நோக்கம்**: Flask பயன்பாட்டை புதிய endpoint மூலம் விரிவாக்குதல்.

**தொடக்க குறியீடு**: தற்போதைய endpoints `src/web/app.py` இல்

**படிகள்**:
1. `src/web/app.py` ஐத் திருத்தி `get_product()` செயல்பாட்டுக்குப் பின் புதிய endpoint ஒன்றைச் சேர்க்கவும்:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. புதுப்பிக்கப்பட்ட பயன்பாட்டை ஏற்றி விடவும்:
   ```sh
   azd deploy
   ```

3. புதிய endpoint-ஐ சோதிக்கவும்:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **எதிர்பார்க்கப்படுகிறது**: "laptop" என்ற தேடுதலுடன் பொருந்தும் பொருட்களைத் திருப்பும்

**வெற்றி நிபந்தனைகள்**: புதிய endpoint செயல்படுகிறது, வடிகட்டப்பட்ட முடிவுகளைத் திருப்புகிறது, Application Insights பதிவுகளில் தோற்றம் காணப்படுகிறது.

---

### பயிற்சி 3: கண்காணிப்பு மற்றும் எச்சரிப்புகளைச் சேர்க்கவும் (மேம்பட்ட)

**நோக்கம்**: எச்சரிப்புகளுடன் முன்னெச்சரிக்கை கண்காணிப்பை அமைத்தல்.

**படிகள்**:
1. HTTP 500 பிழைகளுக்காக ஒரு எச்சரிப்பை உருவாக்கவும்:
   ```sh
   # Application Insights வளத்தின் ID ஐப் பெறவும்
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # எச்சரிக்கை உருவாக்கவும்
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. பிழைகள் ஏற்பட்டு எச்சரிப்பை துவக்கவும்:
   ```sh
   # இல்லாத தயாரிப்பை கோரவும்
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. எச்சரிப்பு இயங்கினதா என்பதை சரிபார்க்கவும்:
   - Azure Portal → Alerts → Alert Rules
   - உங்கள் மின்னஞ்சலைச் சரிபார்க்கவும் (அமைக்கப்பட்டிருந்தால்)

**வெற்றி நிபந்தனைகள்**: எச்சரிப்பு விதி உருவாக்கப்ட்டுள்ளது, பிழைகளில் செயல்படுகிறது, அறிவிப்புகள் பெறப்படுகின்றன.

---

### பயிற்சி 4: தரவுத்தள ஸ்கீமா மாற்றங்கள் (மேம்பட்ட)

**நோக்கம்**: புதிய அட்டவணையைச் சேர்த்து பயன்பாட்டை அதைப் பயன்படுத்துமாறு மாற்றுதல்.

**படிகள்**:
1. Azure Portal-இல் Query Editor மூலம் SQL Database-ஐ இணைக்கவும்

2. புதிய `categories` அட்டவணையை உருவாக்கவும்:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. பதில்களில் category தகவலைச் சேர்ப்பதற்கு `src/web/app.py` ஐ புதுப்பிக்கவும்

4. வெளியீடு செய்து சோதிக்கவும்

**வெற்றி நிபந்தனைகள்**: புதிய அட்டவணை உள்ளது, பொருட்கள் category தகவலைக் காட்டுகின்றன, பயன்பாடு இன்னும் செயல்படுகிறது.

---

### பயிற்சி 5: கேச்சிங் செயல்படுத்தல் (நிபுணர்)

**நோக்கம்**: செயல்திறனை மேம்படுத்த Azure Redis Cache ஐச் சேர்க்கவும்.

**படிகள்**:
1. `infra/main.bicep`-இல் Redis Cache-ஐச் சேர்க்கவும்
2. பொருள் விசாரணைகளை கேச் செய்ய `src/web/app.py`-ஐ புதுப்பிக்கவும்
3. Application Insights மூலம் செயல்திறன் மேம்பாட்டை அளவிடவும்
4. கேச்ச் முன்/பிறகு பதில் நேரங்களை ஒப்பிடவும்

**வெற்றி நிபந்தனைகள்**: Redis நிறுவப்பட்டுள்ளது, கேச்சிங் செயல்படுகிறது, பதிலளிப்பு நேரங்கள் >50% இல் மேம்படுகிறது.

**குறிப்பு**: ஆரம்பிக்க [Azure Cache for Redis documentation](https://learn.microsoft.com/azure/azure-cache-for-redis/) ஐப் பார்க்கவும்.

---

## சுத்தப்படுத்தல்

தொடரும் கட்டணங்களைத் தவிர்க்க, முடிந்தவுடன் அனைத்து வளங்களையும் நீக்கவும்:

```sh
azd down
```

**உறுதிப்பு கேள்வி**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

`y` எனத் தட்டச்சு செய்து உறுதிசெய்க.

**✓ வெற்றிச் சரிபார்ப்பு**: 
- அனைத்து வளங்களும் Azure போர்டலிலிருந்து நீக்கப்பட்டுள்ளன
- மேலதிக கட்டணங்கள் இல்லை
- உள்ளக `.azure/<env-name>` கோப்புறை நீக்கப்படலாம்

**மாற்று** (உள்கட்டமைப்பை வைத்துக்கொண்டு, தரவை நீக்கவும்):
```sh
# வளக் குழுவையே மட்டும் நீக்கவும் (AZD கட்டமைப்பை வைத்துக்கொள்ளவும்)
az group delete --name rg-<env-name> --yes
```
## மேலும் அறிய

### தொடர்புடைய ஆவணங்கள்
- [Azure Developer CLI ஆவணம்](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database ஆவணம்](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service ஆவணம்](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep மொழி குறிப்புகள்](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### இந்த பாடத்தில் அடுத்த படிகள்
- **[Container Apps Example](../../../../examples/container-app)**: Azure Container Apps மூலம் மைக்ரோசேவைகளை வெளியேற்றுக
- **[AI ஒருங்கிணைப்பு வழிகாட்டு](../../../../docs/ai-foundry)**: உங்கள் பயன்பாட்டிற்கு AI திறன்கள் சேர்க்கவும்
- **[Deployment சிறந்த நடைமுறைகள்](../../docs/chapter-04-infrastructure/deployment-guide.md)**: உற்பத்தி வெளியீடு முறைவுகள்

### மேம்பட்ட தலைப்புகள்
- **Managed Identity**: கடவுச்சொற்களை அகற்று மற்றும் Azure AD அங்கீகாரத்தைப் பயன்படுத்தவும்
- **Private Endpoints**: ஒரு மெய்நிகர் நெட்வொர்க்கில் தரவுத்தள இணைப்புகளை பாதுகாப்பாகச் செய்யவும்
- **CI/CD ஒருங்கிணைப்பு**: GitHub Actions அல்லது Azure DevOps மூலம் வெளியீடுகளை தானாக செய்யவும்
- **பல-சூழல்கள்**: dev, staging, மற்றும் production சூழல்களை அமைக்கவும்
- **தரவுத்தள மாற்றங்கள்**: ஸ்கீமா பதிப்பு மேலாண்மைக்கு Alembic அல்லது Entity Framework ஐ பயன்படுத்தவும்

### பிற அணுகுமுறைகளுடன் ஒப்பீடு

**AZD vs. ARM Templates**:
- ✅ AZD: உயர் மட்ட சுருக்கம், எளிய கட்டளைகள்
- ⚠️ ARM: அதிகமாக விவரமானது, நுணுக்கமான கட்டுப்பாடு

**AZD vs. Terraform**:
- ✅ AZD: Azure-இற்கு சொந்தமானது, Azure சேவைகளுடன் ஒருங்கிணைக்கப்பட்டுள்ளது
- ⚠️ Terraform: பல-க்ளவுட் ஆதரவு, பெரிய சூழலமைப்பு

**AZD vs. Azure Portal**:
- ✅ AZD: மீண்டும் செய்யக்கூடியது, பதிப்பு-கட்டுப்பாடு கொண்டது, தானியக்கமயமாக்கக்கூடியது
- ⚠️ Portal: கைமுறை கிளிக்குகள், மீண்டும் உருவாக்க கடினம்

**AZD ஐ இதுபோல நினையுங்கள்**: Azureக்கான Docker Compose — சிக்கலான வெளியீடுகளுக்கு எளிமைப்படுத்தப்பட்ட கட்டமைப்பு.

---

## அடிக்கடி கேட்கப்படும் கேள்விகள்

**Q: நான் வேறு நிரல்மொழியைப் பயன்படுத்தலாமா?**  
A: ஆம்! `src/web/` ஐ Node.js, C#, Go அல்லது எந்த மொழியேனும் மாற்றுங்கள். `azure.yaml` மற்றும் Bicep-ஐ இணக்கமாக புதுப்பிக்கவும்.

**Q: நான் எப்படி மேலும் தரவுத்தளங்களைச் சேர்க்கலாம்?**  
A: `infra/main.bicep`-இல் இன்னொரு SQL Database மொட்யூலைச் சேர்க்கவும் அல்லது Azure Database சேவைகளில் இருந்து PostgreSQL/MySQL ஐப் பயன்படுத்தவும்.

**Q: நான் இதை உற்பத்திக்கு (production) பயன்படுத்தலாமா?**  
A: இது ஒரு தொடக்கப் புள்ளிதான். உற்பத்தி அமைப்பிற்கு: managed identity, private endpoints, redundancy, backup திட்டம், WAF மற்றும் மேம்பட்ட கண்காணிப்புகளைச் சேர்க்கவும்.

**Q: குறியீடு வெளியீட்டின் பதிலாக கொண்டெய்நர்களை பயன்படுத்த விரும்பினால் என்ன?**  
A: முழுவதும் Docker கொன்டெய்நர்களைப் பயன்படுத்தும் [Container Apps Example](../../../../examples/container-app) ஐப் பாருங்கள்.

**Q: என் உள்ளக இயந்திரத்திலிருந்து தரவுத்தளத்துடன் எப்படி இணைபடுவது?**  
A: உங்கள் IP-ஐ SQL Server firewall-இல் சேர்க்கவும்:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: புதியதை உருவாக்காமல் உள்ளே இருக்கும் தரவுத்தளத்தைப் பயன்படுத்தலாமா?**  
A: ஆம், உள்ளே இருக்கும் SQL Server-ஐ குறிப்பிட்டு `infra/main.bicep`-ஐ மாற்றவும் மற்றும் connection string பராமரிப்புகளை புதுப்பிக்கவும்.

---

> **குறிப்பு:** இந்த உதாரணம் AZD-ஐ பயன்படுத்தி ஒரு வலை செயலியை ஒரு தரவுத்தளத்துடன் வெளியிடுவதற்கான சிறந்த நடைமுறைகளை விளக்குகிறது. இது செயற்படும் குறியீடு, விரிவான ஆவணம் மற்றும் கற்றலினை வலுப்படுத்துவதற்கான நடைமுறைப் பயிற்சிகளை உள்ளடக்கியது. உற்பத்தி வெளியீடுகளுக்காக, உங்கள் நிறுவனத்தின் பாதுகாப்பு, அளவீடு, ஒழுங்கு மற்றும் செலவு தேவைகளை மதிப்பாய்வு செய்யவும்.

**📚 பாடநெறி வழிசெலுத்தல்:**
- ← முந்தைய: [Container Apps Example](../../../../examples/container-app)
- → அடுத்தது: [AI ஒருங்கிணைப்பு வழிகாட்டு](../../../../docs/ai-foundry)
- 🏠 [பாடநெறி முகப்பு](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
குறிப்பு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co‑op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியமாக செயல்பட முயன்றாலும், தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமின்மைகள் இருக்கலாம் என்பதை தயவுசெய்து மனதில் கொள்ளவும். ஆவணத்தின் அசல் மொழியில் உள்ள பதிப்பே அதிகாரபூர்வமான மூலமாக கருதப்பட வேண்டும். மிகவும் முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பாளர் மூலம் மொழிபெயர்ப்பு செய்வது பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கோ அல்லது தவறான விளக்கத்திற்கோ நாம் பொறுப்பு ஏற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->