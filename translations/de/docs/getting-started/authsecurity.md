# Authentifizierungsmuster und Verwaltete Identität

⏱️ **Geschätzte Zeit**: 45-60 Minuten | 💰 **Kosten**: Kostenlos (keine zusätzlichen Gebühren) | ⭐ **Komplexität**: Mittel

**📚 Lernpfad:**
- ← Vorher: [Konfigurationsmanagement](configuration.md) - Verwalten von Umgebungsvariablen und Geheimnissen
- 🎯 **Hier bist du**: Authentifizierung & Sicherheit (Verwaltete Identität, Key Vault, sichere Muster)
- → Weiter: [Erstes Projekt](first-project.md) - Erstelle deine erste AZD-Anwendung
- 🏠 [Kursübersicht](../../README.md)

---

## Was du lernen wirst

Nach Abschluss dieser Lektion wirst du:
- Azure-Authentifizierungsmuster verstehen (Schlüssel, Verbindungszeichenfolgen, verwaltete Identität)
- **Verwaltete Identität** für passwortlose Authentifizierung implementieren
- Geheimnisse mit der Integration von **Azure Key Vault** sichern
- **Rollenbasierte Zugriffskontrolle (RBAC)** für AZD-Bereitstellungen konfigurieren
- Sicherheits-Best-Practices in Container-Apps und Azure-Diensten anwenden
- Von schlüsselbasierter zu identitätsbasierter Authentifizierung migrieren

## Warum verwaltete Identität wichtig ist

### Das Problem: Traditionelle Authentifizierung

**Vor der verwalteten Identität:**
```javascript
// ❌ SICHERHEITSRISIKO: Fest codierte Geheimnisse im Code
const connectionString = "Server=mydb.database.windows.net;User=admin;Password=P@ssw0rd123";
const storageKey = "xK7mN9pQ2wR5tY8uI0oP3aS6dF1gH4jK...";
const cosmosKey = "C2x7B9n4M1p8Q5w3E6r0T2y5U8i1O4p7...";
```

**Probleme:**
- 🔴 **Offengelegte Geheimnisse** im Code, in Konfigurationsdateien, Umgebungsvariablen
- 🔴 **Anmeldeinformationen rotieren** erfordert Codeänderungen und erneute Bereitstellung
- 🔴 **Audit-Albträume** - Wer hat wann auf was zugegriffen?
- 🔴 **Verstreuung** - Geheimnisse sind über mehrere Systeme verteilt
- 🔴 **Compliance-Risiken** - Sicherheitsprüfungen nicht bestanden

### Die Lösung: Verwaltete Identität

**Nach der verwalteten Identität:**
```javascript
// ✅ SICHER: Keine Geheimnisse im Code
const credential = new DefaultAzureCredential();
const client = new BlobServiceClient(
  "https://mystorageaccount.blob.core.windows.net",
  credential  // Azure verwaltet die Authentifizierung automatisch
);
```

**Vorteile:**
- ✅ **Keine Geheimnisse** im Code oder in der Konfiguration
- ✅ **Automatische Rotation** - Azure übernimmt das
- ✅ **Vollständige Audit-Protokolle** in Azure AD-Logs
- ✅ **Zentrale Sicherheit** - Verwaltung im Azure-Portal
- ✅ **Compliance-fähig** - Erfüllt Sicherheitsstandards

**Analogie**: Traditionelle Authentifizierung ist wie das Tragen mehrerer physischer Schlüssel für verschiedene Türen. Verwaltete Identität ist wie ein Sicherheitsausweis, der automatisch basierend auf deiner Identität Zugriff gewährt – keine Schlüssel, die verloren gehen, kopiert oder rotiert werden müssen.

---

## Architekturübersicht

### Authentifizierungsfluss mit verwalteter Identität

```mermaid
sequenceDiagram
    participant App as Ihre Anwendung<br/>(Container App)
    participant MI as Verwaltete Identität<br/>(Azure AD)
    participant KV as Schlüsseltresor
    participant Storage as Azure-Speicher
    participant DB as Azure SQL
    
    App->>MI: Zugriffstoken anfordern<br/>(automatisch)
    MI->>MI: Identität überprüfen<br/>(kein Passwort erforderlich)
    MI-->>App: Token zurückgeben<br/>(gültig 1 Stunde)
    
    App->>KV: Geheimnis abrufen<br/>(mit Token)
    KV->>KV: RBAC-Berechtigungen prüfen
    KV-->>App: Geheimniswert zurückgeben
    
    App->>Storage: Blob hochladen<br/>(mit Token)
    Storage->>Storage: RBAC-Berechtigungen prüfen
    Storage-->>App: Erfolg
    
    App->>DB: Daten abfragen<br/>(mit Token)
    DB->>DB: SQL-Berechtigungen prüfen
    DB-->>App: Ergebnisse zurückgeben
    
    Note over App,DB: Alle Authentifizierungen passwortlos!
```
### Arten von verwalteten Identitäten

```mermaid
graph TB
    MI[Verwaltete Identität]
    SystemAssigned[Systemzugewiesene Identität]
    UserAssigned[Benutzerzugewiesene Identität]
    
    MI --> SystemAssigned
    MI --> UserAssigned
    
    SystemAssigned --> SA1[Lebenszyklus an Ressource gebunden]
    SystemAssigned --> SA2[Automatische Erstellung/Löschung]
    SystemAssigned --> SA3[Am besten für einzelne Ressource]
    
    UserAssigned --> UA1[Unabhängiger Lebenszyklus]
    UserAssigned --> UA2[Manuelle Erstellung/Löschung]
    UserAssigned --> UA3[Geteilt über Ressourcen hinweg]
    
    style SystemAssigned fill:#2196F3,stroke:#1976D2,stroke-width:2px,color:#fff
    style UserAssigned fill:#4CAF50,stroke:#388E3C,stroke-width:2px,color:#fff
```
| Merkmal | Systemzugewiesen | Benutzerzugewiesen |
|---------|------------------|--------------------|
| **Lebenszyklus** | An Ressource gebunden | Unabhängig |
| **Erstellung** | Automatisch mit Ressource | Manuelle Erstellung |
| **Löschung** | Wird mit Ressource gelöscht | Bleibt nach Ressourcendeletion bestehen |
| **Teilen** | Nur eine Ressource | Mehrere Ressourcen |
| **Anwendungsfall** | Einfache Szenarien | Komplexe Multi-Ressourcen-Szenarien |
| **AZD-Standard** | ✅ Empfohlen | Optional |

---

## Voraussetzungen

### Erforderliche Tools

Du solltest diese Tools aus vorherigen Lektionen bereits installiert haben:

```bash
# Überprüfen Sie Azure Developer CLI
azd version
# ✅ Erwartet: azd Version 1.0.0 oder höher

# Überprüfen Sie Azure CLI
az --version
# ✅ Erwartet: azure-cli 2.50.0 oder höher
```

### Azure-Anforderungen

- Aktives Azure-Abonnement
- Berechtigungen zum:
  - Erstellen von verwalteten Identitäten
  - Zuweisen von RBAC-Rollen
  - Erstellen von Key Vault-Ressourcen
  - Bereitstellen von Container-Apps

### Wissensvoraussetzungen

Du solltest abgeschlossen haben:
- [Installationsanleitung](installation.md) - AZD-Setup
- [AZD-Grundlagen](azd-basics.md) - Kernkonzepte
- [Konfigurationsmanagement](configuration.md) - Umgebungsvariablen

---

## Lektion 1: Authentifizierungsmuster verstehen

### Muster 1: Verbindungszeichenfolgen (Legacy - Vermeiden)

**Funktionsweise:**
```bash
# Verbindungszeichenfolge enthält Anmeldedaten
STORAGE_CONNECTION_STRING="DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=xK7mN9pQ2wR5..."
COSMOS_CONNECTION_STRING="AccountEndpoint=https://myaccount.documents.azure.com:443/;AccountKey=C2x7..."
SQL_CONNECTION_STRING="Server=myserver.database.windows.net;User=admin;Password=P@ssw0rd..."
```

**Probleme:**
- ❌ Geheimnisse sichtbar in Umgebungsvariablen
- ❌ In Bereitstellungssystemen protokolliert
- ❌ Schwer zu rotieren
- ❌ Kein Audit-Trail für Zugriffe

**Wann verwenden:** Nur für lokale Entwicklung, niemals in der Produktion.

---

### Muster 2: Key Vault-Referenzen (Besser)

**Funktionsweise:**
```bicep
// Store secret in Key Vault
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: 'mykv'
  properties: {
    enableRbacAuthorization: true
  }
}

// Reference in Container App
env: [
  {
    name: 'STORAGE_KEY'
    secretRef: 'storage-key'  // References Key Vault
  }
]
```

**Vorteile:**
- ✅ Geheimnisse sicher im Key Vault gespeichert
- ✅ Zentrale Verwaltung von Geheimnissen
- ✅ Rotation ohne Codeänderungen

**Einschränkungen:**
- ⚠️ Immer noch Verwendung von Schlüsseln/Passwörtern
- ⚠️ Zugriff auf Key Vault muss verwaltet werden

**Wann verwenden:** Übergangsschritt von Verbindungszeichenfolgen zu verwalteter Identität.

---

### Muster 3: Verwaltete Identität (Best Practice)

**Funktionsweise:**
```bicep
// Enable managed identity
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Automatically creates identity
  }
}

// Grant permissions
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: storageAccount
  properties: {
    roleDefinitionId: storageBlobDataContributorRole
    principalId: containerApp.identity.principalId
  }
}
```

**Anwendungscode:**
```javascript
// Keine Geheimnisse nötig!
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  'https://mystorageaccount.blob.core.windows.net',
  credential
);
```

**Vorteile:**
- ✅ Keine Geheimnisse im Code/in der Konfiguration
- ✅ Automatische Rotation von Anmeldeinformationen
- ✅ Vollständiger Audit-Trail
- ✅ RBAC-basierte Berechtigungen
- ✅ Compliance-fähig

**Wann verwenden:** Immer, für Produktionsanwendungen.

---

## Lektion 2: Implementierung der verwalteten Identität mit AZD

### Schritt-für-Schritt-Implementierung

Erstellen wir eine sichere Container-App, die verwaltete Identität verwendet, um auf Azure Storage und Key Vault zuzugreifen.

### Projektstruktur

```
secure-app/
├── azure.yaml                 # AZD configuration
├── infra/
│   ├── main.bicep            # Main infrastructure
│   ├── core/
│   │   ├── identity.bicep    # Managed identity setup
│   │   ├── keyvault.bicep    # Key Vault configuration
│   │   └── storage.bicep     # Storage with RBAC
│   └── app/
│       └── container-app.bicep
└── src/
    ├── app.js                # Application code
    ├── package.json
    └── Dockerfile
```

### 1. AZD konfigurieren (azure.yaml)

```yaml
name: secure-app
metadata:
  template: secure-app@1.0.0

services:
  api:
    project: ./src
    language: js
    host: containerapp

# Enable managed identity (AZD handles this automatically)
```

### 2. Infrastruktur: Verwaltete Identität aktivieren

**Datei: `infra/main.bicep`**

```bicep
targetScope = 'subscription'

param environmentName string
param location string = 'eastus'

var tags = { 'azd-env-name': environmentName }

// Resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

// Storage Account
module storage './core/storage.bicep' = {
  name: 'storage'
  scope: rg
  params: {
    name: 'st${uniqueString(rg.id)}'
    location: location
    tags: tags
  }
}

// Key Vault
module keyVault './core/keyvault.bicep' = {
  name: 'keyvault'
  scope: rg
  params: {
    name: 'kv-${uniqueString(rg.id)}'
    location: location
    tags: tags
  }
}

// Container App with Managed Identity
module containerApp './app/container-app.bicep' = {
  name: 'container-app'
  scope: rg
  params: {
    name: 'ca-${environmentName}'
    location: location
    tags: tags
    storageAccountName: storage.outputs.name
    keyVaultName: keyVault.outputs.name
  }
}

// Grant Container App access to Storage
module storageRoleAssignment './core/role-assignment.bicep' = {
  name: 'storage-role'
  scope: rg
  params: {
    principalId: containerApp.outputs.identityPrincipalId
    roleDefinitionId: 'ba92f5b4-2d11-453d-a403-e96b0029c9fe'  // Storage Blob Data Contributor
    targetResourceId: storage.outputs.id
  }
}

// Grant Container App access to Key Vault
module kvRoleAssignment './core/role-assignment.bicep' = {
  name: 'kv-role'
  scope: rg
  params: {
    principalId: containerApp.outputs.identityPrincipalId
    roleDefinitionId: '4633458b-17de-408a-b874-0445c86b69e6'  // Key Vault Secrets User
    targetResourceId: keyVault.outputs.id
  }
}

// Outputs
output AZURE_STORAGE_ACCOUNT_NAME string = storage.outputs.name
output AZURE_KEY_VAULT_NAME string = keyVault.outputs.name
output APP_URL string = containerApp.outputs.url
```

### 3. Container-App mit systemzugewiesener Identität

**Datei: `infra/app/container-app.bicep`**

```bicep
param name string
param location string
param tags object = {}
param storageAccountName string
param keyVaultName string

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: name
  location: location
  tags: tags
  identity: {
    type: 'SystemAssigned'  // 🔑 Enable managed identity
  }
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 3000
      }
    }
    template: {
      containers: [
        {
          name: 'api'
          image: 'myregistry.azurecr.io/api:latest'
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          env: [
            {
              name: 'AZURE_STORAGE_ACCOUNT_NAME'
              value: storageAccountName
            }
            {
              name: 'AZURE_KEY_VAULT_NAME'
              value: keyVaultName
            }
            // 🔑 No secrets - managed identity handles authentication!
          ]
        }
      ]
    }
  }
}

// Output the identity for RBAC assignments
output identityPrincipalId string = containerApp.identity.principalId
output id string = containerApp.id
output url string = 'https://${containerApp.properties.configuration.ingress.fqdn}'
```

### 4. RBAC-Rollen-Zuweisungsmodul

**Datei: `infra/core/role-assignment.bicep`**

```bicep
param principalId string
param roleDefinitionId string  // Azure built-in role ID
param targetResourceId string

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(principalId, roleDefinitionId, targetResourceId)
  scope: resourceId('Microsoft.Resources/resourceGroups', resourceGroup().name)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionId)
    principalId: principalId
    principalType: 'ServicePrincipal'
  }
}

output id string = roleAssignment.id
```

### 5. Anwendungscode mit verwalteter Identität

**Datei: `src/app.js`**

```javascript
const express = require('express');
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');
const { SecretClient } = require('@azure/keyvault-secrets');

const app = express();
const PORT = process.env.PORT || 3000;

// 🔑 Initialisieren Sie die Anmeldeinformationen (funktioniert automatisch mit verwalteter Identität)
const credential = new DefaultAzureCredential();

// Azure Storage Einrichtung
const storageAccountName = process.env.AZURE_STORAGE_ACCOUNT_NAME;
const blobServiceClient = new BlobServiceClient(
  `https://${storageAccountName}.blob.core.windows.net`,
  credential  // Keine Schlüssel benötigt!
);

// Key Vault Einrichtung
const keyVaultName = process.env.AZURE_KEY_VAULT_NAME;
const secretClient = new SecretClient(
  `https://${keyVaultName}.vault.azure.net`,
  credential  // Keine Schlüssel benötigt!
);

// Gesundheitsprüfung
app.get('/health', (req, res) => {
  res.json({ status: 'healthy', authentication: 'managed-identity' });
});

// Datei in Blob-Speicher hochladen
app.post('/upload', async (req, res) => {
  try {
    const containerClient = blobServiceClient.getContainerClient('uploads');
    await containerClient.createIfNotExists();
    
    const blobName = `file-${Date.now()}.txt`;
    const blockBlobClient = containerClient.getBlockBlobClient(blobName);
    
    await blockBlobClient.upload('Hello from managed identity!', 30);
    
    res.json({
      success: true,
      blobName: blobName,
      message: 'File uploaded using managed identity!'
    });
  } catch (error) {
    console.error('Upload error:', error);
    res.status(500).json({ error: error.message });
  }
});

// Geheimnis aus Key Vault abrufen
app.get('/secret/:name', async (req, res) => {
  try {
    const secretName = req.params.name;
    const secret = await secretClient.getSecret(secretName);
    
    res.json({
      name: secretName,
      value: secret.value,
      message: 'Secret retrieved using managed identity!'
    });
  } catch (error) {
    console.error('Secret error:', error);
    res.status(500).json({ error: error.message });
  }
});

// Blob-Container auflisten (zeigt Lesezugriff)
app.get('/containers', async (req, res) => {
  try {
    const containers = [];
    for await (const container of blobServiceClient.listContainers()) {
      containers.push(container.name);
    }
    
    res.json({
      containers: containers,
      count: containers.length,
      message: 'Containers listed using managed identity!'
    });
  } catch (error) {
    console.error('List error:', error);
    res.status(500).json({ error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Secure API listening on port ${PORT}`);
  console.log('Authentication: Managed Identity (passwordless)');
});
```

**Datei: `src/package.json`**

```json
{
  "name": "secure-app",
  "version": "1.0.0",
  "dependencies": {
    "express": "^4.18.2",
    "@azure/identity": "^4.0.0",
    "@azure/storage-blob": "^12.17.0",
    "@azure/keyvault-secrets": "^4.7.0"
  },
  "scripts": {
    "start": "node app.js"
  }
}
```

### 6. Bereitstellen und Testen

```bash
# Initialisiere AZD-Umgebung
azd init

# Infrastruktur und Anwendung bereitstellen
azd up

# Hole die App-URL
APP_URL=$(azd env get-values | grep APP_URL | cut -d '=' -f2 | tr -d '"')

# Teste Gesundheitsprüfung
curl $APP_URL/health
```

**✅ Erwartete Ausgabe:**
```json
{
  "status": "healthy",
  "authentication": "managed-identity"
}
```

**Blob-Upload testen:**
```bash
curl -X POST $APP_URL/upload
```

**✅ Erwartete Ausgabe:**
```json
{
  "success": true,
  "blobName": "file-1700404800000.txt",
  "message": "File uploaded using managed identity!"
}
```

**Container-Auflistung testen:**
```bash
curl $APP_URL/containers
```

**✅ Erwartete Ausgabe:**
```json
{
  "containers": ["uploads"],
  "count": 1,
  "message": "Containers listed using managed identity!"
}
```

---

## Häufige Azure-RBAC-Rollen

### Eingebaute Rollen-IDs für verwaltete Identität

| Dienst | Rollenname | Rollen-ID | Berechtigungen |
|--------|------------|-----------|----------------|
| **Storage** | Storage Blob Data Reader | `2a2b9908-6b94-4a3d-8e5a-a7d8f8cc8a12` | Blobs und Container lesen |
| **Storage** | Storage Blob Data Contributor | `ba92f5b4-2d11-453d-a403-e96b0029c9fe` | Blobs lesen, schreiben, löschen |
| **Storage** | Storage Queue Data Contributor | `974c5e8b-45b9-4653-ba55-5f855dd0fb88` | Warteschlangennachrichten lesen, schreiben, löschen |
| **Key Vault** | Key Vault Secrets User | `4633458b-17de-408a-b874-0445c86b69e6` | Geheimnisse lesen |
| **Key Vault** | Key Vault Secrets Officer | `b86a8fe4-44ce-4948-aee5-eccb2c155cd7` | Geheimnisse lesen, schreiben, löschen |
| **Cosmos DB** | Cosmos DB Built-in Data Reader | `00000000-0000-0000-0000-000000000001` | Cosmos DB-Daten lesen |
| **Cosmos DB** | Cosmos DB Built-in Data Contributor | `00000000-0000-0000-0000-000000000002` | Cosmos DB-Daten lesen, schreiben |
| **SQL-Datenbank** | SQL DB Contributor | `9b7fa17d-e63e-47b0-bb0a-15c516ac86ec` | SQL-Datenbanken verwalten |
| **Service Bus** | Azure Service Bus Data Owner | `090c5cfd-751d-490a-894a-3ce6f1109419` | Nachrichten senden, empfangen, verwalten |

### So findest du Rollen-IDs

```bash
# Liste alle integrierten Rollen auf
az role definition list --query "[].{Name:roleName, ID:name}" --output table

# Suche nach einer bestimmten Rolle
az role definition list --query "[?contains(roleName, 'Storage Blob')].{Name:roleName, ID:name}" --output table

# Erhalte Rollendetails
az role definition list --name "Storage Blob Data Contributor"
```

---

## Praktische Übungen

### Übung 1: Verwaltete Identität für bestehende App aktivieren ⭐⭐ (Mittel)

**Ziel**: Füge einer bestehenden Container-App-Bereitstellung eine verwaltete Identität hinzu

**Szenario**: Du hast eine Container-App, die Verbindungszeichenfolgen verwendet. Konvertiere sie in eine verwaltete Identität.

**Ausgangspunkt**: Container-App mit dieser Konfiguration:

```bicep
// ❌ Current: Using connection string
env: [
  {
    name: 'STORAGE_CONNECTION_STRING'
    secretRef: 'storage-connection'
  }
]
```

**Schritte**:

1. **Verwaltete Identität in Bicep aktivieren:**

```bicep
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'myapp'
  identity: {
    type: 'SystemAssigned'  // Add this
  }
  // ... rest of configuration
}
```

2. **Speicherzugriff gewähren:**

```bicep
// Get storage account reference
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing = {
  name: storageAccountName
}

// Assign role
resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(containerApp.id, 'ba92f5b4-2d11-453d-a403-e96b0029c9fe', storageAccount.id)
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
    principalId: containerApp.identity.principalId
    principalType: 'ServicePrincipal'
  }
}
```

3. **Anwendungscode aktualisieren:**

**Vorher (Verbindungszeichenfolge):**
```javascript
const { BlobServiceClient } = require('@azure/storage-blob');

const blobServiceClient = BlobServiceClient.fromConnectionString(
  process.env.STORAGE_CONNECTION_STRING
);
```

**Nachher (verwaltete Identität):**
```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { BlobServiceClient } = require('@azure/storage-blob');

const credential = new DefaultAzureCredential();
const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

4. **Umgebungsvariablen aktualisieren:**

```bicep
env: [
  {
    name: 'STORAGE_ACCOUNT_NAME'
    value: storageAccountName  // Just the name, no secrets!
  }
  // Remove STORAGE_CONNECTION_STRING
]
```

5. **Bereitstellen und testen:**

```bash
# Erneut bereitstellen
azd up

# Testen, ob es noch funktioniert
curl https://myapp.azurecontainerapps.io/upload
```

**✅ Erfolgskriterien:**
- ✅ Anwendung wird fehlerfrei bereitgestellt
- ✅ Speicheroperationen funktionieren (Hochladen, Auflisten, Herunterladen)
- ✅ Keine Verbindungszeichenfolgen in Umgebungsvariablen
- ✅ Identität im Azure-Portal unter "Identität" sichtbar

**Verifizierung:**

```bash
# Überprüfen, ob die verwaltete Identität aktiviert ist
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Erwartet: "SystemAssigned"

# Überprüfen der Rollenvergabe
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv) \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.Storage/storageAccounts/mystorageaccount
# ✅ Erwartet: Zeigt die Rolle "Storage Blob Data Contributor" an
```

**Zeit**: 20-30 Minuten

---

### Übung 2: Multi-Service-Zugriff mit benutzerzugewiesener Identität ⭐⭐⭐ (Fortgeschritten)

**Ziel**: Erstelle eine benutzerzugewiesene Identität, die von mehreren Container-Apps gemeinsam genutzt wird

**Szenario**: Du hast 3 Microservices, die alle auf dasselbe Speicherkonto und Key Vault zugreifen müssen.

**Schritte**:

1. **Benutzerzugewiesene Identität erstellen:**

**Datei: `infra/core/identity.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource userAssignedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: name
  location: location
  tags: tags
}

output id string = userAssignedIdentity.id
output principalId string = userAssignedIdentity.properties.principalId
output clientId string = userAssignedIdentity.properties.clientId
```

2. **Rollen der benutzerzugewiesenen Identität zuweisen:**

```bicep
// In main.bicep
module userIdentity './core/identity.bicep' = {
  name: 'user-identity'
  scope: rg
  params: {
    name: 'id-${environmentName}'
    location: location
    tags: tags
  }
}

// Grant Storage access
resource storageRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(userIdentity.outputs.principalId, 'storage-contributor')
  scope: storageAccount
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', 'ba92f5b4-2d11-453d-a403-e96b0029c9fe')
    principalId: userIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
  }
}

// Grant Key Vault access
resource kvRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(userIdentity.outputs.principalId, 'kv-secrets-user')
  scope: keyVault
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalId: userIdentity.outputs.principalId
    principalType: 'ServicePrincipal'
  }
}
```

3. **Identität mehreren Container-Apps zuweisen:**

```bicep
resource apiGateway 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'api-gateway'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}

resource productService 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'product-service'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}

resource orderService 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'order-service'
  identity: {
    type: 'UserAssigned'
    userAssignedIdentities: {
      '${userIdentity.outputs.id}': {}
    }
  }
  // ... rest of config
}
```

4. **Anwendungscode (alle Dienste verwenden dasselbe Muster):**

```javascript
const { DefaultAzureCredential, ManagedIdentityCredential } = require('@azure/identity');

// Für benutzerzugewiesene Identität, geben Sie die Client-ID an
const credential = new ManagedIdentityCredential(
  process.env.AZURE_CLIENT_ID  // Benutzerzugewiesene Identität Client-ID
);

// Oder verwenden Sie DefaultAzureCredential (erkennt automatisch)
const credential = new DefaultAzureCredential();

const blobServiceClient = new BlobServiceClient(
  `https://${process.env.STORAGE_ACCOUNT_NAME}.blob.core.windows.net`,
  credential
);
```

5. **Bereitstellen und verifizieren:**

```bash
azd up

# Testen Sie, ob alle Dienste auf den Speicher zugreifen können
curl https://api-gateway.azurecontainerapps.io/upload
curl https://product-service.azurecontainerapps.io/upload
curl https://order-service.azurecontainerapps.io/upload
```

**✅ Erfolgskriterien:**
- ✅ Eine Identität wird von 3 Diensten gemeinsam genutzt
- ✅ Alle Dienste können auf Speicher und Key Vault zugreifen
- ✅ Identität bleibt bestehen, wenn ein Dienst gelöscht wird
- ✅ Zentrale Berechtigungsverwaltung

**Vorteile der benutzerzugewiesenen Identität:**
- Eine Identität zur Verwaltung
- Konsistente Berechtigungen über Dienste hinweg
- Überlebt das Löschen eines Dienstes
- Besser für komplexe Architekturen

**Zeit**: 30-40 Minuten

---

### Übung 3: Key Vault-Geheimnisrotation implementieren ⭐⭐⭐ (Fortgeschritten)

**Ziel**: Speichere API-Schlüssel von Drittanbietern im Key Vault und greife mit verwalteter Identität darauf zu

**Szenario**: Deine App muss eine externe API (OpenAI, Stripe, SendGrid) aufrufen, die API-Schlüssel erfordert.

**Schritte**:

1. **Key Vault mit RBAC erstellen:**

**Datei: `infra/core/keyvault.bicep`**

```bicep
param name string
param location string
param tags object = {}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    enableRbacAuthorization: true  // Use RBAC instead of access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
  }
}

// Allow Container App to read secrets
output id string = keyVault.id
output name string = keyVault.name
output uri string = keyVault.properties.vaultUri
```

2. **Geheimnisse im Key Vault speichern:**

```bash
# Holen Sie sich den Namen des Key Vault
KV_NAME=$(azd env get-values | grep AZURE_KEY_VAULT_NAME | cut -d '=' -f2 | tr -d '"')

# Drittanbieter-API-Schlüssel speichern
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-xxxxxxxxxxxxx"

az keyvault secret set \
  --vault-name $KV_NAME \
  --name "Stripe-ApiKey" \
  --value "sk_live_xxxxxxxxxxxxx"

az keyvault secret set \
  --vault-name $KV_NAME \
  --name "SendGrid-ApiKey" \
  --value "SG.xxxxxxxxxxxxx"
```

3. **Anwendungscode zum Abrufen von Geheimnissen:**

**Datei: `src/config.js`**

```javascript
const { DefaultAzureCredential } = require('@azure/identity');
const { SecretClient } = require('@azure/keyvault-secrets');

class Config {
  constructor() {
    this.credential = new DefaultAzureCredential();
    this.secretClient = new SecretClient(
      `https://${process.env.AZURE_KEY_VAULT_NAME}.vault.azure.net`,
      this.credential
    );
    this.cache = {};
  }

  async getSecret(secretName) {
    // Überprüfen Sie zuerst den Cache
    if (this.cache[secretName]) {
      return this.cache[secretName];
    }

    try {
      const secret = await this.secretClient.getSecret(secretName);
      this.cache[secretName] = secret.value;
      console.log(`✅ Retrieved secret: ${secretName}`);
      return secret.value;
    } catch (error) {
      console.error(`❌ Failed to get secret ${secretName}:`, error.message);
      throw error;
    }
  }

  async getOpenAIKey() {
    return this.getSecret('OpenAI-ApiKey');
  }

  async getStripeKey() {
    return this.getSecret('Stripe-ApiKey');
  }

  async getSendGridKey() {
    return this.getSecret('SendGrid-ApiKey');
  }
}

module.exports = new Config();
```

4. **Geheimnisse in der Anwendung verwenden:**

**Datei: `src/app.js`**

```javascript
const express = require('express');
const config = require('./config');
const { OpenAI } = require('openai');

const app = express();

// Initialisiere OpenAI mit Schlüssel aus dem Key Vault
let openaiClient;

async function initializeServices() {
  const openaiKey = await config.getOpenAIKey();
  openaiClient = new OpenAI({ apiKey: openaiKey });
  console.log('✅ Services initialized with secrets from Key Vault');
}

// Beim Start aufrufen
initializeServices().catch(console.error);

app.post('/chat', async (req, res) => {
  try {
    const completion = await openaiClient.chat.completions.create({
      model: 'gpt-4',
      messages: [{ role: 'user', content: 'Hello!' }]
    });
    
    res.json({
      response: completion.choices[0].message.content,
      authentication: 'Key from Key Vault via Managed Identity'
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(3000, () => {
  console.log('Secure API with Key Vault integration running');
});
```

5. **Bereitstellen und testen:**

```bash
azd up

# Testen, ob API-Schlüssel funktionieren
curl -X POST https://myapp.azurecontainerapps.io/chat \
  -H "Content-Type: application/json" \
  -d '{"message":"Hello AI"}'
```

**✅ Erfolgskriterien:**
- ✅ Keine API-Schlüssel im Code oder in Umgebungsvariablen
- ✅ Anwendung ruft Schlüssel aus dem Key Vault ab
- ✅ Drittanbieter-APIs funktionieren korrekt
- ✅ Schlüssel können ohne Codeänderungen rotiert werden

**Ein Geheimnis rotieren:**

```bash
# Geheimnis im Key Vault aktualisieren
az keyvault secret set \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --value "sk-proj-NEW_KEY_HERE"

# App neu starten, um neuen Schlüssel zu übernehmen
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

**Zeit**: 25-35 Minuten

---

## Wissensüberprüfung

### 1. Authentifizierungsmuster ✓

Teste dein Verständnis:

- [ ] **F1**: Was sind die drei Hauptauthentifizierungsmuster? 
  - **A**: Verbindungszeichenfolgen (Legacy), Key Vault-Referenzen (Übergang), Verwaltete Identität (Best Practice)

- [ ] **F2**: Warum ist verwaltete Identität besser als Verbindungszeichenfolgen?
  - **A**: Keine Geheimnisse im Code, automatische Rotation, vollständiger Audit-Trail, RBAC-Berechtigungen

- [ ] **F3**: Wann würdest du eine benutzerzugewiesene Identität anstelle einer systemzugewiesenen verwenden?
  - **A**: Wenn die Identität über mehrere Ressourcen geteilt wird oder der Lebenszyklus der Identität unabhängig von der Ressource ist

**Praktische Verifizierung:**
```bash
# Überprüfen Sie, welche Art von Identität Ihre App verwendet
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"

# Listen Sie alle Rollenzuweisungen für die Identität auf
az role assignment list \
  --assignee $(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
```

---

### 2. RBAC und Berechtigungen ✓

Teste dein Verständnis:

- [ ] **F1**: Was ist die Rollen-ID für "Storage Blob Data Contributor"?
  - **A**: `ba92f5b4-2d11-453d-a403-e96b0029c9fe`

- [ ] **F2**: Welche Berechtigungen bietet "Key Vault Secrets User"?
  - **A**: Nur-Lesezugriff auf Geheimnisse (kann keine erstellen, aktualisieren oder löschen)

- [ ] **F3**: Wie gewährt man einer Container-App Zugriff auf Azure SQL?
  - **A**: Zuweisung der Rolle "SQL DB Contributor" oder Konfiguration der Azure AD-Authentifizierung für SQL

**Praktische Verifizierung:**
```bash
# Finde spezifische Rolle
az role definition list --name "Storage Blob Data Contributor"

# Überprüfe, welche Rollen deiner Identität zugewiesen sind
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID --output table
```

---

### 3. Key Vault-Integration ✓

Teste dein Verständnis:
- [ ] **F1**: Wie aktiviert man RBAC für Key Vault anstelle von Zugriffsrichtlinien?
  - **A**: Setzen Sie `enableRbacAuthorization: true` in Bicep

- [ ] **F2**: Welche Azure SDK-Bibliothek kümmert sich um die Authentifizierung mit Managed Identity?
  - **A**: `@azure/identity` mit der Klasse `DefaultAzureCredential`

- [ ] **F3**: Wie lange bleiben Key Vault Secrets im Cache?
  - **A**: Abhängig von der Anwendung; implementieren Sie Ihre eigene Caching-Strategie

**Praktische Überprüfung:**
```bash
# Testen Sie den Zugriff auf Key Vault
az keyvault secret show \
  --vault-name $KV_NAME \
  --name "OpenAI-ApiKey" \
  --query "value"

# Überprüfen Sie, ob RBAC aktiviert ist
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Erwartet: wahr
```

---

## Sicherheitsbest Practices

### ✅ EMPFOHLEN:

1. **Verwenden Sie immer Managed Identity in der Produktion**
   ```bicep
   identity: {
     type: 'SystemAssigned'
   }
   ```

2. **Nutzen Sie RBAC-Rollen mit minimalen Berechtigungen**
   - Verwenden Sie "Reader"-Rollen, wenn möglich
   - Vermeiden Sie "Owner" oder "Contributor", es sei denn, es ist notwendig

3. **Speichern Sie Drittanbieter-Schlüssel im Key Vault**
   ```javascript
   const apiKey = await secretClient.getSecret('ThirdPartyApiKey');
   ```

4. **Aktivieren Sie Audit-Logging**
   ```bicep
   diagnosticSettings: {
     logs: [{ category: 'AuditEvent', enabled: true }]
   }
   ```

5. **Verwenden Sie unterschiedliche Identitäten für Entwicklung, Staging und Produktion**
   ```bash
   azd env new dev
   azd env new staging
   azd env new prod
   ```

6. **Rotieren Sie Secrets regelmäßig**
   - Legen Sie Ablaufdaten für Key Vault Secrets fest
   - Automatisieren Sie die Rotation mit Azure Functions

### ❌ NICHT EMPFOHLEN:

1. **Secrets niemals hartcodieren**
   ```javascript
   // ❌ SCHLECHT
   const apiKey = "sk-proj-xxxxxxxxxxxxx";
   ```

2. **Verwenden Sie keine Verbindungsstrings in der Produktion**
   ```javascript
   // ❌ SCHLECHT
   BlobServiceClient.fromConnectionString(process.env.STORAGE_CONNECTION_STRING)
   ```

3. **Gewähren Sie keine übermäßigen Berechtigungen**
   ```bicep
   // ❌ BAD - too much access
   roleDefinitionId: 'Owner'
   
   // ✅ GOOD - least privilege
   roleDefinitionId: 'Storage Blob Data Reader'
   ```

4. **Loggen Sie keine Secrets**
   ```javascript
   // ❌ SCHLECHT
   console.log('API Key:', apiKey);
   
   // ✅ GUT
   console.log('API Key retrieved successfully');
   ```

5. **Teilen Sie keine Produktionsidentitäten zwischen Umgebungen**
   ```bicep
   // ❌ BAD - same identity for dev and prod
   // ✅ GOOD - separate identities per environment
   ```

---

## Fehlerbehebung

### Problem: "Unauthorized" beim Zugriff auf Azure Storage

**Symptome:**
```
Error: Unauthorized (403)
AuthorizationPermissionMismatch: This request is not authorized to perform this operation
```

**Diagnose:**

```bash
# Überprüfen, ob die verwaltete Identität aktiviert ist
az containerapp show \
  --name myapp \
  --resource-group rg-myapp \
  --query "identity.type"
# ✅ Erwartet: "SystemAssigned" oder "UserAssigned"

# Überprüfen Sie die Rollen-Zuweisungen
PRINCIPAL_ID=$(az containerapp show --name myapp --resource-group rg-myapp --query "identity.principalId" -o tsv)
az role assignment list --assignee $PRINCIPAL_ID

# Erwartet: Sollte "Storage Blob Data Contributor" oder eine ähnliche Rolle sehen
```

**Lösungen:**

1. **Gewähren Sie die korrekte RBAC-Rolle:**
```bash
STORAGE_ID=$(az storage account show --name mystorageaccount --resource-group rg-myapp --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Storage Blob Data Contributor" \
  --scope $STORAGE_ID
```

2. **Warten Sie auf die Propagation (kann 5-10 Minuten dauern):**
```bash
# Überprüfen Sie den Status der Rollenvergabe
az role assignment list --assignee $PRINCIPAL_ID --scope $STORAGE_ID
```

3. **Überprüfen Sie, ob der Anwendungscode die korrekten Anmeldeinformationen verwendet:**
```javascript
// Stellen Sie sicher, dass Sie DefaultAzureCredential verwenden
const credential = new DefaultAzureCredential();
```

---

### Problem: Zugriff auf Key Vault verweigert

**Symptome:**
```
Error: Forbidden (403)
The user, group or application does not have secrets get permission
```

**Diagnose:**

```bash
# Überprüfen Sie, ob Key Vault RBAC aktiviert ist
az keyvault show \
  --name $KV_NAME \
  --query "properties.enableRbacAuthorization"
# ✅ Erwartet: wahr

# Überprüfen Sie Rollenzuweisungen
az role assignment list \
  --assignee $PRINCIPAL_ID \
  --scope /subscriptions/{sub-id}/resourceGroups/rg-myapp/providers/Microsoft.KeyVault/vaults/$KV_NAME
```

**Lösungen:**

1. **Aktivieren Sie RBAC für Key Vault:**
```bash
az keyvault update \
  --name $KV_NAME \
  --enable-rbac-authorization true
```

2. **Gewähren Sie die Rolle "Key Vault Secrets User":**
```bash
KV_ID=$(az keyvault show --name $KV_NAME --query "id" -o tsv)
az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Key Vault Secrets User" \
  --scope $KV_ID
```

---

### Problem: DefaultAzureCredential funktioniert lokal nicht

**Symptome:**
```
Error: DefaultAzureCredential failed to retrieve a token
CredentialUnavailableError: No credential available
```

**Diagnose:**

```bash
# Überprüfen Sie, ob Sie angemeldet sind
az account show

# Überprüfen Sie die Azure CLI-Authentifizierung
az ad signed-in-user show
```

**Lösungen:**

1. **Melden Sie sich bei der Azure CLI an:**
```bash
az login
```

2. **Setzen Sie das Azure-Abonnement:**
```bash
az account set --subscription "Your Subscription Name"
```

3. **Für lokale Entwicklung verwenden Sie Umgebungsvariablen:**
```bash
export AZURE_TENANT_ID="your-tenant-id"
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
```

4. **Oder verwenden Sie lokal eine andere Anmeldeinformation:**
```javascript
const { DefaultAzureCredential, AzureCliCredential } = require('@azure/identity');

// Verwenden Sie AzureCliCredential für lokale Entwicklung
const credential = process.env.NODE_ENV === 'production' 
  ? new DefaultAzureCredential()
  : new AzureCliCredential();
```

---

### Problem: Rollenzuweisung benötigt zu lange für die Propagation

**Symptome:**
- Rolle erfolgreich zugewiesen
- Immer noch 403-Fehler
- Sporadischer Zugriff (funktioniert manchmal, manchmal nicht)

**Erklärung:**
Änderungen an Azure RBAC können global 5-10 Minuten dauern.

**Lösung:**

```bash
# Warten und erneut versuchen
echo "Waiting for RBAC propagation..."
sleep 300  # Warten Sie 5 Minuten

# Zugriff testen
curl https://myapp.azurecontainerapps.io/upload

# Wenn es immer noch fehlschlägt, starten Sie die App neu
az containerapp revision restart \
  --name myapp \
  --resource-group rg-myapp
```

---

## Kostenüberlegungen

### Kosten für Managed Identity

| Ressource | Kosten |
|-----------|--------|
| **Managed Identity** | 🆓 **KOSTENLOS** - Keine Gebühren |
| **RBAC-Rollenzuweisungen** | 🆓 **KOSTENLOS** - Keine Gebühren |
| **Azure AD Token-Anfragen** | 🆓 **KOSTENLOS** - Inklusive |
| **Key Vault-Operationen** | $0.03 pro 10.000 Operationen |
| **Key Vault-Speicherung** | $0.024 pro Secret pro Monat |

**Managed Identity spart Geld durch:**
- ✅ Eliminierung von Key Vault-Operationen für Service-zu-Service-Authentifizierung
- ✅ Reduzierung von Sicherheitsvorfällen (keine geleakten Anmeldeinformationen)
- ✅ Verringerung des operativen Aufwands (keine manuelle Rotation)

**Beispiel Kostenvergleich (monatlich):**

| Szenario | Verbindungsstrings | Managed Identity | Einsparungen |
|----------|--------------------|------------------|--------------|
| Kleine App (1M Anfragen) | ~$50 (Key Vault + Operationen) | ~$0 | $50/Monat |
| Mittlere App (10M Anfragen) | ~$200 | ~$0 | $200/Monat |
| Große App (100M Anfragen) | ~$1,500 | ~$0 | $1,500/Monat |

---

## Mehr erfahren

### Offizielle Dokumentation
- [Azure Managed Identity](https://learn.microsoft.com/entra/identity/managed-identities-azure-resources/overview)
- [Azure RBAC](https://learn.microsoft.com/azure/role-based-access-control/overview)
- [Azure Key Vault](https://learn.microsoft.com/azure/key-vault/general/overview)
- [DefaultAzureCredential](https://learn.microsoft.com/dotnet/api/azure.identity.defaultazurecredential)

### SDK-Dokumentation
- [@azure/identity (Node.js)](https://www.npmjs.com/package/@azure/identity)
- [Azure.Identity (C#)](https://www.nuget.org/packages/Azure.Identity/)
- [azure-identity (Python)](https://pypi.org/project/azure-identity/)

### Nächste Schritte in diesem Kurs
- ← Vorherige: [Konfigurationsmanagement](configuration.md)
- → Nächste: [Erstes Projekt](first-project.md)
- 🏠 [Kursübersicht](../../README.md)

### Verwandte Beispiele
- [Azure OpenAI Chat Beispiel](../../../../examples/azure-openai-chat) - Verwendet Managed Identity für Azure OpenAI
- [Microservices Beispiel](../../../../examples/microservices) - Authentifizierungsmuster für mehrere Services

---

## Zusammenfassung

**Sie haben gelernt:**
- ✅ Drei Authentifizierungsmuster (Verbindungsstrings, Key Vault, Managed Identity)
- ✅ Wie man Managed Identity in AZD aktiviert und konfiguriert
- ✅ RBAC-Rollenzuweisungen für Azure-Dienste
- ✅ Key Vault-Integration für Drittanbieter-Secrets
- ✅ Benutzerzugewiesene vs. systemzugewiesene Identitäten
- ✅ Sicherheitsbest Practices und Fehlerbehebung

**Wichtige Erkenntnisse:**
1. **Verwenden Sie immer Managed Identity in der Produktion** - Keine Secrets, automatische Rotation
2. **Nutzen Sie RBAC-Rollen mit minimalen Berechtigungen** - Gewähren Sie nur notwendige Berechtigungen
3. **Speichern Sie Drittanbieter-Schlüssel im Key Vault** - Zentralisierte Geheimnisverwaltung
4. **Trennen Sie Identitäten pro Umgebung** - Isolation von Entwicklung, Staging und Produktion
5. **Aktivieren Sie Audit-Logging** - Verfolgen Sie, wer was zugegriffen hat

**Nächste Schritte:**
1. Schließen Sie die oben genannten praktischen Übungen ab
2. Migrieren Sie eine bestehende App von Verbindungsstrings zu Managed Identity
3. Erstellen Sie Ihr erstes AZD-Projekt mit Sicherheit von Anfang an: [Erstes Projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->