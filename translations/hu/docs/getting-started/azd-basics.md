<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c9095103b04dc9504096cf2814d0e634",
  "translation_date": "2025-09-10T06:11:44+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "hu"
}
-->
# AZD Alapok - Az Azure Developer CLI megértése

## Bevezetés

Ez a lecke bemutatja az Azure Developer CLI-t (azd), egy hatékony parancssori eszközt, amely felgyorsítja az utat a helyi fejlesztéstől az Azure-ba történő telepítésig. Megismerheted az alapvető fogalmakat, a főbb funkciókat, és megértheted, hogyan egyszerűsíti az azd a felhőalapú alkalmazások telepítését.

## Tanulási célok

A lecke végére:
- Megérted, mi az Azure Developer CLI és mi a fő célja
- Megtanulod a sablonok, környezetek és szolgáltatások alapfogalmait
- Felfedezed a kulcsfontosságú funkciókat, mint például a sablonvezérelt fejlesztés és az infrastruktúra kódként való kezelése
- Megérted az azd projektstruktúráját és munkafolyamatát
- Felkészülsz az azd telepítésére és konfigurálására a fejlesztési környezetedben

## Tanulási eredmények

A lecke elvégzése után képes leszel:
- Elmagyarázni az azd szerepét a modern felhőfejlesztési munkafolyamatokban
- Azonosítani az azd projektstruktúra elemeit
- Leírni, hogyan működnek együtt a sablonok, környezetek és szolgáltatások
- Megérteni az infrastruktúra kódként való kezelésének előnyeit az azd segítségével
- Felismerni az azd különböző parancsait és azok célját

## Mi az Azure Developer CLI (azd)?

Az Azure Developer CLI (azd) egy parancssori eszköz, amelyet arra terveztek, hogy felgyorsítsa az utat a helyi fejlesztéstől az Azure-ba történő telepítésig. Egyszerűsíti a felhőalapú alkalmazások építésének, telepítésének és kezelésének folyamatát az Azure-on.

## Alapfogalmak

### Sablonok
A sablonok az azd alapját képezik. Ezek tartalmazzák:
- **Alkalmazáskód** - A forráskódod és függőségeid
- **Infrastruktúra-definíciók** - Azure erőforrások Bicep vagy Terraform segítségével definiálva
- **Konfigurációs fájlok** - Beállítások és környezeti változók
- **Telepítési szkriptek** - Automatizált telepítési munkafolyamatok

### Környezetek
A környezetek különböző telepítési célokat képviselnek:
- **Fejlesztés** - Tesztelésre és fejlesztésre
- **Staging** - Előzetes termelési környezet
- **Termelés** - Éles termelési környezet

Minden környezet saját:
- Azure erőforráscsoportot
- Konfigurációs beállításokat
- Telepítési állapotot tart fenn

### Szolgáltatások
A szolgáltatások az alkalmazásod építőelemei:
- **Frontend** - Webalkalmazások, SPÁ-k
- **Backend** - API-k, mikroszolgáltatások
- **Adatbázis** - Adattárolási megoldások
- **Tárolás** - Fájl- és blobtárolás

## Főbb funkciók

### 1. Sablonvezérelt fejlesztés
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastruktúra kódként
- **Bicep** - Az Azure domain-specifikus nyelve
- **Terraform** - Többfelhős infrastruktúra eszköz
- **ARM sablonok** - Azure Resource Manager sablonok

### 3. Integrált munkafolyamatok
```bash
# Complete deployment workflow
azd up            # Provision + Deploy
azd provision     # Create Azure resources
azd deploy        # Deploy application code
azd down          # Clean up resources
```

### 4. Környezetkezelés
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Projektstruktúra

Egy tipikus azd projektstruktúra:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Konfigurációs fájlok

### azure.yaml
A fő projektkonfigurációs fájl:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Környezet-specifikus konfiguráció:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Gyakori munkafolyamatok

### Új projekt indítása
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Fejlesztési ciklus
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge
```

### Több környezet kezelése
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Navigációs parancsok

### Felfedezés
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Projektkezelés
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Felügyelet
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Legjobb gyakorlatok

### 1. Használj értelmes neveket
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Használd ki a sablonokat
- Kezdd meglévő sablonokkal
- Testreszabás az igényeid szerint
- Hozz létre újrafelhasználható sablonokat a szervezeted számára

### 3. Környezetek elkülönítése
- Használj külön környezeteket fejlesztéshez/staginghez/termeléshez
- Soha ne telepíts közvetlenül termelésbe helyi gépről
- Használj CI/CD csatornákat a termelési telepítésekhez

### 4. Konfigurációkezelés
- Használj környezeti változókat érzékeny adatokhoz
- Tartsd a konfigurációt verziókezelésben
- Dokumentáld a környezet-specifikus beállításokat

## Tanulási haladás

### Kezdő (1-2. hét)
1. Telepítsd az azd-t és hitelesítsd
2. Telepíts egy egyszerű sablont
3. Értsd meg a projektstruktúrát
4. Tanuld meg az alapvető parancsokat (up, down, deploy)

### Középhaladó (3-4. hét)
1. Testreszabás sablonokkal
2. Több környezet kezelése
3. Értsd meg az infrastruktúra kódját
4. Állítsd be a CI/CD csatornákat

### Haladó (5+ hét)
1. Hozz létre egyedi sablonokat
2. Haladó infrastruktúra minták
3. Több régiós telepítések
4. Vállalati szintű konfigurációk

## Következő lépések

- [Telepítés és beállítás](installation.md) - Az azd telepítése és konfigurálása
- [Az első projekted](first-project.md) - Gyakorlati útmutató
- [Konfigurációs útmutató](configuration.md) - Haladó konfigurációs lehetőségek

## További források

- [Azure Developer CLI áttekintés](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Sablongaléria](https://azure.github.io/awesome-azd/)
- [Közösségi minták](https://github.com/Azure-Samples)

---

**Navigáció**
- **Előző lecke**: [README](../../README.md)
- **Következő lecke**: [Telepítés és beállítás](installation.md)

---

**Felelősségkizárás**:  
Ez a dokumentum az [Co-op Translator](https://github.com/Azure/co-op-translator) AI fordítási szolgáltatás segítségével készült. Bár törekszünk a pontosságra, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az eredeti nyelvén tekintendő hiteles forrásnak. Kritikus információk esetén javasolt a professzionális, emberi fordítás igénybevétele. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy téves értelmezésekért.