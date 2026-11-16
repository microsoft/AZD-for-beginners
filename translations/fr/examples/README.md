# Exemples — Source en anglais et exemples Azure

Ce sont des exemples d’apprentissage, pas des applications certifiées pour la production. Lisez les
prérequis, limitations, coûts et instructions de nettoyage de chaque exemple avant
d’exécuter les commandes. La disponibilité et les quotas Azure doivent être vérifiés dans votre abonnement.

- [Page d’accueil du cours](../README.md)
- [Installation](../docs/chapter-01-foundation/installation.md)
- [Dépannage](../docs/chapter-07-troubleshooting/common-issues.md)

## Ce qui existe réellement localement

Il y a **quatre exemples d’application** et **un échafaudage d’infrastructure** :

| Exemple | Implémentation locale | Objectif pédagogique | Niveau |
|---|---|---|---|
| [API Flask simple](../../../examples/container-app/simple-flask-api) | API CRUD Flask, Dockerfile, Bicep, `azure.yaml` | Déploiement de conteneur, sondes, journaux | Débutant |
| [Microservices à deux services](../../../examples/container-app/microservices) | Passerelle Node.js et service produit en Python en lecture seule, Dockerfiles, Bicep, `azure.yaml` | Communication HTTPS interne, montée en charge indépendante | Intermédiaire |
| [Application base de données](../../../examples/database-app) | API lecture Flask, Azure SQL, App Service, Bicep, `azure.yaml` | Connectivité SQL, initialisation, journaux | Intermédiaire |
| [Chat Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python locale, Azure OpenAI et Key Vault Bicep, infrastructure uniquement `azure.yaml` | Provisionnement de modèle, historique du chat, estimation des jetons | Intermédiaire |
| [Infrastructure retail](../../../examples/retail-multiagent-arm-template) | Modèle ARM, paramètres, script de déploiement Bash ; **containeurs hello-world uniquement** | Infrastructure pour une future application multi-agent | Avancé |

Le [scénario retail](retail-scenario.md) est un **plan d’architecture**, pas une
implémentation complète multi-agent. Aucun code d’agent retail, interface de chat, API de
routeur, pipeline de données de recherche, CLI d’évaluation, basculement automatique ou
renforcement pour la production n’est inclus. Ceux-ci doivent être conçus, construits et testés séparément.

Le [aperçu des microservices](microservices/README.md) pointe vers l’exemple fonctionnel
à deux services ; ce n’est pas un autre répertoire de déploiement.

## Parcours d’apprentissage recommandé

1. Déployez l’API Flask et vérifiez `/health` et les opérations CRUD.
2. Déployez l’application base de données et vérifiez ses cinq produits préajoutés.
3. Déployez l’exemple à deux services et vérifiez les requêtes passerelle-vers-produit.
4. Approvisionnez les ressources de chat et lancez l’interface CLI **localement**.
5. Étudiez le plan retail après avoir terminé les exemples fonctionnels.

Prévoyez environ 30 à 60 minutes par exemple d’application, incluant les prérequis et la
vérification. L’implémentation retail est un projet de développement séparé, pas un
atelier de 30 minutes. La lecture de son architecture prend environ 2 à 3 heures ; l’implémentation
et la mise en production peuvent prendre nettement plus de temps que les
80 à 120 heures de développement illustratives indiquées dans le guide.

## Démarrage rapide

Depuis la racine du dépôt, pour le premier exemple de conteneur :

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Attendu : HTTP 200 et JSON contenant `"status": "healthy"`.
Docker doit être en fonctionnement pour la construction locale du conteneur.

Pour le chat, suivez le [README chat](azure-openai-chat/README.md) : utilisez
`azd provision`, chargez la clé API depuis Key Vault dans le shell actuel, installez
`src/requirements.txt`, et exécutez `python src/chat.py`. Il n’y a pas de service de chat hébergé.

Pour le retail, utilisez le [guide ARM](retail-multiagent-arm-template/README.md).
Il ne comporte pas de `azure.yaml` et n’est **pas** déployé ou supprimé par `azd up`/`azd down`.

## Coûts et limitations

- Tous les déploiements créent des ressources Azure facturables. Le scale-to-zero ne s’applique qu’au
  calcul applicatif ; il ne supprime pas les coûts de registre, base de données, stockage, recherche ou journaux.
- Les prix exacts dépendent de la région, devise, trafic, modèle/SKU, et rétention.
  Utilisez le [calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/)
  avant le déploiement et configurez un budget dans Azure Cost Management.
- Les données CRUD Flask sont en mémoire, limitées par défaut à un seul worker et au plus une réplique.
  Elles disparaissent au redémarrage ou scale-to-zero. Ce n’est pas un stockage durable.
- Le microservice produit expose uniquement des endpoints GET. Aucun service de commande, utilisateur,
  base de données, Service Bus, C# ou Go n’est inclus.
- Les ressources Application Insights n’instrumentent pas automatiquement chaque application.
  Reportez-vous à chaque exemple pour la télémétrie effectivement émise.
- Les exemples n’implémentent pas l’authentification applicative. Ajoutez identité, autorisation,
  stockage persistant, contrôles réseau, tests et procédures opérationnelles avant la production.

## Exemples Azure externes — clonez séparément

Ces liens renvoient à des dépôts séparés, **pas des exemples locaux**.
Leurs mainteneurs gèrent les instructions d’installation, implémentation, dépendances et coûts.

| Exemple | Objectif |
|---|---|
| [todo Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) | Application Node.js avec base de données |
| [todo C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) | C# et Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Frontend statique avec fonctions C# et SQL |
| [Fonctions Python + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Application serverless Python |
| [API magasin Container Apps](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend magasin conteneurisé |
| [Démarrage rapide chat IA](https://github.com/Azure-Samples/get-started-with-ai-chat) | Application de chat IA |
| [Démarrage rapide agents IA](https://github.com/Azure-Samples/get-started-with-ai-agents) | Application agent |
| [Démo Recherche + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG avec recherche et citations |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Exemple d’IA conversationnelle |
| [Java sur Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microservices Java |

Découvrez plus de projets dans la [galerie de modèles AZD](https://azure.github.io/awesome-azd/).
Ne présumez pas qu’un projet externe supporte `azd` sans vérifier son README actuel.

## Structure du dépôt

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Il n’y a pas de `configurations/`, `scripts/` ou répertoire de tests partagé promis par
cet index. Les fichiers réels et idées d’extensions optionnelles sont identifiés dans chaque guide.

## Nettoyage

Pour les quatre exemples AZD, lancez ceci **depuis le répertoire de l’exemple sélectionné** :

```bash
azd down
```

Examinez la demande de suppression. Pour retail, supprimez uniquement le groupe de ressources dédié
que vous avez créé, en suivant les instructions de son guide ARM. Vérifiez Azure Cost Management
après le nettoyage ; les données de facturation peuvent arriver plus tard.

## Contribution

Incluez la source, l’infrastructure, la configuration de déploiement, les étapes d’installation et
de vérification actionnables, limitations et instructions de nettoyage avec chaque exemple d’application.
Identifiez explicitement le matériel d’architecture uniquement et les extraits incomplets.
Ne prétendez pas à la préparation à la production sans tests de déploiement, fonctionnels et opérationnels.

[FAQ](../resources/faq.md) · [Guide d’étude](../resources/study-guide.md) ·
[Signaler un problème](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->