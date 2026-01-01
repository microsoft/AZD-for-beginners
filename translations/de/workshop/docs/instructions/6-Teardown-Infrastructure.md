<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T10:54:59+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "de"
}
-->
# 6. Infrastruktur abbauen

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Punkt
    - [ ] Punkt
    - [ ] Punkt

---

## Bonus-Übungen

Bevor wir das Projekt abbauen, nehmen Sie sich ein paar Minuten Zeit für eine offene Erkundung.

!!! danger "NITYA-TODO: Einige Vorschläge für Erkundungen ausarbeiten"

---

## Infrastruktur deprovisionieren

1. Das Abbauen der Infrastruktur ist so einfach wie:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Der `--purge`-Flag stellt sicher, dass auch soft-gelöschte Cognitive Service-Ressourcen bereinigt werden, wodurch die von diesen Ressourcen gehaltenen Quoten freigegeben werden. Nach Abschluss sehen Sie etwas wie das:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Optional) Wenn Sie jetzt erneut `azd up` ausführen, werden Sie feststellen, dass das gpt-4.1-Modell bereitgestellt wird, da die Umgebungsvariable geändert (und gespeichert) wurde im lokalen `.azure`-Ordner. 

      Hier sind die Modellbereitstellungen **vorher**:

      ![Initial](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc.de.png)

      Und hier sind sie **nachher**:
      ![Neu](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299.de.png)

---

