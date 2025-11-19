targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the environment')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string

@description('Id of the service principal to use for deployment')
param principalId string = ''

// Generate unique resource names
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = { 'azd-env-name': environmentName }

// Create resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

// Deploy container apps infrastructure
module containerApps './app/container-apps.bicep' = {
  name: 'container-apps'
  scope: rg
  params: {
    location: location
    environmentName: environmentName
    resourceToken: resourceToken
    tags: tags
  }
}

// Deploy Flask API
module api './app/api.bicep' = {
  name: 'api'
  scope: rg
  params: {
    location: location
    environmentName: environmentName
    containerAppsEnvironmentId: containerApps.outputs.containerAppsEnvironmentId
    containerRegistryName: containerApps.outputs.containerRegistryName
    logAnalyticsWorkspaceId: containerApps.outputs.logAnalyticsWorkspaceId
    tags: tags
  }
}

// Outputs
output AZURE_LOCATION string = location
output AZURE_CONTAINER_REGISTRY_ENDPOINT string = containerApps.outputs.containerRegistryEndpoint
output AZURE_CONTAINER_REGISTRY_NAME string = containerApps.outputs.containerRegistryName
output API_ENDPOINT string = api.outputs.apiEndpoint
output API_NAME string = api.outputs.apiName
