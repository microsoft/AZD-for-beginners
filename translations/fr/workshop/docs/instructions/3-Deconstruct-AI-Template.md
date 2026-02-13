# 3. Déconstruire un Modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ CAPABLE DE"

    - [ ] Activer GitHub Copilot avec les serveurs MCP pour l’assistance Azure
    - [ ] Comprendre la structure des dossiers et les composants du modèle AZD
    - [ ] Explorer les modèles d’organisation de l’infrastructure en tant que code (Bicep)
    - [ ] **Lab 3 :** Utiliser GitHub Copilot pour explorer et comprendre l’architecture du dépôt

---


Avec les modèles AZD et l’Azure Developer CLI (`azd`), nous pouvons rapidement démarrer notre parcours de développement IA avec des dépôts standardisés qui fournissent du code d’exemple, des fichiers d’infrastructure et de configuration - sous la forme d’un projet _starter_ prêt à déployer.

**Mais maintenant, nous devons comprendre la structure du projet et la base de code - et être capables de personnaliser le modèle AZD - sans aucune expérience ou compréhension préalable d’AZD !**

---

## 1. Activer GitHub Copilot

### 1.1 Installer GitHub Copilot Chat

Il est temps d’explorer [GitHub Copilot avec le mode Agent](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Maintenant, nous pouvons utiliser le langage naturel pour décrire notre tâche à un niveau élevé, et obtenir de l’aide pour l’exécution. Pour ce laboratoire, nous utiliserons le [plan gratuit Copilot](https://github.com/github-copilot/signup) qui a une limite mensuelle pour les complétions et interactions en chat.

L’extension peut être installée depuis le marketplace, mais devrait déjà être disponible dans votre environnement Codespaces. _Cliquez sur `Open Chat` dans le menu déroulant de l’icône Copilot - et tapez une invite comme `What can you do?`_ - il se peut que vous soyez invité à vous connecter. **GitHub Copilot Chat est prêt**.

### 1.2. Installer les serveurs MCP

Pour que le mode Agent soit efficace, il a besoin d’accéder aux bons outils afin d’aider à récupérer des connaissances ou à effectuer des actions. C’est là que les serveurs MCP peuvent aider. Nous allons configurer les serveurs suivants :

1. [Serveur Azure MCP](../../../../../workshop/docs/instructions)
1. [Serveur Microsoft Docs MCP](../../../../../workshop/docs/instructions)

Pour les activer :

1. Créez un fichier nommé `.vscode/mcp.json` s’il n’existe pas
1. Copiez ce qui suit dans ce fichier - et démarrez les serveurs !
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

??? warning "Vous pouvez obtenir une erreur indiquant que `npx` n’est pas installé (cliquez pour afficher la solution)"

      Pour corriger cela, ouvrez le fichier `.devcontainer/devcontainer.json` et ajoutez cette ligne à la section features. Puis reconstruisez le conteneur. Vous devriez maintenant avoir `npx` installé.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Tester GitHub Copilot Chat

**Utilisez d’abord `az login` pour vous authentifier auprès d’Azure depuis la ligne de commande VS Code.**

Vous devriez maintenant pouvoir interroger le statut de votre abonnement Azure, et poser des questions sur les ressources déployées ou la configuration. Essayez ces questions :

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Vous pouvez aussi poser des questions sur la documentation Azure et obtenir des réponses basées sur le serveur Microsoft Docs MCP. Essayez ces questions :

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Ou vous pouvez demander des extraits de code pour accomplir une tâche. Essayez cette invite.

1. `Give me a Python code example that uses AAD for an interactive chat client`

En mode `Ask`, cela fournira du code que vous pourrez copier-coller et tester. En mode `Agent`, cela ira peut-être plus loin et créera les ressources pertinentes pour vous - incluant les scripts d’installation et la documentation - pour vous aider à exécuter cette tâche.

**Vous êtes maintenant équipé pour commencer à explorer le dépôt du modèle**

---

## 2. Déconstruire l’Architecture

??? prompt "DEMANDE : Expliquez l’architecture de l’application dans docs/images/architecture.png en 1 paragraphe"

      Cette application est une application de chat alimentée par l’IA construite sur Azure qui démontre une architecture moderne basée sur des agents. La solution s’articule autour d’une Azure Container App qui héberge le code principal de l’application, qui traite l’entrée utilisateur et génère des réponses intelligentes via un agent IA.
      
      L’architecture s’appuie sur Microsoft Foundry Project comme base des capacités IA, se connectant aux services Azure AI qui fournissent les modèles de langage sous-jacents (tels que GPT-4o-mini) et la fonctionnalité d’agent.
      
      Les interactions utilisateur passent par une interface frontend basée sur React vers un backend FastAPI qui communique avec le service agent IA pour générer des réponses contextuelles.
      
      Le système intègre des capacités de recherche de connaissances via soit la recherche de fichiers, soit le service Azure AI Search, permettant à l’agent d’accéder et de citer des informations provenant de documents téléchargés.
      
      Pour l’excellence opérationnelle, l’architecture inclut une surveillance complète via Application Insights et Log Analytics Workspace pour le traçage, la journalisation et l’optimisation des performances.
      
      Azure Storage fournit un stockage blob pour les données applicatives et les fichiers téléchargés, tandis que Managed Identity garantit un accès sécurisé entre les ressources Azure sans stocker les identifiants.
      
      Toute la solution est conçue pour être scalable et maintenable, avec une application conteneurisée qui s’adapte automatiquement à la demande tout en offrant des capacités intégrées de sécurité, de surveillance et de CI/CD via l’écosystème des services managés Azure.

![Architecture](../../../../../translated_images/fr/architecture.48d94861e6e6cdc0.webp)

---

## 3. Structure du Dépôt

!!! prompt "DEMANDE : Expliquez la structure des dossiers du modèle. Commencez par un diagramme hiérarchique visuel."

??? info "RÉPONSE : Diagramme Hiérarchique Visuel"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Configuration Azure Developer CLI
      │   ├── docker-compose.yaml           # Conteneurs de développement local
      │   ├── pyproject.toml                # Configuration du projet Python
      │   ├── requirements-dev.txt          # Dépendances de développement
      │   └── .devcontainer/                # Configuration du conteneur de dev VS Code
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Modèle principal d’infrastructure
      │   ├── api.bicep                     # Ressources spécifiques à l’API
      │   ├── main.parameters.json          # Paramètres d’infrastructure
      │   └── core/                         # Composants modulaires d’infrastructure
      │       ├── ai/                       # Configurations des services IA
      │       ├── host/                     # Infrastructure d’hébergement
      │       ├── monitor/                  # Surveillance et journalisation
      │       ├── search/                   # Configuration Azure AI Search
      │       ├── security/                 # Sécurité et identité
      │       └── storage/                  # Configurations de comptes de stockage
      │
      ├── 💻 Source de l’Application (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entrée de l’application FastAPI
      │   │   ├── routes.py                 # Définitions des routes API
      │   │   ├── search_index_manager.py   # Fonctionnalités de recherche
      │   │   ├── data/                     # Gestion des données API
      │   │   ├── static/                   # Ressources web statiques
      │   │   └── templates/                # Templates HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dépendances Node.js
      │   │   ├── vite.config.ts            # Configuration du build Vite
      │   │   └── src/                      # Code source frontend
      │   ├── data/                         # Fichiers de données d’exemple
      │   │   └── embeddings.csv            # Embeddings pré-calculés
      │   ├── files/                        # Fichiers de la base de connaissances
      │   │   ├── customer_info_*.json      # Exemples de données clients
      │   │   └── product_info_*.md         # Documentation produits
      │   ├── Dockerfile                    # Configuration du conteneur
      │   └── requirements.txt              # Dépendances Python
      │
      ├── 🔧 Automatisation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Configuration post-déploiement
      │   ├── setup_credential.sh/.ps1     # Configuration des identifiants
      │   ├── validate_env_vars.sh/.ps1    # Validation de l’environnement
      │   └── resolve_model_quota.sh/.ps1  # Gestion des quotas modèles
      │
      ├── 🧪 Tests & Évaluation
      │   ├── tests/                        # Tests unitaires et d’intégration
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework d’évaluation des agents
      │   │   ├── evaluate.py               # Exécution d’évaluation
      │   │   ├── eval-queries.json         # Requêtes de test
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Terrain de jeu pour dev
      │   │   ├── 1-quickstart.py           # Exemples de démarrage rapide
      │   │   └── aad-interactive-chat.py   # Exemples d’authentification
      │   └── airedteaming/                 # Évaluation de sécurité IA
      │       └── ai_redteaming.py          # Tests de red team
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Guide de déploiement
      │   ├── local_development.md          # Instructions pour setup local
      │   ├── troubleshooting.md            # Problèmes courants & solutions
      │   ├── azure_account_setup.md        # Prérequis Azure
      │   └── images/                       # Ressources pour la documentation
      │
      └── 📄 Métadonnées du Projet
         ├── README.md                     # Vue d’ensemble du projet
         ├── CODE_OF_CONDUCT.md           # Règles de la communauté
         ├── CONTRIBUTING.md              # Guide de contribution
         ├── LICENSE                      # Conditions de licence
         └── next-steps.md                # Conseils post-déploiement
      ```

### 3.1. Architecture de l’Application Principale

Ce modèle suit un modèle de **full-stack web application** avec :

- **Backend** : Python FastAPI avec intégration Azure AI
- **Frontend** : TypeScript/React avec système de build Vite
- **Infrastructure** : modèles Azure Bicep pour les ressources cloud
- **Containerisation** : Docker pour un déploiement cohérent

### 3.2 Infrastructure en tant que Code (bicep)

La couche infrastructure utilise des modèles **Azure Bicep** organisés modulairement :

   - **`main.bicep`** : orchestre toutes les ressources Azure
   - **modules `core/`** : composants réutilisables pour différents services
      - Services IA (Azure OpenAI, AI Search)
      - Hébergement conteneur (Azure Container Apps)
      - Surveillance (Application Insights, Log Analytics)
      - Sécurité (Key Vault, Managed Identity)

### 3.3 Source de l’Application (`src/`)

**API Backend (`src/api/`)** :

- API REST basée sur FastAPI
- Intégration Foundry Agents
- Gestion des indexes de recherche pour récupération de connaissance
- Capacités de téléchargement et traitement de fichiers

**Frontend (`src/frontend/`)** :

- SPA moderne en React/TypeScript
- Vite pour développement rapide et builds optimisés
- Interface de chat pour interactions avec l’agent

**Base de Connaissances (`src/files/`)** :

- Données clients et produits d’exemple
- Démontre la récupération de connaissance basée sur fichiers
- Exemples aux formats JSON et Markdown


### 3.4 DevOps & Automatisation

**Scripts (`scripts/`)** :

- Scripts PowerShell et Bash multiplateformes
- Validation et configuration de l’environnement
- Configuration post-déploiement
- Gestion des quotas modèles

**Intégration Azure Developer CLI** :

- Configuration `azure.yaml` pour les workflows `azd`
- Provisionnement et déploiement automatisés
- Gestion des variables d’environnement

### 3.5 Tests & Assurance Qualité

**Framework d’évaluation (`evals/`)** :

- Évaluation de la performance des agents
- Tests qualité question-réponse
- Pipeline d’évaluation automatisée

**Sécurité IA (`airedteaming/`)** :

- Tests red team pour la sécurité IA
- Analyse des vulnérabilités de sécurité
- Pratiques responsables d’IA

---

## 4. Félicitations 🏆

Vous avez utilisé avec succès GitHub Copilot Chat avec les serveurs MCP pour explorer le dépôt.

- [X] GitHub Copilot activé pour Azure
- [X] Architecture de l’application comprise
- [X] Structure du modèle AZD explorée

Cela vous donne une idée des actifs _infrastructure as code_ pour ce modèle. Ensuite, nous examinerons le fichier de configuration pour AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’être précis, veuillez noter que les traductions automatiques peuvent comporter des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour toute information critique, une traduction humaine professionnelle est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->