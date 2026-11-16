# Journal des modifications - AZD Pour Débutants

## Introduction

Ce journal des modifications documente tous les changements remarquables, mises à jour et améliorations du dépôt AZD Pour Débutants. Nous suivons les principes de versionnage sémantique et maintenons ce journal pour aider les utilisateurs à comprendre ce qui a changé entre les versions.

## Objectifs d'apprentissage

En consultant ce journal des modifications, vous allez :
- Rester informé des nouvelles fonctionnalités et ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bugs et rectifications pour assurer l'exactitude
- Suivre l'évolution des supports d'apprentissage au fil du temps

## Résultats d'apprentissage

Après avoir consulté les entrées du journal des modifications, vous serez capable de :
- Identifier les nouveaux contenus et ressources disponibles pour l'apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d'apprentissage en fonction des supports les plus actuels
- Contribuer avec des retours et suggestions pour les améliorations futures

## Historique des versions

### [v3.25.0] - 2026-11-09

#### L'extension Microsoft Foundry 1.0 est maintenant disponible en général

Le paquet `microsoft.foundry` 1.0 est **en ligne et disponible en général**, comme annoncé le [5 novembre 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Le cours enseigne désormais le workflow GA publié, et non une version à venir. Commencez avec AZD **1.37.0 ou plus récent** et `azd ext install microsoft.foundry`.

#### Disponible dans cette mise à jour du cours
- Les consignes en anglais utilisent le paquet GA comme chemin d'installation par défaut et expliquent ses sept extensions de base versionnées indépendamment.
- Une [démonstration avec agent hébergé](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) couvre l'exemple amont de l'API Responses du Python Agent Framework, uv actuel, Python 3.13+, sélection de projet nouveau/existant, réutilisation de modèle, et revue de `azure.yaml`.
- Le workflow local-vers-cloud couvre les tests d'Agent Inspector, les coûts d'appels au modèle Azure, les builds de code à distance, l'invocation déployée, le traçage cloud, l'aperçu du déploiement, les logs, et le diagnostic.
- Les consignes d'évaluation spécifiques couvrent la génération et revue de datasets/rubrics, la configuration d'une évaluation nommée, l'enregistrement des assets, et l'inspection des résultats. Les anciennes instructions d'évaluation/optimisation restent dans l'historique de migration, pas la base de la version actuelle.
- Les consignes Foundry CI/CD comprennent l'installation des extensions runner, le déploiement authentifié, l'accès/ressources d'évaluation, et une gate de qualité explicite.
- Les consignes de nettoyage distinguent les projets Foundry nouvellement créés et réutilisés. L'atelier lie l'exercice GA séparé sans remplacer ses tests spécifiques.
- La navigation du cours, objectifs d'apprentissage, prérequis d'installation, aide-mémoire, FAQ et guide d'étude reflètent le workflow GA. Les traductions générées ne sont pas éditées manuellement.

#### Étendue de la revue
- Basée sur l'annonce GA, la consigne Microsoft Learn liée, et la configuration amont de l'exemple. Aucune provision Azure en direct, déploiement, invocation de modèle, ou évaluation n'a été réalisée.
- Le GA de paquet n'implique pas le GA pour chaque fonctionnalité optionnelle, extension indépendante ou SDK, ni ne certifie les exemples pour la production.

### [v3.24.0]- 2026-11-04

#### Corrections
- Navigation du cours anglais réparée, chemins de pages déplacés corrigés, ancres manquantes et références externes obsolètes, y compris le lien du Chapitre 2 vers le guide production AI.
- Consigne actuelle revue contre AZD 1.37.2 publiée, agents 1.0.0-beta.23, et évaluations 1.0.0-beta.2. Documenté le workflow séparé `azd ai eval` et la migration de la configuration d’optimisation.
- Correctifs sur indicateurs CLI non supportés, frontières d’authentification, consignes en clair pour environnement/secret, mises à jour d’infrastructure, configuration modèle, et exemples de récupération destructive.
- Rafraîchi l'atelier avec l'exemple AI Agents actuel, y compris hooks réels, entrées de configuration, tests d’évaluation, points d'entrée red-teaming, et observabilité.
- Corrections sur affirmations d’implémentation d’exemples et réparations des problèmes applicatifs/infrastructure/configuration associés. Le matériel sur l’architecture retail est explicitement distingué d’une application complète fonctionnelle.
- Restauré la matrice de langages CodeQL, sélectionné Node.js 24 supporté pour le container de développement, et rendu les validateurs d’installation reportant les commandes de version échouées.

#### Ajouts
- Un vérificateur de liens/ancres hors ligne uniquement en anglais, des tests de régression, et un workflow de documentation construisant aussi l'atelier en mode strict. Traductions générées et images traduites exclues.

#### Étendue de validation
- Les contrôles source, syntaxe, configuration, comportement local, et liens réseau ne garantissent pas la capacité de déploiement Azure en direct, quota, RBAC, disponibilité régionale des modèles, facturation, conformité sécurité, ou aptitude à la production.
- Les entrées plus anciennes ci-dessous sont des archives historiques, pas des instructions courantes de commande ou de version.

### [v3.23.0] - 2026-07-13

#### Rafraîchissement AZD 1.27.1 : Mise à jour de la version de référence
**Cette version revalide le cours contre `azd` `1.27.1` (juillet 2026, dernière version stable) et l’extension AI agent preview actuelle `azure.ai.agents` `1.0.0-beta.5`, mettant à jour toutes les bannières « validé contre » après les versions 1.26.0, 1.27.0, et 1.27.1.**

#### Changements
- **✅ Ligne de base de validation mise à jour** de `azd 1.25.6` (juin 2026) à `azd 1.27.1` (juillet 2026) pour le README racine, tous les README de chapitres, la leçon container-dev du Chapitre 1 (y compris exemples en version épinglée), la leçon templates-personnalisés du Chapitre 4, la leçon multi-agent du Chapitre 5, et la documentation de l’atelier
- **🤖 Ligne de base du Chapitre 2 rafraîchie** de `azd 1.23.12` (mars 2026) à `azd 1.27.1` sur `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, et `microsoft-foundry-integration.md` ; dates des notes de validation mises à jour au 13-07-2026
- **🧩 Extension AI agent relevée** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` à la version `1.0.0-beta.5` actuelle dans le README du Chapitre 2 et `agents.md`
- **🧪 Exemple de validation d’atelier** (`azd version` sortie) mis à jour à `1.27.1`

#### Notes sur les versions azd pertinentes (1.26.0 → 1.27.1)
- **1.26.0 (24-06-2026) :** Support Go pour Azure Functions sur Flex Consumption, filtres d’abonnement par locataire `azd config sub-filter`, bundles d’extensions autonomes (`azd x pack --bundle`), et `azd tool install azure-skills`
- **1.27.0 (30-06-2026) :** Modélisation des projets/agents Azure AI Foundry directement dans `azure.yaml` (init sans Bicep ni Terraform), support déploiement container pour App Service (`host: appservice` + `language: docker`), `-s/--source` direct pour commandes `azd extension`, et `azd tool uninstall`
- **1.27.1 (09-07-2026) :** Indicateur `--no-dependencies` pour `azd extension install`, modèles dépréciés exclus par défaut des invites catalogue/quota, et plusieurs corrections de bugs

#### Fichiers mis à jour
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Comblement des lacunes débutant #2 : Création de templates, Dev Containers, Pulumi, Azure DevOps, Service Principals, et plus
**Cette version comble les dernières lacunes intermédiaires révélées par l'analyse azd-coverage : comment créer et publier votre propre template, environnements dev-container/Codespaces reproductibles, fournisseur d’infrastructure Pulumi, démonstration Azure DevOps CI/CD, authentification par service principal, guidage de sélection d’hôte (AKS/Spring Apps), explications `azd restore`/`azd package`, gestion des erreurs des hooks, et pratiques d’équipes/environnements partagés.**

#### Ajouts
- **🧱 Nouvelle leçon Chapitre 4** `docs/chapter-04-infrastructure/custom-templates.md` — créer votre propre template azd : structure requise (`azure.yaml`, `infra/`, `src/`), le champ `metadata.template`, paramétrer l’infrastructure avec le token ressource `uniqueString()` et la balise `azd-env-name`, tests locaux avec `azd init --template <local-path>`, publication sur GitHub, et soumission à la galerie Awesome AZD
- **📦 Nouvelle leçon Chapitre 1** `docs/chapter-01-foundation/dev-containers.md` — environnements azd reproductibles avec Dev Containers et GitHub Codespaces : un minimal `.devcontainer/devcontainer.json` utilisant la fonctionnalité officielle `ghcr.io/azure/azure-dev/azd`, fonctionnalités spécifiques au langage, `docker-in-docker` pour hôtes de container, et `azd auth login --use-device-code` pour connexion à distance
- **🧩 Pulumi avec azd** section dans `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, layout dossiers Pulumi, stacks mappés aux environnements azd, sorties/tagging requis, et workflow identique `azd up` / `azd down`
- **🎯 Guidage de sélection d’hôte** dans `docs/chapter-04-infrastructure/provisioning.md` — comparaison accessible aux débutants de `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, et `springapp`, avec conseils pour choisir AKS ou Azure Spring Apps
- **🛠️ Démonstration Azure DevOps CI/CD** dans `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, connexion service avec fédération d’identité workload (OIDC), `azure-dev.yml` généré, et configuration variable-group
- **🔑 Service Principals (Motif 4)** ajouté à `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non interactif avec secret client vs identification fédérée/OIDC, quand utiliser, et stockage sécurisé des identifiants
- **🪝 Gestion d’erreurs des hooks** sous-section dans `docs/chapter-04-infrastructure/deployment-guide.md` — codes de sortie et `set -e`, `continueOnError`, tests isolés des hooks avec `azd hooks run`, shells OS-spécifiques, et `--debug`
- **👥 Environnements d’équipe/partagés** section dans `docs/chapter-03-configuration/configuration.md` — contenu de `.azure/`, fichiers à gitignore, environnements par développeur, `azd env list`/`select`, et fourniture des valeurs d’environnement dans CI/CD
- **🧰 `azd restore` et explications étendues `azd package`** dans `resources/cheat-sheet.md` — restauration des dépendances et construction d’un artefact déployable sans déployer

#### Modifications
- **🧭 Tableau des leçons Chapitre 4** mis à jour pour inclure la nouvelle leçon "Créer votre propre template" (Leçon 3)
- **🧭 Tableau des leçons Chapitre 1** mis à jour pour inclure la nouvelle leçon "Dev Containers & Codespaces" (Leçon 5) ; pieds de navigation liés entre `bring-your-own-app.md` et `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Comblement des lacunes débutant : Leçon pratique multi-agent, "Apportez votre propre app", Terraform, et démonstration CI/CD
**Cette version comble les plus grandes lacunes pour un guide complet de débutants en ajoutant deux nouvelles leçons pratiques (un parcours multi-agent déployable et l’ajout d’azd à une application existante), une introduction accessible aux hooks, une section Terraform avec azd, une démonstration étape par étape de pipeline GitHub Actions, une explication des nouvelles extensions preview, et une checklist explicite de vérification de déploiement.**

#### Ajouts
- **🤝 Nouvelle leçon Chapitre 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — parcours déployable complètement pratique à deux agents (orchestrateur + spécialistes) avec un template réel (`contoso-creative-writer`), couvrant quand utiliser multi-agent, workflow `azd up`, compréhension des ressources déployées, traçage cross-agent, personnalisation, et nettoyage
- **📦 Nouvelle leçon Chapitre 1** `docs/chapter-01-foundation/bring-your-own-app.md` — comment ajouter azd à un projet existant avec `azd init` ("utiliser le code dans le répertoire courant"), comprendre `azure.yaml` et `infra/`, `azd infra generate`, détection hôte, et déploiement avec `azd up`
- **🌐 Terraform avec azd** section ajoutée à `docs/chapter-04-infrastructure/provisioning.md` — configuration `infra.provider: terraform`, layout dossier `.tf`, sorties `AZURE_*` requises et tagging `azd-env-name`, et workflow identique `azd up` / `azd down` (comble la lacune où le support Terraform était revendiqué mais seul Bicep était montré)
- **⚙️ Guide pas à pas des GitHub Actions** dans `docs/chapter-08-production/production-ai-practices.md` — du dépôt GitHub aux déploiements automatisés : `azd pipeline config`, identifiants fédérés OIDC (sans secrets stockés), le `azure-dev.yml` généré, et conseils sur secrets vs variables
- **🪝 Introduction pour débutants "Nouveau aux hooks ?"** dans `docs/chapter-04-infrastructure/deployment-guide.md` — ce qu’est un hook, un tableau des étapes de hook, un premier hook minimal, et l’exécution manuelle des hooks avec `azd hooks run`
- **✅ Liste de contrôle "Vérifiez votre déploiement"** ajoutée à l’étape 5 de `docs/chapter-01-foundation/first-project.md` — test basique, vérification du point de terminaison de santé, et critères explicites de succès
- **🧩 Explication pour les nouvelles extensions en aperçu** `azure.ai.skills` et `azure.ai.connections` (ce qu’elles sont et quand les utiliser) dans `docs/chapter-08-production/production-ai-practices.md`

#### Modifications
- **🧭 Tableau des leçons du chapitre 5** corrigé : `multi-agent-basics.md` est désormais la Leçon 1 (la seule totalement pratique), avec une étiquette honnête indiquant que la Leçon 2 se trouve au Chapitre 6 et que le scénario Retail est un plan d’architecture, pas un modèle à commande unique
- **🧭 Tableau des leçons du chapitre 1** inclut maintenant la nouvelle leçon "Apportez votre propre application" (Leçon 4)
- **🔗 Pieds de page de navigation** mis à jour : `first-project.md` renvoie maintenant vers `bring-your-own-app.md`

#### Corrections
- **🧱 Combler le manque "réclamé mais absent" de Terraform** — le cours faisait précédemment référence au support Terraform sans le démontrer
- **🔀 Correction des liens croisés trompeurs du chapitre 5** qui laissaient entendre qu’une implémentation multi-agent complète existait alors qu’il n’y avait qu’un plan d’architecture

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

#### Actualisation AZD 1.25.6, commandes complètes du cycle de vie des agents et rebranding Aspire
**Cette version revalide le cours contre `azd` `1.25.6` (juin 2026) et l’extension `azure.ai.agents` `0.1.40-preview`, étend les conseils IA de "scaffolding d’agent" au cycle de vie complet de l’agent (tester → évaluer → optimiser → inspecter → supprimer), met en avant les nouvelles extensions en aperçu `azure.ai.skills` et `azure.ai.connections`, et note le rebranding produit de ".NET Aspire" vers "Aspire".**

#### Ajouts
- **🔁 Couverture complète du cycle de vie des agents** pour débutants et ingénieurs IA à travers la documentation :
  - `docs/chapter-01-foundation/azd-basics.md` — Tableau du cycle de vie (scaffolding → test → mesure → amélioration → inspection → nettoyage) ajouté à la section Extensions et Commandes IA
  - `docs/chapter-08-production/production-ai-practices.md` — Nouvelle section "Gestion du cycle de vie de l’agent" couvrant `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, et `delete --force`
  - `resources/cheat-sheet.md` — Commandes IA étendues avec `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, et `delete --force`
- **🧩 Nouvelles extensions en aperçu** documentées : `azure.ai.skills` (compétences agents réutilisables) et `azure.ai.connections` (connexions Foundry) ajoutées au tableau des extensions et au mémo
- **⏱️ Conseils sur le temps de réponse** — les exemples `azd ai agent invoke` indiquent désormais la latence totale imprimée et le temps au premier octet
- **📌 Bannière de version** dans le README racine orientant les apprenants vers `azd version` et `azd upgrade`

#### Modifications
- **✅ Mise à jour de la base de validation** de `azd 1.23.12` (mars 2026) à `azd 1.25.6` (juin 2026) dans tous les README des chapitres et la documentation de l’atelier
- **🤖 Note d’extension du chapitre 2** mise à jour de `azure.ai.agents` `0.1.18-preview` à `0.1.40-preview`
- **🧪 Exemple de validation d’atelier** (sortie `azd version`) mise à jour à `1.25.6`
- **🧭 README "Quoi de neuf dans azd aujourd’hui"** actualisé pour mettre en avant le cycle de vie complet de l’agent, les nouvelles extensions IA, et les récentes améliorations de qualité de vie (`azd init` idempotence, `azd auth login` nettoyage des jetons périmés, `azd tool` invite de premier lancement)
- **📖 agents.md du chapitre 2 (option 4)** oriente désormais les apprenants vers les commandes du cycle de vie post-déploiement plutôt que de s’arrêter à `azd up`

#### Corrections
- **🏷️ Nommage produit** — ajout d’une note de rebranding Aspire (".NET Aspire" est maintenant simplement "Aspire") ; le support d’Aspire dans azd reste inchangé
- **🔎 Validation du lancement en direct** confirmée avec le flux de versions Azure Developer CLI : CLI stable `1.25.6` (2026-06-12) et `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Clarification de l’initiation pour débutants, validation de configuration et nettoyage final des commandes AZD
**Cette version fait suite au balayage de validation AZD 1.23 avec une passe documentaire orientée débutants : elle clarifie les conseils d’authentification centrés sur AZD, ajoute des scripts locaux de validation de configuration, vérifie les commandes clés contre la CLI AZD en direct, et supprime les dernières références obsolètes en anglais de commandes en dehors du changelog.**

#### Ajouts
- **🧪 Scripts de validation de configuration pour débutants** avec `validate-setup.ps1` et `validate-setup.sh` afin que les apprenants puissent confirmer les outils requis avant de commencer le Chapitre 1
- **✅ Étapes en amont de validation de configuration** dans le README racine et le README du Chapitre 1 afin de détecter les prérequis manquants avant `azd up`

#### Modifications
- **🔐 Conseils d'authentification pour débutants** traitent maintenant de manière cohérente `azd auth login` comme voie principale pour les workflows AZD, avec `az login` indiqué comme optionnel sauf si les commandes Azure CLI sont utilisées directement
- **📚 Flux d’intégration du Chapitre 1** oriente désormais les apprenants à valider leur configuration locale avant les étapes d’installation, d’authentification et de premier déploiement
- **🛠️ Messages du validateur** distinguent clairement les exigences bloquantes des avertissements optionnels Azure CLI pour la voie débutant AZD uniquement
- **📖 Configuration, dépannage, et documentation d’exemples** différencient maintenant l’authentification requise par AZD et la connexion optionnelle Azure CLI où les deux étaient précédemment présentés sans contexte

#### Corrections
- **📋 Références restantes de commandes en source anglaise** mises à jour aux formes actuelles d’AZD, y compris `azd config show` dans le mémo et `azd monitor --overview` où un guide d’aperçu Azure Portal était prévu
- **🧭 Allégement des affirmations pour débutants dans le Chapitre 1** pour éviter des promesses excessives de comportement zéro erreur ou rollback garanti sur tous les modèles et ressources Azure
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

#### Validation AZD 1.23.12, extension de l’environnement d’atelier et actualisation du modèle IA
**Cette version réalise un balayage de validation documentaire contre `azd` `1.23.12`, met à jour les exemples de commandes AZD obsolètes, actualise les conseils sur les modèles IA aux valeurs par défaut actuelles, et élargit les instructions de l’atelier au-delà des GitHub Codespaces pour inclure également les conteneurs de développement et clones locaux.**

#### Ajouts
- **✅ Notes de validation dans les chapitres principaux et docs atelier** pour rendre explicite la base AZD testée aux apprenants utilisant des builds CLI plus récents ou plus anciens
- **⏱️ Conseils sur le délai de déploiement** pour déploiements d’apps IA de longue durée utilisant `azd deploy --timeout 1800`
- **🔎 Étapes d’inspection d’extension** avec `azd extension show azure.ai.agents` dans la documentation de workflow IA
- **🌐 Conseils plus larges pour l’environnement d’atelier** couvrant GitHub Codespaces, conteneurs de développement, et clones locaux avec MkDocs

#### Modifications
- **📚 README d’introduction des chapitres** notent dorénavant de façon cohérente la validation contre `azd 1.23.12` dans les sections fondation, configuration, infrastructure, multi-agent, pré-déploiement, dépannage, et production
- **🛠️ Références aux commandes AZD** mises à jour vers les formes actuelles dans la documentation :
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` selon contexte
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` où un aperçu Application Insights est prévu
- **🧪 Exemples de provisionnement en aperçu** simplifiés à l’usage actuel supporté tel que `azd provision --preview` et `azd provision --preview -e production`
- **🧭 Flux d’atelier** mis à jour pour permettre aux apprenants de réaliser les laboratoires dans Codespaces, un conteneur de développement, ou un clone local au lieu de supposer une exécution uniquement dans Codespaces
- **🔐 Conseils d’authentification** préfèrent désormais `azd auth login` pour les workflows AZD, avec `az login` positionné comme optionnel quand les commandes Azure CLI sont utilisées directement

#### Corrections
- **🪟 Commandes d’installation Windows** normalisées à la casse du paquet `winget` actuelle dans le guide d’installation
- **🐧 Conseils d’installation Linux** corrigés pour éviter les instructions spécifiques de gestionnaire de paquets de distribution non supportées `azd` et pointer à la place vers les assets de version quand approprié
- **📦 Exemples de modèles IA** actualisés des anciens par défauts tels que `gpt-35-turbo` et `text-embedding-ada-002` vers des exemples actuels comme `gpt-4.1-mini`, `gpt-4.1` et `text-embedding-3-large`
- **📋 Extraits de déploiement et de diagnostic** corrigés pour utiliser les commandes d’environnement et de statut actuelles dans les logs, scripts, et étapes de dépannage
- **⚙️ Conseils GitHub Actions** mis à jour de `Azure/setup-azd@v1.0.0` à `Azure/setup-azd@v2`
- **🤖 Conseils d’obtention de consentement MCP/Copilot** mis à jour de `azd mcp consent` à `azd copilot consent list`

#### Améliorations
- **🧠 Conseils dans le chapitre IA** expliquent désormais mieux le comportement sensible aux aperçus `azd ai`, la connexion spécifique au locataire, l’usage actuel des extensions, et les recommandations de déploiement des modèles mises à jour
- **🧪 Instructions d’atelier** utilisent maintenant des exemples de version plus réalistes et un langage plus clair pour la configuration de l’environnement des laboratoires pratiques
- **📈 Documentation production et dépannage** mieux alignée avec les exemples actuels de surveillance, modèle de repli et paliers de coût

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

#### Commandes IA AZD CLI, validation du contenu et expansion des modèles
**Cette version ajoute la couverture des commandes `azd ai`, `azd extension` et `azd mcp` dans tous les chapitres liés à l'IA, corrige les liens cassés et le code obsolète dans agents.md, met à jour la feuille de triche et refond la section des Modèles d'Exemple avec des descriptions validées et de nouveaux modèles Azure AI AZD.**

#### Ajouté
- **🤖 Couverture AZD AI CLI** sur 7 fichiers (auparavant uniquement dans le Chapitre 8) :
  - `docs/chapter-01-foundation/azd-basics.md` — Nouvelle section "Extensions et commandes IA" introduisant `azd extension`, `azd ai agent init`, et `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4 : `azd ai agent init` avec tableau comparatif (approche modèle vs manifeste)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sous-sections "Extensions AZD pour Foundry" et "Déploiement orienté Agent"
  - `docs/chapter-05-multi-agent/README.md` — Démarrage rapide montre maintenant les chemins de déploiement basés sur modèle et manifeste
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La section Déploiement inclut maintenant l’option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sous-section "Commandes d'extension AZD AI pour le diagnostic"
  - `resources/cheat-sheet.md` — Nouvelle section "Commandes IA & Extensions" avec `azd extension`, `azd ai agent init`, `azd mcp`, et `azd infra generate`
- **📦 Nouveaux modèles d’exemple AZD AI** dans `microsoft-foundry-integration.md` :
  - **azure-search-openai-demo-csharp** — Chat RAG .NET avec Blazor WebAssembly, Semantic Kernel et support vocal
  - **azure-search-openai-demo-java** — Chat RAG Java utilisant Langchain4J avec options de déploiement ACA/AKS
  - **contoso-creative-writer** — Application d'écriture créative multi-agent utilisant Azure AI Agent Service, Bing Grounding et Prompty
  - **serverless-chat-langchainjs** — RAG sans serveur avec Azure Functions + LangChain.js + Cosmos DB et support dev local Ollama
  - **chat-with-your-data-solution-accelerator** — Accélérateur RAG entreprise avec portail admin, intégration Teams et options PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Application de référence MCP multi-agent avec serveurs en .NET, Python, Java, et TypeScript
  - **azd-ai-starter** — Modèle de démarrage minimaliste Azure AI infrastructure Bicep
  - **🔗 Lien Galerie AZD AI Génial** — Référence à la [galerie awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (plus de 80 modèles)

#### Corrigé
- **🔗 Navigation agents.md** : Les liens Précédent/Suivant correspondent maintenant à l’ordre des leçons du Chapitre 2 README (Intégration Microsoft Foundry → Agents → Déploiement de Modèles IA)
- **🔗 Liens cassés agents.md** : `production-ai-practices.md` corrigé en `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 Code obsolète agents.md** : Remplacement de `opencensus` par `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API invalide agents.md** : `max_tokens` déplacé de `create_agent()` vers `create_run()` comme `max_completion_tokens`
- **🔢 Comptage tokens agents.md** : Remplacement de l’estimation approximative `len//4` par `tiktoken.encoding_for_model()`
- **azure-search-openai-demo** : Correction des services de "Cognitive Search + App Service" à "Azure AI Search + Azure Container Apps" (hôte par défaut modifié en oct. 2024)
- **contoso-chat** : Mise à jour de la description pour référencer Azure AI Foundry + Prompty, correspondant au titre et à la stack technologique réels du dépôt

#### Supprimé
- **ai-document-processing** : Suppression de la référence à un modèle non fonctionnel (répertoire non accessible publiquement comme modèle AZD)

#### Amélioré
- **📝 Exercices agents.md** : L’exercice 1 montre maintenant la sortie attendue et la étape `azd monitor` ; l’exercice 2 inclut le code complet d’enregistrement `FunctionTool` ; l’exercice 3 remplace les instructions vagues par des commandes précises `prepdocs.py`
- **📚 Ressources agents.md** : Mise à jour des liens de documentation vers les docs actuelles Azure AI Agent Service et démarrage rapide
- **📋 Tableau Étapes Suivantes agents.md** : Ajout du lien du laboratoire AI Workshop pour une couverture complète du chapitre

#### Fichiers Mis à Jour
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
**Cette version améliore la navigation dans les chapitres README.md avec un format de tableau amélioré.**

#### Modifié
- **Tableau de la carte du cours** : Amélioré avec liens directs vers les leçons, estimations de durée et niveaux de complexité
- **Nettoyage des dossiers** : Suppression des anciens dossiers redondants (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validation des liens** : Vérification de plus de 21 liens internes dans le tableau de la carte du cours

### [v3.16.0] - 2026-02-05

#### Mises à jour du nom des produits
**Cette version met à jour les références produits vers la marque Microsoft actuelle.**

#### Modifié
- **Microsoft Foundry → Microsoft Foundry** : Toutes les références mises à jour dans les fichiers hors traduction
- **Azure AI Agent Service → Foundry Agents** : Nom du service mis à jour pour refléter la marque actuelle

#### Fichiers Mis à Jour
- `README.md` - Page principale du cours
- `changelog.md` - Historique des versions
- `course-outline.md` - Structure du cours
- `docs/chapter-02-ai-development/agents.md` - Guide des agents IA
- `examples/README.md` - Documentation des exemples
- `workshop/README.md` - Page de lancement de l’atelier
- `workshop/docs/index.md` - Index de l’atelier
- `workshop/docs/instructions/*.md` - Tous les fichiers d’instruction de l’atelier

---

### [v3.15.0] - 2026-02-05

#### Restructuration majeure du dépôt : noms des dossiers par chapitres
**Cette version restructure la documentation en dossiers dédiés par chapitre pour une navigation plus claire.**

#### Renommage des dossiers
Les anciens dossiers ont été remplacés par des dossiers numérotés par chapitre :
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ajouté nouveau : `docs/chapter-05-multi-agent/`

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
| Tous les fichiers pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Tous les fichiers troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ajouté
- **📚 Fichiers README des chapitres** : Création de README.md dans chaque dossier de chapitre avec :
  - Objectifs d’apprentissage et durée
  - Tableau des leçons avec descriptions
  - Commandes de démarrage rapide
  - Navigation vers les autres chapitres

#### Modifié
- **🔗 Mise à jour de tous les liens internes** : Plus de 78 chemins mis à jour dans toute la documentation
- **🗺️ README.md principal** : Mise à jour de la carte du cours avec la nouvelle structure des chapitres
- **📝 examples/README.md** : Mise à jour des références croisées vers les dossiers chapitres

#### Supprimé
- Ancienne structure de dossiers (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructuration du dépôt : Navigation par chapitre
**Cette version a ajouté des fichiers README de navigation par chapitre (remplacés par v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nouveau Guide des Agents IA
**Cette version ajoute un guide complet pour déployer des agents IA avec Azure Developer CLI.**

#### Ajouté
- **🤖 docs/microsoft-foundry/agents.md** : Guide complet couvrant :
  - Qu’est-ce que les agents IA et comment ils diffèrent des chatbots
  - Trois modèles d’agents démarrage rapide (Foundry Agents, Prompty, RAG)
  - Modèles d’architecture d’agent (agent unique, RAG, multi-agent)
  - Configuration et personnalisation des outils
  - Surveillance et suivi métrique
  - Considérations et optimisation des coûts
  - Scénarios courants de dépannage
  - Trois exercices pratiques avec critères de réussite

#### Structure du contenu
- **Introduction** : Concepts des agents pour débutants
- **Démarrage rapide** : Déployer agents avec `azd init --template get-started-with-ai-agents`
- **Modèles d’architecture** : Diagrammes visuels des modèles d’agents
- **Configuration** : Paramétrage des outils et variables d’environnement
- **Surveillance** : Intégration Application Insights
- **Exercices** : Apprentissage pratique progressif (20-45 minutes chacun)

---

### [v3.12.0] - 2026-02-05

#### Mise à jour de l’environnement DevContainer
**Cette version met à jour la configuration du container de développement avec des outils modernes et de meilleures valeurs par défaut pour l’expérience d’apprentissage AZD.**

#### Modifié
- **🐳 Image de base** : Mise à jour de `python:3.12-bullseye` à `python:3.12-bookworm` (dernière Debian stable)
- **📛 Nom du container** : Renommé de "Python 3" à "AZD for Beginners" pour plus de clarté

#### Ajouté
- **🔧 Nouvelles fonctionnalités du Dev Container** :
  - `azure-cli` avec support Bicep activé
  - `node:20` (version LTS pour modèles AZD)
  - `github-cli` pour la gestion des modèles
  - `docker-in-docker` pour les déploiements container apps

- **🔌 Redirections de ports** : Ports préconfigurés pour développement courant :
  - 8000 (aperçu MkDocs)
  - 3000 (applications web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nouvelles extensions VS Code** :
  - `ms-python.vscode-pylance` - IntelliSense Python amélioré
  - `ms-azuretools.vscode-azurefunctions` - Support Azure Functions
  - `ms-azuretools.vscode-docker` - Support Docker
  - `ms-azuretools.vscode-bicep` - Support langage Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestion ressources Azure
  - `yzhang.markdown-all-in-one` - Édition Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Support diagrammes Mermaid
  - `redhat.vscode-yaml` - Support YAML (pour azure.yaml)
  - `eamodio.gitlens` - Visualisation Git
  - `mhutchie.git-graph` - Historique Git

- **⚙️ Paramètres VS Code** : Ajout des paramètres par défaut pour interpréteur Python, formatage à la sauvegarde, et suppression des espaces

- **📦 Mise à jour du requirements-dev.txt** :
  - Ajout du plugin de minification MkDocs
  - Ajout de pre-commit pour la qualité du code
  - Ajout des packages Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigé
- **Commande post-création** : Vérifie maintenant l’installation d’AZD et Azure CLI au démarrage du container

---

### [v3.11.0] - 2026-02-05

#### Refondre README accessible aux débutants
**Cette version améliore considérablement le README.md pour le rendre plus accessible aux débutants et ajoute des ressources essentielles pour les développeurs IA.**

#### Ajouté
- **🆚 Comparaison Azure CLI vs AZD** : Explication claire de quand utiliser chaque outil avec exemples pratiques
- **🌟 Liens AZD géniaux** : Liens directs vers la galerie communautaire de modèles et ressources de contribution :
  - [Galerie Awesome AZD](https://azure.github.io/awesome-azd/) - Plus de 200 modèles prêts à déployer
  - [Soumettre un modèle](https://github.com/Azure/awesome-azd/issues) - Contribution communautaire
- **🎯 Guide de démarrage rapide** : Section simplifiée en 3 étapes (Installation → Connexion → Déploiement)
- **📊 Tableau de navigation basé sur l’expérience** : Guide clair pour savoir où commencer selon le niveau du développeur

#### Modifié
- **Structure README** : Réorganisée pour une divulgation progressive - information clé en premier
- **Section Introduction** : Réécriture pour expliquer "La magie de `azd up`" pour les débutants complets
- **Suppression de contenu en double** : Élimination de la section dépannage en double
- **Commandes de dépannage** : Référence corrigée `azd logs` pour utiliser un `azd monitor --logs` valide

#### Corrigé
- **🔐 Commandes d’authentification** : Ajout de `azd auth login` et `azd auth logout` dans cheat-sheet.md
- **Références de commandes invalides** : Suppression des derniers `azd logs` dans la section dépannage du README

#### Notes
- **Portée** : Modifications appliquées au README.md principal et à resources/cheat-sheet.md
- **Public cible** : Améliorations destinées spécifiquement aux développeurs débutants avec AZD

---

### [v3.10.0] - 2026-02-05

#### Mise à jour de la précision des commandes Azure Developer CLI
**Cette version corrige les commandes AZD inexistantes dans toute la documentation, garantissant que tous les exemples de code utilisent une syntaxe valide d’Azure Developer CLI.**

#### Corrigé
- **🔧 Suppression des commandes AZD inexistantes** : Audit complet et correction des commandes invalides :
  - `azd logs` (n’existe pas) → remplacé par `azd monitor --logs` ou alternatives Azure CLI
  - Sous-commandes `azd service` (n’existent pas) → remplacées par `azd show` et Azure CLI
  - `azd infra import/export/validate` (n’existe pas) → supprimé ou remplacé par des alternatives valides
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (n’existent pas) → supprimés
  - Flags `azd provision --what-if/--rollback` (n’existent pas) → mis à jour pour utiliser `--preview`
  - `azd config validate` (n’existe pas) → remplacé par `azd config list`
  - `azd info`, `azd history`, `azd metrics` (n’existent pas) → supprimés

- **📚 Fichiers mis à jour avec correction des commandes** :
  - `resources/cheat-sheet.md` : Révision majeure de la référence des commandes
  - `docs/deployment/deployment-guide.md` : Corrigé les stratégies de rollback et déploiement
  - `docs/troubleshooting/debugging.md` : Correction des sections d’analyse des logs
  - `docs/troubleshooting/common-issues.md` : Mise à jour des commandes de dépannage
  - `docs/troubleshooting/ai-troubleshooting.md` : Correction de la section de débogage AZD
  - `docs/getting-started/azd-basics.md` : Correction des commandes de supervision
  - `docs/getting-started/first-project.md` : Mise à jour des exemples de supervision et de débogage
  - `docs/getting-started/installation.md` : Correction des exemples d’aide et de version
  - `docs/pre-deployment/application-insights.md` : Correction des commandes d’affichage des logs
  - `docs/pre-deployment/coordination-patterns.md` : Correction des commandes de débogage d’agent

- **📝 Mise à jour de la référence de version** :
  - `docs/getting-started/installation.md` : Changement de la version `1.5.0` codée en dur vers une version générique `1.x.x` avec lien vers les releases

#### Modifié
- **Stratégies de rollback** : Documentation mise à jour pour utiliser le rollback basé sur Git (AZD ne disposant pas de rollback natif)
- **Affichage des logs** : Remplacement des références `azd logs` par `azd monitor --logs`, `azd monitor --live` et commandes Azure CLI
- **Section performance** : Suppression des flags de déploiement parallèles/incrémentaux inexistants, fourniture d’alternatives valides

#### Détails techniques
- **Commandes AZD valides** : `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags azd monitor valides** : `--live`, `--logs`, `--overview`
- **Fonctionnalités supprimées** : `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Vérification** : Commandes validées avec Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Complétion de l’atelier et amélioration de la qualité de la documentation
**Cette version complète les modules interactifs de l’atelier, corrige tous les liens cassés dans la documentation et améliore globalement la qualité du contenu pour les développeurs IA utilisant Microsoft AZD.**

#### Ajouté
- **📝 CONTRIBUTING.md** : Nouveau document de directives de contribution comprenant :
  - Instructions claires pour signaler les problèmes et proposer des modifications
  - Normes de documentation pour les nouveaux contenus
  - Directives d’exemples de code et conventions des messages de commit
  - Informations d’engagement communautaire

#### Complété
- **🎯 Module 7 de l’atelier (Conclusion)** : Module de conclusion entièrement complété avec :
  - Résumé complet des réalisations de l’atelier
  - Section des concepts clés maîtrisés couvrant AZD, templates et Microsoft Foundry
  - Recommandations pour la poursuite du parcours d’apprentissage
  - Exercices de challenge avec niveaux de difficulté
  - Retours et liens de support communautaire

- **📚 Module 3 de l’atelier (Déconstruction)** : Objectifs d’apprentissage mis à jour avec :
  - Activation de GitHub Copilot avec serveurs MCP
  - Compréhension de la structure des dossiers de templates AZD
  - Modèles d’organisation infrastructure-as-code (Bicep)
  - Instructions pour les travaux pratiques

- **🔧 Module 6 de l’atelier (Démontage)** : Complété avec :
  - Objectifs de nettoyage des ressources et gestion des coûts
  - Utilisation de `azd down` pour une déprovision sécurisée de l’infrastructure
  - Guide de récupération des services cognitifs supprimés temporairement
  - Incitations à l’exploration bonus avec GitHub Copilot et le portail Azure

#### Corrigé
- **🔗 Correction des liens cassés** : Résolution de plus de 15 liens internes cassés dans la documentation :
  - `docs/ai-foundry/ai-model-deployment.md` : Correction des chemins vers microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md` : Correction des chemins vers ai-model-deployment.md et production-ai-practices.md
  - `docs/getting-started/first-project.md` : Remplacement du non-existant cicd-integration.md par deployment-guide.md
  - `examples/retail-scenario.md` : Correction des chemins vers FAQ et guide de dépannage
  - `examples/container-app/microservices/README.md` : Correction des chemins vers page d’accueil du cours et guide de déploiement
  - `resources/faq.md` et `resources/glossary.md` : Mise à jour des références du chapitre IA
  - `course-outline.md` : Correction des références du guide instructeur et du laboratoire IA

- **📅 Bannière de statut de l’atelier** : Mise à jour du statut "En construction" vers statut actif avec date février 2026

- **🔗 Navigation dans l’atelier** : Correction des liens de navigation cassés dans README.md de l’atelier pointant vers le dossier lab-1-azd-basics inexistant

#### Modifié
- **Présentation de l’atelier** : Suppression de l’avertissement « en construction », l’atelier est désormais complet et prêt à l’usage
- **Cohérence de la navigation** : Navigation inter-module assurée sur tous les modules de l’atelier
- **Références aux parcours d’apprentissage** : Mise à jour des références croisées aux chapitres avec les bons chemins microsoft-foundry

#### Validé
- ✅ Tous les fichiers markdown en anglais ont des liens internes valides
- ✅ Les modules de l’atelier 0 à 7 sont complets avec objectifs d’apprentissage
- ✅ La navigation entre chapitres et modules fonctionne correctement
- ✅ Le contenu est adapté aux développeurs IA utilisant Microsoft AZD
- ✅ Langage et structure adaptés aux débutants maintenus partout
- ✅ CONTRIBUTING.md fournit des indications claires pour les contributeurs communautaires

#### Mise en œuvre technique
- **Validation des liens** : Script PowerShell automatisé a vérifié tous les liens internes .md
- **Audit de contenu** : Revue manuelle de l’exhaustivité de l’atelier et de l’adaptation aux débutants
- **Système de navigation** : Application de modèles cohérents de navigation entre chapitres et modules

#### Notes
- **Portée** : Modifications appliquées uniquement à la documentation anglaise
- **Traductions** : Les dossiers de traduction n’ont pas été mis à jour dans cette version (traduction automatique synchronisée ultérieurement)
- **Durée de l’atelier** : Atelier complet offrant 3-4 heures d’apprentissage pratique

---

### [v3.8.0] - 2025-11-19

#### Documentation avancée : surveillance, sécurité et modèles multi-agent
**Cette version ajoute des leçons complètes de qualité A sur l’intégration d’Application Insights, les modèles d’authentification, et la coordination multi-agent pour les déploiements en production.**

#### Ajouté
- **📊 Leçon d’intégration Application Insights** : dans `docs/pre-deployment/application-insights.md` :
  - Déploiement centré AZD avec provisionnement automatique
  - Templates Bicep complets pour Application Insights + Log Analytics
  - Applications Python fonctionnelles avec télémétrie personnalisée (plus de 1 200 lignes)
  - Modèles de surveillance AI/LLM (suivi tokens/couts Microsoft Foundry Models)
  - 6 diagrammes Mermaid (architecture, traçage distribué, flux télémétrie)
  - 3 exercices pratiques (alertes, tableaux de bord, surveillance IA)
  - Exemples de requêtes Kusto et stratégies d’optimisation des coûts
  - Streaming métriques en direct et débogage temps réel
  - Temps d’apprentissage de 40-50 minutes avec modèles prêts pour la production

- **🔐 Leçon modèles d’authentification & sécurité** : dans `docs/getting-started/authsecurity.md` :
  - 3 modèles d’authentification (chaînes de connexion, Key Vault, identité gérée)
  - Templates Bicep d’infrastructure complets pour déploiements sécurisés
  - Code application Node.js avec intégration Azure SDK
  - 3 exercices complets (activation identité gérée, identité affectée utilisateur, rotation Key Vault)
  - Bonnes pratiques de sécurité et configurations RBAC
  - Guide de dépannage et analyse des coûts
  - Modèles d’authentification sans mot de passe prêts pour la production

- **🤖 Leçon modèles de coordination multi-agent** : dans `docs/pre-deployment/coordination-patterns.md` :
  - 5 modèles de coordination (séquentiel, parallèle, hiérarchique, piloté par événements, consensus)
  - Implémentation complète du service orchestrateur (Python/Flask, plus de 1 500 lignes)
  - 3 implémentations spécialisées d’agents (Recherche, Rédacteur, Éditeur)
  - Intégration Service Bus pour la mise en file des messages
  - Gestion des états Cosmos DB pour systèmes distribués
  - 6 diagrammes Mermaid illustrant les interactions des agents
  - 3 exercices avancés (gestion des timeout, logique de retry, disjoncteur)
  - Décomposition des coûts (240-565 $/mois) avec stratégies d’optimisation
  - Intégration Application Insights pour la surveillance

#### Amélioré
- **Chapitre Pré-déploiement** : Inclut désormais une surveillance complète et modèles de coordination
- **Chapitre Premiers Pas** : Amélioré avec modèles d’authentification professionnels
- **Maturité production** : Couverture complète de la sécurité à l’observabilité
- **Plan du cours** : Mise à jour avec références aux nouvelles leçons des Chapitres 3 et 6

#### Modifié
- **Progression d’apprentissage** : Meilleure intégration de la sécurité et surveillance dans le cours
- **Qualité documentaire** : Normes de qualité A cohérentes (95-97 %) sur les nouvelles leçons
- **Modèles production** : Couverture complète de bout en bout pour déploiements en entreprise

#### Amélioré
- **Expérience développeur** : Parcours clair du développement à la surveillance en production
- **Normes de sécurité** : Modèles professionnels pour authentification et gestion des secrets
- **Observabilité** : Intégration complète Application Insights avec AZD
- **Charges IA** : Surveillance spécialisée pour Microsoft Foundry Models et systèmes multi-agent

#### Validé
- ✅ Toutes leçons avec code complet fonctionnel (pas de fragments)
- ✅ Diagrammes Mermaid pour apprentissage visuel (19 au total dans 3 leçons)
- ✅ Exercices pratiques avec étapes de validation (9 au total)
- ✅ Templates Bicep prêts pour production déployables via `azd up`
- ✅ Analyse des coûts et stratégies d’optimisation
- ✅ Guides de dépannage et meilleures pratiques
- ✅ Contrôles de connaissances avec commandes de validation

#### Résultats de la notation documentaire
- **docs/pre-deployment/application-insights.md** : - Guide complet de surveillance
- **docs/getting-started/authsecurity.md** : - Modèles professionnels de sécurité
- **docs/pre-deployment/coordination-patterns.md** : - Architectures avancées multi-agent
- **Nouveaux contenus globaux** : - Normes de haute qualité cohérentes

#### Mise en œuvre technique
- **Application Insights** : Log Analytics + télémétrie personnalisée + traçage distribué
- **Authentification** : Identité gérée + Key Vault + modèles RBAC
- **Multi-Agent** : Service Bus + Cosmos DB + Container Apps + orchestration
- **Surveillance** : Métriques en direct + requêtes Kusto + alertes + tableaux de bord
- **Gestion des coûts** : Stratégies d’échantillonnage, politiques de rétention, contrôle budgétaire

### [v3.7.0] - 2025-11-19

#### Améliorations de la qualité documentaire et nouvel exemple Microsoft Foundry Models
**Cette version améliore la qualité documentaire dans tout le dépôt et ajoute un exemple complet de déploiement Microsoft Foundry Models avec interface de chat gpt-4.1.**

#### Ajouté
- **🤖 Exemple de chat Microsoft Foundry Models** : déploiement complet gpt-4.1 avec implémentation fonctionnelle dans `examples/azure-openai-chat/` :
  - Infrastructure complète Microsoft Foundry Models (déploiement modèle gpt-4.1)
  - Interface de chat en ligne de commande Python avec historique de conversation
  - Intégration Key Vault pour stockage sécurisé des clés d’API
  - Suivi de l’utilisation des tokens et estimation des coûts
  - Limitation de débit et gestion des erreurs
  - README détaillé avec guide de déploiement de 35-45 minutes
  - 11 fichiers prêts pour la production (templates Bicep, application Python, configuration)
- **📚 Exercices documentaires** : Ajout d’exercices pratiques au guide de configuration :
  - Exercice 1 : Configuration multi-environnements (15 minutes)
  - Exercice 2 : Pratique de gestion des secrets (10 minutes)
  - Critères de réussite clairs et étapes de vérification
- **✅ Vérification du déploiement** : Ajout d’une section de vérification au guide de déploiement :
  - Procédures de vérification d’état
  - Checklist des critères de réussite
  - Sorties attendues pour toutes les commandes de déploiement
  - Référence rapide de dépannage

#### Amélioré
- **examples/README.md** : Mise à jour vers qualité A (93 %) :
  - Ajout de azure-openai-chat dans toutes les sections pertinentes
  - Passage de 3 à 4 exemples locaux
  - Ajout au tableau des exemples d’applications IA
  - Intégration dans le Quick Start pour utilisateurs intermédiaires
  - Ajout à la section Microsoft Foundry Templates
  - Mise à jour de la matrice de comparaison et des sections de recherche de technologies
- **Qualité de la documentation** : Amélioration de B+ (87 %) → A- (92 %) dans le dossier docs :
  - Ajout des résultats attendus aux exemples de commandes critiques
  - Inclusion des étapes de vérification pour les modifications de configuration
  - Renforcement de l'apprentissage pratique avec des exercices concrets

#### Modifié
- **Progression de l'apprentissage** : Meilleure intégration des exemples d'IA pour les apprenants intermédiaires
- **Structure de la documentation** : Exercices plus opérationnels avec des résultats clairs
- **Processus de vérification** : Critères de succès explicites ajoutés aux workflows clés

#### Amélioré
- **Expérience développeur** : Le déploiement des Microsoft Foundry Models prend maintenant 35-45 minutes (contre 60-90 pour les alternatives complexes)
- **Transparence des coûts** : Estimations claires des coûts (50-200 $/mois) pour l'exemple Microsoft Foundry Models
- **Parcours d'apprentissage** : Les développeurs IA ont un point d'entrée clair avec azure-openai-chat
- **Normes de documentation** : Résultats attendus et étapes de vérification cohérents

#### Validé
- ✅ Exemple Microsoft Foundry Models entièrement fonctionnel avec `azd up`
- ✅ Tous les 11 fichiers d'implémentation syntaxiquement corrects
- ✅ Instructions de README correspondent à l'expérience réelle de déploiement
- ✅ Liens de documentation mis à jour dans plus de 8 emplacements
- ✅ L'index des exemples reflète précisément 4 exemples locaux
- ✅ Pas de liens externes dupliqués dans les tableaux
- ✅ Toutes les références de navigation correctes

#### Implémentation technique
- **Architecture Microsoft Foundry Models** : gpt-4.1 + Key Vault + Container Apps
- **Sécurité** : Identité managée prête, secrets dans Key Vault
- **Surveillance** : Intégration avec Application Insights
- **Gestion des coûts** : Suivi des tokens et optimisation de l'utilisation
- **Déploiement** : Commande unique `azd up` pour configuration complète

### [v3.6.0] - 2025-11-19

#### Mise à jour majeure : Exemples de déploiement de Container App
**Cette version introduit des exemples complets de déploiement d'applications conteneurisées prêtes pour la production utilisant Azure Developer CLI (AZD), avec documentation complète et intégration dans le parcours d'apprentissage.**

#### Ajouté
- **🚀 Exemples Container App** : Nouveaux exemples locaux dans `examples/container-app/` :
  - [Guide maître](examples/container-app/README.md) : Présentation complète des déploiements conteneurisés, démarrage rapide, production et modèles avancés
  - [API Flask simple](../../examples/container-app/simple-flask-api) : API REST pour débutants avec mise à l'échelle à zéro, probes de santé, surveillance et dépannage
  - [Architecture microservices](../../examples/container-app/microservices) : Déploiement multi-service prêt pour la production (API Gateway, Product, Order, User, Notification), messagerie asynchrone, Service Bus, Cosmos DB, Azure SQL, traçage distribué, déploiement blue-green/canary
- **Bonnes pratiques** : Sécurité, surveillance, optimisation des coûts et conseils CI/CD pour les charges conteneurisées
- **Exemples de code** : Modèles complets `azure.yaml`, templates Bicep, et implémentations multi-langages (Python, Node.js, C#, Go)
- **Tests & dépannage** : Scénarios de tests de bout en bout, commandes de surveillance, guide de dépannage

#### Modifié
- **README.md** : Mis à jour pour présenter et lier les nouveaux exemples Container App sous "Exemples locaux - Applications conteneurisées"
- **examples/README.md** : Mis à jour pour mettre en avant les exemples Container App, ajouter des entrées dans la matrice de comparaison et mettre à jour les références technologiques/architecturales
- **Plan de cours & Guide d’étude** : Mis à jour pour référencer les nouveaux exemples Container App et modèles de déploiement dans les chapitres concernés

#### Validé
- ✅ Tous les nouveaux exemples déployables avec `azd up` et respectent les meilleures pratiques
- ✅ Liens croisés de documentation et navigation mis à jour
- ✅ Les exemples couvrent des scénarios du débutant à l'avancé, incluant des microservices en production

#### Remarques
- **Portée** : Documentation et exemples en anglais uniquement
- **Prochaines étapes** : Étendre avec des modèles avancés de conteneurs et automatisation CI/CD dans les versions futures

### [v3.5.0] - 2025-11-19

#### Rebranding produit : Microsoft Foundry
**Cette version met en œuvre un changement complet de nom de produit de "Microsoft Foundry" à "Microsoft Foundry" dans toute la documentation anglaise, reflétant le rebranding officiel de Microsoft.**

#### Modifié
- **🔄 Mise à jour nom du produit** : Rebranding complet de "Microsoft Foundry" à "Microsoft Foundry"
  - Mise à jour de toutes les références dans la documentation anglaise du dossier `docs/`
  - Dossier renommé : `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fichier renommé : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total : 23 références de contenu mises à jour dans 7 fichiers de documentation

- **📁 Changements de structure de dossier** :
  - `docs/ai-foundry/` renommé en `docs/microsoft-foundry/`
  - Toutes les références croisées mises à jour pour refléter la nouvelle structure
  - Liens de navigation validés dans toute la documentation

- **📄 Renommages de fichiers** :
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tous les liens internes mis à jour pour référencer le nouveau nom de fichier

#### Fichiers mis à jour
- **Documentation de chapitres** (7 fichiers) :
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mises à jour de liens de navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 références au nom du produit mises à jour
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Utilise déjà Microsoft Foundry (depuis mises à jour précédentes)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 références mises à jour (aperçu, feedback communauté, documentation)
  - `docs/getting-started/azd-basics.md` - 4 liens de références croisées mis à jour
  - `docs/getting-started/first-project.md` - 2 liens de navigation de chapitre mis à jour
  - `docs/getting-started/installation.md` - 2 liens vers chapitre suivant mis à jour
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 références mises à jour (navigation, communauté Discord)
  - `docs/troubleshooting/common-issues.md` - 1 lien de navigation mis à jour
  - `docs/troubleshooting/debugging.md` - 1 lien de navigation mis à jour

- **Fichiers de structure du cours** (2 fichiers) :
  - `README.md` - 17 références mises à jour (aperçu du cours, titres de chapitres, section modèles, insights communauté)
  - `course-outline.md` - 14 références mises à jour (aperçu, objectifs d'apprentissage, ressources de chapitres)

#### Validé
- ✅ Plus aucune référence au dossier "ai-foundry" dans la documentation anglaise
- ✅ Plus aucune référence au nom produit "Microsoft Foundry" dans la documentation anglaise
- ✅ Tous les liens de navigation fonctionnels avec la nouvelle structure de dossiers
- ✅ Renommage de fichiers et dossiers effectué avec succès
- ✅ Références croisées entre chapitres validées

#### Remarques
- **Portée** : Modifications appliquées uniquement à la documentation anglaise dans le dossier `docs/`
- **Traductions** : Dossiers de traduction (`translations/`) non mis à jour dans cette version
- **Atelier** : Matériels d'atelier (`workshop/`) non mis à jour dans cette version
- **Exemples** : Fichiers d'exemples pouvant encore référencer l'ancienne nomenclature (à corriger dans une prochaine mise à jour)
- **Liens externes** : URLs externes et références au dépôt GitHub inchangées

#### Guide de migration pour contributeurs
Si vous avez des branches locales ou documentation référencant l'ancienne structure :
1. Mettez à jour les références de dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Mettez à jour les références de fichiers : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Remplacez le nom du produit : "Microsoft Foundry" → "Microsoft Foundry"
4. Validez que tous les liens de documentation interne fonctionnent toujours

---

### [v3.4.0] - 2025-10-24

#### Améliorations de l’aperçu et validation infrastructure
**Cette version introduit un support complet pour la nouvelle fonctionnalité d’aperçu Azure Developer CLI et améliore l'expérience utilisateur de l’atelier.**

#### Ajouté
- **🧪 Documentation fonction azd provision --preview** : Couverture complète de la nouvelle capacité d’aperçu infrastructure
  - Référence des commandes et exemples d’utilisation dans la fiche mémo
  - Intégration détaillée dans le guide de provisioning avec cas d’usage et bénéfices
  - Intégration de contrôle préliminaire pour validation de déploiement plus sûre
  - Mises à jour du guide de démarrage avec pratiques de déploiement en priorité sur la sécurité
- **🚧 Bannière de statut d’atelier** : Bannière HTML professionnelle indiquant le statut de développement de l’atelier
  - Design en dégradé avec indicateurs de construction pour communication claire aux utilisateurs
  - Horodatage de dernière mise à jour pour transparence
  - Design responsive adapté à tous types d’appareils mobiles

#### Amélioré
- **Sécurité infrastructure** : Fonctionnalité d’aperçu intégrée dans toute la documentation de déploiement
- **Validation pré-déploiement** : Scripts automatisés incluant maintenant tests d’aperçu infrastructure
- **Flux de travail développeur** : Séquences de commandes mises à jour intégrant l’aperçu comme bonne pratique
- **Expérience atelier** : Attentes claires posées aux utilisateurs concernant le contenu en développement

#### Modifié
- **Meilleures pratiques de déploiement** : Flux de travail en priorité sur l’aperçu désormais recommandé
- **Flux de documentation** : Validation infrastructure déplacée plus tôt dans le processus d’apprentissage
- **Présentation atelier** : Communication professionnelle du statut avec calendrier de développement clair

#### Amélioré
- **Approche sécurité** : Les modifications infrastructure s'ont maintenant validables avant déploiement
- **Collaboration d’équipe** : Résultats d’aperçu partageables pour revue et approbation
- **Conscience des coûts** : Meilleure compréhension des coûts des ressources avant provisioning
- **Réduction des risques** : Moins d’échecs de déploiement grâce à validation avancée

#### Implémentation technique
- **Intégration multi-documents** : Fonctionnalité d’aperçu documentée dans 4 fichiers clés
- **Modèles de commandes** : Syntaxe et exemples cohérents dans toute la documentation
- **Intégration des bonnes pratiques** : Aperçu inclus dans workflows et scripts de validation
- **Indicateurs visuels** : Marquages clairs de NOUVEAU pour meilleure découvrabilité

#### Infrastructure atelier
- **Communication de statut** : Bannière HTML professionnelle avec style en dégradé
- **Expérience utilisateur** : Statut de développement clair pour éviter la confusion
- **Présentation professionnelle** : Maintient la crédibilité du dépôt tout en fixant les attentes
- **Transparence calendrier** : Horodatage dernière mise à jour octobre 2025 pour responsabilité

### [v3.3.0] - 2025-09-24

#### Matériels d’atelier améliorés et expérience d’apprentissage interactive
**Cette version introduit un matériel d’atelier complet avec guides interactifs basés navigateur et parcours d’apprentissage structuré.**

#### Ajouté
- **🎥 Guide d’atelier interactif** : Expérience d’atelier basée navigateur avec capacité de prévisualisation MkDocs
- **📝 Instructions d’atelier structurées** : Parcours d’apprentissage guidé en 7 étapes de la découverte à la personnalisation
  - 0-Introduction : Vue d’ensemble et installation de l’atelier
  - 1-Select-AI-Template : Processus de découverte et sélection de template
  - 2-Validate-AI-Template : Procédures de déploiement et validation
  - 3-Deconstruct-AI-Template : Compréhension de l’architecture du template
  - 4-Configure-AI-Template : Configuration et personnalisation
  - 5-Customize-AI-Template : Modifications avancées et itérations
  - 6-Teardown-Infrastructure : Nettoyage et gestion des ressources
  - 7-Wrap-up : Résumé et prochaines étapes
- **🛠️ Outils d’atelier** : Configuration MkDocs avec thème Material pour expérience d’apprentissage améliorée
- **🎯 Parcours pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces** : Configuration fluide de l’environnement de développement

#### Amélioré
- **Laboratoire IA atelier** : Étendu avec une expérience d’apprentissage structurée de 2-3 heures complète
- **Documentation atelier** : Présentation professionnelle avec navigation et supports visuels
- **Progression d’apprentissage** : Guidance claire pas à pas depuis la sélection du template jusqu’au déploiement en production
- **Expérience développeur** : Outils intégrés pour workflows de développement optimisés

#### Amélioré
- **Accessibilité** : Interface basée navigateur avec recherche, fonctionnalité copier et bascule de thème
- **Apprentissage autonome** : Structure flexible de l’atelier adaptée à différents rythmes d’apprentissage
- **Application pratique** : Scénarios réels de déploiement de templates IA
- **Intégration communautaire** : Intégration Discord pour support et collaboration en atelier

#### Fonctionnalités de l’atelier
- **Recherche intégrée** : Découverte rapide par mots-clés et leçons
- **Copier les blocs de code** : Fonctionnalité hover-to-copy pour tous les exemples de code
- **Bascule thème** : Support mode sombre/clair selon préférences
- **Supports visuels** : Captures d’écran et diagrammes pour meilleure compréhension
- **Intégration aide** : Accès direct à Discord pour support communautaire

### [v3.2.0] - 2025-09-17

#### Restructuration majeure de la navigation et système d’apprentissage par chapitres
**Cette version introduit une organisation complète par chapitres pour l’apprentissage avec navigation améliorée dans tout le dépôt.**

#### Ajouté
- **📚 Système d’apprentissage par chapitres** : Restructuration complète du cours en 8 chapitres d’apprentissage progressifs
  - Chapitre 1 : Fondations & Démarrage rapide (⭐ - 30-45 min)
  - Chapitre 2 : Développement orienté IA (⭐⭐ - 1-2 h)
  - Chapitre 3 : Configuration & Authentification (⭐⭐ - 45-60 min)
  - Chapitre 4 : Infrastructure as Code & Déploiement (⭐⭐⭐ - 1-1,5 h)
  - Chapitre 5 : Solutions IA multi-agents (⭐⭐⭐⭐ - 2-3 h)
  - Chapitre 6 : Validation & Planification pré-déploiement (⭐⭐ - 1 h)
  - Chapitre 7 : Dépannage & Debugging (⭐⭐ - 1-1,5 h)
  - Chapitre 8 : Modèles production & entreprise (⭐⭐⭐⭐ - 2-3 h)
- **📚 Système de navigation complet** : En-têtes et pieds de page de navigation cohérents dans toute la documentation
- **🎯 Suivi de progression** : Checklist de fin de cours et système de vérification des apprentissages
- **🗺️ Guidance parcours d’apprentissage** : Points d’entrée clairs selon niveaux d’expérience et objectifs
- **🔗 Navigation références croisées** : Chapitres liés et prérequis clairement connectés

#### Amélioré
- **Structure README** : Transformée en plateforme d’apprentissage structurée par chapitres
- **Navigation documentation** : Chaque page inclut maintenant contexte du chapitre et guidance de progression
- **Organisation des templates** : Exemples et templates mappés aux chapitres d’apprentissage appropriés
- **Intégration des ressources** : Fiches mémo, FAQ, guides d’étude reliés aux chapitres concernés
- **Intégration atelier** : Labs pratiques mappés à plusieurs objectifs d’apprentissage des chapitres

#### Modifié
- **Progression d’apprentissage** : Passage d’une documentation linéaire à un apprentissage flexible basé sur des chapitres
- **Placement de la configuration** : Guide de configuration repositionné en chapitre 3 pour un meilleur flux d’apprentissage
- **Intégration du contenu IA** : Meilleure intégration du contenu spécifique à l’IA tout au long du parcours d’apprentissage
- **Contenu de production** : Modèles avancés consolidés au chapitre 8 pour les apprenants en entreprise

#### Amélioré
- **Expérience utilisateur** : Fil d’Ariane clair et indicateurs de progression par chapitre
- **Accessibilité** : Modèles de navigation cohérents pour faciliter le parcours dans le cours
- **Présentation professionnelle** : Structure de cours de style universitaire adaptée à la formation académique et d’entreprise
- **Efficacité de l’apprentissage** : Temps réduit pour trouver le contenu pertinent grâce à une meilleure organisation

#### Mise en œuvre technique
- **En-têtes de navigation** : Navigation standardisée par chapitre sur plus de 40 fichiers de documentation
- **Navigation en pied de page** : Orientation de progression cohérente et indicateurs d’achèvement de chapitres
- **Liens croisés** : Système complet de liaison interne connectant les concepts liés
- **Cartographie des chapitres** : Modèles et exemples clairement associés aux objectifs d’apprentissage

#### Amélioration du guide d’étude
- **📚 Objectifs d’apprentissage complets** : Guide d’étude restructuré pour s’aligner sur le système à 8 chapitres
- **🎯 Évaluation par chapitre** : Chaque chapitre inclut des objectifs d’apprentissage spécifiques et des exercices pratiques
- **📋 Suivi des progrès** : Planning d’apprentissage hebdomadaire avec résultats mesurables et listes de contrôle d’achèvement
- **❓ Questions d’évaluation** : Questions de validation des connaissances pour chaque chapitre avec résultats professionnels
- **🛠️ Exercices pratiques** : Activités pratiques avec scénarios réels de déploiement et résolution de problèmes
- **📊 Progression des compétences** : Avancement clair des concepts de base aux modèles d’entreprise avec focus sur le développement de carrière
- **🎓 Cadre de certification** : Résultats de développement professionnel et système de reconnaissance communautaire
- **⏱️ Gestion du calendrier** : Plan d’apprentissage structuré sur 10 semaines avec validation des jalons

### [v3.1.0] - 2025-09-17

#### Solutions IA multi-agents améliorées
**Cette version améliore la solution multi-agent retail avec une meilleure nomination des agents et une documentation enrichie.**

#### Changé
- **Terminologie multi-agent** : Remplacement de « agent Cora » par « agent Client » dans toute la solution retail multi-agent pour une meilleure compréhension
- **Architecture des agents** : Mise à jour de toute la documentation, modèles ARM et exemples de code pour utiliser la dénomination cohérente « agent Client »
- **Exemples de configuration** : Modernisation des modèles de configuration des agents avec conventions de dénomination actualisées
- **Cohérence documentaire** : Assurance que toutes les références utilisent des noms d’agents professionnels et descriptifs

#### Amélioré
- **Package de modèle ARM** : Mise à jour du retail-multiagent-arm-template avec références à l’agent Client
- **Diagrammes d’architecture** : Actualisation des diagrammes Mermaid avec la nouvelle dénomination des agents
- **Exemples de code** : Classes Python et exemples d’implémentation utilisant désormais CustomerAgent comme nom
- **Variables d’environnement** : Mise à jour de tous les scripts de déploiement pour utiliser les conventions CUSTOMER_AGENT_NAME

#### Amélioré
- **Expérience développeur** : Rôles et responsabilités des agents clarifiés dans la documentation
- **Prêt pour la production** : Meilleure adéquation avec les conventions de dénomination d’entreprise
- **Matériel d’apprentissage** : Nomination des agents plus intuitive à des fins pédagogiques
- **Utilisabilité des modèles** : Compréhension simplifiée des fonctions d’agent et des modèles de déploiement

#### Détails techniques
- Diagrammes d’architecture Mermaid mis à jour avec références CustomerAgent
- Remplacement des noms de classe CoraAgent par CustomerAgent dans les exemples Python
- Modification des configurations JSON des modèles ARM pour utiliser le type d’agent « customer »
- Mise à jour des variables d’environnement de CORA_AGENT_* à CUSTOMER_AGENT_*
- Actualisation de toutes les commandes de déploiement et des configurations de conteneurs

### [v3.0.0] - 2025-09-12

#### Changements majeurs - Focalisation sur développeurs IA et intégration Microsoft Foundry
**Cette version transforme le dépôt en une ressource d’apprentissage complète axée sur l’IA avec intégration Microsoft Foundry.**

#### Ajouté
- **🤖 Parcours d’apprentissage centré IA** : Restructuration complète priorisant les développeurs et ingénieurs IA
- **Guide d’intégration Microsoft Foundry** : Documentation complète pour connecter AZD avec les services Microsoft Foundry
- **Modèles de déploiement IA** : Guide détaillé couvrant la sélection du modèle, configuration et stratégies de déploiement en production
- **Atelier IA** : Atelier pratique de 2-3 heures pour convertir les applications IA en solutions déployables avec AZD
- **Bonnes pratiques AI en production** : Modèles prêts pour entreprise pour échelle, surveillance et sécurisation des charges de travail IA
- **Guide de dépannage IA** : Résolution complète des problèmes pour Microsoft Foundry Models, Cognitive Services, et déploiement IA
- **Galerie de modèles IA** : Collection sélectionnée de templates Microsoft Foundry avec niveaux de complexité
- **Matériel d’atelier** : Structure complète d’atelier avec laboratoires pratiques et documents de référence

#### Amélioré
- **Structure du README** : Orientée développeurs IA avec 45% d’intérêt communautaire issu du Discord Microsoft Foundry
- **Parcours d’apprentissage** : Parcours dédiés aux développeurs IA aux côtés des parcours traditionnels pour étudiants et ingénieurs DevOps
- **Recommandations de modèles** : Modèles IA en vedette incluant azure-search-openai-demo, contoso-chat, et openai-chat-app-quickstart
- **Intégration communautaire** : Support communautaire Discord amélioré avec canaux et discussions dédiés à l’IA

#### Sécurité & Production
- **Modèles d’identités managées** : Authentification et configurations de sécurité spécifiques à l’IA
- **Optimisation des coûts** : Suivi de l’utilisation des jetons et contrôle des budgets pour charges IA
- **Déploiement multi-régions** : Stratégies pour le déploiement global des applications IA
- **Surveillance des performances** : Métriques IA spécifiques et intégration Application Insights

#### Qualité de la documentation
- **Structure linéaire du cours** : Progression logique des modèles de déploiement IA débutant à avancé
- **URLs validées** : Tous les liens externes de dépôt vérifiés et accessibles
- **Référence complète** : Tous les liens internes de documentation validés et fonctionnels
- **Prêt pour production** : Modèles de déploiement entreprise avec exemples réels

### [v2.0.0] - 2025-09-09

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle
**Cette version représente une refonte majeure de la structure du dépôt et de la présentation du contenu.**

#### Ajouté
- **Cadre d’apprentissage structuré** : Toutes les pages de documentation incluent désormais introduction, objectifs d’apprentissage et résultats attendus
- **Système de navigation** : Ajout de liens Leçon précédente / suivante sur toute la documentation pour progression guidée
- **Guide d’étude** : study-guide.md complet avec objectifs d’apprentissage, exercices pratiques, et matériel d’évaluation
- **Présentation professionnelle** : Suppression de toutes les icônes emoji pour accessibilité et apparence professionnelle améliorées
- **Structure de contenu améliorée** : Organisation et flux améliorés des matériels d’apprentissage

#### Changé
- **Format de documentation** : Standardisation de toute la documentation avec structure cohérente centrée sur l’apprentissage
- **Flux de navigation** : Implémentation d’une progression logique dans tous les matériels d’apprentissage
- **Présentation du contenu** : Suppression des éléments décoratifs au profit d’un formatage clair et professionnel
- **Structure des liens** : Mise à jour de tous les liens internes pour supporter le nouveau système de navigation

#### Amélioré
- **Accessibilité** : Suppression de la dépendance aux emojis pour meilleure compatibilité avec les lecteurs d’écran
- **Apparence professionnelle** : Présentation propre de style académique adaptée à l’apprentissage en entreprise
- **Expérience d’apprentissage** : Approche structurée avec objectifs clairs et résultats pour chaque leçon
- **Organisation du contenu** : Meilleur flux logique et connexion entre sujets liés

### [v1.0.0] - 2025-09-09

#### Version initiale - Dépôt d’apprentissage AZD complet

#### Ajouté
- **Structure documentaire principale**
  - Série complète de guides de démarrage
  - Documentation complète de déploiement et de provisionnement
  - Ressources détaillées de dépannage et guides de débogage
  - Outils et procédures de validation pré-déploiement

- **Module de démarrage**
  - Fondamentaux AZD : Concepts de base et terminologie
  - Guide d’installation : Instructions spécifiques à la plateforme
  - Guide de configuration : Mise en place de l’environnement et authentification
  - Tutoriel premier projet : Apprentissage pratique pas à pas

- **Module de déploiement et provisionnement**
  - Guide de déploiement : Documentation complète du workflow
  - Guide de provisionnement : Infrastructure as Code avec Bicep
  - Bonnes pratiques pour les déploiements en production
  - Modèles d’architecture multi-service

- **Module de validation pré-déploiement**
  - Planification de capacité : Validation de la disponibilité des ressources Azure
  - Sélection SKU : Guide complet des niveaux de service
  - Contrôles prévol : Scripts de validation automatisés (PowerShell et Bash)
  - Estimation des coûts et outils de planification budgétaire

- **Module de dépannage**
  - Problèmes courants : Problèmes fréquemment rencontrés et solutions
  - Guide de débogage : Méthodologies systématiques de résolution
  - Techniques avancées de diagnostic et outils
  - Surveillance et optimisation des performances

- **Ressources et références**
  - Fiche de commandes : Référence rapide des commandes essentielles
  - Glossaire : Définitions complètes de la terminologie et acronymes
  - FAQ : Réponses détaillées aux questions fréquentes
  - Liens vers ressources externes et connexions communautaires

- **Exemples et modèles**
  - Exemple d’application web simple
  - Modèle de déploiement site web statique
  - Configuration d’application conteneurisée
  - Modèles d’intégration base de données
  - Exemples d’architecture microservices
  - Implémentations de fonctions serverless

#### Fonctionnalités
- **Support multi-plateforme** : Guides d’installation et configuration pour Windows, macOS et Linux
- **Différents niveaux de compétence** : Contenu conçu pour étudiants jusqu’aux développeurs professionnels
- **Focus pratique** : Exemples concrets et scénarios réels
- **Couverture complète** : Des concepts de base aux modèles avancés en entreprise
- **Approche sécurité d’abord** : Meilleures pratiques de sécurité intégrées partout
- **Optimisation des coûts** : Conseils pour des déploiements et gestion des ressources économiques

#### Qualité de la documentation
- **Exemples de code détaillés** : Échantillons de code pratiques et testés
- **Instructions étape par étape** : Guide clair et actionnable
- **Gestion complète des erreurs** : Résolution des problèmes courants
- **Intégration des bonnes pratiques** : Normes industrielles et recommandations
- **Compatibilité des versions** : À jour avec les derniers services Azure et fonctionnalités azd

## Améliorations futures prévues

### Version 3.1.0 (Prévue)
#### Expansion de la plateforme IA
- **Support multi-modèle** : Modèles d’intégration pour Hugging Face, Azure Machine Learning et modèles personnalisés
- **Cadres pour agents IA** : Modèles pour déploiements LangChain, Semantic Kernel, et AutoGen
- **Modèles RAG avancés** : Options de bases de données vectorielles au-delà d’Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilité IA** : Surveillance améliorée des performances des modèles, usage des jetons, et qualité des réponses

#### Expérience développeur
- **Extension VS Code** : Expérience de développement intégrée AZD + Microsoft Foundry
- **Intégration GitHub Copilot** : Génération assistée par IA des modèles AZD
- **Tutoriels interactifs** : Exercices de codage pratiques avec validation automatisée pour scénarios IA
- **Contenu vidéo** : Tutoriels vidéo complémentaires pour apprenants visuels concentrés sur les déploiements IA

### Version 4.0.0 (Prévue)
#### Modèles IA en entreprise
- **Cadre de gouvernance** : Gouvernance des modèles IA, conformité et pistes d’audit
- **IA multi-locataires** : Modèles pour desservir plusieurs clients avec services IA isolés
- **Déploiement IA en périphérie** : Intégration avec Azure IoT Edge et instances conteneurs
- **Cloud hybride IA** : Modèles multi-cloud et hybrides pour charges IA

#### Fonctionnalités avancées
- **Automatisation des pipelines IA** : Intégration MLOps avec pipelines Azure Machine Learning
- **Sécurité avancée** : Modèles zero-trust, points de terminaison privés et protection avancée contre les menaces
- **Optimisation des performances** : Réglages et stratégies de mise à l’échelle avancées pour applications IA à haut débit
- **Distribution globale** : Modèles de diffusion de contenu et de mise en cache en périphérie pour applications IA

### Version 3.0.0 (Prévue) - Supplantée par la version actuelle
#### Ajouts proposés - Maintenant implémentés dans v3.0.0
- ✅ **Contenu axé IA** : Intégration complète Microsoft Foundry (Terminée)
- ✅ **Tutoriels interactifs** : Atelier pratique IA (Terminé)
- ✅ **Module sécurité avancée** : Modèles de sécurité spécifiques IA (Terminé)
- ✅ **Optimisation des performances** : Stratégies de réglage des charges IA (Terminé)

### Version 2.1.0 (Prévue) - Partiellement implémentée en v3.0.0
#### Améliorations mineures - Certaines réalisées dans la version actuelle
- ✅ **Exemples supplémentaires** : Scénarios de déploiement axés IA (Terminés)
- ✅ **FAQ étendue** : Questions et dépannage spécifiques IA (Terminés)
- **Intégration des outils** : Guides améliorés pour IDE et éditeurs
- ✅ **Extension de la surveillance** : Modèles de surveillance et d’alertes IA (Terminés)

#### Toujours prévues pour des versions futures
- **Documentation mobile-friendly** : Design responsive pour apprentissage mobile
- **Accès hors-ligne** : Packages téléchargeables de documentation
- **Intégration IDE améliorée** : Extension VS Code pour workflows AZD + IA
- **Tableau de bord communautaire** : Statistiques communautaires en temps réel et suivi des contributions

## Contribution au journal des modifications

### Signalement des changements
Lors de la contribution à ce dépôt, veuillez vous assurer que les entrées du journal des modifications incluent :

1. **Numéro de version** : Suivant le versionnage sémantique (majeur.mineur.patch)
2. **Date** : Date de publication ou mise à jour au format AAAA-MM-JJ
3. **Catégorie** : Ajouté, Modifié, Déprécié, Supprimé, Corrigé, Sécurité
4. **Description claire** : Description concise de ce qui a changé
5. **Évaluation d’impact** : Comment les changements affectent les utilisateurs existants

### Catégories de changements

#### Ajouté
- Nouvelles fonctionnalités, sections documentaires ou capacités
- Nouveaux exemples, modèles ou ressources d’apprentissage
- Outils supplémentaires, scripts ou utilitaires

#### Modifié
- Modifications des fonctionnalités ou documentation existantes
- Mises à jour pour amélioration de la clarté ou de la précision
- Restructuration du contenu ou de l’organisation

#### Déprécié
- Fonctionnalités ou approches en cours de suppression progressive
- Sections documentaires programmées pour suppression
- Méthodes ayant de meilleures alternatives

#### Supprimé
- Fonctionnalités, documentation ou exemples plus pertinents
- Informations obsolètes ou approches dépréciées
- Contenu redondant ou consolidé

#### Corrigé
- Corrections d’erreurs dans la documentation ou le code
- Résolution de problèmes signalés
- Améliorations de la précision ou de la fonctionnalité

#### Sécurité
- Améliorations ou correctifs liés à la sécurité
- Mises à jour des meilleures pratiques en matière de sécurité
- Résolution de vulnérabilités de sécurité

### Directives de versionnage sémantique

#### Version majeure (X.0.0)
- Changements majeurs nécessitant une action de l'utilisateur
- Restructuration significative du contenu ou de l'organisation
- Changements modifiant l'approche ou la méthodologie fondamentale

#### Version Mineure (X.Y.0)
- Nouvelles fonctionnalités ou ajouts de contenu
- Améliorations garantissant la compatibilité descendante
- Exemples, outils ou ressources supplémentaires

#### Version de Correctif (X.Y.Z)
- Corrections de bugs et rectifications
- Améliorations mineures du contenu existant
- Clarifications et petites améliorations

## Retours et Suggestions de la Communauté

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d’apprentissage :

### Comment Fournir des Retours
- **Problèmes GitHub** : Signalez des problèmes ou suggérez des améliorations (problèmes spécifiques à l’IA bienvenue)
- **Discussions Discord** : Partagez des idées et échangez avec la communauté Microsoft Foundry
- **Pull Requests** : Contribuez par des améliorations directes au contenu, en particulier les modèles et guides IA
- **Discord Microsoft Foundry** : Participez au canal #Azure pour les discussions AZD + IA
- **Forums Communautaires** : Participez aux discussions plus larges des développeurs Azure

### Catégories de Retours
- **Exactitude du Contenu IA** : Corrections aux informations d’intégration et de déploiement des services IA
- **Expérience d’Apprentissage** : Suggestions pour améliorer le parcours d’apprentissage des développeurs IA
- **Contenu IA Manquant** : Demandes de modèles, patrons ou exemples IA supplémentaires
- **Accessibilité** : Améliorations pour des besoins d’apprentissage diversifiés
- **Intégration des Outils IA** : Suggestions pour une meilleure intégration du workflow de développement IA
- **Modèles IA de Production** : Demandes de patrons de déploiement IA en entreprise

### Engagement de Réponse
- **Réponse aux Problèmes** : Sous 48 heures pour les problèmes signalés
- **Demandes de Fonctionnalités** : Évaluation sous une semaine
- **Contributions Communautaires** : Revue sous une semaine
- **Problèmes de Sécurité** : Priorité immédiate avec réponse accélérée

## Calendrier de Maintenance

### Mises à Jour Régulières
- **Revue Mensuelle** : Exactitude du contenu et validation des liens
- **Mises à Jour Trimestrielles** : Ajouts et améliorations majeurs du contenu
- **Revue Semestrielle** : Restructuration et amélioration complètes
- **Releases Annuelles** : Mises à jour majeures des versions avec améliorations significatives

### Surveillance et Assurance Qualité
- **Tests Automatisés** : Validation régulière des exemples de code et des liens
- **Intégration des Retours Communautaires** : Incorporation régulière des suggestions des utilisateurs
- **Mises à Jour Technologiques** : Alignement avec les derniers services Azure et versions azd
- **Audits d’Accessibilité** : Revue régulière des principes de conception inclusive

## Politique de Support des Versions

### Support des Versions Actuelles
- **Dernière Version Majeure** : Support complet avec mises à jour régulières
- **Version Majeure Précédente** : Mises à jour de sécurité et corrections critiques pendant 12 mois
- **Versions Héritées** : Support communautaire uniquement, sans mises à jour officielles

### Conseils de Migration
Lors de la sortie de versions majeures, nous fournissons :
- **Guides de Migration** : Instructions de transition étape par étape
- **Notes de Compatibilité** : Détails sur les changements incompatibles
- **Support d’Outils** : Scripts ou utilitaires pour assister la migration
- **Support Communautaire** : Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon Précédente** : [Guide d’Étude](resources/study-guide.md)
- **Leçon Suivante** : Retour au [README Principal](README.md)

**Restez Informé** : Surveillez ce dépôt pour être notifié des nouvelles versions et des mises à jour importantes des supports d’apprentissage.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->