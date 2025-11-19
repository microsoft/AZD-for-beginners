<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fcaa32a0ee7855df086aabcb6af92907",
  "translation_date": "2025-11-19T12:36:06+00:00",
  "source_file": "changelog.md",
  "language_code": "fr"
}
-->
# Journal des modifications - AZD pour les débutants

## Introduction

Ce journal des modifications documente tous les changements, mises à jour et améliorations notables du dépôt AZD pour les débutants. Nous suivons les principes de versionnement sémantique et maintenons ce journal pour aider les utilisateurs à comprendre ce qui a changé entre les versions.

## Objectifs d'apprentissage

En consultant ce journal des modifications, vous pourrez :
- Rester informé des nouvelles fonctionnalités et ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bugs et les ajustements pour garantir l'exactitude
- Observer l'évolution des supports d'apprentissage au fil du temps

## Résultats d'apprentissage

Après avoir consulté les entrées du journal des modifications, vous serez capable de :
- Identifier les nouveaux contenus et ressources disponibles pour l'apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d'apprentissage en fonction des supports les plus récents
- Contribuer avec des retours et des suggestions pour de futures améliorations

## Historique des versions

### [v3.6.0] - 2025-11-19

#### Mise à jour majeure : Exemples de déploiement d'applications conteneurisées
**Cette version introduit des exemples complets et prêts pour la production de déploiement d'applications conteneurisées à l'aide d'Azure Developer CLI (AZD), avec une documentation complète et une intégration dans le parcours d'apprentissage.**

#### Ajouté
- **🚀 Exemples d'applications conteneurisées** : Nouveaux exemples locaux dans `examples/container-app/` :
  - [Guide principal](examples/container-app/README.md) : Vue d'ensemble complète des déploiements conteneurisés, démarrage rapide, production et modèles avancés
  - [API Flask simple](../../examples/container-app/simple-flask-api) : API REST conviviale pour les débutants avec mise à l'échelle à zéro, sondes de santé, surveillance et dépannage
  - [Architecture microservices](../../examples/container-app/microservices) : Déploiement multi-services prêt pour la production (API Gateway, Produit, Commande, Utilisateur, Notification), messagerie asynchrone, Service Bus, Cosmos DB, Azure SQL, traçage distribué, déploiement blue-green/canary
- **Bonnes pratiques** : Sécurité, surveillance, optimisation des coûts et conseils CI/CD pour les charges de travail conteneurisées
- **Exemples de code** : `azure.yaml` complet, modèles Bicep et implémentations de services multi-langages (Python, Node.js, C#, Go)
- **Tests et dépannage** : Scénarios de test de bout en bout, commandes de surveillance, guide de dépannage

#### Modifié
- **README.md** : Mis à jour pour inclure et lier les nouveaux exemples d'applications conteneurisées sous "Exemples locaux - Applications conteneurisées"
- **examples/README.md** : Mis à jour pour mettre en avant les exemples d'applications conteneurisées, ajouter des entrées au tableau comparatif et actualiser les références technologiques/architecturales
- **Plan de cours et guide d'étude** : Mis à jour pour référencer les nouveaux exemples d'applications conteneurisées et les modèles de déploiement dans les chapitres pertinents

#### Validé
- ✅ Tous les nouveaux exemples déployables avec `azd up` et respectent les bonnes pratiques
- ✅ Liens croisés et navigation dans la documentation mis à jour
- ✅ Les exemples couvrent des scénarios allant des débutants aux avancés, y compris les microservices en production

#### Notes
- **Portée** : Documentation et exemples en anglais uniquement
- **Prochaines étapes** : Étendre avec des modèles conteneurisés avancés supplémentaires et une automatisation CI/CD dans les futures versions

### [v3.5.0] - 2025-11-19

#### Rebranding produit : Microsoft Foundry
**Cette version met en œuvre un changement complet de nom de produit, passant de "Azure AI Foundry" à "Microsoft Foundry" dans toute la documentation en anglais, reflétant le rebranding officiel de Microsoft.**

#### Modifié
- **🔄 Mise à jour du nom du produit** : Rebranding complet de "Azure AI Foundry" à "Microsoft Foundry"
  - Mise à jour de toutes les références dans la documentation anglaise du dossier `docs/`
  - Renommage du dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renommage du fichier : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total : 23 références de contenu mises à jour dans 7 fichiers de documentation

- **📁 Changements dans la structure des dossiers** :
  - `docs/ai-foundry/` renommé en `docs/microsoft-foundry/`
  - Tous les liens croisés mis à jour pour refléter la nouvelle structure des dossiers
  - Liens de navigation validés dans toute la documentation

- **📄 Renommage des fichiers** :
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tous les liens internes mis à jour pour référencer le nouveau nom de fichier

#### Fichiers mis à jour
- **Documentation des chapitres** (7 fichiers) :
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mises à jour de liens de navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 références au nom du produit mises à jour
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Déjà à jour avec Microsoft Foundry (depuis des mises à jour précédentes)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 références mises à jour (vue d'ensemble, retours de la communauté, documentation)
  - `docs/getting-started/azd-basics.md` - 4 liens croisés mis à jour
  - `docs/getting-started/first-project.md` - 2 liens de navigation de chapitre mis à jour
  - `docs/getting-started/installation.md` - 2 liens vers les chapitres suivants mis à jour
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 références mises à jour (navigation, communauté Discord)
  - `docs/troubleshooting/common-issues.md` - 1 lien de navigation mis à jour
  - `docs/troubleshooting/debugging.md` - 1 lien de navigation mis à jour

- **Fichiers de structure du cours** (2 fichiers) :
  - `README.md` - 17 références mises à jour (vue d'ensemble du cours, titres des chapitres, section des modèles, perspectives de la communauté)
  - `course-outline.md` - 14 références mises à jour (vue d'ensemble, objectifs d'apprentissage, ressources des chapitres)

#### Validé
- ✅ Aucune référence restante au chemin de dossier "ai-foundry" dans les documents en anglais
- ✅ Aucune référence restante au nom de produit "Azure AI Foundry" dans les documents en anglais
- ✅ Tous les liens de navigation fonctionnent avec la nouvelle structure de dossiers
- ✅ Renommage des fichiers et dossiers effectué avec succès
- ✅ Liens croisés entre chapitres validés

#### Notes
- **Portée** : Changements appliqués uniquement à la documentation en anglais dans le dossier `docs/`
- **Traductions** : Les dossiers de traduction (`translations/`) n'ont pas été mis à jour dans cette version
- **Atelier** : Les supports d'atelier (`workshop/`) n'ont pas été mis à jour dans cette version
- **Exemples** : Les fichiers d'exemple peuvent encore référencer l'ancien nom (à traiter dans une future mise à jour)
- **Liens externes** : Les URL externes et références au dépôt GitHub restent inchangées

#### Guide de migration pour les contributeurs
Si vous avez des branches locales ou des documents référencés avec l'ancienne structure :
1. Mettez à jour les références de dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Mettez à jour les références de fichier : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Remplacez le nom du produit : "Azure AI Foundry" → "Microsoft Foundry"
4. Validez que tous les liens internes de la documentation fonctionnent toujours

---

### [v3.4.0] - 2025-10-24

#### Aperçu de l'infrastructure et améliorations de validation
**Cette version introduit un support complet pour la nouvelle fonctionnalité d'aperçu d'Azure Developer CLI et améliore l'expérience utilisateur des ateliers.**

#### Ajouté
- **🧪 Documentation de la fonctionnalité `azd provision --preview`** : Couverture complète de la nouvelle capacité d'aperçu de l'infrastructure
  - Référence de commande et exemples d'utilisation dans la fiche pratique
  - Intégration détaillée dans le guide de provisionnement avec cas d'utilisation et avantages
  - Intégration de vérifications préalables pour une validation de déploiement plus sûre
  - Mises à jour du guide de démarrage avec des pratiques de déploiement axées sur la sécurité
- **🚧 Bannière de statut d'atelier** : Bannière HTML professionnelle indiquant le statut de développement de l'atelier
  - Design en dégradé avec indicateurs de construction pour une communication claire avec l'utilisateur
  - Horodatage de la dernière mise à jour pour plus de transparence
  - Design responsive pour tous les types d'appareils

#### Amélioré
- **Sécurité de l'infrastructure** : Fonctionnalité d'aperçu intégrée dans toute la documentation de déploiement
- **Validation avant déploiement** : Les scripts automatisés incluent désormais des tests d'aperçu de l'infrastructure
- **Flux de travail des développeurs** : Séquences de commandes mises à jour pour inclure l'aperçu comme meilleure pratique
- **Expérience atelier** : Attentes claires définies pour les utilisateurs concernant le statut de développement du contenu

#### Modifié
- **Bonnes pratiques de déploiement** : Le flux de travail basé sur l'aperçu est désormais l'approche recommandée
- **Flux de documentation** : La validation de l'infrastructure a été déplacée plus tôt dans le processus d'apprentissage
- **Présentation de l'atelier** : Communication professionnelle du statut avec un calendrier de développement clair

#### Amélioré
- **Approche axée sur la sécurité** : Les changements d'infrastructure peuvent désormais être validés avant le déploiement
- **Collaboration en équipe** : Les résultats de l'aperçu peuvent être partagés pour examen et approbation
- **Conscience des coûts** : Meilleure compréhension des coûts des ressources avant le provisionnement
- **Réduction des risques** : Moins d'échecs de déploiement grâce à une validation anticipée

#### Mise en œuvre technique
- **Intégration multi-documents** : Fonctionnalité d'aperçu documentée dans 4 fichiers clés
- **Modèles de commande** : Syntaxe et exemples cohérents dans toute la documentation
- **Intégration des bonnes pratiques** : L'aperçu inclus dans les flux de validation et les scripts
- **Indicateurs visuels** : Marquages clairs NOUVEAU pour une meilleure découvrabilité

#### Infrastructure de l'atelier
- **Communication du statut** : Bannière HTML professionnelle avec style en dégradé
- **Expérience utilisateur** : Statut de développement clair pour éviter toute confusion
- **Présentation professionnelle** : Maintient la crédibilité du dépôt tout en définissant les attentes
- **Transparence du calendrier** : Horodatage de la dernière mise à jour en octobre 2025 pour plus de responsabilité

### [v3.3.0] - 2025-09-24

#### Matériel d'atelier amélioré et expérience d'apprentissage interactive
**Cette version introduit des supports d'atelier complets avec des guides interactifs basés sur le navigateur et des parcours d'apprentissage structurés.**

#### Ajouté
- **🎥 Guide interactif d'atelier** : Expérience d'atelier basée sur le navigateur avec capacité de prévisualisation MkDocs
- **📝 Instructions structurées pour l'atelier** : Parcours d'apprentissage guidé en 7 étapes, de la découverte à la personnalisation
  - 0-Introduction : Vue d'ensemble de l'atelier et configuration
  - 1-Select-AI-Template : Processus de découverte et de sélection de modèles
  - 2-Validate-AI-Template : Procédures de déploiement et de validation
  - 3-Deconstruct-AI-Template : Compréhension de l'architecture des modèles
  - 4-Configure-AI-Template : Configuration et personnalisation
  - 5-Customize-AI-Template : Modifications avancées et itérations
  - 6-Teardown-Infrastructure : Nettoyage et gestion des ressources
  - 7-Wrap-up : Résumé et prochaines étapes
- **🛠️ Outils pour l'atelier** : Configuration MkDocs avec thème Material pour une expérience d'apprentissage améliorée
- **🎯 Parcours d'apprentissage pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces** : Configuration d'environnement de développement sans effort

#### Amélioré
- **Laboratoire d'atelier AI** : Étendu avec une expérience d'apprentissage structurée de 2 à 3 heures
- **Documentation de l'atelier** : Présentation professionnelle avec navigation et aides visuelles
- **Progression de l'apprentissage** : Guide clair étape par étape, de la sélection de modèles au déploiement en production
- **Expérience développeur** : Outils intégrés pour des flux de travail de développement simplifiés

#### Amélioré
- **Accessibilité** : Interface basée sur le navigateur avec recherche, fonctionnalité de copie et bascule de thème
- **Apprentissage autonome** : Structure d'atelier flexible adaptée à différents rythmes d'apprentissage
- **Application pratique** : Scénarios réels de déploiement de modèles AI
- **Intégration communautaire** : Intégration Discord pour le support et la collaboration dans l'atelier

#### Fonctionnalités de l'atelier
- **Recherche intégrée** : Découverte rapide de mots-clés et de leçons
- **Blocs de code copiables** : Fonctionnalité de copie au survol pour tous les exemples de code
- **Bascule de thème** : Support mode sombre/clair pour différentes préférences
- **Actifs visuels** : Captures d'écran et diagrammes pour une meilleure compréhension
- **Intégration d'aide** : Accès direct à Discord pour le support communautaire

### [v3.2.0] - 2025-09-17

#### Restructuration majeure de la navigation et système d'apprentissage par chapitres
**Cette version introduit une structure d'apprentissage par chapitres complète avec une navigation améliorée dans tout le dépôt.**

#### Ajouté
- **📚 Système d'apprentissage par chapitres** : Restructuration complète du cours en 8 chapitres d'apprentissage progressifs
  - Chapitre 1 : Fondations & Démarrage rapide (⭐ - 30-45 min)
  - Chapitre 2 : Développement AI-First (⭐⭐ - 1-2 heures)
  - Chapitre 3 : Configuration & Authentification (⭐⭐ - 45-60 min)
  - Chapitre 4 : Infrastructure as Code & Déploiement (⭐⭐⭐ - 1-1,5 heures)
  - Chapitre 5 : Solutions AI multi-agents (⭐⭐⭐⭐ - 2-3 heures)
  - Chapitre 6 : Validation & Planification pré-déploiement (⭐⭐ - 1 heure)
  - Chapitre 7 : Dépannage & Debugging (⭐⭐ - 1-1,5 heures)
  - Chapitre 8 : Modèles de production & entreprise (⭐⭐⭐⭐ - 2-3 heures)
- **📚 Système de navigation complet** : En-têtes et pieds de page de navigation cohérents dans toute la documentation
- **🎯 Suivi de progression** : Liste de vérification de la complétion du cours et système de vérification d'apprentissage
- **🗺️ Orientation du parcours d'apprentissage** : Points d'entrée clairs pour différents niveaux d'expérience et objectifs
- **🔗 Navigation croisée** : Chapitres liés et prérequis clairement indiqués

#### Amélioré
- **Structure du README** : Transformé en une plateforme d'apprentissage structurée avec organisation par chapitres
- **Navigation dans la documentation** : Chaque page inclut désormais le contexte du chapitre et des indications de progression
- **Organisation des modèles** : Exemples et modèles mappés aux chapitres d'apprentissage appropriés
- **Intégration des ressources** : Fiches pratiques, FAQ et guides d'étude connectés aux chapitres pertinents
- **Intégration des ateliers** : Laboratoires pratiques mappés aux objectifs d'apprentissage de plusieurs chapitres

#### Modifié
- **Progression de l'apprentissage** : Passage d'une documentation linéaire à un apprentissage flexible par chapitres
- **Placement de la configuration** : Guide de configuration repositionné en Chapitre 3 pour un meilleur flux d'apprentissage
- **Intégration du contenu AI** : Meilleure intégration du contenu spécifique à l'AI tout au long du parcours d'apprentissage
- **Contenu de production** : Modèles avancés consolidés dans le Chapitre 8 pour les apprenants en entreprise

#### Amélioré
- **Expérience utilisateur** : Navigation claire avec des fils d'Ariane et des indicateurs de progression des chapitres  
- **Accessibilité** : Modèles de navigation cohérents pour faciliter la traversée des cours  
- **Présentation professionnelle** : Structure de cours de style universitaire adaptée à la formation académique et en entreprise  
- **Efficacité d'apprentissage** : Réduction du temps nécessaire pour trouver le contenu pertinent grâce à une organisation améliorée  

#### Mise en œuvre technique  
- **En-têtes de navigation** : Navigation standardisée des chapitres sur plus de 40 fichiers de documentation  
- **Navigation en pied de page** : Indicateurs cohérents de progression et de complétion des chapitres  
- **Liens croisés** : Système complet de liens internes connectant les concepts liés  
- **Cartographie des chapitres** : Modèles et exemples clairement associés aux objectifs d'apprentissage  

#### Amélioration du guide d'étude  
- **📚 Objectifs d'apprentissage complets** : Guide d'étude restructuré pour s'aligner sur un système de 8 chapitres  
- **🎯 Évaluation par chapitre** : Chaque chapitre inclut des objectifs d'apprentissage spécifiques et des exercices pratiques  
- **📋 Suivi de progression** : Planning hebdomadaire avec résultats mesurables et listes de contrôle de complétion  
- **❓ Questions d'évaluation** : Questions de validation des connaissances pour chaque chapitre avec des résultats professionnels  
- **🛠️ Exercices pratiques** : Activités pratiques avec des scénarios de déploiement réels et des résolutions de problèmes  
- **📊 Progression des compétences** : Avancement clair des concepts de base aux modèles d'entreprise avec un focus sur le développement de carrière  
- **🎓 Cadre de certification** : Résultats de développement professionnel et système de reconnaissance communautaire  
- **⏱️ Gestion du temps** : Plan d'apprentissage structuré sur 10 semaines avec validation des étapes clés  

### [v3.1.0] - 2025-09-17  

#### Solutions IA multi-agents améliorées  
**Cette version améliore la solution de vente au détail multi-agents avec une meilleure nomenclature des agents et une documentation enrichie.**  

#### Changements  
- **Terminologie multi-agents** : Remplacement de "agent Cora" par "agent Client" dans toute la solution multi-agents pour une meilleure compréhension  
- **Architecture des agents** : Mise à jour de toute la documentation, des modèles ARM et des exemples de code pour utiliser une nomenclature cohérente "agent Client"  
- **Exemples de configuration** : Modernisation des modèles de configuration des agents avec des conventions de dénomination actualisées  
- **Cohérence de la documentation** : Garantie que toutes les références utilisent des noms d'agents professionnels et descriptifs  

#### Améliorations  
- **Package de modèles ARM** : Mise à jour du modèle retail-multiagent-arm-template avec des références à l'agent Client  
- **Diagrammes d'architecture** : Actualisation des diagrammes Mermaid avec la nouvelle nomenclature des agents  
- **Exemples de code** : Les classes Python et exemples d'implémentation utilisent désormais la dénomination CustomerAgent  
- **Variables d'environnement** : Mise à jour de tous les scripts de déploiement pour utiliser les conventions CUSTOMER_AGENT_NAME  

#### Améliorations supplémentaires  
- **Expérience développeur** : Rôles et responsabilités des agents plus clairs dans la documentation  
- **Prêt pour la production** : Meilleur alignement avec les conventions de dénomination d'entreprise  
- **Matériel pédagogique** : Noms d'agents plus intuitifs pour des fins éducatives  
- **Utilisabilité des modèles** : Compréhension simplifiée des fonctions des agents et des modèles de déploiement  

#### Détails techniques  
- Diagrammes d'architecture Mermaid mis à jour avec des références à CustomerAgent  
- Remplacement des noms de classe CoraAgent par CustomerAgent dans les exemples Python  
- Modifications des configurations JSON des modèles ARM pour utiliser le type d'agent "customer"  
- Mise à jour des variables d'environnement de CORA_AGENT_* à CUSTOMER_AGENT_*  
- Actualisation de toutes les commandes de déploiement et configurations de conteneurs  

### [v3.0.0] - 2025-09-12  

#### Changements majeurs - Focus sur les développeurs IA et intégration Azure AI Foundry  
**Cette version transforme le dépôt en une ressource complète d'apprentissage axée sur l'IA avec intégration Azure AI Foundry.**  

#### Ajouts  
- **🤖 Parcours d'apprentissage IA-First** : Restructuration complète priorisant les développeurs et ingénieurs IA  
- **Guide d'intégration Azure AI Foundry** : Documentation complète pour connecter AZD aux services Azure AI Foundry  
- **Modèles de déploiement IA** : Guide détaillé couvrant la sélection, la configuration et les stratégies de déploiement en production des modèles  
- **Atelier pratique IA** : Atelier pratique de 2-3 heures pour convertir des applications IA en solutions déployables avec AZD  
- **Bonnes pratiques IA en production** : Modèles prêts pour l'entreprise pour l'évolutivité, la surveillance et la sécurisation des charges de travail IA  
- **Guide de dépannage spécifique à l'IA** : Résolution complète des problèmes pour Azure OpenAI, Cognitive Services et déploiements IA  
- **Galerie de modèles IA** : Collection mise en avant de modèles Azure AI Foundry avec des niveaux de complexité  
- **Matériel d'atelier** : Structure complète d'atelier avec des laboratoires pratiques et des documents de référence  

#### Améliorations  
- **Structure README** : Axée sur les développeurs IA avec 45 % d'intérêt communautaire issu de Discord Azure AI Foundry  
- **Parcours d'apprentissage** : Parcours dédié aux développeurs IA en parallèle des parcours traditionnels pour étudiants et ingénieurs DevOps  
- **Recommandations de modèles** : Modèles IA mis en avant, y compris azure-search-openai-demo, contoso-chat et openai-chat-app-quickstart  
- **Intégration communautaire** : Support communautaire Discord amélioré avec des canaux et discussions spécifiques à l'IA  

#### Focus sur la sécurité et la production  
- **Modèles d'identité managée** : Configurations d'authentification et de sécurité spécifiques à l'IA  
- **Optimisation des coûts** : Suivi de l'utilisation des jetons et contrôle des budgets pour les charges de travail IA  
- **Déploiement multi-régions** : Stratégies pour le déploiement global des applications IA  
- **Surveillance des performances** : Intégration de métriques spécifiques à l'IA et d'Application Insights  

#### Qualité de la documentation  
- **Structure de cours linéaire** : Progression logique des modèles de déploiement IA débutants à avancés  
- **URLs validées** : Tous les liens vers des dépôts externes vérifiés et accessibles  
- **Références complètes** : Tous les liens internes à la documentation validés et fonctionnels  
- **Prêt pour la production** : Modèles de déploiement d'entreprise avec des exemples concrets  

### [v2.0.0] - 2025-09-09  

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle  
**Cette version représente une refonte significative de la structure du dépôt et de la présentation du contenu.**  

#### Ajouts  
- **Cadre d'apprentissage structuré** : Toutes les pages de documentation incluent désormais des sections Introduction, Objectifs d'apprentissage et Résultats d'apprentissage  
- **Système de navigation** : Ajout de liens "Précédent/Suivant" dans toute la documentation pour une progression guidée  
- **Guide d'étude** : study-guide.md complet avec objectifs d'apprentissage, exercices pratiques et matériel d'évaluation  
- **Présentation professionnelle** : Suppression de tous les emojis pour une meilleure accessibilité et une apparence professionnelle  
- **Structure de contenu améliorée** : Organisation et flux des supports d'apprentissage optimisés  

#### Changements  
- **Format de la documentation** : Standardisation de toute la documentation avec une structure cohérente axée sur l'apprentissage  
- **Flux de navigation** : Mise en œuvre d'une progression logique à travers tous les supports d'apprentissage  
- **Présentation du contenu** : Suppression des éléments décoratifs au profit d'un format clair et professionnel  
- **Structure des liens** : Mise à jour de tous les liens internes pour prendre en charge le nouveau système de navigation  

#### Améliorations  
- **Accessibilité** : Suppression des dépendances aux emojis pour une meilleure compatibilité avec les lecteurs d'écran  
- **Apparence professionnelle** : Présentation propre et de style académique adaptée à l'apprentissage en entreprise  
- **Expérience d'apprentissage** : Approche structurée avec des objectifs et résultats clairs pour chaque leçon  
- **Organisation du contenu** : Meilleur flux logique et connexion entre les sujets liés  

### [v1.0.0] - 2025-09-09  

#### Première version - Dépôt complet d'apprentissage AZD  

#### Ajouts  
- **Structure de documentation de base**  
  - Série complète de guides de démarrage  
  - Documentation complète sur le déploiement et la mise en service  
  - Ressources détaillées de dépannage et guides de débogage  
  - Outils et procédures de validation pré-déploiement  

- **Module de démarrage**  
  - Bases d'AZD : Concepts et terminologie de base  
  - Guide d'installation : Instructions de configuration spécifiques à la plateforme  
  - Guide de configuration : Configuration de l'environnement et authentification  
  - Tutoriel premier projet : Apprentissage pratique étape par étape  

- **Module de déploiement et de mise en service**  
  - Guide de déploiement : Documentation complète du flux de travail  
  - Guide de mise en service : Infrastructure as Code avec Bicep  
  - Bonnes pratiques pour les déploiements en production  
  - Modèles d'architecture multi-services  

- **Module de validation pré-déploiement**  
  - Planification de capacité : Validation de la disponibilité des ressources Azure  
  - Sélection de SKU : Guide complet des niveaux de service  
  - Vérifications préalables : Scripts de validation automatisés (PowerShell et Bash)  
  - Outils de planification des coûts et de budget  

- **Module de dépannage**  
  - Problèmes courants : Problèmes fréquemment rencontrés et solutions  
  - Guide de débogage : Méthodologies systématiques de dépannage  
  - Techniques et outils de diagnostic avancés  
  - Surveillance et optimisation des performances  

- **Ressources et références**  
  - Fiche de commandes : Référence rapide pour les commandes essentielles  
  - Glossaire : Définitions complètes des termes et acronymes  
  - FAQ : Réponses détaillées aux questions fréquentes  
  - Liens vers des ressources externes et connexions communautaires  

- **Exemples et modèles**  
  - Exemple d'application Web simple  
  - Modèle de déploiement de site Web statique  
  - Configuration d'application conteneurisée  
  - Modèles d'intégration de bases de données  
  - Exemples d'architecture de microservices  
  - Implémentations de fonctions serverless  

#### Fonctionnalités  
- **Support multi-plateforme** : Guides d'installation et de configuration pour Windows, macOS et Linux  
- **Niveaux de compétence variés** : Contenu conçu pour les étudiants jusqu'aux développeurs professionnels  
- **Focus pratique** : Exemples pratiques et scénarios réels  
- **Couverture complète** : Des concepts de base aux modèles d'entreprise avancés  
- **Approche axée sur la sécurité** : Bonnes pratiques de sécurité intégrées partout  
- **Optimisation des coûts** : Conseils pour des déploiements rentables et une gestion efficace des ressources  

#### Qualité de la documentation  
- **Exemples de code détaillés** : Exemples de code pratiques et testés  
- **Instructions étape par étape** : Conseils clairs et exploitables  
- **Gestion complète des erreurs** : Dépannage des problèmes courants  
- **Intégration des meilleures pratiques** : Normes et recommandations de l'industrie  
- **Compatibilité des versions** : À jour avec les derniers services Azure et fonctionnalités azd  

## Améliorations futures prévues  

### Version 3.1.0 (Planifiée)  
#### Expansion de la plateforme IA  
- **Support multi-modèles** : Modèles d'intégration pour Hugging Face, Azure Machine Learning et modèles personnalisés  
- **Cadres d'agents IA** : Modèles pour les déploiements LangChain, Semantic Kernel et AutoGen  
- **Modèles avancés RAG** : Options de bases de données vectorielles au-delà d'Azure AI Search (Pinecone, Weaviate, etc.)  
- **Observabilité IA** : Surveillance améliorée des performances des modèles, de l'utilisation des jetons et de la qualité des réponses  

#### Expérience développeur  
- **Extension VS Code** : Expérience de développement intégrée AZD + AI Foundry  
- **Intégration GitHub Copilot** : Génération de modèles AZD assistée par IA  
- **Tutoriels interactifs** : Exercices de codage pratiques avec validation automatisée pour les scénarios IA  
- **Contenu vidéo** : Tutoriels vidéo complémentaires pour les apprenants visuels axés sur les déploiements IA  

### Version 4.0.0 (Planifiée)  
#### Modèles IA d'entreprise  
- **Cadre de gouvernance** : Gouvernance des modèles IA, conformité et pistes d'audit  
- **IA multi-locataires** : Modèles pour servir plusieurs clients avec des services IA isolés  
- **Déploiement IA en périphérie** : Intégration avec Azure IoT Edge et instances de conteneurs  
- **IA hybride cloud** : Modèles de déploiement multi-cloud et hybrides pour les charges de travail IA  

#### Fonctionnalités avancées  
- **Automatisation des pipelines IA** : Intégration MLOps avec les pipelines Azure Machine Learning  
- **Sécurité avancée** : Modèles de confiance zéro, points de terminaison privés et protection avancée contre les menaces  
- **Optimisation des performances** : Stratégies avancées de réglage et d'évolutivité pour les applications IA à haut débit  
- **Distribution mondiale** : Modèles de diffusion de contenu et de mise en cache en périphérie pour les applications IA  

### Version 3.0.0 (Planifiée) - Supplantée par la version actuelle  
#### Ajouts proposés - Maintenant implémentés dans la v3.0.0  
- ✅ **Contenu axé sur l'IA** : Intégration complète d'Azure AI Foundry (Terminé)  
- ✅ **Tutoriels interactifs** : Atelier pratique IA (Terminé)  
- ✅ **Module de sécurité avancée** : Modèles de sécurité spécifiques à l'IA (Terminé)  
- ✅ **Optimisation des performances** : Stratégies de réglage des charges de travail IA (Terminé)  

### Version 2.1.0 (Planifiée) - Partiellement implémentée dans la v3.0.0  
#### Améliorations mineures - Certaines terminées dans la version actuelle  
- ✅ **Exemples supplémentaires** : Scénarios de déploiement axés sur l'IA (Terminé)  
- ✅ **FAQ étendue** : Questions spécifiques à l'IA et dépannage (Terminé)  
- **Intégration des outils** : Guides améliorés d'intégration IDE et éditeur  
- ✅ **Extension de la surveillance** : Modèles de surveillance et d'alerte spécifiques à l'IA (Terminé)  

#### Toujours prévu pour une future version  
- **Documentation adaptée aux mobiles** : Design réactif pour l'apprentissage mobile  
- **Accès hors ligne** : Packages de documentation téléchargeables  
- **Intégration IDE améliorée** : Extension VS Code pour les flux de travail AZD + IA  
- **Tableau de bord communautaire** : Statistiques communautaires en temps réel et suivi des contributions  

## Contribution au journal des modifications  

### Signalement des changements  
Lors de la contribution à ce dépôt, veuillez vous assurer que les entrées du journal des modifications incluent :  

1. **Numéro de version** : Suivant la version sémantique (majeur.mineur.patch)  
2. **Date** : Date de publication ou de mise à jour au format AAAA-MM-JJ  
3. **Catégorie** : Ajouté, Modifié, Obsolète, Supprimé, Corrigé, Sécurité  
4. **Description claire** : Description concise des changements  
5. **Évaluation de l'impact** : Comment les changements affectent les utilisateurs existants  

### Catégories de changements  

#### Ajouté  
- Nouvelles fonctionnalités, sections de documentation ou capacités  
- Nouveaux exemples, modèles ou ressources d'apprentissage  
- Outils, scripts ou utilitaires supplémentaires  

#### Modifié  
- Modifications des fonctionnalités ou de la documentation existantes  
- Mises à jour pour améliorer la clarté ou l'exactitude  
- Restructuration du contenu ou de l'organisation  

#### Obsolète  
- Fonctionnalités ou approches en cours de suppression  
- Sections de documentation prévues pour être retirées  
- Méthodes ayant de meilleures alternatives  

#### Supprimé  
- Fonctionnalités, documentation ou exemples qui ne sont plus pertinents  
- Informations obsolètes ou approches dépréciées  
- Contenu redondant ou consolidé  

#### Corrigé  
- Corrections d'erreurs dans la documentation ou le code  
- Résolution de problèmes ou de bugs signalés  
- Améliorations de l'exactitude ou de la fonctionnalité  

#### Sécurité  
- Améliorations ou correctifs liés à la sécurité  
- Mises à jour des meilleures pratiques de sécurité  
- Résolution de vulnérabilités de sécurité  

### Directives de versionnement sémantique  

#### Version majeure (X.0.0)  
- Changements majeurs nécessitant une action de l'utilisateur  
- Restructuration significative du contenu ou de l'organisation  
- Changements modifiant l'approche ou la méthodologie fondamentale  
#### Version Mineure (X.Y.0)
- Nouvelles fonctionnalités ou ajouts de contenu
- Améliorations qui conservent la compatibilité ascendante
- Exemples, outils ou ressources supplémentaires

#### Version Corrective (X.Y.Z)
- Corrections de bugs et ajustements
- Améliorations mineures du contenu existant
- Clarifications et petites améliorations

## Retours et Suggestions de la Communauté

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d'apprentissage :

### Comment Fournir des Retours
- **Problèmes GitHub** : Signalez des problèmes ou proposez des améliorations (les problèmes spécifiques à l'IA sont les bienvenus)
- **Discussions Discord** : Partagez vos idées et échangez avec la communauté Azure AI Foundry
- **Pull Requests** : Apportez des améliorations directes au contenu, en particulier aux modèles et guides IA
- **Discord Azure AI Foundry** : Participez au canal #Azure pour des discussions sur AZD + IA
- **Forums Communautaires** : Participez à des discussions plus larges sur le développement Azure

### Catégories de Retours
- **Précision du Contenu IA** : Corrections concernant l'intégration et le déploiement des services IA
- **Expérience d'Apprentissage** : Suggestions pour améliorer le parcours d'apprentissage des développeurs IA
- **Contenu IA Manquant** : Demandes de modèles, schémas ou exemples IA supplémentaires
- **Accessibilité** : Améliorations pour répondre à des besoins d'apprentissage diversifiés
- **Intégration des Outils IA** : Suggestions pour une meilleure intégration des flux de travail de développement IA
- **Schémas IA en Production** : Demandes de schémas de déploiement IA pour les entreprises

### Engagement de Réponse
- **Réponse aux Problèmes** : Sous 48 heures pour les problèmes signalés
- **Demandes de Fonctionnalités** : Évaluation sous une semaine
- **Contributions Communautaires** : Revue sous une semaine
- **Problèmes de Sécurité** : Priorité immédiate avec réponse accélérée

## Calendrier de Maintenance

### Mises à Jour Régulières
- **Revues Mensuelles** : Vérification de l'exactitude du contenu et des liens
- **Mises à Jour Trimestrielles** : Ajouts et améliorations majeurs de contenu
- **Revues Semestrielles** : Restructuration et amélioration approfondies
- **Versions Annuelles** : Mises à jour majeures avec des améliorations significatives

### Surveillance et Assurance Qualité
- **Tests Automatisés** : Validation régulière des exemples de code et des liens
- **Intégration des Retours Communautaires** : Incorporation régulière des suggestions des utilisateurs
- **Mises à Jour Technologiques** : Alignement avec les derniers services Azure et les versions azd
- **Audits d'Accessibilité** : Revue régulière pour respecter les principes de design inclusif

## Politique de Support des Versions

### Support des Versions Actuelles
- **Dernière Version Majeure** : Support complet avec mises à jour régulières
- **Version Majeure Précédente** : Mises à jour de sécurité et corrections critiques pendant 12 mois
- **Versions Anciennes** : Support communautaire uniquement, pas de mises à jour officielles

### Guide de Migration
Lors de la sortie de versions majeures, nous fournissons :
- **Guides de Migration** : Instructions détaillées pour la transition
- **Notes de Compatibilité** : Détails sur les changements majeurs
- **Support d'Outils** : Scripts ou utilitaires pour faciliter la migration
- **Support Communautaire** : Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon Précédente** : [Guide d'Étude](resources/study-guide.md)
- **Leçon Suivante** : Retour au [README Principal](README.md)

**Restez Informé** : Suivez ce dépôt pour recevoir des notifications sur les nouvelles versions et les mises à jour importantes des matériaux d'apprentissage.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->