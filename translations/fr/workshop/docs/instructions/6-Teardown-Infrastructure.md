# 6. Démantèlement de l'Infrastructure

!!! tip "À LA FIN DE CE MODULE, VOUS SEREZ CAPABLE DE"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Exercices Bonus

Avant de démanteler le projet, prenez quelques minutes pour une exploration ouverte.

!!! info "Essayez ces incitations à l'exploration"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Suppression de l'infrastructure

!!! warning "Si vous avez également terminé l'exercice avec l'agent hébergé GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Le démantèlement de l'infrastructure est aussi simple que :
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirmez l'environnement sélectionné et examinez les ressources à supprimer. Cela supprime les ressources Azure et peut détruire des données. Conservez l'invite de confirmation pour ce flux d'apprentissage. Une fois terminé, vous verrez une sortie similaire à :
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Vérifiez la suppression dans le portail et vérifiez les ressources en dehors du périmètre du déploiement. Les rapports de coûts et les mises à jour de quota peuvent être retardés. La configuration locale `.azure` reste à moins que vous ne la supprimiez explicitement.

1. `azd down --purge` demande en plus la suppression permanente des ressources prises en charge en suppression douce. Utilisez-le uniquement lorsque la récupération n'est pas nécessaire et que vous comprenez les politiques de rétention/protection contre la purge. Cela ne garantit pas la libération immédiate du quota.

1. Ne redéployez pas juste pour vérifier le nettoyage. Un `azd up` ultérieur intentionnel peut recréer des ressources en utilisant les entrées locales restantes et entraîner à nouveau des frais. Les mises à jour du modèle utilisent normalement des modifications de provisionnement prises en charge, pas un démantèlement.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->