# 2. Valider un modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ CAPABLE DE"

    - [ ] Analyser l'architecture de la solution IA
    - [ ] Comprendre le workflow de déploiement AZD
    - [ ] Utiliser GitHub Copilot pour obtenir de l'aide sur l'utilisation d'AZD
    - [ ] **Laboratoire 2 :** Déployer et valider le modèle AI Agents

---


## 1. Introduction

Le [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ou `azd` est un outil en ligne de commande open-source qui simplifie le flux de travail des développeurs lors de la création et du déploiement d'applications sur Azure. 

[Les modèles AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sont des dépôts standardisés qui incluent du code d'application d'exemple, des ressources d'_infrastructure-as-code_ et des fichiers de configuration `azd` pour une architecture de solution cohérente. La provision de l'infrastructure devient aussi simple qu'une commande `azd provision` - tandis que `azd up` vous permet de provisionner l'infrastructure **et** de déployer votre application en une seule fois !

En conséquence, démarrer votre processus de développement d'application peut être aussi simple que de trouver le bon _modèle de démarrage AZD_ qui correspond le mieux à vos besoins applicatifs et d'infrastructure - puis de personnaliser le dépôt pour répondre aux exigences de votre scénario.

Avant de commencer, assurons-nous que vous avez installé l'Azure Developer CLI.

1. Ouvrez un terminal VS Code et tapez cette commande :

      ```bash title="" linenums="0"
      azd version
      ```

1. Vous devriez voir quelque chose comme ceci !

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Vous êtes maintenant prêt à sélectionner et déployer un modèle avec azd**

---

## 2. Sélection du modèle

La plateforme Microsoft Foundry est fournie avec un [ensemble de modèles AZD recommandés](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) qui couvrent des scénarios de solution populaires comme l'_automatisation des workflows multi-agents_ et le _traitement multi-modal de contenu_. Vous pouvez également découvrir ces modèles en visitant le portail Microsoft Foundry.

1. Visitez [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Connectez-vous au portail Microsoft Foundry lorsque vous y êtes invité - vous verrez quelque chose comme ceci.

![Choisir](../../../../../translated_images/fr/01-pick-template.60d2d5fff5ebc374.webp)


Les options **Basic** sont vos modèles de démarrage :

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) qui déploie une application de chat basique _avec vos données_ sur Azure Container Apps. Utilisez ceci pour explorer un scénario de chatbot IA basique.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) qui déploie également un Agent IA standard (avec les Foundry Agents). Utilisez ceci pour vous familiariser avec les solutions IA agentiques impliquant des outils et des modèles.

Visitez le deuxième lien dans un nouvel onglet du navigateur (ou cliquez sur `Open in GitHub` pour la carte correspondante). Vous devriez voir le dépôt de ce modèle AZD. Prenez une minute pour explorer le README. L'architecture de l'application ressemble à ceci :

![Architecture](../../../../../translated_images/fr/architecture.8cec470ec15c65c7.webp)

---

## 3. Activation du modèle

Essayons de déployer ce modèle et de nous assurer qu'il est valide. Nous suivrons les directives de la section [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Cliquez sur [ce lien](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirmez l'action par défaut `Create codespace`
1. Cela ouvre un nouvel onglet du navigateur - attendez que la session GitHub Codespaces ait fini de charger
1. Ouvrez le terminal VS Code dans Codespaces - tapez la commande suivante :

   ```bash title="" linenums="0"
   azd up
   ```

Complétez les étapes de workflow que cela va déclencher :

1. Il vous sera demandé de vous connecter à Azure - suivez les instructions pour vous authentifier
1. Entrez un nom d'environnement unique pour vous - par ex., j'ai utilisé `nitya-mshack-azd`
1. Cela créera un dossier `.azure/` - vous verrez un sous-dossier avec le nom de l'env
1. Il vous sera demandé de sélectionner un abonnement - sélectionnez celui par défaut
1. Il vous sera demandé de choisir un emplacement - utilisez `East US 2`

Maintenant, attendez que la provision se termine. **Ceci prend 10-15 minutes**

1. Une fois terminé, votre console affichera un message SUCCESS ressemblant à ceci :
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Votre portail Azure aura maintenant un groupe de ressources provisionné avec ce nom d'env :

      ![Infra provisionnée](../../../../../translated_images/fr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Vous êtes maintenant prêt à valider l'infrastructure et l'application déployées**.

---

## 4. Validation du modèle

1. Visitez la page Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - connectez-vous si demandé
1. Cliquez sur le RG pour le nom de votre environnement - vous voyez la page ci-dessus

      - cliquez sur la ressource Azure Container Apps
      - cliquez sur l'URL de l'application dans la section _Essentials_ (en haut à droite)

1. Vous devriez voir une interface frontale de l'application hébergée comme ceci :

   ![Application](../../../../../translated_images/fr/03-test-application.471910da12c3038e.webp)

1. Essayez de poser quelques [questions d'exemple](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Demandez : ```Quelle est la capitale de la France ?``` 
      1. Demandez : ```Quelle est la meilleure tente à moins de 200 $ pour deux personnes, et quelles fonctionnalités inclut-elle ?```

1. Vous devriez obtenir des réponses similaires à ce qui est montré ci-dessous. _Mais comment cela fonctionne-t-il ?_ 

      ![Application](../../../../../translated_images/fr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validation de l'Agent

L'Azure Container App déploie un endpoint qui se connecte à l'Agent IA provisionné dans le projet Microsoft Foundry pour ce modèle. Voyons ce que cela signifie.

1. Revenez à la page _Overview_ du portail Azure pour votre groupe de ressources

1. Cliquez sur la ressource `Microsoft Foundry` dans cette liste

1. Vous devriez voir ceci. Cliquez sur le bouton `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/fr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Vous devriez voir la page du projet Foundry pour votre application IA
   ![Projet](../../../../../translated_images/fr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Cliquez sur `Agents` - vous voyez l'Agent par défaut provisionné dans votre projet
   ![Agents](../../../../../translated_images/fr/06-visit-agents.bccb263f77b00a09.webp)

1. Sélectionnez-le - et vous voyez les détails de l'Agent. Notez les éléments suivants :

      - L'agent utilise File Search par défaut (toujours)
      - la `Knowledge` de l'agent indique qu'il a 32 fichiers téléchargés (pour la recherche de fichiers)
      ![Agents](../../../../../translated_images/fr/07-view-agent-details.0e049f37f61eae62.webp)

1. Recherchez l'option `Data+indexes` dans le menu de gauche et cliquez pour les détails. 

      - Vous devriez voir les 32 fichiers de données téléchargés pour la connaissance.
      - Ceux-ci correspondront aux 12 fichiers clients et 20 fichiers produits sous `src/files` 
      ![Données](../../../../../translated_images/fr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Vous avez validé le fonctionnement de l'Agent !** 

1. Les réponses de l'agent sont ancrées dans la connaissance contenue dans ces fichiers. 
1. Vous pouvez maintenant poser des questions liées à ces données, et obtenir des réponses ancrées.
1. Exemple : `customer_info_10.json` décrit les 3 achats effectués par "Amanda Perez"

Revenez à l'onglet du navigateur avec l'endpoint Container App et demandez : `Quels produits possède Amanda Perez ?`. Vous devriez voir quelque chose comme ceci :

![Données](../../../../../translated_images/fr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Bac à sable de l'Agent

Construisons un peu plus d'intuition pour les capacités de Microsoft Foundry, en testant l'Agent dans le Playground des Agents. 

1. Revenez à la page `Agents` dans Microsoft Foundry - sélectionnez l'agent par défaut
1. Cliquez sur l'option `Try in Playground` - vous devriez obtenir une interface Playground comme celle-ci
1. Posez la même question : `Quels produits possède Amanda Perez ?`

    ![Données](../../../../../translated_images/fr/09-ask-in-playground.a1b93794f78fa676.webp)

Vous obtenez la même réponse (ou une réponse similaire) - mais vous obtenez également des informations supplémentaires que vous pouvez utiliser pour comprendre la qualité, le coût et les performances de votre application agentique. Par exemple :

1. Notez que la réponse cite des fichiers de données utilisés pour "ancrer" la réponse
1. Survolez n'importe quelle étiquette de fichier - les données correspondent-elles à votre requête et à la réponse affichée ?

Vous voyez également une ligne de _statistiques_ sous la réponse. 

1. Survolez n'importe quelle métrique - par ex., Safety. Vous voyez quelque chose comme ceci
1. L'évaluation correspond-elle à votre intuition concernant le niveau de sécurité de la réponse ?

      ![Données](../../../../../translated_images/fr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilité intégrée

L'observabilité consiste à instrumenter votre application pour générer des données qui peuvent être utilisées pour comprendre, déboguer et optimiser son fonctionnement. Pour avoir une idée de cela :

1. Cliquez sur le bouton `View Run Info` - vous devriez voir cette vue. Il s'agit d'un exemple de [traçage d'Agent](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) en action. _Vous pouvez également obtenir cette vue en cliquant sur Thread Logs dans le menu principal_.

   - Familiarisez-vous avec les étapes d'exécution et les outils engagés par l'agent
   - Comprenez le nombre total de Tokens (vs. l'utilisation des tokens de sortie) pour la réponse
   - Comprenez la latence et où le temps est passé dans l'exécution

      ![Agent](../../../../../translated_images/fr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Cliquez sur l'onglet `Metadata` pour voir des attributs supplémentaires de l'exécution, qui peuvent fournir un contexte utile pour le débogage ultérieur.   

      ![Agent](../../../../../translated_images/fr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Cliquez sur l'onglet `Evaluations` pour voir les auto-évaluations effectuées sur la réponse de l'agent. Celles-ci incluent des évaluations de sécurité (par ex., Self-harm) et des évaluations spécifiques à l'agent (par ex., résolution d'intention, adhérence à la tâche).

      ![Agent](../../../../../translated_images/fr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Enfin, cliquez sur l'onglet `Monitoring` dans le menu latéral.

      - Sélectionnez l'onglet `Resource usage` dans la page affichée - et consultez les métriques.
      - Suivez l'utilisation de l'application en termes de coûts (tokens) et de charge (requêtes).
      - Suivez la latence de l'application jusqu'au premier octet (traitement de l'entrée) et au dernier octet (sortie).

      ![Agent](../../../../../translated_images/fr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variables d'environnement

Jusqu'à présent, nous avons parcouru le déploiement dans le navigateur - et validé que notre infrastructure est provisionnée et que l'application est opérationnelle. Mais pour travailler avec l'application _code-first_, nous devons configurer notre environnement de développement local avec les variables pertinentes nécessaires pour travailler avec ces ressources. L'utilisation d'`azd` facilite cela.

1. L'Azure Developer CLI [utilise des variables d'environnement](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) pour stocker et gérer les paramètres de configuration pour les déploiements d'application.

1. Les variables d'environnement sont stockées dans `.azure/<env-name>/.env` - cela les rattache à l'environnement `env-name` utilisé lors du déploiement et vous aide à isoler les environnements entre différentes cibles de déploiement dans le même dépôt.

1. Les variables d'environnement sont automatiquement chargées par la commande `azd` chaque fois qu'elle exécute une commande spécifique (par ex., `azd up`). Notez que `azd` ne lit pas automatiquement les variables d'environnement au niveau OS (par ex., définies dans le shell) - utilisez plutôt `azd set env` et `azd get env` pour transférer des informations au sein de scripts.


Essayons quelques commandes :

1. Récupérez toutes les variables d'environnement définies pour `azd` dans cet environnement :

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vous voyez quelque chose comme :

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Récupérez une valeur spécifique - par ex., je veux savoir si nous avons défini la valeur `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vous voyez quelque chose comme ceci - elle n'a pas été définie par défaut !

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Définissez une nouvelle variable d'environnement pour `azd`. Ici, nous mettons à jour le nom du modèle de l'agent. _Remarque : toute modification effectuée sera immédiatement répercutée dans le fichier `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Maintenant, nous devrions trouver que la valeur est définie :

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Notez que certaines ressources sont persistantes (par ex., les déploiements de modèles) et nécessiteront plus qu'un simple `azd up` pour forcer le redéploiement. Essayons de détruire le déploiement original et de redéployer avec les variables d'environnement modifiées.

1. **Actualiser** Si vous avez déjà déployé une infrastructure à l'aide d'un modèle azd - vous pouvez _actualiser_ l'état de vos variables d'environnement locales en fonction de l'état actuel de votre déploiement Azure en utilisant cette commande :

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ceci est une manière puissante de _synchroniser_ les variables d'environnement entre deux environnements de développement locaux ou plus (par exemple, une équipe avec plusieurs développeurs) - permettant à l'infrastructure déployée de servir de référence pour l'état des variables d'environnement. Les membres de l'équipe se contentent de _rafraîchir_ les variables pour revenir en phase.

---

## 9. Félicitations 🏆

Vous venez de terminer un flux de travail de bout en bout où vous :

- [X] Sélectionné le modèle AZD que vous souhaitez utiliser
- [X] Lancé le modèle avec GitHub Codespaces 
- [X] Déployé le modèle et vérifié qu'il fonctionne

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avis de non-responsabilité** :
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle effectuée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->