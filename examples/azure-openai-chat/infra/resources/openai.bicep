param location string
param environmentName string
param resourceToken string
param modelName string
param modelVersion string
param capacity int
param tags object

// Azure OpenAI Service
resource openAI 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'openai-${environmentName}-${resourceToken}'
  location: location
  tags: tags
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: 'openai-${environmentName}-${resourceToken}'
    publicNetworkAccess: 'Enabled'
    networkAcls: {
      defaultAction: 'Allow'
    }
  }
}

// Deploy GPT-4 model
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAI
  name: modelName
  sku: {
    name: 'Standard'
    capacity: capacity
  }
  properties: {
    model: {
      format: 'OpenAI'
      name: modelName
      version: modelVersion
    }
    versionUpgradeOption: 'OnceNewDefaultVersionAvailable'
    raiPolicyName: 'Microsoft.Default'
  }
}

// Outputs
output openAIEndpoint string = openAI.properties.endpoint
output openAIName string = openAI.name
output openAIKey string = openAI.listKeys().key1
output openAIResourceId string = openAI.id
