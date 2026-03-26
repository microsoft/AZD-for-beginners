# 5. Personnaliser un modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ CAPABLE DE"

    - [ ] Avoir exploré les capacités par défaut des agents IA
    - [ ] Ajouté la recherche IA avec votre propre index
    - [ ] Activé et analysé les métriques de traçage
    - [ ] Exécuté une évaluation
    - [ ] Effectué un scan de red-teaming
    - [ ] **Lab 5: Élaboration d'un plan de personnalisation** 

---

## 5.1 Capacités de l'agent IA

!!! success "Nous avons terminé cela dans le Lab 01"

- **Recherche de fichiers**: OpenAI's built-in file search for knowledge retrieval
- **Citations**: Attribution automatique des sources dans les réponses
- **Instructions personnalisables**: Modifier le comportement et la personnalité de l'agent
- **Intégration d'outils**: Système d'outils extensible pour des capacités personnalisées

---

## 5.2 Options de récupération des connaissances

!!! task "Pour accomplir ceci, nous devons apporter des modifications et redéployer"    
    
    ```bash title=""
    # Set environment variables
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Upload data and create my index

    ```

---

**OpenAI File Search (Default):**

- Intégré aux agents Foundry
- Traitement et indexation automatiques des documents
- Aucune configuration supplémentaire requise

**Azure AI Search (Optional):**

- Recherche hybride sémantique et vectorielle
- Gestion personnalisée des index
- Fonctionnalités de recherche avancées
- Nécessite `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Traçage & Surveillance](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Pour accomplir ceci, nous devons apporter des modifications et redéployer"    
    
    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Traçage:**

- Intégration OpenTelemetry
- Suivi des requêtes/réponses
- Indicateurs de performance
- Disponible dans le portail Microsoft Foundry

**Journalisation:**

- Journaux d'application dans Container Apps
- Journalisation structurée avec identifiants de corrélation
- Visualisation des journaux en temps réel et historiques

---

## 5.4 [Évaluation des agents](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Évaluation locale:**

- Évaluateurs intégrés pour l'évaluation de la qualité
- Scripts d'évaluation personnalisés
- Tests comparatifs de performances

**Surveillance continue:**

- Évaluation automatique des interactions en direct
- Suivi des métriques de qualité
- Détection des régressions de performance

**Intégration CI/CD:**

- Workflow GitHub Actions
- Tests et évaluations automatisés
- Tests de comparaison statistique

---

## 5.5 [Agent de red teaming IA](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red teaming IA:**

- Analyse de sécurité automatisée
- Évaluation des risques pour les systèmes d'IA
- Évaluation de sécurité sur plusieurs catégories

**Authentification:**

- Managed Identity pour les services Azure
- Authentification Azure App Service optionnelle
- Repli sur l'authentification de base pour le développement



!!! quote "À LA FIN DE CE LABO, VOUS DEVRIEZ AVOIR"
    - [ ] Définissez les exigences de votre scénario
    - [ ] Variables d'environnement personnalisées (config)
    - [ ] Instructions d'agent personnalisées (task)
    - [ ] Déployé le modèle personnalisé (app)
    - [ ] Terminé les tâches post-déploiement (manual)
    - [ ] Exécuté une évaluation de test

This example demonstrates customizing the template for an enterprise retail use case with two specialized agents and multiple model deployments.

---

## 5.6 Personnalisez-le pour vous !

### 5.6.1. Exigences du scénario

#### **Agent Deployments:** 

   - Shopper Agent: Aide les clients à trouver et comparer des produits
   - Loyalty Agent: Gère les récompenses et promotions des clients

#### **Model Deployments:**

   - `gpt-4.1`: Modèle de chat principal
   - `o3`: Modèle de raisonnement pour requêtes complexes
   - `gpt-4.1-nano`: Modèle léger pour interactions simples
   - `text-embedding-3-large`: Embeddings de haute qualité pour la recherche

#### **Features:**

   - Traçage et surveillance activés
   - AI Search pour le catalogue de produits
   - Cadre d'évaluation pour l'assurance qualité
   - Red teaming pour la validation de la sécurité

---

### 5.6.2 Mise en œuvre du scénario


#### 5.6.2.1. Configuration pré-déploiement

Create a setup script (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Définir le nom de l'environnement
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configurer la région (choisir en fonction de la disponibilité des modèles)
azd env set AZURE_LOCATION "eastus2"

# Activer tous les services optionnels
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configurer le modèle de chat principal (gpt-4.1 comme le plus proche disponible de gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4.1"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configurer le modèle d'embeddings pour une recherche améliorée
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Définir le nom de l'agent (créera le premier agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configurer l'index de recherche
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2: Instructions de l'agent

Create `custom-agents/shopper-agent-instructions.md`:

```markdown
# Shopper Agent Instructions

You are a helpful shopping assistant for an enterprise retail company. Your role is to:

1. **Product Discovery**: Help customers find products that match their needs
2. **Comparison**: Provide detailed product comparisons with pros/cons
3. **Recommendations**: Suggest complementary products and alternatives
4. **Inventory**: Check product availability and delivery options

## Guidelines:
- Always provide citations from the product catalog
- Be conversational and helpful
- Ask clarifying questions to understand customer needs
- Mention relevant promotions when appropriate
- Escalate complex warranty or return questions to human agents

## Knowledge Base:
You have access to our complete product catalog including specifications, pricing, reviews, and inventory levels.
```

Create `custom-agents/loyalty-agent-instructions.md`:

```markdown
# Loyalty Agent Instructions

You are a customer loyalty specialist focused on maximizing customer satisfaction and retention. Your responsibilities include:

1. **Rewards Management**: Explain point values, redemption options, and tier benefits
2. **Promotions**: Identify applicable discounts and special offers
3. **Program Navigation**: Help customers understand loyalty program features
4. **Account Support**: Assist with account-related questions and updates

## Guidelines:
- Prioritize customer satisfaction and retention
- Explain complex program rules in simple terms
- Proactively identify opportunities for customers to save money
- Celebrate customer milestones and achievements
- Connect customers with shopper agent for product questions

## Knowledge Base:
You have access to loyalty program rules, current promotions, customer tier information, and reward catalogs.
```

---

#### 5.6.2.3: Script de déploiement

Create `deploy-retail.sh`:

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Valider les prérequis
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Configurer l'environnement
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Vérifier le quota dans la région sélectionnée
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4.1: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Déployer l'infrastructure et l'application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capturer les sorties du déploiement
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Obtenir l'URL de l'application web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 Microsoft Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in Microsoft Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4: Configuration post-déploiement

Create `configure-retail-agents.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Obtenir des informations sur le déploiement
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructions pour la configuration manuelle
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to Microsoft Foundry portal: https://ai.azure.com
   - Navigate to your project
   - Select Agents tab
   - Edit the existing agent
   - Update instructions with content from custom-agents/shopper-agent-instructions.md

2. **Create Loyalty Agent:**
   - In Agents tab, click 'Create Agent'
   - Name: 'loyalty-agent'
   - Model: Use same deployment as shopper agent
   - Instructions: Use content from custom-agents/loyalty-agent-instructions.md
   - Enable file search tool
   - Save and note the Agent ID

3. **Upload Knowledge Base:**
   - Prepare product catalog files (JSON/CSV format)
   - Upload to both agents' file search
   - Or configure Azure AI Search index

4. **Test Configuration:**
   - Test shopper agent with product queries
   - Test loyalty agent with rewards questions
   - Verify citations and search functionality

📊 Monitoring Setup:
- Tracing: Available in Microsoft Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3: Tests et validation

Create `test-retail-deployment.sh`:

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Vérifier que les variables d'environnement sont définies
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Tester la disponibilité de l'application web
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')
if [ ! -z "$APP_URL" ]; then
    echo "🌐 Testing web application at: $APP_URL"
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✅ Web application is responding"
    else
        echo "❌ Web application returned status: $HTTP_STATUS"
    fi
else
    echo "❌ Could not retrieve web application URL"
fi

# Exécuter l'évaluation si elle est configurée
if [ -f "evals/evaluate.py" ]; then
    echo "📊 Running agent evaluation..."
    cd evals
    python -m pip install -r ../src/requirements.txt
    python -m pip install azure-ai-evaluation
    python evaluate.py
    cd ..
fi

echo "
🎯 Deployment validation complete!

Next steps:
1. Access the web application and test basic functionality
2. Create the second agent (Loyalty Agent) in Microsoft Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Résultats attendus

Après avoir suivi ce guide de mise en œuvre, vous aurez:

1. **Infrastructure déployée:**

      - Projet Microsoft Foundry avec déploiements de modèles
      - Container Apps hébergeant l'application web
      - Service AI Search pour le catalogue de produits
      - Application Insights pour la surveillance

2. **Agent initial:**

      - Shopper Agent configuré avec des instructions de base
      - Capacité de recherche de fichiers activée
      - Traçage et surveillance configurés

3. **Prêt pour la personnalisation:**

      - Cadre pour ajouter Loyalty Agent
      - Modèles d'instructions personnalisés
      - Scripts de tests et de validation
      - Configuration de la surveillance et de l'évaluation

4. **Prêt pour la production:**

      - Analyse de sécurité avec red teaming
      - Surveillance des performances
      - Cadre d'évaluation de la qualité
      - Architecture évolutive

This example demonstrates how the AZD template can be extended and customized for specific enterprise scenarios while maintaining best practices for security, monitoring, and scalability.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des imprécisions. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations cruciales, il est recommandé de recourir à une traduction professionnelle réalisée par un traducteur humain. Nous déclinons toute responsabilité pour tout malentendu ou toute mauvaise interprétation résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->