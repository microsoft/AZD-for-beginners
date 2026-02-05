# 6. Infrastruktūros išardymas

!!! tipas "BAIGĘ ŠĮ MODULĮ GALĖSITE"

    - [ ] Punktas
    - [ ] Punktas
    - [ ] Punktas

---

## Papildomos užduotys

Prieš išardant projektą, skirkite kelias minutes laisvai tyrinėjimui.

!!! pavojus "NITYA-TODO: Pateikti keletą pasiūlymų, ką išbandyti"

---

## Infrastruktūros išardymas

1. Infrastruktūros išardymas yra toks paprastas kaip:

      ```bash title="" linenums="0"
      azd down --purge
      ```
1. `--purge` vėliava užtikrina, kad taip pat bus ištrinti minkštai ištrinti Cognitive Service resursai, taip atlaisvinant šių resursų užimtą kvotą. Kai procesas bus baigtas, pamatysite kažką panašaus į tai:

      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Pasirinktinai) Jei dabar vėl paleisite `azd up`, pastebėsite, kad gpt-4.1 modelis bus įdiegtas, nes aplinkos kintamasis buvo pakeistas (ir išsaugotas) vietiniame `.azure` aplanke.

      Štai modelio diegimai **prieš**:

      ![Pradinis](../../../../../translated_images/lt/14-deploy-initial.30e4cf1c29b587bc.webp)

      Ir štai jie **po**:
      ![Naujas](../../../../../translated_images/lt/14-deploy-new.f7f3c355a3cf7299.webp)

---

