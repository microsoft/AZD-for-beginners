param keyVaultName string
param openAIEndpoint string
param openAIName string

resource openAI 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAIName
}

// Get Key Vault reference
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: keyVaultName
}

// Store OpenAI endpoint
resource openAIEndpointSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-endpoint'
  properties: {
    value: openAIEndpoint
  }
}

// Store OpenAI API key
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAI.listKeys().key1
  }
}
