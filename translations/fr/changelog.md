# Changelog - AZD Pour Débutants

## Introduction

Ce changelog documente tous les changements notables, mises à jour et améliorations du dépôt AZD Pour Débutants. Nous suivons les principes de versionnage sémantique et maintenons ce journal pour aider les utilisateurs à comprendre ce qui a changé entre les versions.

## Objectifs d'apprentissage

En examinant ce changelog, vous pourrez :
- Rester informé des nouvelles fonctionnalités et ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bugs et rectifications pour garantir la précision
- Suivre l'évolution des supports d'apprentissage au fil du temps

## Résultats d'apprentissage

Après avoir consulté les entrées du changelog, vous serez capable de :
- Identifier les nouveaux contenus et ressources disponibles pour l'apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d'apprentissage en fonction des matériaux les plus récents
- Contribuer par des retours et suggestions pour les améliorations futures

## Historique des versions

### [v3.22.0] - 2026-06-16

#### Complément Débutant #2 : Création de modèle, Conteneurs Dev, Pulumi, Azure DevOps, Principaux services, et plus
**Cette version comble les derniers écarts intermédiaires identifiés par l'analyse azd-coverage : comment créer et publier votre propre modèle, des environnements dev-container/Codespaces reproductibles, le fournisseur d’infrastructure Pulumi, un tutoriel Azure DevOps CI/CD, l'authentification via principal de service, les conseils de choix d’hébergement (AKS/Spring Apps), explications sur `azd restore`/`azd package`, gestion des erreurs dans les hooks, et pratiques d’équipes/environnements partagés.**

#### Ajouté
- **🧱 Nouvelle leçon Chapitre 4** `docs/chapter-04-infrastructure/custom-templates.md` — création de votre propre modèle azd : structure requise (`azure.yaml`, `infra/`, `src/`), le champ `metadata.template`, paramétrage de l'infrastructure avec le token de ressource `uniqueString()` et l’étiquette `azd-env-name`, tests locaux avec `azd init --template <local-path>`, publication sur GitHub, et soumission à la galerie Awesome AZD
- **📦 Nouvelle leçon Chapitre 1** `docs/chapter-01-foundation/dev-containers.md` — environnements azd reproductibles avec Dev Containers et GitHub Codespaces : un `.devcontainer/devcontainer.json` minimal utilisant la fonctionnalité officielle `ghcr.io/azure/azure-dev/azd`, fonctionnalités spécifiques au langage, `docker-in-docker` pour les hôtes de conteneur, et `azd auth login --use-device-code` pour l’authentification distante
- **🧩 Pulumi avec azd** section dans `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, organisation du dossier Pulumi, les stacks associées aux environnements azd, sorties/étiquetages requis, et le flux de travail identique `azd up` / `azd down`
- **🎯 Conseils pour le choix d’hébergement** dans `docs/chapter-04-infrastructure/provisioning.md` — comparaison conviviale pour débutants entre `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, et `springapp`, avec conseils sur quand choisir AKS ou Azure Spring Apps
- **🛠️ Tutoriel Azure DevOps CI/CD** dans `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, connexion de service via fédération d’identité workload (OIDC), le fichier généré `azure-dev.yml`, et configuration des groupes de variables
- **🔑 Principaux services (Modèle 4)** ajouté à `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, authentification non interactive `azd auth login` avec secret client vs. informations d'identification fédérées/OIDC, quand utiliser, et stockage sécurisé des données d’identification
- **🪝 Gestion des erreurs dans les hooks** sous-section dans `docs/chapter-04-infrastructure/deployment-guide.md` — codes de sortie et `set -e`, `continueOnError`, tests isolés des hooks avec `azd hooks run`, shells spécifiques à l’OS, et `--debug`
- **👥 Équipes / environnements partagés** section dans `docs/chapter-03-configuration/configuration.md` — ce qui vit dans `.azure/`, ce qu’il faut ignorer avec git, environnements par développeur, `azd env list`/`select`, et fourniture des valeurs d’environnement en CI/CD
- **🧰 Explications sur `azd restore` et extension de `azd package`** dans `resources/cheat-sheet.md` — restauration des dépendances et création d’un artefact déployable sans déployer

#### Changé
- **🧭 Tableau des leçons du Chapitre 4** mis à jour pour inclure la nouvelle leçon "Création de votre propre modèle" (Leçon 3)
- **🧭 Tableau des leçons du Chapitre 1** mis à jour pour inclure la nouvelle leçon "Dev Containers & Codespaces" (Leçon 5) ; pieds de page de navigation reliés entre `bring-your-own-app.md` et `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Complément Débutant : Leçon pratique multi-agent, "Apportez votre propre app", Terraform et tutoriel CI/CD
**Cette version comble les plus grands écarts d’un guide complet pour débutants en ajoutant deux leçons pratiques (un tutoriel multi-agent déployable et ajout d’azd à une app existante), une introduction simple aux hooks, une section Terraform avec azd, un tutoriel pas à pas GitHub Actions, une explication des nouvelles extensions preview, et une checklist explicite de vérification de déploiement.**

#### Ajouté
- **🤝 Nouvelle leçon Chapitre 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un tutoriel entièrement pratique déployable à deux agents (orchestrateur + spécialistes) avec un modèle réel (`contoso-creative-writer`), couvrant quand utiliser le multi-agent, le flux `azd up`, compréhension des ressources déployées, traçage inter-agent, personnalisation et nettoyage
- **📦 Nouvelle leçon Chapitre 1** `docs/chapter-01-foundation/bring-your-own-app.md` — comment ajouter azd à un projet existant avec `azd init` ("utiliser le code dans le répertoire actuel"), compréhension de `azure.yaml` et `infra/`, `azd infra generate`, détection d’hôte, et déploiement avec `azd up`
- **🌐 Section Terraform avec azd** ajoutée à `docs/chapter-04-infrastructure/provisioning.md` — configuration `infra.provider: terraform`, organisation du dossier `.tf`, sorties `AZURE_*` requises et étiquetage `azd-env-name`, et le workflow identique `azd up` / `azd down` (comble l’écart où le support Terraform était annoncé mais seul Bicep était montré)
- **⚙️ Tutoriel pas à pas GitHub Actions** dans `docs/chapter-08-production/production-ai-practices.md` — du repo GitHub aux déploiements automatisés : `azd pipeline config`, identifiants fédérés OIDC (pas de secrets stockés), le fichier généré `azure-dev.yml`, et guide sur secrets vs variables
- **🪝 Introduction débutant "Nouveauté des hooks ?"** dans `docs/chapter-04-infrastructure/deployment-guide.md` — ce qu’est un hook, tableau des étapes de hook, premier hook minimal, et exécution manuelle avec `azd hooks run`
- **✅ Checklist "Vérifiez votre déploiement"** ajoutée à l’étape 5 de `docs/chapter-01-foundation/first-project.md` — test de fumée, vérification de l'endpoint de santé, et critères explicites de succès
- **🧩 Explications des nouvelles extensions preview** `azure.ai.skills` et `azure.ai.connections` (ce qu’elles sont et quand les utiliser) dans `docs/chapter-08-production/production-ai-practices.md`

#### Changé
- **🧭 Tableau des leçons du Chapitre 5** corrigé : `multi-agent-basics.md` est maintenant la Leçon 1 (la seule leçon entièrement pratique), avec un libellé honnête indiquant que la Leçon 2 est dans le Chapitre 6 et que le scénario Retail est un plan d'architecture, non un modèle en une commande
- **🧭 Tableau des leçons du Chapitre 1** inclut maintenant la nouvelle leçon "Apportez votre propre app" (Leçon 4)
- **🔗 Pieds de page de navigation** mis à jour : `first-project.md` pointe maintenant vers `bring-your-own-app.md`

#### Corrigé
- **🧱 Fermeture de l’écart "Terraform annoncé mais manquant"** — le cours faisait référence au support Terraform sans le montrer
- **🔀 Correction des liens croisés trompeurs dans le Chapitre 5** qui suggéraient qu’une implémentation multi-agent complète existait alors qu’il ne s’agissait que d’un plan d'architecture

#### Fichiers mis à jour
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nouveau)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nouveau)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Rafraîchissement AZD 1.25.6, Commandes complètes du cycle de vie des agents & Rebranding Aspire
**Cette version revalide le cours contre `azd` `1.25.6` (juin 2026) et l’extension `azure.ai.agents` `0.1.40-preview`, étend les conseils AI du "création d’un agent" au cycle de vie complet de l’agent (tester → évaluer → optimiser → inspecter → supprimer), met en évidence les nouvelles extensions preview `azure.ai.skills` et `azure.ai.connections`, et note le rebranding du produit ".NET Aspire" → "Aspire".**

#### Ajouté
- **🔁 Couverture complète du cycle de vie de l’agent** pour débutants et ingénieurs AI dans les docs :
  - `docs/chapter-01-foundation/azd-basics.md` — Tableau du cycle de vie (scaffold → test → mesure → amélioration → inspection → nettoyage) ajouté à la section Extensions et Commandes AI
  - `docs/chapter-08-production/production-ai-practices.md` — Nouvelle section "Gestion du cycle de vie des agents" couvrant `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, et `delete --force`
  - `resources/cheat-sheet.md` — Commandes AI Agent étendues avec `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, et `delete --force`
- **🧩 Nouvelles extensions preview** documentées : `azure.ai.skills` (compétences agents réutilisables) et `azure.ai.connections` (connexions Foundry) ajoutées au tableau des extensions et à la cheat sheet
- **⏱️ Conseils sur le temps de réponse** — les exemples `azd ai agent invoke` indiquent maintenant la latence totale et le time-to-first-byte
- **📌 Bannière de version** dans le README racine orientant les apprenants vers `azd version` et `azd upgrade`

#### Changé
- **✅ Baseline de validation mise à jour** de `azd 1.23.12` (mars 2026) à `azd 1.25.6` (juin 2026) dans tous les README des chapitres et la documentation de l’atelier
- **🤖 Note d’extension Chapitre 2** mise à jour de `azure.ai.agents` `0.1.18-preview` à `0.1.40-preview`
- **🧪 Exemple de validation en atelier** (`azd version`) mis à jour vers `1.25.6`
- **🧭 README "Quoi de neuf dans azd Aujourd’hui"** rafraîchi pour mettre en avant le cycle de vie complet des agents, les nouvelles extensions AI, et les récentes améliorations de qualité de vie (`azd init` idempotence, nettoyage de jetons périmés `azd auth login`, invite premier lancement `azd tool`)
- **📖 agents.md Chapitre 2 (Option 4)** oriente désormais les apprenants vers les commandes du cycle de vie post-déploiement plutôt que de s'arrêter à `azd up`

#### Corrigé
- **🏷️ Nom du produit** — ajout d’une note de rebranding Aspire (".NET Aspire" est maintenant simplement "Aspire") ; le support Aspire d’azd reste inchangé
- **🔎 Validation en direct de la release** confirmée avec le flux de publication Azure Developer CLI : CLI stable `1.25.6` (2026-06-12) et `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Fichiers mis à jour
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Clarification de l'intégration des débutants, validation de la configuration et nettoyage final des commandes AZD  
**Cette version fait suite au contrôle de validation AZD 1.23 avec une passe documentaire axée sur les débutants : elle clarifie les conseils d’authentification AZD en priorité, ajoute des scripts de validation de configuration locale, vérifie les principales commandes avec la CLI AZD en direct, et supprime les dernières références de commandes obsolètes en anglais en dehors du journal des modifications.**

#### Ajouté  
- **🧪 Scripts de validation de configuration pour débutants** avec `validate-setup.ps1` et `validate-setup.sh` afin que les apprenants puissent confirmer les outils requis avant de commencer le Chapitre 1  
- **✅ Étapes de validation de configuration en amont** dans le README racine et le README du Chapitre 1 pour détecter les prérequis manquants avant `azd up`

#### Modifié  
- **🔐 Conseils d’authentification pour débutants** traitant désormais systématiquement `azd auth login` comme la voie principale pour les flux AZD, avec `az login` indiqué comme optionnel sauf si des commandes Azure CLI sont utilisées directement  
- **📚 Flux d’intégration du Chapitre 1** orientant les apprenants à valider leur configuration locale avant l’installation, l’authentification et les premières étapes de déploiement  
- **🛠️ Messages du validateur** distinguant clairement les exigences bloquantes des avertissements optionnels Azure CLI pour le parcours débutant uniquement AZD  
- **📖 Docs de configuration, dépannage et exemples** différenciant désormais l’authentification AZD requise et la connexion Azure CLI optionnelle là où les deux étaient présentées auparavant sans contexte

#### Corrigé  
- **📋 Références restantes de commandes en anglais** mises à jour vers les formulaires AZD actuels, y compris `azd config show` dans la fiche récapitulative et `azd monitor --overview` lorsque le guide du portail Azure indiquait un aperçu  
- **🧭 Formulations pour débutants au Chapitre 1** nuancées pour éviter les promesses excessives de comportement garanti sans erreur ni rollback pour tous les modèles et ressources Azure  
- **🔎 Validation CLI en direct** confirmant la prise en charge actuelle de `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` et `azd down --force --purge`

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

#### Validation AZD 1.23.12, expansion de l’environnement atelier et actualisation modèle IA  
**Cette version réalise un contrôle de validation documentaire contre `azd` `1.23.12`, met à jour les exemples de commandes AZD obsolètes, actualise les recommandations de modèles IA aux paramètres par défaut actuels, et élargit les instructions d’atelier au-delà de GitHub Codespaces pour prendre en charge les conteneurs de développement et clones locaux.**

#### Ajouté  
- **✅ Notes de validation dans les chapitres principaux et docs atelier** pour expliciter la base AZD testée aux apprenants utilisant des versions CLI plus récentes ou plus anciennes  
- **⏱️ Conseils sur le timeout de déploiement** pour les déploiements d’applications IA long terme avec `azd deploy --timeout 1800`  
- **🔎 Étapes d’inspection des extensions** avec `azd extension show azure.ai.agents` dans la documentation du flux IA  
- **🌐 Conseils élargis sur l’environnement atelier** couvrant GitHub Codespaces, conteneurs de développement et clones locaux avec MkDocs

#### Modifié  
- **📚 READMEs d’introduction des chapitres** indiquant désormais systématiquement la validation contre `azd 1.23.12` dans les sections fondation, configuration, infrastructure, multi-agent, pré-déploiement, dépannage et production  
- **🛠️ Références aux commandes AZD** mises à jour vers les formulaires actuels dans les docs :  
  - `azd config list` → `azd config show`  
  - `azd env show` → `azd env list` ou `azd env get-value(s)` selon le contexte  
  - `azd auth whoami` → `azd auth status`  
  - `azd monitor` → `azd monitor --overview` lorsque l’aperçu Application Insights est prévu  
- **🧪 Exemples de provisioning en aperçu** simplifiés aux usages actuels supportés comme `azd provision --preview` et `azd provision --preview -e production`  
- **🧭 Flux atelier** mis à jour pour permettre aux apprenants de compléter les labs dans Codespaces, un conteneur de développement ou un clone local au lieu de supposer l’exécution uniquement sous Codespaces  
- **🔐 Conseils d’authentification** privilégiant désormais `azd auth login` pour les flux AZD, avec `az login` positionné en optionnel lorsque des commandes Azure CLI sont utilisées directement

#### Corrigé  
- **🪟 Commandes d’installation Windows** normalisées avec la casse correcte du package `winget` dans le guide d’installation  
- **🐧 Conseils d’installation Linux** corrigés pour éviter les instructions non supportées spécifiques à certaines distributions pour `azd` et pointer à la place vers les assets de release appropriés  
- **📦 Exemples de modèles IA** actualisés depuis d’anciens défauts tels que `gpt-35-turbo` et `text-embedding-ada-002` vers des exemples actuels comme `gpt-4.1-mini`, `gpt-4.1` et `text-embedding-3-large`  
- **📋 Extraits de déploiement et diagnostic** corrigés pour utiliser les commandes d’environnement et statut actuelles dans logs, scripts et étapes de dépannage  
- **⚙️ Conseils GitHub Actions** mis à jour de `Azure/setup-azd@v1.0.0` à `Azure/setup-azd@v2`  
- **🤖 Conseils consentement MCP/Copilot** mis à jour de `azd mcp consent` à `azd copilot consent list`

#### Amélioré  
- **🧠 Conseils chapitre IA** expliquant mieux le comportement sensible aux versions preview de `azd ai`, la connexion spécifique au tenant, l’usage actuel des extensions et les recommandations mises à jour pour le déploiement des modèles  
- **🧪 Instructions atelier** utilisant désormais des exemples de versions plus réalistes et un langage plus clair pour configurer l’environnement lors des labs pratiques  
- **📈 Docs production et dépannage** mieux alignés avec les exemples actuels de monitoring, modèle de secours et niveaux de coût

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

#### Commandes CLI AZD AI, validation de contenu et expansion des modèles  
**Cette version ajoute la couverture des commandes `azd ai`, `azd extension` et `azd mcp` dans tous les chapitres liés à l’IA, corrige les liens cassés et le code obsolète dans agents.md, met à jour la fiche récapitulative, et refond la section des modèles d’exemples avec des descriptions validées et de nouveaux modèles Azure AI AZD.**

#### Ajouté  
- **🤖 Couverture CLI AZD AI** sur 7 fichiers (précédemment uniquement dans le Chapitre 8) :  
  - `docs/chapter-01-foundation/azd-basics.md` — Nouvelle section « Extensions et commandes AI » présentant `azd extension`, `azd ai agent init` et `azd mcp`  
  - `docs/chapter-02-ai-development/agents.md` — Option 4 : `azd ai agent init` avec tableau comparatif (approche template vs manifeste)  
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sous-sections « Extensions AZD pour Foundry » et « Déploiement agent-first »  
  - `docs/chapter-05-multi-agent/README.md` — Démarrage rapide affichant à la fois les parcours de déploiement template et manifeste  
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Section Déploiement incluant désormais l’option `azd ai agent init`  
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sous-section « Commandes extension AZD AI pour diagnostics »  
  - `resources/cheat-sheet.md` — Nouvelle section « Commandes AI & Extensions » avec `azd extension`, `azd ai agent init`, `azd mcp` et `azd infra generate`  
- **📦 Nouveaux modèles exemples AZD AI** dans `microsoft-foundry-integration.md` :  
  - **azure-search-openai-demo-csharp** — Chat RAG .NET avec Blazor WebAssembly, Semantic Kernel et prise en charge vocale  
  - **azure-search-openai-demo-java** — Chat RAG Java utilisant Langchain4J avec options déploiement ACA/AKS  
  - **contoso-creative-writer** — Application d’écriture créative multi-agents utilisant Azure AI Agent Service, Bing Grounding et Prompty  
  - **serverless-chat-langchainjs** — RAG serverless avec Azure Functions + LangChain.js + Cosmos DB et support dev local Ollama  
  - **chat-with-your-data-solution-accelerator** — Accélérateur RAG entreprise avec portail admin, intégration Teams et options PostgreSQL/Cosmos DB  
  - **azure-ai-travel-agents** — Application de référence d’orchestration MCP multi-agents avec serveurs en .NET, Python, Java et TypeScript  
  - **azd-ai-starter** — Modèle de démarrage Bicep minimal d’infrastructure Azure AI  
  - **🔗 Lien galerie excellente AZD AI** — Référence à la [galerie awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ modèles)

#### Corrigé  
- **🔗 Navigation agents.md** : liens Précédent/Suivant alignés sur l’ordre des leçons dans le README du Chapitre 2 (Intégration Microsoft Foundry → Agents → Déploiement modèle IA)  
- **🔗 Liens cassés agents.md** : correction de `production-ai-practices.md` en `../chapter-08-production/production-ai-practices.md` (3 occurrences)  
- **📦 Code obsolète agents.md** : remplacement de `opencensus` par `azure-monitor-opentelemetry` + SDK OpenTelemetry  
- **🐛 API invalide agents.md** : déplacement de `max_tokens` de `create_agent()` à `create_run()` en tant que `max_completion_tokens`  
- **🔢 Comptage tokens agents.md** : remplacement de l’estimation grossière `len//4` par `tiktoken.encoding_for_model()`  
- **azure-search-openai-demo** : correction des services de « Cognitive Search + App Service » à « Azure AI Search + Azure Container Apps » (hôte par défaut changé en oct. 2024)  
- **contoso-chat** : mise à jour de la description pour référencer Azure AI Foundry + Prompty, correspondant au titre et stack tech réels du repo

#### Supprimé  
- **ai-document-processing** : suppression de la référence non fonctionnelle au modèle (repo non accessible publiquement comme modèle AZD)

#### Amélioré  
- **📝 Exercices agents.md** : l’exercice 1 affiche désormais la sortie attendue et l’étape `azd monitor` ; l’exercice 2 inclut le code complet d’enregistrement `FunctionTool` ; l’exercice 3 remplace les consignes vagues par des commandes concrètes `prepdocs.py`  
- **📚 Ressources agents.md** : liens documentaires mis à jour vers docs actuelles Azure AI Agent Service et démarrage rapide  
- **📋 Tableau Prochaines étapes agents.md** : ajout du lien au lab d’atelier IA pour une couverture complète du chapitre

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
#### Amélioration de la Navigation du Cours
**Cette version améliore la navigation dans les chapitres du README.md avec un format de tableau amélioré.**

#### Modifications
- **Tableau de la Carte du Cours** : Amélioré avec des liens directs vers les leçons, des estimations de durée et des évaluations de complexité
- **Nettoyage des Dossiers** : Suppression des anciens dossiers redondants (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validation des Liens** : Tous les plus de 21 liens internes dans le tableau de la Carte du Cours vérifiés

### [v3.16.0] - 2026-02-05

#### Mises à Jour des Noms de Produits
**Cette version met à jour les références produits avec la marque Microsoft actuelle.**

#### Modifications
- **Microsoft Foundry → Microsoft Foundry** : Toutes les références mises à jour dans les fichiers non traduits
- **Azure AI Agent Service → Foundry Agents** : Nom du service mis à jour pour refléter la marque actuelle

#### Fichiers Mis à Jour
- `README.md` - Page principale du cours
- `changelog.md` - Historique des versions
- `course-outline.md` - Structure du cours
- `docs/chapter-02-ai-development/agents.md` - Guide des agents AI
- `examples/README.md` - Documentation des exemples
- `workshop/README.md` - Page d'accueil de l'atelier
- `workshop/docs/index.md` - Index de l'atelier
- `workshop/docs/instructions/*.md` - Tous les fichiers d'instructions de l'atelier

---

### [v3.15.0] - 2026-02-05

#### Restructuration Majeure du Référentiel : Noms de Dossiers Basés sur les Chapitres
**Cette version restructure la documentation en dossiers dédiés par chapitre pour une navigation plus claire.**

#### Renommage des Dossiers
Les anciens dossiers ont été remplacés par des dossiers numérotés par chapitres :
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ajouté : `docs/chapter-05-multi-agent/`

#### Migrations des Fichiers
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
| Tous les fichiers pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Tous les fichiers troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ajouté
- **📚 Fichiers README par Chapitre** : Création de README.md dans chaque dossier de chapitre avec :
  - Objectifs d'apprentissage et durée
  - Tableau des leçons avec descriptions
  - Commandes de démarrage rapide
  - Navigation vers les autres chapitres

#### Modifications
- **🔗 Mise à Jour de Tous les Liens Internes** : Plus de 78 chemins mis à jour dans tous les fichiers de documentation
- **🗺️ README.md Principal** : Mise à jour de la Carte du Cours avec la nouvelle structure par chapitre
- **📝 examples/README.md** : Références croisées mises à jour vers les dossiers des chapitres

#### Suppressions
- Ancienne structure de dossiers (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructuration du Référentiel : Navigation par Chapitre
**Cette version a ajouté des fichiers README de navigation par chapitre (supplantée par la v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nouveau Guide des Agents AI
**Cette version ajoute un guide complet pour déployer des agents AI avec Azure Developer CLI.**

#### Ajouté
- **🤖 docs/microsoft-foundry/agents.md** : Guide complet couvrant :
  - Ce que sont les agents AI et comment ils diffèrent des chatbots
  - Trois modèles d’agents de démarrage rapide (Foundry Agents, Prompty, RAG)
  - Modèles d’architecture d’agents (agent unique, RAG, multi-agent)
  - Configuration et personnalisation des outils
  - Suivi et métriques de surveillance
  - Considérations et optimisation des coûts
  - Scénarios courants de dépannage
  - Trois exercices pratiques avec critères de réussite

#### Structure du Contenu
- **Introduction** : Concepts d’agents pour débutants
- **Démarrage Rapide** : Déployez des agents avec `azd init --template get-started-with-ai-agents`
- **Modèles d’Architecture** : Diagrammes visuels des modèles d’agents
- **Configuration** : Configuration des outils et variables d’environnement
- **Surveillance** : Intégration Application Insights
- **Exercices** : Apprentissage pratique progressif (20-45 minutes chacun)

---

### [v3.12.0] - 2026-02-05

#### Mise à Jour de l’Environnement DevContainer
**Cette version met à jour la configuration du conteneur de développement avec des outils modernes et de meilleures valeurs par défaut pour l’expérience d’apprentissage AZD.**

#### Modifications
- **🐳 Image de Base** : Mise à jour de `python:3.12-bullseye` à `python:3.12-bookworm` (dernière version stable de Debian)
- **📛 Nom du Conteneur** : Renommé de "Python 3" à "AZD for Beginners" pour plus de clarté

#### Ajouté
- **🔧 Nouvelles Fonctionnalités du Conteneur Dev** :
  - `azure-cli` avec support Bicep activé
  - `node:20` (version LTS pour les templates AZD)
  - `github-cli` pour la gestion des templates
  - `docker-in-docker` pour les déploiements d’applications conteneurisées

- **🔌 Redirection des Ports** : Ports pré-configurés pour le développement courant :
  - 8000 (aperçu MkDocs)
  - 3000 (applications Web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nouvelles Extensions VS Code** :
  - `ms-python.vscode-pylance` - IntelliSense Python amélioré
  - `ms-azuretools.vscode-azurefunctions` - Support des Azure Functions
  - `ms-azuretools.vscode-docker` - Support Docker
  - `ms-azuretools.vscode-bicep` - Support langage Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestion des ressources Azure
  - `yzhang.markdown-all-in-one` - Édition Markdown complète
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Support des diagrammes Mermaid
  - `redhat.vscode-yaml` - Support YAML (pour azure.yaml)
  - `eamodio.gitlens` - Visualisation Git
  - `mhutchie.git-graph` - Historique Git

- **⚙️ Paramètres VS Code** : Ajout des paramètres par défaut pour interpréteur Python, formatage au sauvegarde, suppression des espaces inutiles

- **📦 requirements-dev.txt Mis à Jour** :
  - Ajout du plugin MkDocs minify
  - Ajout de pre-commit pour qualité de code
  - Ajout des packages Azure SDK (azure-identity, azure-mgmt-resource)

#### Correction
- **Commande Post-Création** : Vérifie maintenant l’installation d’AZD et de l’Azure CLI au démarrage du conteneur

---

### [v3.11.0] - 2026-02-05

#### Refonte du README pour Débutants
**Cette version améliore significativement le README.md pour le rendre plus accessible aux débutants et ajoute des ressources essentielles pour les développeurs AI.**

#### Ajouté
- **🆚 Comparaison Azure CLI vs AZD** : Explication claire de quand utiliser chaque outil avec exemples pratiques
- **🌟 Liens AZD Géniaux** : Liens directs vers la galerie communautaire de templates et ressources contributives :
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Plus de 200 templates prêts à déployer
  - [Soumettre un Template](https://github.com/Azure/awesome-azd/issues) - Contribution communautaire
- **🎯 Guide de Démarrage Rapide** : Section simplifiée en 3 étapes (Installer → Se connecter → Déployer)
- **📊 Tableau de Navigation Basé sur l’Expérience** : Guide clair sur le point de départ selon le niveau du développeur

#### Modifications
- **Structure du README** : Réorganisée pour une divulgation progressive – informations clés en premier
- **Section Introduction** : Réécrite pour expliquer "La magie de `azd up`" aux débutants complets
- **Suppression du Contenu dupliqué** : Élimination de la section dépannage dupliquée
- **Commandes de Dépannage** : Correction de la référence `azd logs` pour utiliser la commande valide `azd monitor --logs`

#### Correction
- **🔐 Commandes d’Authentification** : Ajout de `azd auth login` et `azd auth logout` dans cheat-sheet.md
- **Références de Commandes Invalides** : Suppression des références restantes à `azd logs` dans la section dépannage du README

#### Notes
- **Portée** : Changements appliqués au README.md principal et resources/cheat-sheet.md
- **Public Cible** : Améliorations spécifiquement destinées aux développeurs novices avec AZD

---

### [v3.10.0] - 2026-02-05

#### Mise à Jour de la Précision des Commandes Azure Developer CLI
**Cette version corrige les commandes AZD inexistantes dans la documentation, garantissant que tous les exemples de code utilisent une syntaxe valide de Azure Developer CLI.**

#### Correction
- **🔧 Suppression des Commandes AZD Inexistantes** : Audit complet et correction des commandes invalides :
  - `azd logs` (n’existe pas) → remplacé par `azd monitor --logs` ou alternatives Azure CLI
  - Sous-commandes `azd service` (n’existent pas) → remplacées par `azd show` et Azure CLI
  - `azd infra import/export/validate` (n’existent pas) → supprimées ou remplacées par des alternatives valides
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (inexistants) → supprimés
  - Flags `azd provision --what-if/--rollback` (inexistants) → mis à jour pour utiliser `--preview`
  - `azd config validate` (n’existe pas) → remplacée par `azd config list`
  - `azd info`, `azd history`, `azd metrics` (n’existent pas) → supprimées

- **📚 Fichiers Mis à Jour avec Corrections de Commandes** :
  - `resources/cheat-sheet.md` : Révision majeure des références de commandes
  - `docs/deployment/deployment-guide.md` : Correction des stratégies de rollback et déploiement
  - `docs/troubleshooting/debugging.md` : Correction des sections d’analyse de logs
  - `docs/troubleshooting/common-issues.md` : Mise à jour des commandes de dépannage
  - `docs/troubleshooting/ai-troubleshooting.md` : Correction de la section de débogage AZD
  - `docs/getting-started/azd-basics.md` : Correction des commandes de surveillance
  - `docs/getting-started/first-project.md` : Mise à jour des exemples de surveillance et débogage
  - `docs/getting-started/installation.md` : Correction des exemples d’aide et de version
  - `docs/pre-deployment/application-insights.md` : Correction des commandes de visualisation de logs
  - `docs/pre-deployment/coordination-patterns.md` : Correction des commandes de débogage des agents

- **📝 Référence de Version Mise à Jour** : 
  - `docs/getting-started/installation.md` : Passage de la version codée en dur `1.5.0` à générique `1.x.x` avec lien vers les releases

#### Modifications
- **Stratégies de Rollback** : Documentation mise à jour pour utiliser un rollback basé sur Git (AZD n’a pas de rollback natif)
- **Visualisation des Logs** : Remplacement des références `azd logs` par `azd monitor --logs`, `azd monitor --live`, et commandes Azure CLI
- **Section Performance** : Suppression des flags inexistants de déploiement parallèle/incrémental, fourniture d’alternatives valides

#### Détails Techniques
- **Commandes AZD Valides** : `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags valides pour azd monitor** : `--live`, `--logs`, `--overview`
- **Fonctionnalités Supprimées** : `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Vérification** : Commandes validées avec Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalisation de l’Atelier et Amélioration de la Qualité de la Documentation
**Cette version complète les modules interactifs de l’atelier, corrige tous les liens cassés dans la documentation et améliore la qualité globale du contenu pour les développeurs AI utilisant Microsoft AZD.**

#### Ajouté
- **📝 CONTRIBUTING.md** : Nouveau document de directives de contribution avec :
  - Instructions claires pour signaler des problèmes et proposer des modifications
  - Normes de documentation pour le contenu nouveau
  - Lignes directrices pour les exemples de code et conventions de messages de commit
  - Informations sur l’engagement communautaire

#### Terminé
- **🎯 Module d'atelier 7 (Conclusion)** : Module de conclusion entièrement terminé avec :
  - Résumé complet des réalisations de l'atelier
  - Section des concepts clés maîtrisés couvrant AZD, les modèles et Microsoft Foundry
  - Recommandations pour la poursuite du parcours d'apprentissage
  - Exercices défis de l'atelier avec évaluations de difficulté
  - Retours de la communauté et liens de support

- **📚 Module d'atelier 3 (Déconstruction)** : Objectifs d'apprentissage mis à jour avec :
  - Guide d'activation de GitHub Copilot avec serveurs MCP
  - Compréhension de la structure des dossiers des modèles AZD
  - Modèles d'organisation d'infrastructure en tant que code (Bicep)
  - Instructions pour le laboratoire pratique

- **🔧 Module d'atelier 6 (Démontage)** : Terminé avec :
  - Objectifs de nettoyage des ressources et gestion des coûts
  - Usage de `azd down` pour une déprovisionnement sécurisé de l'infrastructure
  - Guide de récupération des services cognitifs supprimés en douceur
  - Incitations à l'exploration bonus pour GitHub Copilot et Azure Portal

#### Corrigé
- **🔗 Correction des liens cassés** : Résolution de plus de 15 liens internes cassés dans la documentation :
  - `docs/ai-foundry/ai-model-deployment.md` : Correction des chemins vers microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md` : Correction des chemins de ai-model-deployment.md et production-ai-practices.md
  - `docs/getting-started/first-project.md` : Remplacement de cicd-integration.md inexistant par deployment-guide.md
  - `examples/retail-scenario.md` : Correction des chemins vers FAQ et guide dépannage
  - `examples/container-app/microservices/README.md` : Correction des chemins vers accueil du cours et guide de déploiement
  - `resources/faq.md` et `resources/glossary.md` : Mise à jour des références au chapitre IA
  - `course-outline.md` : Correction des références au guide instructeur et au laboratoire IA

- **📅 Bannière de statut de l’atelier** : Mise à jour du statut d’« En cours » à actif avec date février 2026

- **🔗 Navigation de l’atelier** : Correction des liens de navigation cassés dans README.md pointant vers dossier lab-1-azd-basics inexistant

#### Modifié
- **Présentation de l’atelier** : Suppression de l’avertissement « en construction », l’atelier est désormais complet et prêt à l’emploi
- **Cohérence de navigation** : Assuré une navigation inter-modules correcte pour tous les modules d’atelier
- **Références aux parcours d’apprentissage** : Mise à jour des renvois croisés vers microsoft-foundry avec chemins corrects

#### Validé
- ✅ Tous les fichiers markdown en anglais ont des liens internes valides
- ✅ Modules d’atelier 0 à 7 complets avec objectifs d’apprentissage
- ✅ Navigation entre chapitres et modules fonctionnelle
- ✅ Contenu adapté aux développeurs IA utilisant Microsoft AZD
- ✅ Langage et structure accessibles aux débutants maintenus
- ✅ CONTRIBUTING.md fournit des directives claires aux contributeurs de la communauté

#### Mise en œuvre technique
- **Validation des liens** : Script PowerShell automatisé a vérifié tous les liens internes .md
- **Audit de contenu** : Revue manuelle de la complétude de l’atelier et de l’adéquation débutants
- **Système de navigation** : Application de modèles cohérents de navigation entre chapitres et modules

#### Notes
- **Périmètre** : Changements appliqués uniquement à la documentation en anglais
- **Traductions** : Les dossiers de traduction ne sont pas mis à jour dans cette version (la traduction automatique sera synchronisée ultérieurement)
- **Durée de l’atelier** : L’atelier complet offre désormais 3 à 4 heures d’apprentissage pratique

---

### [v3.8.0] - 2025-11-19

#### Documentation avancée : supervision, sécurité et modèles multi-agent
**Cette version ajoute des leçons complètes de niveau A sur l’intégration d’Application Insights, les modèles d’authentification et la coordination multi-agent pour les déploiements en production.**

#### Ajouté
- **📊 Leçon d’intégration Application Insights** : dans `docs/pre-deployment/application-insights.md` :
  - Déploiement ciblé AZD avec approvisionnement automatique
  - Modèles Bicep complets pour Application Insights + Log Analytics
  - Applications Python fonctionnelles avec télémétrie personnalisée (plus de 1 200 lignes)
  - Modèles de surveillance IA/LLM (suivi des jetons/coûts Microsoft Foundry Models)
  - 6 diagrammes Mermaid (architecture, traçage distribué, flux de télémétrie)
  - 3 exercices pratiques (alertes, tableaux de bord, surveillance IA)
  - Exemples de requêtes Kusto et stratégies d’optimisation des coûts
  - Flux métriques en direct et débogage temps réel
  - 40-50 minutes d’apprentissage avec modèles prêts pour production

- **🔐 Leçon sur les modèles d’authentification et sécurité** : dans `docs/getting-started/authsecurity.md` :
  - 3 modèles d’authentification (chaînes de connexion, Key Vault, identité managée)
  - Modèles Bicep complets pour infrastructures sécurisées
  - Code d’application Node.js avec intégration Azure SDK
  - 3 exercices complets (activation identité managée, identité assignée par utilisateur, rotation Key Vault)
  - Meilleures pratiques de sécurité et configurations RBAC
  - Guide de dépannage et analyse des coûts
  - Modèles d’authentification sans mot de passe prêts pour production

- **🤖 Leçon sur les modèles de coordination multi-agent** : dans `docs/pre-deployment/coordination-patterns.md` :
  - 5 modèles de coordination (séquentiel, parallèle, hiérarchique, piloté par événement, consensus)
  - Implémentation complète de service orchestrateur (Python/Flask, plus de 1 500 lignes)
  - 3 implémentations spécialisées d’agents (Recherche, Rédacteur, Éditeur)
  - Intégration Service Bus pour gestion des files de messages
  - Gestion d’état Cosmos DB pour systèmes distribués
  - 6 diagrammes Mermaid illustrant les interactions agents
  - 3 exercices avancés (gestion des délais, logique de retry, disjoncteur)
  - Répartition des coûts (240-565 $/mois) avec stratégies d’optimisation
  - Intégration Application Insights pour supervision

#### Amélioré
- **Chapitre pré-déploiement** : Inclusion des modèles complets de supervision et de coordination
- **Chapitre démarrage** : Enrichi avec des modèles d’authentification professionnels
- **Prêt pour production** : Couverture complète de la sécurité à l’observabilité
- **Plan de cours** : Mise à jour pour mentionner les nouvelles leçons des chapitres 3 et 6

#### Modifié
- **Progression pédagogique** : Meilleure intégration de la sécurité et de la surveillance dans le parcours
- **Qualité documentaire** : Maintien de standards de niveau A (95-97%) dans les nouvelles leçons
- **Modèles de production** : Couverture complète de bout en bout pour déploiements en entreprise

#### Amélioré
- **Expérience développeur** : Parcours clair du développement à la surveillance en production
- **Standards de sécurité** : Modèles professionnels pour authentification et gestion des secrets
- **Observabilité** : Intégration complète Application Insights avec AZD
- **Charges IA** : Surveillance spécialisée pour Microsoft Foundry Models et systèmes multi-agent

#### Validé
- ✅ Toutes les leçons contiennent du code complet fonctionnel (pas de simples extraits)
- ✅ Diagrammes Mermaid pour apprentissage visuel (19 au total pour 3 leçons)
- ✅ Exercices pratiques avec étapes de vérification (9 au total)
- ✅ Modèles Bicep prêts pour production déployables via `azd up`
- ✅ Analyse des coûts et stratégies d’optimisation
- ✅ Guides de dépannage et meilleures pratiques
- ✅ Points de contrôle de connaissances avec commandes de vérification

#### Résultats de notation documentaire
- **docs/pre-deployment/application-insights.md** : - Guide complet de la supervision
- **docs/getting-started/authsecurity.md** : - Modèles de sécurité professionnels
- **docs/pre-deployment/coordination-patterns.md** : - Architectures multi-agent avancées
- **Nouveau contenu global** : - Standards de qualité élevés et cohérents

#### Mise en œuvre technique
- **Application Insights** : Log Analytics + télémétrie personnalisée + traçage distribué
- **Authentification** : Identité managée + Key Vault + modèles RBAC
- **Multi-agent** : Service Bus + Cosmos DB + Container Apps + orchestration
- **Supervision** : Flux métriques en direct + requêtes Kusto + alertes + tableaux de bord
- **Gestion des coûts** : Échantillonnage, politiques de rétention, contrôles budgétaires

### [v3.7.0] - 2025-11-19

#### Améliorations de la qualité de la documentation et nouvel exemple Microsoft Foundry Models
**Cette version améliore la qualité de la documentation dans tout le dépôt et ajoute un exemple complet de déploiement Microsoft Foundry Models avec interface de chat gpt-4.1.**

#### Ajouté
- **🤖 Exemple chat Microsoft Foundry Models** : déploiement complet gpt-4.1 avec implémentation fonctionnelle dans `examples/azure-openai-chat/` :
  - Infrastructure Microsoft Foundry Models complète (déploiement modèle gpt-4.1)
  - Interface de chat en ligne de commande Python avec historique de conversation
  - Intégration Key Vault pour stockage sécurisé des clés API
  - Suivi d’utilisation des jetons et estimation des coûts
  - Limitation de débit et gestion des erreurs
  - README détaillé avec guide de déploiement de 35-45 minutes
  - 11 fichiers prêts pour production (modèles Bicep, application Python, configurations)
- **📚 Exercices de documentation** : ajout d’exercices pratiques au guide de configuration :
  - Exercice 1 : configuration multi-environnements (15 minutes)
  - Exercice 2 : pratique de gestion des secrets (10 minutes)
  - Critères de réussite clairs et étapes de vérification
- **✅ Vérification du déploiement** : section ajoutée au guide de déploiement :
  - Procédures de santé et état des services
  - Checklist des critères de succès
  - Résultats attendus pour toutes les commandes de déploiement
  - Référence rapide pour dépannage

#### Amélioré
- **examples/README.md** : mise à niveau vers qualité A (93%) :
  - Ajout de azure-openai-chat dans toutes les sections concernées
  - Mise à jour du nombre d’exemples locaux de 3 à 4
  - Ajout au tableau des exemples d’application IA
  - Intégration dans le démarrage rapide pour utilisateurs intermédiaires
  - Ajout à la section modèles Microsoft Foundry
  - Mise à jour de la matrice de comparaison et sections de choix technologiques
- **Qualité de documentation** : amélioration B+ (87%) → A- (92%) pour dossier docs :
  - Ajout des sorties attendues aux exemples de commandes critiques
  - Inclusion des étapes de vérification pour modifications de configuration
  - Renforcement des apprentissages pratiques par exercices concrets

#### Modifié
- **Progression pédagogique** : meilleure intégration des exemples IA pour utilisateurs intermédiaires
- **Structure documentaire** : exercices plus concrets avec résultats attendus clairs
- **Processus de vérification** : critères de succès explicites ajoutés aux flux clés

#### Amélioré
- **Expérience développeur** : déploiement Microsoft Foundry Models réduit à 35-45 minutes (contre 60-90 pour alternatives complexes)
- **Transparence des coûts** : estimations claires (50 à 200 $/mois) pour exemple Microsoft Foundry Models
- **Parcours d’apprentissage** : point d’entrée clair pour développeurs IA avec azure-openai-chat
- **Standards documentaires** : sorties attendues cohérentes et étapes de vérification

#### Validé
- ✅ Exemple Microsoft Foundry Models pleinement fonctionnel avec `azd up`
- ✅ Tous les 11 fichiers d’implémentation syntaxiquement corrects
- ✅ Instructions README cohérentes avec l’expérience réelle de déploiement
- ✅ Liens documentaires mis à jour sur plus de 8 emplacements
- ✅ Index des exemples reflète précisément 4 exemples locaux
- ✅ Pas de doublons de liens externes dans les tableaux
- ✅ Références de navigation toutes correctes

#### Mise en œuvre technique
- **Architecture Microsoft Foundry Models** : modèle gpt-4.1 + Key Vault + pattern Container Apps
- **Sécurité** : identité managée prête, secrets dans Key Vault
- **Supervision** : intégration Application Insights
- **Gestion des coûts** : suivi de jetons et optimisation d’usage
- **Déploiement** : commande unique `azd up` pour tout configurer

### [v3.6.0] - 2025-11-19

#### Mise à jour majeure : exemples de déploiement Container App
**Cette version introduit des exemples complets de déploiement d’applications conteneurisées prêtes pour la production avec Azure Developer CLI (AZD), documentation complète et intégration dans le parcours d’apprentissage.**

#### Ajouté
- **🚀 Exemples Container App** : nouveaux exemples locaux dans `examples/container-app/` :
  - [Guide maître](examples/container-app/README.md) : vue d’ensemble complète des déploiements conteneurisés, démarrage rapide, production et modèles avancés
  - [API Flask simple](../../examples/container-app/simple-flask-api) : API REST conviviale pour débutants avec scale-to-zero, sondes de santé, supervision et dépannage
  - [Architecture microservices](../../examples/container-app/microservices) : déploiement multi-service prêt pour production (API Gateway, Produit, Commande, Utilisateur, Notification), messagerie asynchrone, Service Bus, Cosmos DB, Azure SQL, traçage distribué, déploiement blue-green/canary
- **Bonnes pratiques** : sécurité, supervision, optimisation des coûts, et guide CI/CD pour charges conteneurisées
- **Exemples de code** : fichiers complets `azure.yaml`, modèles Bicep, et services multi-langages (Python, Node.js, C#, Go)
- **Tests & dépannage** : scénarios de test end-to-end, commandes de supervision, guide de dépannage

#### Modifié
- **README.md** : mise à jour pour présenter et lier les nouveaux exemples container app sous "Exemples locaux - Applications conteneurisées"
- **examples/README.md** : mise à jour pour mettre en valeur les exemples container app, ajouter entrées matrice de comparaison, et actualiser références technologiques/architecturales
- **Plan de cours & guide d’étude** : mise à jour pour mentionner les nouveaux exemples container app et modèles de déploiement dans chapitres concernés

#### Validé
- ✅ Tous les nouveaux exemples déployables avec `azd up` et respectant les bonnes pratiques
- ✅ Liens croisés et navigation documentaire mis à jour
- ✅ Exemples couvrant du débutant à l’avancé, incluant microservices en production

#### Notes
- **Périmètre** : documentation et exemples en anglais uniquement
- **Étapes suivantes** : extension avec modèles avancés et automatisation CI/CD dans prochaines versions

### [v3.5.0] - 2025-11-19

#### Rebranding produit : Microsoft Foundry
**Cette version met en œuvre un changement complet du nom produit de "Microsoft Foundry" à "Microsoft Foundry" dans toute la documentation anglaise, reflétant le rebranding officiel de Microsoft.**

#### Modifié
- **🔄 Mise à jour du nom produit** : rebranding complet de "Microsoft Foundry" à "Microsoft Foundry"
  - Mise à jour de toutes les références dans la documentation anglaise du dossier `docs/`
  - Renommage de dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fichier renommé : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total : 23 références de contenu mises à jour dans 7 fichiers de documentation

- **📁 Modifications de la structure des dossiers** :
  - `docs/ai-foundry/` renommé en `docs/microsoft-foundry/`
  - Toutes les références croisées mises à jour pour refléter la nouvelle structure des dossiers
  - Liens de navigation validés dans toute la documentation

- **📄 Renommages de fichiers** :
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tous les liens internes mis à jour pour référencer le nouveau nom de fichier

#### Fichiers mis à jour
- **Documentation des chapitres** (7 fichiers) :
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mises à jour de liens de navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 références au nom du produit mises à jour
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Déjà en utilisation Microsoft Foundry (depuis les mises à jour précédentes)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 références mises à jour (aperçu, retour communautaire, documentation)
  - `docs/getting-started/azd-basics.md` - 4 liens de références croisées mis à jour
  - `docs/getting-started/first-project.md` - 2 liens de navigation des chapitres mis à jour
  - `docs/getting-started/installation.md` - 2 liens de chapitres suivants mis à jour
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 références mises à jour (navigation, communauté Discord)
  - `docs/troubleshooting/common-issues.md` - 1 lien de navigation mis à jour
  - `docs/troubleshooting/debugging.md` - 1 lien de navigation mis à jour

- **Fichiers de structure de cours** (2 fichiers) :
  - `README.md` - 17 références mises à jour (aperçu du cours, titres des chapitres, section templates, retours de la communauté)
  - `course-outline.md` - 14 références mises à jour (aperçu, objectifs d'apprentissage, ressources des chapitres)

#### Validé
- ✅ Plus aucune référence au chemin de dossier "ai-foundry" dans la documentation en anglais
- ✅ Plus aucune référence au nom du produit "Microsoft Foundry" dans la documentation en anglais
- ✅ Tous les liens de navigation fonctionnent avec la nouvelle structure des dossiers
- ✅ Renommages de fichiers et dossiers terminés avec succès
- ✅ Références croisées entre chapitres validées

#### Notes
- **Portée** : Modifications appliquées uniquement à la documentation anglaise dans le dossier `docs/`
- **Traductions** : Les dossiers de traduction (`translations/`) ne sont pas mis à jour dans cette version
- **Atelier** : Le matériel d'atelier (`workshop/`) n’est pas mis à jour dans cette version
- **Exemples** : Les fichiers d’exemples peuvent encore contenir des noms legacy (à traiter dans une prochaine mise à jour)
- **Liens externes** : Les URLs externes et références au dépôt GitHub restent inchangés

#### Guide de migration pour les contributeurs
Si vous avez des branches locales ou de la documentation faisant référence à l’ancienne structure :
1. Mettez à jour les références des dossiers : `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Mettez à jour les références des fichiers : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Remplacez le nom du produit : "Microsoft Foundry" → "Microsoft Foundry"
4. Validez que tous les liens internes de la documentation fonctionnent toujours

---

### [v3.4.0] - 2025-10-24

#### Améliorations de l’aperçu et de la validation de l’infrastructure
**Cette version introduit un support complet pour la nouvelle fonctionnalité de prévisualisation de l’Azure Developer CLI et améliore l’expérience utilisateur de l’atelier.**

#### Ajouté
- **🧪 Documentation de la commande azd provision --preview** : Couverture complète de la nouvelle capacité d’aperçu infrastructurel
  - Référence de commande et exemples d’utilisation dans la fiche mémo
  - Intégration détaillée dans le guide de provisionnement avec cas d’usage et bénéfices
  - Vérification préliminaire intégrée pour une validation de déploiement plus sûre
  - Mises à jour du guide de démarrage avec des pratiques de déploiement prioritaires sécurité
- **🚧 Bannière de statut de l’atelier** : Bannière professionnelle HTML indiquant l’état de développement de l’atelier
  - Design en dégradé avec indicateurs de construction pour une communication claire
  - Horodatage de dernière mise à jour pour plus de transparence
  - Design responsive mobile pour tous types d’appareils

#### Amélioré
- **Sécurité de l’infrastructure** : Fonctionnalité de prévisualisation intégrée dans toute la documentation de déploiement
- **Validation pré-déploiement** : Scripts automatisés incluant désormais des tests de prévisualisation d’infrastructure
- **Flux de travail développeur** : Séquences de commandes mises à jour pour inclure la prévisualisation comme bonne pratique
- **Expérience Atelier** : Attentes claires définies pour les utilisateurs sur le statut de développement du contenu

#### Modifié
- **Meilleures pratiques de déploiement** : Workflow privilégiant la prévisualisation avant déploiement recommandé
- **Flux documentaire** : Validation de l’infrastructure avancée plus tôt dans le processus d’apprentissage
- **Présentation de l’atelier** : Communication professionnelle de statut avec calendrier clair de développement

#### Amélioré
- **Approche sécurité prioritaire** : Les modifications infrastructurelles peuvent être validées avant déploiement
- **Collaboration d’équipe** : Les résultats de prévisualisation peuvent être partagés pour revue et approbation
- **Sensibilisation aux coûts** : Meilleure compréhension des coûts des ressources avant provisionnement
- **Réduction des risques** : Moins d’échecs de déploiement grâce à la validation préalable

#### Implémentation technique
- **Intégration multi-documents** : Fonctionnalité de prévisualisation documentée dans 4 fichiers clés
- **Modèles de commandes** : Syntaxe et exemples cohérents dans toute la documentation
- **Intégration des bonnes pratiques** : Prévisualisation incluse dans les workflows et scripts de validation
- **Indicateurs visuels** : Marquages clairs de la NOUVELLE fonctionnalité pour une meilleure découverte

#### Infrastructure atelier
- **Communication de statut** : Bannière professionnelle HTML avec style en dégradé
- **Expérience utilisateur** : Statut clair de développement évitant les confusions
- **Présentation professionnelle** : Maintient la crédibilité du dépôt tout en donnant les attentes
- **Transparence du calendrier** : Horodatage de dernière mise à jour en octobre 2025 pour responsabilisation

### [v3.3.0] - 2025-09-24

#### Matériels d’atelier améliorés et expérience d’apprentissage interactive
**Cette version introduit un matériel d’atelier complet avec guides interactifs basés sur le navigateur et parcours d’apprentissage structuré.**

#### Ajouté
- **🎥 Guide d’atelier interactif** : Expérience d’atelier basée sur navigateur avec capacité de prévisualisation MkDocs
- **📝 Instructions d’atelier structurées** : Parcours d’apprentissage guidé en 7 étapes, de la découverte à la personnalisation
  - 0-Introduction : Aperçu et mise en place de l’atelier
  - 1-Select-AI-Template : Découverte et sélection de modèles
  - 2-Validate-AI-Template : Procédures de déploiement et validation
  - 3-Deconstruct-AI-Template : Compréhension de l’architecture des templates
  - 4-Configure-AI-Template : Configuration et personnalisation
  - 5-Customize-AI-Template : Modifications avancées et itérations
  - 6-Teardown-Infrastructure : Nettoyage et gestion des ressources
  - 7-Wrap-up : Résumé et prochaines étapes
- **🛠️ Outils d’atelier** : Configuration MkDocs avec thème Material pour expérience d’apprentissage améliorée
- **🎯 Parcours d’apprentissage pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces** : Mise en place fluide d’environnement de développement

#### Amélioré
- **Laboratoire d’atelier IA** : Étendu avec une expérience d’apprentissage structurée de 2-3 heures complète
- **Documentation d’atelier** : Présentation professionnelle avec navigation et aides visuelles
- **Progression d’apprentissage** : Guide clair pas à pas, de la sélection de modèles au déploiement en production
- **Expérience développeur** : Outils intégrés pour des workflows de développement simplifiés

#### Amélioré
- **Accessibilité** : Interface navigateur avec recherche, copie de code et bascule de thème
- **Apprentissage à son rythme** : Structure d’atelier flexible adaptée à différents rythmes d’apprentissage
- **Application pratique** : Scénarios réels de déploiement de modèles IA
- **Intégration communautaire** : Intégration Discord pour support et collaboration atelier

#### Fonctionnalités de l’atelier
- **Recherche intégrée** : Découverte rapide de mots-clés et leçons
- **Copie des blocs de code** : Fonction copier au survol sur tous les exemples de code
- **Bascule thème** : Mode sombre/clair selon préférence utilisateur
- **Ressources visuelles** : Captures d’écran et diagrammes pour meilleure compréhension
- **Intégration d’aide** : Accès direct à Discord pour support communautaire

### [v3.2.0] - 2025-09-17

#### Restructuration majeure de la navigation et système d’apprentissage par chapitres
**Cette version introduit une structure complète d’apprentissage par chapitres avec navigation améliorée dans tout le dépôt.**

#### Ajouté
- **📚 Système d’apprentissage par chapitres** : Refonte complète du cours en 8 chapitres progressifs
  - Chapitre 1 : Fondations & Démarrage rapide (⭐ - 30-45 min)
  - Chapitre 2 : Développement IA-first (⭐⭐ - 1-2 heures)
  - Chapitre 3 : Configuration & Authentification (⭐⭐ - 45-60 min)
  - Chapitre 4 : Infrastructure as Code & Déploiement (⭐⭐⭐ - 1-1,5 heures)
  - Chapitre 5 : Solutions IA multi-agents (⭐⭐⭐⭐ - 2-3 heures)
  - Chapitre 6 : Validation & planification pré-déploiement (⭐⭐ - 1 heure)
  - Chapitre 7 : Dépannage & Debug (⭐⭐ - 1-1,5 heures)
  - Chapitre 8 : Patterns en production et entreprise (⭐⭐⭐⭐ - 2-3 heures)
- **📚 Système de navigation complet** : En-têtes et pieds de page de navigation cohérents sur toute la documentation
- **🎯 Suivi de progression** : Liste de contrôle d’achèvement du cours et système de vérification d’apprentissage
- **🗺️ Guide de parcours d’apprentissage** : Points d’entrée clairs pour différents niveaux d’expérience et objectifs
- **🔗 Navigation de références croisées** : Chapitres liés et prérequis clairement connectés

#### Amélioré
- **Structure README** : Transformé en plateforme d’apprentissage structurée avec organisation par chapitres
- **Navigation dans la documentation** : Chaque page inclut désormais contexte de chapitre et guidance de progression
- **Organisation des templates** : Exemples et templates assignés aux chapitres d’apprentissage appropriés
- **Intégration des ressources** : Fiches mémo, FAQ et guides d’étude reliés aux chapitres pertinents
- **Intégration de l’atelier** : Labs pratiques alignés sur plusieurs objectifs d’apprentissage par chapitres

#### Modifié
- **Progression d’apprentissage** : Passage de documentation linéaire à apprentissage flexible par chapitres
- **Placement de la configuration** : Guide de configuration repositionné en Chapitre 3 pour meilleur déroulé pédagogique
- **Intégration du contenu IA** : Meilleure intégration du contenu IA tout au long du parcours d’apprentissage
- **Contenu de production** : Patterns avancés consolidés dans Chapitre 8 pour apprenants entreprise

#### Amélioré
- **Expérience utilisateur** : Fil d’ariane clair et indicateurs de progression de chapitres
- **Accessibilité** : Schémas de navigation cohérents pour faciliter le parcours du cours
- **Présentation professionnelle** : Structure universitaire adaptée aux formations académiques et corporate
- **Efficacité d’apprentissage** : Temps réduit pour trouver les contenus pertinents grâce à une meilleure organisation

#### Implémentation technique
- **En-têtes de navigation** : Navigation des chapitres standardisée sur plus de 40 fichiers de documentation
- **Navigation pied de page** : Orientation de progression cohérente et indicateurs de complétion des chapitres
- **Liens croisés** : Système complet de liens internes connectant concepts apparentés
- **Cartographie des chapitres** : Association claire des templates et exemples aux objectifs d’apprentissage

#### Amélioration du guide d’étude
- **📚 Objectifs d’apprentissage complets** : Guide d’étude restructuré pour alignement sur les 8 chapitres
- **🎯 Évaluation par chapitre** : Chaque chapitre inclut objectifs précis et exercices pratiques
- **📋 Suivi de progression** : Programme d’apprentissage hebdomadaire avec résultats mesurables et listes de contrôle
- **❓ Questions d’évaluation** : Questions de validation des connaissances pour chaque chapitre avec résultats professionnels
- **🛠️ Exercices pratiques** : Activités mains sur la pâte avec scénarios réels de déploiement et dépannage
- **📊 Progression des compétences** : Avancement clair des concepts de base aux patterns entreprise avec focus développement de carrière
- **🎓 Cadre de certification** : Résultats de développement professionnel et système de reconnaissance communautaire
- **⏱️ Gestion du calendrier** : Plan d’apprentissage structuré sur 10 semaines avec validation des étapes clés

### [v3.1.0] - 2025-09-17

#### Solutions IA multi-agents améliorées
**Cette version améliore la solution multi-agents retail avec meilleur nommage des agents et documentation enrichie.**

#### Modifié
- **Terminologie multi-agents** : Remplacement de "agent Cora" par "agent Client" dans toute la solution multi-agents retail pour plus de clarté
- **Architecture des agents** : Mise à jour de toute la documentation, des templates ARM et des exemples de code pour nommage cohérent "agent Client"
- **Exemples de configuration** : Modernisation des modèles de configuration des agents avec conventions de nommage mises à jour
- **Cohérence documentaire** : Tous les renvois utilisent désormais des noms d’agents professionnels et descriptifs

#### Amélioré
- **Package templates ARM** : Mise à jour du retail-multiagent-arm-template avec références à l’agent Client
- **Diagrammes d’architecture** : Actualisation des diagrammes Mermaid avec nommage des agents corrigé
- **Exemples de code** : Classes Python et exemples d’implémentation utilisant maintenant la dénomination CustomerAgent
- **Variables d’environnement** : Mise à jour des scripts de déploiement utilisant les conventions CUSTOMER_AGENT_NAME

#### Amélioré
- **Expérience développeur** : Rôles et responsabilités des agents clarifiés dans la documentation
- **Préparation à la production** : Meilleure adéquation avec les conventions de nommage en entreprise
- **Matériel pédagogique** : Nommage plus intuitif des agents pour les besoins d’apprentissage
- **Utilisabilité des templates** : Compréhension simplifiée des fonctions des agents et des modèles de déploiement

#### Détails techniques
- Diagrammes Mermaid mis à jour avec références à CustomerAgent
- Renommage des classes CoraAgent par CustomerAgent dans les exemples Python
- Configuration JSON des templates ARM modifiée pour utiliser le type d’agent "customer"
- Variables d’environnement modifiées de CORA_AGENT_* à CUSTOMER_AGENT_*
- Commandes de déploiement et configurations de conteneur actualisées

### [v3.0.0] - 2025-09-12

#### Changements majeurs - Orientation développeur IA et intégration Microsoft Foundry
**Cette version transforme le dépôt en ressource complète d’apprentissage IA avec intégration Microsoft Foundry.**

#### Ajouté
- **🤖 Parcours d’apprentissage AI-first** : Restructuration complète priorisant les développeurs et ingénieurs IA
- **Guide d’intégration Microsoft Foundry** : Documentation complète pour connecter AZD aux services Microsoft Foundry
- **Patterns de déploiement de modèles IA** : Guide détaillé couvrant sélection de modèles, configuration et stratégies de déploiement en production
- **Atelier AI Lab** : Atelier pratique de 2-3 heures pour convertir des applications IA en solutions déployables avec AZD  
- **Bonnes Pratiques AI en Production** : Modèles prêts entreprise pour dimensionner, surveiller et sécuriser les charges de travail IA  
- **Guide de Dépannage Spécifique IA** : Dépannage complet pour Microsoft Foundry Models, Cognitive Services et problèmes de déploiement IA  
- **Galerie de Modèles IA** : Collection mise en avant de modèles Microsoft Foundry avec degrés de complexité  
- **Matériel d’Atelier** : Structure complète d’ateliers avec laboratoires pratiques et documents de référence  

#### Amélioré  
- **Structure README** : Axée développeur IA avec 45 % de données d’intérêt communautaire provenant du Discord Microsoft Foundry  
- **Parcours d’Apprentissage** : Parcours dédié aux développeurs IA à côté des parcours traditionnels pour étudiants et ingénieurs DevOps  
- **Recommandations de Modèles** : Modèles IA en vedette incluant azure-search-openai-demo, contoso-chat et openai-chat-app-quickstart  
- **Intégration Communautaire** : Support communautaire Discord amélioré avec des canaux et discussions spécifiques IA  

#### Sécurité & Production  
- **Modèles d’Identité Gérée** : Configurations d’authentification et de sécurité spécifiques IA  
- **Optimisation des Coûts** : Suivi de l’utilisation des tokens et contrôles budgétaires pour charges IA  
- **Déploiement Multi-Région** : Stratégies de déploiement global d’applications IA  
- **Surveillance des Performances** : Métriques spécifiques IA et intégration Application Insights  

#### Qualité de la Documentation  
- **Structure Linéaire de Cours** : Progression logique des modèles de déploiement IA du débutant à l’avancé  
- **URLs Validées** : Tous les liens externes vers les dépôts vérifiés et accessibles  
- **Références Complètes** : Tous les liens internes à la documentation validés et fonctionnels  
- **Prêt pour la Production** : Modèles de déploiement entreprise avec exemples concrets  

### [v2.0.0] - 2025-09-09

#### Changements Majeurs - Restructuration du Dépôt et Améliorations Professionnelles  
**Cette version représente une refonte significative de la structure du dépôt et de la présentation du contenu.**

#### Ajouté  
- **Cadre d’Apprentissage Structuré** : Toutes les pages de documentation incluent désormais Introduction, Objectifs d’Apprentissage et Résultats d’Apprentissage  
- **Système de Navigation** : Ajout des liens Leçon Précédente/Suivante dans toute la documentation pour un apprentissage guidé  
- **Guide d’Étude** : study-guide.md complet avec objectifs pédagogiques, exercices pratiques et évaluations  
- **Présentation Professionnelle** : Suppression de toutes les icônes emoji pour une meilleure accessibilité et un rendu professionnel  
- **Structure du Contenu Améliorée** : Organisation et fluidité des supports de formation améliorées  

#### Changé  
- **Format de la Documentation** : Standardisation de toute la documentation avec une structure axée apprentissage cohérente  
- **Flux de Navigation** : Mise en œuvre d’une progression logique à travers tous les supports d’apprentissage  
- **Présentation du Contenu** : Suppression des éléments décoratifs au profit d’un format clair et professionnel  
- **Structure des Liens** : Mise à jour de tous les liens internes pour soutenir le nouveau système de navigation  

#### Amélioré  
- **Accessibilité** : Suppression de la dépendance aux emojis pour une meilleure compatibilité avec les lecteurs d’écran  
- **Apparence Professionnelle** : Présentation épurée de type académique adaptée à l’apprentissage en entreprise  
- **Expérience d’Apprentissage** : Approche structurée avec objectifs et résultats clairs pour chaque leçon  
- **Organisation du Contenu** : Meilleure logique et connexions entre sujets associés  

### [v1.0.0] - 2025-09-09

#### Version Initiale - Dépôt d'Apprentissage Complet AZD

#### Ajouté  
- **Structure de Documentation Principale**  
  - Série complète de guides pour démarrer  
  - Documentation complète sur le déploiement et le provisionnement  
  - Ressources détaillées pour le dépannage et le débogage  
  - Outils et procédures de validation pré-déploiement  

- **Module Premiers Pas**  
  - Bases AZD : Concepts et terminologie clés  
  - Guide d’Installation : Instructions spécifiques aux plateformes  
  - Guide de Configuration : Mise en place de l'environnement et authentification  
  - Tutoriel Premier Projet : Apprentissage pratique étape par étape  

- **Module Déploiement et Provisionnement**  
  - Guide de Déploiement : Documentation complète des workflows  
  - Guide de Provisionnement : Infrastructure as Code avec Bicep  
  - Bonnes pratiques pour déploiements en production  
  - Modèles d’architecture multi-services  

- **Module Validation Pré-déploiement**  
  - Planification de Capacité : Validation de disponibilité des ressources Azure  
  - Sélection SKU : Guide complet des niveaux de service  
  - Vérifications préalables : Scripts de validation automatisés (PowerShell et Bash)  
  - Outils d’estimation des coûts et planification budgétaire  

- **Module Dépannage**  
  - Problèmes Courants : Problèmes fréquemment rencontrés et solutions  
  - Guide de Débogage : Méthodologies systématiques de dépannage  
  - Techniques et outils diagnostics avancés  
  - Surveillance et optimisation des performances  

- **Ressources et Références**  
  - Fiche de Commandes : Référence rapide des commandes essentielles  
  - Glossaire : Définitions complètes de la terminologie et des acronymes  
  - FAQ : Réponses détaillées aux questions communes  
  - Liens et connexions aux ressources externes et à la communauté  

- **Exemples et Modèles**  
  - Exemple d’application Web simple  
  - Modèle de déploiement site Web statique  
  - Configuration d’application conteneur  
  - Modèles d’intégration de base de données  
  - Exemples d’architecture microservices  
  - Implémentations de fonctions serverless  

#### Fonctionnalités  
- **Support Multi-Plateforme** : Guides d’installation et configuration pour Windows, macOS et Linux  
- **Niveaux de Compétence Multiples** : Contenu conçu pour étudiants à développeurs professionnels  
- **Focus Pratique** : Exemples pratiques et scénarios réels  
- **Couverture Complète** : Concepts de base jusqu’aux modèles d’entreprise avancés  
- **Approche Sécurité Prioritaire** : Intégration des bonnes pratiques de sécurité  
- **Optimisation des Coûts** : Conseils pour déploiements rentables et gestion des ressources  

#### Qualité de la Documentation  
- **Exemples de Code Détaillés** : Exemples pratiques et testés  
- **Instructions Pas à Pas** : Guides clairs et exploitables  
- **Gestion Complète des Erreurs** : Dépannage des problèmes courants  
- **Intégration des Meilleures Pratiques** : Normes et recommandations industrie  
- **Compatibilité Versions** : À jour avec les services Azure et fonctionnalités azd  

## Améliorations Futures Planifiées

### Version 3.1.0 (Planifiée)  
#### Expansion de la Plateforme IA  
- **Support Multi-Modèle** : Modèles d’intégration pour Hugging Face, Azure Machine Learning et modèles personnalisés  
- **Frameworks Agents IA** : Modèles pour déploiements LangChain, Semantic Kernel, et AutoGen  
- **Modèles RAG Avancés** : Options de bases vectorielles au-delà d’Azure AI Search (Pinecone, Weaviate, etc.)  
- **Observabilité IA** : Surveillance améliorée des performances modèles, utilisation des tokens, qualité des réponses  

#### Expérience Développeur  
- **Extension VS Code** : Expérience de développement intégrée AZD + Microsoft Foundry  
- **Intégration GitHub Copilot** : Génération de modèles AZD assistée par IA  
- **Tutoriels Interactifs** : Exercices pratiques avec validation automatisée pour scénarios IA  
- **Contenu Vidéo** : Tutoriels additionnels vidéo pour apprentissage visuel ciblant les déploiements IA  

### Version 4.0.0 (Planifiée)  
#### Modèles d’Entreprise IA  
- **Cadre de Gouvernance** : Gouvernance de modèles IA, conformité, pistes d’audit  
- **IA Multi-Tenant** : Modèles pour desservir plusieurs clients avec services IA isolés  
- **Déploiement AI Edge** : Intégration avec Azure IoT Edge et instances conteneurs  
- **Cloud Hybride IA** : Modèles multi-cloud et hybrides pour charges IA  

#### Fonctionnalités Avancées  
- **Automatisation Pipeline IA** : Intégration MLOps avec pipelines Azure Machine Learning  
- **Sécurité Avancée** : Modèles zero-trust, points de terminaison privés, protection avancée contre les menaces  
- **Optimisation Performance** : Réglages avancés et stratégies de mise à l’échelle pour applications IA haute performance  
- **Distribution Globale** : Modèles de distribution de contenu et mise en cache edge pour applications IA  

### Version 3.0.0 (Planifiée) - Supplantée par la Version Actuelle  
#### Ajouts Proposés - Maintenant Implémentés en v3.0.0  
- ✅ **Contenu Axé IA** : Intégration complète Microsoft Foundry (Terminé)  
- ✅ **Tutoriels Interactifs** : Atelier pratique IA (Terminé)  
- ✅ **Module Sécurité Avancée** : Modèles de sécurité spécifiques IA (Terminé)  
- ✅ **Optimisation Performance** : Stratégies de réglage charges IA (Terminé)  

### Version 2.1.0 (Planifiée) - Partiellement Implémentée en v3.0.0  
#### Améliorations Mineures - Certaines Complétées dans la Version Actuelle  
- ✅ **Exemples Supplémentaires** : Scénarios de déploiement axés IA (Terminé)  
- ✅ **FAQ Étendue** : Questions et dépannage spécifiques IA (Terminé)  
- **Intégration Outils** : Guides améliorés pour IDE et éditeurs  
- ✅ **Extension Surveillance** : Modèles IA pour monitoring et alertes (Terminé)  

#### Encore Planifiées pour Diffusion Future  
- **Documentation Mobile-Friendly** : Design responsive pour apprentissage mobile  
- **Accès Hors-ligne** : Paquets documentation téléchargeables  
- **Intégration IDE Améliorée** : Extension VS Code pour workflows AZD + IA  
- **Tableau de Bord Communautaire** : Mesures communautaires en temps réel et suivi des contributions  

## Contribution au Changelog

### Rapporter des Changements  
Lors de contributions à ce dépôt, veuillez vous assurer que les entrées du changelog incluent :  

1. **Numéro de Version** : Suivant le versionnage sémantique (majeur.mineur.patch)  
2. **Date** : Date de sortie ou mise à jour au format AAAA-MM-JJ  
3. **Catégorie** : Ajouté, Modifié, Déprécié, Supprimé, Corrigé, Sécurité  
4. **Description Claire** : Description concise de ce qui a changé  
5. **Évaluation d’Impact** : Comment les changements affectent les utilisateurs existants  

### Catégories de Changements

#### Ajouté  
- Nouvelles fonctionnalités, sections de documentation ou capacités  
- Nouveaux exemples, modèles ou ressources d’apprentissage  
- Outils supplémentaires, scripts ou utilitaires  

#### Modifié  
- Modifications de fonctionnalités ou documentation existantes  
- Mises à jour pour améliorer clarté ou précision  
- Restructuration du contenu ou de l’organisation  

#### Déprécié  
- Fonctionnalités ou approches abandonnées progressivement  
- Sections de documentation prévues pour suppression  
- Méthodes remplacées par des alternatives meilleures  

#### Supprimé  
- Fonctionnalités, documentations ou exemples obsolètes  
- Informations dépassées ou approches dépréciées  
- Contenus redondants ou consolidés  

#### Corrigé  
- Corrections d’erreurs dans documentation ou code  
- Résolutions de problèmes ou bugs signalés  
- Améliorations d’exactitude ou fonctionnalité  

#### Sécurité  
- Améliorations ou corrections liées à la sécurité  
- Mises à jour de bonnes pratiques de sécurité  
- Résolutions de vulnérabilités  

### Directives de Versionnement Sémantique

#### Version Majeure (X.0.0)  
- Changements incompatibles nécessitant action utilisateur  
- Restructuration importante du contenu ou organisation  
- Modifications altérant la méthodologie fondamentale  

#### Version Mineure (X.Y.0)  
- Nouvelles fonctionnalités ou ajouts de contenu  
- Améliorations maintenant la rétrocompatibilité  
- Exemples, outils ou ressources additionnels  

#### Version Patch (X.Y.Z)  
- Corrections de bugs  
- Améliorations mineures du contenu existant  
- Clarifications et petits ajouts  

## Retour Communautaire et Suggestions

Nous encourageons activement le retour de la communauté pour améliorer cette ressource d’apprentissage :  

### Comment Fournir un Retour  
- **Issues GitHub** : Signaler problèmes ou suggérer améliorations (issues spécifiques IA bienvenues)  
- **Discussions Discord** : Partager idées et participer à la communauté Microsoft Foundry  
- **Pull Requests** : Contribuer directement à l’amélioration du contenu, notamment modèles et guides IA  
- **Discord Microsoft Foundry** : Participer au canal #Azure pour discussions AZD + IA  
- **Forums Communautaires** : Participer aux discussions larges développeurs Azure  

### Catégories de Feedback  
- **Exactitude Contenu IA** : Corrections sur intégration services IA et déploiement  
- **Expérience Apprentissage** : Suggestions pour améliorer le parcours développeur IA  
- **Contenu Manquant IA** : Demandes de modèles, approches ou exemples IA supplémentaires  
- **Accessibilité** : Améliorations pour besoins d’apprentissage variés  
- **Intégration Outils IA** : Suggestions pour meilleure intégration de workflow développement IA  
- **Modèles Production IA** : Requêtes de modèles entreprise IA  

### Engagement de Réponse  
- **Réponse aux Issues** : Sous 48 heures pour les problèmes signalés  
- **Demandes de Fonctionnalités** : Évaluation sous une semaine  
- **Contributions Communautaires** : Revue sous une semaine  
- **Questions de Sécurité** : Priorité immédiate avec réponse accélérée  

## Planification de Maintenance

### Mises à Jour Régulières  
- **Revue Mensuelle** : Exactitude du contenu et validation des liens  
- **Mises à Jour Trimestrielles** : Ajouts et améliorations majeurs  
- **Revue Semi-Annuel** : Restructuration et renforcement complets  
- **Versions Annuelles** : Mises à jour majeures avec améliorations importantes  

### Surveillance et Assurance Qualité  
- **Tests Automatisés** : Validation régulière des exemples de code et liens  
- **Intégration Feedback Communautaire** : Incorporation régulière des suggestions des utilisateurs  
- **Mises à Jour Technologiques** : Alignement avec dernières versions services Azure et azd  
- **Audits Accessibilité** : Revue régulière des principes de design inclusif  

## Politique de Support de Version

### Support de la Version Actuelle  
- **Dernière Version Majeure** : Support complet avec mises à jour régulières  
- **Version Majeure Précédente** : Mises à jour de sécurité et corrections critiques pendant 12 mois  
- **Versions Anciennes** : Support communautaire uniquement, sans mises à jour officielles  

### Guide de Migration  
Lors de la sortie de versions majeures, nous fournissons :  
- **Guides de Migration** : Instructions de transition étape par étape  
- **Notes de Compatibilité** : Détails des changements incompatibles  
- **Support Outils** : Scripts ou utilitaires pour aider à la migration  
- **Support Communautaire** : Forums dédiés aux questions de migration  

---

**Navigation**  
- **Leçon Précédente** : [Guide d’Étude](resources/study-guide.md)  
- **Leçon Suivante** : Retour au [README Principal](README.md)  

**Restez Informé** : Surveillez ce dépôt pour recevoir des notifications sur les nouvelles versions et mises à jour importantes des supports d’apprentissage.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->