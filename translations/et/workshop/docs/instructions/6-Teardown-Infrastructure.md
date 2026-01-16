<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-10-11T15:45:45+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "et"
}
-->
# 6. Infrastruktuuri lammutamine

!!! tip "PÄRAST SELLE MOODULI LÄBIMIST SAAD SA"

    - [ ] Üksus
    - [ ] Üksus
    - [ ] Üksus

---

## Lisaharjutused

Enne projekti lammutamist võta paar minutit, et teha avatud uurimistööd.

!!! danger "NITYA-TODO: Koosta mõned prooviküsimused"

---

## Infrastruktuuri eemaldamine

1. Infrastruktuuri lammutamine on sama lihtne kui:

      ```bash title="" linenums="0"
      azd down --purge
      ```
1. `--purge` lipp tagab, et see kustutab ka pehmelt kustutatud Cognitive Service ressursid, vabastades nende ressursside poolt hoitava kvoodi. Kui protsess on lõpule viidud, näed midagi sellist:

      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Valikuline) Kui käivitad nüüd uuesti `azd up`, märkad, et gpt-4.1 mudel juurutatakse, kuna keskkonnamuutuja muudeti (ja salvestati) kohalikus `.azure` kaustas.

      Siin on mudeli juurutused **enne**:

      ![Algne](../../../../../translated_images/et/14-deploy-initial.30e4cf1c29b587bc.png)

      Ja siin on see **pärast**:
      ![Uus](../../../../../translated_images/et/14-deploy-new.f7f3c355a3cf7299.png)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.