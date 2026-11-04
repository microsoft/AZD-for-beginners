targetScope = 'subscription'

@minLength(1)
@maxLength(64)
@description('Name of the environment')
param environmentName string

@minLength(1)
@description('Primary location for all resources')
param location string

@description('OpenAI model deployment name')
param openAIModelName string = 'gpt-4.1'

@description('OpenAI model version')
param openAIModelVersion string = '2025-04-14'

@description('OpenAI deployment capacity units; quota mapping depends on model and SKU')
param openAICapacity int = 20

@description('Id of the user or app to assign application roles')
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

// Deploy Key Vault for secure storage
module keyVault './resources/keyvault.bicep' = {
  name: 'keyvault'
  scope: rg
  params: {
    location: location
    resourceToken: resourceToken
    principalId: principalId
    tags: tags
  }
}

// Deploy Azure OpenAI
module openAI './resources/openai.bicep' = {
  name: 'openai'
  scope: rg
  params: {
    location: location
    environmentName: environmentName
    resourceToken: resourceToken
    modelName: openAIModelName
    modelVersion: openAIModelVersion
    capacity: openAICapacity
    tags: tags
  }
}

// Store OpenAI secrets in Key Vault
module secrets './resources/secrets.bicep' = {
  name: 'secrets'
  scope: rg
  params: {
    keyVaultName: keyVault.outputs.keyVaultName
    openAIEndpoint: openAI.outputs.openAIEndpoint
    openAIName: openAI.outputs.openAIName
  }
}

// Outputs for azd
output AZURE_LOCATION string = location
output AZURE_RESOURCE_GROUP string = rg.name
output AZURE_OPENAI_ENDPOINT string = openAI.outputs.openAIEndpoint
output AZURE_OPENAI_NAME string = openAI.outputs.openAIName
output AZURE_OPENAI_MODEL string = openAIModelName
output AZURE_OPENAI_RESOURCE_ID string = openAI.outputs.openAIResourceId
output AZURE_KEY_VAULT_NAME string = keyVault.outputs.keyVaultName
output AZURE_KEY_VAULT_ENDPOINT string = keyVault.outputs.keyVaultEndpoint
