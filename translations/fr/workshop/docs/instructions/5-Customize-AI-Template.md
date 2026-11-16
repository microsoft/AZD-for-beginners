# 5. Personnaliser un modèle

!!! tip "À LA FIN DE CE MODULE, VOUS SAUREZ"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Établir une base de référence

Utilisez le dépôt [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) initialisé dans les modules précédents. Enregistrez la révision du modèle, la version d’AZD, l’environnement sélectionné, le déploiement du modèle et les questions d’échantillon fonctionnelles avant de modifier quoi que ce soit.

L’échantillon implémente une application de chat assistée par agent. Elle ne devient **pas** un système commercial à deux agents simplement en définissant des variables d’environnement ou en enregistrant des fichiers d’instruction supplémentaires. Les agents supplémentaires, gestionnaires d’outils, le routage, l’autorisation et l’accès aux données nécessitent du code applicatif.

Inspectez les instructions et outils de l’agent déployé dans Foundry. Testez une question factuelle, une question de récupération et une question à laquelle les données d’échantillon ne peuvent pas répondre. Vérifiez les citations par rapport aux documents sources réels plutôt que de supposer qu’une réponse fluide est correcte.

## 5.2 Personnaliser la récupération des connaissances

Le modèle prend en charge la récupération basée sur fichier et l’intégration optionnelle d’Azure AI Search. Suivez le [guide actuel d’AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) pour l’indexation et la configuration des outils.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Activer le service n’est qu’une partie de la récupération. Avant de télécharger vos propres données :

1. Confirmez que vous avez la permission d’utiliser les documents et supprimez les informations sensibles.
2. Sélectionnez un modèle d’intégration pris en charge dans votre région et définissez sa version compatible, son type de déploiement et les dimensions des vecteurs.
3. Créez/peuplez l’index en utilisant le processus documenté de l’échantillon.
4. Configurez l’outil de récupération de l’agent pour utiliser cet index.
5. Testez la récupération, les citations, l’autorisation et le comportement lorsqu’aucun document pertinent n’existe.

Ne passez pas de `text-embedding-3-small` à un modèle d’intégration différent sans vérifier les dimensions et reconstruire/réindexer les vecteurs si nécessaire. Un nom comme `retail-products` n’est pas un catalogue implémenté ni une politique de contrôle d’accès.

## 5.3 Traçage et surveillance

Suivez le [guide d’observabilité de l’échantillon](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Assurez-vous que la ressource Application Insights requise et la connexion existent déjà ; si vous modifiez les paramètres d’infrastructure, utilisez `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Envoyez une requête de test, puis inspectez les journaux d’application du Container App et la vue de traçage de l’agent dans Foundry. Vérifiez la latence, les appels d’outils, les erreurs et la corrélation entre la requête et le tracé. Ne supposez pas que la télémétrie est connectée uniquement parce que le déploiement a réussi.

Laissez `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` désactivé sauf si vous avez explicitement examiné le consentement, la rédaction, la conservation et les contrôles d’accès. Les traces peuvent contenir des arguments d’outil sensibles ou du contenu documentaire même lorsque les journaux d’application classiques semblent anodins.

## 5.4 Évaluation de l’agent

Le point d’entrée d’évaluation de l’échantillon est maintenant [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), pas un répertoire `evals/`. Depuis la racine de l’échantillon, utilisez un environnement Python qui respecte ses exigences documentées :

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Avant d’exécuter, complétez les [prérequis d’évaluation](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Les tests chargent la configuration depuis le `.azure/<environment>/.env` sélectionné ; confirmez que l’environnement prévu est choisi. Les entrées importantes incluent :

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, en utilisant le format requis par l’échantillon actuel (la version revue utilise `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, utilisé comme déploiement du modèle juge

Inspectez les tests pour comprendre le choix de l’évaluateur, les seuils, les rôles requis et les coûts de modèle. Une exécution terminée n’est pas automatiquement une réussite au contrôle qualité ; inspectez les scores, les cas échoués/erronés, et les résultats liés dans Foundry.

### Extension d’évaluations AZD séparée

Le test Python ci-dessus est un **flux de travail spécifique à l’échantillon**. L’extension `azure.ai.evaluations` optionnelle est un flux de travail différent, avec sa propre configuration `evals/azure.eval.yaml` :

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Pour une installation complète de l’extension, voir [flux d’évaluation et migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Depuis l’extension agents beta.22, n’utilisez pas les commandes `azd ai agent eval` supprimées. Installer l’extension d’évaluations ne convertit pas les tests Python de l’échantillon ni ne crée automatiquement une configuration d’évaluation.

## 5.5 Red teaming IA et évaluation continue

L’échantillon actuel fournit [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Complétez ses prérequis et examinez la cible prévue et les coûts avant d’exécuter :

```bash
pytest tests/test_red_teaming.py -s
```

Utilisez un déploiement de test autorisé et des données synthétiques. Examinez les attaques générées et les résultats ; ce scan n’établit pas qu’une application est sécurisée ou conforme.

Le [guide d’observabilité](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) décrit aussi l’évaluation continue configurée au démarrage du conteneur. Elle évalue les interactions utilisateur réelles, pas le trafic de test généré, et le support de l’évaluateur varie selon la région. Pas d’interactions signifie pas d’entrées d’évaluation. Vérifiez la version installée de l’échantillon et la configuration de l’évaluateur au lieu de supposer que chaque déploiement a les mêmes paramètres par défaut.

L’authentification est séparée de l’évaluation. Suivez la configuration d’identité/accès documentée dans l’échantillon. Il n’existe pas de « repli basic auth » documenté sur lequel s’appuyer pour protéger un point de terminaison public.

## 5.6 Exercice de conception : personnalisation retail

!!! warning "Exercice de conception, pas un déploiement terminé"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Rédigez un plan court abordant :

| Domaine | Décision et preuves à collecter |
|------|----------------------------------|
| Responsabilités de l’agent | Commencer avec un agent unique, ou justifier des agents Shopper et Loyalty séparés et la logique de routage |
| Données | Définir un catalogue/dataset de récompenses synthétique et la propriété des mises à jour |
| Outils | Implémenter d’abord des gestionnaires en lecture seule ; spécifiez autorisation et validation pour toute écriture |
| Modèles | Choisir des combinaisons modèle/version/SKU disponibles et vérifier le quota ; éviter de provisionner des modèles inutilisés |
| Récupération | Définir l’indexation, les dimensions de l’intégration, les citations et les contrôles d’accès au niveau du document |
| Évaluation | Ajouter des cas réponse attendue, question non supportée, usage d’outil et sécurité avec seuils explicites |
| Opérations | Définir télémétrie, budgets de latence/erreur, limites de coût et responsabilité du nettoyage |

Sauvegarder `custom-agents/shopper-agent-instructions.md` ne fait pas charger l’échantillon. Trouvez le code applicatif qui crée/met à jour l’agent, connectez-y vos instructions revues et vérifiez la version d’agent résultante avant de tester. Les instructions ne peuvent pas accorder l’accès à des données ou outils que vous n’avez pas implémentés.

Appliquez un changement à la fois, redéployez les composants affectés, puis relancez vos questions de référence et évaluations. Conservez une révision fonctionnelle pour comparaison. Pour une inspiration d’architecture, voir le [plan détaillé retail](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), qui n’est pas non plus une application retail complète.

!!! quote "À LA FIN DE CE LABORATOIRE, VOUS DEVRIEZ AVOIR"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continuez vers [Démantèlement de l’infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->