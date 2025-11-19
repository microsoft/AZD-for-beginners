targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the environment which is used to generate a short unique hash used in all resources.')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string

@description('SQL Server administrator login')
@secure()
param sqlAdminLogin string = 'sqladmin'

@description('SQL Server administrator password')
@secure()
param sqlAdminPassword string

var abbrs = loadJsonContent('./abbreviations.json')
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = { 'azd-env-name': environmentName }

// Organize resources in a resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${abbrs.resourcesResourceGroups}${environmentName}'
  location: location
  tags: tags
}

// SQL Server
module sqlServer './resources/sql-server.bicep' = {
  name: 'sql-server'
  scope: rg
  params: {
    name: '${abbrs.sqlServers}${resourceToken}'
    location: location
    tags: tags
    administratorLogin: sqlAdminLogin
    administratorLoginPassword: sqlAdminPassword
  }
}

// SQL Database
module sqlDatabase './resources/sql-database.bicep' = {
  name: 'sql-database'
  scope: rg
  params: {
    name: '${abbrs.sqlServersDatabases}${resourceToken}'
    location: location
    tags: tags
    sqlServerName: sqlServer.outputs.name
  }
}

// App Service Plan
module appServicePlan './resources/app-service-plan.bicep' = {
  name: 'app-service-plan'
  scope: rg
  params: {
    name: '${abbrs.webServerFarms}${resourceToken}'
    location: location
    tags: tags
    sku: {
      name: 'B1'
      tier: 'Basic'
      size: 'B1'
      family: 'B'
      capacity: 1
    }
  }
}

// Application Insights
module appInsights './resources/app-insights.bicep' = {
  name: 'app-insights'
  scope: rg
  params: {
    name: '${abbrs.insightsComponents}${resourceToken}'
    location: location
    tags: tags
  }
}

// Web App
module webApp './resources/web-app.bicep' = {
  name: 'web-app'
  scope: rg
  params: {
    name: '${abbrs.webSitesAppService}${resourceToken}'
    location: location
    tags: tags
    appServicePlanId: appServicePlan.outputs.id
    appInsightsConnectionString: appInsights.outputs.connectionString
    sqlConnectionString: 'Server=tcp:${sqlServer.outputs.fullyQualifiedDomainName},1433;Initial Catalog=${sqlDatabase.outputs.name};Persist Security Info=False;User ID=${sqlAdminLogin};Password=${sqlAdminPassword};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;'
  }
}

// Outputs
output AZURE_LOCATION string = location
output AZURE_RESOURCE_GROUP string = rg.name
output WEB_APP_NAME string = webApp.outputs.name
output WEB_APP_URI string = webApp.outputs.uri
output SQL_SERVER_NAME string = sqlServer.outputs.name
output SQL_DATABASE_NAME string = sqlDatabase.outputs.name
output APPLICATIONINSIGHTS_CONNECTION_STRING string = appInsights.outputs.connectionString
