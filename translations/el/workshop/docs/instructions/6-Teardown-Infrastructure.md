# 6. Κατάργηση Υποδομής

!!! tip "ΜΕ ΤΟ ΤΕΛΟΣ ΑΥΤΟΥ ΤΟΥ ΜΑΘΗΜΑΤΟΣ ΘΑ ΜΠΟΡΕΙΤΕ ΝΑ"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Πρόσθετες Ασκήσεις

Πριν καταργήσουμε το έργο, αφιερώστε λίγα λεπτά για να κάνετε κάποια ανοιχτού τύπου εξερεύνηση.

!!! info "Δοκιμάστε αυτές τις Προτροπές Εξερεύνησης"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Αποδέσμευση Υποδομής

!!! warning "Αν επίσης ολοκληρώσατε την άσκηση με τον υπολογιστή - φορέα GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Η κατάργηση της υποδομής είναι τόσο εύκολη όσο:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Επιβεβαιώστε το επιλεγμένο περιβάλλον και ελέγξτε τους πόρους που θα διαγραφούν. Αυτό αφαιρεί πόρους Azure και μπορεί να καταστρέψει δεδομένα. Κρατήστε την προτροπή επιβεβαίωσης για αυτή τη διαδικασία μάθησης. Μόλις ολοκληρωθεί, θα δείτε έξοδο παρόμοια με:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Επιβεβαιώστε τη διαγραφή στην πύλη και ελέγξτε για πόρους εκτός του πεδίου εφαρμογής της ανάπτυξης. Η αναφορά κόστους και οι ενημερώσεις ποσοστώσεων μπορεί να καθυστερήσουν. Η τοπική ρύθμιση `.azure` παραμένει εκτός αν την αφαιρέσετε ρητά.

1. Το `azd down --purge` ζητά επιπλέον την οριστική διαγραφή των υποστηριζόμενων πόρων που έχουν διαγραφεί προσωρινά. Χρησιμοποιήστε το μόνο όταν η ανάκτηση δεν απαιτείται και κατανοείτε τις πολιτικές διατήρησης/προστασίας εκκαθάρισης. Δεν εγγυάται άμεση απελευθέρωση ποσοστώσεων.

1. Μην επανεγκαταστήσετε μόνο για να επαληθεύσετε τον καθαρισμό. Μια μετέπειτα σκόπιμη `azd up` μπορεί να αναδημιουργήσει πόρους χρησιμοποιώντας τις απομένουσες τοπικές εισόδους και πάλι δημιουργεί χρεώσεις. Οι ενημερώσεις μοντέλου συνήθως χρησιμοποιούν υποστηριζόμενες αλλαγές παροχής, όχι κατάργηση.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->