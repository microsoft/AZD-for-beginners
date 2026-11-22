# 5. Personnaliser un modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SAUREZ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Établir une base de référence

Utilisez le dépôt [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) initialisé dans les modules précédents. Enregistrez la révision du modèle, la version d'AZD, l'environnement sélectionné, le déploiement du modèle et les questions d'exemple fonctionnelles avant de modifier quoi que ce soit.

L'exemple met en œuvre une application de chat assistée par agent. Il ne devient **pas** un système de détail à deux agents simplement en définissant des variables d'environnement ou en enregistrant des fichiers d'instruction supplémentaires. Des agents supplémentaires, des gestionnaires d'outils, du routage, de l'autorisation, et l'accès aux données requièrent du code applicatif.

Inspectez les instructions et outils de l'agent actuellement déployé dans Foundry. Testez une question factuelle, une question de récupération et une question à laquelle les données d'exemple ne peuvent répondre. Vérifiez les citations par rapport aux documents sources réels au lieu de supposer qu’une réponse fluide est correcte.

## 5.2 Personnaliser la récupération des connaissances

Le modèle prend en charge la récupération basée sur les fichiers et une intégration optionnelle à Azure AI Search. Suivez le [guide actuel d’AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) pour l’indexation et la configuration des outils.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Activer le service n’est qu’une partie de la récupération. Avant de téléverser vos propres données :

1. Confirmez que vous avez la permission d’utiliser les documents et retirez les informations sensibles.
2. Sélectionnez un modèle d’encastrement pris en charge dans votre région et définissez sa version compatible, le type de déploiement, et les dimensions vectorielles.
3. Créez/peuplez l’index en suivant le processus documenté dans l’exemple.
4. Configurez l’outil de récupération de l’agent pour utiliser cet index.
5. Testez la récupération, les citations, l’autorisation, et le comportement lorsqu’aucun document pertinent n’existe.

Ne passez pas de `text-embedding-3-small` à un modèle d’encastrement différent sans vérifier les dimensions et sans reconstruire/réindexer les vecteurs au besoin. Un nom tel que `retail-products` n’est pas un catalogue implémenté ni une politique de contrôle d’accès.

## 5.3 Suivi et surveillance

Suivez le [guide d’observabilité de l’exemple](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Assurez-vous que la ressource Application Insights requise et la connexion existent déjà ; si vous modifiez les paramètres d’infrastructure, utilisez `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Envoyez une requête de test, puis inspectez les journaux applicatifs du Container App et la vue de traçage de l'agent dans Foundry. Vérifiez la latence, les appels d’outils, les erreurs, et la corrélation entre la requête et la trace. Ne supposez pas que la télémétrie est connectée uniquement parce que le déploiement a réussi.

Laissez `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` désactivé sauf si vous avez explicitement examiné le consentement, la rédaction, la conservation et les contrôles d’accès. Les tracés peuvent contenir des arguments d’outils sensibles ou le contenu de documents même lorsque les journaux d’application ordinaires paraissent inoffensifs.

## 5.4 Évaluation de l’agent

Le point d’entrée pour l’évaluation de l’exemple est désormais [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), pas un répertoire `evals/`. Depuis la racine de l’exemple, utilisez un environnement Python qui satisfait aux exigences documentées :

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Avant de lancer, complétez les [pré-requis d’évaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Les tests chargent la configuration depuis l’`.azure/<environment>/.env` sélectionné ; confirmez que l’environnement souhaité est sélectionné. Les entrées importantes comprennent :

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, utilisant le format requis par l’exemple actuel (la version revue utilise `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, utilisé comme déploiement du modèle juge

Inspectez les tests pour comprendre le choix de l’évaluateur, les seuils, les rôles requis et les coûts des modèles. Une exécution complétée n’est pas automatiquement un seuil de qualité dépassé ; inspectez les scores, cas échoués/avec erreurs, et les résultats liés dans Foundry.

### Extension d’évaluations AZD distincte

Le test Python ci-dessus est un **flux de travail spécifique à l’exemple**. L’extension optionnelle `azure.ai.evaluations` est un flux de travail différent, avec sa propre configuration `evals/azure.eval.yaml`. Elle s’installe séparément, elle n’est pas incluse dans le bundle `microsoft.foundry` 1.0 généralement disponible :

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pour une configuration complète de l’extension, voir [flux d’évaluations et migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Depuis agents extension beta.22, n’utilisez pas les commandes supprimées `azd ai agent eval`. L’installation de l’extension d’évaluations ne convertit pas les tests Python de l’exemple ni ne crée automatiquement une configuration d’évaluation.

Pour un **exercice hébergé GA séparé**, utilisez un dossier vide hors de l’exemple de cet atelier et suivez le [tutoriel Foundry local-to-cloud](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Il utilise AZD 1.37.0+, le bundle `microsoft.foundry`, Python 3.13+, et uv actuel. Vous inspecterez `azure.yaml`, testerez localement avec Agent Inspector, déploierez la source pour une build Foundry distante, et générerez/réviserez un ensemble de données et une grille d’évaluation avant de configurer `azd ai eval init --name quality`. Ne remplacez pas les tests de cet exemple ni ne supposez qu’installer le bundle change son modèle d’hébergement.

## 5.5 Red teaming IA et évaluation continue

L’exemple actuel fournit [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Complétez ses prérequis et révisez la cible prévue et les coûts avant de lancer :

```bash
pytest tests/test_red_teaming.py -s
```

Utilisez un déploiement de test autorisé et des données synthétiques. Passez en revue les attaques générées et les résultats ; cette analyse ne garantit pas qu’une application est sécurisée ou conforme.

Le [guide d’observabilité](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) décrit aussi l’évaluation continue configurée au démarrage du conteneur. Elle évalue les interactions des utilisateurs réels, pas le trafic de test généré, et le support des évaluateurs varie selon la région. Pas d’interactions signifie pas d’entrées d’évaluation. Vérifiez la version installée de l’exemple et la configuration de l’évaluateur au lieu de supposer que chaque déploiement utilise les mêmes paramètres par défaut.

L’authentification est distincte de l’évaluation. Suivez la configuration d’identité/access documentée de l’exemple. Il n’existe pas de « repli basic auth » documenté pour protéger un point d’accès public.

## 5.6 Exercice de conception : personnalisation du commerce de détail

!!! warning "Exercice de conception, pas un déploiement complet"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Rédigez un court plan abordant :

| Domaine | Décision et preuves à collecter |
|------|----------------------------------|
| Responsabilités de l’agent | Commencer avec un agent, ou justifier des agents Shopper et Loyalty séparés ainsi que la logique de routage |
| Données | Définir un catalogue/récompenses synthétique et la propriété des mises à jour |
| Outils | Implémenter d’abord les gestionnaires en lecture seule ; spécifier l’autorisation et la validation pour toute écriture |
| Modèles | Choisir les combinaisons modèle/version/SKU disponibles et vérifier le quota ; éviter de provisionner des modèles inutilisés |
| Récupération | Définir l’indexation, les dimensions d’encastrement, les citations, et les contrôles d’accès au niveau des documents |
| Évaluation | Ajouter des cas de réponses attendues, questions non prises en charge, usage d’outils et de sécurité avec seuils explicites |
| Opérations | Définir la télémétrie, les budgets de latence/erreur, les limites de coûts, et la responsabilité du nettoyage |

Enregistrer `custom-agents/shopper-agent-instructions.md` ne fait pas que l’exemple le charge. Trouvez le code applicatif qui crée/met à jour l’agent, connectez vos instructions revues là, et vérifiez la version d’agent résultante avant de tester. Les instructions ne peuvent pas accorder l’accès à des données ou outils que vous n’avez pas mis en œuvre.

Appliquez un changement à la fois, redéployez les composants affectés, et relancez vos questions et évaluations de référence. Gardez une révision fonctionnelle pour comparaison. Pour l’inspiration architecturale, consultez le [schéma directeur commerce de détail](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), qui n’est lui non plus pas une application complète.

!!! quote "À LA FIN DE CE LABORATOIRE, VOUS DEVRIEZ AVOIR"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continuez vers [Démanteler l’infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->