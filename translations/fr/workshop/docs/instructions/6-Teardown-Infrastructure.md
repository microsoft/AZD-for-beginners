<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T09:10:36+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "fr"
}
-->
# 6. Démantèlement de l'infrastructure

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ EN MESURE DE"

    - [ ] Élément
    - [ ] Élément
    - [ ] Élément

---

## Exercices Bonus

Avant de démanteler le projet, prenez quelques minutes pour explorer librement.

!!! danger "NITYA-TODO : Proposer quelques idées à essayer"

---

## Déprovisionner l'infrastructure

1. Démanteler l'infrastructure est aussi simple que :
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Le flag `--purge` garantit également la suppression des ressources de Cognitive Service qui ont été supprimées de manière douce, libérant ainsi les quotas détenus par ces ressources. Une fois terminé, vous verrez quelque chose comme ceci :
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Optionnel) Si vous exécutez maintenant `azd up` à nouveau, vous remarquerez que le modèle gpt-4.1 est déployé puisque la variable d'environnement a été modifiée (et enregistrée) dans le dossier local `.azure`.

      Voici les déploiements de modèles **avant** :

      ![Initial](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc86efd11a0dd0b6ee6bec92ae4425860272179121951bd917.fr.png)

      Et voici **après** :
      ![New](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299572bca5941cfeec14090237cd3d20310e347f27564089379.fr.png)

---

