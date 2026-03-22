# Changelog - AZD For Beginners

## Introduction

Ce changelog documente tous les changements notables, mises à jour et améliorations du dépôt AZD For Beginners. Nous suivons les principes de versionnage sémantique et tenons ce journal pour aider les utilisateurs à comprendre ce qui a changé entre les versions.

## Learning Goals

En consultant ce changelog, vous pourrez :
- Rester informé des nouvelles fonctionnalités et des ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bogues et les rectifications pour garantir l'exactitude
- Suivre l'évolution des supports d'apprentissage au fil du temps

## Learning Outcomes

Après avoir examiné les entrées du changelog, vous serez capable de :
- Identifier le nouveau contenu et les ressources disponibles pour l'apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d'apprentissage en fonction des documents les plus récents
- Contribuer des retours et des suggestions pour de futures améliorations

## Version History

### [v3.18.0] - 2026-03-16

#### AZD AI CLI Commands, Content Validation & Template Expansion
**Cette version ajoute la couverture des commandes `azd ai`, `azd extension` et `azd mcp` dans tous les chapitres liés à l'IA, corrige des liens cassés et du code déprécié dans agents.md, met à jour la fiche de référence et refond la section Example Templates avec des descriptions validées et de nouveaux templates Azure AI AZD.**

#### Added
- **🤖 Couverture AZD AI CLI** dans 7 fichiers (précédemment uniquement au Chapitre 8) :
  - `docs/chapter-01-foundation/azd-basics.md` — Nouvelle section "Extensions and AI Commands" présentant `azd extension`, `azd ai agent init`, et `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4 : `azd ai agent init` avec tableau comparatif (approche template vs manifeste)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sous-sections "AZD Extensions for Foundry" et "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start montre désormais les deux chemins de déploiement basés sur template et manifeste
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La section Deploy inclut désormais l'option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sous-section "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nouvelle section "AI & Extensions Commands" avec `azd extension`, `azd ai agent init`, `azd mcp`, et `azd infra generate`
- **📦 Nouveaux templates d'exemple AZD AI** dans `microsoft-foundry-integration.md` :
  - **azure-search-openai-demo-csharp** — RAG chat .NET avec Blazor WebAssembly, Semantic Kernel, et prise en charge de la voix
  - **azure-search-openai-demo-java** — RAG chat Java utilisant Langchain4J avec options de déploiement ACA/AKS
  - **contoso-creative-writer** — Application d'écriture créative multi-agent utilisant Azure AI Agent Service, Bing Grounding, et Prompty
  - **serverless-chat-langchainjs** — RAG serverless utilisant Azure Functions + LangChain.js + Cosmos DB avec prise en charge de Ollama en dev local
  - **chat-with-your-data-solution-accelerator** — Accélérateur RAG d'entreprise avec portail d'administration, intégration Teams, et options PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Application de référence d'orchestration MCP multi-agent avec serveurs en .NET, Python, Java, et TypeScript
  - **azd-ai-starter** — Template starter Bicep minimal pour l'infrastructure Azure AI
  - **🔗 Lien vers la galerie Awesome AZD AI** — Référence à la [galerie awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Fixed
- **🔗 Navigation agents.md** : Les liens Précédent/Suivant correspondent maintenant à l'ordre des leçons du README du Chapitre 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Liens cassés dans agents.md** : `production-ai-practices.md` corrigé en `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 Code déprécié dans agents.md** : Remplacement de `opencensus` par `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API invalide dans agents.md** : Déplacement de `max_tokens` de `create_agent()` vers `create_run()` en tant que `max_completion_tokens`
- **🔢 Comptage de tokens dans agents.md** : Remplacement de l'estimation approximative `len//4` par `tiktoken.encoding_for_model()`
- **azure-search-openai-demo** : Correction des services de "Cognitive Search + App Service" à "Azure AI Search + Azure Container Apps" (hôte par défaut changé Oct 2024)
- **contoso-chat** : Mise à jour de la description pour référencer Azure AI Foundry + Prompty, conformément au titre et à la pile technologique réels du dépôt

#### Removed
- **ai-document-processing** : Suppression de la référence au template non fonctionnel (repo non accessible publiquement en tant que template AZD)

#### Improved
- **📝 Exercices dans agents.md** : L'exercice 1 affiche désormais la sortie attendue et l'étape `azd monitor` ; l'exercice 2 inclut le code complet d'enregistrement `FunctionTool` ; l'exercice 3 remplace des indications vagues par des commandes concrètes `prepdocs.py`
- **📚 Ressources dans agents.md** : Liens de documentation mis à jour vers les docs actuels d'Azure AI Agent Service et le quickstart
- **📋 Tableau Next Steps dans agents.md** : Ajout du lien vers AI Workshop Lab pour une couverture complète du chapitre

#### Files Updated
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Course Navigation Enhancement
**Cette version améliore la navigation des README.md des chapitres avec un format de tableau enrichi.**

#### Changed
- **Tableau du plan de cours** : Amélioré avec des liens directs vers les leçons, des estimations de durée et des niveaux de complexité
- **Nettoyage des dossiers** : Suppression des anciens dossiers redondants (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validation des liens** : Plus de 21 liens internes dans le tableau du plan de cours vérifiés

### [v3.16.0] - 2026-02-05

#### Product Name Updates
**Cette version met à jour les références aux produits en accord avec la marque Microsoft actuelle.**

#### Changed
- **Microsoft Foundry → Microsoft Foundry** : Toutes les références mises à jour dans les fichiers non traduits
- **Azure AI Agent Service → Foundry Agents** : Nom du service mis à jour pour refléter la marque actuelle

#### Files Updated
- `README.md` - Page d'accueil principale du cours
- `changelog.md` - Historique des versions
- `course-outline.md` - Structure du cours
- `docs/chapter-02-ai-development/agents.md` - Guide sur les agents IA
- `examples/README.md` - Documentation des exemples
- `workshop/README.md` - Page d'accueil de l'atelier
- `workshop/docs/index.md` - Index de l'atelier
- `workshop/docs/instructions/*.md` - Tous les fichiers d'instructions de l'atelier

---

### [v3.15.0] - 2026-02-05

#### Major Repository Restructuring: Chapter-Based Folder Names
**Cette version restructure la documentation en dossiers de chapitres dédiés pour une navigation plus claire.**

#### Folder Renames
Les anciens dossiers ont été remplacés par des dossiers numérotés par chapitre :
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ajout : `docs/chapter-05-multi-agent/`

#### File Migrations
| Fichier | Depuis | Vers |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Added
- **📚 Fichiers README de chapitre** : Création de README.md dans chaque dossier de chapitre contenant :
  - Objectifs d'apprentissage et durée
  - Tableau des leçons avec descriptions
  - Commandes de démarrage rapide
  - Navigation vers les autres chapitres

#### Changed
- **🔗 Mise à jour de tous les liens internes** : 78+ chemins mis à jour dans tous les fichiers de documentation
- **🗺️ README.md principal** : Plan du cours mis à jour avec la nouvelle structure de chapitres
- **📝 examples/README.md** : Références croisées mises à jour pour les dossiers de chapitres

#### Removed
- Ancienne structure de dossiers (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Repository Restructuring: Chapter Navigation
**Cette version a ajouté des fichiers README de navigation par chapitre (supplantée par la v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### New AI Agents Guide
**Cette version ajoute un guide complet pour le déploiement d'agents IA avec Azure Developer CLI.**

#### Added
- **🤖 docs/microsoft-foundry/agents.md** : Guide complet couvrant :
  - Ce que sont les agents IA et en quoi ils diffèrent des chatbots
  - Trois templates d'agent pour démarrage rapide (Foundry Agents, Prompty, RAG)
  - Modèles d'architecture d'agents (agent unique, RAG, multi-agent)
  - Configuration et personnalisation des outils
  - Suivi de monitoring et des métriques
  - Considérations de coût et optimisation
  - Scénarios courants de dépannage
  - Trois exercices pratiques avec critères de réussite

#### Content Structure
- **Introduction** : Concepts d'agent pour débutants
- **Quick Start** : Déploiement des agents avec `azd init --template get-started-with-ai-agents`
- **Architecture Patterns** : Diagrammes visuels des modèles d'agent
- **Configuration** : Configuration des outils et variables d'environnement
- **Monitoring** : Intégration Application Insights
- **Exercises** : Apprentissage pratique progressif (20-45 minutes chacun)

---

### [v3.12.0] - 2026-02-05

#### DevContainer Environment Update
**Cette version met à jour la configuration du conteneur de développement avec des outils modernes et de meilleurs paramètres par défaut pour l'expérience d'apprentissage AZD.**

#### Changed
- **🐳 Image de base** : Mise à jour de `python:3.12-bullseye` à `python:3.12-bookworm` (dernière stable Debian)
- **📛 Nom du conteneur** : Renommé de "Python 3" à "AZD for Beginners" pour plus de clarté

#### Added
- **🔧 Nouvelles fonctionnalités du conteneur de développement**:
  - `azure-cli` with Bicep support enabled
  - `node:20` (LTS version for AZD templates)
  - `github-cli` for template management
  - `docker-in-docker` for container app deployments

- **🔌 Redirection de ports**: Ports préconfigurés pour le développement courant:
  - 8000 (Aperçu MkDocs)
  - 3000 (Applications web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Nouvelles extensions VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense Python amélioré
  - `ms-azuretools.vscode-azurefunctions` - Prise en charge d'Azure Functions
  - `ms-azuretools.vscode-docker` - Prise en charge de Docker
  - `ms-azuretools.vscode-bicep` - Prise en charge du langage Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestion des ressources Azure
  - `yzhang.markdown-all-in-one` - Édition Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Prise en charge des diagrammes Mermaid
  - `redhat.vscode-yaml` - Prise en charge de YAML (pour azure.yaml)
  - `eamodio.gitlens` - Visualisation Git
  - `mhutchie.git-graph` - Historique Git

- **⚙️ Paramètres VS Code**: Ajout des paramètres par défaut pour l'interpréteur Python, le formatage à l'enregistrement et la suppression des espaces inutiles

- **📦 requirements-dev.txt mis à jour**:
  - Ajout du plugin MkDocs minify
  - Ajout de pre-commit pour la qualité du code
  - Ajout des packages Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigé
- **Commande post-création**: Vérifie maintenant l'installation d'AZD et d'Azure CLI au démarrage du conteneur

---

### [v3.11.0] - 2026-02-05

#### Refonte du README pour les débutants
**Cette version améliore significativement le README.md pour le rendre plus accessible aux débutants et ajoute des ressources essentielles pour les développeurs IA.**

#### Ajoutés
- **🆚 Comparaison Azure CLI vs AZD**: Explication claire de quand utiliser chaque outil avec des exemples pratiques
- **🌟 Liens Awesome AZD**: Liens directs vers la galerie de modèles communautaires et les ressources de contribution :
  - [Galerie Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ modèles prêts à déployer
  - [Soumettre un modèle](https://github.com/Azure/awesome-azd/issues) - Contribution communautaire
- **🎯 Guide de démarrage rapide**: Section de démarrage simplifiée en 3 étapes (Installer → Se connecter → Déployer)
- **📊 Table de navigation basée sur l'expérience**: Guide clair sur par où commencer en fonction de l'expérience du développeur

#### Modifications
- **Structure du README**: Réorganisé pour une divulgation progressive - informations clés en premier
- **Section d'introduction**: Réécrite pour expliquer "La magie de `azd up`" pour les débutants complets
- **Suppression de contenu dupliqué**: Élimination de la section de dépannage en double
- **Commandes de dépannage**: Correction de la référence `azd logs` pour utiliser la commande valide `azd monitor --logs`

#### Corrigé
- **🔐 Commandes d'authentification**: Ajout de `azd auth login` et `azd auth logout` à cheat-sheet.md
- **Références de commande invalides**: Suppression des occurrences restantes de `azd logs` dans la section de dépannage du README

#### Remarques
- **Portée**: Modifications appliquées au README.md principal et à resources/cheat-sheet.md
- **Public cible**: Améliorations spécifiquement destinées aux développeurs débutant avec AZD

---

### [v3.10.0] - 2026-02-05

#### Mise à jour de l'exactitude des commandes Azure Developer CLI
**Cette version corrige les commandes AZD inexistantes dans toute la documentation, garantissant que tous les exemples de code utilisent une syntaxe valide de l'Azure Developer CLI.**

#### Corrigé
- **🔧 Suppression des commandes AZD inexistantes**: Audit complet et correction des commandes invalides :
  - `azd logs` (n'existe pas) → remplacé par `azd monitor --logs` ou des alternatives Azure CLI
  - `azd service` subcommands (n'existent pas) → remplacés par `azd show` et Azure CLI
  - `azd infra import/export/validate` (n'existent pas) → supprimés ou remplacés par des alternatives valides
  - flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (n'existent pas) → supprimés
  - flags `azd provision --what-if/--rollback` (n'existent pas) → mis à jour pour utiliser `--preview`
  - `azd config validate` (n'existe pas) → remplacé par `azd config list`
  - `azd info`, `azd history`, `azd metrics` (n'existent pas) → supprimés

- **📚 Fichiers mis à jour avec corrections de commandes**:
  - `resources/cheat-sheet.md`: Révision majeure de la référence de commandes
  - `docs/deployment/deployment-guide.md`: Correction des stratégies de rollback et de déploiement
  - `docs/troubleshooting/debugging.md`: Correction des sections d'analyse des logs
  - `docs/troubleshooting/common-issues.md`: Mise à jour des commandes de dépannage
  - `docs/troubleshooting/ai-troubleshooting.md`: Correction de la section de débogage AZD
  - `docs/getting-started/azd-basics.md`: Correction des commandes de monitoring
  - `docs/getting-started/first-project.md`: Mise à jour des exemples de monitoring et de débogage
  - `docs/getting-started/installation.md`: Correction des exemples d'aide et de version
  - `docs/pre-deployment/application-insights.md`: Correction des commandes d'affichage des logs
  - `docs/pre-deployment/coordination-patterns.md`: Correction des commandes de débogage des agents

- **📝 Référence de version mise à jour**:
  - `docs/getting-started/installation.md`: Remplacement de la version codée en dur `1.5.0` par `1.x.x` avec lien vers les releases

#### Modifications
- **Stratégies de rollback**: Documentation mise à jour pour utiliser le rollback basé sur Git (AZD n'a pas de rollback natif)
- **Affichage des logs**: Remplacement des références `azd logs` par `azd monitor --logs`, `azd monitor --live`, et des commandes Azure CLI
- **Section performance**: Suppression des flags de déploiement parallèle/incrémental inexistants, fourniture d'alternatives valides

#### Détails techniques
- **Commandes AZD valides**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags valides pour azd monitor**: `--live`, `--logs`, `--overview`
- **Fonctionnalités supprimées**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Remarques
- **Vérification**: Commandes validées contre Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Achèvement de l'atelier et mise à jour de la qualité de la documentation
**Cette version complète les modules interactifs de l'atelier, corrige tous les liens cassés de la documentation et améliore la qualité globale du contenu pour les développeurs IA utilisant Microsoft AZD.**

#### Ajoutés
- **📝 CONTRIBUTING.md**: Nouveau document de directives de contribution avec :
  - Instructions claires pour signaler des problèmes et proposer des changements
  - Normes de documentation pour les nouveaux contenus
  - Directives pour les exemples de code et conventions de messages de commit
  - Informations sur l'engagement communautaire

#### Complété
- **🎯 Module d'atelier 7 (Conclusion)**: Module de conclusion entièrement complété avec :
  - Résumé complet des réalisations de l'atelier
  - Section des concepts clés maîtrisés couvrant AZD, les templates et Microsoft Foundry
  - Recommandations pour la poursuite du parcours d'apprentissage
  - Exercices défis de l'atelier avec niveaux de difficulté
  - Liens pour les retours de la communauté et le support

- **📚 Module d'atelier 3 (Déconstruction)**: Objectifs d'apprentissage mis à jour avec :
  - Guide d'activation de GitHub Copilot avec les serveurs MCP
  - Compréhension de la structure des dossiers des templates AZD
  - Modèles d'organisation Infrastructure-as-code (Bicep)
  - Instructions pour les labs pratiques

- **🔧 Module d'atelier 6 (Teardown)**: Complété avec :
  - Objectifs de nettoyage des ressources et de gestion des coûts
  - Utilisation de `azd down` pour la déprovision sécurisée de l'infrastructure
  - Guide de récupération des services cognitifs en suppression douce
  - Prompts d'exploration bonus pour GitHub Copilot et le portail Azure

#### Corrigé
- **🔗 Correction de liens cassés**: Résolution de 15+ liens internes cassés dans la documentation :
  - `docs/ai-foundry/ai-model-deployment.md`: Correction des chemins vers microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Correction des chemins vers ai-model-deployment.md et production-ai-practices.md
  - `docs/getting-started/first-project.md`: Remplacement de cicd-integration.md inexistante par deployment-guide.md
  - `examples/retail-scenario.md`: Correction des chemins vers la FAQ et le guide de dépannage
  - `examples/container-app/microservices/README.md`: Correction des chemins vers la page d'accueil du cours et le guide de déploiement
  - `resources/faq.md` et `resources/glossary.md`: Mise à jour des références du chapitre IA
  - `course-outline.md`: Correction des références vers le guide de l'instructeur et les labs de l'atelier IA

- **📅 Bannière d'état de l'atelier**: Mise à jour de "Under Construction" vers un statut d'atelier actif avec la date de février 2026

- **🔗 Navigation de l'atelier**: Correction des liens de navigation cassés dans le README de l'atelier pointant vers le dossier lab-1-azd-basics inexistant

#### Modifié
- **Présentation de l'atelier**: Suppression de l'avertissement "under construction", l'atelier est maintenant complet et prêt à l'emploi
- **Cohérence de la navigation**: Garantie que tous les modules de l'atelier disposent d'une navigation inter-module appropriée
- **Références du parcours d'apprentissage**: Mise à jour des références de chapitres pour utiliser les bons chemins microsoft-foundry

#### Validé
- ✅ Tous les fichiers markdown en anglais ont des liens internes valides
- ✅ Les modules d'atelier 0-7 sont complets avec des objectifs d'apprentissage
- ✅ La navigation entre chapitres et modules fonctionne correctement
- ✅ Le contenu est adapté aux développeurs IA utilisant Microsoft AZD
- ✅ Langage et structure adaptés aux débutants maintenus tout au long
- ✅ CONTRIBUTING.md fournit des directives claires pour les contributeurs communautaires

#### Mise en œuvre technique
- **Validation des liens**: Script PowerShell automatisé ayant vérifié tous les liens internes .md
- **Audit de contenu**: Revue manuelle de l'exhaustivité de l'atelier et de son adéquation pour les débutants
- **Système de navigation**: Application de schémas de navigation cohérents pour chapitres et modules

#### Remarques
- **Portée**: Modifications appliquées uniquement à la documentation en anglais
- **Traductions**: Dossiers de traduction non mis à jour dans cette version (la traduction automatisée synchronisera ultérieurement)
- **Durée de l'atelier**: L'atelier complet propose désormais 3-4 heures d'apprentissage pratique

---

### [v3.8.0] - 2025-11-19

#### Documentation avancée : surveillance, sécurité et modèles multi-agents
**Cette version ajoute des leçons complètes de niveau A sur l'intégration d'Application Insights, les modèles d'authentification et la coordination multi-agents pour les déploiements en production.**

#### Ajoutés
- **📊 Leçon d'intégration Application Insights**: in `docs/pre-deployment/application-insights.md`:
  - Déploiement centré sur AZD avec provisionnement automatique
  - Modèles Bicep complets pour Application Insights + Log Analytics
  - Applications Python fonctionnelles avec télémétrie personnalisée (1,200+ lines)
  - Modèles de surveillance AI/LLM (suivi des jetons/coûts des modèles Microsoft Foundry)
  - 6 diagrammes Mermaid (architecture, traçage distribué, flux de télémétrie)
  - 3 exercices pratiques (alertes, tableaux de bord, surveillance AI)
  - Exemples de requêtes Kusto et stratégies d'optimisation des coûts
  - Diffusion de métriques en direct et débogage en temps réel
  - Temps d'apprentissage de 40-50 minutes avec des modèles prêts pour la production

- **🔐 Leçon sur les modèles d'authentification et de sécurité**: in `docs/getting-started/authsecurity.md`:
  - 3 modèles d'authentification (chaînes de connexion, Key Vault, identité gérée)
  - Modèles d'infrastructure Bicep complets pour des déploiements sécurisés
  - Code d'application Node.js avec intégration Azure SDK
  - 3 exercices complets (activation de l'identité gérée, identité assignée par l'utilisateur, rotation de Key Vault)
  - Bonnes pratiques de sécurité et configurations RBAC
  - Guide de dépannage et analyse des coûts
  - Modèles d'authentification sans mot de passe prêts pour la production

- **🤖 Leçon sur les modèles de coordination multi-agents**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 modèles de coordination (séquentiel, parallèle, hiérarchique, piloté par événements, consensus)
  - Implémentation complète du service orchestrateur (Python/Flask, 1,500+ lines)
  - 3 implémentations d'agents spécialisées (Research, Writer, Editor)
  - Intégration Service Bus pour la mise en file des messages
  - Gestion d'état avec Cosmos DB pour systèmes distribués
  - 6 diagrammes Mermaid montrant les interactions entre agents
  - 3 exercices avancés (gestion des timeouts, logique de réessai, circuit breaker)
  - Répartition des coûts ($240-565/month) avec stratégies d'optimisation
  - Intégration Application Insights pour la surveillance

#### Amélioré
- **Chapitre Pre-deployment**: Inclut désormais des modèles complets de surveillance et de coordination
- **Chapitre Getting Started**: Amélioré avec des modèles d'authentification professionnels
- **Préparation à la production**: Couverture complète de la sécurité à l'observabilité
- **Plan du cours**: Mise à jour pour référencer les nouvelles leçons des Chapitres 3 et 6

#### Modifié
- **Progression d'apprentissage**: Meilleure intégration de la sécurité et de la surveillance tout au long du cours
- **Qualité de la documentation**: Normes de haute qualité (95-97%) constantes pour les nouvelles leçons
- **Modèles de production**: Couverture complète de bout en bout pour les déploiements d'entreprise

#### Amélioré
- **Expérience développeur**: Chemin clair du développement à la supervision en production
- **Normes de sécurité**: Modèles professionnels pour l'authentification et la gestion des secrets
- **Observabilité**: Intégration complète d'Application Insights avec AZD
- **Charges de travail IA**: Supervision spécialisée pour Microsoft Foundry Models et les systèmes multi-agents

#### Validé
- ✅ Toutes les leçons incluent du code complet et fonctionnel (pas des extraits)
- ✅ Diagrammes Mermaid pour l'apprentissage visuel (19 au total répartis sur 3 leçons)
- ✅ Exercices pratiques avec étapes de vérification (9 au total)
- ✅ Modèles Bicep prêts pour la production déployables via `azd up`
- ✅ Analyse des coûts et stratégies d'optimisation
- ✅ Guides de dépannage et meilleures pratiques
- ✅ Points de vérification des connaissances avec commandes de vérification

#### Résultats de l'évaluation de la documentation
- **docs/pre-deployment/application-insights.md**: - Guide de supervision complet
- **docs/getting-started/authsecurity.md**: - Modèles de sécurité professionnels
- **docs/pre-deployment/coordination-patterns.md**: - Architectures multi-agents avancées
- **Overall New Content**: - Normes de qualité élevées et cohérentes

#### Mise en œuvre technique
- **Application Insights**: Log Analytics + télémétrie personnalisée + traçage distribué
- **Authentification**: Managed Identity + Key Vault + modèles RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orchestration
- **Monitoring**: Métriques en direct + requêtes Kusto + alertes + tableaux de bord
- **Cost Management**: Stratégies d'échantillonnage, politiques de rétention, contrôles budgétaires

### [v3.7.0] - 2025-11-19

#### Améliorations de la qualité de la documentation et nouvel exemple Microsoft Foundry Models
**Cette version améliore la qualité de la documentation dans l'ensemble du dépôt et ajoute un exemple complet de déploiement Microsoft Foundry Models avec une interface de chat gpt-4.1.**

#### Ajouté
- **🤖 Microsoft Foundry Models Chat Example**: Déploiement complet gpt-4.1 avec implémentation fonctionnelle dans `examples/azure-openai-chat/`:
  - Infrastructure Microsoft Foundry Models complète (déploiement du modèle gpt-4.1)
  - Interface de chat en ligne de commande Python avec historique des conversations
  - Intégration Key Vault pour le stockage sécurisé des clés d'API
  - Suivi de l'utilisation des jetons et estimation des coûts
  - Limitation du débit et gestion des erreurs
  - README complet avec guide de déploiement de 35 à 45 minutes
  - 11 fichiers prêts pour la production (modèles Bicep, application Python, configuration)
- **📚 Documentation Exercises**: Ajout d'exercices pratiques au guide de configuration :
  - Exercice 1: Configuration multi-environnements (15 minutes)
  - Exercice 2: Pratique de la gestion des secrets (10 minutes)
  - Critères de réussite clairs et étapes de vérification
- **✅ Vérification du déploiement**: Ajout d'une section de vérification au guide de déploiement:
  - Procédures de vérification de l'état
  - Liste de contrôle des critères de réussite
  - Sorties attendues pour toutes les commandes de déploiement
  - Référence rapide de dépannage

#### Amélioré
- **examples/README.md**: Mise à jour vers une qualité de niveau A (93%):
  - Ajout de azure-openai-chat à toutes les sections pertinentes
  - Nombre d'exemples locaux mis à jour de 3 à 4
  - Ajout au tableau des exemples d'applications IA
  - Intégré dans le démarrage rapide pour utilisateurs intermédiaires
  - Ajouté à la section Microsoft Foundry Templates
  - Mise à jour de la matrice de comparaison et des sections de recherche technologique
- **Documentation Quality**: Qualité de la documentation améliorée B+ (87%) → A- (92%) dans le dossier docs:
  - Ajout des sorties attendues aux exemples de commandes critiques
  - Inclusion d'étapes de vérification pour les modifications de configuration
  - Amélioration de l'apprentissage pratique avec des exercices concrets

#### Modifié
- **Learning Progression**: Meilleure intégration des exemples d'IA pour les apprenants intermédiaires
- **Documentation Structure**: Des exercices plus concrets et exploitables avec des résultats clairs
- **Verification Process**: Critères de réussite explicites ajoutés aux flux de travail clés

#### Améliorations
- **Developer Experience**: Le déploiement Microsoft Foundry Models prend désormais 35-45 minutes (vs 60-90 pour les alternatives complexes)
- **Cost Transparency**: Estimations de coûts claires ($50-200/month) pour l'exemple Microsoft Foundry Models
- **Learning Path**: Les développeurs IA disposent d'un point d'entrée clair avec azure-openai-chat
- **Documentation Standards**: Sorties attendues et étapes de vérification cohérentes

#### Validé
- ✅ L'exemple Microsoft Foundry Models entièrement fonctionnel avec `azd up`
- ✅ Les 11 fichiers d'implémentation sont tous syntaxiquement corrects
- ✅ Les instructions du README correspondent à l'expérience de déploiement réelle
- ✅ Liens de documentation mis à jour dans plus de 8 emplacements
- ✅ L'index des exemples reflète correctement 4 exemples locaux
- ✅ Aucun lien externe en double dans les tableaux
- ✅ Toutes les références de navigation sont correctes

#### Mise en œuvre technique
- **Microsoft Foundry Models Architecture**: gpt-4.1 + Key Vault + modèle Container Apps
- **Security**: Managed Identity prêt, secrets dans Key Vault
- **Monitoring**: Intégration Application Insights
- **Cost Management**: Suivi des jetons et optimisation de l'utilisation
- **Deployment**: Commande unique `azd up` pour la configuration complète

### [v3.6.0] - 2025-11-19

#### Mise à jour majeure: Exemples de déploiement d'applications Container App
**Cette version introduit des exemples complets de déploiement d'applications conteneurisées prêts pour la production en utilisant Azure Developer CLI (AZD), avec une documentation complète et une intégration dans le parcours d'apprentissage.**

#### Ajouté
- **🚀 Container App Examples**: Nouveaux exemples locaux dans `examples/container-app/`:
  - [Guide principal](examples/container-app/README.md): Aperçu complet des déploiements conteneurisés, démarrage rapide, production et modèles avancés
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST pour débutants avec scale-to-zero, sondes de santé, supervision et dépannage
  - [Microservices Architecture](../../examples/container-app/microservices): Déploiement multi-services prêt pour la production (API Gateway, Product, Order, User, Notification), messagerie asynchrone, Service Bus, Cosmos DB, Azure SQL, traçage distribué, déploiement blue-green/canary
- **Best Practices**: Sécurité, supervision, optimisation des coûts et guidance CI/CD pour les charges conteneurisées
- **Code Samples**: `azure.yaml` complet, modèles Bicep et implémentations de services multi-langages (Python, Node.js, C#, Go)
- **Testing & Troubleshooting**: Scénarios de tests de bout en bout, commandes de supervision, guide de dépannage

#### Modifié
- **README.md**: Mis à jour pour présenter et lier les nouveaux exemples Container App sous "Local Examples - Container Applications"
- **examples/README.md**: Mis à jour pour mettre en avant les exemples Container App, ajouter des entrées dans la matrice de comparaison et mettre à jour les références technologiques/architecturales
- **Course Outline & Study Guide**: Mis à jour pour référencer les nouveaux exemples Container App et les modèles de déploiement dans les chapitres concernés

#### Validé
- ✅ Tous les nouveaux exemples déployables avec `azd up` et respectant les meilleures pratiques
- ✅ Liens croisés et navigation de la documentation mis à jour
- ✅ Les exemples couvrent des scénarios du niveau débutant au niveau avancé, y compris des microservices en production

#### Notes
- **Scope**: Documentation et exemples en anglais uniquement
- **Next Steps**: Étendre avec des modèles conteneurs avancés supplémentaires et l'automatisation CI/CD dans les futures versions

### [v3.5.0] - 2025-11-19

#### Renommage du produit: Microsoft Foundry
**Cette version met en œuvre un changement complet de nom de produit de "Microsoft Foundry" à "Microsoft Foundry" dans toute la documentation anglaise, reflétant le rebranding officiel de Microsoft.**

#### Modifié
- **🔄 Product Name Update**: Rebranding complet de "Microsoft Foundry" à "Microsoft Foundry"
  - Mise à jour de toutes les références dans la documentation anglaise dans le dossier `docs/`
  - Dossier renommé : `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fichier renommé : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total : 23 références de contenu mises à jour dans 7 fichiers de documentation

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renommé en `docs/microsoft-foundry/`
  - Toutes les références croisées mises à jour pour refléter la nouvelle structure de dossiers
  - Liens de navigation validés dans toute la documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tous les liens internes mis à jour pour référencer le nouveau nom de fichier

#### Fichiers mis à jour
- **Chapter Documentation** (7 fichiers):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mises à jour de liens de navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 références de nom de produit mises à jour
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Déjà en Microsoft Foundry (depuis des mises à jour précédentes)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 références mises à jour (aperçu, retours de la communauté, documentation)
  - `docs/getting-started/azd-basics.md` - 4 liens de référence croisée mis à jour
  - `docs/getting-started/first-project.md` - 2 liens de navigation de chapitre mis à jour
  - `docs/getting-started/installation.md` - 2 liens du chapitre suivant mis à jour
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 références mises à jour (navigation, communauté Discord)
  - `docs/troubleshooting/common-issues.md` - 1 lien de navigation mis à jour
  - `docs/troubleshooting/debugging.md` - 1 lien de navigation mis à jour

- **Course Structure Files** (2 fichiers):
  - `README.md` - 17 références mises à jour (aperçu du cours, titres de chapitres, section modèles, insights communautaires)
  - `course-outline.md` - 14 références mises à jour (aperçu, objectifs d'apprentissage, ressources de chapitre)

#### Validé
- ✅ Aucune référence de chemin "ai-foundry" restante dans la documentation anglaise
- ✅ Aucune référence restante au nom de produit "Microsoft Foundry" dans la documentation anglaise
- ✅ Tous les liens de navigation fonctionnent avec la nouvelle structure de dossiers
- ✅ Renommages de fichiers et dossiers effectués avec succès
- ✅ Références croisées entre chapitres validées

#### Remarques
- **Scope**: Modifications appliquées uniquement à la documentation anglaise dans le dossier `docs/`
- **Translations**: Les dossiers de traduction (`translations/`) non mis à jour dans cette version
- **Workshop**: Les supports d'atelier (`workshop/`) non mis à jour dans cette version
- **Examples**: Les fichiers d'exemples peuvent encore faire référence à l'ancienne nomenclature (à corriger dans une future mise à jour)

#### Guide de migration pour les contributeurs
If you have local branches or documentation referencing the old structure:
1. Mettre à jour les références de dossier: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Mettre à jour les références de fichier: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Remplacer le nom du produit: "Microsoft Foundry" → "Microsoft Foundry"
4. Valider que tous les liens internes de la documentation fonctionnent toujours

---

### [v3.4.0] - 2025-10-24

#### Améliorations de l'aperçu d'infrastructure et de la validation
**Cette version introduit une prise en charge complète de la nouvelle fonctionnalité preview d'Azure Developer CLI et améliore l'expérience utilisateur de l'atelier.**

#### Ajouté
- **🧪 azd provision --preview Feature Documentation**: Documentation complète de la nouvelle capacité d'aperçu d'infrastructure
  - Référence de commande et exemples d'utilisation dans le mémo
  - Intégration détaillée dans le guide de provisionnement avec cas d'utilisation et avantages
  - Intégration de vérifications préalables pour une validation de déploiement plus sûre
  - Mises à jour du guide de démarrage avec des pratiques de déploiement axées sur la sécurité
- **🚧 Workshop Status Banner**: Bannière HTML professionnelle indiquant l'état de développement de l'atelier
  - Design en dégradé avec indicateurs de construction pour une communication claire aux utilisateurs
  - Horodatage de la dernière mise à jour pour plus de transparence
  - Conception responsive pour tous les types d'appareils

#### Améliorations
- **Infrastructure Safety**: Fonctionnalité d'aperçu intégrée dans l'ensemble de la documentation de déploiement
- **Pre-deployment Validation**: Les scripts automatisés incluent désormais des tests d'aperçu d'infrastructure
- **Developer Workflow**: Séquences de commandes mises à jour pour inclure l'aperçu comme bonne pratique
- **Workshop Experience**: Des attentes claires fixées pour les utilisateurs concernant l'état de développement du contenu

#### Modifié
- **Deployment Best Practices**: Approche 'preview-first' désormais recommandée
- **Documentation Flow**: La validation d'infrastructure déplacée plus tôt dans le processus d'apprentissage
- **Workshop Presentation**: Communication professionnelle de l'état avec un calendrier de développement clair

#### Amélioré
- **Safety-First Approach**: Les modifications d'infrastructure peuvent désormais être validées avant le déploiement
- **Team Collaboration**: Les résultats de l'aperçu peuvent être partagés pour examen et approbation
- **Cost Awareness**: Meilleure compréhension des coûts des ressources avant provisionnement
- **Risk Mitigation**: Réduction des échecs de déploiement grâce à la validation préalable

#### Mise en œuvre technique
- **Multi-document Integration**: Fonctionnalité d'aperçu documentée dans 4 fichiers clés
- **Command Patterns**: Syntaxe et exemples cohérents dans toute la documentation
- **Best Practice Integration**: L'aperçu inclus dans les workflows et scripts de validation
- **Visual Indicators**: Marquages clairs des nouvelles fonctionnalités pour faciliter leur découverte

#### Infrastructure de l'atelier
- **Status Communication**: Bannière HTML professionnelle avec style en dégradé
- **User Experience**: Un statut de développement clair évite la confusion
- **Professional Presentation**: Maintient la crédibilité du dépôt tout en définissant les attentes
- **Timeline Transparency**: Horodatage de la dernière mise à jour en octobre 2025 pour la transparence

### [v3.3.0] - 2025-09-24

#### Matériel d'atelier amélioré et expérience d'apprentissage interactive
**Cette version introduit des supports d'atelier complets avec des guides interactifs basés sur le navigateur et des parcours d'apprentissage structurés.**

#### Ajouté
- **🎥 Guide d'atelier interactif**: Expérience d'atelier dans le navigateur avec capacité de prévisualisation MkDocs
- **📝 Instructions d'atelier structurées**: parcours d'apprentissage guidé en 7 étapes de la découverte à la personnalisation
  - 0-Introduction: Aperçu de l'atelier et configuration
  - 1-Select-AI-Template: Processus de découverte et de sélection de modèles
  - 2-Validate-AI-Template: Procédures de déploiement et de validation
  - 3-Deconstruct-AI-Template: Compréhension de l'architecture des templates
  - 4-Configure-AI-Template: Configuration et personnalisation
  - 5-Customize-AI-Template: Modifications avancées et itérations
  - 6-Teardown-Infrastructure: Nettoyage et gestion des ressources
  - 7-Wrap-up: Résumé et prochaines étapes
- **🛠️ Outils de l'atelier**: Configuration MkDocs avec le thème Material pour une expérience d'apprentissage améliorée
- **🎯 Parcours d'apprentissage pratique**: méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces**: Configuration transparente de l'environnement de développement

#### Amélioré
- **AI Workshop Lab**: Étendu avec une expérience d'apprentissage structurée complète de 2-3 heures
- **Documentation de l'atelier**: Présentation professionnelle avec navigation et aides visuelles
- **Progression d'apprentissage**: Guide clair étape par étape de la sélection du template au déploiement en production
- **Expérience développeur**: Outils intégrés pour des flux de travail de développement simplifiés

#### Améliorations
- **Accessibilité**: Interface dans le navigateur avec recherche, fonction de copie et bascule de thème
- **Apprentissage en autonomie**: Structure d'atelier flexible s'adaptant à différents rythmes d'apprentissage
- **Application pratique**: Scénarios réels de déploiement de templates IA
- **Intégration communautaire**: Intégration Discord pour le support et la collaboration lors des ateliers

#### Fonctionnalités de l'atelier
- **Recherche intégrée**: Découverte rapide par mot-clé et leçon
- **Copier les blocs de code**: Fonctionnalité de copie au survol pour tous les exemples de code
- **Bascule de thème**: Prise en charge mode sombre/clair selon les préférences
- **Ressources visuelles**: Captures d'écran et diagrammes pour une meilleure compréhension
- **Intégration d'aide**: Accès direct à Discord pour le support communautaire

### [v3.2.0] - 2025-09-17

#### Restructuration majeure de la navigation et système d'apprentissage par chapitres
**Cette version introduit une structure d'apprentissage complète par chapitres avec une navigation améliorée dans l'ensemble du dépôt.**

#### Ajouté
- **📚 Système d'apprentissage par chapitres**: Restructuration du cours entier en 8 chapitres d'apprentissage progressifs
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Système de navigation complet**: En-têtes et pieds de page de navigation cohérents sur toute la documentation
- **🎯 Suivi des progrès**: Checklist de complétion du cours et système de vérification des apprentissages
- **🗺️ Orientation du parcours d'apprentissage**: Points d'entrée clairs pour différents niveaux d'expérience et objectifs
- **🔗 Navigation par références croisées**: Chapitres liés et prérequis clairement reliés

#### Amélioré
- **Structure du README**: Transformée en plateforme d'apprentissage structurée avec organisation par chapitres
- **Navigation dans la documentation**: Chaque page inclut désormais le contexte du chapitre et des indications de progression
- **Organisation des templates**: Exemples et modèles mappés aux chapitres d'apprentissage appropriés
- **Intégration des ressources**: Fiches pratiques, FAQ et guides d'étude connectés aux chapitres pertinents
- **Intégration des ateliers**: Laboratoires pratiques alignés sur plusieurs objectifs d'apprentissage des chapitres

#### Modifié
- **Progression d'apprentissage**: Passage d'une documentation linéaire à un apprentissage flexible par chapitres
- **Emplacement de la configuration**: Guide de configuration repositionné en Chapitre 3 pour un meilleur enchaînement pédagogique
- **Intégration de contenu IA**: Meilleure intégration du contenu spécifique à l'IA tout au long du parcours d'apprentissage
- **Contenu de production**: Modèles avancés consolidés dans le Chapitre 8 pour les apprenants en entreprise

#### Amélioré
- **Expérience utilisateur**: Fil d'Ariane de navigation clair et indicateurs de progression par chapitre
- **Accessibilité**: Schémas de navigation cohérents pour faciliter la traversée du cours
- **Présentation professionnelle**: Structure de type universitaire adaptée aux formations académiques et d'entreprise
- **Efficacité d'apprentissage**: Réduction du temps pour trouver le contenu pertinent grâce à une meilleure organisation

#### Implémentation technique
- **En-têtes de navigation**: Navigation standardisée par chapitre sur plus de 40 fichiers de documentation
- **Navigation de pied de page**: Indications de progression cohérentes et indicateurs de complétion des chapitres
- **Liens croisés**: Système de liens internes complet connectant les concepts liés
- **Cartographie des chapitres**: Templates et exemples clairement associés aux objectifs d'apprentissage

#### Amélioration du guide d'étude
- **📚 Objectifs d'apprentissage complets**: Guide d'étude restructuré pour s'aligner sur le système de 8 chapitres
- **🎯 Évaluation par chapitre**: Chaque chapitre inclut des objectifs d'apprentissage spécifiques et des exercices pratiques
- **📋 Suivi des progrès**: Planning d'apprentissage hebdomadaire avec résultats mesurables et listes de contrôle de complétion
- **❓ Questions d'évaluation**: Questions de validation des connaissances pour chaque chapitre avec résultats professionnels
- **🛠️ Exercices pratiques**: Activités pratiques avec scénarios réels de déploiement et dépannage
- **📊 Progression des compétences**: Avancement clair des concepts de base aux modèles d'entreprise avec focus développement de carrière
- **🎓 Cadre de certification**: Résultats de développement professionnel et système de reconnaissance communautaire
- **⏱️ Gestion du calendrier**: Plan d'apprentissage structuré sur 10 semaines avec validation d'étapes

### [v3.1.0] - 2025-09-17

#### Solutions IA multi-agents améliorées
**Cette version améliore la solution multi-agents retail avec un meilleur nommage des agents et une documentation enrichie.**

#### Modifié
- **Terminologie multi-agent**: Remplacement de "Cora agent" par "Customer agent" dans toute la solution multi-agents de vente au détail pour une compréhension plus claire
- **Architecture des agents**: Mise à jour de toute la documentation, des templates ARM et des exemples de code pour utiliser de façon cohérente la dénomination "Customer agent"
- **Exemples de configuration**: Modernisation des modèles de configuration des agents avec des conventions de nommage mises à jour
- **Cohérence de la documentation**: Vérification que toutes les références utilisent des noms d'agents professionnels et descriptifs

#### Amélioré
- **Package de templates ARM**: Mise à jour de retail-multiagent-arm-template avec des références à Customer agent
- **Diagrammes d'architecture**: Actualisation des diagrammes Mermaid avec le nouveau nommage des agents
- **Exemples de code**: Les classes Python et les exemples d'implémentation utilisent désormais la dénomination CustomerAgent
- **Variables d'environnement**: Mise à jour de tous les scripts de déploiement pour utiliser les conventions CUSTOMER_AGENT_NAME

#### Amélioré
- **Expérience développeur**: Rôles et responsabilités des agents plus clairs dans la documentation
- **Préparation à la production**: Meilleure alignement avec les conventions de nommage en entreprise
- **Matériel d'apprentissage**: Noms d'agents plus intuitifs pour les objectifs pédagogiques
- **Utilisabilité des templates**: Compréhension simplifiée des fonctions des agents et des modèles de déploiement

#### Détails techniques
- Mise à jour des diagrammes d'architecture Mermaid avec des références CustomerAgent
- Remplacement des noms de classe CoraAgent par CustomerAgent dans les exemples Python
- Modification des configurations JSON des templates ARM pour utiliser le type d'agent "customer"
- Mise à jour des variables d'environnement de CORA_AGENT_* vers CUSTOMER_AGENT_*
- Actualisation de toutes les commandes de déploiement et configurations de conteneurs

### [v3.0.0] - 2025-09-12

#### Changements majeurs - Orientation développeur IA et intégration Microsoft Foundry
**Cette version transforme le dépôt en une ressource d'apprentissage complète axée sur l'IA avec intégration Microsoft Foundry.**

#### Ajouté
- **🤖 Parcours d'apprentissage axé IA**: Restructuration complète priorisant les développeurs et ingénieurs IA
- **Guide d'intégration Microsoft Foundry**: Documentation complète pour connecter AZD aux services Microsoft Foundry
- **Modèles de déploiement de modèles IA**: Guide détaillé couvrant la sélection de modèles, la configuration et les stratégies de déploiement en production
- **AI Workshop Lab**: Atelier pratique de 2-3 heures pour convertir des applications IA en solutions déployables avec AZD
- **Bonnes pratiques IA pour la production**: Modèles prêts pour l'entreprise pour la mise à l'échelle, la surveillance et la sécurisation des workloads IA
- **Guide de dépannage spécifique à l'IA**: Dépannage complet pour Microsoft Foundry Models, Cognitive Services et problèmes de déploiement IA
- **Galerie de templates IA**: Collection mise en avant de templates Microsoft Foundry avec évaluations de complexité
- **Matériel d'atelier**: Structure complète d'atelier avec laboratoires pratiques et documents de référence

#### Amélioré
- **Structure du README**: Orientée développeur IA avec 45% de données d'intérêt communautaire provenant du Discord Microsoft Foundry
- **Parcours d'apprentissage**: Parcours dédié aux développeurs IA parallèlement aux parcours traditionnels pour étudiants et ingénieurs DevOps
- **Recommandations de templates**: Templates IA mis en avant incluant azure-search-openai-demo, contoso-chat, et openai-chat-app-quickstart
- **Intégration communautaire**: Support Discord amélioré avec canaux et discussions spécifiques à l'IA

#### Sécurité et orientation production
- **Patterns d'identité managée**: Authentification et configurations de sécurité spécifiques à l'IA
- **Optimisation des coûts**: Suivi de l'utilisation des tokens et contrôles budgétaires pour les workloads IA
- **Déploiement multi-région**: Stratégies pour le déploiement global d'applications IA
- **Surveillance des performances**: Métriques spécifiques à l'IA et intégration Application Insights

#### Qualité de la documentation
- **Structure de cours linéaire**: Progression logique du niveau débutant aux modèles avancés de déploiement IA
- **URLs validées**: Tous les liens externes du dépôt vérifiés et accessibles
- **Référence complète**: Tous les liens internes de documentation validés et fonctionnels
- **Prêt pour la production**: Modèles de déploiement d'entreprise avec exemples concrets

### [v2.0.0] - 2025-09-09

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle
**Cette version représente une refonte significative de la structure du dépôt et de la présentation du contenu.**

#### Ajouté
- **Cadre d'apprentissage structuré**: Toutes les pages de documentation incluent désormais des sections Introduction, Objectifs d'apprentissage et Résultats d'apprentissage
- **Système de navigation**: Ajout de liens Leçon précédente/Leçon suivante dans toute la documentation pour une progression guidée
- **Guide d'étude**: study-guide.md complet avec objectifs d'apprentissage, exercices pratiques et supports d'évaluation
- **Présentation professionnelle**: Suppression de toutes les icônes emoji pour une meilleure accessibilité et une apparence professionnelle
- **Structure de contenu améliorée**: Organisation et flux des matériels d'apprentissage améliorés

#### Modifié
- **Format de la documentation**: Standardisation de toute la documentation avec une structure axée sur l'apprentissage cohérente
- **Flux de navigation**: Mise en place d'une progression logique à travers tout le contenu d'apprentissage
- **Présentation du contenu**: Éléments décoratifs supprimés au profit d'un formatage clair et professionnel
- **Structure des liens**: Mise à jour de tous les liens internes pour prendre en charge le nouveau système de navigation

#### Amélioré
- **Accessibilité**: Suppression des dépendances aux emoji pour une meilleure compatibilité avec les lecteurs d'écran
- **Apparence professionnelle**: Présentation épurée de style académique adaptée aux environnements d'entreprise
- **Expérience d'apprentissage**: Approche structurée avec objectifs et résultats clairs pour chaque leçon
- **Organisation du contenu**: Meilleure logique et connexion entre les sujets liés

### [v1.0.0] - 2025-09-09

#### Première version - Dépôt d'apprentissage AZD complet

#### Ajouté
- **Structure de documentation principale**
  - Série complète de guides de démarrage
  - Documentation complète de déploiement et de provisioning
  - Ressources détaillées de dépannage et guides de debug
  - Outils et procédures de validation pré-déploiement

- **Module Démarrage**
  - AZD Basics: Concepts et terminologie de base
  - Installation Guide: Instructions d'installation spécifiques à la plateforme
  - Configuration Guide: Configuration de l'environnement et authentification
  - First Project Tutorial: Tutoriel pratique pas-à-pas

- **Module Déploiement et Provisioning**
  - Deployment Guide: Documentation du workflow complet
  - Provisioning Guide: Infrastructure as Code avec Bicep
  - Bonnes pratiques pour les déploiements en production
  - Modèles d'architecture multi-service

- **Module Validation pré-déploiement**
  - Capacity Planning: Validation de la disponibilité des ressources Azure
  - SKU Selection: Guide complet des niveaux de service
  - Pre-flight Checks: Scripts de validation automatisés (PowerShell et Bash)
  - Estimation des coûts et outils de planification budgétaire

- **Module Dépannage**
  - Common Issues: Problèmes fréquemment rencontrés et solutions
  - Debugging Guide: Méthodologies de dépannage systématique
  - Techniques et outils de diagnostic avancés
  - Surveillance des performances et optimisation

- **Ressources et Références**
  - Command Cheat Sheet: Référence rapide des commandes essentielles
  - Glossary: Définitions complètes des termes et acronymes
  - FAQ: Réponses détaillées aux questions courantes
  - Liens de ressources externes et connexions communautaires

- **Exemples et Templates**
  - Exemple d'application web simple
  - Modèle de déploiement de site statique
  - Configuration d'application conteneurisée
  - Modèles d'intégration de base de données
  - Exemples d'architecture microservices
  - Implémentations de fonctions serverless

#### Fonctionnalités
- **Prise en charge multiplateforme**: Guides d'installation et de configuration pour Windows, macOS et Linux
- **Niveaux de compétence multiples**: Contenu conçu pour les étudiants jusqu'aux développeurs professionnels
- **Orientation pratique**: Exemples pratiques et scénarios réels
- **Couverture complète**: Des concepts de base aux modèles d'entreprise avancés
- **Approche axée sur la sécurité**: Bonnes pratiques de sécurité intégrées tout au long
- **Optimisation des coûts**: Conseils pour des déploiements économiques et la gestion des ressources

#### Qualité de la documentation
- **Exemples de code détaillés**: Exemples de code pratiques et testés
- **Instructions étape par étape**: Conseils clairs et exploitables
- **Gestion complète des erreurs**: Dépannage pour les problèmes courants
- **Intégration des meilleures pratiques**: Normes et recommandations de l'industrie
- **Compatibilité des versions**: À jour avec les derniers services Azure et fonctionnalités azd

## Améliorations futures prévues

### Version 3.1.0 (Planned)
#### Expansion de la plateforme IA
- **Support multi-modèle**: Modèles d'intégration pour Hugging Face, Azure Machine Learning, et modèles personnalisés
- **Frameworks d'agents IA**: Modèles pour les déploiements LangChain, Semantic Kernel, et AutoGen
- **Modèles RAG avancés**: Options de bases de données vectorielles au-delà d'Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilité IA**: Surveillance améliorée des performances des modèles, de l'utilisation des tokens, et de la qualité des réponses

#### Expérience développeur
- **Extension VS Code**: Expérience de développement intégrée AZD + Microsoft Foundry
- **Intégration GitHub Copilot**: Génération assistée par IA de modèles AZD
- **Tutoriels interactifs**: Exercices pratiques de codage avec validation automatisée pour des scénarios IA
- **Contenu vidéo**: Tutoriels vidéo complémentaires pour les apprenants visuels axés sur les déploiements IA

### Version 4.0.0 (Planifiée)
#### Modèles IA d'entreprise
- **Cadre de gouvernance**: Gouvernance des modèles IA, conformité, et pistes d'audit
- **IA multi-tenant**: Modèles pour desservir plusieurs clients avec des services IA isolés
- **Déploiement IA en périphérie**: Intégration avec Azure IoT Edge et container instances
- **IA cloud hybride**: Modèles de déploiement multi-cloud et hybrides pour les charges de travail IA

#### Fonctionnalités avancées
- **Automatisation des pipelines IA**: Intégration MLOps avec les pipelines Azure Machine Learning
- **Sécurité avancée**: Modèles Zero Trust, endpoints privés, et protection avancée contre les menaces
- **Optimisation des performances**: Stratégies avancées de réglage et de mise à l'échelle pour les applications IA à haut débit
- **Distribution mondiale**: Modèles de diffusion de contenu et de mise en cache en périphérie pour les applications IA

### Version 3.0.0 (Planifiée) - Supplantée par la version actuelle
#### Ajouts proposés - Maintenant implémentés en v3.0.0
- ✅ **Contenu axé IA**: Intégration complète de Microsoft Foundry (Terminé)
- ✅ **Tutoriels interactifs**: Atelier pratique sur l'IA (Terminé)
- ✅ **Module de sécurité avancé**: Modèles de sécurité spécifiques à l'IA (Terminé)
- ✅ **Optimisation des performances**: Stratégies d'ajustement des charges de travail IA (Terminé)

### Version 2.1.0 (Planifiée) - Partiellement implémentée en v3.0.0
#### Améliorations mineures - Certaines réalisées dans la version actuelle
- ✅ **Exemples supplémentaires**: Scénarios de déploiement axés IA (Terminé)
- ✅ **FAQ étendue**: Questions et dépannage spécifiques à l'IA (Terminé)
- **Intégration d'outils**: Guides améliorés d'intégration des IDE et éditeurs
- ✅ **Extension de la surveillance**: Modèles de surveillance et d'alerte spécifiques à l'IA (Terminé)

#### Toujours prévu pour une future version
- **Documentation adaptée aux mobiles**: Conception responsive pour l'apprentissage sur mobile
- **Accès hors ligne**: Packages de documentation téléchargeables
- **Intégration IDE améliorée**: Extension VS Code pour les workflows AZD + IA
- **Tableau de bord communautaire**: Mesures communautaires en temps réel et suivi des contributions

## Contribuer au changelog

### Signalement des changements
Lorsque vous contribuez à ce dépôt, veuillez vous assurer que les entrées du changelog incluent :

1. **Numéro de version**: En suivant le versionnage sémantique (major.minor.patch)
2. **Date**: Date de sortie ou de mise à jour au format YYYY-MM-DD
3. **Catégorie**: Ajouté, Modifié, Déprécié, Supprimé, Corrigé, Sécurité
4. **Description claire**: Description concise de ce qui a changé
5. **Évaluation de l'impact**: Comment les changements affectent les utilisateurs existants

### Catégories de changement

#### Ajouté
- Nouvelles fonctionnalités, sections de documentation ou capacités
- Nouveaux exemples, modèles, ou ressources d'apprentissage
- Outils supplémentaires, scripts, ou utilitaires

#### Modifié
- Modifications de la fonctionnalité existante ou de la documentation
- Mises à jour pour améliorer la clarté ou l'exactitude
- Restructuration du contenu ou de l'organisation

#### Déprécié
- Fonctionnalités ou approches en cours d'abandon
- Sections de documentation prévues pour suppression
- Méthodes pour lesquelles il existe de meilleures alternatives

#### Supprimé
- Fonctionnalités, documentation, ou exemples qui ne sont plus pertinents
- Informations obsolètes ou approches dépréciées
- Contenu redondant ou consolidé

#### Corrigé
- Corrections d'erreurs dans la documentation ou le code
- Résolution des problèmes signalés
- Améliorations de l'exactitude ou des fonctionnalités

#### Sécurité
- Améliorations ou corrections liées à la sécurité
- Mises à jour des meilleures pratiques de sécurité
- Résolution des vulnérabilités de sécurité

### Directives de versionnage sémantique

#### Version majeure (X.0.0)
- Changements incompatibles nécessitant une action de la part des utilisateurs
- Restructuration significative du contenu ou de l'organisation
- Changements modifiant l'approche ou la méthodologie fondamentale

#### Version mineure (X.Y.0)
- Nouvelles fonctionnalités ou ajouts de contenu
- Améliorations conservant la rétrocompatibilité
- Exemples, outils, ou ressources supplémentaires

#### Version corrective (X.Y.Z)
- Corrections de bogues et rectifications
- Améliorations mineures du contenu existant
- Clarifications et petites améliorations

## Retours et suggestions de la communauté

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d'apprentissage :

### Comment fournir des retours
- **GitHub Issues**: Signalez des problèmes ou proposez des améliorations (les problèmes spécifiques à l'IA sont bienvenus)
- **Discord Discussions**: Partagez des idées et échangez avec la communauté Microsoft Foundry
- **Pull Requests**: Contribuez des améliorations directes au contenu, en particulier les modèles et guides IA
- **Microsoft Foundry Discord**: Participez au canal #Azure pour les discussions AZD + IA
- **Forums communautaires**: Participez aux discussions plus larges des développeurs Azure

### Catégories de retours
- **Précision du contenu IA**: Corrections concernant l'intégration des services IA et les informations de déploiement
- **Expérience d'apprentissage**: Suggestions pour améliorer le parcours d'apprentissage des développeurs IA
- **Contenu IA manquant**: Demandes de modèles, patrons ou exemples IA supplémentaires
- **Accessibilité**: Améliorations pour des besoins d'apprentissage divers
- **Intégration d'outils IA**: Suggestions pour une meilleure intégration des workflows de développement IA
- **Patrons IA de production**: Requêtes de modèles de déploiement IA en entreprise

### Engagement de réponse
- **Réponse aux issues**: Dans les 48 heures pour les problèmes signalés
- **Demandes de fonctionnalités**: Évaluation sous une semaine
- **Contributions de la communauté**: Revue sous une semaine
- **Problèmes de sécurité**: Priorité immédiate avec réponse accélérée

## Calendrier de maintenance

### Mises à jour régulières
- **Revues mensuelles**: Exactitude du contenu et validation des liens
- **Mises à jour trimestrielles**: Ajouts et améliorations majeurs de contenu
- **Revues semi-annuelles**: Restructuration et amélioration complètes
- **Sorties annuelles**: Mises à jour de versions majeures avec améliorations significatives

### Surveillance et assurance qualité
- **Tests automatisés**: Validation régulière des exemples de code et des liens
- **Intégration des retours de la communauté**: Incorporation régulière des suggestions des utilisateurs
- **Mises à jour technologiques**: Alignement avec les derniers services Azure et les releases azd
- **Audits d'accessibilité**: Revue régulière des principes de conception inclusive

## Politique de support des versions

### Support de la version actuelle
- **Dernière version majeure**: Support complet avec mises à jour régulières
- **Version majeure précédente**: Mises à jour de sécurité et correctifs critiques pendant 12 mois
- **Versions héritées**: Support communautaire uniquement, pas de mises à jour officielles

### Conseils de migration
Lorsque des versions majeures sont publiées, nous fournissons :
- **Guides de migration**: Instructions de transition étape par étape
- **Notes de compatibilité**: Détails sur les changements incompatibles
- **Support d'outils**: Scripts ou utilitaires pour aider à la migration
- **Support communautaire**: Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon précédente**: [Guide d'étude](resources/study-guide.md)
- **Leçon suivante**: Retour à [README principal](README.md)

**Restez informé**: Surveillez ce dépôt pour les notifications concernant les nouvelles versions et les mises à jour importantes des supports d'apprentissage.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction automatique par IA Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->