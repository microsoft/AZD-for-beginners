# 1. Sélectionnez un modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ CAPABLE DE"

    - [ ] Décrire ce que sont les modèles AZD
    - [ ] Découvrir et utiliser les modèles AZD pour l'IA
    - [ ] Commencer avec le modèle AI Agents
    - [ ] **Lab 1 :** Démarrage rapide AZD avec GitHub Codespaces

---

## 1. Une analogie avec le constructeur

Construire une application IA moderne et prête pour l'entreprise _à partir de zéro_ peut être intimidant. C'est un peu comme construire votre nouvelle maison vous-même, brique par brique. Oui, c'est possible ! Mais ce n'est pas la manière la plus efficace d'obtenir le résultat final souhaité !

Au lieu de cela, nous commençons souvent avec un _plan de conception_ existant, et travaillons avec un architecte pour le personnaliser selon nos besoins personnels. Et c'est exactement l'approche à adopter pour construire des applications intelligentes. D'abord, trouvez une bonne architecture de conception qui correspond à votre domaine de problème. Ensuite, travaillez avec un architecte solution pour personnaliser et développer la solution pour votre scénario spécifique.

Mais où trouver ces plans de conception ? Et comment trouver un architecte prêt à nous apprendre à personnaliser et déployer ces plans par nous-mêmes ? Dans cet atelier, nous répondons à ces questions en vous présentant trois technologies :

1. [Azure Developer CLI](https://aka.ms/azd) - un outil open-source qui accélère le parcours du développeur allant du développement local (build) au déploiement dans le cloud (ship).
1. [Modèles Microsoft Foundry](https://ai.azure.com/templates) - des dépôts open-source standardisés contenant du code exemple, de l'infrastructure et des fichiers de configuration pour déployer une architecture de solution IA.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - un agent de codage basé sur la connaissance Azure, qui peut nous guider pour naviguer dans le code et effectuer des modifications - en langage naturel.

Avec ces outils en main, nous pouvons maintenant _découvrir_ le bon modèle, le _déployer_ pour valider son fonctionnement, et le _personnaliser_ pour correspondre à nos scénarios spécifiques. Plongeons et apprenons comment cela fonctionne.


---

## 2. Azure Developer CLI

L’[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (ou `azd`) est un outil en ligne de commande open-source qui peut accélérer votre parcours de code vers le cloud avec un ensemble de commandes conviviales pour les développeurs fonctionnant de manière cohérente à travers votre IDE (développement) et vos environnements CI/CD (devops).

Avec `azd`, votre parcours de déploiement peut être aussi simple que :

- `azd init` - Initialise un nouveau projet IA à partir d'un modèle AZD existant.
- `azd up` - Provisionne l’infrastructure et déploie votre application en une étape.
- `azd monitor` - Obtenez une surveillance et un diagnostic en temps réel pour votre application déployée.
- `azd pipeline config` - Configurez des pipelines CI/CD pour automatiser le déploiement vers Azure.

**🎯 | EXERCICE** : <br/> Explorez l’outil en ligne de commande `azd` dans votre environnement GitHub Codespaces dès maintenant. Commencez en tapant cette commande pour voir ce que l’outil peut faire :

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/fr/azd-flow.19ea67c2f81eaa66.webp)

---

## 3. Le modèle AZD

Pour que `azd` réalise cela, il doit connaître l’infrastructure à provisionner, les paramètres de configuration à appliquer, et l’application à déployer. C’est là que les [modèles AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) entrent en jeu.

Les modèles AZD sont des dépôts open-source qui combinent du code exemple avec des fichiers d'infrastructure et de configuration nécessaires au déploiement de l'architecture de la solution.
En utilisant une approche _Infrastructure-as-Code_ (IaC), ils permettent que les définitions des ressources du modèle et les paramètres de configuration soient contrôlés par version (tout comme le code source de l’application) - créant des workflows réutilisables et cohérents entre les utilisateurs de ce projet.

Lorsque vous créez ou réutilisez un modèle AZD pour _votre_ scénario, considérez ces questions :

1. Que construisez-vous ? → Existe-t-il un modèle comprenant un code de départ pour ce scénario ?
1. Comment votre solution est-elle architecturée ? → Y a-t-il un modèle qui comporte les ressources nécessaires ?
1. Comment votre solution est-elle déployée ? → Pensez à `azd deploy` avec des hooks de pré/post-traitement !
1. Comment pouvez-vous l’optimiser davantage ? → Pensez à la surveillance intégrée et aux pipelines d’automatisation !

**🎯 | EXERCICE** : <br/> 
Visitez la galerie [Awesome AZD](https://azure.github.io/awesome-azd/) et utilisez les filtres pour explorer les plus de 250 modèles disponibles actuellement. Voyez si vous pouvez en trouver un qui corresponde à _vos_ exigences scénaristiques.

![Code](../../../../../translated_images/fr/azd-code-to-cloud.2d9503d69d3400da.webp)

---

## 4. Modèles d’applications IA

Pour les applications à base d’IA, Microsoft fournit des modèles spécialisés intégrant **Microsoft Foundry** et **Foundry Agents**. Ces modèles accélèrent votre parcours pour construire des applications intelligentes prêtes pour la production.

### Modèles Microsoft Foundry & Foundry Agents

Sélectionnez un modèle ci-dessous pour le déployer. Chaque modèle est disponible sur [Awesome AZD](https://azure.github.io/awesome-azd/) et peut être initialisé avec une seule commande.

| Modèle | Description | Commande de déploiement |
|----------|-------------|----------------|
| **[AI Chat with RAG](https://azure.github.io/awesome-azd/?tags=ai&tags=rag)** | Application de chat avec génération augmentée par récupération utilisant Microsoft Foundry | `azd init -t azure-samples/azure-search-openai-demo` |
| **[Foundry Agent Service Starter](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Créez des agents IA avec Foundry Agents pour l’exécution autonome de tâches | `azd init -t azure-samples/foundry-agent-service-starter` |
| **[Multi-Agent Orchestration](https://azure.github.io/awesome-azd/?tags=ai&tags=agents)** | Coordonnez plusieurs Foundry Agents pour des workflows complexes | `azd init -t azure-samples/multi-agent-orchestration` |
| **[AI Document Intelligence](https://azure.github.io/awesome-azd/?tags=ai&tags=document)** | Extraire et analyser des documents avec les modèles Microsoft Foundry | `azd init -t azure-samples/ai-document-processing` |
| **[Conversational AI Bot](https://azure.github.io/awesome-azd/?tags=ai&tags=bot)** | Construisez des chatbots intelligents avec intégration Microsoft Foundry | `azd init -t azure-samples/ai-chat-protocol` |
| **[AI Image Generation](https://azure.github.io/awesome-azd/?tags=ai&tags=dalle)** | Générer des images avec DALL-E via Microsoft Foundry | `azd init -t azure-samples/ai-image-generation` |
| **[Semantic Kernel Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=semantic-kernel)** | Agents IA utilisant Semantic Kernel avec Foundry Agents | `azd init -t azure-samples/semantic-kernel-agent` |
| **[AutoGen Multi-Agent](https://azure.github.io/awesome-azd/?tags=ai&tags=autogen)** | Systèmes multi-agents utilisant le framework AutoGen | `azd init -t azure-samples/autogen-multi-agent` |

### Démarrage rapide

1. **Parcourez les modèles** : Visitez [https://azure.github.io/awesome-azd/](https://azure.github.io/awesome-azd/) et filtrez par `AI`, `Agents`, ou `Microsoft Foundry`
2. **Sélectionnez votre modèle** : Choisissez-en un qui correspond à votre cas d’utilisation
3. **Initialisez** : Exécutez la commande `azd init` pour le modèle choisi
4. **Déployez** : Lancez `azd up` pour provisionner et déployer

**🎯 | EXERCICE** : <br/>
Sélectionnez un des modèles ci-dessus en fonction de votre scénario :

- **Construire un chatbot ?** → Commencez avec **AI Chat with RAG** ou **Conversational AI Bot**
- **Besoin d’agents autonomes ?** → Essayez **Foundry Agent Service Starter** ou **Multi-Agent Orchestration**
- **Traitement de documents ?** → Utilisez **AI Document Intelligence**
- **Vous voulez une assistance au codage IA ?** → Explorez **Semantic Kernel Agent** ou **AutoGen Multi-Agent**

```bash title="Example: Deploy the AI Chat with RAG template" linenums="0"
azd init -t azure-samples/azure-search-openai-demo
azd up
```

!!! info "Explorez plus de modèles"
    La galerie [Awesome AZD](https://azure.github.io/awesome-azd/) contient plus de 250 modèles. Utilisez les filtres pour trouver des modèles correspondant à vos exigences spécifiques de langue, framework, et services Azure.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour les informations cruciales, une traduction professionnelle réalisée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->