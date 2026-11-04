targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the environment')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string
param apiGatewayImage string = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'
param productServiceImage string = 'mcr.microsoft.com/azuredocs/containerapps-helloworld:latest'

var abbrs = loadJsonContent('./abbreviations.json')
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
var tags = { 'azd-env-name': environmentName }

// Resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: '${abbrs.resourcesResourceGroups}${environmentName}'
  location: location
  tags: tags
}

// Container Apps Environment
module containerAppsEnvironment './core/container-apps-environment.bicep' = {
  name: 'container-apps-environment'
  scope: rg
  params: {
    name: '${abbrs.appManagedEnvironments}${resourceToken}'
    location: location
    tags: tags
    logAnalyticsWorkspaceName: monitoring.outputs.logAnalyticsWorkspaceName
  }
}

// Monitoring
module monitoring './core/monitor.bicep' = {
  name: 'monitoring'
  scope: rg
  params: {
    location: location
    tags: tags
    logAnalyticsName: '${abbrs.operationalInsightsWorkspaces}${resourceToken}'
    applicationInsightsName: '${abbrs.insightsComponents}${resourceToken}'
  }
}

// Product Service (Internal)
module productService './app/product-service.bicep' = {
  name: 'product-service'
  scope: rg
  params: {
    name: '${abbrs.appContainerApps}product-${resourceToken}'
    location: location
    tags: union(tags, { 'azd-service-name': 'product-service' })
    containerAppsEnvironmentName: containerAppsEnvironment.outputs.name
    containerRegistryName: containerAppsEnvironment.outputs.containerRegistryName
    imageName: 'product-service'
    applicationInsightsName: monitoring.outputs.applicationInsightsName
    external: false  // Internal only
    containerImage: productServiceImage
  }
}

// API Gateway (Public-facing)
module apiGateway './app/api-gateway.bicep' = {
  name: 'api-gateway'
  scope: rg
  params: {
    name: '${abbrs.appContainerApps}gateway-${resourceToken}'
    location: location
    tags: union(tags, { 'azd-service-name': 'api-gateway' })
    containerAppsEnvironmentName: containerAppsEnvironment.outputs.name
    containerRegistryName: containerAppsEnvironment.outputs.containerRegistryName
    imageName: 'api-gateway'
    applicationInsightsName: monitoring.outputs.applicationInsightsName
    productServiceUrl: productService.outputs.fqdn
    external: true  // Public endpoint
    containerImage: apiGatewayImage
  }
}

// Outputs
output AZURE_LOCATION string = location
output AZURE_RESOURCE_GROUP string = rg.name
output AZURE_CONTAINER_ENVIRONMENT_NAME string = containerAppsEnvironment.outputs.name
output AZURE_CONTAINER_REGISTRY_NAME string = containerAppsEnvironment.outputs.containerRegistryName
output AZURE_CONTAINER_REGISTRY_ENDPOINT string = containerAppsEnvironment.outputs.containerRegistryLoginServer
output API_GATEWAY_NAME string = apiGateway.outputs.name
output PRODUCT_SERVICE_NAME string = productService.outputs.name
output PRODUCT_SERVICE_HOST string = productService.outputs.fqdn
output APPLICATIONINSIGHTS_NAME string = monitoring.outputs.applicationInsightsName
output API_GATEWAY_URL string = apiGateway.outputs.uri
output PRODUCT_SERVICE_URL string = 'https://${productService.outputs.fqdn}'
output APPLICATIONINSIGHTS_CONNECTION_STRING string = monitoring.outputs.applicationInsightsConnectionString
