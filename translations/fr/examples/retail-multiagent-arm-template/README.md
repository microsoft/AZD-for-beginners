# Infrastructure de Scaffold Multi-Agent pour le Commerce de Détail

**Exemple d'architecture avancée — pas une application multi-agent fonctionnelle.**

[Accueil du cours](../../README.md) ·
[Chapitre 5](../../docs/chapter-05-multi-agent/README.md) ·
[Plan d'architecture](../retail-scenario.md)

## Ce que cela déploie

Ce répertoire contient un modèle ARM, des paramètres et un script de déploiement Bash.
Il n'y a **aucun `azure.yaml` ni source d'application retail**.

| Ressource | État réel après provisionnement |
|---|---|
| Compte Azure OpenAI principal | déploiement `gpt-4.1-chat` utilisant `gpt-4.1` version `2025-04-14`, `GlobalStandard` |
| Compte OpenAI secondaire (optionnel) | `gpt-4.1-mini-inventory`, modèle `gpt-4.1-mini` version `2025-04-14`, `GlobalStandard` |
| Compte d'Embeddings (optionnel) | `text-embedding-ada-002` version `2`, `Standard` ; pas de pipeline d'indexation |
| Compte OpenAI pour le Grader | `gpt-4.1-grader`, modèle `gpt-4.1` version `2025-04-14`, `GlobalStandard` ; pas d’évaluateur |
| Recherche IA | Service vide ; pas d’index ou de documents |
| Stockage | Conteneurs blob `documents` et `uploads` vides |
| Cosmos DB | Compte serverless, base de données `chathistory`, conteneur `conversations` partitionné par `/userId`, TTL des éléments 30 jours |
| Container Apps | Router et frontend tournent tous deux sur `mcr.microsoft.com/azuredocs/containerapps-helloworld:latest` au port 80 |
| Key Vault (optionnel) | Coffre RBAC activé vide ; **pas de secrets ni d'affectations de rôle** |
| Application Insights / Log Analytics (optionnel) | Collecte des logs des ressources et de l’environnement ; pas d’instrumentation personnalisée, d’alertes ou de tableaux de bord |
| Document Intelligence | Compte S0 ; pas de workflow de traitement documentaire |

Legacy Bing Search v7 a été retiré le 11 août 2025 et n'est **pas provisionné**.
Aucune intégration web-grounding de remplacement n'est mise en œuvre.

**Non inclus :** agents clients/inventaire, API router `/chat`, interface de chat frontend,
schéma de recherche ou scripts d’ingestion, Azure Container Registry, points de terminaison privés,
identités managées, affectations RBAC, bascule automatique, Front Door, scanner red-team,
CLI d'évaluation, authentification ou CI/CD.

Un message de succès ARM confirme uniquement le provisionnement des ressources. Il ne certifie ni
la fonctionnalité de l’application, ni la sécurité, la disponibilité ou la préparation à la production.

## Prérequis et coûts

- Bash (Git Bash/WSL sous Windows) et
  [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli).
- Un abonnement avec les permissions pour créer toutes les ressources listées.
- Vérifiez la disponibilité de **chaque modèle/version/SKU dans chaque région choisie** et
  les quotas pour votre abonnement. Les valeurs par défaut sont des exemples, pas des garanties.
  Consultez [disponibilité des modèles](https://learn.microsoft.com/azure/ai-services/openai/concepts/models).
- Choisissez un groupe de ressources dédié que vous pouvez supprimer après les tests.

```bash
az version
az login
az account show --query "{subscription:id,name:name}" -o table
az cognitiveservices usage list --location eastus2 -o table
```

Emplacements par défaut : principal `eastus2`, secondaire `westus2`, embeddings `francecentral` ;
le grader utilise la région principale sauf si `graderLocation` est fourni.
`--no-multi-region` ignore les comptes secondaire et embeddings ; il ne saute pas le
compte grader.

La recherche est facturée tant qu'elle est provisionnée même si elle est vide. Les réplicas minimaux des conteneurs,
la redondance du stockage, les requêtes/contenus Cosmos DB, les tokens des modèles, les appels Document Intelligence
et l'ingestion/le stockage des logs peuvent engendrer des coûts. Il n’y a **aucun total mensuel fixe ou validé**.
Estimez les SKU exacts dans le
[calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/) et
configurez un budget avant le déploiement.

### Modes de déploiement

Ces réglages sont des tailles de ressources, **pas des certifications de production ou SLA** :

| Mode | Unités de capacité Chat / mini / embedding / grader | Réplicas du router | Réplicas frontend | Niveau de recherche | Stockage |
|---|---|---|---|---|---|
| minimal | 10 / 10 / 20 / 5 | 0–3 | 1–2 | basique, 1 réplique | Standard_LRS |
| standard | 20 / 15 / 30 / 15 | 1–3 | 1–2 | standard, 1 réplique | Standard_ZRS |
| premium | 40 / 30 / 60 / 30 | 1–10 | 1–5 | standard2, 2 répliques | Standard_GRS |

Les unités de capacité des modèles sont spécifiques au modèle/SKU ; ne les additionnez pas comme une garantie universelle TPM.
Premium n’active pas la redondance zone pour Container Apps : cela nécessite
un design réseau supplémentaire. La recherche basique supporte les recherches vectorielles, sous réserve
des limites du service ; elle n’est pas incompatible par nature avec les vecteurs.

## 🚀 Déploiement Rapide

Consultez `azuredeploy.json` et `azuredeploy.parameters.json` d'abord. Les commandes
ci-dessous **créent des ressources Azure facturables** ; ce ne sont pas des vérifications hors ligne.

Depuis la racine du dépôt :

```bash
cd examples/retail-multiagent-arm-template
bash deploy.sh --help
bash deploy.sh -g retail-learning-rg -m minimal --no-multi-region
```

Le script utilise des chemins relatifs à son propre répertoire, vérifie la connexion/outils/arguments,
crée le groupe de ressources si absent, valide le déploiement, provisionne, et
affiche les sorties non confidentielles. Aucune `jq`, population de données, récupération de secrets, ou
configuration post-déploiement d’application n’est requise ou effectuée.

Les valeurs par défaut en ligne de commande du script remplacent les valeurs correspondantes dans le
fichier de paramètres. Éditez ce fichier pour les réglages tels que régions secondaires/tertiaires ;
utilisez le déploiement CLI direct si vous avez besoin de surcharges arbitraires de paramètres :

```bash
az group create --name retail-learning-rg --location eastus2
az deployment group create \
  --resource-group retail-learning-rg \
  --name retail-learning \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --parameters projectName=retail environmentName=dev \
    deploymentMode=minimal enableMultiRegion=false
```

Le provisionnement peut prendre entre 15 et 45 minutes ou plus, et peut échouer à cause de quotas régionaux ou
de restrictions de cycle de vie des modèles. Ne réessayez pas aveuglément : lisez d'abord l’erreur.

## Options de configuration

| Paramètre | Valeur par défaut dans le modèle | Signification |
|---|---|---|
| `projectName` | Obligatoire (`retail` dans le fichier paramètres) | 3–10 lettres minuscules/chiffres |
| `location` | Emplacement du groupe de ressources | Région principale (`eastus2` dans le fichier paramètres) |
| `secondaryLocation` | `westus2` | Région du compte mini modèle |
| `tertiaryLocation` | `francecentral` | Région du compte embeddings |
| `graderLocation` | Région principale | Région indépendante du compte grader |
| `environmentName` | `dev` | `dev`, `staging`, ou `prod` ; nom uniquement, pas un interrupteur de durcissement |
| `deploymentMode` | `standard` | Sélection du SKU/capacité |
| `enableMultiRegion` | `true` | Ajouter des comptes secondaires et des embeddings |
| `enableMonitoring` | `true` | Ajouter Insights/espace de travail et collecte des logs d'environnement |
| `enableSecurity` | `true` | Créer uniquement un coffre-fort vide avec RBAC activé |

Le paramètre trompeur `openAiApiVersion` a été supprimé : une version API du plan de données
ne contrôle pas les versions des ressources ARM ou des modèles. Les paires nom/version de modèles
sont dans `variables.modelDeployments` ; vérifiez-les conjointement avec le SKU de déploiement.

## Vérifier le provisionnement

Utilisez le nom du déploiement issu de la sortie du script ou `az deployment group list`.
Pour le déploiement direct ci-dessus :

```bash
RG=retail-learning-rg
DEPLOYMENT=retail-learning
az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.provisioningState -o tsv
az deployment operation group list -g "$RG" -n "$DEPLOYMENT" -o table
az resource list -g "$RG" -o table
```

Attendu : état du déploiement `Succeeded`. En cas d'échec, inspectez les détails de l'erreur d'opération.
La sortie de la liste des ressources seule n'est pas un contrôle fiable de l'état du provisionnement.

Testez le placeholder **root**, pas un point de terminaison d'agent inexistant :

```bash
ROUTER_URL=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.routerUrl.value -o tsv)
curl --fail-with-body "$ROUTER_URL"
```

Attendu : page hello-world HTTP 200, **pas une réponse de chat**. Une erreur HTTP
ne compte pas comme une vérification réussie.

Pour tester l'inférence du modèle primaire réelle (facturable) :

```bash
OPENAI_ENDPOINT=$(az deployment group show -g "$RG" -n "$DEPLOYMENT" \
  --query properties.outputs.openAiEndpointPrimary.value -o tsv)
OPENAI_NAME=$(az cognitiveservices account list -g "$RG" \
  --query "[?kind=='OpenAI' && contains(name, '-openai-primary-')].name | [0]" -o tsv)
OPENAI_KEY=$(az cognitiveservices account keys list -g "$RG" -n "$OPENAI_NAME" \
  --query key1 -o tsv)
curl --fail-with-body \
  "${OPENAI_ENDPOINT%/}/openai/deployments/gpt-4.1-chat/chat/completions?api-version=2024-10-21" \
  -H "Content-Type: application/json" -H "api-key: $OPENAI_KEY" \
  -d '{"messages":[{"role":"user","content":"Say hello"}],"max_tokens":20}'
unset OPENAI_KEY
```

Attendu : JSON avec `choices` et `usage`. Le nom du déploiement est
`gpt-4.1-chat`, pas le nom du modèle sous-jacent `gpt-4.1`.

## 🔧 Après le déploiement : Prochaines étapes

Ceci est un **arrière-plan de développement**, pas un exercice finalisé :

1. Implémenter des agents client/inventaire authentifiés et le contrat de routeur.
2. Implémenter le frontend et valider sa configuration.
3. Créer et peupler un index de recherche avec une dimension/profil correspondant à votre
   modèle d'embedding, et gérer les échecs et mises à jour des documents.
4. Créer un registre et configurer l'identité/permissions d'extraction d'images.
5. Construire et pousser de vraies images. Modifier les ports d'entrée et les sondes de Container App
   pour correspondre à ces images avant les tests ; le port 80 ici appartient aux placeholders.
6. Configurer les secrets ou les identités gérées et les rôles limités au plan de données. Ne
   faites pas référence à des noms de secrets imaginaires : ce modèle ne crée aucun secret d'application.
7. Instrumenter les applications, configurer les alertes, tester les pannes/récupérations, et évaluer
   les résultats avec des données de vérité terrain représentatives et une revue humaine.

Voir le [plan d’architecture](../retail-scenario.md) pour les limites de conception.

## Dépannage et limites de sécurité

- **Modèle indisponible :** vérifier le modèle/version/SKU, la région, et le quota d’abonnement ;
  le script ne contrôle pas les catalogues de modèles avant le vol.
- **Surveillance désactivée :** la destination des logs d'environnement est `none`, pas une
  configuration Log Analytics invalide et vide.
- **Placeholders uniquement :** `/chat`, évaluation d’agent et ingestion de fichiers n’existent pas.
- **Réseau/identité :** les points d’accès publics et l’authentification locale sont activés.
  Simplement activer RBAC sur Key Vault ne crée pas d’assignations de rôles ni d’identités.
- **Production :** ajouter authentification, identités limitées, gestion des secrets,
  réseau privé où approprié, conception de disponibilité, et tests opérationnels.
  Les comptes multi-région de modèles seuls ne fournissent pas de basculement.

## Nettoyage

Il n’y a pas de projet AZD ici ; `azd down` n’est pas la commande de nettoyage.
Après avoir vérifié que le groupe ne contient que vos ressources d’apprentissage :

```bash
az group delete --name retail-learning-rg --yes
az group exists --name retail-learning-rg
```

Attendu après la fin de la suppression : `false`. Les ressources Key Vault et Cognitive Services
supprimées en soft-delete peuvent conserver leur nom ; la purge nécessite les permissions appropriées.
Vérifiez la Gestion des Coûts pour les frais d’utilisation différés.

[Signaler un problème](https://github.com/microsoft/AZD-for-beginners/issues) ·
[Azure AI Search](https://learn.microsoft.com/azure/search/) ·
[Container Apps](https://learn.microsoft.com/azure/container-apps/)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->