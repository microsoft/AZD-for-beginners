# 6. Infrastruktur abbauen

!!! tip "AM ENDE DIESES MODULS WIRST DU IN DER LAGE SEIN"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Bonusübungen

Bevor wir das Projekt abbauen, nimm dir ein paar Minuten für eine offene Erkundung.

!!! info "Probiere diese Erkundungsanregungen aus"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Infrastruktur deprovisionieren

1. Das Abbauen der Infrastruktur ist ganz einfach:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Bestätige die ausgewählte Umgebung und überprüfe die zu löschenden Ressourcen. Dies entfernt Azure-Ressourcen und kann Daten zerstören. Behalte die Bestätigungsabfrage für diesen Lernablauf bei. Nach Abschluss siehst du eine Ausgabe ähnlich wie:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Überprüfe die Löschung im Portal und prüfe Ressourcen außerhalb des Bereitstellungsbereichs. Kostenberichte und Kontingentaktualisierungen können verzögert sein. Die lokale `.azure` Konfiguration bleibt bestehen, es sei denn, du entfernst sie ausdrücklich.

1. `azd down --purge` fordert zusätzlich die dauerhafte Löschung unterstützter soft-gelöschter Ressourcen an. Verwende es nur, wenn keine Wiederherstellung erforderlich ist und du die Aufbewahrungs-/Löschschutzrichtlinien verstehst. Es garantiert keine sofortige Freigabe des Kontingents.

1. Führe keine erneute Bereitstellung nur zur Überprüfung der Bereinigung durch. Eine spätere gezielte `azd up` kann Ressourcen mit den verbleibenden lokalen Eingaben erneut erstellen und verursacht erneut Kosten. Modellupdates verwenden normalerweise unterstützte Bereitstellungsänderungen, keinen Abbau.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->