# 3. Déconstruire un modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ CAPABLE DE"

    - [ ] Activer GitHub Copilot avec les serveurs MCP pour l'assistance Azure
    - [ ] Comprendre la structure des dossiers et les composants du modèle AZD
    - [ ] Explorer les modèles d'organisation de l'infrastructure en tant que code (Bicep)
    - [ ] **Lab 3:** Utiliser GitHub Copilot pour explorer et comprendre l'architecture du dépôt 

---


Avec les templates AZD et l'Azure Developer CLI (`azd`) nous pouvons rapidement démarrer notre parcours de développement IA avec des dépôts standardisés qui fournissent du code d'exemple, l'infrastructure et des fichiers de configuration - sous la forme d'un projet _projet de démarrage_ prêt à être déployé.

**Mais maintenant, nous devons comprendre la structure du projet et la base de code - et être capables de personnaliser le template AZD - sans aucune expérience ou compréhension préalable d'AZD !**

---

## 1. Activer GitHub Copilot

### 1.1 Installer GitHub Copilot Chat

Il est temps d'explorer [GitHub Copilot en mode Agent](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Désormais, nous pouvons utiliser le langage naturel pour décrire notre tâche à un niveau élevé, et obtenir de l'aide pour l'exécution. Pour ce laboratoire, nous utiliserons le [Copilot Free plan](https://github.com/github-copilot/signup) qui comporte une limite mensuelle pour les complétions et les interactions de chat.

L'extension peut être installée depuis le marketplace, mais devrait déjà être disponible dans votre environnement Codespaces. _Cliquez sur `Open Chat` dans le menu déroulant de l'icône Copilot - et tapez une invite comme `What can you do?`_ - il se peut que l'on vous demande de vous connecter. **GitHub Copilot Chat est prêt**.

### 1.2. Installer les serveurs MCP

Pour que le mode Agent soit efficace, il a besoin d'accéder aux bons outils pour l'aider à récupérer des connaissances ou effectuer des actions. C'est là que les serveurs MCP peuvent aider. Nous configurerons les serveurs suivants :

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Pour les activer :

1. Créez un fichier appelé `.vscode/mcp.json` s'il n'existe pas
1. Copiez ce qui suit dans ce fichier - puis démarrez les serveurs !
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Vous pouvez obtenir une erreur indiquant que `npx` n'est pas installé (cliquez pour développer la solution)"

      Pour corriger cela, ouvrez le fichier `.devcontainer/devcontainer.json` et ajoutez cette ligne à la section features. Ensuite, reconstruisez le conteneur. Vous devriez maintenant avoir `npx` installé.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Tester GitHub Copilot Chat

**Tout d'abord, utilisez `az login` pour vous authentifier auprès d'Azure depuis la ligne de commande VS Code.**

Vous devriez maintenant pouvoir interroger l'état de votre abonnement Azure, et poser des questions sur les ressources déployées ou la configuration. Essayez ces invites :

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Vous pouvez également poser des questions sur la documentation Azure et obtenir des réponses basées sur le serveur MCP Microsoft Docs. Essayez ces invites :

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ou vous pouvez demander des extraits de code pour accomplir une tâche. Essayez cette invite.

1. `Give me a Python code example that uses AAD for an interactive chat client`

En mode `Ask`, cela fournira du code que vous pourrez copier-coller et essayer. En mode `Agent`, cela peut aller plus loin et créer les ressources pertinentes pour vous - y compris des scripts d'installation et de la documentation - pour vous aider à exécuter cette tâche.

**Vous êtes maintenant prêt à commencer à explorer le dépôt de templates**

---

## 2. Déconstruire l'architecture

??? prompt "DEMANDE : Expliquez l'architecture de l'application dans docs/images/architecture.png en 1 paragraphe"

      Cette application est une application de chat alimentée par l'IA construite sur Azure qui démontre une architecture moderne basée sur des agents. La solution s'articule autour d'une Azure Container App qui héberge le code principal de l'application, qui traite les entrées utilisateur et génère des réponses intelligentes via un agent IA.
      
      L'architecture s'appuie sur Microsoft Foundry Project comme fondation pour les capacités d'IA, en se connectant aux Azure AI Services qui fournissent les modèles de langage sous-jacents (tels que gpt-4.1-mini) et les fonctionnalités d'agent. Les interactions utilisateur transitent d'un frontend basé sur React vers un backend FastAPI qui communique avec le service d'agent IA pour générer des réponses contextuelles.
      
      Le système intègre des capacités de récupération de connaissances via la recherche de fichiers ou le service Azure AI Search, permettant à l'agent d'accéder et de citer des informations provenant de documents téléchargés. Pour l'excellence opérationnelle, l'architecture inclut une surveillance complète via Application Insights et Log Analytics Workspace pour le traçage, la journalisation et l'optimisation des performances.
      
      Azure Storage fournit le stockage blob pour les données d'application et les téléchargements de fichiers, tandis que Managed Identity assure un accès sécurisé entre les ressources Azure sans stocker de crédentiels. L'ensemble de la solution est conçu pour la scalabilité et la maintenabilité, l'application conteneurisée s'adaptant automatiquement en fonction de la demande tout en offrant des fonctionnalités de sécurité, de surveillance et de CI/CD intégrées via l'écosystème de services managés d'Azure.

![Architecture](../../../../../translated_images/fr/architecture.48d94861e6e6cdc0.webp)

---

## 3. Structure du dépôt

!!! prompt "DEMANDE : Expliquez la structure des dossiers du modèle. Commencez par un diagramme hiérarchique visuel."

??? info "RÉPONSE : Diagramme hiérarchique visuel"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Azure Developer CLI configuration
      │   ├── docker-compose.yaml           # Local development containers
      │   ├── pyproject.toml                # Python project configuration
      │   ├── requirements-dev.txt          # Development dependencies
      │   └── .devcontainer/                # VS Code dev container setup
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Main infrastructure template
      │   ├── api.bicep                     # API-specific resources
      │   ├── main.parameters.json          # Infrastructure parameters
      │   └── core/                         # Modular infrastructure components
      │       ├── ai/                       # AI service configurations
      │       ├── host/                     # Hosting infrastructure
      │       ├── monitor/                  # Monitoring and logging
      │       ├── search/                   # Azure AI Search setup
      │       ├── security/                 # Security and identity
      │       └── storage/                  # Storage account configs
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # FastAPI application entry
      │   │   ├── routes.py                 # API route definitions
      │   │   ├── search_index_manager.py   # Search functionality
      │   │   ├── data/                     # API data handling
      │   │   ├── static/                   # Static web assets
      │   │   └── templates/                # HTML templates
      │   ├── frontend/                     # React/TypeScript frontend
      │   │   ├── package.json              # Node.js dependencies
      │   │   ├── vite.config.ts            # Vite build configuration
      │   │   └── src/                      # Frontend source code
      │   ├── data/                         # Sample data files
      │   │   └── embeddings.csv            # Pre-computed embeddings
      │   ├── files/                        # Knowledge base files
      │   │   ├── customer_info_*.json      # Customer data samples
      │   │   └── product_info_*.md         # Product documentation
      │   ├── Dockerfile                    # Container configuration
      │   └── requirements.txt              # Python dependencies
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Post-deployment setup
      │   ├── setup_credential.sh/.ps1     # Credential configuration
      │   ├── validate_env_vars.sh/.ps1    # Environment validation
      │   └── resolve_model_quota.sh/.ps1  # Model quota management
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Unit and integration tests
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Agent evaluation framework
      │   │   ├── evaluate.py               # Evaluation runner
      │   │   ├── eval-queries.json         # Test queries
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Development playground
      │   │   ├── 1-quickstart.py           # Getting started examples
      │   │   └── aad-interactive-chat.py   # Authentication examples
      │   └── airedteaming/                 # AI safety evaluation
      │       └── ai_redteaming.py          # Red team testing
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Deployment guide
      │   ├── local_development.md          # Local setup instructions
      │   ├── troubleshooting.md            # Common issues & fixes
      │   ├── azure_account_setup.md        # Azure prerequisites
      │   └── images/                       # Documentation assets
      │
      └── 📄 Project Metadata
         ├── README.md                     # Project overview
         ├── CODE_OF_CONDUCT.md           # Community guidelines
         ├── CONTRIBUTING.md              # Contribution guide
         ├── LICENSE                      # License terms
         └── next-steps.md                # Post-deployment guidance
      ```

### 3.1. Architecture principale de l'application

Ce modèle suit un schéma d'application web **full-stack** avec :

- **Backend** : Python FastAPI avec intégration Azure AI
- **Frontend** : TypeScript/React avec le système de build Vite
- **Infrastructure** : Templates Azure Bicep pour les ressources cloud
- **Containerisation** : Docker pour un déploiement cohérent

### 3.2 Infrastructure en tant que code (Bicep)

La couche infrastructure utilise des templates **Azure Bicep** organisés de manière modulaire :

   - **`main.bicep`** : Orchestre toutes les ressources Azure
   - **`core/` modules** : Composants réutilisables pour différents services
      - Services AI (Microsoft Foundry Models, AI Search)
      - Hébergement des conteneurs (Azure Container Apps)
      - Surveillance (Application Insights, Log Analytics)
      - Sécurité (Key Vault, Managed Identity)

### 3.3 Source de l'application (`src/`)

**Backend API (`src/api/`)** :

- API REST basée sur FastAPI
- Intégration des agents Foundry
- Gestion des index de recherche pour la récupération de connaissances
- Fonctionnalités de téléchargement et de traitement de fichiers

**Frontend (`src/frontend/`)** :

- SPA moderne React/TypeScript
- Vite pour un développement rapide et des builds optimisés
- Interface de chat pour les interactions avec l'agent

**Base de connaissances (`src/files/`)** :

- Exemples de données clients et produits
- Démontre la récupération de connaissances à partir de fichiers
- Exemples aux formats JSON et Markdown


### 3.4 DevOps et automatisation

**Scripts (`scripts/`)** :

- Scripts PowerShell et Bash multiplateformes
- Validation et configuration de l'environnement
- Configuration post-déploiement
- Gestion des quotas de modèles

**Intégration Azure Developer CLI** :

- Configuration `azure.yaml` pour les workflows `azd`
- Provisionnement et déploiement automatisés
- Gestion des variables d'environnement

### 3.5 Tests et assurance qualité

**Framework d'évaluation (`evals/`)** :

- Évaluation des performances des agents
- Tests de qualité des réponses aux requêtes
- Pipeline d'évaluation automatisé

**Sécurité IA (`airedteaming/`)** :

- Tests de red team pour la sécurité IA
- Analyse des vulnérabilités de sécurité
- Pratiques responsables en IA

---

## 4. Félicitations 🏆

Vous avez utilisé avec succès GitHub Copilot Chat avec des serveurs MCP pour explorer le dépôt.

- [X] Activé GitHub Copilot pour Azure
- [X] Compris l'architecture de l'application
- [X] Exploré la structure du modèle AZD

Cela vous donne une idée des ressources d'_infrastructure en tant que code_ pour ce modèle. Ensuite, nous examinerons le fichier de configuration pour AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction automatique Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'être précis, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un traducteur humain. Nous déclinons toute responsabilité quant aux malentendus ou aux mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->