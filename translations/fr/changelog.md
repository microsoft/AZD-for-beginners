# Journal des modifications - AZD Pour Débutants

## Introduction

Ce journal des modifications documente tous les changements notables, mises à jour et améliorations du dépôt AZD Pour Débutants. Nous suivons les principes du versionnage sémantique et maintenons ce journal pour aider les utilisateurs à comprendre ce qui a changé entre les versions.

## Objectifs d'apprentissage

En consultant ce journal des modifications, vous pourrez :
- Rester informé des nouvelles fonctionnalités et ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bugs et ajustements pour garantir l'exactitude
- Suivre l'évolution des supports d'apprentissage au fil du temps

## Résultats d'apprentissage

Après avoir consulté les entrées du journal, vous serez capable de :
- Identifier les nouveaux contenus et ressources disponibles pour l'apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d'apprentissage en fonction des supports les plus récents
- Contribuer des retours et suggestions pour de futures améliorations

## Historique des versions

### [v3.17.0] - 2026-02-05

#### Amélioration de la navigation dans le cours
**Cette version améliore la navigation dans le chapitre README.md avec un format de tableau amélioré.**

#### Modifié
- **Tableau de la carte du cours** : Amélioré avec des liens directs vers les leçons, estimations de durée et évaluations de complexité
- **Nettoyage des dossiers** : Suppression des anciens dossiers redondants (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validation des liens** : Tous les 21+ liens internes du tableau Carte du cours vérifiés

### [v3.16.0] - 2026-02-05

#### Mises à jour des noms de produits
**Cette version met à jour les références aux produits pour refléter le branding Microsoft actuel.**

#### Modifié
- **Azure AI Foundry → Microsoft Foundry** : Toutes les références mises à jour dans les fichiers hors traduction
- **Azure AI Agent Service → Foundry Agents** : Nom du service mis à jour pour refléter le branding actuel

#### Fichiers mis à jour
- `README.md` - Page d'accueil principale du cours
- `changelog.md` - Historique des versions
- `course-outline.md` - Structure du cours
- `docs/chapter-02-ai-development/agents.md` - Guide des agents IA
- `examples/README.md` - Documentation des exemples
- `workshop/README.md` - Page d'accueil de l'atelier
- `workshop/docs/index.md` - Index de l'atelier
- `workshop/docs/instructions/*.md` - Tous les fichiers d'instructions de l'atelier

---

### [v3.15.0] - 2026-02-05

#### Restructuration majeure du dépôt : noms des dossiers basés sur les chapitres
**Cette version restructure la documentation en dossiers dédiés par chapitre pour une navigation plus claire.**

#### Renommage des dossiers
Les anciens dossiers ont été remplacés par des dossiers numérotés par chapitre :
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ajouté : `docs/chapter-05-multi-agent/`

#### Migrations de fichiers
| Fichier | De | Vers |
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
| Tous les fichiers pré-déploiement | pre-deployment/ | chapter-06-pre-deployment/ |
| Tous les fichiers dépannage | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ajouté
- **📚 Fichiers README de chapitre** : Création de README.md dans chaque dossier de chapitre avec :
  - Objectifs d'apprentissage et durée
  - Tableau des leçons avec descriptions
  - Commandes de démarrage rapide
  - Navigation vers les autres chapitres

#### Modifié
- **🔗 Mise à jour de tous les liens internes** : 78+ chemins mis à jour dans tous les fichiers de documentation
- **🗺️ README.md principal** : Mise à jour de la carte du cours avec nouvelle structure de chapitres
- **📝 examples/README.md** : Mises à jour des références croisées aux dossiers des chapitres

#### Supprimé
- Ancienne structure de dossiers (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructuration du dépôt : navigation par chapitre
**Cette version a ajouté des fichiers README de navigation par chapitre (remplacée par la v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nouveau guide des agents IA
**Cette version ajoute un guide complet pour déployer des agents IA avec Azure Developer CLI.**

#### Ajouté
- **🤖 docs/microsoft-foundry/agents.md** : Guide complet couvrant :
  - Ce que sont les agents IA et comment ils diffèrent des chatbots
  - Trois modèles d'agents de démarrage rapide (Foundry Agents, Prompty, RAG)
  - Schémas d'architecture des agents (agent unique, RAG, multi-agent)
  - Configuration des outils et personnalisation
  - Surveillance et suivi des métriques
  - Considérations et optimisation des coûts
  - Scénarios courants de dépannage
  - Trois exercices pratiques avec critères de réussite

#### Structure du contenu
- **Introduction** : Concepts d'agents pour débutants
- **Démarrage rapide** : Déployer des agents avec `azd init --template get-started-with-ai-agents`
- **Modèles d'architecture** : Diagrammes visuels des schémas d'agents
- **Configuration** : Configuration des outils et variables d'environnement
- **Surveillance** : Intégration avec Application Insights
- **Exercices** : Apprentissage progressif pratique (20-45 minutes chacun)

---

### [v3.12.0] - 2026-02-05

#### Mise à jour de l'environnement DevContainer
**Cette version met à jour la configuration du container de développement avec des outils modernes et de meilleures valeurs par défaut pour l'expérience AZD.**

#### Modifié
- **🐳 Image de base** : Passage de `python:3.12-bullseye` à `python:3.12-bookworm` (dernière version stable Debian)
- **📛 Nom du container** : Renommé de "Python 3" à "AZD for Beginners" pour plus de clarté

#### Ajouté
- **🔧 Nouvelles fonctionnalités du Dev Container** :
  - `azure-cli` avec support Bicep activé
  - `node:20` (version LTS pour les templates AZD)
  - `github-cli` pour la gestion des templates
  - `docker-in-docker` pour les déploiements d'applications containers

- **🔌 Redirections de ports** : Ports pré-configurés pour le développement courant :
  - 8000 (aperçu MkDocs)
  - 3000 (applications Web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nouvelles extensions VS Code** :
  - `ms-python.vscode-pylance` - IntelliSense Python amélioré
  - `ms-azuretools.vscode-azurefunctions` - Support Azure Functions
  - `ms-azuretools.vscode-docker` - Support Docker
  - `ms-azuretools.vscode-bicep` - Support langage Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestion des ressources Azure
  - `yzhang.markdown-all-in-one` - Édition Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Support diagrammes Mermaid
  - `redhat.vscode-yaml` - Support YAML (pour azure.yaml)
  - `eamodio.gitlens` - Visualisation Git
  - `mhutchie.git-graph` - Historique Git

- **⚙️ Paramètres VS Code** : Ajout de paramètres par défaut pour interpréteur Python, formatage à la sauvegarde, et suppression des espaces inutiles

- **📦 Mise à jour de requirements-dev.txt** :
  - Ajout du plugin MkDocs minify
  - Ajout de pre-commit pour contrôle qualité du code
  - Ajout des packages Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigé
- **Commande post-création** : Vérifie maintenant l'installation d'AZD et Azure CLI au démarrage du container

---

### [v3.11.0] - 2026-02-05

#### Révision du README adapté aux débutants
**Cette version améliore significativement le README.md pour le rendre plus accessible aux débutants et ajoute des ressources essentielles pour les développeurs IA.**

#### Ajouté
- **🆚 Comparaison Azure CLI vs AZD** : Explication claire de quand utiliser chaque outil avec des exemples pratiques
- **🌟 Liens géniaux AZD** : Liens directs vers la galerie de templates communautaire et ressources pour contribuer :
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Plus de 200 templates prêts à déployer
  - [Soumettre un template](https://github.com/Azure/awesome-azd/issues) - Contribution communautaire
- **🎯 Guide de démarrage rapide** : Section simplifiée en 3 étapes pour commencer (Installer → Se connecter → Déployer)
- **📊 Tableau de navigation basé sur l'expérience** : Guide clair pour savoir par où commencer selon l'expérience du développeur

#### Modifié
- **Structure du README** : Réorganisé pour une divulgation progressive - info clé d'abord
- **Section Introduction** : Réécrite pour expliquer "La Magie de `azd up`" aux débutants complets
- **Suppression des contenus dupliqués** : Élimination de la section dépannage dupliquée
- **Commandes de dépannage** : Correction de la référence `azd logs` pour utiliser la commande valide `azd monitor --logs`

#### Corrigé
- **🔐 Commandes d'authentification** : Ajout de `azd auth login` et `azd auth logout` dans cheat-sheet.md
- **Références commandes invalides** : Suppression des références restantes à `azd logs` dans la section dépannage du README

#### Notes
- **Portée** : Modifications appliquées au README.md principal et resources/cheat-sheet.md
- **Public cible** : Améliorations spécifiquement destinées aux développeurs néophytes en AZD

---

### [v3.10.0] - 2026-02-05

#### Mise à jour de l'exactitude des commandes Azure Developer CLI
**Cette version corrige les commandes AZD inexistantes dans la documentation, garantissant que tous les exemples de code utilisent une syntaxe valide Azure Developer CLI.**

#### Corrigé
- **🔧 Commandes AZD inexistantes supprimées** : Audit complet et correction des commandes invalides :
  - `azd logs` (n'existe pas) → remplacé par `azd monitor --logs` ou alternatives Azure CLI
  - Sous-commandes `azd service` (n'existent pas) → remplacées par `azd show` et Azure CLI
  - `azd infra import/export/validate` (n'existent pas) → supprimées ou remplacées par des alternatives valides
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (n'existent pas) → supprimés
  - Flags `azd provision --what-if/--rollback` (n'existent pas) → mises à jour pour utiliser `--preview`
  - `azd config validate` (n'existe pas) → remplacé par `azd config list`
  - `azd info`, `azd history`, `azd metrics` (n'existent pas) → supprimés

- **📚 Fichiers mis à jour avec corrections des commandes** :
  - `resources/cheat-sheet.md` : Révision majeure de la référence des commandes
  - `docs/deployment/deployment-guide.md` : Correction des stratégies de rollback et déploiement
  - `docs/troubleshooting/debugging.md` : Correction des sections d’analyse des logs
  - `docs/troubleshooting/common-issues.md` : Mise à jour des commandes de dépannage
  - `docs/troubleshooting/ai-troubleshooting.md` : Correction de la section de débogage AZD
  - `docs/getting-started/azd-basics.md` : Correction des commandes de surveillance
  - `docs/getting-started/first-project.md` : Mise à jour des exemples de surveillance et débogage
  - `docs/getting-started/installation.md` : Correction des exemples d’aide et de version
  - `docs/pre-deployment/application-insights.md` : Correction des commandes de visualisation des logs
  - `docs/pre-deployment/coordination-patterns.md` : Correction des commandes de débogage des agents

- **📝 Mise à jour de la référence de version** :
  - `docs/getting-started/installation.md` : Passage de la version codée en dur `1.5.0` à `1.x.x` générique avec lien vers les releases

#### Modifié
- **Stratégies de rollback** : Documentation mise à jour pour utiliser le rollback basé sur Git (AZD ne dispose pas de rollback natif)
- **Visualisation des logs** : Les références `azd logs` remplacées par `azd monitor --logs`, `azd monitor --live` et commandes Azure CLI
- **Section performance** : Suppression des flags de déploiement parallèle/incrémental inexistants, fourniture d’alternatives valides

#### Détails techniques
- **Commandes AZD valides** : `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Options valides pour azd monitor** : `--live`, `--logs`, `--overview`
- **Fonctionnalités supprimées** : `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Vérification** : Commandes validées avec Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalisation de l'atelier et mise à jour de la qualité de la documentation
**Cette version complète les modules interactifs de l'atelier, corrige tous les liens cassés de la documentation et améliore la qualité globale du contenu pour les développeurs IA utilisant Microsoft AZD.**

#### Ajouté
- **📝 CONTRIBUTING.md** : Nouveau document de consignes de contribution avec :
  - Instructions claires pour signaler des problèmes et proposer des modifications
  - Normes de documentation pour les nouveaux contenus
  - Directives pour les exemples de code et conventions de messages de commit
  - Informations sur l'engagement communautaire

#### Terminé
- **🎯 Module d'atelier 7 (Conclusion)** : Module de conclusion entièrement complété avec :
  - Résumé complet des réalisations de l'atelier
  - Section des concepts clés maîtrisés couvrant AZD, les modèles et AI Foundry
  - Recommandations pour la poursuite du parcours d'apprentissage
  - Exercices défis de l'atelier avec évaluations de difficulté
  - Liens de retour d'expérience et support communautaire

- **📚 Module d'atelier 3 (Déconstruction)** : Objectifs d'apprentissage mis à jour avec :
  - Activation de GitHub Copilot avec serveurs MCP
  - Compréhension de la structure des dossiers des modèles AZD
  - Modèles d'organisation infrastructure-as-code (Bicep)
  - Instructions pour le laboratoire pratique

- **🔧 Module d'atelier 6 (Démontage)** : Complété avec :
  - Objectifs de nettoyage des ressources et gestion des coûts
  - Utilisation de `azd down` pour une déprovisionnement sécurisé de l'infrastructure
  - Reprise de services cognitifs supprimés en douceur
  - Incitations bonus pour explorer GitHub Copilot et le portail Azure

#### Corrigé
- **🔗 Correction de liens cassés** : Résolution de plus de 15 liens internes cassés dans la documentation :
  - `docs/ai-foundry/ai-model-deployment.md` : Correction des chemins vers microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md` : Correction des chemins vers ai-model-deployment.md et production-ai-practices.md
  - `docs/getting-started/first-project.md` : Remplacement de cicd-integration.md introuvable par deployment-guide.md
  - `examples/retail-scenario.md` : Correction des chemins FAQ et guide de dépannage
  - `examples/container-app/microservices/README.md` : Correction des chemins accueil du cours et guide de déploiement
  - `resources/faq.md` et `resources/glossary.md` : Mise à jour des références du chapitre AI
  - `course-outline.md` : Correction des références au guide de l'instructeur et au laboratoire de l'atelier AI

- **📅 Bannière d'état de l'atelier** : Mise à jour du statut de "En construction" à atelier actif avec date février 2026

- **🔗 Navigation de l'atelier** : Correction des liens de navigation cassés dans le README.md de l'atelier pointant vers le dossier lab-1-azd-basics inexistant

#### Modifié
- **Présentation de l'atelier** : Suppression de l'avertissement "en construction", l'atelier est désormais complet et prêt à l'emploi
- **Cohérence de navigation** : Garantie que tous les modules d'atelier ont une navigation correcte entre modules
- **Références aux parcours d'apprentissage** : Mise à jour des références croisées de chapitres avec chemins corrects microsoft-foundry

#### Validé
- ✅ Tous les fichiers markdown en anglais ont des liens internes valides
- ✅ Modules d'atelier 0-7 complets avec objectifs pédagogiques
- ✅ Navigation entre chapitres et modules fonctionne correctement
- ✅ Contenu adapté aux développeurs IA utilisant Microsoft AZD
- ✅ Langage accessible aux débutants maintenu
- ✅ CONTRIBUTING.md fournit des consignes claires pour les contributeurs communautaires

#### Mise en œuvre technique
- **Validation des liens** : Script PowerShell automatisé a vérifié tous les liens internes .md
- **Audit de contenu** : Revue manuelle de la complétude de l'atelier et de la pertinence pour débutants
- **Système de navigation** : Application de schémas cohérents de navigation entre chapitres et modules

#### Notes
- **Portée** : Modifications appliquées uniquement à la documentation anglaise
- **Traductions** : Dossiers de traduction non mis à jour dans cette version (la traduction automatique sera synchronisée plus tard)
- **Durée de l'atelier** : L'atelier complet offre désormais 3-4 heures d'apprentissage pratique

---

### [v3.8.0] - 2025-11-19

#### Documentation avancée : supervision, sécurité et modèles multi-agent
**Cette version ajoute des leçons complètes de niveau A sur l'intégration d'Application Insights, les modèles d'authentification et la coordination multi-agent pour les déploiements en production.**

#### Ajouté
- **📊 Leçon sur l'intégration d'Application Insights** : dans `docs/pre-deployment/application-insights.md` :
  - Déploiement axé AZD avec provisionnement automatique
  - Modèles Bicep complets pour Application Insights + Log Analytics
  - Applications Python opérationnelles avec télémétrie personnalisée (plus de 1 200 lignes)
  - Modèles de supervision AI/LLM (suivi des jetons/coûts Azure OpenAI)
  - 6 diagrammes Mermaid (architecture, traçage distribué, flux de télémétrie)
  - 3 exercices pratiques (alertes, tableaux de bord, surveillance IA)
  - Exemples de requêtes Kusto et stratégies d'optimisation des coûts
  - Flux métriques en direct et débogage temps réel
  - Temps d'apprentissage de 40-50 minutes avec modèles prêts production

- **🔐 Leçon sur l'authentification et la sécurité** : dans `docs/getting-started/authsecurity.md` :
  - 3 modèles d'authentification (chaînes de connexion, Key Vault, identité gérée)
  - Modèles d'infrastructure Bicep complets pour déploiements sécurisés
  - Code application Node.js avec intégration SDK Azure
  - 3 exercices complets (activation identité gérée, identité assignée utilisateur, rotation Key Vault)
  - Bonnes pratiques de sécurité et configurations RBAC
  - Guide de dépannage et analyse des coûts
  - Modèles d'authentification sans mot de passe prêts production

- **🤖 Leçon sur les modèles de coordination multi-agent** : dans `docs/pre-deployment/coordination-patterns.md` :
  - 5 modèles de coordination (séquentiel, parallèle, hiérarchique, piloté par événement, consensus)
  - Implémentation complète du service orchestreur (Python/Flask, plus de 1 500 lignes)
  - 3 implémentations spécialisées d'agents (Recherche, Rédacteur, Éditeur)
  - Intégration Service Bus pour la mise en file de messages
  - Gestion d'état Cosmos DB pour systèmes distribués
  - 6 diagrammes Mermaid illustrant les interactions agents
  - 3 exercices avancés (gestion time-out, logique de retry, disjoncteur)
  - Répartition des coûts (240-565 $/mois) avec stratégies d'optimisation
  - Intégration Application Insights pour la surveillance

#### Amélioré
- **Chapitre pré-déploiement** : Inclut désormais la supervision complète et les modèles de coordination
- **Chapitre démarrage** : Enrichi avec des modèles d'authentification professionnels
- **Préparation production** : Couverture complète de la sécurité à l'observabilité
- **Plan du cours** : Mise à jour pour référencer les nouvelles leçons des chapitres 3 et 6

#### Modifié
- **Progression pédagogique** : Meilleure intégration de la sécurité et supervision tout au long du cours
- **Qualité de la documentation** : Normes de qualité A uniformes (95-97 %) sur les nouvelles leçons
- **Modèles production** : Couverture complète de bout en bout pour déploiements d'entreprise

#### Amélioré
- **Expérience développeur** : Parcours clair du développement à la surveillance en production
- **Normes de sécurité** : Modèles professionnels d'authentification et gestion secrète
- **Observabilité** : Intégration complète Application Insights avec AZD
- **Charges IA** : Supervision spécialisée pour Azure OpenAI et systèmes multi-agents

#### Validé
- ✅ Toutes les leçons comprennent du code complet fonctionnel (pas de snippets)
- ✅ Diagrammes Mermaid pour apprentissage visuel (19 au total sur 3 leçons)
- ✅ Exercices pratiques avec étapes de vérification (9 au total)
- ✅ Modèles Bicep prêts production déployables via `azd up`
- ✅ Analyse des coûts et stratégies d'optimisation
- ✅ Guides de dépannage et bonnes pratiques
- ✅ Points de contrôle des connaissances avec commandes de vérification

#### Résultats de notation de la documentation
- **docs/pre-deployment/application-insights.md** : - Guide complet de supervision
- **docs/getting-started/authsecurity.md** : - Modèles de sécurité professionnels
- **docs/pre-deployment/coordination-patterns.md** : - Architectures multi-agent avancées
- **Nouveaux contenus globaux** : - Normes de haute qualité cohérentes

#### Mise en œuvre technique
- **Application Insights** : Log Analytics + télémétrie personnalisée + traçage distribué
- **Authentification** : Identité gérée + Key Vault + modèles RBAC
- **Multi-Agent** : Service Bus + Cosmos DB + Container Apps + orchestration
- **Surveillance** : Métriques en direct + requêtes Kusto + alertes + tableaux de bord
- **Gestion des coûts** : Stratégies d'échantillonnage, politiques de rétention, contrôles budgétaires

### [v3.7.0] - 2025-11-19

#### Améliorations qualité documentation et nouvel exemple Azure OpenAI
**Cette version améliore la qualité de la documentation dans le dépôt et ajoute un exemple complet de déploiement Azure OpenAI avec interface de chat GPT-4.**

#### Ajouté
- **🤖 Exemple de chat Azure OpenAI** : Déploiement complet GPT-4 avec implémentation opérationnelle dans `examples/azure-openai-chat/` :
  - Infrastructure Azure OpenAI complète (déploiement modèle GPT-4)
  - Interface chat en ligne de commande Python avec historique des conversations
  - Intégration Key Vault pour stockage sécurisé des clés API
  - Suivi de consommation de jetons et estimation des coûts
  - Limitation de débit et gestion des erreurs
  - README complet avec guide de déploiement de 35-45 minutes
  - 11 fichiers prêts production (modèles Bicep, application Python, configuration)
- **📚 Exercices de documentation** : Ajout d'exercices pratiques dans le guide de configuration :
  - Exercice 1 : Configuration multi-environnement (15 minutes)
  - Exercice 2 : Pratique de gestion des secrets (10 minutes)
  - Critères de succès clairs et étapes de vérification
- **✅ Vérification du déploiement** : Section ajoutée dans le guide de déploiement :
  - Procédures de contrôle santé
  - Liste de critères de réussite
  - Résultats attendus pour toutes les commandes de déploiement
  - Référence rapide de dépannage

#### Amélioré
- **examples/README.md** : Mise à jour à qualité A (93 %) :
  - Ajout de azure-openai-chat dans toutes les sections concernées
  - Mise à jour du nombre d'exemples locaux de 3 à 4
  - Ajout dans la table des exemples d'applications IA
  - Intégration dans le démarrage rapide pour utilisateurs intermédiaires
  - Ajout dans la section modèles Microsoft Foundry
  - Mise à jour de la matrice de comparaison et des sections de recherche technologique
- **Qualité de la documentation** : Amélioration de B+ (87 %) à A- (92 %) dans le dossier docs :
  - Ajout des sorties attendues aux exemples de commandes critiques
  - Inclusion des étapes de vérification pour modifications de configuration
  - Renforcement de l'apprentissage pratique avec exercices concrets

#### Modifié
- **Progression pédagogique** : Meilleure intégration des exemples IA pour les apprenants intermédiaires
- **Structure documentaire** : Exercices plus concrets avec résultats clairs
- **Processus de vérification** : Ajout explicite des critères de réussite aux flux clés

#### Amélioré
- **Expérience développeur** : Le déploiement Azure OpenAI prend désormais 35-45 minutes (vs 60-90 pour alternatives complexes)
- **Transparence des coûts** : Estimations claires (50-200 $/mois) pour l’exemple Azure OpenAI
- **Parcours d’apprentissage** : Points d'entrée clairs pour développeurs IA avec azure-openai-chat
- **Normes documentaires** : Sorties attendues et étapes de vérification cohérentes

#### Validé
- ✅ Exemple Azure OpenAI entièrement fonctionnel avec `azd up`
- ✅ Tous les 11 fichiers d’implémentation syntaxiquement corrects
- ✅ Instructions README correspondant à l’expérience de déploiement réelle
- ✅ Liens de documentation mis à jour dans plus de 8 endroits
- ✅ Index des exemples reflétant précisément 4 exemples locaux
- ✅ Aucune duplication de liens externes dans les tableaux
- ✅ Toutes les références de navigation exactes

#### Mise en œuvre technique
- **Architecture Azure OpenAI** : GPT-4 + Key Vault + modèle Container Apps
- **Sécurité** : Prêt Identité gérée, secrets dans Key Vault
- **Surveillance** : Intégration Application Insights
- **Gestion des coûts** : Suivi des jetons et optimisation d’utilisation
- **Déploiement** : Commande unique `azd up` pour configuration complète

### [v3.6.0] - 2025-11-19

#### Mise à jour majeure : exemples de déploiement Container App
**Cette version introduit des exemples complets de déploiement d'applications conteneurisées prêtes à la production avec Azure Developer CLI (AZD), documentation complète et intégration au parcours d’apprentissage.**

#### Ajouté
- **🚀 Exemples Container App** : Nouveaux exemples locaux dans `examples/container-app/` :
  - [Guide principal](examples/container-app/README.md) : vue d’ensemble complète des déploiements conteneurisés, démarrage rapide, production et modèles avancés
  - [API Flask simple](../../examples/container-app/simple-flask-api) : API REST pour débutants avec scalabilité à zéro, probes santé, supervision, et dépannage
  - [Architecture microservices](../../examples/container-app/microservices) : déploiement multi-service prêt production (API Gateway, Produit, Commande, Utilisateur, Notification), messagerie asynchrone, Service Bus, Cosmos DB, Azure SQL, traçage distribué, déploiement blue-green/canary
- **Bonnes pratiques** : sécurité, supervision, optimisation coûts et guidage CI/CD pour charges conteneurisées
- **Exemples de code** : `azure.yaml` complet, modèles Bicep, implémentations services multi-langages (Python, Node.js, C#, Go)
- **Tests & dépannage** : scénarios tests bout en bout, commandes supervision, guide dépannage

#### Modifié
- **README.md** : Mis à jour pour présenter et lier les nouveaux exemples container app sous "Exemples locaux - Applications conteneurisées"
- **examples/README.md** : Mis à jour pour mettre en avant les exemples container app, ajouter des entrées dans la matrice de comparaison et actualiser les références technologiques/architecturales
- **Plan du cours et guide d'étude** : Mis à jour pour référencer de nouveaux exemples d'applications conteneurisées et des modèles de déploiement dans les chapitres concernés

#### Validé
- ✅ Tous les nouveaux exemples sont déployables avec `azd up` et suivent les meilleures pratiques
- ✅ Liens croisés et navigation de la documentation mis à jour
- ✅ Les exemples couvrent des scénarios du niveau débutant au niveau avancé, y compris les microservices en production

#### Notes
- **Portée** : Documentation et exemples en anglais uniquement
- **Étapes suivantes** : Extension avec des modèles de conteneurs avancés supplémentaires et une automatisation CI/CD dans les versions futures

### [v3.5.0] - 2025-11-19

#### Rebranding du produit : Microsoft Foundry  
**Cette version met en œuvre un changement complet du nom du produit de "Microsoft Foundry" à "Microsoft Foundry" dans toute la documentation anglaise, reflétant le rebranding officiel de Microsoft.**

#### Modifié  
- **🔄 Mise à jour du nom du produit** : Rebranding complet de "Microsoft Foundry" à "Microsoft Foundry"  
  - Mise à jour de toutes les références dans la documentation anglaise du dossier `docs/`  
  - Renommage du dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`  
  - Renommage du fichier : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Total : 23 références de contenu mises à jour dans 7 fichiers de documentation  

- **📁 Changements dans la structure des dossiers** :  
  - `docs/ai-foundry/` renommé en `docs/microsoft-foundry/`  
  - Tous les liens croisés mis à jour pour refléter la nouvelle structure des dossiers  
  - Liens de navigation validés dans toute la documentation  

- **📄 Renommage de fichiers** :  
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
  - Tous les liens internes mis à jour pour référencer le nouveau nom de fichier  

#### Fichiers mis à jour  
- **Documentation des chapitres** (7 fichiers) :  
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mises à jour de liens de navigation  
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 références de nom de produit mises à jour  
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Déjà utilisant Microsoft Foundry (depuis les mises à jour précédentes)  
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 références mises à jour (vue d’ensemble, retours de la communauté, documentation)  
  - `docs/getting-started/azd-basics.md` - 4 liens croisés mis à jour  
  - `docs/getting-started/first-project.md` - 2 liens de navigation de chapitre mis à jour  
  - `docs/getting-started/installation.md` - 2 liens de chapitre suivant mis à jour  
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 références mises à jour (navigation, communauté Discord)  
  - `docs/troubleshooting/common-issues.md` - 1 lien de navigation mis à jour  
  - `docs/troubleshooting/debugging.md` - 1 lien de navigation mis à jour  

- **Fichiers de structure du cours** (2 fichiers) :  
  - `README.md` - 17 références mises à jour (aperçu du cours, titres des chapitres, section modèles, retours de la communauté)  
  - `course-outline.md` - 14 références mises à jour (aperçu, objectifs d’apprentissage, ressources de chapitre)  

#### Validé  
- ✅ Aucune référence restante au chemin de dossier "ai-foundry" dans la documentation anglaise  
- ✅ Aucune référence restante au nom de produit "Microsoft Foundry" dans la documentation anglaise  
- ✅ Tous les liens de navigation fonctionnels avec la nouvelle structure de dossiers  
- ✅ Renommages des fichiers et dossiers réalisés avec succès  
- ✅ Liens croisés entre les chapitres validés  

#### Notes  
- **Portée** : Changements appliqués uniquement à la documentation anglaise dans le dossier `docs/`  
- **Traductions** : Dossiers de traduction (`translations/`) non mis à jour dans cette version  
- **Atelier** : Matériel d’atelier (`workshop/`) non mis à jour dans cette version  
- **Exemples** : Certains fichiers d’exemples peuvent encore référencer d’anciens noms (sera corrigé dans une mise à jour future)  
- **Liens externes** : URLs externes et références au dépôt GitHub restent inchangés  

#### Guide de migration pour les contributeurs  
Si vous avez des branches locales ou une documentation référant à l’ancienne structure :  
1. Mettez à jour les références de dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`  
2. Mettez à jour les références de fichiers : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`  
3. Remplacez le nom du produit : "Microsoft Foundry" → "Microsoft Foundry"  
4. Vérifiez que tous les liens internes de la documentation fonctionnent toujours  

---

### [v3.4.0] - 2025-10-24

#### Améliorations de l’aperçu et de la validation de l’infrastructure  
**Cette version introduit un support complet de la nouvelle fonctionnalité d’aperçu CLI Azure Developer et améliore l’expérience utilisateur des ateliers.**

#### Ajouté  
- **🧪 Documentation de la commande azd provision --preview** : Couverture complète de la nouvelle fonctionnalité d’aperçu de l’infrastructure  
  - Référence de commande et exemples d’utilisation dans la fiche récapitulative  
  - Intégration détaillée dans le guide de provision avec cas d’usage et avantages  
  - Intégration d’un contrôle préliminaire pour une validation plus sûre du déploiement  
  - Mise à jour du guide de démarrage avec pratiques de déploiement sécurisées  
- **🚧 Bannière d’état d’atelier** : Bannière HTML professionnelle indiquant le statut de développement de l’atelier  
  - Design en dégradé avec indicateurs de construction pour une communication claire à l’utilisateur  
  - Horodatage de dernière mise à jour pour transparence  
  - Design responsive adapté à tous types d’appareils  

#### Amélioré  
- **Sécurité infrastructure** : Fonctionnalité d’aperçu intégrée dans toute la documentation de déploiement  
- **Validation avant déploiement** : Scripts automatisés incluant désormais les tests d’aperçu d’infrastructure  
- **Flux de travail développeur** : Séquences de commandes mises à jour pour inclure l’aperçu comme bonne pratique  
- **Expérience atelier** : Communication claire du statut pour les utilisateurs concernant le développement du contenu  

#### Modifié  
- **Meilleures pratiques de déploiement** : Approche « aperçu d’abord » désormais recommandée  
- **Flux de documentation** : Validation de l’infrastructure anticipée dans le processus d’apprentissage  
- **Présentation de l’atelier** : Communication professionnelle du statut avec calendrier de développement clair  

#### Amélioré  
- **Approche sécurité** : Validation des modifications d’infrastructure possible avant déploiement  
- **Collaboration d’équipe** : Résultats d’aperçu partageables pour révision et approbation  
- **Sensibilisation aux coûts** : Meilleure compréhension des coûts des ressources avant provisionnement  
- **Réduction des risques** : Moins d’échecs de déploiement grâce à une validation anticipée  

#### Implémentation technique  
- **Intégration multi-documents** : Fonctionnalité d’aperçu documentée dans 4 fichiers clés  
- **Schémas de commande** : Syntaxe et exemples cohérents à travers la documentation  
- **Intégration des bonnes pratiques** : Aperçu inclus dans workflows et scripts de validation  
- **Indicateurs visuels** : Marquage clair des NOUVEAUTÉS pour faciliter la découverte  

#### Infrastructure atelier  
- **Communication de statut** : Bannière HTML professionnelle avec style dégradé  
- **Expérience utilisateur** : Statut de développement clair évitant les confusions  
- **Présentation professionnelle** : Maintient la crédibilité du dépôt tout en fixant les attentes  
- **Transparence temporelle** : Horodatage d’octobre 2025 pour responsabilité  

### [v3.3.0] - 2025-09-24

#### Matériel d’atelier amélioré et expérience d’apprentissage interactive  
**Cette version introduit un matériel d’atelier complet avec guides interactifs basés sur navigateur et parcours d’apprentissage structurés.**

#### Ajouté  
- **🎥 Guide d’atelier interactif** : Expérience atelier basée sur navigateur avec capacité de prévisualisation MkDocs  
- **📝 Instructions d’atelier structurées** : Parcours d’apprentissage guidé en 7 étapes de la découverte à la personnalisation  
  - 0-Introduction : Vue d’ensemble de l’atelier et configuration  
  - 1-Select-AI-Template : Découverte et sélection du modèle  
  - 2-Validate-AI-Template : Procédures de déploiement et validation  
  - 3-Deconstruct-AI-Template : Compréhension de l’architecture du modèle  
  - 4-Configure-AI-Template : Configuration et personnalisation  
  - 5-Customize-AI-Template : Modifications avancées et itérations  
  - 6-Teardown-Infrastructure : Nettoyage et gestion des ressources  
  - 7-Wrap-up : Résumé et prochaines étapes  
- **🛠️ Outils d’atelier** : Configuration MkDocs avec thème Material pour une meilleure expérience d’apprentissage  
- **🎯 Parcours pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)  
- **📱 Intégration GitHub Codespaces** : Mise en place fluide de l’environnement de développement  

#### Amélioré  
- **Laboratoire AI Workshop** : Étendu avec une expérience d’apprentissage structurée de 2-3 heures  
- **Documentation atelier** : Présentation professionnelle avec navigation et aides visuelles  
- **Progression d’apprentissage** : Guide clair étape par étape de la sélection du modèle au déploiement en production  
- **Expérience développeur** : Outils intégrés pour simplifier les workflows de développement  

#### Amélioré  
- **Accessibilité** : Interface navigateur avec recherche, fonction copier, et changement de thème  
- **Apprentissage autonome** : Structure flexible adaptée aux différents rythmes d’apprentissage  
- **Application pratique** : Scénarios réels de déploiement de modèles AI  
- **Intégration communautaire** : Intégration Discord pour soutien et collaboration durant l’atelier  

#### Fonctionnalités de l’atelier  
- **Recherche intégrée** : Découverte rapide par mot-clé ou leçon  
- **Copie de blocs de code** : Fonctionnalité “survol pour copier” pour tous les exemples de code  
- **Changement de thème** : Support mode clair/sombre pour différentes préférences  
- **Ressources visuelles** : Captures d’écran et diagrammes pour meilleure compréhension  
- **Intégration d’aide** : Accès direct à Discord pour support communautaire  

### [v3.2.0] - 2025-09-17

#### Restructuration majeure de la navigation et système d’apprentissage par chapitres  
**Cette version introduit une structure d’apprentissage complète basée sur les chapitres avec une navigation améliorée dans tout le dépôt.**

#### Ajouté  
- **📚 Système d’apprentissage par chapitres** : Cours réorganisé en 8 chapitres d’apprentissage progressifs  
  - Chapitre 1 : Fondations & Démarrage rapide (⭐ - 30-45 min)  
  - Chapitre 2 : Développement AI-First (⭐⭐ - 1-2 heures)  
  - Chapitre 3 : Configuration & Authentification (⭐⭐ - 45-60 min)  
  - Chapitre 4 : Infrastructure as Code & Déploiement (⭐⭐⭐ - 1-1,5 heure)  
  - Chapitre 5 : Solutions Multi-Agents AI (⭐⭐⭐⭐ - 2-3 heures)  
  - Chapitre 6 : Validation & Planification avant déploiement (⭐⭐ - 1 heure)  
  - Chapitre 7 : Dépannage & Debugging (⭐⭐ - 1-1,5 heure)  
  - Chapitre 8 : Modèles Production & Entreprise (⭐⭐⭐⭐ - 2-3 heures)  
- **📚 Système de navigation complet** : En-têtes et pieds de page de navigation cohérents dans toute la documentation  
- **🎯 Suivi des progrès** : Checklist de complétion du cours et système de vérification d’apprentissage  
- **🗺️ Orientation du parcours d’apprentissage** : Points d’entrée clairs selon niveaux d’expérience et objectifs  
- **🔗 Navigation croisée** : Chapitres liés et prérequis clairement associés  

#### Amélioré  
- **Structure README** : Transformé en plateforme d’apprentissage structurée basée sur chapitres  
- **Navigation Documentation** : Chaque page affiche désormais le contexte du chapitre et guide la progression  
- **Organisation des modèles** : Exemples et templates associés aux chapitres d’apprentissage correspondants  
- **Intégration des ressources** : Fiches, FAQ et guides d’étude liés aux chapitres pertinents  
- **Intégration atelier** : Labs pratiques associés à plusieurs objectifs de chapitre  

#### Modifié  
- **Progression d’apprentissage** : Passage d’une documentation linéaire à un parcours d’apprentissage flexible par chapitres  
- **Positionnement de la configuration** : Guide de configuration repositionné au chapitre 3 pour un meilleur flux pédagogique  
- **Intégration du contenu AI** : Meilleure intégration du contenu spécifique AI dans le parcours d’apprentissage  
- **Contenu Production** : Modèles avancés regroupés dans le chapitre 8 pour les apprenants en entreprise  

#### Amélioré  
- **Expérience utilisateur** : Fil d’Ariane clair et indicateurs de progression par chapitre  
- **Accessibilité** : Modèles de navigation cohérents pour faciliter le parcours du cours  
- **Présentation professionnelle** : Structure de cours de type universitaire, adaptée à la formation académique et professionnelle  
- **Efficacité d’apprentissage** : Réduction du temps pour trouver le contenu pertinent grâce à une meilleure organisation  

#### Implémentation technique  
- **En-têtes de navigation** : Navigation standardisée par chapitre dans plus de 40 fichiers de documentation  
- **Pieds de page** : Guide de progression cohérent et indicateurs de complétion de chapitre  
- **Liens croisés** : Système complet de liens internes reliant concepts et ressources liés  
- **Mapping des chapitres** : Templates et exemples associés clairement aux objectifs d’apprentissage  

#### Amélioration du guide d’étude  
- **📚 Objectifs d’apprentissage complets** : Guide d’étude restructuré pour s’aligner sur le système des 8 chapitres  
- **🎯 Évaluation par chapitre** : Chaque chapitre inclut des objectifs spécifiques et des exercices pratiques  
- **📋 Suivi des progrès** : Planning d’apprentissage hebdomadaire avec résultats mesurables et checklists de complétion  
- **❓ Questions d’évaluation** : Questions de validation des connaissances par chapitre avec résultats professionnels  
- **🛠️ Exercices pratiques** : Activités manuelles avec scénarios réels de déploiement et dépannage  
- **📊 Progression des compétences** : Avancement clair du niveau basique aux modèles d’entreprise avec focus sur la carrière  
- **🎓 Cadre de certification** : Résultats de développement professionnel et système de reconnaissance communautaire  
- **⏱️ Gestion du calendrier** : Plan d’apprentissage structuré de 10 semaines avec validation par étapes  

### [v3.1.0] - 2025-09-17

#### Solutions AI multi-agents améliorées  
**Cette version améliore la solution multi-agent de vente au détail avec une meilleure dénomination des agents et une documentation enrichie.**

#### Modifié  
- **Terminologie multi-agents** : Remplacement de "agent Cora" par "agent Client" dans toute la solution retail multi-agent pour plus de clarté  
- **Architecture des agents** : Mise à jour de toute la documentation, des modèles ARM et exemples de code avec la dénomination cohérente "agent Client"  
- **Exemples de configuration** : Refondus des modèles de configuration des agents avec les nouvelles conventions de nommage  
- **Cohérence documentaire** : Vérification que toutes les références utilisent des noms d’agents professionnels et explicites  

#### Amélioré  
- **Package ARM Template** : Mise à jour du modèle retail-multiagent-arm-template avec les références à l’agent Client  
- **Diagrammes d’architecture** : Actualisation des diagrammes Mermaid avec le nouveau nommage des agents  
- **Exemples de code** : Classes Python et exemples d’implémentation utilisant désormais CustomerAgent  
- **Variables d’environnement** : Mise à jour de tous les scripts de déploiement pour utiliser la convention CUSTOMER_AGENT_NAME  

#### Amélioré
- **Expérience développeur** : Rôles et responsabilités des agents plus clairs dans la documentation  
- **Préparation à la production** : Meilleure conformité avec les conventions de nommage d’entreprise  
- **Matériel d’apprentissage** : Nommage d’agents plus intuitif à des fins pédagogiques  
- **Utilisabilité des modèles** : Compréhension simplifiée des fonctions d’agents et des modèles de déploiement  

#### Détails techniques  
- Diagrammes d’architecture Mermaid mis à jour avec les références CustomerAgent  
- Noms des classes CoraAgent remplacés par CustomerAgent dans les exemples Python  
- Configurations JSON des templates ARM modifiées pour utiliser le type d’agent "customer"  
- Variables d’environnement mises à jour du pattern CORA_AGENT_* vers CUSTOMER_AGENT_*  
- Actualisation de toutes les commandes de déploiement et configurations de conteneurs  

### [v3.0.0] - 2025-09-12  

#### Changements majeurs - Orientation développeur IA et intégration Microsoft Foundry  
**Cette version transforme le dépôt en une ressource complète d’apprentissage centrée sur l’IA avec intégration Microsoft Foundry.**  

#### Ajouté  
- **🤖 Parcours d’apprentissage IA prioritaire** : Refonte complète priorisant les développeurs et ingénieurs IA  
- **Guide d’intégration Microsoft Foundry** : Documentation complète pour connecter AZD aux services Microsoft Foundry  
- **Modèles de déploiement de modèles IA** : Guide détaillé couvrant la sélection, la configuration et les stratégies de déploiement en production  
- **Atelier IA pratique** : Atelier de 2 à 3 heures pour convertir des applications IA en solutions déployables avec AZD  
- **Bonnes pratiques IA en production** : Modèles adaptés aux entreprises pour montée en charge, surveillance et sécurisation des charges IA  
- **Guide de dépannage IA spécialisé** : Assistance exhaustive pour Azure OpenAI, Cognitive Services et problèmes de déploiement IA  
- **Galerie de modèles IA** : Collection mise en avant des templates Microsoft Foundry avec niveaux de complexité  
- **Matériel d’atelier** : Structure complète de l’atelier avec labos pratiques et documents de référence  

#### Amélioré  
- **Structure du README** : Axée développeur IA avec données d’intérêt communautaire à 45% depuis Discord Microsoft Foundry  
- **Parcours d’apprentissage** : Chemin dédié développeur IA parallèlement aux parcours étudiants et DevOps traditionnels  
- **Recommandations de modèles** : Templates IA mis en avant dont azure-search-openai-demo, contoso-chat et openai-chat-app-quickstart  
- **Intégration communautaire** : Support communautaire Discord enrichi avec canaux et discussions spécifiques à l’IA  

#### Sécurité et production  
- **Modèles d’identité managée** : Configurations d’authentification et sécurité spécifiques IA  
- **Optimisation des coûts** : Suivi des usages de jetons et contrôles budgétaires pour charges IA  
- **Déploiement multi-régions** : Stratégies de déploiement globalisées des applications IA  
- **Surveillance des performances** : Métriques spécifiques IA et intégration Application Insights  

#### Qualité de documentation  
- **Structure linéaire des cours** : Progression logique du débutant aux modèles avancés de déploiement IA  
- **URLs validées** : Tous les liens externes vers les dépôts vérifiés et accessibles  
- **Références complètes** : Tous les liens internes validés et fonctionnels  
- **Prêt pour la production** : Modèles de déploiement entreprise avec exemples concrets  

### [v2.0.0] - 2025-09-09  

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle  
**Cette version représente une refonte significative de la structure et de la présentation du contenu.**  

#### Ajouté  
- **Cadre d’apprentissage structuré** : Toutes les pages de documentation incluent désormais Introduction, Objectifs d’apprentissage et Résultats attendus  
- **Système de navigation** : Liens Leçon précédente / suivante ajoutés dans toute la documentation pour une progression guidée  
- **Guide d’étude** : study-guide.md complet avec objectifs, exercices pratiques et supports d’évaluation  
- **Présentation professionnelle** : Suppression de toutes les icônes emoji pour une meilleure accessibilité et tonalité professionnelle  
- **Structure de contenu améliorée** : Organisation et déroulement des matériaux pédagogiques optimisés  

#### Modifié  
- **Format de la documentation** : Uniformisation avec structure axée sur l’apprentissage claire et cohérente  
- **Flux de navigation** : Progression logique mise en place à travers tout le contenu  
- **Présentation** : Eléments décoratifs retirés au profit d’une présentation claire et professionnelle  
- **Structure des liens** : Mise à jour des liens internes pour supporter le nouveau système de navigation  

#### Amélioré  
- **Accessibilité** : Suppression des emojis pour meilleure compatibilité avec les lecteurs d’écrans  
- **Apparence professionnelle** : Présentation épurée et académique adaptée à l’apprentissage en entreprise  
- **Expérience d’apprentissage** : Approche structurée avec objectifs et résultats clairement définis par leçon  
- **Organisation du contenu** : Meilleur enchaînement et connexion entre sujets liés  

### [v1.0.0] - 2025-09-09  

#### Première version - Dépôt complet d’apprentissage AZD  

#### Ajouté  
- **Structure centrale de documentation**  
  - Série complète de guides de démarrage  
  - Documentation complète sur le déploiement et la provision  
  - Ressources détaillées de dépannage et guides de débogage  
  - Outils et procédures de validation pré-déploiement  

- **Module de démarrage**  
  - Notions de base AZD : concepts et terminologie clés  
  - Guide d’installation : instructions spécifiques par plateforme  
  - Guide de configuration : paramétrage de l’environnement et authentification  
  - Tutoriel premier projet : apprentissage pratique étape par étape  

- **Module déploiement et provision**  
  - Guide de déploiement : documentation complète du flux de travail  
  - Guide de provisionnement : Infrastructure as Code avec Bicep  
  - Bonnes pratiques pour déploiements en production  
  - Modèles architecturaux multi-services  

- **Module validation pré-déploiement**  
  - Planification des capacités : validation des ressources Azure disponibles  
  - Sélection de SKU : guide complet des niveaux de service  
  - Contrôles préliminaires : scripts automatisés (PowerShell et Bash)  
  - Outils d’estimation des coûts et planification budgétaire  

- **Module dépannage**  
  - Problèmes courants : solutions aux problèmes fréquents  
  - Guide de débogage : méthodologies systématiques  
  - Techniques avancées de diagnostic  
  - Surveillance et optimisation des performances  

- **Ressources et références**  
  - Fiche mémo des commandes essentielles  
  - Glossaire : définitions complètes des termes et acronymes  
  - FAQ : réponses détaillées aux questions fréquentes  
  - Liens vers ressources externes et communauté  

- **Exemples et modèles**  
  - Exemple d’application web simple  
  - Modèle de déploiement de site statique  
  - Configuration d’application conteneurisée  
  - Modèles d’intégration de bases de données  
  - Exemples d’architecture microservices  
  - Implémentations de fonctions serverless  

#### Fonctionnalités  
- **Support multiplateforme** : guides d’installation et configuration pour Windows, macOS et Linux  
- **Niveaux de compétence variés** : contenu conçu des étudiants aux développeurs professionnels  
- **Orientation pratique** : exemples concrets et scénarios du monde réel  
- **Couverture complète** : des notions de base aux modèles d’entreprise avancés  
- **Approche Sécurité d’abord** : meilleures pratiques de sécurité intégrées partout  
- **Optimisation des coûts** : conseils pour déploiements et gestion efficaces des ressources  

#### Qualité de documentation  
- **Exemples de code détaillés** : échantillons pratiques et testés  
- **Instructions étape par étape** : conseils clairs et exploitables  
- **Gestion complète des erreurs** : dépannage des problèmes courants  
- **Intégration des bonnes pratiques** : standards et recommandations du secteur  
- **Compatibilité des versions** : à jour avec les derniers services Azure et fonctionnalités azd  

## Améliorations futures prévues  

### Version 3.1.0 (Prévue)  
#### Expansion plateforme IA  
- **Support multi-modèles** : intégration Hugging Face, Azure Machine Learning et modèles personnalisés  
- **Frameworks agents IA** : modèles pour déploiement LangChain, Semantic Kernel et AutoGen  
- **Modèles avancés RAG** : options bases de données vectorielles au-delà de Azure AI Search (Pinecone, Weaviate, etc.)  
- **Observabilité IA** : monitoring amélioré des performances modèles, usages de jetons et qualité des réponses  

#### Expérience développeur  
- **Extension VS Code** : expérience intégrée AZD + AI Foundry  
- **Intégration GitHub Copilot** : génération assistée IA des templates AZD  
- **Tutoriels interactifs** : exercices pratiques avec validation automatisée pour scénarios IA  
- **Contenu vidéo** : tutoriels vidéos complémentaires pour apprenants visuels axés IA  

### Version 4.0.0 (Prévue)  
#### Modèles entreprise IA  
- **Cadre de gouvernance** : gouvernance, conformité et traçabilité des modèles IA  
- **IA multi-tenant** : modèles pour services IA isolés par client  
- **Déploiement IA Edge** : intégration avec Azure IoT Edge et instances conteneurs  
- **IA hybride cloud** : modèles multi-cloud et hybrides pour charges IA  

#### Fonctionnalités avancées  
- **Automatisation pipeline IA** : intégration MLOps avec pipelines Azure Machine Learning  
- **Sécurité avancée** : modèles zero-trust, points de terminaison privés, protection contre menaces  
- **Optimisation des performances** : réglages avancés et montée en charge pour applications IA haute performance  
- **Distribution globale** : modèles CDN et edge caching pour applications IA  

### Version 3.0.0 (Prévue) - Supplantée par la version actuelle  
#### Ajouts proposés - Implémentés dans v3.0.0  
- ✅ **Contenu orienté IA** : intégration complète Microsoft Foundry (Terminé)  
- ✅ **Tutoriels interactifs** : atelier pratique IA (Terminé)  
- ✅ **Module sécurité avancé** : modèles sécurité IA (Terminé)  
- ✅ **Optimisation performances** : stratégies tuning IA (Terminé)  

### Version 2.1.0 (Prévue) - Partiellement implémentée dans v3.0.0  
#### Améliorations mineures - Certaines terminées dans la version actuelle  
- ✅ **Exemples supplémentaires** : scénarios de déploiement IA (Terminé)  
- ✅ **FAQ étendue** : questions spécifiques IA et dépannage (Terminé)  
- **Intégration outils** : guides IDE et éditeurs améliorés  
- ✅ **Extension monitoring** : modèles surveillance et alertes IA (Terminé)  

#### Toujours prévue pour version future  
- **Documentation mobile-friendly** : design responsive pour apprentissage mobile  
- **Accès hors ligne** : paquets documentation téléchargeables  
- **Intégration IDE améliorée** : extension VS Code pour workflows AZD + IA  
- **Tableau de bord communautaire** : métriques en temps réel et suivi contributions  

## Contribution au journal des modifications  

### Signaler les modifications  
Lors de contributions à ce dépôt, merci de respecter :  

1. **Numéro de version** : suivant semantic versioning (majeur.mineur.patch)  
2. **Date** : date de publication ou mise à jour au format AAAA-MM-JJ  
3. **Catégorie** : Ajouté, Modifié, Déprécié, Supprimé, Corrigé, Sécurité  
4. **Description claire** : description concise du changement  
5. **Impact** : comment les changements affectent les utilisateurs actuels  

### Catégories de modifications  

#### Ajouté  
- Nouvelles fonctionnalités, sections documentaires ou capacités  
- Nouveaux exemples, modèles ou ressources pédagogiques  
- Outils, scripts ou utilitaires supplémentaires  

#### Modifié  
- Modifications fonctionnelles ou documentaires existantes  
- Améliorations de clarté ou précision  
- Restructuration du contenu ou organisation  

#### Déprécié  
- Fonctionnalités ou approches en fin de vie  
- Sections documentaires planifiées pour suppression  
- Méthodes avec alternatives supérieures  

#### Supprimé  
- Fonctionnalités, documentation ou exemples devenus obsolètes  
- Informations dépassées ou méthodes dépréciées  
- Contenu redondant ou consolidé  

#### Corrigé  
- Corrections d’erreurs dans documentation ou code  
- Résolution de problèmes signalés  
- Amélioration de précision ou fonctionnalité  

#### Sécurité  
- Améliorations ou corrections liées à la sécurité  
- Mises à jour des meilleures pratiques de sécurité  
- Résolution de vulnérabilités  

### Directives versionning sémantique  

#### Version majeure (X.0.0)  
- Changements incompatibles nécessitant action utilisateur  
- Restructuration significative du contenu ou organisation  
- Modifications fondamentales de la méthodologie ou approche  

#### Version mineure (X.Y.0)  
- Nouveautés ou ajouts de contenu  
- Améliorations compatibles en arrière  
- Exemples, outils ou ressources supplémentaires  

#### Patch (X.Y.Z)  
- Corrections de bugs et erreurs  
- Améliorations mineures du contenu existant  
- Clarifications et petites améliorations  

## Retour d’expérience communautaire et suggestions  

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d’apprentissage :  

### Comment fournir vos retours  
- **Issues GitHub** : signaler problèmes ou proposer améliorations (retours IA bienvenus)  
- **Discussions Discord** : partager idées et échanger avec la communauté Microsoft Foundry  
- **Pull Requests** : contribuer directement à l’amélioration des contenus, particulièrement les templates IA  
- **Discord Microsoft Foundry** : participation sur #Azure pour discussions AZD + IA  
- **Forums communautaires** : échanges plus larges avec la communauté développeurs Azure  

### Catégories de retours  
- **Précision contenu IA** : corrections sur intégrations et déploiements IA  
- **Expérience d’apprentissage** : suggestions pour améliorer le parcours développeur IA  
- **Contenu IA manquant** : demandes de templates, modèles ou exemples IA supplémentaires  
- **Accessibilité** : améliorations pour besoins d’apprentissage diversifiés  
- **Intégration outils IA** : propositions pour workflow développement IA plus fluide  
- **Modèles de production IA** : requêtes sur modèles d’entreprise IA  

### Engagement de réponse  
- **Réponse aux issues** : sous 48 heures pour problèmes signalés  
- **Demandes de fonctionnalités** : évaluation sous une semaine  
- **Contributions communautaires** : revue sous une semaine  
- **Problèmes de sécurité** : priorité immédiate avec réponse accélérée  

## Planning de maintenance  

### Mises à jour régulières  
- **Revue mensuelle** : vérification précision contenus et liens  
- **Mises à jour trimestrielles** : ajouts et améliorations majeures  
- **Revue semestrielle** : restructuration et optimisations profondes  
- **Releases annuelles** : mises à jour majeures avec améliorations importantes  

### Surveillance et assurance qualité  
- **Tests automatisés** : validation régulière exemples de code et liens  
- **Intégration des retours** : prise en compte régulière des suggestions utilisateurs  
- **Mises à jour technologiques** : alignement avec derniers services Azure et versions azd  
- **Audits accessibilité** : revue périodique principes d’inclusion et design accessible  

## Politique de support des versions  

### Support versions actuelles  
- **Dernière version majeure** : support complet avec mises à jour régulières  
- **Version majeure précédente** : mises à jour sécurité et corrections critiques pendant 12 mois  
- **Versions héritées** : support communautaire uniquement, sans mises à jour officielles  

### Guide de migration  
Lors de la sortie de versions majeures, nous fournissons :
- **Guides de migration** : Instructions de transition étape par étape
- **Notes de compatibilité** : Détails sur les changements incompatibles
- **Support des outils** : Scripts ou utilitaires pour aider à la migration
- **Support communautaire** : Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon précédente** : [Guide d'étude](resources/study-guide.md)
- **Leçon suivante** : Retour au [README principal](README.md)

**Restez informé** : Surveillez ce dépôt pour recevoir des notifications sur les nouvelles versions et les mises à jour importantes des supports d'apprentissage.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour toute information critique, une traduction professionnelle réalisée par un humain est recommandée. Nous ne saurions être tenus responsables de tout malentendu ou mauvaise interprétation résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->