<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T16:24:49+00:00",
  "source_file": "changelog.md",
  "language_code": "fr"
}
-->
# Journal des modifications - AZD pour les débutants

## Introduction

Ce journal des modifications documente tous les changements, mises à jour et améliorations notables du dépôt AZD pour les débutants. Nous suivons les principes de versionnement sémantique et maintenons ce journal pour aider les utilisateurs à comprendre les évolutions entre les versions.

## Objectifs d'apprentissage

En consultant ce journal des modifications, vous pourrez :
- Rester informé des nouvelles fonctionnalités et ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bugs pour garantir l'exactitude
- Observer l'évolution des supports d'apprentissage au fil du temps

## Résultats d'apprentissage

Après avoir consulté les entrées du journal des modifications, vous serez capable de :
- Identifier les nouveaux contenus et ressources disponibles pour l'apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d'apprentissage en fonction des matériaux les plus récents
- Contribuer avec des retours et des suggestions pour des améliorations futures

## Historique des versions

### [v3.4.0] - 24/10/2025

#### Améliorations de l'aperçu et de la validation de l'infrastructure
**Cette version introduit un support complet pour la nouvelle fonctionnalité d'aperçu du CLI Azure Developer et améliore l'expérience utilisateur des ateliers.**

#### Ajouté
- **🧪 Documentation de la fonctionnalité azd provision --preview** : Couverture complète de la nouvelle capacité d'aperçu de l'infrastructure
  - Références de commande et exemples d'utilisation dans une fiche pratique
  - Intégration détaillée dans le guide de provisionnement avec cas d'utilisation et avantages
  - Intégration de vérifications préalables pour une validation de déploiement plus sûre
  - Mises à jour du guide de démarrage avec des pratiques de déploiement axées sur la sécurité
- **🚧 Bannière de statut d'atelier** : Bannière HTML professionnelle indiquant le statut de développement de l'atelier
  - Design en dégradé avec indicateurs de construction pour une communication claire avec les utilisateurs
  - Date de dernière mise à jour pour plus de transparence
  - Design adapté aux mobiles pour tous les types d'appareils

#### Amélioré
- **Sécurité de l'infrastructure** : Fonctionnalité d'aperçu intégrée dans toute la documentation de déploiement
- **Validation avant déploiement** : Les scripts automatisés incluent désormais des tests d'aperçu de l'infrastructure
- **Workflow des développeurs** : Séquences de commandes mises à jour pour inclure l'aperçu comme meilleure pratique
- **Expérience atelier** : Attentes claires définies pour les utilisateurs concernant le statut de développement du contenu

#### Modifié
- **Meilleures pratiques de déploiement** : Workflow axé sur l'aperçu désormais recommandé
- **Flux de documentation** : Validation de l'infrastructure déplacée plus tôt dans le processus d'apprentissage
- **Présentation de l'atelier** : Communication professionnelle du statut avec un calendrier de développement clair

#### Amélioré
- **Approche axée sur la sécurité** : Les modifications d'infrastructure peuvent désormais être validées avant le déploiement
- **Collaboration en équipe** : Les résultats d'aperçu peuvent être partagés pour examen et approbation
- **Conscience des coûts** : Meilleure compréhension des coûts des ressources avant le provisionnement
- **Réduction des risques** : Moins d'échecs de déploiement grâce à une validation avancée

#### Mise en œuvre technique
- **Intégration multi-document** : Fonctionnalité d'aperçu documentée dans 4 fichiers clés
- **Modèles de commande** : Syntaxe et exemples cohérents dans toute la documentation
- **Intégration des meilleures pratiques** : Aperçu inclus dans les workflows de validation et les scripts
- **Indicateurs visuels** : Marquages clairs des nouvelles fonctionnalités pour une meilleure découverte

#### Infrastructure de l'atelier
- **Communication de statut** : Bannière HTML professionnelle avec style en dégradé
- **Expérience utilisateur** : Statut de développement clair pour éviter toute confusion
- **Présentation professionnelle** : Maintient la crédibilité du dépôt tout en définissant les attentes
- **Transparence du calendrier** : Date de dernière mise à jour d'octobre 2025 pour la responsabilité

### [v3.3.0] - 24/09/2025

#### Matériaux d'atelier améliorés et expérience d'apprentissage interactive
**Cette version introduit des matériaux d'atelier complets avec des guides interactifs basés sur le navigateur et des parcours d'apprentissage structurés.**

#### Ajouté
- **🎥 Guide interactif d'atelier** : Expérience d'atelier basée sur le navigateur avec capacité de prévisualisation MkDocs
- **📝 Instructions structurées d'atelier** : Parcours d'apprentissage guidé en 7 étapes, de la découverte à la personnalisation
  - 0-Introduction : Vue d'ensemble de l'atelier et configuration
  - 1-Choisir-un-modèle-AI : Processus de découverte et sélection de modèle
  - 2-Valider-le-modèle-AI : Procédures de déploiement et validation
  - 3-Décomposer-le-modèle-AI : Comprendre l'architecture du modèle
  - 4-Configurer-le-modèle-AI : Configuration et personnalisation
  - 5-Personnaliser-le-modèle-AI : Modifications avancées et itérations
  - 6-Démanteler-l'infrastructure : Nettoyage et gestion des ressources
  - 7-Conclure : Résumé et prochaines étapes
- **🛠️ Outils d'atelier** : Configuration MkDocs avec thème Material pour une expérience d'apprentissage améliorée
- **🎯 Parcours d'apprentissage pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces** : Configuration fluide de l'environnement de développement

#### Amélioré
- **Laboratoire d'atelier AI** : Étendu avec une expérience d'apprentissage structurée de 2 à 3 heures
- **Documentation de l'atelier** : Présentation professionnelle avec navigation et aides visuelles
- **Progression de l'apprentissage** : Guide clair étape par étape, de la sélection de modèle au déploiement en production
- **Expérience développeur** : Outils intégrés pour des workflows de développement simplifiés

#### Amélioré
- **Accessibilité** : Interface basée sur le navigateur avec recherche, fonctionnalité de copie et bascule de thème
- **Apprentissage autonome** : Structure flexible de l'atelier adaptée à différents rythmes d'apprentissage
- **Application pratique** : Scénarios de déploiement de modèles AI dans le monde réel
- **Intégration communautaire** : Intégration Discord pour le support et la collaboration dans l'atelier

#### Fonctionnalités de l'atelier
- **Recherche intégrée** : Découverte rapide de mots-clés et leçons
- **Blocs de code copiables** : Fonctionnalité de copie au survol pour tous les exemples de code
- **Bascule de thème** : Support mode sombre/clair pour différentes préférences
- **Actifs visuels** : Captures d'écran et diagrammes pour une meilleure compréhension
- **Intégration d'aide** : Accès direct à Discord pour le support communautaire

### [v3.2.0] - 17/09/2025

#### Restructuration majeure de la navigation et système d'apprentissage par chapitres
**Cette version introduit une structure d'apprentissage par chapitres complète avec une navigation améliorée dans tout le dépôt.**

#### Ajouté
- **📚 Système d'apprentissage par chapitres** : Restructuration complète du cours en 8 chapitres progressifs
  - Chapitre 1 : Fondations et démarrage rapide (⭐ - 30-45 min)
  - Chapitre 2 : Développement AI-First (⭐⭐ - 1-2 heures)
  - Chapitre 3 : Configuration et authentification (⭐⭐ - 45-60 min)
  - Chapitre 4 : Infrastructure en tant que code et déploiement (⭐⭐⭐ - 1-1,5 heures)
  - Chapitre 5 : Solutions AI multi-agents (⭐⭐⭐⭐ - 2-3 heures)
  - Chapitre 6 : Validation et planification avant déploiement (⭐⭐ - 1 heure)
  - Chapitre 7 : Dépannage et débogage (⭐⭐ - 1-1,5 heures)
  - Chapitre 8 : Modèles de production et d'entreprise (⭐⭐⭐⭐ - 2-3 heures)
- **📚 Système de navigation complet** : En-têtes et pieds de page de navigation cohérents dans toute la documentation
- **🎯 Suivi de progression** : Liste de vérification de la complétion du cours et système de vérification d'apprentissage
- **🗺️ Orientation du parcours d'apprentissage** : Points d'entrée clairs pour différents niveaux d'expérience et objectifs
- **🔗 Navigation croisée** : Chapitres liés et prérequis clairement indiqués

#### Amélioré
- **Structure README** : Transformée en une plateforme d'apprentissage structurée avec organisation par chapitres
- **Navigation dans la documentation** : Chaque page inclut désormais le contexte du chapitre et des indications de progression
- **Organisation des modèles** : Exemples et modèles associés aux chapitres d'apprentissage appropriés
- **Intégration des ressources** : Fiches pratiques, FAQ et guides d'étude connectés aux chapitres pertinents
- **Intégration des ateliers** : Laboratoires pratiques associés à plusieurs objectifs d'apprentissage des chapitres

#### Modifié
- **Progression de l'apprentissage** : Passage d'une documentation linéaire à un apprentissage flexible par chapitres
- **Placement de la configuration** : Guide de configuration repositionné en Chapitre 3 pour un meilleur flux d'apprentissage
- **Intégration du contenu AI** : Meilleure intégration du contenu spécifique à l'AI tout au long du parcours d'apprentissage
- **Contenu de production** : Modèles avancés consolidés dans le Chapitre 8 pour les apprenants en entreprise

#### Amélioré
- **Expérience utilisateur** : Indicateurs de progression clairs et navigation par chapitres
- **Accessibilité** : Modèles de navigation cohérents pour une traversée plus facile du cours
- **Présentation professionnelle** : Structure de cours de style universitaire adaptée à la formation académique et en entreprise
- **Efficacité d'apprentissage** : Temps réduit pour trouver le contenu pertinent grâce à une organisation améliorée

#### Mise en œuvre technique
- **En-têtes de navigation** : Navigation par chapitres standardisée dans plus de 40 fichiers de documentation
- **Navigation en pied de page** : Indications de progression cohérentes et indicateurs de complétion des chapitres
- **Liens croisés** : Système de liaison interne complet connectant les concepts liés
- **Cartographie des chapitres** : Modèles et exemples clairement associés aux objectifs d'apprentissage

#### Amélioration du guide d'étude
- **📚 Objectifs d'apprentissage complets** : Guide d'étude restructuré pour s'aligner sur le système en 8 chapitres
- **🎯 Évaluation par chapitres** : Chaque chapitre inclut des objectifs d'apprentissage spécifiques et des exercices pratiques
- **📋 Suivi de progression** : Programme d'apprentissage hebdomadaire avec résultats mesurables et listes de vérification de complétion
- **❓ Questions d'évaluation** : Questions de validation des connaissances pour chaque chapitre avec résultats professionnels
- **🛠️ Exercices pratiques** : Activités pratiques avec scénarios réels de déploiement et de dépannage
- **📊 Progression des compétences** : Avancement clair des concepts de base aux modèles d'entreprise avec focus sur le développement de carrière
- **🎓 Cadre de certification** : Résultats de développement professionnel et système de reconnaissance communautaire
- **⏱️ Gestion du calendrier** : Plan d'apprentissage structuré sur 10 semaines avec validation des étapes clés

### [v3.1.0] - 17/09/2025

#### Solutions AI multi-agents améliorées
**Cette version améliore la solution multi-agents pour le commerce de détail avec un meilleur nommage des agents et une documentation enrichie.**

#### Modifié
- **Terminologie multi-agents** : Remplacement de "agent Cora" par "agent Client" dans toute la solution multi-agents pour le commerce de détail pour une meilleure compréhension
- **Architecture des agents** : Mise à jour de toute la documentation, des modèles ARM et des exemples de code pour utiliser un nommage cohérent "agent Client"
- **Exemples de configuration** : Modernisation des modèles de configuration des agents avec des conventions de nommage mises à jour
- **Cohérence de la documentation** : Garantie que toutes les références utilisent des noms d'agents professionnels et descriptifs

#### Amélioré
- **Package de modèles ARM** : Mise à jour du modèle retail-multiagent-arm-template avec des références à l'agent Client
- **Diagrammes d'architecture** : Rafraîchissement des diagrammes Mermaid avec un nommage d'agent mis à jour
- **Exemples de code** : Les classes Python et exemples d'implémentation utilisent désormais le nom CustomerAgent
- **Variables d'environnement** : Mise à jour de tous les scripts de déploiement pour utiliser les conventions CUSTOMER_AGENT_NAME

#### Amélioré
- **Expérience développeur** : Rôles et responsabilités des agents plus clairs dans la documentation
- **Prêt pour la production** : Meilleur alignement avec les conventions de nommage en entreprise
- **Matériaux d'apprentissage** : Noms d'agents plus intuitifs pour les besoins éducatifs
- **Utilisabilité des modèles** : Compréhension simplifiée des fonctions des agents et des modèles de déploiement

#### Détails techniques
- Diagrammes d'architecture Mermaid mis à jour avec des références CustomerAgent
- Remplacement des noms de classe CoraAgent par CustomerAgent dans les exemples Python
- Modifications des configurations JSON des modèles ARM pour utiliser le type d'agent "client"
- Mise à jour des variables d'environnement de CORA_AGENT_* à CUSTOMER_AGENT_*
- Rafraîchissement de toutes les commandes de déploiement et configurations de conteneurs

### [v3.0.0] - 12/09/2025

#### Changements majeurs - Focus sur les développeurs AI et intégration Azure AI Foundry
**Cette version transforme le dépôt en une ressource d'apprentissage complète axée sur l'AI avec une intégration à Azure AI Foundry.**

#### Ajouté
- **🤖 Parcours d'apprentissage AI-First** : Restructuration complète priorisant les développeurs et ingénieurs AI
- **Guide d'intégration Azure AI Foundry** : Documentation complète pour connecter AZD aux services Azure AI Foundry
- **Modèles de déploiement AI** : Guide détaillé couvrant la sélection, la configuration et les stratégies de déploiement en production des modèles
- **Laboratoire d'atelier AI** : Atelier pratique de 2-3 heures pour convertir des applications AI en solutions déployables avec AZD
- **Meilleures pratiques AI en production** : Modèles adaptés aux entreprises pour la mise à l'échelle, la surveillance et la sécurisation des charges de travail AI
- **Guide de dépannage spécifique à l'AI** : Résolution complète des problèmes liés à Azure OpenAI, Cognitive Services et aux déploiements AI
- **Galerie de modèles AI** : Collection de modèles Azure AI Foundry avec des évaluations de complexité
- **Matériaux d'atelier** : Structure complète d'atelier avec laboratoires pratiques et matériaux de référence

#### Amélioré
- **Structure README** : Axée sur les développeurs AI avec 45 % de données d'intérêt communautaire provenant de Discord Azure AI Foundry
- **Parcours d'apprentissage** : Parcours dédié aux développeurs AI en parallèle des parcours traditionnels pour les étudiants et ingénieurs DevOps
- **Recommandations de modèles** : Modèles AI recommandés incluant azure-search-openai-demo, contoso-chat et openai-chat-app-quickstart
- **Intégration communautaire** : Support communautaire Discord amélioré avec des canaux et discussions spécifiques à l'AI

#### Focus sur la sécurité et la production
- **Modèles d'identité gérés** : Configurations d'authentification et de sécurité spécifiques à l'AI
- **Optimisation des coûts** : Suivi de l'utilisation des tokens et contrôles budgétaires pour les charges de travail AI
- **Déploiement multi-régions** : Stratégies pour le déploiement global des applications AI
- **Surveillance des performances** : Intégration de métriques spécifiques à l'AI et Application Insights

#### Qualité de la documentation
- **Structure de cours linéaire** : Progression logique des concepts de base aux modèles avancés de déploiement AI
- **URLs validées** : Tous les liens vers des dépôts externes vérifiés et accessibles
- **Références complètes** : Tous les liens internes de documentation validés et fonctionnels
- **Prêt pour la production** : Modèles de déploiement adaptés aux entreprises avec des exemples concrets

### [v2.0.0] - 09/09/2025

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle
**Cette version représente une refonte significative de la structure du dépôt et de la présentation du contenu.**

#### Ajouté
- **Cadre d'apprentissage structuré** : Toutes les pages de documentation incluent désormais des sections Introduction, Objectifs d'apprentissage et Résultats d'apprentissage
- **Système de navigation** : Ajout de liens vers les leçons précédentes/suivantes dans toute la documentation pour une progression guidée
- **Guide d'étude** : study-guide.md complet avec objectifs d'apprentissage, exercices pratiques et matériaux d'évaluation
- **Présentation professionnelle** : Suppression de tous les icônes emoji pour une meilleure accessibilité et une apparence professionnelle
- **Structure de contenu améliorée** : Organisation et flux des matériaux d'apprentissage optimisés

#### Modifié
- **Format de la documentation** : Standardisation de toute la documentation avec une structure cohérente axée sur l'apprentissage
- **Flux de navigation** : Mise en place d'une progression logique à travers tous les supports d'apprentissage
- **Présentation du contenu** : Suppression des éléments décoratifs au profit d'un format clair et professionnel
- **Structure des liens** : Mise à jour de tous les liens internes pour prendre en charge le nouveau système de navigation

#### Amélioré
- **Accessibilité** : Suppression de la dépendance aux emojis pour une meilleure compatibilité avec les lecteurs d'écran
- **Aspect professionnel** : Présentation épurée de style académique adaptée à l'apprentissage en entreprise
- **Expérience d'apprentissage** : Approche structurée avec des objectifs et des résultats clairs pour chaque leçon
- **Organisation du contenu** : Meilleure progression logique et connexion entre les sujets liés

### [v1.0.0] - 2025-09-09

#### Première version - Répertoire complet d'apprentissage AZD

#### Ajouté
- **Structure principale de la documentation**
  - Série complète de guides de démarrage
  - Documentation complète sur le déploiement et la mise en service
  - Ressources détaillées de dépannage et guides de débogage
  - Outils et procédures de validation avant déploiement

- **Module de démarrage**
  - Bases d'AZD : Concepts fondamentaux et terminologie
  - Guide d'installation : Instructions de configuration spécifiques à la plateforme
  - Guide de configuration : Configuration de l'environnement et authentification
  - Tutoriel premier projet : Apprentissage pratique étape par étape

- **Module de déploiement et de mise en service**
  - Guide de déploiement : Documentation complète du workflow
  - Guide de mise en service : Infrastructure en tant que code avec Bicep
  - Meilleures pratiques pour les déploiements en production
  - Modèles d'architecture multi-services

- **Module de validation avant déploiement**
  - Planification de la capacité : Validation de la disponibilité des ressources Azure
  - Sélection des SKU : Guide complet des niveaux de service
  - Vérifications préalables : Scripts de validation automatisés (PowerShell et Bash)
  - Outils d'estimation des coûts et de planification budgétaire

- **Module de dépannage**
  - Problèmes courants : Problèmes fréquemment rencontrés et solutions
  - Guide de débogage : Méthodologies systématiques de dépannage
  - Techniques et outils de diagnostic avancés
  - Surveillance des performances et optimisation

- **Ressources et références**
  - Fiche de commandes : Référence rapide pour les commandes essentielles
  - Glossaire : Définitions complètes des termes et acronymes
  - FAQ : Réponses détaillées aux questions courantes
  - Liens vers des ressources externes et connexions communautaires

- **Exemples et modèles**
  - Exemple d'application web simple
  - Modèle de déploiement de site web statique
  - Configuration d'application conteneurisée
  - Modèles d'intégration de base de données
  - Exemples d'architecture microservices
  - Implémentations de fonctions sans serveur

#### Fonctionnalités
- **Support multi-plateforme** : Guides d'installation et de configuration pour Windows, macOS et Linux
- **Niveaux de compétence variés** : Contenu conçu pour les étudiants et les développeurs professionnels
- **Approche pratique** : Exemples concrets et scénarios réels
- **Couverture complète** : Des concepts de base aux modèles avancés pour entreprises
- **Approche axée sur la sécurité** : Meilleures pratiques de sécurité intégrées
- **Optimisation des coûts** : Conseils pour des déploiements rentables et une gestion efficace des ressources

#### Qualité de la documentation
- **Exemples de code détaillés** : Exemples pratiques et testés
- **Instructions étape par étape** : Conseils clairs et exploitables
- **Gestion complète des erreurs** : Dépannage des problèmes courants
- **Intégration des meilleures pratiques** : Normes et recommandations de l'industrie
- **Compatibilité des versions** : À jour avec les derniers services Azure et fonctionnalités azd

## Améliorations futures prévues

### Version 3.1.0 (Prévue)
#### Expansion de la plateforme IA
- **Support multi-modèles** : Modèles d'intégration pour Hugging Face, Azure Machine Learning et modèles personnalisés
- **Cadres d'agents IA** : Modèles pour LangChain, Semantic Kernel et déploiements AutoGen
- **Modèles avancés RAG** : Options de bases de données vectorielles au-delà d'Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilité IA** : Surveillance améliorée des performances des modèles, utilisation des tokens et qualité des réponses

#### Expérience développeur
- **Extension VS Code** : Expérience de développement intégrée AZD + AI Foundry
- **Intégration GitHub Copilot** : Génération assistée par IA de modèles AZD
- **Tutoriels interactifs** : Exercices de codage pratiques avec validation automatisée pour les scénarios IA
- **Contenu vidéo** : Tutoriels vidéo complémentaires pour les apprenants visuels axés sur les déploiements IA

### Version 4.0.0 (Prévue)
#### Modèles IA pour entreprises
- **Cadre de gouvernance** : Gouvernance des modèles IA, conformité et traçabilité
- **IA multi-locataires** : Modèles pour servir plusieurs clients avec des services IA isolés
- **Déploiement IA en périphérie** : Intégration avec Azure IoT Edge et instances conteneurisées
- **IA en cloud hybride** : Modèles de déploiement multi-cloud et hybride pour les charges de travail IA

#### Fonctionnalités avancées
- **Automatisation des pipelines IA** : Intégration MLOps avec les pipelines Azure Machine Learning
- **Sécurité avancée** : Modèles de confiance zéro, points de terminaison privés et protection avancée contre les menaces
- **Optimisation des performances** : Stratégies avancées de réglage et de mise à l'échelle pour les applications IA à haut débit
- **Distribution mondiale** : Modèles de diffusion de contenu et de mise en cache en périphérie pour les applications IA

### Version 3.0.0 (Prévue) - Remplacée par la version actuelle
#### Ajouts proposés - Maintenant implémentés dans la v3.0.0
- ✅ **Contenu axé sur l'IA** : Intégration complète d'Azure AI Foundry (Terminé)
- ✅ **Tutoriels interactifs** : Atelier pratique IA (Terminé)
- ✅ **Module de sécurité avancée** : Modèles de sécurité spécifiques à l'IA (Terminé)
- ✅ **Optimisation des performances** : Stratégies de réglage des charges de travail IA (Terminé)

### Version 2.1.0 (Prévue) - Partiellement implémentée dans la v3.0.0
#### Améliorations mineures - Certaines terminées dans la version actuelle
- ✅ **Exemples supplémentaires** : Scénarios de déploiement axés sur l'IA (Terminé)
- ✅ **FAQ étendue** : Questions spécifiques à l'IA et dépannage (Terminé)
- **Intégration des outils** : Guides améliorés d'intégration des IDE et éditeurs
- ✅ **Extension de la surveillance** : Modèles de surveillance et d'alerte spécifiques à l'IA (Terminé)

#### Toujours prévu pour une version future
- **Documentation adaptée aux mobiles** : Conception réactive pour l'apprentissage mobile
- **Accès hors ligne** : Packages de documentation téléchargeables
- **Intégration IDE améliorée** : Extension VS Code pour les workflows AZD + IA
- **Tableau de bord communautaire** : Suivi en temps réel des métriques communautaires et des contributions

## Contribuer au journal des modifications

### Signalement des modifications
Lors de la contribution à ce dépôt, veuillez vous assurer que les entrées du journal des modifications incluent :

1. **Numéro de version** : Suivant la version sémantique (majeur.mineur.correctif)
2. **Date** : Date de publication ou de mise à jour au format AAAA-MM-JJ
3. **Catégorie** : Ajouté, Modifié, Obsolète, Supprimé, Corrigé, Sécurité
4. **Description claire** : Description concise des modifications
5. **Évaluation de l'impact** : Comment les modifications affectent les utilisateurs existants

### Catégories de modifications

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
- Améliorations ou corrections liées à la sécurité
- Mises à jour des meilleures pratiques de sécurité
- Résolution des vulnérabilités de sécurité

### Directives de version sémantique

#### Version majeure (X.0.0)
- Modifications importantes nécessitant une action de l'utilisateur
- Restructuration significative du contenu ou de l'organisation
- Changements modifiant l'approche ou la méthodologie fondamentale

#### Version mineure (X.Y.0)
- Nouvelles fonctionnalités ou ajouts de contenu
- Améliorations compatibles avec les versions précédentes
- Exemples, outils ou ressources supplémentaires

#### Version de correctif (X.Y.Z)
- Corrections de bugs et erreurs
- Améliorations mineures du contenu existant
- Clarifications et petites améliorations

## Retour d'information et suggestions de la communauté

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d'apprentissage :

### Comment fournir des retours
- **Problèmes GitHub** : Signalez des problèmes ou proposez des améliorations (problèmes spécifiques à l'IA bienvenus)
- **Discussions Discord** : Partagez des idées et engagez-vous avec la communauté Azure AI Foundry
- **Pull Requests** : Contribuez directement à l'amélioration du contenu, en particulier des modèles et guides IA
- **Discord Azure AI Foundry** : Participez au canal #Azure pour des discussions AZD + IA
- **Forums communautaires** : Participez à des discussions plus larges sur les développeurs Azure

### Catégories de retours
- **Exactitude du contenu IA** : Corrections sur l'intégration et le déploiement des services IA
- **Expérience d'apprentissage** : Suggestions pour améliorer le flux d'apprentissage des développeurs IA
- **Contenu IA manquant** : Demandes de modèles, schémas ou exemples IA supplémentaires
- **Accessibilité** : Améliorations pour répondre aux besoins d'apprentissage diversifiés
- **Intégration des outils IA** : Suggestions pour une meilleure intégration des workflows de développement IA
- **Modèles IA en production** : Demandes de modèles de déploiement IA pour entreprises

### Engagement de réponse
- **Réponse aux problèmes** : Sous 48 heures pour les problèmes signalés
- **Demandes de fonctionnalités** : Évaluation sous une semaine
- **Contributions communautaires** : Revue sous une semaine
- **Problèmes de sécurité** : Priorité immédiate avec réponse accélérée

## Calendrier de maintenance

### Mises à jour régulières
- **Revues mensuelles** : Validation de l'exactitude du contenu et des liens
- **Mises à jour trimestrielles** : Ajouts et améliorations majeurs de contenu
- **Revues semestrielles** : Restructuration et amélioration complètes
- **Versions annuelles** : Mises à jour majeures avec améliorations significatives

### Surveillance et assurance qualité
- **Tests automatisés** : Validation régulière des exemples de code et des liens
- **Intégration des retours communautaires** : Incorporation régulière des suggestions des utilisateurs
- **Mises à jour technologiques** : Alignement avec les derniers services Azure et versions azd
- **Audits d'accessibilité** : Revue régulière des principes de conception inclusive

## Politique de support des versions

### Support des versions actuelles
- **Dernière version majeure** : Support complet avec mises à jour régulières
- **Version majeure précédente** : Mises à jour de sécurité et correctifs critiques pendant 12 mois
- **Versions anciennes** : Support communautaire uniquement, pas de mises à jour officielles

### Guide de migration
Lors de la publication de nouvelles versions majeures, nous fournissons :
- **Guides de migration** : Instructions de transition étape par étape
- **Notes de compatibilité** : Détails sur les changements majeurs
- **Support des outils** : Scripts ou utilitaires pour faciliter la migration
- **Support communautaire** : Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon précédente** : [Guide d'étude](resources/study-guide.md)
- **Leçon suivante** : Retour au [README principal](README.md)

**Restez informé** : Suivez ce dépôt pour recevoir des notifications sur les nouvelles versions et les mises à jour importantes des supports d'apprentissage.

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.