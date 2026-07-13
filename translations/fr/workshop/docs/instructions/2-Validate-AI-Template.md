# 2. Valider un modèle

> Validé avec `azd 1.27.1` en juillet 2026.

!!! tip "À LA FIN DE CE MODULE, VOUS SAUREZ"

    - [ ] Analyser l'architecture de la solution IA
    - [ ] Comprendre le flux de déploiement AZD
    - [ ] Utiliser GitHub Copilot pour obtenir de l'aide sur l'utilisation d'AZD
    - [ ] **Atelier 2 :** Déployer et valider le modèle AI Agents

---


## 1. Introduction

Le [CLI Azure Developer](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) ou `azd` est un outil en ligne de commande open-source qui simplifie le flux de travail du développeur lors de la création et du déploiement d’applications sur Azure.

Les [modèles AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sont des dépôts standardisés qui incluent du code d’application d’exemple, des ressources _infrastructure-as-code_, et des fichiers de configuration `azd` pour une architecture de solution cohérente. La fourniture de l’infrastructure devient aussi simple qu’une commande `azd provision` – tandis que l’utilisation de `azd up` permet de fournir l’infrastructure **et** de déployer l’application en une seule fois !

En conséquence, démarrer votre processus de développement d’application peut être aussi simple que de trouver le bon _modèle de démarrage AZD_ qui correspond le mieux à vos besoins en matière d’application et d’infrastructure – puis de personnaliser le dépôt pour adapter votre scénario.

Avant de commencer, assurons-nous que vous avez installé le CLI Azure Developer.

1. Ouvrez un terminal VS Code et tapez cette commande :

      ```bash title="" linenums="0"
      azd version
      ```

1. Vous devriez voir quelque chose de similaire !

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Vous êtes maintenant prêt à sélectionner et déployer un modèle avec azd**

---

## 2. Sélection du modèle

La plateforme Microsoft Foundry propose un [ensemble de modèles AZD recommandés](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) qui couvrent des scénarios populaires comme l’_automatisation des flux de travail multi-agent_ et le _traitement de contenu multimodal_. Vous pouvez également découvrir ces modèles en visitant le portail Microsoft Foundry.

1. Visitez [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Connectez-vous au portail Microsoft Foundry lorsque cela vous est demandé – vous verrez quelque chose comme ceci.

![Pick](../../../../../translated_images/fr/01-pick-template.60d2d5fff5ebc374.webp)


Les options **Basic** sont vos modèles de démarrage :

1. [ ] [Commencer avec AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) qui déploie une application de chat basique _avec vos données_ sur Azure Container Apps. Utilisez ceci pour explorer un scénario de chatbot IA basique.
1. [X] [Commencer avec AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) qui déploie également un Agent IA standard (avec les Foundry Agents). Utilisez ceci pour vous familiariser avec les solutions IA agentiques impliquant des outils et modèles.

Visitez le deuxième lien dans un nouvel onglet du navigateur (ou cliquez sur `Open in GitHub` pour la carte associée). Vous devriez voir le dépôt pour ce modèle AZD. Prenez une minute pour explorer le README. L’architecture de l’application ressemble à ceci :

![Arch](../../../../../translated_images/fr/architecture.8cec470ec15c65c7.webp)

---

## 3. Activation du modèle

Essayons de déployer ce modèle et assurons-nous qu’il est valide. Nous suivrons les consignes dans la section [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Choisissez un environnement de travail pour le dépôt de modèles :

      - **GitHub Codespaces** : Cliquez [sur ce lien](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) et confirmez `Create codespace`
      - **Clone local ou conteneur de développement** : Clonez `Azure-Samples/get-started-with-ai-agents` et ouvrez-le dans VS Code

1. Attendez que le terminal VS Code soit prêt, puis tapez la commande suivante :

   ```bash title="" linenums="0"
   azd up
   ```

Complétez les étapes du workflow que cela va déclencher :

1. Vous serez invité à vous connecter à Azure – suivez les instructions pour vous authentifier
1. Entrez un nom d’environnement unique pour vous – par ex., j’ai utilisé `nitya-mshack-azd`
1. Cela créera un dossier `.azure/` – vous verrez un sous-dossier avec le nom de l’environnement
1. Vous serez invité à sélectionner un nom d’abonnement – choisissez le défaut
1. Vous serez invité à choisir un emplacement – utilisez `East US 2`

Maintenant, attendez que la provision soit terminée. **Cela prend 10 à 15 minutes**

1. Une fois terminé, votre console affichera un message de SUCCÈS comme ceci :
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Votre portail Azure disposera maintenant d’un groupe de ressources provisionné avec ce nom d’environnement :

      ![Infra](../../../../../translated_images/fr/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Vous êtes maintenant prêt à valider l’infrastructure et l’application déployées**.

---

## 4. Validation du modèle

1. Visitez la page [Groupes de ressources](https://portal.azure.com/#browse/resourcegroups) du portail Azure – connectez-vous si nécessaire
1. Cliquez sur le groupe de ressources correspondant à votre nom d’environnement – vous verrez la page ci-dessus

      - cliquez sur la ressource Azure Container Apps
      - cliquez sur l’URL de l’application dans la section _Essentials_ (en haut à droite)

1. Vous devriez voir une interface frontale d’application hébergée comme ceci :

   ![App](../../../../../translated_images/fr/03-test-application.471910da12c3038e.webp)

1. Essayez de poser quelques [questions d’exemple](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Demandez : ```Quelle est la capitale de la France ?```
      1. Demandez : ```Quelle est la meilleure tente à moins de 200 $ pour deux personnes, et quelles caractéristiques inclut-elle ?```

1. Vous devriez obtenir des réponses similaires à celles montrées ci-dessous. _Mais comment cela fonctionne-t-il ?_

      ![App](../../../../../translated_images/fr/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validation de l’agent

L’application Azure Container App déploie un point de terminaison qui se connecte à l’Agent IA provisionné dans le projet Microsoft Foundry pour ce modèle. Voyons ce que cela signifie.

1. Revenez à la page _Vue d’ensemble_ du portail Azure pour votre groupe de ressources

1. Cliquez sur la ressource `Microsoft Foundry` dans cette liste

1. Vous devriez voir ceci. Cliquez sur le bouton `Accéder au portail Microsoft Foundry`.
   ![Foundry](../../../../../translated_images/fr/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Vous devriez voir la page du projet Foundry pour votre application IA
   ![Project](../../../../../translated_images/fr/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Cliquez sur `Agents` – vous voyez l’agent par défaut provisionné dans votre projet
   ![Agents](../../../../../translated_images/fr/06-visit-agents.bccb263f77b00a09.webp)

1. Sélectionnez-le – et vous voyez les détails de l’agent. Notez ce qui suit :

      - L’agent utilise la Recherche de fichiers par défaut (toujours)
      - La `Connaissance` de l’agent indique qu’il dispose de 32 fichiers téléchargés (pour la recherche de fichiers)
      ![Agents](../../../../../translated_images/fr/07-view-agent-details.0e049f37f61eae62.webp)

1. Cherchez l’option `Données+index` dans le menu de gauche et cliquez pour les détails.

      - Vous devriez voir les 32 fichiers de données téléchargés pour la connaissance.
      - Ceux-ci correspondent aux 12 fichiers clients et 20 fichiers produits sous `src/files`
      ![Data](../../../../../translated_images/fr/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Vous avez validé le fonctionnement de l’agent !**

1. Les réponses de l’agent sont basées sur la connaissance contenue dans ces fichiers.
1. Vous pouvez maintenant poser des questions liées à ces données et obtenir des réponses fondées.
1. Exemple : `customer_info_10.json` décrit les 3 achats effectués par "Amanda Perez"

Revenez à l’onglet du navigateur avec le point de terminaison de l’application Container et demandez : `Quels produits Amanda Perez possède-t-elle ?`. Vous devriez voir quelque chose comme ceci :

![Data](../../../../../translated_images/fr/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Terrain de jeu de l’agent

Construisons un peu plus d’intuition sur les capacités de Microsoft Foundry, en testant l’agent dans le terrain de jeu Agents Playground.

1. Revenez à la page `Agents` dans Microsoft Foundry – sélectionnez l’agent par défaut
1. Cliquez sur l’option `Essayer dans Playground` – vous devriez obtenir une interface Playground comme celle-ci
1. Posez la même question : `Quels produits Amanda Perez possède-t-elle ?`

    ![Data](../../../../../translated_images/fr/09-ask-in-playground.a1b93794f78fa676.webp)

Vous obtenez la même réponse (ou une réponse similaire) – mais vous obtenez aussi des informations supplémentaires que vous pouvez utiliser pour comprendre la qualité, le coût et la performance de votre application agentique. Par exemple :

1. Notez que la réponse cite les fichiers de données utilisés pour “étayer” la réponse
1. Survolez l’un de ces fichiers – les données correspondent-elles à votre requête et à la réponse affichée ?

Vous voyez aussi une ligne de _statistiques_ sous la réponse.

1. Survolez une métrique – par ex., Sécurité. Vous voyez quelque chose comme ceci
1. L’évaluation correspond-elle à votre intuition concernant le niveau de sécurité de la réponse ?

      ![Data](../../../../../translated_images/fr/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilité intégrée

L’observabilité consiste à instrumenter votre application pour générer des données qui peuvent être utilisées pour comprendre, déboguer et optimiser son fonctionnement. Pour vous en rendre compte :

1. Cliquez sur le bouton `Afficher les infos d’exécution` – vous devriez voir cette vue. C’est un exemple de [tracing des agents](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) en action. _Vous pouvez aussi accéder à cette vue en cliquant sur Journaux de fils dans le menu principal_.

   - Prenez connaissance des étapes d’exécution et des outils engagés par l’agent
   - Comprenez le nombre total de tokens (vs. l’utilisation des tokens de sortie) pour la réponse
   - Comprenez la latence et où le temps est passé durant l’exécution

      ![Agent](../../../../../translated_images/fr/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Cliquez sur l’onglet `Métadonnées` pour voir des attributs supplémentaires sur l’exécution, qui peuvent fournir un contexte utile pour déboguer plus tard.

      ![Agent](../../../../../translated_images/fr/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Cliquez sur l’onglet `Évaluations` pour voir les auto-évaluations faites sur la réponse de l’agent. Celles-ci incluent des évaluations de sécurité (par ex., Automutilation) et des évaluations spécifiques à l’agent (par ex., Résolution d’intention, Adhérence à la tâche).

      ![Agent](../../../../../translated_images/fr/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Enfin, cliquez sur l’onglet `Surveillance` dans le menu latéral.

      - Sélectionnez l’onglet `Utilisation des ressources` dans la page affichée – et consultez les métriques.
      - Suivez l’utilisation de l’application en termes de coûts (tokens) et charge (requêtes).
      - Suivez la latence de l’application jusqu’au premier octet (traitement d’entrée) et dernier octet (sortie).

      ![Agent](../../../../../translated_images/fr/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variables d'environnement

Jusqu’à présent, nous avons parcouru le déploiement dans le navigateur – et validé que notre infrastructure est provisionnée et l’application opérationnelle. Mais pour travailler avec le code de l’application _en priorité_, nous devons configurer notre environnement de développement local avec les variables pertinentes nécessaires pour travailler avec ces ressources. Utiliser `azd` facilite cela.

1. Le CLI Azure Developer [utilise des variables d'environnement](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) pour stocker et gérer les paramètres de configuration des déploiements d’application.

1. Les variables d’environnement sont stockées dans `.azure/<env-name>/.env` – cela les lie à l’environnement `env-name` utilisé lors du déploiement et vous permet d’isoler les environnements entre différentes cibles de déploiement dans le même dépôt.

1. Les variables d’environnement sont automatiquement chargées par la commande `azd` chaque fois qu’elle exécute une commande spécifique (par ex., `azd up`). Notez que `azd` ne lit pas automatiquement les variables d’environnement au niveau OS (par ex., définies dans le shell) – utilisez plutôt `azd set env` et `azd get env` pour transférer l’information dans les scripts.


Essayons quelques commandes :

1. Obtenez toutes les variables d’environnement définies pour `azd` dans cet environnement :

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Vous voyez quelque chose comme ceci :

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obtenez une valeur spécifique – par ex., je veux savoir si nous avons défini la valeur `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Vous voyez quelque chose comme ceci – elle n’a pas été définie par défaut !

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Définissez une nouvelle variable d’environnement pour `azd`. Ici, nous mettons à jour le nom du modèle de l’agent. _Note : toute modification sera immédiatement reflétée dans le fichier `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Maintenant, nous devrions voir la valeur définie :

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Notez que certaines ressources sont persistantes (par ex., déploiement des modèles) et nécessiteront plus qu’un simple `azd up` pour forcer leur redéploiement. Essayons de supprimer le déploiement initial et de redéployer avec des variables d’environnement modifiées.

1. **Actualisez** Si vous aviez précédemment déployé une infrastructure avec un modèle azd – vous pouvez _actualiser_ l’état de vos variables d’environnement locales d’après l’état actuel de votre déploiement Azure avec cette commande :

      ```bash title="" linenums="0"
      azd env refresh
      ```


      C’est une manière puissante de _synchroniser_ les variables d’environnement entre deux environnements de développement locaux ou plus (par exemple, une équipe avec plusieurs développeurs) - permettant à l’infrastructure déployée de servir de source de vérité pour l’état des variables d’environnement. Les membres de l’équipe n’ont qu’à _rafraîchir_ les variables pour se resynchroniser.

---

## 9. Félicitations 🏆

Vous venez de terminer un flux de travail complet dans lequel vous avez :

- [X] Sélectionné le modèle AZD que vous souhaitez utiliser
- [X] Ouvert le modèle dans un environnement de développement pris en charge
- [X] Déployé le modèle et validé qu’il fonctionne

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->