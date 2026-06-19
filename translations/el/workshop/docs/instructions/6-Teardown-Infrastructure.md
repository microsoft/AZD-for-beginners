# 6. Κατάργηση υποδομής

!!! tip "ΣΤΟ ΤΕΛΟΣ ΑΥΤΗΣ ΤΗΣ ΕΝΟΤΗΤΑΣ ΘΑ ΜΠΟΡΕΙΤΕ ΝΑ"

    - [ ] Κατανοήσετε τη σημασία του καθαρισμού πόρων και της διαχείρισης κόστους
    - [ ] Χρησιμοποιήσετε `azd down` για να καταργήσετε με ασφάλεια την υποδομή
    - [ ] Ανακτήσετε υπηρεσίες Azure AI που έχουν διαγραφεί προσωρινά αν χρειάζεται
    - [ ] **Εργαστήριο 6:** Καθαρίστε τους πόρους Azure και επαληθεύστε την αφαίρεση

---

## Επιπλέον Ασκήσεις

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "Δοκιμάστε αυτές τις προτροπές εξερεύνησης"

    **Πειραματιστείτε με το GitHub Copilot:**
    
    1. Ρωτήστε: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ρωτήστε: `How can I customize the agent instructions for a healthcare use case?`
    3. Ρωτήστε: `What environment variables control cost optimization?`
    
    **Εξερευνήστε το Azure Portal:**
    
    1. Ελέγξτε τα μετρικά του Application Insights για την ανάπτυξή σας
    2. Ελέγξτε την ανάλυση κόστους για τους παρεχόμενους πόρους
    3. Εξερευνήστε ξανά το agent playground στο Microsoft Foundry portal

---

## Κατάργηση υποδομής

1. Η κατάργηση της υποδομής είναι τόσο απλή όσο:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Η σημαία `--purge` εξασφαλίζει ότι επίσης καθαρίζει υπηρεσίες Cognitive Service που έχουν διαγραφεί προσωρινά, απελευθερώνοντας έτσι το όριο που κατείχαν αυτοί οι πόροι. Μόλις ολοκληρωθεί θα δείτε κάτι σαν αυτό:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Προαιρετικό) Εάν τώρα εκτελέσετε ξανά `azd up`, θα παρατηρήσετε ότι το μοντέλο gpt-4.1 αναπτύσσεται αφού η μεταβλητή περιβάλλοντος άλλαξε (και αποθηκεύτηκε) στον τοπικό φάκελο `.azure`. 

      Εδώ είναι οι αναπτύξεις μοντέλων **πριν**:

      ![Αρχικό](../../../../../translated_images/el/14-deploy-initial.30e4cf1c29b587bc.webp)

      Και εδώ είναι **μετά**:
      ![Νέο](../../../../../translated_images/el/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->