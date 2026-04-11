# Journal des modifications - AZD Pour Débutants

## Introduction

Ce journal des modifications documente tous les changements notables, mises à jour et améliorations du dépôt AZD Pour Débutants. Nous suivons les principes de versionnage sémantique et tenons ce journal pour aider les utilisateurs à comprendre ce qui a changé entre les versions.

## Objectifs d'apprentissage

En consultant ce journal des modifications, vous allez :
- Rester informé des nouvelles fonctionnalités et ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bogues et ajustements pour garantir l’exactitude
- Suivre l’évolution des supports d’apprentissage au fil du temps

## Résultats d'apprentissage

Après avoir consulté les entrées du journal des modifications, vous serez en mesure de :
- Identifier les nouveaux contenus et ressources disponibles pour l’apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d’apprentissage en fonction des supports les plus récents
- Contribuer avec des retours et suggestions pour des améliorations futures

## Historique des versions

### [v3.19.1] - 2026-03-27

#### Clarification de l’intégration des débutants, validation de la configuration et nettoyage final des commandes AZD
**Cette version fait suite à la validation AZD 1.23 avec une passe de documentation orientée débutants : elle clarifie les consignes d’authentification AZD-first, ajoute des scripts de validation locale, vérifie les commandes clés avec le CLI AZD en temps réel, et supprime les dernières références obsolètes aux commandes sources anglaises en dehors du changelog.**

#### Ajouté
- **🧪 Scripts de validation de configuration pour débutants** avec `validate-setup.ps1` et `validate-setup.sh` pour que les apprenants puissent confirmer les outils requis avant de démarrer le Chapitre 1
- **✅ Étapes de validation de configuration en amont** dans le README racine et le README du Chapitre 1 afin que les prérequis manquants soient détectés avant `azd up`

#### Modifié
- **🔐 Consignes d’authentification pour débutants** qui traitent désormais systématiquement `azd auth login` comme la voie principale des workflows AZD, avec `az login` signalé comme optionnel sauf si les commandes Azure CLI sont utilisées directement
- **📚 Flux d’intégration Chapitre 1** qui oriente désormais les apprenants vers la validation de leur configuration locale avant l’installation, l’authentification et les premières étapes de déploiement
- **🛠️ Messages du validateur** qui distinguent clairement les prérequis bloquants des avertissements optionnels Azure CLI pour le parcours débutant uniquement AZD
- **📖 Documentation configuration, dépannage et exemples** qui différencie maintenant l’authentification AZD obligatoire et la connexion Azure CLI optionnelle là où les deux étaient auparavant présentées sans contexte

#### Corrigé
- **📋 Références restantes aux commandes sources anglaises** mises à jour vers les formes AZD actuelles, incluant `azd config show` dans la feuille de référence et `azd monitor --overview` là où la vue d’ensemble du portail Azure était prévue
- **🧭 Formulations optimisées des promesses pour débutants dans le Chapitre 1** pour éviter de garantir un comportement sans erreur ou de rollback systématique sur tous les modèles et ressources Azure
- **🔎 Validation CLI en direct** confirmée pour la prise en charge actuelle de `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, et `azd down --force --purge`

#### Fichiers mis à jour
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Validation AZD 1.23.12, extension de l’environnement d’atelier et actualisation des modèles d’IA
**Cette version effectue un balayage de validation de la documentation contre `azd` `1.23.12`, met à jour les exemples de commandes AZD obsolètes, rafraîchit les consignes du modèle IA aux valeurs par défaut actuelles, et élargit les instructions d’atelier au-delà de GitHub Codespaces pour prendre également en charge les conteneurs de développement et les clones locaux.**

#### Ajouté
- **✅ Notes de validation dans les chapitres principaux et docs d’atelier** pour expliciter la baseline AZD testée par les apprenants utilisant des versions de CLI plus récentes ou plus anciennes
- **⏱️ Conseils de timeout de déploiement** pour les déploiements d’applications IA longs utilisant `azd deploy --timeout 1800`
- **🔎 Étapes d’inspection des extensions** avec `azd extension show azure.ai.agents` dans la documentation des workflows IA
- **🌐 Conseils élargis sur les environnements d’atelier** couvrant GitHub Codespaces, conteneurs dev, et clones locaux avec MkDocs

#### Modifié
- **📚 README intro des chapitres** qui indiquent désormais systématiquement la validation contre `azd 1.23.12` pour les sections fondation, configuration, infrastructure, multi-agent, pré-déploiement, dépannage et production
- **🛠️ Références commandes AZD** mises à jour vers les formes actuelles dans la doc :
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` selon contexte
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` quand une vue d’ensemble Application Insights est prévue
- **🧪 Exemples de provision en preview** simplifiés à l’usage actuel pris en charge comme `azd provision --preview` et `azd provision --preview -e production`
- **🧭 Flux d’atelier** mis à jour pour que les apprenants puissent compléter les labs dans Codespaces, un conteneur dev, ou un clone local au lieu de supposer une exécution uniquement Codespaces
- **🔐 Consignes d’authentification** qui préfèrent désormais `azd auth login` pour les workflows AZD, avec `az login` présenté comme optionnel lors de l’utilisation directe de commandes Azure CLI

#### Corrigé
- **🪟 Commandes d’installation Windows** normalisées en respectant la casse actuelle des packages `winget` dans le guide d’installation
- **🐧 Conseils d’installation Linux** corrigés pour éviter les instructions `azd` spécifiques à une distro non supportée et pointer aux assets de release lorsque c’est approprié
- **📦 Exemples de modèles IA** rafraîchis des anciens par défaut comme `gpt-35-turbo` et `text-embedding-ada-002` vers des exemples actuels tels que `gpt-4.1-mini`, `gpt-4.1`, et `text-embedding-3-large`
- **📋 Snippets déploiement et diagnostic** corrigés pour utiliser les commandes environnement et statut actuelles dans les journaux, scripts et étapes de dépannage
- **⚙️ Guide GitHub Actions** mis à jour de `Azure/setup-azd@v1.0.0` vers `Azure/setup-azd@v2`
- **🤖 Consignes MCP/Copilot consent** mises à jour de `azd mcp consent` à `azd copilot consent list`

#### Amélioré
- **🧠 Consignes chapitres IA** qui expliquent mieux le comportement `azd ai` sensible aux préviews, la connexion spécifique à un locataire, l’usage actuel des extensions, et les recommandations mises à jour de déploiement de modèles
- **🧪 Instructions d’atelier** qui utilisent des exemples de versions plus réalistes et un langage de configuration d’environnement plus clair pour les labs pratiques
- **📈 Docs production et dépannage** qui s’alignent désormais mieux avec la surveillance actuelle, les modèles de secours, et exemples de niveaux de coût

#### Fichiers mis à jour
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Commandes AZD AI CLI, validation de contenu et extension des modèles
**Cette version ajoute la couverture des commandes `azd ai`, `azd extension` et `azd mcp` dans tous les chapitres liés à l’IA, corrige les liens cassés et le code obsolète dans agents.md, met à jour la feuille de référence, et refond la section des modèles exemples avec des descriptions validées et de nouveaux modèles Azure AI AZD.**

#### Ajouté
- **🤖 Couverture AZD AI CLI** dans 7 fichiers (auparavant seulement dans le Chapitre 8) :
  - `docs/chapter-01-foundation/azd-basics.md` — Nouvelle section « Extensions et commandes AI » introduisant `azd extension`, `azd ai agent init` et `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4 : `azd ai agent init` avec tableau comparatif (approche template vs manifeste)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sous-sections « Extensions AZD pour Foundry » et « Déploiement Agent-First »
  - `docs/chapter-05-multi-agent/README.md` — Démarrage rapide montrant maintenant les deux voies de déploiement template et manifeste
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Section déploiement incluant maintenant l’option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sous-section « Commandes Extension AZD AI pour diagnostic »
  - `resources/cheat-sheet.md` — Nouvelle section « Commandes AI & Extensions » avec `azd extension`, `azd ai agent init`, `azd mcp`, et `azd infra generate`
- **📦 Nouveaux modèles exemples AZD AI** dans `microsoft-foundry-integration.md` :
  - **azure-search-openai-demo-csharp** — Chat .NET RAG avec Blazor WebAssembly, Semantic Kernel et support vocal
  - **azure-search-openai-demo-java** — Chat Java RAG utilisant Langchain4J avec options ACA/AKS déploiement
  - **contoso-creative-writer** — Application d’écriture créative multi-agent utilisant Azure AI Agent Service, Bing Grounding et Prompty
  - **serverless-chat-langchainjs** — RAG serverless utilisant Azure Functions + LangChain.js + Cosmos DB avec support local Ollama
  - **chat-with-your-data-solution-accelerator** — Accélérateur RAG entreprise avec portail admin, intégration Teams, et options PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Application de référence d’orchestration MCP multi-agent avec serveurs en .NET, Python, Java et TypeScript
  - **azd-ai-starter** — Modèle de départ minimal d’infrastructure Azure AI en Bicep
  - **🔗 Lien Galerie AZD AI Awesome** — Référence à la [galerie AI awesome-azd](https://azure.github.io/awesome-azd/?tags=ai) (plus de 80 modèles)

#### Corrigé
- **🔗 Navigation agents.md** : liens Précédent/Suivant alignés sur l’ordre des leçons du README Chapitre 2 (Intégration Microsoft Foundry → Agents → Déploiement modèle AI)
- **🔗 Liens cassés agents.md** : correction de `production-ai-practices.md` vers `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 Code obsolète agents.md** : remplacement de `opencensus` par `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API invalide agents.md** : déplacement de `max_tokens` de `create_agent()` vers `create_run()` en tant que `max_completion_tokens`
- **🔢 Comptage tokens agents.md** : remplacement de l’estimation approximative `len//4` par `tiktoken.encoding_for_model()`
- **azure-search-openai-demo** : correction des services de « Cognitive Search + App Service » à « Azure AI Search + Azure Container Apps » (hôte par défaut modifié en oct. 2024)
- **contoso-chat** : mise à jour de la description pour référencer Azure AI Foundry + Prompty, et correspondre au titre et stack tech réels du dépôt

#### Supprimé
- **ai-document-processing** : suppression de la référence au modèle non fonctionnel (dépôt non accessible publiquement comme modèle AZD)

#### Amélioré
- **📝 exercices agents.md** : L’exercice 1 affiche désormais la sortie attendue et l’étape `azd monitor` ; L’exercice 2 inclut le code complet d’enregistrement de `FunctionTool` ; L’exercice 3 remplace les indications vagues par des commandes concrètes `prepdocs.py`
- **📚 ressources agents.md** : Liens de documentation mis à jour vers les docs actuelles d’Azure AI Agent Service et le démarrage rapide
- **📋 tableau des prochaines étapes agents.md** : Ajout du lien vers le laboratoire AI Workshop pour une couverture complète du chapitre

#### Fichiers mis à jour
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Amélioration de la navigation dans le cours
**Cette version améliore la navigation dans README.md avec un format de tableau amélioré.**

#### Modifications
- **Tableau de la carte du cours** : Amélioré avec des liens directs vers les leçons, des durées estimées et des niveaux de complexité
- **Nettoyage des dossiers** : Suppression des anciens dossiers redondants (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validation des liens** : Tous les 21+ liens internes du tableau de la carte du cours vérifiés

### [v3.16.0] - 2026-02-05

#### Mises à jour des noms de produits
**Cette version met à jour les références produit selon le branding actuel de Microsoft.**

#### Modifications
- **Microsoft Foundry → Microsoft Foundry** : Toutes les références mises à jour dans les fichiers hors traduction
- **Azure AI Agent Service → Foundry Agents** : Nom du service modifié pour refléter le branding actuel

#### Fichiers mis à jour
- `README.md` - Page d’accueil principale du cours
- `changelog.md` - Historique des versions
- `course-outline.md` - Structure du cours
- `docs/chapter-02-ai-development/agents.md` - Guide des agents IA
- `examples/README.md` - Documentation des exemples
- `workshop/README.md` - Page d’accueil de l’atelier
- `workshop/docs/index.md` - Index de l’atelier
- `workshop/docs/instructions/*.md` - Tous les fichiers d’instructions de l’atelier

---

### [v3.15.0] - 2026-02-05

#### Restructuration majeure du dépôt : noms de dossiers par chapitre
**Cette version restructure la documentation en dossiers dédiés par chapitre pour une navigation plus claire.**

#### Renommages de dossiers
Les anciens dossiers ont été remplacés par des dossiers numérotés par chapitre :
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ajout de : `docs/chapter-05-multi-agent/`

#### Migrations de fichiers
| Fichier | Depuis | Vers |
|---------|--------|------|
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
| Tous les fichiers pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Tous les fichiers troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ajout
- **📚 fichiers README par chapitre** : Création de README.md dans chaque dossier de chapitre avec :
  - Objectifs d’apprentissage et durée
  - Tableau des leçons avec descriptions
  - Commandes de démarrage rapide
  - Navigation vers les autres chapitres

#### Modifications
- **🔗 Mise à jour de tous les liens internes** : 78+ chemins mis à jour dans tous les fichiers de documentation
- **🗺️ README.md principal** : Mise à jour de la carte du cours avec la nouvelle structure par chapitre
- **📝 examples/README.md** : Mise à jour des références croisées vers dossiers par chapitre

#### Suppression
- Ancienne structure de dossiers (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructuration du dépôt : navigation par chapitre
**Cette version a ajouté des fichiers README de navigation par chapitre (suppléé par v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nouveau guide pour agents IA
**Cette version ajoute un guide complet pour le déploiement des agents IA avec Azure Developer CLI.**

#### Ajout
- **🤖 docs/microsoft-foundry/agents.md** : Guide complet couvrant :
  - Qu’est-ce qu’un agent IA et comment il diffère des chatbots
  - Trois modèles rapides d’agents (Foundry Agents, Prompty, RAG)
  - Modèles d’architecture des agents (agent unique, RAG, multi-agent)
  - Configuration et personnalisation des outils
  - Monitoring et suivi des métriques
  - Considérations de coûts et optimisation
  - Scénarios fréquents de dépannage
  - Trois exercices pratiques avec critères de réussite

#### Structure du contenu
- **Introduction** : Concepts d’agents pour débutants
- **Démarrage rapide** : Déploiement d’agents avec `azd init --template get-started-with-ai-agents`
- **Modèles d’architecture** : Diagrammes visuels des modèles d’agents
- **Configuration** : Mise en place des outils et variables d’environnement
- **Monitoring** : Intégration d’Application Insights
- **Exercices** : Apprentissage pratique progressif (20-45 minutes chacun)

---

### [v3.12.0] - 2026-02-05

#### Mise à jour de l’environnement DevContainer
**Cette version met à jour la configuration du conteneur de développement avec des outils modernes et de meilleures valeurs par défaut pour l’expérience AZD.**

#### Modifications
- **🐳 Image de base** : Mise à jour de `python:3.12-bullseye` vers `python:3.12-bookworm` (Dernière version stable Debian)
- **📛 Nom du conteneur** : renommé de "Python 3" à "AZD for Beginners" pour plus de clarté

#### Ajouts
- **🔧 Nouvelles fonctionnalités du conteneur Dev** :
  - `azure-cli` avec support Bicep activé
  - `node:20` (version LTS pour les templates AZD)
  - `github-cli` pour gestion des templates
  - `docker-in-docker` pour déploiements de container apps

- **🔌 Redirection de ports** : Ports préconfigurés pour développement courant :
  - 8000 (aperçu MkDocs)
  - 3000 (applications web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Extensions VS Code ajoutées** :
  - `ms-python.vscode-pylance` - IntelliSense Python amélioré
  - `ms-azuretools.vscode-azurefunctions` - Support Azure Functions
  - `ms-azuretools.vscode-docker` - Support Docker
  - `ms-azuretools.vscode-bicep` - Support langage Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestion des ressources Azure
  - `yzhang.markdown-all-in-one` - édition Markdown
  - `DavidAnson.vscode-markdownlint` - lint Markdown
  - `bierner.markdown-mermaid` - support diagrammes Mermaid
  - `redhat.vscode-yaml` - support YAML (pour azure.yaml)
  - `eamodio.gitlens` - visualisation Git
  - `mhutchie.git-graph` - historique Git

- **⚙️ Paramètres VS Code** : réglages par défaut ajoutés pour interpréteur Python, formatage à la sauvegarde, suppression des espaces blancs

- **📦 Mise à jour de requirements-dev.txt** :
  - Ajout du plugin MkDocs minify
  - Ajout de pre-commit pour la qualité du code
  - Ajout des packages Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrections
- **Commande post-création** : vérifie maintenant l’installation d’AZD et Azure CLI au démarrage du conteneur

---

### [v3.11.0] - 2026-02-05

#### Refonte du README pour les débutants
**Cette version améliore significativement le README.md pour le rendre plus accessible aux débutants et ajoute des ressources essentielles pour les développeurs IA.**

#### Ajouts
- **🆚 Comparaison Azure CLI vs AZD** : Explication claire de quand utiliser chaque outil avec exemples pratiques
- **🌟 Super liens AZD** : Liens directs vers la galerie de templates communautaires et les ressources de contribution :
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templates prêts à déployer
  - [Soumettre un template](https://github.com/Azure/awesome-azd/issues) - Contribution communautaire
- **🎯 Guide de démarrage rapide** : Section simplifiée en 3 étapes (Installation → Connexion → Déploiement)
- **📊 Tableau de navigation basé sur l’expérience** : Orientation claire sur où débuter selon le niveau du développeur

#### Modifications
- **Structure du README** : Réorganisé pour une information progressive – la plus importante en premier
- **Section Introduction** : Réécrite pour expliquer "La magie de `azd up`" aux débutants complets
- **Suppression de contenu dupliqué** : Élimination de la section dépannage en double
- **Commandes de dépannage** : Correction de la référence `azd logs` vers `azd monitor --logs`

#### Corrections
- **🔐 Commandes d’authentification** : Ajout de `azd auth login` et `azd auth logout` dans cheat-sheet.md
- **Références à des commandes invalides** : Suppression des occurrences restantes de `azd logs` dans la section dépannage du README

#### Notes
- **Portée** : Changements appliqués à README.md principal et resources/cheat-sheet.md
- **Public cible** : Améliorations spécialement destinées aux développeurs débutants avec AZD

---

### [v3.10.0] - 2026-02-05

#### Mise à jour de l’exactitude des commandes Azure Developer CLI
**Cette version corrige les commandes AZD inexistantes dans toute la documentation, garantissant que tous les exemples utilisent une syntaxe valide.**

#### Corrections
- **🔧 Commandes AZD inexistantes supprimées** : Audit complet et correction des commandes invalides :
  - `azd logs` (inexistante) → remplacée par `azd monitor --logs` ou alternatives Azure CLI
  - Sous-commandes `azd service` (inexistantes) → remplacées par `azd show` et Azure CLI
  - `azd infra import/export/validate` (inexistantes) → supprimées ou remplacées par des alternatives valides
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (inexistants) → supprimés
  - Flags `azd provision --what-if/--rollback` (inexistants) → mis à jour vers `--preview`
  - `azd config validate` (inexistant) → remplacé par `azd config list`
  - `azd info`, `azd history`, `azd metrics` (inexistants) → supprimés

- **📚 Fichiers mis à jour avec corrections de commandes** :
  - `resources/cheat-sheet.md` : refonte majeure de la référence des commandes
  - `docs/deployment/deployment-guide.md` : corrections des stratégies de rollback et déploiement
  - `docs/troubleshooting/debugging.md` : correction des sections d’analyse des logs
  - `docs/troubleshooting/common-issues.md` : mise à jour des commandes de dépannage
  - `docs/troubleshooting/ai-troubleshooting.md` : correction de la section debug AZD
  - `docs/getting-started/azd-basics.md` : correction des commandes de monitoring
  - `docs/getting-started/first-project.md` : mise à jour des exemples de monitoring et debug
  - `docs/getting-started/installation.md` : correction des exemples d’aide et version
  - `docs/pre-deployment/application-insights.md` : correction des commandes de visualisation de logs
  - `docs/pre-deployment/coordination-patterns.md` : correction des commandes debug agents

- **📝 Référence de version mise à jour** :
  - `docs/getting-started/installation.md` : changement de la version codée en dur `1.5.0` vers générique `1.x.x` avec lien vers les releases

#### Modifications
- **Stratégies de rollback** : Documentation mise à jour pour utiliser rollback basé sur Git (AZD ne gère pas de rollback natif)
- **Visualisation des logs** : Remplacement des références `azd logs` par `azd monitor --logs`, `azd monitor --live` et commandes Azure CLI
- **Section performance** : Suppression des flags parallèles/incrémentiels inexistants, fourniture d’alternatives valides

#### Détails techniques
- **Commandes AZD valides** : `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags valides pour azd monitor** : `--live`, `--logs`, `--overview`
- **Fonctionnalités supprimées** : `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Vérification** : Commandes validées avec Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Complétion de l’atelier et mise à jour de la qualité de la documentation
**Cette version complète les modules interactifs de l'atelier, corrige tous les liens de documentation cassés, et améliore la qualité globale du contenu pour les développeurs IA utilisant Microsoft AZD.**

#### Ajouté
- **📝 CONTRIBUTING.md** : Nouveau document de directives de contribution avec :
  - Instructions claires pour signaler les problèmes et proposer des modifications
  - Normes de documentation pour les nouveaux contenus
  - Directives pour les exemples de code et conventions de messages de commit
  - Informations sur l'engagement communautaire

#### Complété
- **🎯 Module 7 de l’atelier (Conclusion)** : Module de clôture entièrement complété avec :
  - Résumé complet des réalisations de l’atelier
  - Section sur les concepts clés maîtrisés couvrant AZD, les modèles, et Microsoft Foundry
  - Recommandations pour la poursuite du parcours d’apprentissage
  - Exercices défi de l’atelier avec niveaux de difficulté
  - Retours de la communauté et liens de support

- **📚 Module 3 de l’atelier (Déconstruction)** : Objectifs d’apprentissage mis à jour avec :
  - Activation de GitHub Copilot avec serveurs MCP
  - Compréhension de la structure des dossiers des templates AZD
  - Organisation infrastructure-as-code (Bicep) 
  - Instructions pour le laboratoire pratique

- **🔧 Module 6 de l’atelier (Démontage)** : Complété avec :
  - Objectifs de nettoyage des ressources et gestion des coûts
  - Utilisation de `azd down` pour une désinfrastructure sécurisée
  - Guide de récupération des services cognitifs supprimés en douceur
  - Incitations bonus pour l’exploration de GitHub Copilot et Azure Portal

#### Corrigé
- **🔗 Correction des liens cassés** : Plus de 15 liens internes de documentation corrigés :
  - `docs/ai-foundry/ai-model-deployment.md` : Chemins corrigés vers microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md` : Chemins corrigés pour ai-model-deployment.md et production-ai-practices.md
  - `docs/getting-started/first-project.md` : cicd-integration.md remplacé par deployment-guide.md qui était inexistant
  - `examples/retail-scenario.md` : Chemins FAQ et guide de dépannage corrigés
  - `examples/container-app/microservices/README.md` : Chemins corrigés du guide principal et guide de déploiement
  - `resources/faq.md` et `resources/glossary.md` : Mises à jour des références au chapitre IA
  - `course-outline.md` : Corrections du guide instructeur et références aux laboratoires de l’atelier IA

- **📅 Bannière de statut d’atelier** : Mise à jour de "En cours" vers statut d’atelier actif avec date février 2026

- **🔗 Navigation de l’atelier** : Liens de navigation cassés dans README.md de l’atelier corrigés, notamment vers dossier lab-1-azd-basics inexistant

#### Changé
- **Présentation de l’atelier** : Suppression du message "en cours de construction", l’atelier est désormais complet et prêt à l’emploi
- **Cohérence de navigation** : Tous les modules d’atelier disposent d’une navigation inter-module correcte
- **Références au parcours d’apprentissage** : Références croisées dans les chapitres mises à jour avec les bons chemins microsoft-foundry

#### Validé
- ✅ Tous les fichiers markdown anglais ont des liens internes valides
- ✅ Modules 0 à 7 de l’atelier complets avec objectifs d’apprentissage
- ✅ Navigation entre chapitres et modules fonctionnelle
- ✅ Contenu adapté aux développeurs IA utilisant Microsoft AZD
- ✅ Langage accessible aux débutants maintenu partout
- ✅ CONTRIBUTING.md offre des consignes claires pour les contributeurs

#### Implémentation technique
- **Validation des liens** : Script PowerShell automatisé vérifié pour tous les liens internes .md
- **Audit de contenu** : Revue manuelle de la complétude de l’atelier et adaptation aux débutants
- **Système de navigation** : Uniformisation des modèles de navigation dans chapitres et modules

#### Notes
- **Portée** : Changements appliqués uniquement à la documentation en anglais
- **Traductions** : Dossiers de traduction non mis à jour dans cette version (la synchronisation automatique suivra)
- **Durée de l’atelier** : L’atelier complet offre désormais 3 à 4 heures d’apprentissage pratique

---

### [v3.8.0] - 2025-11-19

#### Documentation avancée : surveillance, sécurité et modèles multi-agent
**Cette version ajoute des leçons complètes de niveau A sur l’intégration d’Application Insights, les modèles d’authentification et la coordination multi-agent pour les déploiements en production.**

#### Ajouté
- **📊 Leçon sur l’intégration Application Insights** : dans `docs/pre-deployment/application-insights.md` :
  - Déploiement axé AZD avec provisionnement automatique
  - Modèles Bicep complets pour Application Insights + Log Analytics
  - Applications Python fonctionnelles avec télémétrie personnalisée (plus de 1 200 lignes)
  - Modèles de surveillance IA/LLM (suivi des jetons/coûts des modèles Microsoft Foundry)
  - 6 diagrammes Mermaid (architecture, traçage distribué, flux télémétrie)
  - 3 exercices pratiques (alertes, tableaux de bord, surveillance IA)
  - Exemples de requêtes Kusto et stratégies d’optimisation des coûts
  - Streaming métrique en direct et débogage en temps réel
  - Durée d’apprentissage 40-50 minutes avec modèles prêts pour production

- **🔐 Leçon sur les modèles d’authentification et de sécurité** : dans `docs/getting-started/authsecurity.md` :
  - 3 modèles d’authentification (chaînes de connexion, Key Vault, identité managée)
  - Templates Bicep complets pour infrastructures sécurisées
  - Code d’application Node.js avec intégration SDK Azure
  - 3 exercices complets (activation de l’identité managée, identité attribuée à l’utilisateur, rotation Key Vault)
  - Bonnes pratiques de sécurité et configuration RBAC
  - Guide de dépannage et analyse des coûts
  - Modèles d’authentification sans mot de passe prêts pour production

- **🤖 Leçon sur les modèles de coordination multi-agent** : dans `docs/pre-deployment/coordination-patterns.md` :
  - 5 modèles de coordination (séquentiel, parallèle, hiérarchique, piloté par événements, consensus)
  - Implémentation complète de service orchestrateur (Python/Flask, plus de 1 500 lignes)
  - 3 implémentations d’agents spécialisées (Recherche, Rédacteur, Éditeur)
  - Intégration du Service Bus pour la mise en file de messages
  - Gestion d’état Cosmos DB pour systèmes distribués
  - 6 diagrammes Mermaid montrant les interactions agents
  - 3 exercices avancés (gestion des délais, logique de retry, coupe-circuit)
  - Analyse des coûts (240-565 $/mois) avec stratégies d’optimisation
  - Intégration Application Insights pour la surveillance

#### Amélioré
- **Chapitre Pré-déploiement** : Inclusion complète des modèles de surveillance et de coordination
- **Chapitre Démarrage** : Amélioration avec modèles d’authentification professionnels
- **Préparation à la production** : Couverture complète de la sécurité à l’observabilité
- **Plan du cours** : Mise à jour pour référencer les nouvelles leçons dans chapitres 3 et 6

#### Modifié
- **Progression d’apprentissage** : Meilleure intégration sécurité et surveillance dans tout le cours
- **Qualité de la documentation** : Normes A-cohérentes (95-97 %) sur les nouvelles leçons
- **Modèles de production** : Couverture complète bout en bout pour déploiements en entreprise

#### Amélioré
- **Expérience développeur** : Parcours clair du développement à la surveillance en production
- **Normes de sécurité** : Modèles professionnels pour gestion d’authentification et secrets
- **Observabilité** : Intégration complète d’Application Insights avec AZD
- **Charges IA** : Surveillance spécialisée pour modèles Microsoft Foundry et systèmes multi-agent

#### Validé
- ✅ Toutes les leçons incluent un code complet fonctionnel (pas de snippets)
- ✅ Diagrammes Mermaid pour l’apprentissage visuel (19 au total dans 3 leçons)
- ✅ Exercices pratiques avec étapes de validation (9 au total)
- ✅ Templates Bicep prêts pour la production déployables via `azd up`
- ✅ Analyse des coûts et stratégies d’optimisation
- ✅ Guides de dépannage et bonnes pratiques
- ✅ Points de contrôle de connaissances avec commandes de vérification

#### Résultats de la notation documentaire
- **docs/pre-deployment/application-insights.md** : - Guide complet de la surveillance
- **docs/getting-started/authsecurity.md** : - Modèles professionnels de sécurité
- **docs/pre-deployment/coordination-patterns.md** : - Architectures multi-agent avancées
- **Nouveaux contenus globaux** : - Normes de qualité élevées et cohérentes

#### Implémentation technique
- **Application Insights** : Log Analytics + télémétrie personnalisée + traçage distribué
- **Authentification** : Identité managée + Key Vault + modèles RBAC
- **Multi-agent** : Service Bus + Cosmos DB + Container Apps + orchestration
- **Surveillance** : Métriques en direct + requêtes Kusto + alertes + tableaux de bord
- **Gestion des coûts** : Échantillonnage, politiques de rétention, contrôles budgétaires

### [v3.7.0] - 2025-11-19

#### Améliorations de qualité documentaire et nouvel exemple Microsoft Foundry Models
**Cette version améliore la qualité documentaire dans tout le dépôt et ajoute un exemple complet de déploiement Microsoft Foundry Models avec interface chat gpt-4.1.**

#### Ajouté
- **🤖 Exemple de chat Microsoft Foundry Models** : Déploiement gpt-4.1 complet avec implémentation fonctionnelle dans `examples/azure-openai-chat/` :
  - Infrastructure Microsoft Foundry Models complète (déploiement modèle gpt-4.1)
  - Interface chat en ligne de commande Python avec historique de conversation
  - Intégration Key Vault pour stockage sécurisé des clés API
  - Suivi d’utilisation des jetons et estimation des coûts
  - Limitations de débit et gestion des erreurs
  - README complet avec guide de déploiement 35-45 minutes
  - 11 fichiers prêts pour production (templates Bicep, app Python, configuration)
- **📚 Exercices documentaires** : Ajout d’exercices pratiques dans le guide de configuration :
  - Exercice 1 : Configuration multi-environnement (15 minutes)
  - Exercice 2 : Pratique de gestion de secrets (10 minutes)
  - Critères de réussite clairs et étapes de vérification
- **✅ Vérification du déploiement** : Ajout d’une section de vérification au guide de déploiement :
  - Procédures de contrôle de santé
  - Checklist des critères de réussite
  - Sorties attendues pour toutes les commandes de déploiement
  - Référence rapide pour dépannage

#### Amélioré
- **examples/README.md** : Mise à jour vers qualité A (93 %) :
  - Ajout de azure-openai-chat dans toutes les sections concernées
  - Nombre d’exemples locaux passé de 3 à 4
  - Ajout dans le tableau des exemples d’application IA
  - Intégration dans le guide de démarrage rapide pour utilisateurs intermédiaires
  - Ajout dans la section Microsoft Foundry Templates
  - Mise à jour des matrices comparatives et sections de recherche technologique
- **Qualité documentaire** : Amélioration de B+ (87 %) à A- (92 %) dans le dossier docs :
  - Ajout des sorties attendues dans les exemples de commandes critiques
  - Inclusion d’étapes de vérification pour les modifications de configuration
  - Renforcement de l’apprentissage pratique par des exercices concrets

#### Modifié
- **Progression d’apprentissage** : Meilleure intégration des exemples IA pour les intermédiaires
- **Structure documentaire** : Exercices plus actionnables avec résultats clairs
- **Processus de validation** : Critères de succès explicites ajoutés aux workflows clés

#### Amélioré
- **Expérience développeur** : Déploiement Microsoft Foundry Models réduit à 35-45 minutes (contre 60-90 min pour alternatives complexes)
- **Transparence des coûts** : Estimations claires (50-200 $/mois) pour l’exemple Microsoft Foundry Models
- **Parcours d’apprentissage** : Points d’entrée clairs avec azure-openai-chat pour développeurs IA
- **Standards documentaires** : Sorties attendues et étapes de vérification uniformes

#### Validé
- ✅ Exemple Microsoft Foundry Models pleinement fonctionnel avec `azd up`
- ✅ Tous les 11 fichiers d’implémentation syntaxiquement corrects
- ✅ Instructions README conformes à l’expérience de déploiement réelle
- ✅ Liens documentaires mis à jour dans plus de 8 emplacements
- ✅ Index des exemples reflète précisément 4 exemples locaux
- ✅ Pas de doublons de liens externes dans les tableaux
- ✅ Toutes les références de navigation sont correctes

#### Implémentation technique
- **Architecture Microsoft Foundry Models** : gpt-4.1 + Key Vault + modèle Container Apps
- **Sécurité** : Prêt pour identité managée, secrets dans Key Vault
- **Surveillance** : Intégration Application Insights
- **Gestion des coûts** : Suivi des jetons et optimisation d’utilisation
- **Déploiement** : Commande unique `azd up` pour installation complète

### [v3.6.0] - 2025-11-19

#### Mise à jour majeure : Exemples de déploiement d’application Container
**Cette version introduit des exemples complets de déploiement d’applications conteneurisées prêtes pour la production avec Azure Developer CLI (AZD), accompagnés d’une documentation complète et intégrés au parcours d’apprentissage.**

#### Ajouté
- **🚀 Exemples Container App** : Nouveaux exemples locaux dans `examples/container-app/` :
  - [Guide principal](examples/container-app/README.md) : Vue d’ensemble complète des déploiements conteneurisés, démarrage rapide, production et modèles avancés
  - [API Flask simple](../../examples/container-app/simple-flask-api) : API REST pour débutants avec scale-to-zero, sondes d’état, surveillance et dépannage
  - [Architecture microservices](../../examples/container-app/microservices) : Déploiement multi-service prêt pour production (API Gateway, Produit, Commande, Utilisateur, Notification), messagerie asynchrone, Service Bus, Cosmos DB, Azure SQL, traçage distribué, déploiement blue-green/canary
- **Bonnes pratiques** : Sécurité, surveillance, optimisation des coûts, et conseils CI/CD pour charges conteneurisées
- **Exemples de code** : `azure.yaml` complet, templates Bicep, implémentations multilingues des services (Python, Node.js, C#, Go)
- **Tests & dépannage** : Scénarios de tests bout en bout, commandes de surveillance, guides de dépannage

#### Modifié
- **README.md** : Mis à jour pour présenter et lier les nouveaux exemples d’applications conteneurisées sous "Exemples locaux - Applications conteneurisées"
- **examples/README.md** : Mis à jour pour mettre en avant les exemples d’applications conteneurisées, ajouter des entrées à la matrice de comparaison, et actualiser les références technologiques/architecturales
- **Plan de cours & Guide d’étude** : Mis à jour pour référencer les nouveaux exemples d’applications conteneurisées et les modèles de déploiement dans les chapitres concernés

#### Validé
- ✅ Tous les nouveaux exemples déployables avec `azd up` et respectant les meilleures pratiques
- ✅ Liens croisés et navigation dans la documentation mis à jour
- ✅ Exemples couvrant des scénarios allant de débutant à avancé, y compris les microservices en production

#### Notes
- **Portée** : Documentation et exemples en anglais uniquement
- **Prochaines étapes** : Extension avec des modèles avancés supplémentaires pour conteneurs et automatisation CI/CD dans les futures versions

### [v3.5.0] - 2025-11-19

#### Rebranding produit : Microsoft Foundry
**Cette version réalise un changement complet de nom de produit de "Microsoft Foundry" à "Microsoft Foundry" dans toute la documentation anglaise, reflétant le rebranding officiel de Microsoft.**

#### Changé
- **🔄 Mise à jour du nom du produit** : Rebranding complet de "Microsoft Foundry" à "Microsoft Foundry"
  - Mise à jour de toutes les références dans la documentation anglaise du dossier `docs/`
  - Renommage du dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renommage du fichier : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total : 23 références mises à jour dans 7 fichiers de documentation

- **📁 Changements dans la structure des dossiers** :
  - `docs/ai-foundry/` renommé en `docs/microsoft-foundry/`
  - Toutes les références croisées mises à jour pour refléter la nouvelle structure
  - Liens de navigation validés dans toute la documentation

- **📄 Renommage des fichiers** :
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tous les liens internes mis à jour pour référencer le nouveau nom de fichier

#### Fichiers mis à jour
- **Documentation des chapitres** (7 fichiers) :
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mises à jour de liens de navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 références au nom du produit mises à jour
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Utilisation déjà Microsoft Foundry (depuis mises à jour précédentes)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 références mises à jour (aperçu, retours de la communauté, documentation)
  - `docs/getting-started/azd-basics.md` - 4 liens de références croisées mis à jour
  - `docs/getting-started/first-project.md` - 2 liens de navigation de chapitres mis à jour
  - `docs/getting-started/installation.md` - 2 liens vers chapitres suivants mis à jour
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 références mises à jour (navigation, communauté Discord)
  - `docs/troubleshooting/common-issues.md` - 1 lien de navigation mis à jour
  - `docs/troubleshooting/debugging.md` - 1 lien de navigation mis à jour

- **Fichiers de structure de cours** (2 fichiers) :
  - `README.md` - 17 références mises à jour (aperçu du cours, titres de chapitres, section modèles, informations communautaires)
  - `course-outline.md` - 14 références mises à jour (aperçu, objectifs d’apprentissage, ressources de chapitres)

#### Validé
- ✅ Plus aucune référence au chemin de dossier "ai-foundry" dans la doc anglaise
- ✅ Plus aucune référence au nom produit "Microsoft Foundry" dans la doc anglaise
- ✅ Tous les liens de navigation fonctionnent avec la nouvelle structure de dossier
- ✅ Renommage des fichiers et dossiers effectué avec succès
- ✅ Références croisées entre chapitres validées

#### Notes
- **Portée** : Changements appliqués uniquement à la documentation anglaise du dossier `docs/`
- **Traductions** : Les dossiers de traduction (`translations/`) ne sont pas mis à jour dans cette version
- **Atelier** : Les matériels d’atelier (`workshop/`) ne sont pas touchés par cette mise à jour
- **Exemples** : Les fichiers d’exemples peuvent encore référencer les noms anciens (à corriger dans une mise à jour future)
- **Liens externes** : URLs externes et références GitHub restent inchangées

#### Guide de migration pour contributeurs
Si vous avez des branches locales ou documentations référencant l’ancienne structure :
1. Mettre à jour les références des dossiers : `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Mettre à jour les références de fichiers : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Remplacer le nom du produit : "Microsoft Foundry" → "Microsoft Foundry"
4. Vérifier que tous les liens internes fonctionnent toujours

---

### [v3.4.0] - 2025-10-24

#### Aperçu et améliorations de validation d’infrastructure
**Cette version introduit un support complet de la nouvelle fonctionnalité preview de la CLI Azure Developer et améliore l’expérience utilisateur des ateliers.**

#### Ajouté
- **🧪 Documentation de la fonctionnalité azd provision --preview** : Couverture complète de la nouvelle capacité preview d’infrastructure
  - Référence de commande et exemples d’utilisation dans la fiche mémo
  - Intégration détaillée dans le guide de provisioning avec cas d’usage et bénéfices
  - Intégration de la vérification préalable pour une validation de déploiement plus sûre
  - Mises à jour du guide de démarrage avec des pratiques de déploiement en toute sécurité
- **🚧 Bannière de statut d’atelier** : Bannière HTML professionnelle indiquant le statut de développement de l’atelier
  - Design en dégradé avec indicateurs de chantier pour communication claire aux utilisateurs
  - Horodatage de dernière mise à jour pour transparence
  - Design responsive mobile pour tous types d’appareils

#### Amélioré
- **Sécurité de l’infrastructure** : Fonctionnalité preview intégrée dans toute la documentation de déploiement
- **Validation avant déploiement** : Scripts automatisés incluant désormais les tests de preview d’infrastructure
- **Flux de travail développeur** : Séquences de commandes mises à jour pour inclure la preview comme bonne pratique
- **Expérience atelier** : Attentes claires définies aux utilisateurs sur le statut de développement des contenus

#### Changé
- **Meilleures pratiques de déploiement** : Approche workflow « preview en premier » désormais recommandée
- **Flux documentaire** : Validation d’infrastructure avancée dans l’ordre d’apprentissage
- **Présentation d’atelier** : Communication professionnelle du statut avec calendrier clair de développement

#### Améliorations
- **Approche sécurité prioritaire** : Les modifications d’infrastructure peuvent être validées avant déploiement
- **Collaboration d’équipe** : Résultats de preview partageables pour revue et approbation
- **Conscience des coûts** : Meilleure compréhension des coûts des ressources avant provisionnement
- **Réduction des risques** : Moins d’échecs de déploiement par validation anticipée

#### Implémentation technique
- **Intégration multi-documents** : Fonction preview documentée dans 4 fichiers clés
- **Modèles de commandes** : Syntaxe et exemples homogènes dans toute la doc
- **Intégration bonnes pratiques** : Preview incluse dans workflows de validation et scripts
- **Indicateurs visuels** : Marquages clairs « NOUVEAU » pour découverte aisée

#### Infrastructure de l’atelier
- **Communication du statut** : Bannière HTML professionnelle avec dégradé stylisé
- **Expérience utilisateur** : Statut de développement clair évitant confusions
- **Présentation professionnelle** : Maintien de crédibilité du dépôt tout en fixant attentes
- **Transparence temporelle** : Horodatage octobre 2025 pour responsabilité

### [v3.3.0] - 2025-09-24

#### Matériels d’atelier améliorés et expérience d’apprentissage interactive
**Cette version introduit des matériels d’atelier complets avec guides interactifs dans le navigateur et parcours d’apprentissage structurés.**

#### Ajouté
- **🎥 Guide d’atelier interactif** : Expérience d’atelier dans le navigateur avec prévisualisation MkDocs
- **📝 Instructions d’atelier structurées** : Parcours guidé en 7 étapes, de la découverte à la personnalisation
  - 0-Introduction : Aperçu et mise en place de l’atelier
  - 1-Sélection-modèle-AI : Découverte et choix du modèle
  - 2-Validation-modèle-AI : Procédures de déploiement et validation
  - 3-Déconstruction-modèle-AI : Compréhension de l’architecture modèle
  - 4-Configuration-modèle-AI : Configuration et personnalisation
  - 5-Personnalisation-modèle-AI : Modifications avancées et itérations
  - 6-Démantèlement-infrastructure : Nettoyage et gestion des ressources
  - 7-Clôture : Résumé et prochaines étapes
- **🛠️ Outils d’atelier** : Configuration MkDocs avec thème Material pour meilleure expérience
- **🎯 Parcours d’apprentissage pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces** : Mise en place fluide de l’environnement de développement

#### Amélioré
- **Laboratoire AI Workshop** : Étendu avec expérience d’apprentissage structurée de 2-3 heures
- **Documentation atelier** : Présentation professionnelle avec navigation et aides visuelles
- **Progression pédagogique** : Guidage clair étape par étape de la sélection jusqu’au déploiement en production
- **Expérience développeur** : Outils intégrés pour flux de travail optimisés

#### Améliorations
- **Accessibilité** : Interface navigateur avec recherche, copie de code, et bascule de thème
- **Apprentissage autonome** : Structure flexible pour différents rythmes d’apprentissage
- **Application pratique** : Scénarios réels de déploiement de modèles AI
- **Intégration communautaire** : Intégration Discord pour soutien et collaboration atelier

#### Fonctionnalités atelier
- **Recherche intégrée** : Découverte rapide par mots-clés et leçons
- **Copie de blocs de code** : Fonctionnalité survol pour copier tous les exemples de code
- **Bascule de thème** : Support mode sombre/claire selon préférences
- **Éléments visuels** : Captures d’écran et diagrammes pour meilleure compréhension
- **Intégration d’aide** : Accès direct à Discord pour support communautaire

### [v3.2.0] - 2025-09-17

#### Restructuration majeure de navigation et système d’apprentissage par chapitres
**Cette version introduit une structure complète d’apprentissage par chapitres avec navigation améliorée à travers tout le dépôt.**

#### Ajouté
- **📚 Système d’apprentissage par chapitres** : Réorganisation complète du cours en 8 chapitres d’apprentissage progressifs
  - Chapitre 1 : Fondations & Démarrage rapide (⭐ - 30-45 min)
  - Chapitre 2 : Développement AI-First (⭐⭐ - 1-2 h)
  - Chapitre 3 : Configuration & Authentification (⭐⭐ - 45-60 min)
  - Chapitre 4 : Infrastructure as Code & Déploiement (⭐⭐⭐ - 1-1.5 h)
  - Chapitre 5 : Solutions Multi-Agents AI (⭐⭐⭐⭐ - 2-3 h)
  - Chapitre 6 : Validation & Planification pré-déploiement (⭐⭐ - 1 h)
  - Chapitre 7 : Dépannage & Debuggage (⭐⭐ - 1-1.5 h)
  - Chapitre 8 : Modèles production & entreprise (⭐⭐⭐⭐ - 2-3 h)
- **📚 Système de navigation complet** : Entêtes et pieds de page homogènes dans toute la documentation
- **🎯 Suivi de progression** : Checklist d’achèvement et système de vérification d’apprentissage
- **🗺️ Orientation pédagogique** : Points d’entrée clairs selon niveaux et objectifs
- **🔗 Navigation croisée** : Liens clairs vers chapitres liés et prérequis

#### Amélioré
- **Structure README** : Transformée en plateforme d’apprentissage structurée par chapitres
- **Navigation documentation** : Chaque page inclut contexte de chapitre et progression
- **Organisation des modèles** : Exemples et templates associés aux chapitres d’apprentissage appropriés
- **Intégration des ressources** : Fiches mémo, FAQ, guides d’étude connectés aux chapitres pertinents
- **Intégration atelier** : Laboratoires pratiques mappés aux objectifs d’apprentissage multi-chapitres

#### Changé
- **Progression pédagogique** : Passage d’une documentation linéaire à un apprentissage par chapitres flexible
- **Placement de la configuration** : Guide de configuration repositionné en Chapitre 3 pour meilleure logique pédagogique
- **Contenus AI** : Meilleure intégration des contenus AI spécifiques tout au long du parcours
- **Contenus production** : Modèles avancés concentrés en Chapitre 8 pour utilisateurs entreprise

#### Amélioré
- **Expérience utilisateur** : Fil d’Ariane clair et indicateurs de progression par chapitre
- **Accessibilité** : Patrons de navigation homogènes facilitant la navigation dans le cours
- **Présentation professionnelle** : Structure universitaire adaptée à un usage académique et en entreprise
- **Efficacité pédagogique** : Réduction du temps de recherche grâce à une meilleure organisation

#### Implémentation technique
- **En-têtes de navigation** : Navigation par chapitres standardisée dans plus de 40 fichiers
- **Pieds de page** : Indicateurs cohérents de progression et d’achèvement de chapitres
- **Liens croisés** : Système de liens internes complet reliant concepts associés
- **Cartographie des chapitres** : Templates et exemples clairement associés aux objectifs d’apprentissage

#### Amélioration du guide d’étude
- **📚 Objectifs d’apprentissage complets** : Guide d’étude restructuré selon système à 8 chapitres
- **🎯 Évaluation par chapitre** : Objectifs d’apprentissage spécifiques et exercices pratiques dans chaque chapitre
- **📋 Suivi de progression** : Planning hebdomadaire avec résultats mesurables et checklist d’achèvement
- **❓ Questions d’évaluation** : Questions de validation des connaissances par chapitre avec résultats professionnels
- **🛠️ Exercices pratiques** : Activités concrètes avec scénarios réels de déploiement et dépannage
- **📊 Progression des compétences** : Avancement clair des concepts basiques aux modèles entreprise avec orientation carrière
- **🎓 Cadre de certification** : Résultats de développement professionnel et reconnaissance communautaire
- **⏱️ Gestion temporelle** : Plan d’apprentissage structuré sur 10 semaines avec validation d’étapes-clés

### [v3.1.0] - 2025-09-17

#### Solutions AI multi-agents améliorées
**Cette version améliore la solution multi-agents retail avec un meilleur nommage des agents et une documentation enrichie.**

#### Changé
- **Terminologie multi-agent** : Remplacement de "agent Cora" par "agent Client" dans toute la solution retail multi-agent pour plus de clarté
- **Architecture des agents** : Mise à jour de toute la documentation, des templates ARM et des exemples de code utilisant « agent Client » de façon cohérente
- **Exemples de configuration** : Modernisation des modèles de configuration d’agent avec conventions de nommage mises à jour
- **Cohérence documentaire** : Garantie que toutes les références utilisent un nommage professionnel et descriptif des agents

#### Amélioré
- **Package ARM Template** : Mise à jour de retail-multiagent-arm-template avec les références à l'agent Customer  
- **Diagrammes d'architecture** : Actualisation des diagrammes Mermaid avec la nouvelle dénomination des agents  
- **Exemples de code** : Classes Python et exemples d'implémentation utilisant désormais la dénomination CustomerAgent  
- **Variables d'environnement** : Mise à jour de tous les scripts de déploiement pour utiliser les conventions CUSTOMER_AGENT_NAME  

#### Améliorations  
- **Expérience développeur** : Rôles et responsabilités des agents clarifiés dans la documentation  
- **Préparation à la production** : Meilleure conformité avec les conventions de nommage d'entreprise  
- **Supports d'apprentissage** : Dénomination des agents plus intuitive à des fins pédagogiques  
- **Utilisabilité des templates** : Compréhension simplifiée des fonctions des agents et des schémas de déploiement  

#### Détails techniques  
- Diagrammes d'architecture Mermaid mis à jour avec les références CustomerAgent  
- Remplacement des noms de classe CoraAgent par CustomerAgent dans les exemples Python  
- Modifications des configurations JSON du template ARM pour utiliser le type d'agent "customer"  
- Mise à jour des variables d'environnement de CORA_AGENT_* à CUSTOMER_AGENT_*  
- Actualisation de toutes les commandes de déploiement et configurations des conteneurs  

### [v3.0.0] - 2025-09-12  

#### Changements majeurs - Focus développeur IA et intégration Microsoft Foundry  
**Cette version transforme le dépôt en une ressource d'apprentissage complète orientée IA intégrant Microsoft Foundry.**  

#### Ajouts  
- **🤖 Parcours d'apprentissage AI-First** : Restructuration complète priorisant les développeurs et ingénieurs IA  
- **Guide d'intégration Microsoft Foundry** : Documentation complète pour connecter AZD aux services Microsoft Foundry  
- **Patterns de déploiement des modèles IA** : Guide détaillé couvrant sélection, configuration et stratégies de production  
- **Atelier pratique IA** : Atelier de 2-3 heures pour convertir des applications IA en solutions déployables via AZD  
- **Bonnes pratiques IA en production** : Patterns prêts entreprise pour mise à l'échelle, supervision et sécurisation des charges IA  
- **Guide de dépannage IA spécifique** : Guide complet pour les modèles Microsoft Foundry, Cognitive Services et problèmes de déploiement IA  
- **Galerie de templates IA** : Collection mise en avant de templates Microsoft Foundry avec notation de complexité  
- **Matériels pour ateliers** : Structure complète d’atelier avec labs pratiques et ressources de référence  

#### Améliorations  
- **Structure README** : Axée développeur IA avec 45 % d'intérêt communautaire issu du Discord Microsoft Foundry  
- **Parcours d'apprentissage** : Parcours dédié développeur IA en parallèle des parcours traditionnels étudiants et DevOps  
- **Recommandations de templates** : Templates IA en vedette incluant azure-search-openai-demo, contoso-chat et openai-chat-app-quickstart  
- **Intégration communautaire** : Support communautaire Discord renforcé avec canaux et discussions spécifiquement IA  

#### Sécurité & Préparation à la production  
- **Patterns d’identité managée** : Configuration IA spécifique pour authentification et sécurité  
- **Optimisation des coûts** : Suivi de consommation de tokens et contrôle budgétaire pour workloads IA  
- **Déploiement multi-région** : Stratégies pour déploiement global d’applications IA  
- **Surveillance des performances** : Métriques spécifiques IA et intégration Application Insights  

#### Qualité de la documentation  
- **Structure linéaire des cours** : Progression logique de débutant à avancé pour déploiement IA  
- **URLs validées** : Tous les liens externes vers les dépôts vérifiés et accessibles  
- **Références complètes** : Tous les liens internes validés et fonctionnels  
- **Prêt pour la production** : Patterns déploiement entreprise avec exemples concrets  

### [v2.0.0] - 2025-09-09  

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle  
**Cette version représente une refonte majeure de la structure et de la présentation du contenu du dépôt.**  

#### Ajouts  
- **Cadre d'apprentissage structuré** : Toutes les pages documentaires incluent Introduction, Objectifs d’apprentissage, et Résultats d’apprentissage  
- **Système de navigation** : Liens Leçon Précédente/Suivante ajoutés dans toute la documentation pour un parcours guidé  
- **Guide d’étude** : study-guide.md complet avec objectifs, exercices pratiques et matériel d’évaluation  
- **Présentation professionnelle** : Suppression de toutes les icônes emoji pour meilleure accessibilité et apparence professionnelle  
- **Organisation améliorée** : Meilleure structure et fluidité des matériaux d’apprentissage  

#### Changements  
- **Format de documentation** : Standardisation avec structure cohérente axée apprentissage  
- **Flux de navigation** : Progression logique intégrée à l’ensemble des matériaux  
- **Présentation du contenu** : Éléments décoratifs supprimés au profit d’un formatage clair et professionnel  
- **Structure des liens** : Mise à jour de tous les liens internes pour supporter le nouveau système de navigation  

#### Améliorations  
- **Accessibilité** : Suppression des dépendances emojis pour une meilleure compatibilité lecteurs d’écran  
- **Apparence professionnelle** : Présentation épurée et académique adaptée à l’apprentissage en entreprise  
- **Expérience d’apprentissage** : Approche structurée avec objectifs et résultats clairs pour chaque leçon  
- **Organisation du contenu** : Flux logique amélioré et liens entre sujets apparentés  

### [v1.0.0] - 2025-09-09  

#### Version initiale - Dépôt d’apprentissage complet AZD  

#### Ajouts  
- **Structure documentaire principale**  
  - Série complète de guides de démarrage  
  - Documentation complète pour déploiement et provisionnement  
  - Ressources détaillées de dépannage et guides de débogage  
  - Outils et procédures de validation pré-déploiement  

- **Module de démarrage**  
  - Bases AZD : concepts clés et terminologie  
  - Guide d’installation : instructions spécifiques à la plateforme  
  - Guide de configuration : préparation de l’environnement et authentification  
  - Tutoriel premier projet : apprentissage pratique pas-à-pas  

- **Module déploiement et provisionnement**  
  - Guide de déploiement : documentation complète du workflow  
  - Guide de provisionnement : Infrastructure as Code avec Bicep  
  - Bonnes pratiques pour déploiements en production  
  - Schémas d’architecture multi-services  

- **Module validation pré-déploiement**  
  - Planification de capacité : validation de la disponibilité des ressources Azure  
  - Sélection de SKU : guidance complète des niveaux de service  
  - Vérifications préalables : scripts automatisés (PowerShell et Bash)  
  - Estimation des coûts et planification budgétaire  

- **Module dépannage**  
  - Problèmes courants : FAQs et solutions  
  - Guide de débogage : méthodologies de dépannage systématique  
  - Techniques et outils de diagnostic avancés  
  - Surveillance et optimisation des performances  

- **Ressources et références**  
  - Fiche de commandes : référence rapide des commandes essentielles  
  - Glossaire : définitions complètes des termes et acronymes  
  - FAQ : réponses détaillées aux questions fréquentes  
  - Liens externes et connexions communautaires  

- **Exemples et templates**  
  - Exemple d’application web simple  
  - Template de déploiement site web statique  
  - Configuration application conteneurisée  
  - Schémas d’intégration base de données  
  - Exemples d’architecture microservices  
  - Implémentations de fonctions serverless  

#### Fonctionnalités  
- **Support multi-plateforme** : guides d’installation et configuration pour Windows, macOS et Linux  
- **Niveaux de compétence variés** : contenu adapté aux étudiants comme aux développeurs professionnels  
- **Orientation pratique** : exemples concrets et scénarios réels  
- **Couverture complète** : des concepts de base aux patterns d’entreprise avancés  
- **Approche sécurité prioritaire** : bonnes pratiques de sécurité intégrées  
- **Optimisation des coûts** : conseils pour déploiements économiques et gestion des ressources  

#### Qualité documentaire  
- **Exemples de code détaillés** : échantillons pratiques et testés  
- **Instructions pas-à-pas** : guidage clair et actionnable  
- **Gestion complète des erreurs** : dépannage des problèmes courants  
- **Intégration des meilleures pratiques** : normes et recommandations industrielles  
- **Compatibilité version** : à jour avec les services Azure et fonctionnalités azd les plus récentes  

## Améliorations futures prévues  

### Version 3.1.0 (Planifiée)  
#### Extension de la plateforme IA  
- **Support multi-modèles** : intégrations Hugging Face, Azure Machine Learning et modèles personnalisés  
- **Frameworks agents IA** : templates pour LangChain, Semantic Kernel et déploiements AutoGen  
- **Patterns RAG avancés** : bases de données vectorielles au-delà d’Azure AI Search (Pinecone, Weaviate, etc.)  
- **Observabilité IA** : surveillance améliorée de la performance des modèles, consommation de tokens et qualité des réponses  

#### Expérience développeur  
- **Extension VS Code** : expérience intégrée AZD + Microsoft Foundry  
- **Intégration GitHub Copilot** : génération assistée par IA de templates AZD  
- **Tutoriels interactifs** : exercices pratiques avec validation automatisée pour scénarios IA  
- **Contenu vidéo** : tutoriels vidéos complémentaires pour apprentissage visuel avec focus sur déploiements IA  

### Version 4.0.0 (Planifiée)  
#### Patterns IA entreprise  
- **Cadre de gouvernance** : gouvernance, conformité et audits modèles IA  
- **IA multi-locataires** : patterns pour desservir plusieurs clients avec services IA isolés  
- **Déploiement IA en périphérie** : intégration avec Azure IoT Edge et instances conteneurs  
- **IA cloud hybride** : patterns multi-cloud et hybride pour charges IA  

#### Fonctionnalités avancées  
- **Automatisation pipeline IA** : intégration MLOps avec pipelines Azure Machine Learning  
- **Sécurité avancée** : patterns zero-trust, points de terminaison privés et protection avancée contre les menaces  
- **Optimisation des performances** : réglages avancés et stratégies de montée en charge pour applications IA haute capacité  
- **Distribution globale** : patterns CDN et mise en cache en périphérie pour applications IA  

### Version 3.0.0 (Planifiée) - Remplacée par la version actuelle  
#### Ajouts proposés - Maintenant implémentés en v3.0.0  
- ✅ **Contenu orienté IA** : intégration complète Microsoft Foundry (Terminé)  
- ✅ **Tutoriels interactifs** : atelier pratique IA (Terminé)  
- ✅ **Module sécurité avancée** : patterns de sécurité spécifiques IA (Terminé)  
- ✅ **Optimisation des performances** : stratégies d’optimisation des charges IA (Terminé)  

### Version 2.1.0 (Planifiée) - Partiellement implémentée en v3.0.0  
#### Améliorations mineures - Certaines réalisées dans la version actuelle  
- ✅ **Exemples additionnels** : scénarios de déploiement IA (Terminé)  
- ✅ **FAQ étendue** : questions et dépannage IA (Terminé)  
- **Intégration d’outils** : guides améliorés pour IDE et éditeurs  
- ✅ **Extension de la surveillance** : patterns IA de monitoring et alertes (Terminé)  

#### Toujours prévu pour une future version  
- **Documentation adaptée mobile** : design responsive pour apprentissage mobile  
- **Accès hors ligne** : packages documentation téléchargeables  
- **Intégration IDE améliorée** : extension VS Code pour workflows AZD + IA  
- **Tableau de bord communautaire** : suivi métriques communautaires en temps réel et contribution  

## Contribution au changelog  

### Signalement des changements  
Lors de contributions à ce dépôt, veuillez vous assurer que les entrées du changelog incluent :  

1. **Numéro de version** : suivant le versionnage sémantique (major.minor.patch)  
2. **Date** : date de publication ou mise à jour au format AAAA-MM-JJ  
3. **Catégorie** : Ajouté, Modifié, Déprécié, Supprimé, Corrigé, Sécurité  
4. **Description claire** : description concise des modifications  
5. **Évaluation d’impact** : comment les changements affectent les utilisateurs existants  

### Catégories de changements  

#### Ajouté  
- Nouvelles fonctionnalités, sections de documentation ou capacités  
- Nouveaux exemples, templates ou ressources d’apprentissage  
- Outils, scripts ou utilitaires supplémentaires  

#### Modifié  
- Modifications fonctionnelles ou documentaires existantes  
- Mises à jour pour améliorer clarté ou précision  
- Restructuration de contenu ou organisation  

#### Déprécié  
- Fonctionnalités ou approches en cours de suppression  
- Sections documentaires prévues à retirer  
- Méthodes dont des alternatives meilleures existent  

#### Supprimé  
- Fonctionnalités, documentations ou exemples obsolètes  
- Informations dépassées ou approches dépréciées  
- Contenu redondant ou consolidé  

#### Corrigé  
- Corrections d’erreurs dans documentation ou code  
- Résolutions de problèmes signalés  
- Améliorations de précision ou fonctionnelles  

#### Sécurité  
- Améliorations ou correctifs liés à la sécurité  
- Mises à jour des meilleures pratiques de sécurité  
- Résolutions de vulnérabilités de sécurité  

### Directives pour le versionnage sémantique  

#### Version majeure (X.0.0)  
- Changements majeurs nécessitant une action utilisateur  
- Restructuration importante du contenu ou de l’organisation  
- Modifications affectant fondamentalement l’approche ou la méthodologie  

#### Version mineure (X.Y.0)  
- Nouvelles fonctionnalités ou ajouts de contenu  
- Améliorations conservant la rétrocompatibilité  
- Ajout d’exemples, outils ou ressources  

#### Version patch (X.Y.Z)  
- Corrections de bugs et errata  
- Améliorations mineures de contenu existant  
- Clarifications et petits ajustements  

## Feedback et suggestions communautaires  

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d’apprentissage :  

### Comment faire un retour  
- **Issues GitHub** : signaler problèmes ou proposer améliorations (issues IA spécifiques bienvenues)  
- **Discussions Discord** : partager idées et échanger avec la communauté Microsoft Foundry  
- **Pull Requests** : contribuer directement au contenu, particulièrement templates et guides IA  
- **Discord Microsoft Foundry** : participer au canal #Azure pour discussions AZD + IA  
- **Forums communautaires** : participer aux discussions plus larges des développeurs Azure  

### Catégories de feedback  
- **Exactitude du contenu IA** : corrections sur intégration et déploiement des services IA  
- **Expérience d’apprentissage** : suggestions pour améliorer le parcours développeur IA  
- **Contenu IA manquant** : demandes de templates, patterns ou exemples IA supplémentaires  
- **Accessibilité** : améliorations pour besoins d’apprentissage diversifiés  
- **Intégration d’outils IA** : propositions pour meilleure intégration workflows développeur IA  
- **Patterns déploiement IA en production** : demandes sur patterns d’entreprise IA  

### Engagement de réponse  
- **Réponse aux issues** : sous 48 heures pour problèmes signalés  
- **Demandes de fonctionnalités** : évaluation sous une semaine  
- **Contributions communautaires** : revue sous une semaine  
- **Questions de sécurité** : priorité immédiate avec traitement accéléré  

## Calendrier de maintenance  

### Mises à jour régulières  
- **Revues mensuelles** : vérification exactitude contenu et validation liens  
- **Mises à jour trimestrielles** : ajouts et améliorations majeurs  
- **Revues semestrielles** : restructuration et améliorations complètes  
- **Releases annuelles** : mises à jour majeures avec améliorations significatives  

### Surveillance et assurance qualité  
- **Tests automatisés** : validation régulière des exemples de code et liens  
- **Intégration des retours communautaires** : inclusion régulière des suggestions utilisateurs  
- **Mises à jour technologiques** : alignement avec dernières versions des services Azure et azd  
- **Audits accessibilité** : revues régulières pour principes d’inclusion  

## Politique de support des versions  

### Support de la version courante
- **Dernière version majeure** : Prise en charge complète avec mises à jour régulières
- **Version majeure précédente** : Mises à jour de sécurité et corrections critiques pendant 12 mois
- **Versions héritées** : Support communautaire uniquement, pas de mises à jour officielles

### Conseils de migration
Lorsqu'une nouvelle version majeure est publiée, nous fournissons :
- **Guides de migration** : Instructions étape par étape pour la transition
- **Notes de compatibilité** : Détails sur les changements incompatibles
- **Support d’outils** : Scripts ou utilitaires pour aider à la migration
- **Support communautaire** : Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon précédente** : [Guide d'étude](resources/study-guide.md)
- **Leçon suivante** : Retour à la [README principale](README.md)

**Restez informé** : Surveillez ce dépôt pour recevoir des notifications sur les nouvelles versions et les mises à jour importantes des supports d’apprentissage.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des imprécisions. Le document original dans sa langue native doit être considéré comme la source faisant foi. Pour des informations critiques, une traduction professionnelle réalisée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d’interprétations erronées résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->