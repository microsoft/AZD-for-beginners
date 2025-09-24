<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7651a7fb2b5e367812bf01aa209a3612",
  "translation_date": "2025-09-24T09:03:11+00:00",
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

Après avoir examiné les entrées du journal des modifications, vous serez capable de :
- Identifier les nouveaux contenus et ressources disponibles pour l'apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d'apprentissage en fonction des matériaux les plus récents
- Contribuer avec des retours et des suggestions pour les futures améliorations

## Historique des versions

### [v3.3.0] - 24 septembre 2025

#### Matériaux de workshop enrichis et expérience d'apprentissage interactive
**Cette version introduit des matériaux de workshop complets avec des guides interactifs basés sur le navigateur et des parcours d'apprentissage structurés.**

#### Ajouté
- **🎥 Guide interactif de workshop** : Expérience de workshop basée sur le navigateur avec aperçu via MkDocs
- **📝 Instructions structurées de workshop** : Parcours d'apprentissage guidé en 7 étapes, de la découverte à la personnalisation
  - 0-Introduction : Vue d'ensemble et configuration du workshop
  - 1-Select-AI-Template : Processus de découverte et sélection de modèles
  - 2-Validate-AI-Template : Procédures de déploiement et validation
  - 3-Deconstruct-AI-Template : Compréhension de l'architecture des modèles
  - 4-Configure-AI-Template : Configuration et personnalisation
  - 5-Customize-AI-Template : Modifications avancées et itérations
  - 6-Teardown-Infrastructure : Nettoyage et gestion des ressources
  - 7-Wrap-up : Résumé et prochaines étapes
- **🛠️ Outils de workshop** : Configuration MkDocs avec thème Material pour une expérience d'apprentissage améliorée
- **🎯 Parcours d'apprentissage pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces** : Configuration fluide de l'environnement de développement

#### Amélioré
- **Laboratoire de workshop AI** : Étendu avec une expérience d'apprentissage structurée de 2 à 3 heures
- **Documentation du workshop** : Présentation professionnelle avec navigation et aides visuelles
- **Progression d'apprentissage** : Instructions claires étape par étape, de la sélection de modèles au déploiement en production
- **Expérience développeur** : Outils intégrés pour des workflows de développement simplifiés

#### Optimisé
- **Accessibilité** : Interface basée sur le navigateur avec recherche, fonctionnalité de copie et bascule de thème
- **Apprentissage autonome** : Structure flexible du workshop adaptée à différents rythmes d'apprentissage
- **Application pratique** : Scénarios réels de déploiement de modèles AI
- **Intégration communautaire** : Intégration Discord pour le support et la collaboration lors des workshops

#### Fonctionnalités du workshop
- **Recherche intégrée** : Découverte rapide de mots-clés et leçons
- **Copie des blocs de code** : Fonctionnalité de copie en survol pour tous les exemples de code
- **Bascule de thème** : Support mode sombre/clair selon les préférences
- **Actifs visuels** : Captures d'écran et diagrammes pour une meilleure compréhension
- **Intégration d'aide** : Accès direct à Discord pour le support communautaire

### [v3.2.0] - 17 septembre 2025

#### Restructuration majeure de la navigation et système d'apprentissage par chapitres
**Cette version introduit une structure d'apprentissage par chapitres avec navigation améliorée dans tout le dépôt.**

#### Ajouté
- **📚 Système d'apprentissage par chapitres** : Restructuration complète du cours en 8 chapitres progressifs
  - Chapitre 1 : Fondations & démarrage rapide (⭐ - 30-45 min)
  - Chapitre 2 : Développement orienté AI (⭐⭐ - 1-2 heures)
  - Chapitre 3 : Configuration & authentification (⭐⭐ - 45-60 min)
  - Chapitre 4 : Infrastructure en tant que code & déploiement (⭐⭐⭐ - 1-1,5 heures)
  - Chapitre 5 : Solutions AI multi-agents (⭐⭐⭐⭐ - 2-3 heures)
  - Chapitre 6 : Validation & planification pré-déploiement (⭐⭐ - 1 heure)
  - Chapitre 7 : Résolution de problèmes & débogage (⭐⭐ - 1-1,5 heures)
  - Chapitre 8 : Modèles de production & entreprise (⭐⭐⭐⭐ - 2-3 heures)
- **📚 Système de navigation complet** : En-têtes et pieds de page de navigation cohérents dans toute la documentation
- **🎯 Suivi de progression** : Liste de vérification de la complétion du cours et système de vérification d'apprentissage
- **🗺️ Orientation du parcours d'apprentissage** : Points d'entrée clairs pour différents niveaux d'expérience et objectifs
- **🔗 Navigation croisée** : Chapitres liés et prérequis clairement indiqués

#### Amélioré
- **Structure du README** : Transformé en plateforme d'apprentissage structurée avec organisation par chapitres
- **Navigation dans la documentation** : Chaque page inclut désormais le contexte du chapitre et des indications de progression
- **Organisation des modèles** : Exemples et modèles associés aux chapitres d'apprentissage appropriés
- **Intégration des ressources** : Aides-mémoire, FAQ et guides d'étude connectés aux chapitres pertinents
- **Intégration des workshops** : Laboratoires pratiques associés à plusieurs objectifs d'apprentissage par chapitre

#### Modifié
- **Progression d'apprentissage** : Passage d'une documentation linéaire à un apprentissage flexible par chapitres
- **Placement de la configuration** : Guide de configuration repositionné en Chapitre 3 pour un meilleur flux d'apprentissage
- **Intégration du contenu AI** : Meilleure intégration du contenu spécifique à l'AI tout au long du parcours d'apprentissage
- **Contenu de production** : Modèles avancés consolidés dans le Chapitre 8 pour les apprenants en entreprise

#### Optimisé
- **Expérience utilisateur** : Indicateurs de progression clairs et navigation par chapitres
- **Accessibilité** : Modèles de navigation cohérents pour une traversée plus facile du cours
- **Présentation professionnelle** : Structure de cours de style universitaire adaptée à la formation académique et en entreprise
- **Efficacité d'apprentissage** : Temps réduit pour trouver le contenu pertinent grâce à une organisation améliorée

#### Mise en œuvre technique
- **En-têtes de navigation** : Navigation par chapitres standardisée dans plus de 40 fichiers de documentation
- **Navigation en pied de page** : Indicateurs de progression cohérents et de complétion des chapitres
- **Liens croisés** : Système de liaison interne complet connectant les concepts liés
- **Cartographie des chapitres** : Modèles et exemples clairement associés aux objectifs d'apprentissage

#### Amélioration du guide d'étude
- **📚 Objectifs d'apprentissage complets** : Guide d'étude restructuré pour s'aligner sur le système en 8 chapitres
- **🎯 Évaluation par chapitre** : Chaque chapitre inclut des objectifs d'apprentissage spécifiques et des exercices pratiques
- **📋 Suivi de progression** : Programme d'apprentissage hebdomadaire avec résultats mesurables et listes de vérification de complétion
- **❓ Questions d'évaluation** : Questions de validation des connaissances pour chaque chapitre avec résultats professionnels
- **🛠️ Exercices pratiques** : Activités pratiques avec scénarios réels de déploiement et résolution de problèmes
- **📊 Progression des compétences** : Avancement clair des concepts de base aux modèles d'entreprise avec focus sur le développement de carrière
- **🎓 Cadre de certification** : Résultats de développement professionnel et système de reconnaissance communautaire
- **⏱️ Gestion du calendrier** : Plan d'apprentissage structuré sur 10 semaines avec validation des étapes clés

### [v3.1.0] - 17 septembre 2025

#### Solutions AI multi-agents améliorées
**Cette version améliore la solution multi-agents pour le commerce de détail avec une meilleure nomenclature des agents et une documentation enrichie.**

#### Modifié
- **Terminologie multi-agents** : Remplacement de "agent Cora" par "agent Client" dans toute la solution multi-agents pour le commerce de détail pour une meilleure compréhension
- **Architecture des agents** : Mise à jour de toute la documentation, des modèles ARM et des exemples de code pour utiliser une nomenclature cohérente "agent Client"
- **Exemples de configuration** : Modernisation des modèles de configuration des agents avec des conventions de nommage mises à jour
- **Cohérence de la documentation** : Garantie que toutes les références utilisent des noms d'agents professionnels et descriptifs

#### Amélioré
- **Package de modèles ARM** : Mise à jour du modèle retail-multiagent-arm-template avec des références à l'agent Client
- **Diagrammes d'architecture** : Rafraîchissement des diagrammes Mermaid avec la nomenclature mise à jour des agents
- **Exemples de code** : Les classes Python et exemples d'implémentation utilisent désormais la nomenclature CustomerAgent
- **Variables d'environnement** : Mise à jour de tous les scripts de déploiement pour utiliser les conventions CUSTOMER_AGENT_NAME

#### Optimisé
- **Expérience développeur** : Rôles et responsabilités des agents plus clairs dans la documentation
- **Prêt pour la production** : Meilleur alignement avec les conventions de nommage en entreprise
- **Supports d'apprentissage** : Nomenclature des agents plus intuitive pour les besoins éducatifs
- **Utilisabilité des modèles** : Compréhension simplifiée des fonctions des agents et des modèles de déploiement

#### Détails techniques
- Mise à jour des diagrammes d'architecture Mermaid avec des références CustomerAgent
- Remplacement des noms de classes CoraAgent par CustomerAgent dans les exemples Python
- Modification des configurations JSON des modèles ARM pour utiliser le type d'agent "client"
- Mise à jour des variables d'environnement de CORA_AGENT_* à CUSTOMER_AGENT_*
- Rafraîchissement de toutes les commandes de déploiement et configurations de conteneurs

### [v3.0.0] - 12 septembre 2025

#### Changements majeurs - Focus sur les développeurs AI et intégration Azure AI Foundry
**Cette version transforme le dépôt en une ressource complète d'apprentissage axée sur l'AI avec intégration Azure AI Foundry.**

#### Ajouté
- **🤖 Parcours d'apprentissage AI-First** : Restructuration complète priorisant les développeurs et ingénieurs AI
- **Guide d'intégration Azure AI Foundry** : Documentation complète pour connecter AZD aux services Azure AI Foundry
- **Modèles de déploiement AI** : Guide détaillé couvrant la sélection, la configuration et les stratégies de déploiement en production
- **Laboratoire de workshop AI** : Workshop pratique de 2 à 3 heures pour convertir des applications AI en solutions déployables via AZD
- **Meilleures pratiques AI en production** : Modèles prêts pour l'entreprise pour le scaling, la surveillance et la sécurisation des charges AI
- **Guide de dépannage spécifique à l'AI** : Résolution complète des problèmes liés à Azure OpenAI, Cognitive Services et déploiements AI
- **Galerie de modèles AI** : Collection de modèles Azure AI Foundry avec évaluations de complexité
- **Matériaux de workshop** : Structure complète de workshop avec laboratoires pratiques et matériaux de référence

#### Amélioré
- **Structure du README** : Axée sur les développeurs AI avec 45 % de données d'intérêt communautaire issues de Discord Azure AI Foundry
- **Parcours d'apprentissage** : Parcours dédié aux développeurs AI en parallèle des parcours traditionnels pour étudiants et ingénieurs DevOps
- **Recommandations de modèles** : Modèles AI recommandés incluant azure-search-openai-demo, contoso-chat et openai-chat-app-quickstart
- **Intégration communautaire** : Support communautaire Discord amélioré avec des canaux spécifiques à l'AI et discussions

#### Focus sur la sécurité et la production
- **Modèles d'identité gérée** : Configurations d'authentification et de sécurité spécifiques à l'AI
- **Optimisation des coûts** : Suivi de l'utilisation des tokens et contrôles budgétaires pour les charges AI
- **Déploiement multi-régions** : Stratégies pour le déploiement global des applications AI
- **Surveillance des performances** : Intégration de métriques spécifiques à l'AI et Application Insights

#### Qualité de la documentation
- **Structure de cours linéaire** : Progression logique des concepts de base aux modèles avancés de déploiement AI
- **URLs validées** : Tous les liens externes du dépôt vérifiés et accessibles
- **Références complètes** : Tous les liens internes de la documentation validés et fonctionnels
- **Prêt pour la production** : Modèles de déploiement en entreprise avec exemples réels

### [v2.0.0] - 9 septembre 2025

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle
**Cette version représente une refonte significative de la structure du dépôt et de la présentation du contenu.**

#### Ajouté
- **Cadre d'apprentissage structuré** : Toutes les pages de documentation incluent désormais des sections Introduction, Objectifs d'apprentissage et Résultats d'apprentissage
- **Système de navigation** : Ajout de liens "Précédent/Suivant" dans toute la documentation pour une progression guidée
- **Guide d'étude** : study-guide.md complet avec objectifs d'apprentissage, exercices pratiques et matériaux d'évaluation
- **Présentation professionnelle** : Suppression de tous les icônes emoji pour une meilleure accessibilité et une apparence professionnelle
- **Structure de contenu améliorée** : Organisation et flux des supports d'apprentissage optimisés

#### Modifié
- **Format de la documentation** : Standardisation de toute la documentation avec une structure cohérente axée sur l'apprentissage
- **Flux de navigation** : Mise en œuvre d'une progression logique dans tous les supports d'apprentissage
- **Présentation du contenu** : Suppression des éléments décoratifs au profit d'un format clair et professionnel
- **Structure des liens** : Mise à jour de tous les liens internes pour prendre en charge le nouveau système de navigation

#### Optimisé
- **Accessibilité** : Suppression des dépendances aux emojis pour une meilleure compatibilité avec les lecteurs d'écran
- **Apparence professionnelle** : Présentation propre de style académique adaptée à l'apprentissage en entreprise
- **Expérience d'apprentissage** : Approche structurée avec des objectifs et résultats clairs pour chaque leçon
- **Organisation du contenu** : Meilleur flux logique et connexion entre les sujets liés

### [v1.0.0] - 9 septembre 2025

#### Version initiale - Dépôt complet d'apprentissage AZD

#### Ajouté
- **Structure de documentation principale**
  - Série complète de guides de démarrage
  - Documentation complète sur le déploiement et la provision
  - Ressources détaillées de dépannage et guides de débogage
  - Outils et procédures de validation pré-déploiement

- **Module de démarrage**
  - Bases d'AZD : Concepts et terminologie clés
  - Guide d'installation : Instructions de configuration spécifiques à la plateforme
  - Guide de configuration : Configuration de l'environnement et authentification
  - Tutoriel premier projet : Apprentissage pratique étape par étape

- **Module de déploiement et provision**
  - Guide de déploiement : Documentation complète du workflow
  - Guide de provision : Infrastructure en tant que code avec Bicep
  - Meilleures pratiques pour les déploiements en production
  - Modèles d'architecture multi-services

- **Module de validation pré-déploiement**
  - Planification de capacité : Validation de la disponibilité des ressources Azure
  - Sélection de SKU : Guide complet des niveaux de service
  - Vérifications préalables : Scripts de validation automatisés (PowerShell et Bash)
  - Outils d'estimation des coûts et de planification budgétaire

- **Module de dépannage**
  - Problèmes courants : Problèmes fréquemment rencontrés et solutions
  - Guide de débogage : Méthodologies systématiques de dépannage
  - Techniques et outils de diagnostic avancés
  - Surveillance des performances et optimisation

- **Ressources et références**
  - Aide-mémoire de commandes : Référence rapide pour les commandes essentielles
  - Glossaire : Définitions complètes des termes et acronymes
  - FAQ : Réponses détaillées aux questions fréquentes
  - Liens vers des ressources externes et connexions communautaires

- **Exemples et modèles**
  - Exemple d'application web simple
  - Modèle de déploiement de site web statique
  - Configuration d'application conteneurisée
  - Modèles d'intégration de base de données
  - Exemples d'architecture de microservices
  - Implémentations de fonctions sans serveur

#### Fonctionnalités
- **Support Multi-Plateforme** : Guides d'installation et de configuration pour Windows, macOS et Linux
- **Niveaux de Compétence Variés** : Contenu conçu pour les étudiants et les développeurs professionnels
- **Approche Pratique** : Exemples concrets et scénarios réels
- **Couverture Complète** : Des concepts de base aux modèles avancés pour les entreprises
- **Priorité à la Sécurité** : Meilleures pratiques de sécurité intégrées tout au long
- **Optimisation des Coûts** : Conseils pour des déploiements économiques et une gestion efficace des ressources

#### Qualité de la Documentation
- **Exemples de Code Détaillés** : Échantillons de code pratiques et testés
- **Instructions Étape par Étape** : Conseils clairs et exploitables
- **Gestion Complète des Erreurs** : Résolution des problèmes courants
- **Intégration des Meilleures Pratiques** : Normes et recommandations de l'industrie
- **Compatibilité des Versions** : À jour avec les derniers services Azure et fonctionnalités azd

## Améliorations Futures Planifiées

### Version 3.1.0 (Planifiée)
#### Expansion de la Plateforme IA
- **Support Multi-Modèles** : Modèles d'intégration pour Hugging Face, Azure Machine Learning et modèles personnalisés
- **Frameworks d'Agents IA** : Modèles pour les déploiements LangChain, Semantic Kernel et AutoGen
- **Modèles RAG Avancés** : Options de bases de données vectorielles au-delà de Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilité IA** : Surveillance améliorée des performances des modèles, de l'utilisation des tokens et de la qualité des réponses

#### Expérience Développeur
- **Extension VS Code** : Expérience de développement intégrée AZD + AI Foundry
- **Intégration GitHub Copilot** : Génération assistée par IA de modèles AZD
- **Tutoriels Interactifs** : Exercices pratiques avec validation automatisée pour les scénarios IA
- **Contenu Vidéo** : Tutoriels vidéo complémentaires pour les apprenants visuels axés sur les déploiements IA

### Version 4.0.0 (Planifiée)
#### Modèles IA pour Entreprises
- **Cadre de Gouvernance** : Gouvernance des modèles IA, conformité et traçabilité
- **IA Multi-Tenants** : Modèles pour servir plusieurs clients avec des services IA isolés
- **Déploiement IA en Périphérie** : Intégration avec Azure IoT Edge et instances de conteneurs
- **IA Hybride Cloud** : Modèles de déploiement multi-cloud et hybride pour les charges IA

#### Fonctionnalités Avancées
- **Automatisation des Pipelines IA** : Intégration MLOps avec les pipelines Azure Machine Learning
- **Sécurité Avancée** : Modèles de confiance zéro, points de terminaison privés et protection contre les menaces avancées
- **Optimisation des Performances** : Stratégies avancées de réglage et de mise à l'échelle pour les applications IA à haut débit
- **Distribution Globale** : Modèles de diffusion de contenu et de mise en cache en périphérie pour les applications IA

### Version 3.0.0 (Planifiée) - Supplantée par la Version Actuelle
#### Ajouts Proposés - Maintenant Implémentés dans la v3.0.0
- ✅ **Contenu Axé sur l'IA** : Intégration complète de Azure AI Foundry (Terminé)
- ✅ **Tutoriels Interactifs** : Atelier pratique sur l'IA (Terminé)
- ✅ **Module de Sécurité Avancée** : Modèles de sécurité spécifiques à l'IA (Terminé)
- ✅ **Optimisation des Performances** : Stratégies de réglage des charges IA (Terminé)

### Version 2.1.0 (Planifiée) - Partiellement Implémentée dans la v3.0.0
#### Améliorations Mineures - Certaines Terminées dans la Version Actuelle
- ✅ **Exemples Supplémentaires** : Scénarios de déploiement axés sur l'IA (Terminé)
- ✅ **FAQ Étendue** : Questions spécifiques à l'IA et résolution des problèmes (Terminé)
- **Intégration des Outils** : Guides améliorés pour l'intégration des IDE et éditeurs
- ✅ **Extension de la Surveillance** : Modèles de surveillance et d'alerte spécifiques à l'IA (Terminé)

#### Toujours Planifié pour une Version Future
- **Documentation Adaptée aux Mobiles** : Design réactif pour l'apprentissage mobile
- **Accès Hors Ligne** : Packages de documentation téléchargeables
- **Intégration IDE Améliorée** : Extension VS Code pour les workflows AZD + IA
- **Tableau de Bord Communautaire** : Suivi en temps réel des métriques communautaires et des contributions

## Contribution au Journal des Modifications

### Signalement des Changements
Lors de la contribution à ce dépôt, assurez-vous que les entrées du journal des modifications incluent :

1. **Numéro de Version** : Suivant la version sémantique (majeur.mineur.correctif)
2. **Date** : Date de publication ou de mise à jour au format AAAA-MM-JJ
3. **Catégorie** : Ajouté, Modifié, Obsolète, Supprimé, Corrigé, Sécurité
4. **Description Claire** : Description concise de ce qui a changé
5. **Évaluation de l'Impact** : Comment les changements affectent les utilisateurs existants

### Catégories de Changements

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
- Informations obsolètes ou approches dépassées
- Contenu redondant ou consolidé

#### Corrigé
- Corrections d'erreurs dans la documentation ou le code
- Résolution de problèmes ou de bugs signalés
- Améliorations de l'exactitude ou de la fonctionnalité

#### Sécurité
- Améliorations ou corrections liées à la sécurité
- Mises à jour des meilleures pratiques de sécurité
- Résolution des vulnérabilités de sécurité

### Directives de Version Sémantique

#### Version Majeure (X.0.0)
- Changements majeurs nécessitant une action de l'utilisateur
- Restructuration significative du contenu ou de l'organisation
- Modifications altérant l'approche ou la méthodologie fondamentale

#### Version Mineure (X.Y.0)
- Nouvelles fonctionnalités ou ajouts de contenu
- Améliorations compatibles avec les versions précédentes
- Exemples, outils ou ressources supplémentaires

#### Version Corrective (X.Y.Z)
- Corrections de bugs et ajustements
- Améliorations mineures du contenu existant
- Clarifications et petites améliorations

## Retour et Suggestions de la Communauté

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d'apprentissage :

### Comment Fournir des Retours
- **Problèmes GitHub** : Signalez des problèmes ou proposez des améliorations (problèmes spécifiques à l'IA bienvenus)
- **Discussions Discord** : Partagez vos idées et engagez-vous avec la communauté Azure AI Foundry
- **Pull Requests** : Apportez des améliorations directes au contenu, en particulier aux modèles et guides IA
- **Discord Azure AI Foundry** : Participez au canal #Azure pour les discussions AZD + IA
- **Forums Communautaires** : Participez aux discussions plus larges des développeurs Azure

### Catégories de Retours
- **Exactitude du Contenu IA** : Corrections sur l'intégration et le déploiement des services IA
- **Expérience d'Apprentissage** : Suggestions pour améliorer le flux d'apprentissage des développeurs IA
- **Contenu IA Manquant** : Demandes de modèles, de schémas ou d'exemples IA supplémentaires
- **Accessibilité** : Améliorations pour répondre aux besoins d'apprentissage diversifiés
- **Intégration des Outils IA** : Suggestions pour une meilleure intégration des workflows de développement IA
- **Modèles IA en Production** : Demandes de modèles de déploiement IA pour entreprises

### Engagement de Réponse
- **Réponse aux Problèmes** : Sous 48 heures pour les problèmes signalés
- **Demandes de Fonctionnalités** : Évaluation sous une semaine
- **Contributions Communautaires** : Revue sous une semaine
- **Problèmes de Sécurité** : Priorité immédiate avec réponse accélérée

## Calendrier de Maintenance

### Mises à Jour Régulières
- **Revues Mensuelles** : Validation de l'exactitude du contenu et des liens
- **Mises à Jour Trimestrielles** : Ajouts et améliorations majeurs du contenu
- **Revues Semestrielles** : Restructuration et amélioration complètes
- **Versions Annuelles** : Mises à jour majeures avec améliorations significatives

### Surveillance et Assurance Qualité
- **Tests Automatisés** : Validation régulière des exemples de code et des liens
- **Intégration des Retours Communautaires** : Incorporation régulière des suggestions des utilisateurs
- **Mises à Jour Technologiques** : Alignement avec les derniers services Azure et versions azd
- **Audits d'Accessibilité** : Revue régulière des principes de design inclusif

## Politique de Support des Versions

### Support des Versions Actuelles
- **Dernière Version Majeure** : Support complet avec mises à jour régulières
- **Version Majeure Précédente** : Mises à jour de sécurité et corrections critiques pendant 12 mois
- **Versions Anciennes** : Support communautaire uniquement, sans mises à jour officielles

### Guide de Migration
Lors de la publication de versions majeures, nous fournissons :
- **Guides de Migration** : Instructions de transition étape par étape
- **Notes de Compatibilité** : Détails sur les changements majeurs
- **Support des Outils** : Scripts ou utilitaires pour faciliter la migration
- **Support Communautaire** : Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon Précédente** : [Guide d'Étude](resources/study-guide.md)
- **Leçon Suivante** : Retour au [README Principal](README.md)

**Restez Informé** : Suivez ce dépôt pour recevoir des notifications sur les nouvelles versions et les mises à jour importantes des supports d'apprentissage.

---

