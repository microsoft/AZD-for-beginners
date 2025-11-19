param keyVaultName string
param openAIEndpoint string
@secure()
param openAIKey string

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
    value: openAIKey
  }
}
