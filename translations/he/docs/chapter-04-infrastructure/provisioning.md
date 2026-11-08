# פריסת משאבי Azure עם AZD

**ניווט בפרק:**
- **📚 דף הקורס הראשי**: [AZD למתחילים](../../README.md)
- **📖 פרק נוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ קודם**: [מדריך פריסה](deployment-guide.md)
- **➡️ פרק הבא**: [פרק 5: פתרונות AI מרובי-סוכנים](../../examples/retail-scenario.md)
- **🔧 קשור**: [פרק 6: אימות לפני פריסה](../chapter-06-pre-deployment/capacity-planning.md)

## מבוא

מדריך זה עוסק בפריסת וניהול משאבי Azure באמצעות Azure Developer CLI עם ספקי Bicep ו-Terraform המובנים בו.

> נבדק מול `azd 1.37.2` (נובמבר 2026). אלא אם צוין אחרת, דוגמאות Bicep, Terraform והסקריפטים הן **קטעי המחשה**, לא תבנית מלאה. שלבו אותם בפרויקט המספק את הפרמטרים, המודולים, הזהויות, הרשתות וקוד האפליקציה המוזכרים. במהלך הסקירה לא בוצעה פריסת Azure.

## מטרות הלמידה

בסיום המדריך תוכלו:
- לשלוט בעקרונות תשתית כקוד ופריסת משאבי Azure
- להבין ספקי IaC מרובים הנתמכים על ידי Azure Developer CLI
- לעצב וליישם תבניות Bicep לארכיטקטורות אפליקציה נפוצות
- להגדיר פרמטרים, משתנים והגדרות סביבתיות למשאבים
- ליישם דפוסי תשתית מתקדמים כולל רשתות ואבטחה
- לנהל מחזור חיים של משאבים, עדכונים ופתרון תלות

## תוצאות למידה

עם סיום, תוכלו:
- לעצב ולפרוס תשתית Azure באמצעות תבניות Bicep ו-ARM
- להגדיר ארכיטקטורות מרובות שירותים מורכבות עם תלות במשאבים
- ליישם תבניות פרמטריות לסביבות והגדרות שונות
- לפתור בעיות בפריסת התשתית ולפתור כשלים בפריסה
- ליישם עקרונות מסגרת Azure Well-Architected בעיצוב התשתית
- לנהל עדכוני תשתית וליישם אסטרטגיות גרסאות תשתית

## סקירת פריסת תשתית

Azure Developer CLI תומך בספקי תשתית כקוד (IaC) מרובים:
- **Bicep** (מומלץ) - שפת דומיין ספציפית ל-Azure
- **תבניות ARM** - Bicep מתרגם ל-ARM; JSON של ARM גלמי אינו ספק מובנה נפרד `infra.provider`
- **Terraform** - כלי תשתית בין-ענני
- **ספקי הרחבה** - דורשים הרחבת ספק מותקנת בנפרד והגדרתה המתועדת; אין להניח שכל מחרוזת ספק נתמכת

## הבנת משאבי Azure

### היררכיית המשאבים
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### שירותי Azure נפוצים לאפליקציות
- **חשבוניות**: App Service, Container Apps, Functions, מכונות וירטואליות
- **אחסון**: Storage Account, Cosmos DB, SQL Database, PostgreSQL
- **רשתות**: רשת וירטואלית, Application Gateway, CDN
- **אבטחה**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: שירותי AI של Azure, Azure OpenAI, Azure Machine Learning

## תבניות תשתית Bicep

### מבנה תבנית Bicep בסיסית
```bicep
// infra/modules/web.bicep - resource-group-scoped module fragment
targetScope = 'resourceGroup'
@description('The name of the environment')
param environmentName string

@description('The location for all resources')
param location string = resourceGroup().location

@description('The name of the application')
param applicationName string = 'myapp'

// Variables
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
}

// App Service Plan
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: '${applicationName}-${environmentName}-plan'
  location: location
  tags: tags
  sku: {
    name: 'B1'
    capacity: 1
  }
  properties: {
    reserved: true // Linux App Service Plan
  }
}

// Web App
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  tags: union(tags, { 'azd-service-name': 'web' })
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|22-lts'
      alwaysOn: true
      ftpsState: 'Disabled'
      minTlsVersion: '1.2'
      appSettings: [
        {
          name: 'WEBSITES_ENABLE_APP_SERVICE_STORAGE'
          value: 'false'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
    httpsOnly: true
  }
}

// Output values for azd
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output WEB_NAME string = webApp.name
```

עבור פרויקט azd מלא, קראו למודול זה מ`infra/main.bicep` בטווח מנוי שיוצר Resource Group מתויג ומעביר את הטווח. התאם את `environmentName`/`location` ב-`main.parameters.json`. תג `azd-service-name: web` מקשר את המשאב ל-`services.web`; שמות פלט שרירותיים לבדם אינם מגדירים גילוי שירות.

### דפוסי Bicep מתקדמים

#### תשתית מודולרית
```bicep
// infra/modules/app-service.bicep
@description('App Service configuration')
param name string
param location string
param planId string
param appSettings array = []

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: name
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|22-lts'
      alwaysOn: true
    }
    httpsOnly: true
  }
}

output hostname string = webApp.properties.defaultHostName
output principalId string = webApp.identity.principalId
```

```bicep
// infra/main.bicep - Using modules
module webAppModule 'modules/app-service.bicep' = {
  name: 'webApp'
  params: {
    name: '${applicationName}-web-${resourceToken}'
    location: location
    planId: appServicePlan.id
    appSettings: [
      {
        name: 'API_URL'
        value: apiModule.outputs.endpoint
      }
      {
        name: 'DATABASE_URL'
        value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-url)'
      }
    ]
  }
}
```

#### יצירת משאב מותנית
```bicep
@description('Whether to create a database')
param createDatabase bool = true

@description('Database SKU')
param databaseSku string = 'Basic'

resource database 'Microsoft.Sql/servers/databases@2021-11-01' = if (createDatabase) {
  name: '${sqlServer.name}/${applicationName}-db'
  location: location
  sku: {
    name: databaseSku
    tier: databaseSku == 'Basic' ? 'Basic' : 'Standard'
  }
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
  }
}
```

## 🌐 שימוש ב-Terraform עם azd

Bicep הוא ברירת המחדל של azd, אך azd גם תומך ב**Terraform**—יעיל אם הצוות שלך כבר משתמש בו או אם אתה מנהל תשתית בין-עננית. זרימת העבודה של azd (`azd up`, `azd provision`, `azd down`) זהה; רק שפת התשתית ומבנה התיקיות משתנים.

### לומר ל-azd להשתמש ב-Terraform

הוסף חלק `infra` ל-`azure.yaml` שמצביע על ספק Terraform:

```yaml
# azure.yaml
name: my-terraform-app
infra:
  provider: terraform   # default is "bicep"
  path: infra           # folder containing your .tf files
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### מבנה תיקיית Terraform

עם ספק Terraform, תיקיית `infra/` שלך משתמשת בקבצי `.tf` במקום Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### קטע `main.tf`

זה יוצר רק קבוצת משאבים ותוכנית, לא שירות פרוס. עליך גם להצהיר על משתני קלט, ספק `azurerm` תואם, אפליקציית ווב, ומיפוי תג/שם שירות.

```hcl
# infra/main.tf
resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment_name}"
  location = var.location
  tags     = { "azd-env-name" = var.environment_name }
}

resource "azurerm_service_plan" "plan" {
  name                = "plan-${var.environment_name}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "B1"
}
```

### איך azd מתחבר לפלט Terraform שלך

azd קורא **פלטים** של Terraform לערכי סביבה. קטע זה מניח שהגדרת `azurerm_linux_web_app.web`; גילוי שירות עדיין דורש שם משאב תואם או תג `azd-service-name`:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = "https://${azurerm_linux_web_app.web.default_hostname}"
}
```

> **חשוב:** azd משתמש בתג `azd-env-name` ובפלטים של `AZURE_*` למעקב אחרי משאבים לפי סביבה. תמיד תתייג את קבוצת המשאבים שלך עם `"azd-env-name" = var.environment_name` כדי ש-`azd down` יוכל למצוא ולהסיר הכול.

### פריסה עם Terraform

הפקודות זהות לאלה של Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd runs 'terraform plan' under the hood
azd up                    # provision + deploy
azd down --force          # destroys the Terraform-managed resources
```

> **דרישה מוקדמת:** על Terraform להיות מותקן ועל `PATH` שלך. azd מנהל את *זרימת העבודה* של Terraform אך אינו מתקין Terraform עבורך. עבור מצב, ברירת המחדל של azd היא מצב מקומי; עבור צוותים, הגדר backend מרוחק (למשל, backend של אחסון Azure) ב-`provider.tf`.

עבור סטארטרים מבוססי Terraform מלאים וניתנים להרצה, עיין בגלריית [Awesome AZD](https://azure.github.io/awesome-azd/) וסנן עבור Terraform, או עיין בתיעוד הרשמי של [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 כלים נוספים לתשתית

Pulumi אינו ספק פריסה מובנה ב-azd 1.37.2. הגדרת `infra.provider: pulumi` לבדה אינה יוצרת אינטגרציה עובדת, ו-`azd env new` אינו יוצר/בוחר אוטומטית ערמת Pulumi. אם אתה משתמש בכלי IaC אחר, עקוב אחרי תיעוד הרחבת ספק מאומתת או נהל את מחזור החיים במפורש בזרימת העבודה שלך. קורס זה לא מספק או מאמת ספק Pulumi.

## 🎯 בחירת מארח לשירות שלך

השדה `host` ב-`azure.yaml` מחליט היכן הקוד שלך פועל. azd תומך בכמה מארחים—בחירה נכונה חשובה יותר משפת תשתית. הנה השוואה ידידותית למתחילים:

| ערך `host` | הטוב ביותר ל | למה |
|--------------|----------|-----|
| `appservice` | אפליקציות ווב ו-API מסורתיים | שירות PaaS הפשוט ביותר; לא דורש מכולות |
| `staticwebapp` | SPA בקצה-לקוח (React, Vue, Angular) | CDN גלובלי + SSL חינמי, תמיכה מובנית ב-API |
| `function` | עומסים מבוססי אירועים וללא שרת | קנה מידה לאפס, תשלום לפי ביצוע |
| `containerapp` | מיקרו-שירותים במכולות | מכולות ללא שרת, קנה מידה לאפס, כניסה מובנית |
| `aks` | צרכי תזמור מורכבים | שליטה מלאה ב-Kubernetes כשצריך באמת |
| `springapp` | פריסות קיימות ב-Azure Spring Apps | יעד ישן; השירות צפוי להסגר ב-31 במרץ 2028 ונחסם ללקוחות חדשים |

### מתי לבחור AKS

**Azure Kubernetes Service (`host: aks`)** מעניק לך את כל עוצמת Kubernetes—בקרים מותאמים, רשתות שירות, רשתות מורכבות, ותזמון מדויק. הכוח בא עם נטל תפעולי: אתה מנהל קבוצות צמתים, שדרוגים ורשתות אשכול.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **התחל בפשטות אם אפשר.** עבור רוב מיקרו-שירותים, **Container Apps** מספק מכולות, קנה מידה אוטומטי, וקנה מידה לאפס ללא צורך בניהול אשכול. בחר ב-AKS רק כשאתה זקוק לתכונות ספציפיות ל-Kubernetes.

### מתי להשתמש ב-Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** היא ריצה מנוהלת שנבנתה במיוחד עבור Spring Boot. היא מטפלת בגילוי שירות, שרת קונפיגורציה, ופריסה כחול-ירוק כך שצוותי Java לא יצטרכו לנהל תשתית בעצמם.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> אל תבחר Azure Spring Apps לפרויקט מתחיל חדש: הוא סגור ללקוחות חדשים ו[נסגר ב-31 במרץ 2028](https://learn.microsoft.com/azure/spring-apps/basic-standard/retirement-announcement). העדף חלופות נתמכות כמו Container Apps ותכנן מעבר לפריסות קיימות.

## 🗃️ פריסת מסדי נתונים

### Cosmos DB
```bicep
resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: '${applicationName}-cosmos-${resourceToken}'
  location: location
  tags: tags
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
  }
}

resource cosmosDatabase 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases@2023-04-15' = {
  parent: cosmosAccount
  name: '${applicationName}db'
  properties: {
    resource: {
      id: '${applicationName}db'
    }
  }
}

resource todoContainer 'Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers@2023-04-15' = {
  parent: cosmosDatabase
  name: 'todos'
  properties: {
    resource: {
      id: 'todos'
      partitionKey: {
        paths: ['/userId']
        kind: 'Hash'
      }
    }
  }
}
```

### PostgreSQL
**דרישות מוקדמות לקטע:** הצג `@secure() param databasePassword string` והשתמש בערך חזק מסופק. בחר גישה ציבורית **או** שלב את הרשת המתווכת/DNS פרטי מטה; שני הקטעים אינם מתחברים אוטומטית.

```bicep
resource postgresServer 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: '${applicationName}-postgres-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard_B1ms'
    tier: 'Burstable'
  }
  properties: {
    version: '14'
    administratorLogin: 'dbadmin'
    administratorLoginPassword: databasePassword
    storage: {
      storageSizeGB: 32
    }
    backup: {
      backupRetentionDays: 7
      geoRedundantBackup: 'Disabled'
    }
    highAvailability: {
      mode: 'Disabled'
    }
  }
}

resource postgresDatabase 'Microsoft.DBforPostgreSQL/flexibleServers/databases@2022-12-01' = {
  parent: postgresServer
  name: '${applicationName}db'
  properties: {
    charset: 'utf8'
    collation: 'en_US.utf8'
  }
}

// Allow Azure services to connect
resource firewallRule 'Microsoft.DBforPostgreSQL/flexibleServers/firewallRules@2022-12-01' = {
  parent: postgresServer
  name: 'AllowAzureServices'
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}
```

כלל `0.0.0.0` מאפשר חיבורים משירותי Azure מעבר למנוי שלך. זו אינה רשת פרטית; העדף עיצוב רשת מוגבל לעומסי עבודה אמיתיים.

## 🔒 ניהול אבטחה וסודות

### אינטגרציה עם Key Vault
```bicep
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: '${applicationName}-kv-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableRbacAuthorization: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
  }
}

// Grant Key Vault access to the web app
resource webAppKeyVaultAccess 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(keyVault.id, webApp.id, 'Key Vault Secrets User')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      '4633458b-17de-408a-b874-0445c86b69e6' // Key Vault Secrets User
    )
    principalId: webApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}

// Store database connection string in Key Vault
resource databaseConnectionSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'database-connection-string'
  properties: {
    value: 'Server=${postgresServer.properties.fullyQualifiedDomainName};Database=${postgresDatabase.name};Port=5432;User Id=${postgresServer.properties.administratorLogin};Password=${databasePassword};'
  }
}
```

### הגדרת זהות מנוהלת
```bicep
resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: '${applicationName}-web-${resourceToken}'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'DATABASE_CONNECTION_STRING'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
        }
        {
          name: 'NODE_ENV'
          value: 'production'
        }
      ]
    }
  }
}
```

זהות מוקצית מערכת לא תגדיר `AZURE_CLIENT_ID` ל-ID הראשי שלה. זהות מוקצית משתמש משתמשת ב**Client ID**, לא ב-ID אובייקט/ראשי. הפנייה ל-Key Vault גם זקוקה להקצאת תפקיד אובייקט האפליקציה וגישה לרשת.

## 🌍 רשתות וקישוריות

### הגדרת רשת וירטואלית
```bicep
resource vnet 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: '${applicationName}-vnet-${resourceToken}'
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'app-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          serviceEndpoints: [
            {
              service: 'Microsoft.Storage'
            }
            {
              service: 'Microsoft.KeyVault'
            }
          ]
        }
      }
      {
        name: 'db-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'postgres-delegation'
              properties: {
                serviceName: 'Microsoft.DBforPostgreSQL/flexibleServers'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private DNS Zone for PostgreSQL
resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: '${applicationName}.postgres.database.azure.com'
  location: 'global'
  tags: tags
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${applicationName}-dns-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet.id
    }
  }
}
```

### שער יישומים עם SSL
**קטע ארכיטקטורה לא שלם, לא שער ניתן לפרוס:** הוסף `gateway-subnet` ייעודי ל-VNet בתוספת מאגרי Backend, הגדרות HTTP, מאזינים, חוקים עם עדיפויות, ותעודת TLS (או הפניה מורשית ל-Key Vault). פתיחת פורט 443 בלבד אינה מגדירה HTTPS.

```bicep
resource publicIP 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: '${applicationName}-agw-pip-${resourceToken}'
  location: location
  tags: tags
  sku: {
    name: 'Standard'
    tier: 'Regional'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: '${applicationName}-agw-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: '${vnet.id}/subnets/gateway-subnet'
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port80'
        properties: {
          port: 80
        }
      }
      {
        name: 'port443'
        properties: {
          port: 443
        }
      }
    ]
  }
}
```

## 📊 ניטור ותצפית

### Application Insights
```bicep
resource logAnalytics 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${applicationName}-logs-${resourceToken}'
  location: location
  tags: tags
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: '${applicationName}-ai-${resourceToken}'
  location: location
  tags: tags
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalytics.id
  }
}

// Output connection string for applications
output APPLICATION_INSIGHTS_CONNECTION_STRING string = applicationInsights.properties.ConnectionString
```

### מדדים והתראות מותאמות אישית
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [appServicePlan.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
          metricNamespace: 'Microsoft.Web/serverfarms'
          operator: 'GreaterThan'
          threshold: 80
          timeAggregation: 'Average'
        }
      ]
    }
    actions: [
      {
        actionGroupId: actionGroup.id
      }
    ]
  }
}
```

## 🔧 הגדרות ספציפיות לסביבה

### קבצי פרמטרים לסביבות שונות
שני הקבצים למטה הם **דוגמאות חלופיות לקובצי פרמטרים**. azd אינו בוחר אוטומטית `main.parameters.dev.json` או `main.parameters.prod.json` לפי שם הסביבה. השתמש ב-`main.parameters.json` ממש עם החלפות סביבה (למשל `${APP_SERVICE_SKU=B1}`), והצהר/צרוך כל פרמטר ב-Bicep.

דוגמת תוכן ל-`infra/main.parameters.dev.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "B1"
    },
    "databaseSku": {
      "value": "Standard_B1ms"
    },
    "enableBackup": {
      "value": false
    }
  }
}
```

דוגמת תוכן ל-`infra/main.parameters.prod.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSku": {
      "value": "P1v3"
    },
    "databaseSku": {
      "value": "Standard_D2s_v3"
    },
    "enableBackup": {
      "value": true
    },
    "replicaCount": {
      "value": 3
    }
  }
}
```

### פריסת משאבים מותנית
```bicep
@description('Environment type (dev, staging, prod)')
@allowed(['dev', 'staging', 'prod'])
param environmentType string = 'dev'

// Development resources
resource devStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'dev') {
  name: 'stdev${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: 'stprod${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
  }
}
```

## 🚀 דפוסי פריסה מתקדמים

### פריסה מרובת אזורים
```bicep
@description('Primary region')
param primaryLocation string = 'eastus2'

@description('Secondary region')
param secondaryLocation string = 'westus2'

// Primary region resources
module primaryRegion 'modules/region.bicep' = {
  name: 'primary-region'
  params: {
    location: primaryLocation
    isPrimary: true
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Secondary region resources
module secondaryRegion 'modules/region.bicep' = {
  name: 'secondary-region'
  params: {
    location: secondaryLocation
    isPrimary: false
    applicationName: applicationName
    environmentName: environmentName
  }
}

// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficmanagerprofiles@2022-04-01' = {
  name: '${applicationName}-tm-${resourceToken}'
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: '${applicationName}-${environmentName}'
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryRegion.outputs.webAppId
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryRegion.outputs.webAppId
          priority: 2
        }
      }
    ]
  }
}
```

### בדיקת תשתית
```bash
# Local compilation checks syntax/types; this does not provision infrastructure
az bicep build --file infra/main.bicep --stdout

# After deploying your own complete app, test an actual application route
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error "$WEB_URL"
```

פריסת תשתית אינה מפעילה את קוד האפליקציה שלך. הפעל בדיקות אפליקציה רק לאחר `azd deploy`/`azd up`, והשתמש ב-`/health` רק אם האפליקציה שלך מיישמת אותו. סקריפטים לפריסת ARM יוצרים משאבי Azure וזקוקים לזהויות נוספות, גרסאות ריצה נתמכות והרשאות; אינם בדיקות יחידה מקומיות.

## 🧪 תצוגה מוקדמת ואימות תשתית (חדש)

### הצגת שינויים בתשתית לפני פריסה

תכונת `azd provision --preview` מאפשרת לך **לסמלץ פריסת תשתית** לפני שפריסת משאבים מתבצעת בפועל. היא דומה ברוחה ל-`terraform plan` או `bicep what-if`, ומציעה **תצוגת ריצה יבשה** של מה השינויים שייכנסו לסביבת Azure שלך.

#### 🛠️ מה היא עושה
- **מנתחת את תבניות IaC שלך** (Bicep או Terraform)
- **מציגה תצוגה מוקדמת של שינויים במשאבים**: תוספות, מחיקות, עדכונים
- **אינה מיישמת את השינויים המוצעים בתשתית של הספק** — בדוק תחילה את ווית הפרויקט; לסקריפטים עשויים להיות השפעות צדדיות ותצוגה מוקדמת עדיין דורשת הרשאות Azure

#### מקרי שימוש
```bash
# Preview infrastructure changes before deployment
azd provision --preview

# Preview for specific environment
azd provision --preview -e production
```

פקודה זו עוזרת לך:
- **לאמת שינויים בתשתית** לפני המחויבות למשאבים
- **לזהות תצורות שגויות מוקדם** במחזור הפיתוח
- **לעבוד בשיתוף בטוח** בסביבות צוות
- **להבטיח פריסות עם מינימום הרשאות** ללא הפתעות

שימושית במיוחד כאשר:
- עובדים עם סביבות שירות מרובות מורכבות
- מבצעים שינויים בתשתית הפקה
- מאמתים שינויים בתבנית לפני אישור PR
- מאמנים חברי צוות חדשים על דפוסי תשתית

### דוגמת פלט תצוגה מוקדמת
פלט תצוגה מוקדמת משתנה לפי ספק ומבנה פרויקט, אך התוצאה אמורה לזהות בבירור שינויים מוצעים לפני יישומם.

```text
$ azd provision --preview

🔍 Previewing infrastructure changes...

The following resources will be created:
  + azurerm_resource_group.rg
  + azurerm_app_service_plan.plan
  + azurerm_linux_web_app.web
  + azurerm_cosmosdb_account.cosmos

The following resources will be modified:
  ~ azurerm_key_vault.kv
    ~ access_policy (forces replacement)

The following resources will be destroyed:
  - azurerm_storage_account.old_storage

⚠️  Warning: 1 resource will be replaced

✅ Preview completed successfully!
```

## �🔄 עדכוני ומעברי משאבים

### עדכוני משאבים בטוחים
```bash
# Preview infrastructure changes first (RECOMMENDED)
azd provision --preview

# Apply changes after preview confirmation
azd provision
# In automation, --no-prompt uses known values and fails on unresolved decisions;
# it is not an approval bypass.

# For rollback, use Git to revert infrastructure changes:
git revert HEAD  # Revert last infrastructure commit
azd provision    # Apply previous infrastructure state
```

### מעברי מסד נתונים
**דפוס סקריפט פריסה לא שלם:** דורש זהות מוקצית משתמש מוּגדֶרֶת היכן שצריך, סביבת CLI נתמכת, כלי מעבר זמינים, ספריית מעבר/הגדרה שסופקה וקישוריות מסד נתונים. אינו ניתן לביצוע רק בהדבקת משאב זה בתבנית.

```bicep
resource migrationScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'database-migration'
  location: location
  kind: 'AzureCLI'
  properties: {
    azCliVersion: '2.40.0'
    scriptContent: '''
      # Install database migration tools
      npm install -g db-migrate db-migrate-pg
      
      # Run migrations
      db-migrate up --config database.json --env production
      
      echo "Database migration completed successfully"
    '''
    environmentVariables: [
      {
        name: 'DATABASE_URL'
        secureValue: databaseConnectionString
      }
    ]
    timeout: 'PT30M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🎯 שיטות עבודה מומלצות

### 1. קונבנציות שמות למשאבים
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: 'st${resourceToken}' // lowercase alphanumeric, <=24 characters
  keyVault: 'kv-${resourceToken}' // <=24 characters
}
```

### 2. אסטרטגיית תיוג
```bicep
// utcNow is only allowed in a parameter default, not directly in a variable.
param deploymentDate string = utcNow('yyyy-MM-dd')

var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'deployment-date': deploymentDate
}
```

### 3. אימות פרמטרים
```bicep
@description('Environment name')
@minLength(3)
@maxLength(20)
param environmentName string

@description('Location for resources')
@allowed(['eastus2', 'westus2', 'centralus'])
param location string

@description('App Service SKU')
@allowed(['B1', 'B2', 'S1', 'S2', 'P1v3', 'P2v3'])
param appServiceSku string = 'B1'
```

### 4. ארגון פלט
```bicep
// Service endpoints
output WEB_URL string = 'https://${webApp.properties.defaultHostName}'
output API_URL string = 'https://${apiApp.properties.defaultHostName}'

// Resource identifiers
output WEB_APP_NAME string = webApp.name
output API_APP_NAME string = apiApp.name
output DATABASE_NAME string = database.name

// Connection strings (for secure reference)
output DATABASE_CONNECTION_STRING_KEY string = '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=database-connection-string)'
```

## הצעדים הבאים

- [תכנון לפני פריסה](../chapter-06-pre-deployment/capacity-planning.md) - אימות זמינות משאבים
- [בעיות נפוצות](../chapter-07-troubleshooting/common-issues.md) - פתרון בעיות תשתית
- [מדריך ניפוי שגיאות](../chapter-07-troubleshooting/debugging.md) - פתרון בעיות פרוביז׳נינג
- [בחירת SKU](../chapter-06-pre-deployment/sku-selection.md) - בחר שכבות שירות מתאימות

## משאבים נוספים

- [תיעוד Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [תבניות Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מסגרת Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ניווט**
- **השיעור הקודם**: [מדריך לפריסה](deployment-guide.md)
- **השיעור הבא**: [תכנון קיבולת](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->