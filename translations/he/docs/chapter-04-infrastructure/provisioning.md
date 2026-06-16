# פריסת משאבי Azure עם AZD

**ניווט בפרק:**
- **📚 דף הקורס**: [AZD למתחילים](../../README.md)
- **📖 הפרק הנוכחי**: פרק 4 - תשתית כקוד ופריסה
- **⬅️ קודם**: [מדריך פריסה](deployment-guide.md)
- **➡️ הפרק הבא**: [פרק 5: פתרונות AI מרובי סוכנים](../../examples/retail-scenario.md)
- **🔧 קשור**: [פרק 6: אימות לפני פריסה](../chapter-06-pre-deployment/capacity-planning.md)

## מבוא

מדריך מקיף זה מכסה את כל מה שעליך לדעת לגבי פריסת וניהול משאבי Azure באמצעות Azure Developer CLI. למד ליישם תבניות תשתית כקוד (IaC) החל ביצירת משאבים בסיסית ועד לארכיטקטורות תשתית מתקדמות ברמת ארגונים באמצעות Bicep, תבניות ARM, Terraform ו-Pulumi.

## מטרות הלמידה

בסיום מדריך זה, תוכל:
- לשלוט בעקרונות תשתית כקוד ופריסת משאבי Azure
- להבין מגוון ספקי IaC הנתמכים על ידי Azure Developer CLI
- לתכנן וליישם תבניות Bicep לארכיטקטורות יישומים נפוצות
- להגדיר פרמטרים, משתנים והגדרות ייחודיות לסביבה עבור משאבים
- ליישם דפוסי תשתית מתקדמים כולל רשת ואבטחה
- לנהל מחזור חיים של משאבים, עדכונים ופתרון תלותיות

## תוצאות הלמידה

בסיום, תוכל:
- לתכנן ולפרוס תשתית Azure באמצעות תבניות Bicep ו-ARM
- להגדיר ארכיטקטורות מרובת שירותים מורכבות עם תלותיות נכונות בין משאבים
- ליישם תבניות עם פרמטרים לסביבות והגדרות שונות
- לטפל בבעיות פריסת תשתית ולפתור כשלונות בפריסה
- ליישם עקרונות של Azure Well-Architected Framework בעיצוב התשתית
- לנהל עדכוני תשתית וליישם אסטרטגיות גרסאות לתשתית

## סקירת פריסת תשתית

Azure Developer CLI תומך במגוון ספקי תשתית כקוד (IaC):
- **Bicep** (מומלץ) - שפת תחום ספציפית ל-Azure
- **תבניות ARM** - תבניות Azure Resource Manager מבוססות JSON
- **Terraform** - כלי תשתית רב-ענני
- **Pulumi** - תשתית כקוד מודרנית בשפות תכנות

## הבנת משאבי Azure

### היררכיה של משאבים
```
Azure Account
└── Subscriptions
    └── Resource Groups
        └── Resources (App Service, Storage, Database, etc.)
```

### שירותי Azure נפוצים ליישומים
- **חישוב**: App Service, Container Apps, Functions, מכונות וירטואליות
- **אחסון**: חשבון אחסון, Cosmos DB, מסד נתונים SQL, PostgreSQL
- **רשת**: רשת וירטואלית, שער יישומים, CDN
- **אבטחה**: Key Vault, Application Insights, Log Analytics
- **AI/ML**: שירותי Azure AI, Azure OpenAI, Azure Machine Learning

## תבניות תשתית Bicep

### מבנה בסיסי של תבנית Bicep
```bicep
// infra/main.bicep
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

// Resource Group (created automatically by azd)
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: '${applicationName}-${environmentName}-rg'
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
  tags: tags
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'NODE|18-lts'
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
  properties: {
    serverFarmId: planId
    siteConfig: {
      appSettings: appSettings
      linuxFxVersion: 'NODE|18-lts'
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

#### יצירת משאבים מותנית
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

Bicep היא ברירת המחדל של azd, אך azd גם תומך ב-**Terraform**—שימושי אם הצוות שלך כבר משתמש בו או אם אתה מנהל תשתית רב-עננית. תהליך העבודה של azd (`azd up`, `azd provision`, `azd down`) זהה; רק שפת התשתית ומבנה התיקיות משתנים.

### הגדר ל-azd להשתמש ב-Terraform

הוסף סעיף `infra` בקובץ `azure.yaml` שמפנה לספק Terraform:

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

### מבנה תיקיות Terraform

עם ספק Terraform, תיקיית `infra/` שלך משתמשת בקבצי `.tf` במקום Bicep:

```
infra/
├── main.tf            # resource definitions
├── variables.tf       # input variables
├── outputs.tf         # outputs azd reads back (endpoints, names)
├── provider.tf        # azurerm/azurecaf providers + backend
└── main.tfvars.json   # values azd injects per environment
```

### קובץ `main.tf` מינימלי

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

### איך azd מתחבר לפלט של Terraform

azd קורא את **פלטי** Terraform כדי ללמוד את נקודות הקצה ולהחזיר ערכי סביבה ליישום שלך. השמות בפלט חשובים—azd מחפש ספציפיים:

```hcl
# infra/outputs.tf
output "AZURE_LOCATION" {
  value = var.location
}

output "SERVICE_WEB_ENDPOINT_URL" {
  value = azurerm_linux_web_app.web.default_hostname
}
```

> **חשוב:** azd משתמש בתג `azd-env-name` וביציאות `AZURE_*` למעקב משאבים לפי סביבה. תמיד תתג את קבוצת המשאבים שלך עם `"azd-env-name" = var.environment_name` כדי ש-`azd down` יוכל למצוא ולהסיר הכל.

### פריסה עם Terraform

הפקודות זהות לאלו של Bicep:

```bash
azd auth login
azd env new dev
azd provision --preview   # azd מריץ 'terraform plan' מתחת למכסה המנוע
azd up                    # פריסה + פרוש
azd down --force          # הורס את המשאבים המנוהלים על ידי Terraform
```

> **תנאי מוקדם:** יש להתקין את Terraform ולהיות ב-`PATH`. azd מנהל את *זרימת העבודה* של Terraform אך לא מתקין אותו עבורך. למצב, ברירת המחדל היא מצב מקומי; לצוותים יש להגדיר backend מרוחק (למשל Azure Storage) בקובץ `provider.tf`.

למתחילים המבוססים על Terraform ניתן לגלוש ל[גלריית Awesome AZD](https://azure.github.io/awesome-azd/) ולסנן לפי Terraform, או לעיין בתיעוד הרשמי של [azd Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

## 🧩 שימוש ב-Pulumi עם azd

אם הצוות שלך כותב תשתית בשפת תכנות כללית (TypeScript, Python, Go או C#) ולא DSL, azd גם תומך ב-**Pulumi**. כפי ב-Terraform, תהליך העבודה `azd up` / `azd provision` / `azd down` לא משתנה—רק כלי התשתית ומבנה התיקיות שונים.

### הגדר ל-azd להשתמש ב-Pulumi

```yaml
# azure.yaml
name: my-pulumi-app
infra:
  provider: pulumi      # default is "bicep"
  path: infra           # folder containing your Pulumi program
services:
  web:
    project: ./src
    language: js
    host: containerapp
```

### מבנה תיקיות Pulumi

```
infra/
├── Pulumi.yaml          # project definition
├── Pulumi.dev.yaml      # stack config (one per environment)
├── index.ts             # your resource program (or __main__.py, main.go, etc.)
├── package.json         # dependencies (for TypeScript)
└── tsconfig.json
```

### קובץ `index.ts` מינימלי

```typescript
import * as azure from "@pulumi/azure-native";
import * as pulumi from "@pulumi/pulumi";

const environmentName = pulumi.getStack();

// תייג כל משאב כדי ש-azd יוכל לעקוב ולנקות אותם
const tags = { "azd-env-name": environmentName };

const rg = new azure.resources.ResourceGroup("rg", {
  resourceGroupName: `rg-${environmentName}`,
  tags,
});

// azd קורא את הפלטים האלה בחזרה לסביבתך
export const AZURE_LOCATION = rg.location;
export const SERVICE_WEB_ENDPOINT_URL = "https://...";
```

### סטאקים תואמים לסביבות azd

Pulumi מארגן פריסות ל**סטאקים**, ו-azd מפעיל מיפוי בין כל סביבה לסטאק Pulumi בעל שם זהה. בעת הרצת `azd env new staging`, azd בוחר (או יוצר) את סטאק `staging`. אותם כללי תגיות `azd-env-name` ופלטי `AZURE_*` תקפים, כך ש-`azd down` יוכל למצוא ולהסיר הכל.

### פריסה עם Pulumi

```bash
azd auth login
azd env new dev
azd provision --preview   # azd מריץ 'pulumi preview' מתחת למכסה המנוע
azd up                    # פריסה + הטמעה
azd down --force          # מריץ 'pulumi destroy'
```

> **תנאי מוקדם:** יש להתקין את Pulumi ולהיות ב-`PATH`, ותצטרך backend למצב (Pulumi Cloud או backend מנוהל עצמאית כמו Azure Blob Storage). azd מנהל את *זרימת העבודה* של Pulumi, לא את ההתקנה. ראה את התיעוד הרשמי של [azd Pulumi](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-pulumi-for-azd).

## 🎯 בחירת מארח לשירות שלך

שדה `host` ב-`azure.yaml` קובע היכן הקוד שלך יפעל. azd תומך בכמה מארחים—בחירה נכונה חשובה יותר משפת התשתית. הנה השוואה ידידותית למתחילים:

| ערך `host` | מתאים ל- | למה |
|------------|----------|-----|
| `appservice` | אפליקציות ואפיאי ווב מסורתיים | פלטפורמת PaaS הפשוטה ביותר; ללא מכולות נדרשות |
| `staticwebapp` | SPA חזיתיים (React, Vue, Angular) | CDN גלובלי + SSL חינמי, תמיכה ב-API מובנית |
| `function` | עבודות אימפקט ואירועים ללא שרת | סקייל לטווח אפס, תשלום לפי ביצוע |
| `containerapp` | מיקרו-שירותים במכולות | מכולות ללא שרת, סקייל לטווח אפס, כניסה מובנית |
| `aks` | צרכי תזמור מורכבים | שליטה מלאה בקוברנטיס כשאתה באמת צריך |
| `springapp` | אפליקציות Java Spring Boot | סביבת ריצה מנוהלת ל-Azure Spring Apps מותאמת ל-Spring |

### מתי להשתמש ב-AKS

**Azure Kubernetes Service (`host: aks`)** נותן לך את כל כוח הקוברנטיס—בקרים מותאמים אישית, רשת שירותים, רשת מורכבת ותזמון מדויק. הכוח הזה מלווה במורכבות תפעולית: אתה מנהל מאגרי צמתים, שדרוגים ורשת האשכול.

```yaml
services:
  api:
    project: ./src/api
    language: js
    host: aks          # deploys to an existing AKS cluster
```

> **התחל מהפשוט אם אפשר.** ברוב המיקרו-שירותים, **Container Apps** מספק מכולות, אוטוסקייל וסקייל לטווח אפס ללא ניהול אשכול. בחר ב-AKS רק כשאתה צריך תכונות ספציפיות לקוברנטיס.

### מתי להשתמש ב-Azure Spring Apps

**Azure Spring Apps (`host: springapp`)** היא סביבת ריצה מנוהלת המותאמת במיוחד ל-Spring Boot. היא מטפלת בגילוי שירותים, שרת קונפיגורציה, ופריסה בלו-גרין כך שצוותי Java לא יצטרכו לנהל תשתית בעצמם.

```yaml
services:
  catalog:
    project: ./src/catalog
    language: java
    host: springapp
```

> השתמש ב-`springapp` כאשר יש לך אפליקציות Spring Boot קיימות ואתה רוצה סביבת ריצה מותאמת להן. לאפליקציות Java מכולתיות חדשות ללא צרכים ספציפיים ל-Spring, `containerapp` לרוב בחירה פשוטה יותר.

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

## 🔒 אבטחה וניהול סודות

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

### הגדרת Managed Identity
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
          name: 'AZURE_CLIENT_ID'
          value: webApp.identity.principalId
        }
      ]
    }
  }
}
```

## 🌍 רשת וקישוריות

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

### מדדים והתראות מותאמות
```bicep
resource cpuAlert 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: '${applicationName}-cpu-alert'
  location: 'global'
  tags: tags
  properties: {
    description: 'Alert when CPU usage is high'
    severity: 2
    enabled: true
    scopes: [webApp.id]
    evaluationFrequency: 'PT5M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'CPU Usage'
          metricName: 'CpuPercentage'
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

## 🔧 הגדרות סביבתיות ייחודיות

### קבצי פרמטר לסביבות שונות
```json
// infra/main.parameters.dev.json
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

```json
// infra/main.parameters.prod.json
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
  name: '${applicationName}devstorage${resourceToken}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

// Production resources with geo-redundancy
resource prodStorage 'Microsoft.Storage/storageAccounts@2023-01-01' = if (environmentType == 'prod') {
  name: '${applicationName}prodstorage${resourceToken}'
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

### בדיקות תשתית
```bicep
// infra/test/main.test.bicep
param location string = resourceGroup().location

module mainTemplate '../main.bicep' = {
  name: 'main-template-test'
  params: {
    environmentName: 'test'
    location: location
    applicationName: 'testapp'
  }
}

// Test assertions
resource testScript 'Microsoft.Resources/deploymentScripts@2020-10-01' = {
  name: 'test-deployment'
  location: location
  kind: 'AzurePowerShell'
  properties: {
    azPowerShellVersion: '8.0'
    scriptContent: '''
      $webAppName = "${mainTemplate.outputs.WEB_NAME}"
      $response = Invoke-WebRequest -Uri "https://${mainTemplate.outputs.WEB_URL}/health" -UseBasicParsing
      if ($response.StatusCode -ne 200) {
        throw "Health check failed"
      }
      Write-Output "All tests passed!"
    '''
    timeout: 'PT10M'
    cleanupPreference: 'OnSuccess'
    retentionInterval: 'P1D'
  }
}
```

## 🧪 תצוגה מקדימה ואימות תשתית (חדש)

### תצוגה מקדימה של שינויים בתשתית לפני פריסה

פיצ’ר `azd provision --preview` מאפשר לך **לדמות פריסת תשתית** לפני פריסת משאבים בפועל. זה דומה ל-`terraform plan` או ל-`bicep what-if`, ומספק לך **תצוגה יבשית** של השינויים שייעשו לסביבת Azure שלך.

#### 🛠️ מה זה עושה
- **מנתח את תבניות ה-IaC שלך** (Bicep או Terraform)
- **מציג תצוגה מקדימה של שינויים במשאבים**: הוספות, מחיקות, עדכונים
- **לא מיישם שינויים** — מצב קריאה בלבד ובטוח להרצה

#### מקרים לשימוש
```bash
# תצוגה מקדימה של שינויים בתשתית לפני הפריסה
azd provision --preview

# תצוגה מקדימה לסביבת יעד ספציפית
azd provision --preview -e production
```

פקודה זו עוזרת לך:
- **לבדוק את שינויים בתשתית** לפני התקנת משאבים
- **לזהות הטעויות בזמן מוקדם** במחזור הפיתוח
- **לעבוד בשיתוף פעולה בטוח** בסביבות צוות
- **להבטיח פריסות עם הרשאות מינימליות** וללא הפתעות

השימוש יעיל במיוחד כש:
- עובדים עם סביבות מרובות שירותים מורכבות
- עורכים שינויים בתשתית ייצור
- מאמתים שינויים בתבניות לפני אישור משיכה (PR)
- מאמנים חברי צוות חדשים על דפוסי תשתית

### דוגמת פלט תצוגה מקדימה
הפלט המדויק משתנה לפי ספק ומבנה פרויקט, אך התוצאה אמורה לזהות בבירור את השינויים המוצעים לפני שינוי כלשהו.

```bash
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

## 🔄 עדכוני משאבים והגירות

### עדכוני משאבים בטוחים
```bash
# צפה בשינויים בתשתית לפני הכל (מומלץ)
azd provision --preview

# החל שינויים לאחר אישור התצוגה המקדימה
azd provision --confirm-with-no-prompt

# לביצוע חזרה, השתמש ב-Git כדי לבטל שינויים בתשתית:
git revert HEAD  # בטל את הקומיט האחרון של התשתית
azd provision    # החל את מצב התשתית הקודם
```

### הגירות מסד נתונים
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
  }
}
```

## 🎯 פרקטיקות מומלצות

### 1. קונבנציות שמות משאבים
```bicep
var naming = {
  resourceGroup: 'rg-${applicationName}-${environmentName}-${location}'
  appService: '${applicationName}-web-${resourceToken}'
  database: '${applicationName}-db-${resourceToken}'
  storage: '${take(replace(applicationName, '-', ''), 15)}${environmentName}sa${take(resourceToken, 8)}'
  keyVault: '${take(applicationName, 15)}-kv-${take(resourceToken, 8)}'
}
```

### 2. אסטרטגיית תגיות
```bicep
var commonTags = {
  'azd-env-name': environmentName
  'azd-app': applicationName
  'environment': environmentName
  'cost-center': 'engineering'
  'owner': 'platform-team'
  'project': applicationName
  'created-date': utcNow('yyyy-MM-dd')
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

### 4. ארגון פלטים
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

## השלבים הבאים

- [תכנון לפני פריסה](../chapter-06-pre-deployment/capacity-planning.md) - אימות זמינות משאבים
- [בעיות נפוצות](../chapter-07-troubleshooting/common-issues.md) - טיפול בתקלות תשתית
- [מדריך למעקב ותיקון](../chapter-07-troubleshooting/debugging.md) - איתור תקלות בפריסה
- [בחירת SKU](../chapter-06-pre-deployment/sku-selection.md) - בחירה בשכבות שירות מתאימות

## משאבים נוספים

- [תיעוד Azure Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [תבניות Azure Resource Manager](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/)
- [מרכז הארכיטקטורה של Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [מסגרת Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

**ניווט**
- **שיעור קודם**: [מדריך פריסה](deployment-guide.md)
- **שיעור הבא**: [תכנון קיבולת](../chapter-06-pre-deployment/capacity-planning.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**כתב ויתור**:
מסמך זה תורגם באמצעות שירות תרגום אוטומטי [Co-op Translator](https://github.com/Azure/co-op-translator). למרות שאנו שואפים לדיוק, יש לקחת בחשבון שתרגומים אוטומטיים עלולים להכיל שגיאות או אי-דיוקים. יש להחשיב את המסמך המקורי בשפתו הטבעית כמקור הסמכות. למידע קריטי מומלץ להשתמש בתרגום מקצועי על ידי מתרגם אדם. אנו לא אחראים לכל אי-הבנה או פירוש שגוי הנובע מהשימוש בתרגום זה.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->