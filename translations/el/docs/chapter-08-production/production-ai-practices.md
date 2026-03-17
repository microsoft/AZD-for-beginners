# Καλύτερες Πρακτικές για Παραγωγικά Φορτία Εργασίας Τεχνητής Νοημοσύνης με AZD

**Chapter Navigation:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Chapter 8 - Production & Enterprise Patterns
- **⬅️ Προηγούμενο Κεφάλαιο**: [Chapter 7: Troubleshooting](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Επίσης Σχετικό**: [AI Workshop Lab](ai-workshop-lab.md)
- **🎯 Ολοκλήρωση Μαθήματος**: [AZD For Beginners](../../README.md)

## Επισκόπηση

Αυτός ο οδηγός παρέχει ολοκληρωμένες βέλτιστες πρακτικές για την ανάπτυξη παραγωγικών φορτίων εργασίας τεχνητής νοημοσύνης χρησιμοποιώντας το Azure Developer CLI (AZD). Βασισμένες σε σχόλια από την κοινότητα Microsoft Foundry Discord και σε πραγματικές υλοποιήσεις πελατών, αυτές οι πρακτικές αντιμετωπίζουν τις πιο κοινές προκλήσεις σε παραγωγικά συστήματα AI.

## Κύριες Προκλήσεις που Αντιμετωπίζονται

Βάσει των αποτελεσμάτων της δημοσκόπησής μας στην κοινότητα, αυτές είναι οι κορυφαίες προκλήσεις που αντιμετωπίζουν οι προγραμματιστές:

- **45%** δυσκολεύονται με αναπτύξεις πολλών υπηρεσιών AI
- **38%** έχουν θέματα με διαχείριση διαπιστευτηρίων και μυστικών  
- **35%** βρίσκουν τη δημιοτικοποίηση για παραγωγή και την κλιμάκωση δύσκολη
- **32%** χρειάζονται καλύτερες στρατηγικές βελτιστοποίησης κόστους
- **29%** απαιτούν βελτιωμένη παρακολούθηση και αποσφαλμάτωση

## Σχήματα Αρχιτεκτονικής για Παραγωγικό AI

### Σχήμα 1: Αρχιτεκτονική Μικροϋπηρεσιών για AI

**Πότε να χρησιμοποιηθεί**: Πολύπλοκες εφαρμογές AI με πολλαπλές δυνατότητες

```mermaid
graph TD
    Frontend[Διεπαφή Ιστού] --- Gateway[Πύλη API] --- LB[Ισορροπιστής Φόρτου]
    Gateway --> Chat[Υπηρεσία Συνομιλίας]
    Gateway --> Image[Υπηρεσία Εικόνων]
    Gateway --> Text[Υπηρεσία Κειμένου]
    Chat --> OpenAI[Μοντέλα Microsoft Foundry]
    Image --> Vision[Υπολογιστική Όραση]
    Text --> DocIntel[Νοημοσύνη Εγγράφων]
```
**Υλοποίηση με AZD**:

```yaml
# azure.yaml
name: enterprise-ai-platform
services:
  web:
    project: ./web
    host: staticwebapp
  api-gateway:
    project: ./api-gateway
    host: containerapp
  chat-service:
    project: ./services/chat
    host: containerapp
  vision-service:
    project: ./services/vision
    host: containerapp
  text-service:
    project: ./services/text
    host: containerapp
```

### Σχήμα 2: Επεξεργασία AI με Event-Driven

**Πότε να χρησιμοποιηθεί**: Επεξεργασία παρτίδων, ανάλυση εγγράφων, ασύγχρονα workflows

```bicep
// Event Hub for AI processing pipeline
resource eventHub 'Microsoft.EventHub/namespaces@2023-01-01-preview' = {
  name: eventHubNamespaceName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
    capacity: 1
  }
}

// Service Bus for reliable message processing
resource serviceBus 'Microsoft.ServiceBus/namespaces@2022-10-01-preview' = {
  name: serviceBusNamespaceName
  location: location
  sku: {
    name: 'Premium'
    tier: 'Premium'
    capacity: 1
  }
}

// Function App for processing
resource functionApp 'Microsoft.Web/sites@2023-01-01' = {
  name: functionAppName
  location: location
  kind: 'functionapp,linux'
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'AZURE_OPENAI_ENDPOINT'
          value: '@Microsoft.KeyVault(VaultName=${keyVault.name};SecretName=openai-endpoint)'
        }
      ]
    }
  }
}
```

## Σκέψεις για την Υγεία των Πρακτόρων AI

Όταν μια παραδοσιακή web εφαρμογή χαλάει, τα συμπτώματα είναι γνωστά: μια σελίδα δεν φορτώνει, ένα API επιστρέφει σφάλμα ή μια ανάπτυξη αποτυγχάνει. Οι εφαρμογές με τεχνητή νοημοσύνη μπορούν να χαλάσουν με όλους αυτούς τους ίδιους τρόπους—αλλά μπορούν επίσης να συμπεριφέρονται εσφαλμένα με πιο υποτονικούς τρόπους που δεν παράγουν προφανή μηνύματα σφάλματος.

Αυτό το τμήμα σας βοηθά να χτίσετε ένα νοητικό μοντέλο για την παρακολούθηση φορτίων εργασίας AI ώστε να ξέρετε πού να κοιτάξετε όταν τα πράγματα δεν φαίνονται σωστά.

### Πώς Διαφέρει η Υγεία Πράκτορα από την Παραδοσιακή Υγεία Εφαρμογής

Μια παραδοσιακή εφαρμογή είτε λειτουργεί είτε όχι. Ένας πράκτορας AI μπορεί να φαίνεται ότι λειτουργεί αλλά να παράγει φτωχά αποτελέσματα. Σκεφτείτε την υγεία του πράκτορα σε δύο στρώματα:

| Layer | What to Watch | Where to Look |
|-------|--------------|---------------|
| **Infrastructure health** | Is the service running? Are resources provisioned? Are endpoints reachable? | `azd monitor`, Azure Portal resource health, container/app logs |
| **Behavior health** | Is the agent responding accurately? Are responses timely? Is the model being called correctly? | Application Insights traces, model call latency metrics, response quality logs |

Η υγεία της υποδομής είναι οικεία—είναι η ίδια για κάθε azd εφαρμογή. Η υγεία της συμπεριφοράς είναι το νέο στρώμα που εισάγουν τα φορτία εργασίας AI.

### Πού να Κοιτάξετε Όταν οι Εφαρμογές AI Δεν Συμπεριφέρονται Αναμενόμενα

Αν η εφαρμογή AI σας δεν παράγει τα αποτελέσματα που περιμένετε, εδώ είναι μια εννοιολογική λίστα ελέγχου:

1. **Ξεκινήστε από τα βασικά.** Η εφαρμογή τρέχει; Μπορεί να φτάσει τις εξαρτήσεις της; Ελέγξτε `azd monitor` και την κατάσταση των πόρων όπως θα κάνατε για οποιαδήποτε εφαρμογή.
2. **Ελέγξτε τη σύνδεση με το μοντέλο.** Καλεί επιτυχώς η εφαρμογή το μοντέλο AI; Αποτυχημένες ή χρονικά εξαντλημένες κλήσεις στο μοντέλο είναι η πιο κοινή αιτία προβλημάτων σε εφαρμογές AI και θα εμφανιστούν στα logs της εφαρμογής σας.
3. **Δείτε τι έλαβε το μοντέλο.** Οι απαντήσεις του AI εξαρτώνται από την είσοδο (το prompt και οποιοδήποτε ανακτημένο context). Αν το αποτέλεσμα είναι λάθος, συνήθως η είσοδος είναι λάθος. Ελέγξτε αν η εφαρμογή σας στέλνει τα σωστά δεδομένα στο μοντέλο.
4. **Επανεξετάστε την καθυστέρηση απόκρισης.** Οι κλήσεις σε μοντέλα AI είναι πιο αργές από τις τυπικές κλήσεις API. Αν η εφαρμογή σας φαίνεται αργή, ελέγξτε αν ο χρόνος απόκρισης των μοντέλων έχει αυξηθεί—αυτό μπορεί να υποδεικνύει throttling, όρια χωρητικότητας ή συμφόρηση σε επίπεδο περιοχής.
5. **Παρακολουθήστε ενδείξεις κόστους.** Απροσδόκητες αιχμές στη χρήση tokens ή στις κλήσεις API μπορεί να υποδεικνύουν βρόχο, εσφαλμένη διαμόρφωση prompt ή υπερβολικές επαναλήψεις.

Δεν χρειάζεται να κυριαρχήσετε άμεσα τα εργαλεία παρατηρησιμότητας. Το κεντρικό συμπέρασμα είναι ότι οι εφαρμογές AI έχουν ένα επιπλέον στρώμα συμπεριφοράς προς παρακολούθηση, και το ενσωματωμένο monitoring του azd (`azd monitor`) σας δίνει ένα σημείο εκκίνησης για την έρευνα και των δύο στρωμάτων.

---

## Βέλτιστες Πρακτικές Ασφαλείας

### 1. Μοντέλο Ασφάλειας Zero-Trust

**Στρατηγική Υλοποίησης**:
- Καμία επικοινωνία υπηρεσίας-προς-υπηρεσία χωρίς αυθεντικοποίηση
- Όλες οι κλήσεις API χρησιμοποιούν managed identities
- Δικτυακός περιορισμός με private endpoints
- Έλεγχοι πρόσβασης με τη λογική του ελάχιστου προνομίου

```bicep
// Managed Identity for each service
resource chatServiceIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'chat-service-identity'
  location: location
}

// Role assignments with minimal permissions
resource openAIUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, chatServiceIdentity.id, openAIUserRoleDefinitionId)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: chatServiceIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### 2. Ασφαλής Διαχείριση Μυστικών

**Πρότυπο Ενσωμάτωσης Key Vault**:

```bicep
// Key Vault with proper access policies
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'premium'  // Use premium for production
    }
    enableRbacAuthorization: true  // Use RBAC instead of access policies
    enablePurgeProtection: true    // Prevent accidental deletion
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
  }
}

// Store all AI service credentials
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
    attributes: {
      enabled: true
    }
  }
}
```

### 3. Δικτυακή Ασφάλεια

**Διαμόρφωση Private Endpoint**:

```bicep
// Virtual Network for AI services
resource virtualNetwork 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'ai-services-subnet'
        properties: {
          addressPrefix: '10.0.1.0/24'
          privateEndpointNetworkPolicies: 'Disabled'
        }
      }
      {
        name: 'app-services-subnet'
        properties: {
          addressPrefix: '10.0.2.0/24'
          delegations: [
            {
              name: 'Microsoft.Web/serverFarms'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
        }
      }
    ]
  }
}

// Private endpoints for all AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Απόδοση και Κλιμάκωση

### 1. Στρατηγικές Αυτόματης Κλιμάκωσης

**Auto-scaling για Container Apps**:

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
        transport: 'http'
      }
    }
    template: {
      scale: {
        minReplicas: 2  // Always have 2 instances minimum
        maxReplicas: 50 // Scale up to 50 for high load
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '20'  // Scale when >20 concurrent requests
              }
            }
          }
          {
            name: 'cpu-scaling'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'  // Scale when CPU >70%
              }
            }
          }
        ]
      }
    }
  }
}
```

### 2. Στρατηγικές Caching

**Redis Cache για Απαντήσεις AI**:

```bicep
// Redis Premium for production workloads
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Premium'
      family: 'P'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
    redisConfiguration: {
      'maxmemory-policy': 'allkeys-lru'
    }
    // Enable clustering for high availability
    redisVersion: '6.0'
    shardCount: 2
  }
}

// Cache configuration in application
var cacheConnectionString = '${redisCache.properties.hostName}:6380,password=${redisCache.listKeys().primaryKey},ssl=True,abortConnect=False'
```

### 3. Διαχείριση Φορτίου και Κυκλοφορίας

**Application Gateway με WAF**:

```bicep
// Application Gateway with Web Application Firewall
resource applicationGateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: appGatewayName
  location: location
  properties: {
    sku: {
      name: 'WAF_v2'
      tier: 'WAF_v2'
      capacity: 2
    }
    webApplicationFirewallConfiguration: {
      enabled: true
      firewallMode: 'Prevention'
      ruleSetType: 'OWASP'
      ruleSetVersion: '3.2'
    }
    // Backend pools for AI services
    backendAddressPools: [
      {
        name: 'ai-services-pool'
        properties: {
          backendAddresses: [
            {
              fqdn: '${containerApp.properties.configuration.ingress.fqdn}'
            }
          ]
        }
      }
    ]
  }
}
```

## 💰 Βελτιστοποίηση Κόστους

### 1. Ορθολογική Διάσταση Πόρων

**Διαμορφώσεις ανά Περιβάλλον**:

```bash
# Περιβάλλον ανάπτυξης
azd env new development
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set CONTAINER_CPU 0.5
azd env set CONTAINER_MEMORY 1.0

# Περιβάλλον παραγωγής
azd env new production
azd env set AZURE_OPENAI_SKU "S0"
azd env set AZURE_OPENAI_CAPACITY 100
azd env set AZURE_SEARCH_SKU "standard"
azd env set CONTAINER_CPU 2.0
azd env set CONTAINER_MEMORY 4.0
```

### 2. Παρακολούθηση Κόστους και Προϋπολογισμοί

```bicep
// Cost management and budgets
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 2000  // $2000 monthly budget
    category: 'Cost'
    notifications: {
      warning: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'finance@company.com'
          'engineering@company.com'
        ]
        contactRoles: [
          'Owner'
          'Contributor'
        ]
      }
      critical: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 95
        contactEmails: [
          'cto@company.com'
        ]
      }
    }
  }
}
```

### 3. Βελτιστοποίηση Χρήσης Token

**Διαχείριση Κόστους OpenAI**:

```typescript
// Βελτιστοποίηση token σε επίπεδο εφαρμογής
class TokenOptimizer {
  private readonly maxTokens = 4000;
  private readonly reserveTokens = 500;
  
  optimizePrompt(userInput: string, context: string): string {
    const availableTokens = this.maxTokens - this.reserveTokens;
    const estimatedTokens = this.estimateTokens(userInput + context);
    
    if (estimatedTokens > availableTokens) {
      // Περικόψτε το πλαίσιο, όχι την είσοδο του χρήστη
      context = this.truncateContext(context, availableTokens - this.estimateTokens(userInput));
    }
    
    return `${context}\n\nUser: ${userInput}`;
  }
  
  private estimateTokens(text: string): number {
    // Χονδρική εκτίμηση: 1 token ≈ 4 χαρακτήρες
    return Math.ceil(text.length / 4);
  }
}
```

## Παρακολούθηση και Παρατηρησιμότητα

### 1. Ολοκληρωμένο Application Insights

```bicep
// Application Insights with advanced features
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
    SamplingPercentage: 100  // Full sampling for AI apps
    DisableIpMasking: false  // Enable for security
  }
}

// Custom metrics for AI operations
resource aiMetricAlerts 'Microsoft.Insights/metricAlerts@2018-03-01' = {
  name: 'ai-high-error-rate'
  location: 'global'
  properties: {
    description: 'Alert when AI service error rate is high'
    severity: 2
    enabled: true
    scopes: [
      applicationInsights.id
    ]
    evaluationFrequency: 'PT1M'
    windowSize: 'PT5M'
    criteria: {
      'odata.type': 'Microsoft.Azure.Monitor.SingleResourceMultipleMetricCriteria'
      allOf: [
        {
          name: 'high-error-rate'
          metricName: 'requests/failed'
          operator: 'GreaterThan'
          threshold: 10
          timeAggregation: 'Count'
        }
      ]
    }
  }
}
```

### 2. Παρακολούθηση Ειδική για AI

**Προσαρμοσμένα Dashboards για Μετρικές AI**:

```json
// Dashboard configuration for AI workloads
{
  "dashboard": {
    "name": "AI Application Monitoring",
    "tiles": [
      {
        "name": "OpenAI Request Volume",
        "query": "requests | where name contains 'openai' | summarize count() by bin(timestamp, 5m)"
      },
      {
        "name": "AI Response Latency",
        "query": "requests | where name contains 'openai' | summarize avg(duration) by bin(timestamp, 5m)"
      },
      {
        "name": "Token Usage",
        "query": "customMetrics | where name == 'openai_tokens_used' | summarize sum(value) by bin(timestamp, 1h)"
      },
      {
        "name": "Cost per Hour",
        "query": "customMetrics | where name == 'openai_cost' | summarize sum(value) by bin(timestamp, 1h)"
      }
    ]
  }
}
```

### 3. Έλεγχοι Υγείας και Παρακολούθηση Διαθεσιμότητας

```bicep
// Application Insights availability tests
resource availabilityTest 'Microsoft.Insights/webtests@2022-06-15' = {
  name: 'ai-app-availability-test'
  location: location
  tags: {
    'hidden-link:${applicationInsights.id}': 'Resource'
  }
  properties: {
    SyntheticMonitorId: 'ai-app-availability-test'
    Name: 'AI Application Availability Test'
    Description: 'Tests AI application endpoints'
    Enabled: true
    Frequency: 300  // 5 minutes
    Timeout: 120    // 2 minutes
    Kind: 'ping'
    Locations: [
      {
        Id: 'us-east-2-azr'
      }
      {
        Id: 'us-west-2-azr'
      }
    ]
    Configuration: {
      WebTest: '''
        <WebTest Name="AI Health Check" 
                 Id="8d2de8d2-a2b0-4c2e-9a0d-8f9c9a0b8c8d" 
                 Enabled="True" 
                 CssProjectStructure="" 
                 CssIteration="" 
                 Timeout="120" 
                 WorkItemIds="" 
                 xmlns="http://microsoft.com/schemas/VisualStudio/TeamTest/2010" 
                 Description="" 
                 CredentialUserName="" 
                 CredentialPassword="" 
                 PreAuthenticate="True" 
                 Proxy="default" 
                 StopOnError="False" 
                 RecordedResultFile="" 
                 ResultsLocale="">
          <Items>
            <Request Method="GET" 
                     Guid="a5f10126-e4cd-570d-961c-cea43999a200" 
                     Version="1.1" 
                     Url="${webApp.properties.defaultHostName}/health" 
                     ThinkTime="0" 
                     Timeout="120" 
                     ParseDependentRequests="True" 
                     FollowRedirects="True" 
                     RecordResult="True" 
                     Cache="False" 
                     ResponseTimeGoal="0" 
                     Encoding="utf-8" 
                     ExpectedHttpStatusCode="200" 
                     ExpectedResponseUrl="" 
                     ReportingName="" 
                     IgnoreHttpStatusCode="False" />
          </Items>
        </WebTest>
      '''
    }
  }
}
```

## Ανάκτηση από Καταστροφές και Υψηλή Διαθεσιμότητα

### 1. Ανάπτυξη σε Πολλαπλές Περιοχές

```yaml
# azure.yaml - Multi-region configuration
name: ai-app-multiregion
services:
  api-primary:
    project: ./api
    host: containerapp
    env:
      - AZURE_REGION=eastus
  api-secondary:
    project: ./api
    host: containerapp
    env:
      - AZURE_REGION=westus2
```

```bicep
// Traffic Manager for global load balancing
resource trafficManager 'Microsoft.Network/trafficManagerProfiles@2022-04-01' = {
  name: trafficManagerProfileName
  location: 'global'
  properties: {
    profileStatus: 'Enabled'
    trafficRoutingMethod: 'Priority'
    dnsConfig: {
      relativeName: trafficManagerProfileName
      ttl: 30
    }
    monitorConfig: {
      protocol: 'HTTPS'
      port: 443
      path: '/health'
      intervalInSeconds: 30
      toleratedNumberOfFailures: 3
      timeoutInSeconds: 10
    }
    endpoints: [
      {
        name: 'primary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: primaryAppService.id
          endpointStatus: 'Enabled'
          priority: 1
        }
      }
      {
        name: 'secondary-endpoint'
        type: 'Microsoft.Network/trafficManagerProfiles/azureEndpoints'
        properties: {
          targetResourceId: secondaryAppService.id
          endpointStatus: 'Enabled'
          priority: 2
        }
      }
    ]
  }
}
```

### 2. Αντίγραφα Ασφαλείας Δεδομένων και Ανάκτηση

```bicep
// Backup configuration for critical data
resource backupVault 'Microsoft.DataProtection/backupVaults@2023-05-01' = {
  name: backupVaultName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    storageSettings: [
      {
        datastoreType: 'VaultStore'
        type: 'LocallyRedundant'
      }
    ]
  }
}

// Backup policy for AI models and data
resource backupPolicy 'Microsoft.DataProtection/backupVaults/backupPolicies@2023-05-01' = {
  parent: backupVault
  name: 'ai-data-backup-policy'
  properties: {
    policyRules: [
      {
        backupParameters: {
          backupType: 'Full'
          objectType: 'AzureBackupParams'
        }
        trigger: {
          schedule: {
            repeatingTimeIntervals: [
              'R/2024-01-01T02:00:00+00:00/P1D'  // Daily at 2 AM
            ]
          }
          objectType: 'ScheduleBasedTriggerContext'
        }
        dataStore: {
          datastoreType: 'VaultStore'
          objectType: 'DataStoreInfoBase'
        }
        name: 'BackupDaily'
        objectType: 'AzureBackupRule'
      }
    ]
  }
}
```

## DevOps και Ενσωμάτωση CI/CD

### 1. GitHub Actions Workflow

```yaml
# .github/workflows/deploy-ai-app.yml
name: Deploy AI Application

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
          
      - name: Install dependencies
        run: |
          pip install -r requirements.txt
          pip install pytest
          
      - name: Run tests
        run: pytest tests/
        
      - name: AI Safety Tests
        run: |
          python scripts/test_ai_safety.py
          python scripts/validate_prompts.py

  deploy-staging:
    needs: test
    if: github.event_name == 'pull_request'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1.0.0
        
      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          
      - name: Deploy to Staging
        run: |
          azd env select staging
          azd deploy

  deploy-production:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup AZD
        uses: Azure/setup-azd@v1.0.0
        
      - name: Login to Azure
        uses: azure/login@v1
        with:
          creds: ${{ secrets.AZURE_CREDENTIALS }}
          
      - name: Deploy to Production
        run: |
          azd env select production
          azd deploy
          
      - name: Run Production Health Checks
        run: |
          python scripts/health_check.py --env production
```

### 2. Επικύρωση Υποδομής

```bash
# scripts/validate_infrastructure.sh
#!/bin/bash

echo "Validating AI infrastructure deployment..."

# Ελέγξτε αν όλες οι απαιτούμενες υπηρεσίες λειτουργούν
services=("openai" "search" "storage" "keyvault")
for service in "${services[@]}"; do
    echo "Checking $service..."
    if ! az resource list --resource-type "Microsoft.CognitiveServices/accounts" --query "[?contains(name, '$service')]" -o tsv; then
        echo "ERROR: $service not found"
        exit 1
    fi
done

# Επαληθεύστε τις αναπτύξεις μοντέλων OpenAI
echo "Validating OpenAI model deployments..."
models=$(az cognitiveservices account deployment list --name $AZURE_OPENAI_NAME --resource-group $AZURE_RESOURCE_GROUP --query "[].name" -o tsv)
if [[ ! $models == *"gpt-35-turbo"* ]]; then
    echo "ERROR: Required model gpt-35-turbo not deployed"
    exit 1
fi

# Δοκιμάστε τη σύνδεση με την υπηρεσία τεχνητής νοημοσύνης
echo "Testing AI service connectivity..."
python scripts/test_connectivity.py

echo "Infrastructure validation completed successfully!"
```

## Έλεγχος Ετοιμότητας για Παραγωγή

### Ασφάλεια ✅
- [ ] Όλες οι υπηρεσίες χρησιμοποιούν managed identities
- [ ] Τα μυστικά αποθηκεύονται σε Key Vault
- [ ] Private endpoints έχουν διαμορφωθεί
- [ ] Εφαρμόζονται network security groups
- [ ] RBAC με ελάχιστα προνόμια
- [ ] WAF ενεργοποιημένο σε δημόσια endpoints

### Απόδοση ✅
- [ ] Αυτόματη κλιμάκωση διαμορφωμένη
- [ ] Caching υλοποιημένο
- [ ] Ρύθμιση ισοστάθμισης φορτίου
- [ ] CDN για στατικό περιεχόμενο
- [ ] Pooling συνδέσεων βάσης δεδομένων
- [ ] Βελτιστοποίηση χρήσης token

### Παρακολούθηση ✅
- [ ] Application Insights διαμορφωμένο
- [ ] Προσαρμοσμένες μετρικές ορισμένες
- [ ] Κανόνες ειδοποίησης διαμορφωμένοι
- [ ] Dashboard δημιουργημένο
- [ ] Έλεγχοι υγείας υλοποιημένοι
- [ ] Πολιτικές διατήρησης logs

### Αξιοπιστία ✅
- [ ] Ανάπτυξη σε πολλές περιοχές
- [ ] Σχέδιο backup και ανάκτησης
- [ ] Υλοποίηση circuit breakers
- [ ] Πολιτικές επαναπροσπάθειας διαμορφωμένες
- [ ] Ομαλή υποβάθμιση λειτουργιών
- [ ] Endpoints ελέγχου υγείας

### Διαχείριση Κόστους ✅
- [ ] Ειδοποιήσεις προϋπολογισμού διαμορφωμένες
- [ ] Ορθολογική διάσταση πόρων
- [ ] Εκπτώσεις για dev/test εφαρμοσμένες
- [ ] Αγορά reserved instances
- [ ] Dashboard παρακολούθησης κόστους
- [ ] Τακτικές ανασκοπήσεις κόστους

### Συμμόρφωση ✅
- [ ] Πληρούνται απαιτήσεις τοπικής αποθήκευσης δεδομένων
- [ ] Ενεργοποιημένο audit logging
- [ ] Εφαρμοσμένες πολιτικές συμμόρφωσης
- [ ] Υλοποιημένα security baselines
- [ ] Τακτικές αξιολογήσεις ασφάλειας
- [ ] Σχέδιο απόκρισης σε περιστατικά

## Μετρικές Απόδοσης

### Τυπικές Μετρικές Παραγωγής

| Metric | Target | Monitoring |
|--------|--------|------------|
| **Response Time** | < 2 seconds | Application Insights |
| **Availability** | 99.9% | Uptime monitoring |
| **Error Rate** | < 0.1% | Application logs |
| **Token Usage** | < $500/month | Cost management |
| **Concurrent Users** | 1000+ | Load testing |
| **Recovery Time** | < 1 hour | Disaster recovery tests |

### Δοκιμές Φορτίου

```bash
# Σενάριο δοκιμής φόρτου για εφαρμογές τεχνητής νοημοσύνης
python scripts/load_test.py \
  --endpoint https://your-ai-app.azurewebsites.net \
  --concurrent-users 100 \
  --duration 300 \
  --ramp-up 60
```

## 🤝 Βέλτιστες Πρακτικές της Κοινότητας

Βασισμένα σε σχόλια της κοινότητας Microsoft Foundry Discord:

### Κορυφαίες Συστάσεις από την Κοινότητα:

1. **Ξεκινήστε Μικρά, Κλιμακώστε Σταδιακά**: Ξεκινήστε με βασικά SKUs και κλιμακώστε ανάλογα με τη πραγματική χρήση
2. **Παρακολουθήστε τα Πάντα**: Εγκαταστήστε ολοκληρωμένη παρακολούθηση από την πρώτη μέρα
3. **Αυτοματοποιήστε την Ασφάλεια**: Χρησιμοποιήστε infrastructure as code για συνεπή ασφάλεια
4. **Δοκιμάστε Εντατικά**: Συμπεριλάβετε δοκιμές ειδικές για AI στον pipeline σας
5. **Σχεδιάστε για Κόστη**: Παρακολουθήστε τη χρήση token και ορίστε ειδοποιήσεις προϋπολογισμού νωρίς

### Συνήθη Σφάλματα που Πρέπει να Αποφύγετε:

- ❌ Σκληρή ενσωμάτωση API keys στον κώδικα
- ❌ Μη ρύθμιση κατάλληλης παρακολούθησης
- ❌ Αγνόηση βελτιστοποίησης κόστους
- ❌ Μη δοκιμή σε σενάρια αποτυχίας
- ❌ Ανάπτυξη χωρίς ελέγχους υγείας

## Εντολές AZD AI CLI και Επεκτάσεις

Το AZD περιλαμβάνει ένα αυξανόμενο σύνολο εντολών και επεκτάσεων ειδικών για AI που απλοποιούν τα παραγωγικά workflows AI. Αυτά τα εργαλεία γεφυρώνουν το κενό μεταξύ της τοπικής ανάπτυξης και της παραγωγικής ανάπτυξης για φορτία εργασίας AI.

### Επεκτάσεις AZD για AI

Το AZD χρησιμοποιεί ένα σύστημα επεκτάσεων για να προσθέσει λειτουργίες ειδικές για AI. Εγκαταστήστε και διαχειριστείτε επεκτάσεις με:

```bash
# Απαρίθμησε όλες τις διαθέσιμες επεκτάσεις (συμπεριλαμβανομένων και των επεκτάσεων τεχνητής νοημοσύνης)
azd extension list

# Εγκατάστησε την επέκταση Foundry agents
azd extension install azure.ai.agents

# Εγκατάστησε την επέκταση fine-tuning
azd extension install azure.ai.finetune

# Εγκατάστησε την επέκταση προσαρμοσμένων μοντέλων
azd extension install azure.ai.models

# Αναβάθμισε όλες τις εγκατεστημένες επεκτάσεις
azd extension upgrade --all
```

**Διαθέσιμες επεκτάσεις AI:**

| Extension | Purpose | Status |
|-----------|---------|--------|
| `azure.ai.agents` | Foundry Agent Service management | Preview |
| `azure.ai.finetune` | Foundry model fine-tuning | Preview |
| `azure.ai.models` | Foundry custom models | Preview |
| `azure.coding-agent` | Coding agent configuration | Available |

### Αρχικοποίηση Έργων Πρακτόρων με `azd ai agent init`

Η εντολή `azd ai agent init` δημιουργεί τη βασική δομή ενός παραγωγικού έργου πράκτορα AI ενσωματωμένου με την Microsoft Foundry Agent Service:

```bash
# Δημιουργήστε ένα νέο έργο agent από ένα αρχείο manifest
azd ai agent init -m <manifest-path-or-uri>

# Αρχικοποιήστε και καθορίστε ως στόχο ένα συγκεκριμένο έργο Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Αρχικοποιήστε με προσαρμοσμένο φάκελο προέλευσης
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Καθορίστε τα Container Apps ως ξενιστή
azd ai agent init -m agent-manifest.yaml --host containerapp
```

**Κύριες σημαίες:**

| Flag | Description |
|------|-------------|
| `-m, --manifest` | Path or URI to an agent manifest to add to your project |
| `-p, --project-id` | Existing Microsoft Foundry Project ID for your azd environment |
| `-s, --src` | Directory to download the agent definition (defaults to `src/<agent-id>`) |
| `--host` | Override the default host (e.g., `containerapp`) |
| `-e, --environment` | The azd environment to use |

**Συμβουλή για παραγωγή**: Χρησιμοποιήστε `--project-id` για να συνδεθείτε απευθείας με ένα υπάρχον Foundry project, κρατώντας τον κώδικα του πράκτορά σας και τους πόρους cloud συνδεδεμένους από την αρχή.

### Model Context Protocol (MCP) με `azd mcp`

Το AZD περιλαμβάνει ενσωματωμένη υποστήριξη MCP server (Alpha), επιτρέποντας σε πράκτορες AI και εργαλεία να αλληλεπιδρούν με τους πόρους Azure του έργου σας μέσω ενός τυποποιημένου πρωτοκόλλου:

```bash
# Ξεκινήστε τον διακομιστή MCP για το έργο σας
azd mcp start

# Διαχειριστείτε τη συναίνεση εργαλείων για τις λειτουργίες MCP
azd mcp consent
```

Ο MCP server εκθέτει το context του azd project σας—περιβάλλοντα, υπηρεσίες και πόρους Azure—σε εργαλεία ανάπτυξης με δυνατότητες AI. Αυτό επιτρέπει:

- **AI-assisted deployment**: Επιτρέψτε σε coding agents να ρωτούν την κατάσταση του έργου σας και να ενεργοποιούν αναπτύξεις
- **Resource discovery**: Τα εργαλεία AI μπορούν να ανακαλύψουν ποιους πόρους Azure χρησιμοποιεί το έργο σας
- **Environment management**: Οι πράκτορες μπορούν να αλλάζουν μεταξύ dev/staging/production περιβαλλόντων

### Γεννήτρια Υποδομής με `azd infra generate`

Για παραγωγικά φορτία AI, μπορείτε να δημιουργήσετε και να προσαρμόσετε Infrastructure as Code αντί να βασίζεστε στην αυτόματη προμήθεια:

```bash
# Δημιουργήστε αρχεία Bicep/Terraform από τον ορισμό του έργου σας
azd infra generate
```

Αυτό γράφει IaC στο δίσκο ώστε να μπορείτε να:
- Ελέγξετε και να ελέγξετε την υποδομή πριν την ανάπτυξη
- Προσθέσετε προσαρμοσμένες πολιτικές ασφάλειας (κανόνες δικτύου, private endpoints)
- Ενσωματωθείτε με υπάρχοντες διαδικασίες ανασκόπησης IaC
- Ελέγχετε τις αλλαγές υποδομής με version control ξεχωριστά από τον κώδικα εφαρμογής

### Hooks Κύκλου Ζωής Παραγωγής

Τα hooks του AZD σας επιτρέπουν να εισάγετε προσαρμοσμένη λογική σε κάθε στάδιο του κύκλου ζωής ανάπτυξης—κρίσιμο για παραγωγικά workflows AI:

```yaml
# azure.yaml - Production hooks example
name: ai-production-app
hooks:
  preprovision:
    shell: sh
    run: scripts/validate-quotas.sh    # Check AI model quota before provisioning
  postprovision:
    shell: sh
    run: scripts/configure-networking.sh  # Set up private endpoints
  predeploy:
    shell: sh
    run: scripts/run-ai-safety-tests.sh  # Run prompt safety checks
  postdeploy:
    shell: sh
    run: scripts/smoke-test.sh           # Verify agent responses post-deploy
services:
  agent-api:
    project: ./src/agent
    host: containerapp
    hooks:
      predeploy:
        shell: sh
        run: scripts/validate-model-access.sh  # Per-service hook
```

```bash
# Εκτέλεση ενός συγκεκριμένου hook χειροκίνητα κατά την ανάπτυξη
azd hooks run predeploy
```

**Συνιστώμενα hooks παραγωγής για φορτία AI:**

| Hook | Use Case |
|------|----------|
| `preprovision` | Validate subscription quotas for AI model capacity |
| `postprovision` | Configure private endpoints, deploy model weights |
| `predeploy` | Run AI safety tests, validate prompt templates |
| `postdeploy` | Smoke test agent responses, verify model connectivity |

### Ρύθμιση CI/CD Pipeline

Χρησιμοποιήστε `azd pipeline config` για να συνδέσετε το έργο σας με GitHub Actions ή Azure Pipelines με ασφαλή αυθεντικοποίηση Azure:

```bash
# Διαμόρφωση pipeline CI/CD (διαδραστική)
azd pipeline config

# Διαμόρφωση με συγκεκριμένο πάροχο
azd pipeline config --provider github
```

Αυτή η εντολή:
- Δημιουργεί ένα service principal με δικαιώματα ελάχιστου προνομίου
- Διαμορφώνει federated credentials (χωρίς αποθηκευμένα μυστικά)
- Δημιουργεί ή ενημερώνει το αρχείο ορισμού του pipeline σας
- Ορίζει τις απαιτούμενες μεταβλητές περιβάλλοντος στο CI/CD σύστημά σας

**Παραγωγική ροή εργασίας με pipeline config**:

```bash
# 1. Ρυθμίστε το περιβάλλον παραγωγής
azd env new production
azd env set AZURE_OPENAI_CAPACITY 100

# 2. Διαμορφώστε το pipeline
azd pipeline config --provider github

# 3. Το pipeline εκτελεί το azd deploy σε κάθε push στο main
```

### Προσθήκη Συστατικών με `azd add`

Προσθέστε σταδιακά υπηρεσίες Azure σε ένα υπάρχον έργο:

```bash
# Προσθέστε ένα νέο στοιχείο υπηρεσίας αλληλεπιδραστικά
azd add
```

Αυτό είναι ιδιαίτερα χρήσιμο για την επέκταση παραγωγικών εφαρμογών AI—για παράδειγμα, προσθήκη υπηρεσίας vector search, ενός νέου endpoint πράκτορα ή ενός συστατικού παρακολούθησης σε μια υπάρχουσα ανάπτυξη.

## Πρόσθετοι Πόροι
- **Azure Well-Architected Framework**: [Οδηγίες για φόρτο εργασίας AI](https://learn.microsoft.com/azure/well-architected/ai/)
- **Microsoft Foundry Documentation**: [Επίσημη τεκμηρίωση](https://learn.microsoft.com/azure/ai-studio/)
- **Community Templates**: [Δείγματα Azure](https://github.com/Azure-Samples)
- **Discord Community**: [κανάλι #Azure](https://discord.gg/microsoft-azure)
- **Agent Skills for Azure**: [microsoft/github-copilot-for-azure on skills.sh](https://skills.sh/microsoft/github-copilot-for-azure) - 37 ανοιχτές δεξιότητες πρακτόρων για το Azure AI, το Foundry, ανάπτυξη, βελτιστοποίηση κόστους και διαγνωστικά. Εγκαταστήστε στον επεξεργαστή σας:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 8 - Πρότυπα Παραγωγής και Επιχειρήσεων
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 7: Επίλυση προβλημάτων](../chapter-07-troubleshooting/debugging.md)
- **⬅️ Επίσης Σχετικά**: [Εργαστήριο AI](ai-workshop-lab.md)
- **� Ολοκλήρωση Μαθήματος**: [AZD For Beginners](../../README.md)

**Θυμηθείτε**: Τα παραγωγικά φορτία εργασίας AI απαιτούν προσεκτικό σχεδιασμό, παρακολούθηση και συνεχή βελτιστοποίηση. Ξεκινήστε με αυτά τα πρότυπα και προσαρμόστε τα στις συγκεκριμένες απαιτήσεις σας.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Το παρόν έγγραφο έχει μεταφραστεί με χρήση της υπηρεσίας αυτόματης μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από επαγγελματία μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->