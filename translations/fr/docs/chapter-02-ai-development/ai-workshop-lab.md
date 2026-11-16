# Atelier IA : Rendre vos solutions IA déployables avec AZD  

**Navigation dans le chapitre :**  
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)  
- **📖 Chapitre actuel** : Chapitre 2 - Développement IA prioritaire  
- **⬅️ Précédent** : [Déploiement de modèles IA](ai-model-deployment.md)  
- **➡️ Suivant** : [Bonnes pratiques de production IA](../chapter-08-production/production-ai-practices.md)  
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)  

## Aperçu de l’atelier  

Ce laboratoire pratique guide les développeurs à travers le processus de prise d’un modèle IA existant et son déploiement en utilisant Azure Developer CLI (AZD). Vous apprendrez des modèles essentiels pour les déploiements IA en production en utilisant les services Microsoft Foundry.  

> **Revue de la version (2026-11-04) :** Les instructions de commandes AZD et les noms de configuration d’exemple ont été vérifiés avec la version `azd` `1.37.2` et la configuration actuelle de l’exemple lié. Il s’agit d’une révision de documentation, pas d’une validation de déploiement en direct. Le laboratoire RAG ne nécessite pas l’extension agent ; pour les évaluations d’agent, utilisez l’extension `azure.ai.evaluations` séparée et [le flux d’évaluation actuel](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), pas les commandes d’évaluation agent héritées.  

**Durée :** 2-3 heures  
**Niveau :** Intermédiaire  
**Prérequis :** Connaissances de base Azure, familiarité avec les concepts IA/ML  

## 🎓 Objectifs d’apprentissage  

À la fin de cet atelier, vous serez capable de :  
- ✅ Explorer un modèle AZD IA existant et planifier la conversion de votre propre application  
- ✅ Configurer les services Microsoft Foundry avec AZD  
- ✅ Mettre en œuvre une gestion sécurisée des identifiants pour les services IA  
- ✅ Déployer une application référence IA avec surveillance  
- ✅ Résoudre les problèmes courants de déploiement IA  

## Prérequis  

### Outils requis  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installé  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installé  
- [Git](https://git-scm.com/) installé  
- Éditeur de code (VS Code recommandé)  

Ces blocs de commande utilisent la syntaxe Bash (y compris les continuations de ligne et `grep`). Sous Windows, utilisez Git Bash/WSL ou traduisez-les en PowerShell. Installez également les outils de langage, gestionnaire de paquets et containers listés dans la [configuration locale de l’environnement d’exemple](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).  

### Ressources Azure  
- Abonnement Azure avec permissions de provisionnement de ressources et d’assignation de rôles (le rôle Contributeur seul ne peut pas créer d’assignations RBAC ; utilisez un administrateur de rôle autorisé ou l’équivalent documenté dans l’exemple)  
- Accès aux services Microsoft Foundry Models (ou capacité à demander l’accès)  
- Permissions de création de groupes de ressources  

### Connaissances préalables  
- Compréhension de base des services Azure  
- Familiarité avec les interfaces en ligne de commande  
- Concepts IA/ML de base (APIs, modèles, prompts)  

## Mise en place du laboratoire  

### Étape 1 : Préparation de l’environnement  

1. **Vérifiez l’installation des outils :**  
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```
  
Si vous travaillez sur plusieurs locataires ou si votre abonnement n’est pas détecté automatiquement, réessayez avec `azd auth login --tenant-id <tenant-id>`.  

2. **Clonez le dépôt de l’atelier :**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Module 1 : Comprendre la structure AZD pour les applications IA  

### Anatomie d’un modèle IA AZD  

Explorez les fichiers clés dans un modèle AZD prêt pour IA :  

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```
  
L’exemple extrait peut changer ; `.azure/` apparaît après l’initialisation de l’environnement, pas forcément dans un clonage neuf. Inspectez la copie réelle plutôt que de créer des répertoires manquants pour faire correspondre ce schéma.  

### **Exercice de laboratoire 1.1 : Explorer la configuration**  

1. **Examinez le fichier azure.yaml :**  
```bash
cat azure.yaml
```
  
**Ce qu’il faut rechercher :**  
- Définitions de service pour les composants IA  
- Mappages de variables d’environnement  
- Configurations d’hôte  

2. **Passez en revue l’infrastructure main.bicep :**  
```bash
cat infra/main.bicep
```
  
**Modèles IA clés à identifier :**  
- Provisionnement du service Microsoft Foundry Models  
- Intégration Azure AI Search  
- Gestion sécurisée des clés  
- Configurations de sécurité réseau  

### **Point de discussion : Pourquoi ces modèles sont importants pour l’IA**  

- **Dépendances de service** : les applications IA nécessitent souvent plusieurs services coordonnés  
- **Sécurité** : les clés API et points de terminaison doivent être gérés en toute sécurité  
- **Scalabilité** : les charges IA ont des exigences uniques de montée en charge  
- **Gestion des coûts** : les services IA peuvent être coûteux s’ils ne sont pas configurés correctement  

## Module 2 : Déployez votre première application IA  

### Étape 2.1 : Initialiser l’environnement  

1. **Créez un nouvel environnement AZD :**  
```bash
azd env new myai-workshop
```
  
2. **Définissez les paramètres requis :**  
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```
  
### Étape 2.2 : Déployez l’infrastructure et l’application  

1. **Déployez avec AZD :**  
```bash
azd up
```
  
**Ce qui se passe pendant `azd up` :**  
- ✅ Provisionne le service Microsoft Foundry Models  
- ✅ Crée le service Azure AI Search  
- ✅ Configure Azure Container Apps pour le backend et le frontend intégré (par défaut dans l’exemple actuel)  
- ✅ Configure le réseau et la sécurité  
- ✅ Déploie le code applicatif  
- ✅ Met en place la surveillance et la journalisation  

2. **Surveillez la progression du déploiement** et notez les ressources créées.  

### Étape 2.3 : Vérifiez votre déploiement  

1. **Vérifiez les ressources déployées :**  
```bash
azd show
```
  
2. **Ouvrez l’application déployée :**  
```bash
azd show
```
  
Ouvrez le point d’accès web affiché dans la sortie `azd show`.  

3. **Testez la fonctionnalité IA :**  
   - Accédez à l’application web  
   - Essayez des requêtes d’exemple  
   - Vérifiez que les réponses IA fonctionnent  

### **Exercice de laboratoire 2.1 : Pratique de résolution de problèmes**  

**Scénario** : Votre déploiement a réussi mais l’IA ne répond pas.  

**Problèmes courants à vérifier :**  
1. **Authentification** : Vérifiez l’identité gérée et les assignations de rôles ; ne vérifiez les clés API que si vous avez activé explicitement l’authentification par clé  
2. **Disponibilité du modèle** : Vérifiez si votre région supporte le modèle  
3. **Connectivité réseau** : Assurez-vous que les services peuvent communiquer  
4. **Permissions RBAC** : Vérifiez que l’application peut accéder à OpenAI  

**Commandes de débogage :**  
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Module 3 : Personnaliser les applications IA selon vos besoins  

### Étape 3.1 : Modifier la configuration IA  

1. **Mettez à jour le modèle OpenAI :**  
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```
  
2. **Ajoutez des services IA supplémentaires :**  

Modifiez `infra/main.bicep` pour ajouter Document Intelligence :  

Ce qui suit est un fragment illustratif, pas un modèle complet. L’exemple peut déjà provisionner des services de traitement de documents : inspectez son infrastructure actuelle avant d’ajouter des ressources en double. Les ajouts personnalisés nécessitent de connecter les sorties, identités et configuration applicative.  

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```
  
### Étape 3.2 : Configurations spécifiques à l’environnement  

**Bonne pratique** : configurations différentes pour développement et production.  

1. **Créez un environnement de production :**  
```bash
azd env new myai-production
```
  
2. **Définissez les paramètres spécifiques à la production :**  
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```
  
Ces noms proviennent du [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) de l’exemple. `azd env set` stocke une valeur mais ne rend pas une variable arbitraire effective : le modèle doit la consommer. Consultez le [guide d’isolation réseau](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) de l’exemple avant de désactiver l’accès public et utilisez `azd up` pour appliquer les modifications d’infrastructure. Le SKU OpenAI `S0` à lui seul ne détermine pas le débit du modèle ; le type et la capacité de déploiement importent aussi.  

### **Exercice de laboratoire 3.1 : Optimisation des coûts**  

**Défi** : Configurez le modèle pour un développement économique.  

**Tâches :**  
1. Sélectionnez l’environnement d’atelier jetable : `azd env select myai-workshop`.  
2. Notez le SKU Search actuel et la capacité du modèle depuis `infra/main.parameters.json` et l’environnement sélectionné.  
3. Utilisez les entrées supportées ci-dessous, après avoir confirmé le quota modèle/région :  
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Vérifiez le SKU Search et la capacité de déploiement dans le portail et estimez la différence avec le calculateur de prix. Ne vous attendez pas à une mise à jour immédiate des données de facturation.  

**Critères de réussite :** Search utilise Basic, le déploiement chat a la capacité supportée demandée, et l’application répond toujours à une question d’exemple. La capacité `10` est une allocation de limite de débit, pas une réduction du prix par jeton. Les changements de niveau Search peuvent être restreints ou nécessiter une recréation ; ne testez pas sur des ressources de production. F0 est spécifique au service et n’est pas un SKU Azure OpenAI.  

## Module 4 : Sécurité et bonnes pratiques de production  

### Étape 4.1 : Gestion sécurisée des identifiants  

**Défi actuel** : Beaucoup d’applications IA codent en dur les clés API ou utilisent un stockage non sécurisé.  

**Solution AZD** : Intégration Identité gérée + Key Vault.  

1. **Revue de la configuration de sécurité dans votre modèle :**  
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Vérifiez que l’Identité gérée fonctionne :**  
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```
  
### Étape 4.2 : Sécurité réseau  

1. **Activez les points de terminaison privés** en utilisant la configuration réseau prise en charge de l’exemple (si pas déjà configurée).  

Pour votre propre modèle, ce fragment illustratif montre la connexion au point de terminaison OpenAI. Il nécessite aussi un VNet, une configuration DNS privée et la connectivité applicative ; ne le collez pas tel quel dans l’exemple qui possède déjà des modules de point de terminaison privé :  
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
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
  
### Étape 4.3 : Surveillance et observabilité  

1. **Configurez Application Insights :**  
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```
  
2. **Activez l’intégration Application Insights de l’exemple :**  
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```
  
L’instrumentation de l’exemple émet de la télémétrie ; un paramètre `OPENAI_MONITOR_ENABLED` arbitraire n’active pas les métriques IA. Examinez les traces pour les appels au modèle, latence, échecs et utilisation des jetons, et évitez d’enregistrer des prompts ou réponses sensibles.  

### **Exercice de laboratoire 4.1 : Audit de sécurité**  

**Tâche** : Passez en revue votre déploiement pour les bonnes pratiques de sécurité.  

**Liste de contrôle :**  
- [ ] Aucun secret codé en dur dans le code ou la configuration  
- [ ] Identité gérée utilisée pour l’authentification service-à-service  
- [ ] Key Vault stocke la configuration sensible  
- [ ] L’accès réseau est correctement restreint  
- [ ] La surveillance et la journalisation sont activées  

## Module 5 : Conversion de votre propre application IA  

### Étape 5.1 : Fiche d’évaluation  

**Avant de convertir votre application**, répondez à ces questions :  

1. **Architecture de l’application :**  
   - Quels services IA votre application utilise-t-elle ?  
   - Quels sont les besoins en ressources de calcul ?  
   - A-t-elle besoin d’une base de données ?  
   - Quelles sont les dépendances entre services ?  

2. **Exigences de sécurité :**  
   - Quelles données sensibles votre application traite-t-elle ?  
   - Quelles sont vos exigences de conformité ?  
   - Avez-vous besoin de réseau privé ?  

3. **Exigences de mise à l’échelle :**  
   - Quelle est votre charge attendue ?  
   - Avez-vous besoin d’auto-scaling ?  
   - Y a-t-il des exigences régionales ?  

### Étape 5.2 : Créez votre modèle AZD  

**Suivez ce modèle pour convertir votre application :**  

**Scaffold uniquement :** Cette section ne fournit pas le code source API/application web, l’infrastructure d’hébergement, les déploiements de modèles, l’identité/RBAC, ni un `main.parameters.json` fini. Le Bicep scoped au groupe de ressources illustre la composition des modules ; un point d’entrée typique scoped à l’abonnement AZD doit créer un groupe de ressources et l’invoquer à cette échelle. Ne vous attendez pas à ce que `azd up` déploie une application complète après avoir copié ces fragments uniquement. Pour une base exécutable, continuez d’utiliser le modèle RAG du module 1.  

1. **Créez la structure de base :**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```
  
2. **Créez azure.yaml :**  
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```
  
3. **Créez les modèles d’infrastructure :**  

**infra/main.bicep** - Modèle principal :  
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```
  
**infra/modules/openai.bicep** - Module OpenAI :  
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```
  
### **Exercice de laboratoire 5.1 : Défi de création de modèle**  

**Défi :** Créez un modèle AZD pour une application IA de traitement de documents.  

**Exigences :**  
- Microsoft Foundry Models pour l’analyse de contenu  
- Document Intelligence pour OCR  
- Compte de stockage pour les téléchargements de documents  
- Function App pour la logique de traitement  
- Application web pour l’interface utilisateur  

**Points bonus :**  
- Ajoutez une gestion appropriée des erreurs  
- Incluez une estimation des coûts  
- Configurez des tableaux de bord de surveillance  

## Module 6 : Résolution des problèmes courants  

### Problèmes fréquents de déploiement  

#### Problème 1 : Quota de service OpenAI dépassé  
**Symptômes :** Échec du déploiement avec erreur de quota  
**Solutions :**  
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Problème 2 : Modèle non disponible dans la région  
**Symptômes :** Réponses IA échouent ou erreurs de déploiement de modèle  
**Solutions :**  
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```
  
#### Problème 3 : Problèmes de permission  
**Symptômes :** Erreurs 403 Forbidden lors des appels aux services IA  
**Solutions :**  
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### Problèmes de performance  

#### Problème 4 : Réponses IA lentes  
**Étapes d’investigation :**  
1. Vérifiez Application Insights pour les métriques de performance  
2. Passez en revue les métriques du service OpenAI dans le portail Azure  
3. Vérifiez la connectivité réseau et la latence  

**Solutions :**  
- Mettez en œuvre la mise en cache pour les requêtes courantes  
- Utilisez le modèle OpenAI approprié à votre cas d’usage  
- Échelonnez les réplicas de l’application uniquement après avoir vérifié les limites RPM/TPM du modèle ; les déploiements Azure OpenAI ne proposent pas de réglage générique type « read replica » de base de données  

### **Exercice de laboratoire 6.1 : Défi de débogage**  

**Scénario :** Votre déploiement a réussi, mais l’application renvoie des erreurs 500.  

**Tâches de débogage :**  
1. Vérifiez les journaux applicatifs  
2. Vérifiez la connectivité des services  
3. Tester l'authentification
4. Vérifier la configuration

**Outils à utiliser :**
- `azd show` pour la vue d'ensemble du déploiement
- Portail Azure pour les journaux détaillés des services
- Application Insights pour la télémétrie des applications

## Module 7 : Surveillance et optimisation

### Étape 7.1 : Configurer une surveillance complète

1. **Créer des tableaux de bord personnalisés :**

Accédez au portail Azure et créez un tableau de bord avec :
- Comptage et latence des requêtes OpenAI
- Taux d'erreurs applicatives
- Utilisation des ressources
- Suivi des coûts

2. **Configurer des alertes :**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Vérifiez que le composant émet la télémétrie des requêtes et ajoutez un groupe d'actions si des notifications sont requises. La métrique est un comptage, pas un pourcentage d'échec ; une alerte de taux nécessite une requête adaptée et un dénominateur.

### Étape 7.2 : Optimisation des coûts

1. **Analyser les coûts actuels :**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Remplacez les espaces réservés de date. Le support de l'API de consommation varie selon le contrat de facturation ; utilisez Cost Management dans le portail si les détails d'utilisation ne sont pas disponibles. Les coûts sont retardés, ce n'est pas un oracle de test en temps réel.

2. **Mettre en œuvre des contrôles des coûts :**
- Configurer des alertes budgétaires
- Utiliser des politiques d'autoscaling
- Mettre en place la mise en cache des requêtes
- Surveiller l'utilisation des jetons pour OpenAI

### **Exercice pratique 7.1 : Optimisation des performances**

**Tâche** : Optimisez votre application IA à la fois pour la performance et le coût.

**Indicateurs à améliorer :**
- Réduire le temps de réponse moyen de 20 %
- Réduire les coûts mensuels de 15 %
- Définir un SLO de disponibilité à 99,9 % et une fenêtre de mesure (un court laboratoire ne peut pas démontrer la disponibilité mensuelle)

**Stratégies à essayer :**
- Mettre en œuvre la mise en cache des réponses
- Optimiser les invites pour l'efficacité des jetons
- Utiliser les SKUs de calcul appropriés
- Configurer un autoscaling adéquat

## Défi final : Mise en œuvre de bout en bout

### Scénario du défi

Il s'agit d'un **défi optionnel d'architecture/conception**, pas d'un exercice exécutable fourni ni d'une certification de production. Proposez un chatbot de service client alimenté par IA et documentez quelles exigences nécessitent une mise en œuvre et des preuves supplémentaires :

**Exigences fonctionnelles :**
- Interface web pour les interactions clients
- Intégration avec Microsoft Foundry Models pour les réponses
- Fonction de recherche documentaire avec Azure AI Search
- Intégration à la base de données clients existante
- Support multilingue

**Exigences non fonctionnelles :**
- Gérer 1000 utilisateurs simultanés
- SLA de disponibilité de 99,9 %
- Conformité SOC 2
- Coût inférieur à 500 $/mois
- Déployer sur plusieurs environnements (dev, staging, prod)

Ce sont des contraintes hypothétiques des parties prenantes, pas des résultats garantis simultanément. Définissez le taux de requêtes, les tailles d'invite/sortie, et la durée de session avant d'estimer les coûts ; 1 000 utilisateurs simultanés ne définissent pas une charge de travail ni ne prouvent qu'un budget de 500 $ est faisable. SOC 2 est un résultat d'audit organisationnel, pas un interrupteur activé par un modèle AZD. Identifiez les compromis et rejetez les contraintes irréalisables avec des preuves.

### Étapes de mise en œuvre

1. **Concevoir l'architecture**
2. **Créer le modèle AZD**
3. **Mettre en œuvre les mesures de sécurité**
4. **Configurer la surveillance et les alertes**
5. **Créer les pipelines de déploiement**
6. **Documenter la solution**

### Critères d'évaluation

- ✅ **Fonctionnalité** : Les capacités mises en œuvre sont-elles démontrées et les lacunes restantes explicites ?
- ✅ **Sécurité** : Les meilleures pratiques sont-elles mises en œuvre ?
- ✅ **Scalabilité** : Peut-elle gérer la charge ?
- ✅ **Maintenabilité** : Le code et l'infrastructure sont-ils bien organisés ?
- ✅ **Coût** : Reste-t-il dans le budget ?

## Ressources supplémentaires

### Documentation Microsoft
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentation Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentation Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Modèles d'exemple
- [Application de chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ressources communautaires
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Point de vérification de la complétion

Félicitations ! Vous avez terminé le laboratoire de l'atelier IA. Vous devriez maintenant être capable de :

- ✅ Expliquer comment adapter une application IA existante à un modèle AZD
- ✅ Déployer et tester une application de référence IA
- ✅ Mettre en œuvre les meilleures pratiques de sécurité pour les charges de travail IA
- ✅ Surveiller et optimiser les performances des applications IA
- ✅ Résoudre les problèmes courants de déploiement

**Nettoyage :** Exécutez `azd env list`, sélectionnez chaque environnement jetable créé dans ce laboratoire (`myai-workshop`, et si déployé `myai-production`/`myai-quota-test`), et exécutez `azd down` dans chacun. Passez en revue le plan de suppression ; supprimer seulement la configuration locale d'un environnement ne supprime pas les ressources Azure. Évitez `--purge` sauf si vous comprenez la suppression irréversible des ressources supprimées temporairement.

### Prochaines étapes
1. Appliquez ces modèles à vos propres projets IA
2. Contribuez des modèles à la communauté
3. Rejoignez le Discord Microsoft Foundry pour un support continu
4. Explorez des sujets avancés comme les déploiements multi-régions

---

**Retour sur l'atelier** : Aidez-nous à améliorer cet atelier en partageant votre expérience dans le [canal #Azure du Discord Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement orienté IA
- **⬅️ Précédent** : [Déploiement de modèle IA](ai-model-deployment.md)
- **➡️ Suivant** : [Meilleures pratiques IA en production](../chapter-08-production/production-ai-practices.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d’aide ?** Rejoignez notre communauté pour du support et des discussions sur AZD et les déploiements IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->