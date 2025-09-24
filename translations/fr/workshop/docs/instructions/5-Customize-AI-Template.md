<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "60caadc3b57dccb9e6c413b5ccace90b",
  "translation_date": "2025-09-24T09:08:44+00:00",
  "source_file": "workshop/docs/instructions/5-Customize-AI-Template.md",
  "language_code": "fr"
}
-->
# 5. Personnaliser un modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ EN MESURE DE"

    - [ ] Explorer les capacités par défaut de l'agent IA
    - [ ] Ajouter une recherche IA avec votre propre index
    - [ ] Activer et analyser les métriques de traçage
    - [ ] Exécuter un test d'évaluation
    - [ ] Réaliser une analyse de sécurité (red-teaming)
    - [ ] **Lab 5 : Élaborer un plan de personnalisation**

---

## 5.1 Capacités de l'agent IA

!!! success "Nous avons complété cela dans le Lab 01"

- **Recherche de fichiers** : Recherche intégrée d'OpenAI pour la récupération de connaissances
- **Citations** : Attribution automatique des sources dans les réponses
- **Instructions personnalisables** : Modifier le comportement et la personnalité de l'agent
- **Intégration d'outils** : Système extensible pour des capacités personnalisées

---

## 5.2 Options de récupération de connaissances

!!! task "Pour compléter cela, nous devons apporter des modifications et redéployer"

    ```bash title=""
    # Définir les variables d'environnement
    azd env set USE_AZURE_AI_SEARCH_SERVICE true
    azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
    azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75
    azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

    # Télécharger les données et créer mon index

    ```

---

**Recherche de fichiers OpenAI (par défaut) :**

- Intégré au service Azure AI Agent
- Traitement et indexation automatiques des documents
- Aucune configuration supplémentaire requise

**Recherche Azure AI (optionnelle) :**

- Recherche hybride sémantique et vectorielle
- Gestion d'index personnalisés
- Capacités de recherche avancées
- Nécessite `USE_AZURE_AI_SEARCH_SERVICE=true`

---

## 5.3 [Traçage et surveillance](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#tracing-and-monitoring)

!!! task "Pour compléter cela, nous devons apporter des modifications et redéployer"

    ```bash title=""
    azd env set ENABLE_AZURE_MONITOR_TRACING true
    azd deploy
    ```

**Traçage :**

- Intégration OpenTelemetry
- Suivi des requêtes/réponses
- Métriques de performance
- Disponible dans le portail AI Foundry

**Journalisation :**

- Journaux d'application dans Container Apps
- Journalisation structurée avec des identifiants de corrélation
- Visualisation des journaux en temps réel et historiques

---

## 5.4 [Évaluation de l'agent](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#agent-evaluation)

**Évaluation locale :**

- Évaluateurs intégrés pour l'évaluation de la qualité
- Scripts d'évaluation personnalisés
- Tests de performance

**Surveillance continue :**

- Évaluation automatique des interactions en direct
- Suivi des métriques de qualité
- Détection des régressions de performance

**Intégration CI/CD :**

- Workflow GitHub Actions
- Tests et évaluations automatisés
- Tests de comparaison statistique

---

## 5.5 [Agent de sécurité IA (Red Teaming)](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/other_features.md#ai-red-teaming-agent)

**Red Teaming IA :**

- Analyse de sécurité automatisée
- Évaluation des risques pour les systèmes IA
- Validation de la sécurité dans plusieurs catégories

**Authentification :**

- Identité gérée pour les services Azure
- Authentification optionnelle via Azure App Service
- Authentification basique en mode développement

!!! quote "À LA FIN DE CE LAB, VOUS DEVREZ AVOIR"
    - [ ] Défini les exigences de votre scénario
    - [ ] Personnalisé les variables d'environnement (configuration)
    - [ ] Personnalisé les instructions de l'agent (tâche)
    - [ ] Déployé le modèle personnalisé (application)
    - [ ] Complété les tâches post-déploiement (manuel)
    - [ ] Réalisé un test d'évaluation

Cet exemple montre comment personnaliser le modèle pour un cas d'utilisation dans le commerce de détail avec deux agents spécialisés et plusieurs déploiements de modèles.

---

## 5.6 Personnalisez-le pour vous !

### 5.6.1. Exigences du scénario

#### **Déploiements d'agents :**

   - Agent Acheteur : Aide les clients à trouver et comparer des produits
   - Agent Fidélité : Gère les récompenses et promotions des clients

#### **Déploiements de modèles :**

   - `gpt-4.1` : Modèle principal de conversation
   - `o3` : Modèle de raisonnement pour les requêtes complexes
   - `gpt-4.1-nano` : Modèle léger pour les interactions simples
   - `text-embedding-3-large` : Embeddings de haute qualité pour la recherche

#### **Fonctionnalités :**

   - Traçage et surveillance activés
   - Recherche IA pour le catalogue de produits
   - Cadre d'évaluation pour l'assurance qualité
   - Red teaming pour la validation de sécurité

---

### 5.6.2 Mise en œuvre du scénario

#### 5.6.2.1. Configuration pré-déploiement

Créer un script de configuration (`setup-retail.sh`)

```bash title="" linenums="0"
#!/bin/bash

# Set environment name
azd env set AZURE_ENV_NAME "retail-ai-agents"

# Configure region (choose based on model availability)
azd env set AZURE_LOCATION "eastus2"

# Enable all optional services
azd env set USE_APPLICATION_INSIGHTS true
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Configure primary chat model (gpt-4o as closest available to gpt-4.1)
azd env set AZURE_AI_AGENT_MODEL_NAME "gpt-4o"
azd env set AZURE_AI_AGENT_MODEL_FORMAT "OpenAI"
azd env set AZURE_AI_AGENT_DEPLOYMENT_NAME "chat-primary"
azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150

# Configure embedding model for enhanced search
azd env set AZURE_AI_EMBED_MODEL_NAME "text-embedding-3-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_NAME "embeddings-large"
azd env set AZURE_AI_EMBED_DEPLOYMENT_CAPACITY 75

# Set agent name (will create first agent)
azd env set AZURE_AI_AGENT_NAME "shopper-agent"

# Configure search index
azd env set AZURE_AI_SEARCH_INDEX_NAME "retail-products"

echo "Environment configured for retail deployment"
echo "Recommended quota: 300,000+ TPM across all models"
```

---

#### 5.6.2.2 : Instructions de l'agent

Créer `custom-agents/shopper-agent-instructions.md` :

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

Créer `custom-agents/loyalty-agent-instructions.md` :

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

#### 5.6.2.3 : Script de déploiement

Créer `deploy-retail.sh` :

```bash title="" linenums="0"
#!/bin/bash
set -e

echo "🚀 Starting Enterprise Retail AI Agents deployment..."

# Validate prerequisites
echo "📋 Validating prerequisites..."
if ! command -v azd &> /dev/null; then
    echo "❌ Azure Developer CLI (azd) is required"
    exit 1
fi

if ! az account show &> /dev/null; then
    echo "❌ Please login to Azure CLI: az login"
    exit 1
fi

# Set up environment
echo "🔧 Configuring deployment environment..."
chmod +x setup-retail.sh
./setup-retail.sh

# Check quota in selected region
echo "📊 Checking quota availability..."
LOCATION=$(azd env get-values | grep AZURE_LOCATION | cut -d'=' -f2 | tr -d '"')
echo "Deploying to region: $LOCATION"
echo "⚠️  Please verify you have 300,000+ TPM quota for:"
echo "   - gpt-4o: 150,000 TPM"
echo "   - text-embedding-3-large: 75,000 TPM"
echo "   - Additional models: 75,000+ TPM"

read -p "Continue with deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 1
fi

# Deploy infrastructure and application
echo "🏗️  Deploying Azure infrastructure..."
azd up

# Capture deployment outputs
echo "📝 Capturing deployment information..."
azd show > deployment-info.txt

# Get the web app URL
APP_URL=$(azd show --output json | jq -r '.services.api_and_frontend.project.target.url // empty')

if [ ! -z "$APP_URL" ]; then
    echo "✅ Deployment completed successfully!"
    echo "🌐 Web Application: $APP_URL"
    echo "🔍 Azure Portal: Run 'azd show' for resource group link"
    echo "📊 AI Foundry Portal: https://ai.azure.com"
else
    echo "⚠️  Deployment completed but unable to retrieve URL"
    echo "Run 'azd show' for deployment details"
fi

echo "📚 Next steps:"
echo "1. Create second agent (Loyalty Agent) in AI Foundry portal"
echo "2. Upload product catalog to search index"
echo "3. Configure custom agent instructions"
echo "4. Test both agents with sample queries"
```

---

#### 5.6.2.4 : Configuration post-déploiement

Créer `configure-retail-agents.sh` :

```bash title="" linenums="0"
#!/bin/bash

echo "🔧 Configuring retail agents..."

# Get deployment information
PROJECT_ENDPOINT=$(azd env get-values | grep AZURE_EXISTING_AIPROJECT_ENDPOINT | cut -d'=' -f2 | tr -d '"')
AGENT_ID=$(azd env get-values | grep AZURE_EXISTING_AGENT_ID | cut -d'=' -f2 | tr -d '"')

echo "Project Endpoint: $PROJECT_ENDPOINT"
echo "Primary Agent ID: $AGENT_ID"

# Instructions for manual configuration
echo "
🤖 Agent Configuration:

1. **Update Shopper Agent Instructions:**
   - Go to AI Foundry portal: https://ai.azure.com
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
- Tracing: Available in AI Foundry > Tracing tab
- Logs: Azure Portal > Container Apps > Monitoring > Log Stream
- Evaluation: Run python evals/evaluate.py

🔒 Security Validation:
- Run red teaming: python airedteaming/ai_redteaming.py
- Review security recommendations
- Configure authentication if needed
"
```

### 5.6.3 : Tests et validation

Créer `test-retail-deployment.sh` :

```bash title="" linenums="0"
#!/bin/bash

echo "🧪 Testing retail deployment..."

# Verify environment variables are set
echo "📋 Checking environment configuration..."
azd env get-values | grep -E "(AZURE_AI_|USE_|ENABLE_)"

# Test web application availability
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

# Run evaluation if configured
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
2. Create the second agent (Loyalty Agent) in AI Foundry portal
3. Upload your product catalog and loyalty program data
4. Configure agent instructions for your specific use case
5. Run comprehensive testing with your retail scenarios
"
```

---

### 5.6.4 Résultats attendus

Après avoir suivi ce guide de mise en œuvre, vous aurez :

1. **Infrastructure déployée :**

      - Projet AI Foundry avec déploiements de modèles
      - Container Apps hébergeant l'application web
      - Service de recherche IA pour le catalogue de produits
      - Application Insights pour la surveillance

2. **Agent initial :**

      - Agent Acheteur configuré avec des instructions de base
      - Fonctionnalité de recherche de fichiers activée
      - Traçage et surveillance configurés

3. **Prêt pour la personnalisation :**

      - Cadre pour ajouter l'Agent Fidélité
      - Modèles d'instructions personnalisés
      - Scripts de test et validation
      - Configuration de surveillance et d'évaluation

4. **Prêt pour la production :**

      - Analyse de sécurité avec red teaming
      - Surveillance de la performance
      - Cadre d'évaluation de la qualité
      - Architecture évolutive

Cet exemple montre comment le modèle AZD peut être étendu et personnalisé pour des scénarios d'entreprise spécifiques tout en respectant les meilleures pratiques en matière de sécurité, de surveillance et de scalabilité.

---

