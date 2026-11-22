# 4. Configurer un Modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SAUREZ"

    - [ ] Explain the purpose and structure of `azure.yaml`
    - [ ] Distinguish application services, infrastructure parameters, and lifecycle hooks
    - [ ] Configure the selected environment using inputs supported by the template
    - [ ] **Lab 4:** Review a configuration change before provisioning it

---

## 1. Commencez par le modèle réel

Ouvrez le [`azure.yaml` dans Démarrer avec les Agents IA](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/azure.yaml) dans le dépôt que vous avez initialisé. Le modèle amont peut changer indépendamment de cet atelier. L'**extrait** suivant a été vérifié le 4 novembre 2026 ; ce n’est pas un remplacement du fichier complet :

```yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@2.5.0
requiredVersions:
  azd: ">=1.14.0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- `name` identifie le projet AZD ; `metadata.template` enregistre la version du modèle.
- `requiredVersions.azd` est le minimum du modèle, et non une recommandation pour rester sur une ancienne CLI. Utilisez une version AZD supportée actuelle.
- `services` définit les cibles de déploiement de l'application. Ce modèle déploie son API Python et son frontend comme un seul service Container Apps.
- `project` est relatif à `azure.yaml`.
- `remoteBuild` demande une compilation distante du conteneur. Votre identité doit toujours disposer des autorisations Azure requises.

Les fichiers Bicep du modèle sous `infra/`, et non la seule liste `services`, déclarent des ressources telles que Microsoft Foundry, les déploiements de modèles, le stockage et la recherche IA optionnelle.

## 2. Comprendre les crochets de cycle de vie

Inspectez la section `hooks` et ses scripts référencés avant d’exécuter le modèle. La version examinée contient :

| Crochet | Objectif | Comportement important |
|------|---------|--------------------|
| `preup` | Valider les entrées environnementales du modèle avant le workflow `up` | Les scripts shell spécifiques à la plateforme peuvent arrêter le workflow en cas d’échec |
| `postdeploy` | Exécuter la configuration spécifique au modèle après le déploiement de l'application | Inspectez `continueOnError` et la sortie du script ; un déploiement réussi ne prouve pas que toutes les tâches de configuration ont réussi |

Cette version ne contient **pas** l'ancien crochet `postprovision` / `write_env` montré dans le matériel d’atelier antérieur. Ne copiez pas les références de crochet vers des scripts qui n’existent plus.

Les clés de crochet sélectionnent les événements du cycle de vie ; `posix` et `windows` sélectionnent les implémentations de plateforme. `shell`, `run`, `interactive`, et `continueOnError` contrôlent l’exécution. Ce sont des scripts exécutables avec vos permissions, donc révisez-les comme vous le feriez pour du code d’application.

Voir la [documentation des crochets AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-extensibility) pour le cycle de vie complet.

## 3. Retracez les entrées environnementales dans l'infrastructure

Exécutez ces commandes depuis le dépôt d'échantillons initialisé :

```bash
azd env list
azd env get-value AZURE_ENV_NAME
azd env get-value AZURE_LOCATION
```

Inspectez `infra/main.parameters.json` pour voir quelles variables d'environnement le modèle consomme réellement. Définir un nom arbitraire avec `azd env set` ne modifie pas automatiquement une ressource Azure.

Les valeurs par défaut examinées incluent :

| Entrée | Défaut / objectif |
|-------|-------------------|
| `AZURE_AI_AGENT_MODEL_NAME` | `gpt-5-mini` |
| `AZURE_AI_AGENT_MODEL_VERSION` | `2025-08-07` |
| `AZURE_AI_AGENT_DEPLOYMENT_SKU` | `GlobalStandard` |
| `AZURE_AI_AGENT_DEPLOYMENT_CAPACITY` | `80` ; les unités de quota dépendent du modèle et du type de déploiement |
| `AZURE_AI_EMBED_MODEL_NAME` | `text-embedding-3-small` |
| `AZURE_AI_EMBED_DIMENSIONS` | `1536` |
| `USE_APPLICATION_INSIGHTS` | `true` |
| `USE_AZURE_AI_SEARCH_SERVICE` | `false` |
| `ENABLE_AZURE_MONITOR_TRACING` | `false` |
| `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` | `false` ; laissez désactivé à moins que la gestion des données ait été revue |

Ce sont des entrées spécifiques à l'échantillon, pas des paramètres globaux AZD. Vérifiez la [documentation sur le support des modèles et régions](https://learn.microsoft.com/azure/ai-services/agents/concepts/model-region-support) et le quota de votre abonnement avant de choisir un modèle, SKU, capacité ou localisation. N’interprétez pas chaque unité de capacité comme 1 000 tokens par minute.

Pour sélectionner un modèle de chat différent, mettez à jour son **nom, version, format, SKU et capacité compatibles ensemble**, suivant le [guide de personnalisation de l’échantillon](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md). Changer uniquement le nom peut laisser une version ou un type de déploiement incompatible.

## 4. Atelier : activer la recherche et la traçabilité optionnelles

!!! warning "Ces paramètres peuvent ajouter des ressources facturables"

    Check the planned resources and current Azure prices first. Provisioning preview is not a cost estimator. Enabling search does not create your custom document index or ingest a product catalog automatically.

```bash
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd env set USE_APPLICATION_INSIGHTS true
azd env set ENABLE_AZURE_MONITOR_TRACING true

# Inspect the infrastructure changes and any configured preview hooks
azd provision --preview

# Apply the resource changes and deploy the application
azd up
```

Les modifications d'infrastructure nécessitent une approvisionnement ; `azd deploy` seul déploie les services applicatifs. Pour l’indexation de recherche et les options de récupération prises en charge, suivez le [guide Recherche IA](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md). Pour la surveillance, suivez le [guide d'observabilité](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md).

N’activez pas la capture de contenu prompt/réponse sur des données clients réelles sans le consentement requis, les contrôles d’accès, la politique de conservation et la redaction.

## 5. Ressources existantes et CI/CD

Pour réutiliser un projet Foundry, suivez les [instructions pour ressources existantes](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/deploy_customization.md#use-existing-resources) de l’échantillon. Définir `AZURE_EXISTING_AIPROJECT_RESOURCE_ID` modifie le chemin de déploiement ; dans ce cas, le modèle ne crée pas Application Insights ou Recherche IA pour vous. Vérifiez explicitement les dépendances, affectations de rôle et déploiements de modèles.

La section `pipeline.variables` contrôle les valeurs transmises dans un pipeline généré ; ce n’est pas un magasin de secrets et ne crée pas de ressources Azure. Préférez l’identité gérée dans l’application et OIDC pour CI/CD. Les fichiers d’environnement AZD sont en texte clair et ne doivent pas être committés.

AZD prend en charge l’importation d’un fichier dotenv préparé localement et de confiance :

```bash
azd env set --file .env
```

Vérifiez ce fichier avant de l’importer, et n’affichez pas les fichiers d’environnement contenant des secrets dans des terminaux partagés ou des journaux CI.

## 6. Vérifiez votre compréhension

- Quel service `azure.yaml` déploie l’application ?
- Quel paramètre d’infrastructure consomme chaque valeur que vous avez modifiée ?
- Quelles modifications nécessitent un approvisionnement plutôt qu’un simple déploiement ?
- La région et l’abonnement sélectionnés supportaient-ils le modèle et le quota ?
- Tous les crochets de configuration ont-ils réussi, et pouvez-vous vérifier le comportement de l’application déployée ?

Continuez vers [Personnaliser un Modèle](5-Customize-AI-Template.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->