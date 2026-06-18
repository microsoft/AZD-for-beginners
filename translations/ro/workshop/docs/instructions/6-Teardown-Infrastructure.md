# 6. Demontarea infrastructurii

!!! tip "LA FINALUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Înțelegi importanța eliberării resurselor și gestionării costurilor
    - [ ] Folosești `azd down` pentru a dezactiva infrastructura în siguranță
    - [ ] Recuperezi serviciile Azure AI șterse soft dacă este nevoie
    - [ ] **Laborator 6:** Curăță resursele Azure și verifică eliminarea acestora

---

## Exerciții bonus

Înainte de a demonta proiectul, petrece câteva minute pentru a face o explorare deschisă.

!!! info "Încearcă aceste întrebări de explorare"

    **Experimentează cu GitHub Copilot:**
    
    1. Întreabă: `Ce alte șabloane AZD aș putea încerca pentru scenarii multi-agent?`
    2. Întreabă: `Cum pot personaliza instrucțiunile pentru agenți în cazul unei aplicații în domeniul sănătății?`
    3. Întreabă: `Ce variabile de mediu controlează optimizarea costurilor?`
    
    **Explorează portalul Azure:**
    
    1. Revizuiește metricile din Application Insights pentru implementarea ta
    2. Verifică analiza costurilor pentru resursele provisionate
    3. Explorează încă o dată agent playground în portalul Microsoft Foundry

---

## Dezactivează infrastructura

1. Demontarea infrastructurii este la fel de simplă ca:

      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Flag-ul `--purge` asigură că va șterge și resursele soft-delete ale Cognitive Service, eliberând astfel cota de resurse ocupată de acestea. Odată terminat vei vedea ceva de genul:

      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opțional) Dacă acum rulezi din nou `azd up`, vei observa că modelul gpt-4.1 este implementat deoarece variabila de mediu a fost schimbată (și salvată) în folderul local `.azure`.

      Iată implementările modelului **înainte**:

      ![Inițial](../../../../../translated_images/ro/14-deploy-initial.30e4cf1c29b587bc.webp)

      Și aici este **după**:
      ![Nou](../../../../../translated_images/ro/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->