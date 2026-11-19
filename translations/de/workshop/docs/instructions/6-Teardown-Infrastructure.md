# 6. Infrastruktur abbauen

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusübungen

Bevor wir das Projekt abbauen, nehmen Sie sich ein paar Minuten für eine offene Erkundung.

!!! info "Probieren Sie diese Erkundungsanregungen aus"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infrastruktur zurückbauen

!!! warning "Falls Sie auch die GA gehostete Agent-Übung abgeschlossen haben"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Den Abbau der Infrastruktur durchzuführen ist ganz einfach:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bestätigen Sie die ausgewählte Umgebung und überprüfen Sie die zu löschenden Ressourcen. Dies entfernt Azure-Ressourcen und kann Daten zerstören. Behalten Sie die Bestätigungsabfrage für diesen Lernworkflow bei. Nach Abschluss sehen Sie eine Ausgabe ähnlich wie:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Überprüfen Sie die Löschung im Portal und prüfen Sie, ob es Ressourcen außerhalb des Bereitstellungsbereichs gibt. Kostenberichte und Kontingentaktualisierungen können verzögert sein. Die lokale `.azure`-Konfiguration bleibt bestehen, es sei denn, Sie entfernen sie explizit.

1. `azd down --purge` beantragt zusätzlich die dauerhafte Löschung unterstützter softgelöschter Ressourcen. Verwenden Sie dies nur, wenn keine Wiederherstellung erforderlich ist und Sie die Aufbewahrungs-/Löschschutzrichtlinien verstehen. Es garantiert keine sofortige Freigabe des Kontingents.

1. Führen Sie keine erneute Bereitstellung nur zur Überprüfung der Bereinigung durch. Ein späteres absichtliches `azd up` kann Ressourcen mit den verbleibenden lokalen Eingaben neu erstellen und verursacht erneut Kosten. Modellaktualisierungen verwenden normalerweise unterstützte Bereitstellungsänderungen, keinen Abbau.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->